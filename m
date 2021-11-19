Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B91456F42
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 14:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C936F586;
	Fri, 19 Nov 2021 13:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6D26F582;
 Fri, 19 Nov 2021 13:03:15 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu18so43392084lfb.0;
 Fri, 19 Nov 2021 05:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74UAaAlyeYorhD8LiTFFDJpHlo7FxQjyV94+QBnI/UU=;
 b=Ej9xPYoOzVMnUvBB65ibgggdM7iToNoZS1avGOysQWLq+JVAMC1ra+2dG/bY5VLIFC
 3/cNWGFjnUTkuZ97uz+s2tsV7k09iPk15squqqTxXYVOn2bNSenQyRVZhmicMMSYPB0z
 O9BvfHppI80mRcHULK9NmqUyg4n2aLDGM0r2D3dPp5oUorkUtYAMrs+3GGk20ntU3JfE
 XeozBrLNDEv9/YRKb6tUBueQ9DCbqZBAzRTQN84Zzat4LshNEvDLdsZofkBAUs07EwQ+
 gJmMzfk5K5o0MRpz6uf+JFV9GMxhUyKeFJITyorI4q5MVELGppkTz0ZaoIC6Zq6FrHKn
 2ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74UAaAlyeYorhD8LiTFFDJpHlo7FxQjyV94+QBnI/UU=;
 b=nJUk1Djqu6SXhHebJTrPNA3fhtUzoMCNd16anqm7vi6gVULRHNBTJmhmqseNtFOWhu
 Ahs8YSKpxSwSoGX8FUrR33yaCIBwimkaCdIB2w02mf6/wgQXAb4tK6pTDV4sx3jJSOtm
 +PSE1c/mlSeKxEjlZ+1NtAz1a1xulG9APq4c2ta36c1SeX57KAg39mrdcOnc2bm8/dcE
 lTATeYcuq3RbGvBLTvefh0j7LWgIifaYxwNsa4WgmYkSNyIPDXPCcxIfjUNLKj7d4cBd
 leGECY9mvk1N3qSOQ9toj8He1XwZj6eGmlS0uqow0lvJFsEiTnh1QZXSlVJJhFS2p5rs
 CBmg==
X-Gm-Message-State: AOAM5333Ab036f/ey/t6CXFFFOX79d5ifl+tg1L3jxVu2Va5tcgRCA8H
 U36gfzzp5e0obc+OaMejwbyYErnRpog=
X-Google-Smtp-Source: ABdhPJzC1y09BmFT4vqj3Oye5DhvhOnKckcfdTr3CXRANhsG08svFeRlo/juDHbos+Xfh/ZhRgxCjw==
X-Received: by 2002:a05:651c:1788:: with SMTP id
 bn8mr6014524ljb.521.1637326991565; 
 Fri, 19 Nov 2021 05:03:11 -0800 (PST)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id e6sm356815lfn.172.2021.11.19.05.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 05:03:11 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i915/gvt: save the MMIO snapshot in the early init of
 GVT-g
Date: Fri, 19 Nov 2021 08:03:07 -0500
Message-Id: <20211119130307.21098-2-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119130307.21098-1-zhi.a.wang@intel.com>
References: <20211119130307.21098-1-zhi.a.wang@intel.com>
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>,
 Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhi Wang <zhi.wang.linux@gmail.com>

To support the early init of GVT-g, which will be put in i915, after the
GVT-g is moved into a dedicated module, we need to save the MMIO snapshot
in the early init of GVT-g, when the HW hasn't been touched.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.a.wang@intel.com>
Tested-by: Terrence Xu <terrence.xu@intel.com>
Signed-off-by: Zhi Wang <zhi.wang.linux@gmail.com>
---
 drivers/gpu/drm/i915/gvt/firmware.c        | 36 +----------
 drivers/gpu/drm/i915/gvt/handlers.c        | 39 ------------
 drivers/gpu/drm/i915/gvt/mmio_info_table.c | 72 +++++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/mmio_info_table.h |  3 +
 4 files changed, 76 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index 1a8274a3f4b1..dd5d4dd7a8cf 100644
--- a/drivers/gpu/drm/i915/gvt/firmware.c
+++ b/drivers/gpu/drm/i915/gvt/firmware.c
@@ -66,12 +66,6 @@ static struct bin_attribute firmware_attr = {
 	.mmap = NULL,
 };
 
