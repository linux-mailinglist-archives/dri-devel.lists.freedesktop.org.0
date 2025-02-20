Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B4A3E0AC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:28:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DB710E9BD;
	Thu, 20 Feb 2025 16:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DKV5Chvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3651C10E9BC;
 Thu, 20 Feb 2025 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Le8WVOEy30QeG3s/aHaLL2Z+h6Ona2+zkOtS7UkAOtQ=; b=DKV5Chvh9NBQCKNssE6KXWYZ5C
 gfzVuHk11YYrXCu5hJOppqfZEr7kR7XVtXpFdnyr3s1WYKgaYYwaDnIoE8P2xXNX/jYxcOWeGRDzn
 8xSHZUqBqHuqJc/RMSa5OtNTrTrof12cPo1y03QDYmWQ2SGQzsvY/w7VyoDZBe72GGXnR+/E3+IiL
 fXlujtsYZ4PxMcNJvososVlYAKYXVigWPlE1Bsdp6YrhP7uBLZtrvBiouhLytKpLh4N6XS0SB2HQi
 xEmsH9bDLUqMm49xlqlgZknOUgtTyaWZigF7iqqEtzCJ4LtAYmlGmleqJD8rA1Vb/w3JOJJHEoVGE
 JmIYuSzg==;
Received: from [191.204.194.148] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tl9P5-00FS04-7u; Thu, 20 Feb 2025 17:28:05 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, siqueira@igalia.com
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v2 3/3] drm/amdgpu: Trigger a wedged event for every type of
 reset
Date: Thu, 20 Feb 2025 13:27:50 -0300
Message-ID: <20250220162750.343139-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220162750.343139-1-andrealmeid@igalia.com>
References: <20250220162750.343139-1-andrealmeid@igalia.com>
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

Instead of only triggering a wedged event for complete GPU resets,
trigger for all types, like soft resets and ring resets. Regardless of
the reset, it's useful for userspace to know that it happened because
the kernel will reject further submissions from that app.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v2: Keep the wedge event in amdgpu_device_gpu_recover() and add and
    extra check to avoid triggering two events.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 698e5799e542..9948ea33d2c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -91,8 +91,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct amdgpu_task_info *ti;
 	struct amdgpu_device *adev = ring->adev;
-	int idx;
-	int r;
+	bool gpu_recover = false;
+	int idx, ret = 0;
 
 	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
 		dev_info(adev->dev, "%s - device unplugged skipping recovery on scheduler:%s",
@@ -141,8 +141,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		 * we'll fall back to full GPU reset.
 		 */
 		drm_sched_wqueue_stop(&ring->sched);
-		r = amdgpu_ring_reset(ring, job->vmid);
-		if (!r) {
+		ret = amdgpu_ring_reset(ring, job->vmid);
+		if (!ret) {
 			if (amdgpu_ring_sched_ready(ring))
 				drm_sched_stop(&ring->sched, s_job);
 			atomic_inc(&ring->adev->gpu_reset_counter);
@@ -170,9 +170,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		 */
 		set_bit(AMDGPU_SKIP_COREDUMP, &reset_context.flags);
 
-		r = amdgpu_device_gpu_recover(ring->adev, job, &reset_context);
-		if (r)
-			dev_err(adev->dev, "GPU Recovery Failed: %d\n", r);
+		ret = amdgpu_device_gpu_recover(ring->adev, job, &reset_context);
+		if (ret)
+			dev_err(adev->dev, "GPU Recovery Failed: %d\n", ret);
+		else
+			gpu_recover = true;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
@@ -180,6 +182,10 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	}
 
 exit:
+	/* Avoid sending two wedge events for the same reset */
+	if (!ret && !gpu_recover)
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
+
 	drm_dev_exit(idx);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
-- 
2.48.1

