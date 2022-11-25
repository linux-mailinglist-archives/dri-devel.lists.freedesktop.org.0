Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC1638F5E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 18:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD4310E791;
	Fri, 25 Nov 2022 17:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9965310E780;
 Fri, 25 Nov 2022 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TjyhoR6wt5B1E4yoomBzwFjtmTKYq8UrV6BN0DXxMac=; b=PDGhzefohyKbNssK+vE/PxQIHg
 BtGaRCTTjPQRYWs/KaW3JO/cQ7oIENCFQ7FacdHUzOluADsLEeUOU/d//dZuNtKmtT5iBt0yw4Vo7
 7v+xi3oNXBYSeWIpK0MTXohhvusRSHReacLdxmKzLH4L/o5j5VJNONPf6Zxsv+DjE0Hh9w/sI3SIO
 3L9uqS8pexFzWn2N5oRg3xu1FsJFLaYCApbbbDVKcZNishF6Tb6eV1LeeZ7nSUcBFLN2HLoFv08ll
 RNokDTcP2k6htXKfRm7ydSHgUcxtfvctt8CTGzRlbiszZLAVYS9MPvEFlodCBU0IaRA9F9H2hQnUm
 iohSEERw==;
Received: from 200-148-10-170.dsl.telesp.net.br ([200.148.10.170]
 helo=steammachine.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oycsN-008yzi-Ob; Fri, 25 Nov 2022 18:52:36 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] drm/amdgpu: Add work function for GPU reset event
Date: Fri, 25 Nov 2022 14:52:03 -0300
Message-Id: <20221125175203.52481-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125175203.52481-1-andrealmeid@igalia.com>
References: <20221125175203.52481-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, amaranath.somalapuram@amd.com,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Shashank Sharma <shashank.sharma@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, contactshashanksharma@gmail.com,
 christian.koenig@amd.com,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a work function to send a GPU reset uevent and scheduled it during
a GPU reset.

Co-developed-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
V3:
   - Merge two last commits

V2: Addressed review comments from Christian
   - Changed the name of the work to gpu_reset_event_work
   - Added a structure to accommodate some additional information
     (like a PID and some flags)
   - Do not add new structure in amdgpu.h
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  4 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 30 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6b74df446694..88cb5b739c5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -60,6 +60,8 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/gpu_scheduler.h>
+#include <drm/drm_sysfs.h>
 
 #include <kgd_kfd_interface.h>
 #include "dm_pp_interface.h"
@@ -1003,6 +1005,7 @@ struct amdgpu_device {
 
 	int asic_reset_res;
 	struct work_struct		xgmi_reset_work;
+	struct work_struct		gpu_reset_event_work;
 	struct list_head		reset_list;
 
 	long				gfx_timeout;
@@ -1036,6 +1039,7 @@ struct amdgpu_device {
 	pci_channel_state_t		pci_channel_state;
 
 	struct amdgpu_reset_control     *reset_cntl;
+	struct drm_reset_event_info	reset_event_info;
 	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
 
 	bool				ram_is_direct_mapped;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b2b1c66bfe39..d04541fdb606 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -77,6 +77,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_sysfs.h>
 
 MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
 MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
@@ -3365,6 +3366,19 @@ bool amdgpu_device_has_dc_support(struct amdgpu_device *adev)
 	return amdgpu_device_asic_has_dc_support(adev->asic_type);
 }
 
+static void amdgpu_device_reset_event_func(struct work_struct *__work)
+{
+	struct amdgpu_device *adev = container_of(__work, struct amdgpu_device,
+						   gpu_reset_event_work);
+	/*
+	 * A GPU reset has happened, inform the userspace and pass the reset
+	 * related information
+	 */
+	drm_sysfs_reset_event(&adev->ddev, &adev->reset_event_info);
+
+	put_pid(adev->reset_event_info.pid);
+}
+
 static void amdgpu_device_xgmi_reset_func(struct work_struct *__work)
 {
 	struct amdgpu_device *adev =
@@ -3616,6 +3630,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			  amdgpu_device_delay_enable_gfx_off);
 
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
+	INIT_WORK(&adev->gpu_reset_event_work, amdgpu_device_reset_event_func);
 
 	adev->gfx.gfx_off_req_count = 1;
 	adev->gfx.gfx_off_residency = 0;
@@ -4920,6 +4935,21 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 					goto out;
 
 				vram_lost = amdgpu_device_check_vram_lost(tmp_adev);
+
+				if (reset_context->job && reset_context->job->vm) {
+					tmp_adev->reset_event_info.pid =
+						find_get_pid(reset_context->job->vm->task_info.pid);
+				} else {
+					tmp_adev->reset_event_info.pid = NULL;
+				}
+
+				if (vram_lost)
+					tmp_adev->reset_event_info.flags |=
+						DRM_RESET_EVENT_VRAM_LOST;
+
+				/* Send GPU reset event */
+				schedule_work(&tmp_adev->gpu_reset_event_work);
+
 #ifdef CONFIG_DEV_COREDUMP
 				tmp_adev->reset_vram_lost = vram_lost;
 				memset(&tmp_adev->reset_task_info, 0,
-- 
2.38.1

