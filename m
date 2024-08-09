Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4996194D346
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 17:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A732810E950;
	Fri,  9 Aug 2024 15:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a9cddfyh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A86210E950
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ItymH/I5P7ce3MCBAKkv1A7hyRGEoLTfwMtGwIHyXc=; b=a9cddfyh8w5ieiINH9p7g3sAAa
 jwhcKnAJH9deJl3uGSbLtgCLhcBwOer5nMvay7GJsSiyGWUYU0dmY73EU4YZfrQ5WnK3h9ZglNeeW
 7DNVc96jr55rLFQQHAcLYgl7eAATFcQy/tShuGpoPz/yHPuuLmBqXSJZdVvQB3dLFH4Yp0Dib6/wT
 6eke4XNCBLOdhFtZ2zWEn9B/r2HogSuVVV6QB0YbsPTVNZBHbE+nF9/Sq0UReySGeVwCMP1bEk9y1
 ZUffUil4XdYHZEuS5QKBICSmn1GDow6qY0FMgyKmx4uNK2qqhvJMve30NYkRwE75Gto0TmVH7Vj9M
 LBQbBwlQ==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1scRPf-009tN1-Jq; Fri, 09 Aug 2024 17:20:21 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH] drm/v3d: Fix out-of-bounds read in `v3d_csd_job_run()`
Date: Fri,  9 Aug 2024 12:18:45 -0300
Message-ID: <20240809152001.668314-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.45.2
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

When enabling UBSAN on Raspberry Pi 5, we get the following warning:

[  387.894977] UBSAN: array-index-out-of-bounds in drivers/gpu/drm/v3d/v3d_sched.c:320:3
[  387.903868] index 7 is out of range for type '__u32 [7]'
[  387.909692] CPU: 0 PID: 1207 Comm: kworker/u16:2 Tainted: G        WC         6.10.3-v8-16k-numa #151
[  387.919166] Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
[  387.925961] Workqueue: v3d_csd drm_sched_run_job_work [gpu_sched]
[  387.932525] Call trace:
[  387.935296]  dump_backtrace+0x170/0x1b8
[  387.939403]  show_stack+0x20/0x38
[  387.942907]  dump_stack_lvl+0x90/0xd0
[  387.946785]  dump_stack+0x18/0x28
[  387.950301]  __ubsan_handle_out_of_bounds+0x98/0xd0
[  387.955383]  v3d_csd_job_run+0x3a8/0x438 [v3d]
[  387.960707]  drm_sched_run_job_work+0x520/0x6d0 [gpu_sched]
[  387.966862]  process_one_work+0x62c/0xb48
[  387.971296]  worker_thread+0x468/0x5b0
[  387.975317]  kthread+0x1c4/0x1e0
[  387.978818]  ret_from_fork+0x10/0x20
[  387.983014] ---[ end trace ]---

This happens because the UAPI provides only seven configuration
registers and we are reading the eighth position of this u32 array.

Therefore, fix the out-of-bounds read in `v3d_csd_job_run()` by
accessing only seven positions on the '__u32 [7]' array. The eighth
register exists indeed on V3D 7.1, but it isn't currently used. That
being so, let's guarantee that it remains unused and add a note that it
could be set in a future patch.

Fixes: 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
Reported-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index fd29a00b233c..e1565cf84abd 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -317,7 +317,7 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	struct v3d_dev *v3d = job->base.v3d;
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
-	int i, csd_cfg0_reg, csd_cfg_reg_count;
+	int i, csd_cfg0_reg;
 
 	v3d->csd_job = job;
 
@@ -337,9 +337,17 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	v3d_switch_perfmon(v3d, &job->base);
 
 	csd_cfg0_reg = V3D_CSD_QUEUED_CFG0(v3d->ver);
-	csd_cfg_reg_count = v3d->ver < 71 ? 6 : 7;
-	for (i = 1; i <= csd_cfg_reg_count; i++)
+	for (i = 1; i <= 6; i++)
 		V3D_CORE_WRITE(0, csd_cfg0_reg + 4 * i, job->args.cfg[i]);
+
+	/* Although V3D 7.1 has an eighth configuration register, we are not
+	 * using it. Therefore, make sure it remains unused.
+	 *
+	 * XXX: Set the CFG7 register
+	 */
+	if (v3d->ver >= 71)
+		V3D_CORE_WRITE(0, csd_cfg0_reg + 4 * i, 0);
+
 	/* CFG0 write kicks off the job. */
 	V3D_CORE_WRITE(0, csd_cfg0_reg, job->args.cfg[0]);
 
-- 
2.45.2

