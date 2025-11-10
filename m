Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD580C45592
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 09:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1FF10E144;
	Mon, 10 Nov 2025 08:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OyJc7oSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC5810E144
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 08:20:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E3DFC601A6;
 Mon, 10 Nov 2025 08:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CF0C16AAE;
 Mon, 10 Nov 2025 08:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762762830;
 bh=eGXt6P/y0wwvJIZIqWpY30+BNIH6CXI8dwctYt3EQno=;
 h=From:To:Cc:Subject:Date:From;
 b=OyJc7oSB+5H0S5vs3/U6LPnDEPYX6kVhICQeFbATNZB4pKnWiLEC5C42o3z+VaOeg
 GLjxN9GLgZgS9h3BvAcdJ8IXupU1I9G1LUeWAteAbRkzTD1oydRMRGmuArz/CoZf0B
 2nP2EAM1XpKHhn6esIU7OjQyclLfj3o3H143gF7kL7EKTrfuMGJt1JZj+odtEnwHN9
 H0O4/9c5ja+8vGA2Zb2A5/2Vwn4nT3Bl6sPH9VLm92NYFDiI7aLRyC/RshQNF1Cfmy
 otTTGvASIKJR1lY9PEwvUcpenYWE6dw8Waim9A472ZGR02taaoH28oV9Giovw+vY6l
 fJ2IeoAt6NmLQ==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] drm/sched: Fix UB in spsc_queue
Date: Mon, 10 Nov 2025 09:19:04 +0100
Message-ID: <20251110081903.11539-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The spsc_queue is an unlocked, highly asynchronous piece of
infrastructure. Its inline function spsc_queue_peek() obtains the head
entry of the queue.

This access is performed without READ_ONCE() and is, therefore,
undefined behavior. In order to prevent the compiler from ever
reordering that access, or even optimizing it away, a READ_ONCE() is
strictly necessary. This is easily proven by the fact that
spsc_queue_pop() uses this very pattern to access the head.

Add READ_ONCE() to spsc_queue_peek().

Cc: stable@vger.kernel.org # v4.16+
Fixes: 27105db6c63a ("drm/amdgpu: Add SPSC queue to scheduler.")
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
I think this makes it less broken, but I'm not even sure if it's enough
or more memory barriers or an rcu_dereference() would be correct. The
spsc_queue is, of course, not documented and the existing barrier
comments are either false or not telling.

If someone has an idea, shoot us the info. Otherwise I think this is the
right thing to do for now.

P.
---
 include/drm/spsc_queue.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/spsc_queue.h b/include/drm/spsc_queue.h
index ee9df8cc67b7..39bada748ffc 100644
--- a/include/drm/spsc_queue.h
+++ b/include/drm/spsc_queue.h
@@ -54,7 +54,7 @@ static inline void spsc_queue_init(struct spsc_queue *queue)
 
 static inline struct spsc_node *spsc_queue_peek(struct spsc_queue *queue)
 {
-	return queue->head;
+	return READ_ONCE(queue->head);
 }
 
 static inline int spsc_queue_count(struct spsc_queue *queue)
-- 
2.49.0

