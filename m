Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A933E79AA7D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 19:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100C810E343;
	Mon, 11 Sep 2023 17:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CEB10E1B6;
 Mon, 11 Sep 2023 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mJAnqqvASsAP6Cixlu7hXANHs+0IQlO63puyqsOwXww=; b=lQND+Zn3GuxZg3IU27z403exPs
 D/4jWDcvICU1MA5RjUEqGiEJEVD5xn6A1BOqQTqcNlHj8MQAgPAozhXt1Vv6yTFITI5SaWkoAlhKi
 lTJ0Ycnvtr13fLaTJD2X2ZCyHsleGDmsNiNy6kS7js+2M9vL5QSuLbA1J+Vu1rz/Id/rYtur4aY2F
 kT6wQPWfoRSoSBO+Zj0gTbs1UCTjCukwRWZMTarIV/Huri+zMfgz2IQWY865mvNKxG1tB7PLiBiBa
 qFmJnMT3MDrQlMt6BJ+rOrsG+Bny3MLMPEcDuDzfZBtDlRqp31qAurJJ6KUO6uQbF7BYGvyShStJR
 7JRzp2Fg==;
Received: from [187.10.203.89] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qfkT9-002OoM-Pi; Mon, 11 Sep 2023 19:13:04 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] drm/amdgpu: Merge debug module parameters
Date: Mon, 11 Sep 2023 14:12:54 -0300
Message-ID: <20230911171255.143992-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911171255.143992-1-andrealmeid@igalia.com>
References: <20230911171255.143992-1-andrealmeid@igalia.com>
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
 Shashank Sharma <shashank.sharma@amd.com>, hamza.mahfooz@amd.com,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Merge all developer debug options available as separated module
parameters in one, making it obvious that are for developers.

Drop the obsolete module options in favor of the new ones.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
v3:
- move from include/amd_shared.h to amdgpu/amdgpu_drv.c
v2:
- drop old module params
- use BIT() macros
- replace global var with adev-> vars
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 56 +++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c    |  2 +-
 7 files changed, 45 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 83a9607a87b8..37eb9b3790a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1099,6 +1099,10 @@ struct amdgpu_device {
 	bool                            dc_enabled;
 	/* Mask of active clusters */
 	uint32_t			aid_mask;
+
+	/* Debug */
+	bool                            debug_vm;
+	bool                            debug_largebar;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index db5ecde8f0ec..74769afaa33d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1181,7 +1181,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
 	}
 
