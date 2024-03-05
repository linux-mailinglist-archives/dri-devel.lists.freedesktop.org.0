Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F908720F6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F9B112B18;
	Tue,  5 Mar 2024 13:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE711112B13;
 Tue,  5 Mar 2024 13:57:45 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 425Dve6o3162904; Tue, 5 Mar 2024 19:27:40 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 425DvegI3162903;
 Tue, 5 Mar 2024 19:27:40 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3] drm/amdgpu: add ring timeout information in devcoredump
Date: Tue,  5 Mar 2024 19:27:38 +0530
Message-Id: <20240305135738.3162878-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
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

Add ring timeout related information in the amdgpu
devcoredump file for debugging purposes.

During the gpu recovery process the registered call
is triggered and add the debug information in data
file created by devcoredump framework under the
directory /sys/class/devcoredump/devcdx/

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 14 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
index a59364e9b6ed..b5fd93cc5731 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -196,6 +196,13 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 			   coredump->reset_task_info.process_name,
 			   coredump->reset_task_info.pid);
 
+	if (coredump->ring) {
+		drm_printf(&p, "\nRing timed out details\n");
+		drm_printf(&p, "IP Type: %d Ring Name: %s \n",
+				coredump->ring->funcs->type,
+				coredump->ring->name);
+	}
+
 	if (coredump->reset_vram_lost)
 		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
 	if (coredump->adev->reset_info.num_regs) {
@@ -220,6 +227,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
 {
 	struct amdgpu_coredump_info *coredump;
 	struct drm_device *dev = adev_to_drm(adev);
+	struct amdgpu_job *job = reset_context->job;
+	struct drm_sched_job *s_job;
 
 	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
 
@@ -241,6 +250,11 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
 		}
 	}
 
+	if (job) {
+		s_job = &job->base;
+		coredump->ring = to_amdgpu_ring(s_job->sched);
+	}
+
 	coredump->adev = adev;
 
 	ktime_get_ts64(&coredump->reset_time);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
index 19899f6b9b2b..60522963aaca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
@@ -97,6 +97,7 @@ struct amdgpu_coredump_info {
 	struct amdgpu_task_info         reset_task_info;
 	struct timespec64               reset_time;
 	bool                            reset_vram_lost;
+	struct amdgpu_ring			*ring;
 };
 #endif
 
-- 
2.34.1

