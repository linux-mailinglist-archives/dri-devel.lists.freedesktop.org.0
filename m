Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1FCA498E8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 13:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1783510E298;
	Fri, 28 Feb 2025 12:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="NVqGX+HB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A9410E294;
 Fri, 28 Feb 2025 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mdaQrTB1GlcYbOWB+bn3mxjKfUdFg1iAkJgoLN6PJOs=; b=NVqGX+HBHXQCoiX63hot6o6iL+
 5m9b0yntFRKSGwYflb7iGDb3qUG0oM5LNKXFF8no0OzTy4zFBmYVcrG/cblQBIRDgfycxURte5rmw
 H+qWrpuuVgQaw+Wi/Mwd+UdMY31T+NPTZLlJ8ByRZk7zoMzpJlLGLODzgwc8PKuH0fj6UGgtJLKfE
 xy/N/NTBZZDRIFHuEbXYms+iSWhpDlVgC1gSuzYWz/Y1YjsHFeERzAauh4RvajibCLk2By0pzMCRA
 IXndIMH6qU8ZTZEVCsOfCQ0C49JLguqk5hnr+PaSyrma++bD7Yvj14umXf5EtySOf1f7Z6K51ONBy
 t+IkIjLA==;
Received: from [191.204.194.148] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnzFj-0021Hz-Tg; Fri, 28 Feb 2025 13:14:10 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 Raag Jadav <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 2/2] drm/amdgpu: Make use of drm_wedge_app_info
Date: Fri, 28 Feb 2025 09:13:53 -0300
Message-ID: <20250228121353.1442591-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228121353.1442591-1-andrealmeid@igalia.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
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

To notify userspace about which app (if any) made the device get in a
wedge state, make use of drm_wedge_app_info parameter, filling it with
the app PID and name.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 00b9b87dafd8..e06adf6f34fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6123,8 +6123,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	atomic_set(&adev->reset_domain->reset_res, r);
 
-	if (!r)
-		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+	if (!r) {
+		struct drm_wedge_app_info aux, *info = NULL;
+
+		if (job) {
+			struct amdgpu_task_info *ti;
+
+			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
+			if (ti) {
+				aux.pid = ti->pid;
+				aux.comm = ti->process_name;
+				info = &aux;
+				amdgpu_vm_put_task_info(ti);
+			}
+		}
+
+		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
+	}
 
 	return r;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 3ed9cbcab1ad..8ab23182127e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
+	struct drm_wedge_app_info aux, *info = NULL;
 	struct amdgpu_task_info *ti;
 	struct amdgpu_device *adev = ring->adev;
 	int idx;
@@ -127,6 +128,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		dev_err(adev->dev,
 			"Process information: process %s pid %d thread %s pid %d\n",
 			ti->process_name, ti->tgid, ti->task_name, ti->pid);
+		aux.pid = ti->pid;
+		aux.comm = ti->process_name;
+		info = &aux;
 		amdgpu_vm_put_task_info(ti);
 	}
 
@@ -150,7 +154,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 			amdgpu_fence_driver_force_completion(ring);
 			if (amdgpu_ring_sched_ready(ring))
 				drm_sched_start(&ring->sched, 0);
-			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
+			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
 			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
 			goto exit;
 		}
-- 
2.48.1

