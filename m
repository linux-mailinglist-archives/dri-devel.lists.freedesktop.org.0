Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C4449E34
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 22:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28246E237;
	Mon,  8 Nov 2021 21:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36186E187;
 Mon,  8 Nov 2021 21:27:24 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h11so32165884ljk.1;
 Mon, 08 Nov 2021 13:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=22aoR04dYV3sjfbs1JJgihZjjP3A00crocgdIWQOywc=;
 b=APOblWSCE41+QYO00Lch5oJFYAdCRmdmOPGm4gcXZzeCncbER/78a4QoI8hnW5W3cG
 7BH1nxWl3MLtHEQK5fjje8xq4UMYY2gOsBESzWaaxQSfocu5L2ZqXumWlR1M+Exp3mXX
 +yzUUBstC3yYhKrxmsWccGho4s+O8AyZ0Y3O3rJBtsZ61qOXK5sEsvs40fXGIIMbuLL2
 Z4VwzIjQPjCpb9JbFfEk8aXTlNDAEqWylLUS+pp397PooBCmjHEq35lXyKaNYCbk6eMQ
 j1XfWxLEtexhXk/rJhFOg6k0HSnt9/NAA7FjVnFcdrZ2onN0OwprFm015krDHNQZxaBS
 a+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=22aoR04dYV3sjfbs1JJgihZjjP3A00crocgdIWQOywc=;
 b=oKncsvjK9Ph6abRU6dUU4ieL2ZbevtrZVmUuTU0qHJP+AK7aQF/BaZoG2/A72V502k
 xcnl4+QqWxu7FVWW7U85CQAEIalyiGQjHhoSulbT53ZxHQBzgzggl2xe1gXdRFM4SZ0t
 X+gDeCe3acKDdVaEvquZf1cjNnFpdbCerCkEbRqToYGE6W3vvCSbAR52sX/yH/tju04b
 XL4HP94qiofeMLUDjfp61qrOF+EOEsnST+8Bl7Ipbw9awRUQ0o8EXGFnN/8AAi7+MN8a
 NJqyJlWFs2VP5OMt5Y6QLew8135XF8mc4v01fbvtqld05nAf3Y0/GGgTh6oMPm7mGA0F
 qj2w==
X-Gm-Message-State: AOAM53078LhZkR5ZvhXVrmG3shuQRvDA5gd6paYMRX8XgDuUz1REWxjE
 5ovows3Zv0GDD/OAdppMNv8=
X-Google-Smtp-Source: ABdhPJzg3ytGAZwWWF4xeM9FERibzo6Svq6ZcORi+vpimCsULUyKVGi0prN0CBf/JKqtrRf9ig3iEQ==
X-Received: by 2002:a2e:751a:: with SMTP id q26mr2093160ljc.168.1636406842892; 
 Mon, 08 Nov 2021 13:27:22 -0800 (PST)
Received: from zhiwang1-mobl.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id y11sm212671ljh.54.2021.11.08.13.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 13:27:22 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, zhenyuw@linux.intel.com, zhi.a.wang@intel.com,
 jgg@nvidia.com, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hch@lst.de
Subject: [PATCH 2/3] i915/gvt: save the initial HW state snapshot in i915.
Date: Mon,  8 Nov 2021 16:27:17 -0500
Message-Id: <20211108212718.10576-2-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108212718.10576-1-zhi.a.wang@intel.com>
References: <20211108212718.10576-1-zhi.a.wang@intel.com>
X-Mailman-Approved-At: Mon, 08 Nov 2021 21:28:39 +0000
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhi Wang <zhi.wang.linux@gmail.com>

Save the inital HW state snapshot in i915 so that the rest code of GVT-g
can be moved into a dedicated module while it can still get a clean
initial HW state saved at the correct time during the initialization of
i915. The futhrer vGPU created by GVT-g will use this HW state as the
initial HW state.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Zhi Wang <zhi.wang.linux@gmail.com>
---
 drivers/gpu/drm/i915/gvt/gvt.c   | 31 +------------
 drivers/gpu/drm/i915/gvt/gvt.h   |  6 +++
 drivers/gpu/drm/i915/intel_gvt.c | 75 ++++++++++++++++++++++++++++++--
 3 files changed, 80 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index cbac409f6c8a..4b3b47892453 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -63,23 +63,6 @@ static const struct intel_gvt_ops intel_gvt_ops = {
 	.emulate_hotplug = intel_vgpu_emulate_hotplug,
 };
 
