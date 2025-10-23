Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20EC01C5C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73BF10E909;
	Thu, 23 Oct 2025 14:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hcQIrwxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2326D10E90A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:30:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F25BF4AEDD;
 Thu, 23 Oct 2025 14:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C273C4CEF7;
 Thu, 23 Oct 2025 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761229847;
 bh=lRRm98sjHaVsvhoTag39RzQU6GJrENsxxPSr2a2wy8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hcQIrwxtBlYYrXZf3XUxjvVdQdMgos2eH0AI+i52u4J5Lc9drlw1/M/N5EFNIckEu
 CVfKOeQgIfvCNx3KK+L4fdwqZlMQNTCWM3c3pPoUk9vPgvroVwz91kH7kLRdvJbAS3
 ptr2DoR3CqFoWgTTgroKBzqt2rTsd2QOyDWxrccVjPe9iRHSxxwfPJtbfWEqwy/Ouy
 RLGbf3buKk4oKus8R0brAGh9sec+F6ShfsbDjKjXwYBSIIkiRRfJsA4Wpcyo7tMV16
 BoFzWAm3duA3IWR8/mmhs6toB++A937UsZYTtSwwsdAU1XB3YPm0tNe60+8TDbq3Kz
 F5Vd/WB9OvGuQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v2 3/4] drm/sched: Add TODO entry for resubmitting jobs
Date: Thu, 23 Oct 2025 16:30:30 +0200
Message-ID: <20251023143031.149496-5-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023143031.149496-2-phasta@kernel.org>
References: <20251023143031.149496-2-phasta@kernel.org>
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

Add the issue of a successor of drm_sched_resubmit_jobs() missing to the
TODO file.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/TODO | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/TODO b/drivers/gpu/drm/scheduler/TODO
index 79044adb7d01..713dd62c58da 100644
--- a/drivers/gpu/drm/scheduler/TODO
+++ b/drivers/gpu/drm/scheduler/TODO
@@ -10,3 +10,29 @@
   - Tasks:
 	1. Read the example entry.
 	2. Remove the entry once solved (never in this case)
+
+* GPU job resubmits
+  - Difficulty: hard
+  - Contact:
+    - Christian König <ckoenig.leichtzumerken@gmail.com>
+    - Philipp Stanner <phasta@kernel.org>
+  - Description:
+    drm_sched_resubmit_jobs() is deprecated. Main reason being that it leads to
+    reinitializing dma_fences. See that function's docu for details. The better
+    approach for valid resubmissions by amdgpu and Xe is (apparently) to figure
+    out which job (and, through association: which entity) caused the hang. Then,
+    the job's buffer data, together with all other jobs' buffer data currently
+    in the same hardware ring, must be invalidated. This can for example be done
+    by overwriting it.
+    amdgpu currently determines which jobs are in the ring and need to be
+    overwritten by keeping copies of the job. Xe obtains that information by
+    directly accessing drm_sched's pending_list.
+  - Tasks:
+	1. implement scheduler functionality through which
+	   the driver can obtain the information which *broken* jobs are currently in
+	   the hardware ring.
+	2. Such infrastructure would then typically be used in
+	   drm_sched_backend_ops.timedout_job(). Document that.
+	3. Port a driver as first user.
+	3. Document the new alternative in the docu of deprecated
+	   drm_sched_resubmit_jobs().
-- 
2.49.0

