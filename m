Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A1C4038E
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 14:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7A210EACE;
	Fri,  7 Nov 2025 13:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="trWAvWOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B72F10EACE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 13:57:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3CEFD446BA;
 Fri,  7 Nov 2025 13:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81A4C4CEF8;
 Fri,  7 Nov 2025 13:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762523845;
 bh=Z8U/akBsldXiiAXmfTRDia6T57dNa1mxa22yotGMNtI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=trWAvWOR9eqC8BxkMy6CDLWzGBj9gNBPrMD7XJW4DAu65A0bEzxzvNY3EDq5j8Slc
 PZ5pg6Nfr11YJHQCZ+JyMWzIBMQs1kYHApIl+vkSCyIF6PHTJPcQY4lwLx8T91eBpI
 oDElKg2AylMW4SeZoCAvcgiKAVNFL7S1g0575a71DMsVaP0J+KhGcg8cmahb2WUbgS
 DsMWTd8lPy2KzJalhXpaf8IO9ncfkHQZYiVC6XGULKyLGeyL+IH9LhnQ6fkKX832Jt
 pQ3HwVqztpAVOUlqbw9zganTTSxsQRpk+WC8RwtKGBpji1yYlZnXhBfqBpuKZ4xC+m
 43YAwYv1ungnQ==
From: Philipp Stanner <phasta@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 2/2] drm/todo: Add entry for unlocked drm/sched rq readers
Date: Fri,  7 Nov 2025 14:57:01 +0100
Message-ID: <20251107135701.244659-4-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107135701.244659-2-phasta@kernel.org>
References: <20251107135701.244659-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Runqueues are currently almost everywhere being read unlocked in
drm/sched. At XDC 2025, the assembled developers were unsure whether
that's legal and whether it can be fixed. Someone should find out.

Add a todo entry for the unlocked runqueue reader problem.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 Documentation/gpu/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 084e148e78c1..fc8bafd593d8 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -909,6 +909,20 @@ Contact: Christian König <ckoenig.leichtzumerken@gmail.com>
 
 Level: Advanced
 
+Add locking for runqueues
+-------------------------
+
+There is an old FIXME by Sima in include/drm/gpu_scheduler.h. It details that
+struct drm_sched_rq is read at many places without any locks, not even with a
+READ_ONCE. At XDC 2025 no one could really tell why that is the case, whether
+locks are needed and whether they could be added. (But for real, that should
+probably be locked!). Check whether it's possible to add locks everywhere, and
+do so if yes.
+
+Contact: Philipp Stanner <phasta@kernel.org>
+
+Level: Intermediate
+
 Outside DRM
 ===========
 
-- 
2.49.0

