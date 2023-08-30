Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445778E217
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 00:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7871110E608;
	Wed, 30 Aug 2023 22:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7A510E5F4;
 Wed, 30 Aug 2023 22:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iXbgzIwp8rvKvb+sVe7Pc3bEJ83K6W453b2caD8OllI=; b=ljQ0fh15pra/XnwnRgif+KHO2L
 ZMIxi3MjLyMzjrYaYEn7v5Ds7/WaV6sug3wKAzUhAPBlMXmY8L2BTew2lktjwn5a06Q/Xa0SGt/gY
 cqYWPjKTLpuxYaOro+FT23qNsFoL4Ka+/gC5AICS6u9tGZOLhhQNHk6NYfcoEA81wvnLdREPWvdur
 5Ced3epGSKWCBM2d1jz8u23adEbf22Kcv5ExIdshV0U5CLl6lVQj7tHSLgjWjI4KzZsXrXqUMJQFd
 CnastXPgsBPHYDMH6MLJmK2L8cwLcTE11UFFF0FjboN8fEvFMVc7J3GRI64BdVTYpIeJsOgSrEaIO
 CukN6R6w==;
Received: from [191.193.15.45] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qbTMH-00Ha7K-B3; Thu, 31 Aug 2023 00:08:17 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/amdgpu: Merge debug module parameters
Date: Wed, 30 Aug 2023 19:08:07 -0300
Message-ID: <20230830220808.421935-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830220808.421935-1-andrealmeid@igalia.com>
References: <20230830220808.421935-1-andrealmeid@igalia.com>
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
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Merge all developer debug options available as separated module
parameters in one, making it obvious that are for developers.

Drop the obsolete module options in favor of the new ones.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v2:
- drop old module params
- use BIT() macros
- replace global var with adev-> vars
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 48 ++++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_crat.c    |  2 +-
 drivers/gpu/drm/amd/include/amd_shared.h |  8 ++++
 8 files changed, 45 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 4de074243c4d..82eaccfce347 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1101,6 +1101,10 @@ struct amdgpu_device {
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
index fb78a8f47587..8a26bed76505 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1191,7 +1191,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
 	}
 
-	if (amdgpu_vm_debug) {
+	if (adev->debug_vm) {
 		/* Invalidate all BOs to test for userspace bugs */
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index f5856b82605e..0cd48c025433 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -140,7 +140,6 @@ int amdgpu_vm_size = -1;
 int amdgpu_vm_fragment_size = -1;
 int amdgpu_vm_block_size = -1;
 int amdgpu_vm_fault_stop;
-int amdgpu_vm_debug;
 int amdgpu_vm_update_mode = -1;
 int amdgpu_exp_hw_support;
 int amdgpu_dc = -1;
@@ -194,6 +193,7 @@ int amdgpu_use_xgmi_p2p = 1;
 int amdgpu_vcnfw_log;
 int amdgpu_sg_display = -1; /* auto */
 int amdgpu_user_partt_mode = AMDGPU_AUTO_COMPUTE_PARTITION_MODE;
+uint amdgpu_debug_mask;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
@@ -405,13 +405,6 @@ module_param_named(vm_block_size, amdgpu_vm_block_size, int, 0444);
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
@@ -743,18 +736,6 @@ module_param(send_sigterm, int, 0444);
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
@@ -938,6 +919,18 @@ module_param_named(user_partt_mode, amdgpu_user_partt_mode, uint, 0444);
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
@@ -2042,6 +2035,19 @@ static void amdgpu_get_secondary_funcs(struct amdgpu_device *adev)
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
@@ -2220,6 +2226,8 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 			amdgpu_get_secondary_funcs(adev);
 	}
 
+	amdgpu_init_debug_options(adev);
+
 	return 0;
 
 err_pci:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 09203e22b026..548e65f2db5f 100644
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
index 74380b21e7a5..d483cd9c612a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1407,7 +1407,7 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		spin_unlock(&vm->status_lock);
 
 		/* Try to reserve the BO to avoid clearing its ptes */
-		if (!amdgpu_vm_debug && dma_resv_trylock(resv))
+		if (!adev->debug_vm && dma_resv_trylock(resv))
 			clear = false;
 		/* Somebody else is using the BO right now */
 		else
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 3b8f592384fa..41ac2ec936c3 100644
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
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 67d7b7ee8a2a..2fd6af2183cc 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -257,6 +257,14 @@ enum DC_DEBUG_MASK {
 
 enum amd_dpm_forced_level;
 
+/*
+ * amdgpu.debug module options. Are all disabled by default
+ */
+enum AMDGPU_DEBUG_MASK {
+	AMDGPU_DEBUG_VM = BIT(0),
+	AMDGPU_DEBUG_LARGEBAR = BIT(1),
+};
+
 /**
  * struct amd_ip_funcs - general hooks for managing amdgpu IP Blocks
  * @name: Name of IP block
-- 
2.41.0