-	if (amdgpu_vm_debug) {
+	if (adev->debug_vm) {
 		/* Invalidate all BOs to test for userspace bugs */
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ef713806dd60..830146bd61c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -118,6 +118,14 @@
 #define KMS_DRIVER_MINOR	54
 #define KMS_DRIVER_PATCHLEVEL	0
 
+/*
+ * amdgpu.debug module options. Are all disabled by default
+ */
+enum AMDGPU_DEBUG_MASK {
+	AMDGPU_DEBUG_VM = BIT(0),
+	AMDGPU_DEBUG_LARGEBAR = BIT(1),
+};
+
 unsigned int amdgpu_vram_limit = UINT_MAX;
 int amdgpu_vis_vram_limit;
 int amdgpu_gart_size = -1; /* auto */
@@ -140,7 +148,6 @@ int amdgpu_vm_size = -1;
 int amdgpu_vm_fragment_size = -1;
 int amdgpu_vm_block_size = -1;
 int amdgpu_vm_fault_stop;
-int amdgpu_vm_debug;
 int amdgpu_vm_update_mode = -1;
 int amdgpu_exp_hw_support;
 int amdgpu_dc = -1;
@@ -195,6 +202,7 @@ int amdgpu_vcnfw_log;
 int amdgpu_sg_display = -1; /* auto */
 int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
 int amdgpu_umsch_mm;
+uint amdgpu_debug_mask;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
@@ -406,13 +414,6 @@ module_param_named(vm_block_size, amdgpu_vm_block_size, int, 0444);
 MODULE_PARM_DESC(vm_fault_stop, "Stop on VM fault (0 = never (default), 1 = print first, 2 = always)");
 module_param_named(vm_fault_stop, amdgpu_vm_fault_stop, int, 0444);
 
-/**
- * DOC: vm_debug (int)
- * Debug VM handling (0 = disabled, 1 = enabled). The default is 0 (Disabled).
- */
-MODULE_PARM_DESC(vm_debug, "Debug VM handling (0 = disabled (default), 1 = enabled)");
-module_param_named(vm_debug, amdgpu_vm_debug, int, 0644);
-
 /**
  * DOC: vm_update_mode (int)
  * Override VM update mode. VM updated by using CPU (0 = never, 1 = Graphics only, 2 = Compute only, 3 = Both). The default
@@ -744,18 +745,6 @@ module_param(send_sigterm, int, 0444);
 MODULE_PARM_DESC(send_sigterm,
 	"Send sigterm to HSA process on unhandled exception (0 = disable, 1 = enable)");
 
-/**
- * DOC: debug_largebar (int)
- * Set debug_largebar as 1 to enable simulating large-bar capability on non-large bar
- * system. This limits the VRAM size reported to ROCm applications to the visible
- * size, usually 256MB.
- * Default value is 0, diabled.
- */
-int debug_largebar;
-module_param(debug_largebar, int, 0444);
-MODULE_PARM_DESC(debug_largebar,
-	"Debug large-bar flag used to simulate large-bar capability on non-large bar machine (0 = disable, 1 = enable)");
-
 /**
  * DOC: halt_if_hws_hang (int)
  * Halt if HWS hang is detected. Default value, 0, disables the halt on hang.
@@ -948,6 +937,18 @@ module_param_named(user_partt_mode, amdgpu_user_partt_mode, uint, 0444);
 module_param(enforce_isolation, bool, 0444);
 MODULE_PARM_DESC(enforce_isolation, "enforce process isolation between graphics and compute . enforce_isolation = on");
 
+/**
+ * DOC: debug_mask (uint)
+ * Debug options for amdgpu, work as a binary mask with the following options:
+ *
+ * - 0x1: Debug VM handling
+ * - 0x2: Enable simulating large-bar capability on non-large bar system. This
+ *   limits the VRAM size reported to ROCm applications to the visible
+ *   size, usually 256MB.
+ */
+MODULE_PARM_DESC(debug_mask, "debug options for amdgpu, disabled by default");
+module_param_named(debug_mask, amdgpu_debug_mask, uint, 0444);
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
@@ -2052,6 +2053,19 @@ static void amdgpu_get_secondary_funcs(struct amdgpu_device *adev)
 	}
 }
 
+static void amdgpu_init_debug_options(struct amdgpu_device *adev)
+{
+	if (amdgpu_debug_mask & AMDGPU_DEBUG_VM) {
+		pr_info("debug: VM handling debug enabled\n");
+		adev->debug_vm = true;
+	}
+
+	if (amdgpu_debug_mask & AMDGPU_DEBUG_LARGEBAR) {
+		pr_info("debug: enabled simulating large-bar capability on non-large bar system\n");
+		adev->debug_largebar = true;
+	}
+}
+
 static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
@@ -2230,6 +2244,8 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 			amdgpu_get_secondary_funcs(adev);
 	}
 
+	amdgpu_init_debug_options(adev);
+
 	return 0;
 
 err_pci:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 1134e29a7915..849fffbb367d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -794,7 +794,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	default:
 		break;
 	}
-	if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && !amdgpu_vm_debug)
+	if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && !adev->debug_vm)
 		amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
 					args->operation);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index edaebabc8e60..07a4bcbeb4b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1320,7 +1320,7 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		spin_unlock(&vm->status_lock);
 
 		/* Try to reserve the BO to avoid clearing its ptes */
-		if (!amdgpu_vm_debug && dma_resv_trylock(resv))
+		if (!adev->debug_vm && dma_resv_trylock(resv))
 			clear = false;
 		/* Somebody else is using the BO right now */
 		else
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 08687ce0aa8b..65d2b9ae16bb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1021,7 +1021,7 @@ static int kfd_ioctl_acquire_vm(struct file *filep, struct kfd_process *p,
 
 bool kfd_dev_is_large_bar(struct kfd_node *dev)
 {
-	if (debug_largebar) {
+	if (dev->kfd->adev->debug_largebar) {
 		pr_debug("Simulate large-bar allocation on non large-bar machine\n");
 		return true;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
index 2e9612cf56ae..b05e06f89814 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
@@ -2115,7 +2115,7 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
 	sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
 			sub_type_hdr->length);
 
-	if (debug_largebar)
+	if (kdev->adev->debug_largebar)
 		local_mem_info.local_mem_size_private = 0;
 
 	if (local_mem_info.local_mem_size_private == 0)
-- 
2.42.0