-static void init_device_info(struct intel_gvt *gvt)
-{
-	struct intel_gvt_device_info *info = &gvt->device_info;
-	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
-
-	info->max_support_vgpus = 8;
-	info->cfg_space_size = PCI_CFG_SPACE_EXP_SIZE;
-	info->mmio_size = 2 * 1024 * 1024;
-	info->mmio_bar = 0;
-	info->gtt_start_offset = 8 * 1024 * 1024;
-	info->gtt_entry_size = 8;
-	info->gtt_entry_size_shift = 3;
-	info->gmadr_bytes_in_cmd = 8;
-	info->max_surface_size = 36 * 1024 * 1024;
-	info->msi_cap_offset = pdev->msi_cap;
-}
-
 static void intel_gvt_test_and_emulate_vblank(struct intel_gvt *gvt)
 {
 	struct intel_vgpu *vgpu;
@@ -188,27 +171,19 @@ void intel_gvt_clean_device(struct drm_i915_private *i915)
  */
 int intel_gvt_init_device(struct drm_i915_private *i915)
 {
-	struct intel_gvt *gvt;
+	struct intel_gvt *gvt = i915->gvt;
 	struct intel_vgpu *vgpu;
 	int ret;
 
-	if (drm_WARN_ON(&i915->drm, i915->gvt))
+	if (drm_WARN_ON(&i915->drm, !i915->gvt))
 		return -EEXIST;
 
-	gvt = kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
-	if (!gvt)
-		return -ENOMEM;
-
 	gvt_dbg_core("init gvt device\n");
 
 	idr_init_base(&gvt->vgpu_idr, 1);
 	spin_lock_init(&gvt->scheduler.mmio_context_lock);
 	mutex_init(&gvt->lock);
 	mutex_init(&gvt->sched_lock);
-	gvt->gt = &i915->gt;
-	i915->gvt = gvt;
-
-	init_device_info(gvt);
 
 	ret = intel_gvt_setup_mmio_info(gvt);
 	if (ret)
@@ -281,8 +256,6 @@ int intel_gvt_init_device(struct drm_i915_private *i915)
 	intel_gvt_clean_mmio_info(gvt);
 out_clean_idr:
 	idr_destroy(&gvt->vgpu_idr);
-	kfree(gvt);
-	i915->gvt = NULL;
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 0c0615602343..1defee730cf3 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -296,6 +296,11 @@ struct intel_vgpu_type {
 	enum intel_vgpu_edid resolution;
 };
 
+struct intel_gvt_hw_state {
+	void *cfg_space;
+	void *mmio;
+};
+
 struct intel_gvt {
 	/* GVT scope lock, protect GVT itself, and all resource currently
 	 * not yet protected by special locks(vgpu and scheduler lock).
@@ -311,6 +316,7 @@ struct intel_gvt {
 	struct intel_gvt_gm gm;
 	struct intel_gvt_fence fence;
 	struct intel_gvt_mmio mmio;
+	struct intel_gvt_hw_state hw_state;
 	struct intel_gvt_firmware firmware;
 	struct intel_gvt_irq irq;
 	struct intel_gvt_gtt gtt;
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 64846d9bff0b..4fd51974bd35 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -87,8 +87,12 @@ void intel_gvt_sanitize_options(struct drm_i915_private *dev_priv)
 }
 
 #define GENERATE_MMIO_TABLE_IN_I915
-static int new_mmio_info(struct intel_gvt *gvt, u64 offset)
+static int new_mmio_info(struct intel_gvt *gvt, u32 offset)
 {
+	void *mmio = gvt->hw_state.mmio;
+
+	*(u32 *)(mmio + offset) = intel_uncore_read_notrace(gvt->gt->uncore,
+							    _MMIO(offset));
 	return 0;
 }
 
@@ -96,6 +100,22 @@ static int new_mmio_info(struct intel_gvt *gvt, u64 offset)
 #include "gvt/mmio_table.h"
 #undef GENERATE_MMIO_TABLE_IN_I915
 
+static void init_device_info(struct intel_gvt *gvt)
+{
+	struct intel_gvt_device_info *info = &gvt->device_info;
+	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
+
+	info->max_support_vgpus = 8;
+	info->cfg_space_size = PCI_CFG_SPACE_EXP_SIZE;
+	info->mmio_size = 2 * 1024 * 1024;
+	info->mmio_bar = 0;
+	info->gtt_start_offset = 8 * 1024 * 1024;
+	info->gtt_entry_size = 8;
+	info->gtt_entry_size_shift = 3;
+	info->gmadr_bytes_in_cmd = 8;
+	info->max_surface_size = 36 * 1024 * 1024;
+	info->msi_cap_offset = pdev->msi_cap;
+}
 
 /**
  * intel_gvt_init - initialize GVT components
@@ -109,7 +129,13 @@ static int new_mmio_info(struct intel_gvt *gvt, u64 offset)
  */
 int intel_gvt_init(struct drm_i915_private *dev_priv)
 {
+	struct pci_dev *pdev = to_pci_dev(dev_priv->drm.dev);
+	struct intel_gvt *gvt = NULL;
+	struct intel_gvt_hw_state *hw_state;
+	struct intel_gvt_device_info *info;
+	void *mem;
 	int ret;
+	int i;
 
 	if (i915_inject_probe_failure(dev_priv))
 		return -ENODEV;
@@ -123,17 +149,54 @@ int intel_gvt_init(struct drm_i915_private *dev_priv)
 	if (intel_uc_wants_guc_submission(&dev_priv->gt.uc)) {
 		drm_err(&dev_priv->drm,
 			"i915 GVT-g loading failed due to Graphics virtualization is not yet supported with GuC submission\n");
-		return -EIO;
+		goto bail;
 	}
 
+	gvt = kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
+	if (!gvt)
+		goto bail;
+
+	gvt->gt = &dev_priv->gt;
+	hw_state = &gvt->hw_state;
+	info = &gvt->device_info;
+
+	init_device_info(gvt);
+
+	mem = kmalloc(info->cfg_space_size, GFP_KERNEL);
+	if (!mem)
+		goto err_cfg_space;
+
+	hw_state->cfg_space = mem;
+
+	mem = vmalloc(info->mmio_size);
+	if (!mem)
+		goto err_mmio;
+
+	hw_state->mmio = mem;
+
+	for (i = 0; i < PCI_CFG_SPACE_EXP_SIZE; i += 4)
+		pci_read_config_dword(pdev, i, hw_state->cfg_space + i);
+
+	ret = intel_gvt_init_mmio_info(gvt);
+	if (ret)
+		goto err_mmio_info;
+
+	dev_priv->gvt = gvt;
+
 	ret = intel_gvt_init_device(dev_priv);
 	if (ret) {
 		drm_dbg(&dev_priv->drm, "Fail to init GVT device\n");
-		goto bail;
+		goto err_mmio_info;
 	}
 
 	return 0;
 
+err_mmio_info:
+	vfree(hw_state->mmio);
+err_mmio:
+	kfree(hw_state->cfg_space);
+err_cfg_space:
+	kfree(gvt);
 bail:
 	dev_priv->params.enable_gvt = 0;
 	return 0;
@@ -154,10 +217,16 @@ static inline bool intel_gvt_active(struct drm_i915_private *dev_priv)
  */
 void intel_gvt_driver_remove(struct drm_i915_private *dev_priv)
 {
+	struct intel_gvt *gvt = dev_priv->gvt;
+
 	if (!intel_gvt_active(dev_priv))
 		return;
 
+	kfree(gvt->hw_state.cfg_space);
+	vfree(gvt->hw_state.mmio);
 	intel_gvt_clean_device(dev_priv);
+	kfree(gvt);
+	dev_priv->gvt = NULL;
 }
 
 /**
-- 
2.25.1