-static int mmio_snapshot_handler(struct intel_gvt *gvt, u32 offset, void *data)
-{
-	*(u32 *)(data + offset) = intel_uncore_read_notrace(gvt->gt->uncore,
-							    _MMIO(offset));
-	return 0;
-}
 
 static int expose_firmware_sysfs(struct intel_gvt *gvt)
 {
@@ -99,17 +93,11 @@ static int expose_firmware_sysfs(struct intel_gvt *gvt)
 
 	p = firmware + h->cfg_space_offset;
 
-	for (i = 0; i < h->cfg_space_size; i += 4)
-		pci_read_config_dword(pdev, i, p + i);
-
-	memcpy(gvt->firmware.cfg_space, p, info->cfg_space_size);
+	memcpy(p, gvt->firmware.cfg_space, info->cfg_space_size);
 
 	p = firmware + h->mmio_offset;
 
-	/* Take a snapshot of hw mmio registers. */
-	intel_gvt_for_each_tracked_mmio(gvt, mmio_snapshot_handler, p);
-
-	memcpy(gvt->firmware.mmio, p, info->mmio_size);
+	memcpy(p, gvt->firmware.mmio, info->mmio_size);
 
 	crc32_start = offsetof(struct gvt_firmware_header, crc32) + 4;
 	h->crc32 = crc32_le(0, firmware + crc32_start, size - crc32_start);
@@ -142,9 +130,6 @@ void intel_gvt_free_firmware(struct intel_gvt *gvt)
 {
 	if (!gvt->firmware.firmware_loaded)
 		clean_firmware_sysfs(gvt);
-
-	kfree(gvt->firmware.cfg_space);
-	vfree(gvt->firmware.mmio);
 }
 
 static int verify_firmware(struct intel_gvt *gvt,
@@ -217,23 +202,6 @@ int intel_gvt_load_firmware(struct intel_gvt *gvt)
 	if (!path)
 		return -ENOMEM;
 
-	mem = kmalloc(info->cfg_space_size, GFP_KERNEL);
-	if (!mem) {
-		kfree(path);
-		return -ENOMEM;
-	}
-
-	firmware->cfg_space = mem;
-
-	mem = vmalloc(info->mmio_size);
-	if (!mem) {
-		kfree(path);
-		kfree(firmware->cfg_space);
-		return -ENOMEM;
-	}
-
-	firmware->mmio = mem;
-
 	sprintf(path, "%s/vid_0x%04x_did_0x%04x_rid_0x%02x.golden_hw_state",
 		 GVT_FIRMWARE_PATH, pdev->vendor, pdev->device,
 		 pdev->revision);
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 2c064da3db6d..ba7b330a2c71 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -2406,45 +2406,6 @@ int intel_gvt_setup_mmio_handlers(struct intel_gvt *gvt)
 	return ret;
 }
 
-/**
- * intel_gvt_for_each_tracked_mmio - iterate each tracked mmio
- * @gvt: a GVT device
- * @handler: the handler
- * @data: private data given to handler
- *
- * Returns:
- * Zero on success, negative error code if failed.
- */
-int intel_gvt_for_each_tracked_mmio(struct intel_gvt *gvt,
-	int (*handler)(struct intel_gvt *gvt, u32 offset, void *data),
-	void *data)
-{
-	struct gvt_mmio_block *block = gvt->mmio.mmio_block;
-	struct intel_gvt_mmio_info *e;
-	int i, j, ret;
-
-	hash_for_each(gvt->mmio.mmio_info_table, i, e, node) {
-		ret = handler(gvt, e->offset, data);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < gvt->mmio.num_mmio_block; i++, block++) {
-		/* pvinfo data doesn't come from hw mmio */
-		if (i915_mmio_reg_offset(block->offset) == VGT_PVINFO_PAGE)
-			continue;
-
-		for (j = 0; j < block->size; j += 4) {
-			ret = handler(gvt,
-				      i915_mmio_reg_offset(block->offset) + j,
-				      data);
-			if (ret)
-				return ret;
-		}
-	}
-	return 0;
-}
-
 /**
  * intel_vgpu_default_mmio_read - default MMIO read handler
  * @vgpu: a vGPU
diff --git a/drivers/gpu/drm/i915/gvt/mmio_info_table.c b/drivers/gpu/drm/i915/gvt/mmio_info_table.c
index 723190c25313..76535e3cc9ba 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_info_table.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_info_table.c
@@ -1398,6 +1398,54 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gvt)
 
 	vfree(gvt->mmio.mmio_attribute);
 	gvt->mmio.mmio_attribute = NULL;
+	kfree(gvt->firmware.cfg_space);
+	vfree(gvt->firmware.mmio);
+}
+
+static int mmio_snapshot_handler(struct intel_gvt *gvt, u32 offset, void *data)
+{
+	*(u32 *)(data + offset) = intel_uncore_read_notrace(gvt->gt->uncore,
+							    _MMIO(offset));
+	return 0;
+}
+
+/**
+ * intel_gvt_for_each_tracked_mmio - iterate each tracked mmio
+ * @gvt: a GVT device
+ * @handler: the handler
+ * @data: private data given to handler
+ *
+ * Returns:
+ * Zero on success, negative error code if failed.
+ */
+int intel_gvt_for_each_tracked_mmio(struct intel_gvt *gvt,
+	int (*handler)(struct intel_gvt *gvt, u32 offset, void *data),
+	void *data)
+{
+	struct gvt_mmio_block *block = gvt->mmio.mmio_block;
+	struct intel_gvt_mmio_info *e;
+	int i, j, ret;
+
+	hash_for_each(gvt->mmio.mmio_info_table, i, e, node) {
+		ret = handler(gvt, e->offset, data);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < gvt->mmio.num_mmio_block; i++, block++) {
+		/* pvinfo data doesn't come from hw mmio */
+		if (i915_mmio_reg_offset(block->offset) == VGT_PVINFO_PAGE)
+			continue;
+
+		for (j = 0; j < block->size; j += 4) {
+			ret = handler(gvt,
+				      i915_mmio_reg_offset(block->offset) + j,
+				      data);
+			if (ret)
+				return ret;
+		}
+	}
+	return 0;
 }
 
 /**
@@ -1414,8 +1462,10 @@ int intel_gvt_setup_mmio_info(struct intel_gvt *gvt)
 {
 	struct intel_gvt_device_info *info = &gvt->device_info;
 	struct drm_i915_private *i915 = gvt->gt->i915;
+	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	int size = info->mmio_size / 4 * sizeof(*gvt->mmio.mmio_attribute);
-	int ret;
+	void *mem;
+	int i, ret;
 
 	gvt->mmio.mmio_attribute = vzalloc(size);
 	if (!gvt->mmio.mmio_attribute)
@@ -1454,6 +1504,26 @@ int intel_gvt_setup_mmio_info(struct intel_gvt *gvt)
 	gvt->mmio.mmio_block = mmio_blocks;
 	gvt->mmio.num_mmio_block = ARRAY_SIZE(mmio_blocks);
 
+	mem = kzalloc(info->cfg_space_size, GFP_KERNEL);
+	if (!mem)
+		goto err;
+
+	gvt->firmware.cfg_space = mem;
+
+	for (i = 0; i < info->cfg_space_size; i += 4)
+		pci_read_config_dword(pdev, i, mem + i);
+
+	mem = vzalloc(info->mmio_size);
+	if (!mem) {
+		kfree(gvt->firmware.cfg_space);
+		goto err;
+	}
+
+	gvt->firmware.mmio = mem;
+
+	/* Take a snapshot of hw mmio registers. */
+	intel_gvt_for_each_tracked_mmio(gvt, mmio_snapshot_handler, mem);
+
 	return 0;
 err:
 	intel_gvt_clean_mmio_info(gvt);
diff --git a/drivers/gpu/drm/i915/gvt/mmio_info_table.h b/drivers/gpu/drm/i915/gvt/mmio_info_table.h
index 1c78ab1906c4..8379cb41735f 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_info_table.h
+++ b/drivers/gpu/drm/i915/gvt/mmio_info_table.h
@@ -27,6 +27,9 @@
 
 unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt);
 bool intel_gvt_match_device(struct intel_gvt *gvt, unsigned long device);
+int intel_gvt_for_each_tracked_mmio(struct intel_gvt *gvt,
+	int (*handler)(struct intel_gvt *gvt, u32 offset, void *data),
+	void *data);
 struct intel_gvt_mmio_info *intel_gvt_find_mmio_info(struct intel_gvt *gvt,
 						     unsigned int offset);
 int intel_gvt_setup_mmio_info(struct intel_gvt *gvt);
-- 
2.25.1

