Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1778B45ECDF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 12:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BCF6E7FA;
	Fri, 26 Nov 2021 11:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523196E7FA;
 Fri, 26 Nov 2021 11:46:35 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id z8so18202440ljz.9;
 Fri, 26 Nov 2021 03:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=771D8j+j6GY3D7m6lQgfgOiT77k90+QQB3iXGzCnqwI=;
 b=nke0byi9pUeD77reHH3E/amQB5LyH3GLk9EvVeONpHfna7hb1eaGJEArAijVw7xG3J
 WsND9bCW2fMG1Dz+of9Bymb6too31n4Dh0PdB4J+V+fC9YgWoAz4hcKZ9zKS6kv/oraP
 2zbSATXHp1NRXXbngu2d0hbkHm35T3SZxDCerDNLA9imU+S08VIecwTe3kG7W31Kemgw
 ZVdgTRHtsiZE7YMrliUrOBD9LSNEL8Uf0LE5z+DZGZv2MF5ZwqyarS2FheDRwpIROkRZ
 UEDuZJIEhdbgzNaY6l3OzyZFOF2J78nVAtcgK8h06gU/Jxogwlz/zov5NuqgYjMKnoFv
 frag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=771D8j+j6GY3D7m6lQgfgOiT77k90+QQB3iXGzCnqwI=;
 b=NFqJJGQEW0t3ZAQVm1KFaBwNXzWucv73x5IFkgVwHOHxZoNObvHzhIltLE7qjnuAXf
 8RwbhhC9II79JQcc6xXZ7WEXRt+4PjiteNGSLqkfnkruuD/9F/FMkHVzw0hfpq6vucvW
 n4q12scDFhMW/S6syrBMrTUeEPayJenq4iqqygyPuxwYNJu4TLq3LPgVGH2JglXNRN54
 2LyXIFZzgVLY2w9eufTIs6TQWy8L2NzUuFOwxDFBwQa53xEEZOcq+gGeX/a1jsLa5k2v
 J5CyG0VnZ6evaZoKRNtewPBSdC6f6dxPgZxN2RRItW5BQR9vGiaT3SbylJrrx2caH+/d
 JZiQ==
X-Gm-Message-State: AOAM531PFDTylYOusPKYjlHcHRm0KdrnxmL1kmchM7byPBnFh1e/hTUB
 vEPwy7Z/wuYI08CwLainpIoHFp4fijg=
X-Google-Smtp-Source: ABdhPJwbNELuNUo3IsF3TGtBzAP74FlXOLqdPSY3hc+lMa/6E7Mmg3z3Qynf84ETfd5Yf32TEIscGA==
X-Received: by 2002:a2e:99cf:: with SMTP id l15mr31804064ljj.111.1637927193243; 
 Fri, 26 Nov 2021 03:46:33 -0800 (PST)
Received: from inno-pc.lan (88-115-161-74.elisa-laajakaista.fi.
 [88.115.161.74])
 by smtp.gmail.com with ESMTPSA id c15sm556536lfb.40.2021.11.26.03.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 03:46:32 -0800 (PST)
From: Zhi Wang <zhi.wang.linux@gmail.com>
X-Google-Original-From: Zhi Wang <zhi.a.wang@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] i915/gvt: save the MMIO snapshot in the early init of
 GVT-g
Date: Fri, 26 Nov 2021 06:46:23 -0500
Message-Id: <20211126114623.88739-2-zhi.a.wang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126114623.88739-1-zhi.a.wang@intel.com>
References: <20211126114623.88739-1-zhi.a.wang@intel.com>
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

v3:

- Fix errors when CONFIG_DRM_I915_WERROR is turned on. (Jani)

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
 drivers/gpu/drm/i915/gvt/firmware.c        | 40 +-----------
 drivers/gpu/drm/i915/gvt/handlers.c        | 39 ------------
 drivers/gpu/drm/i915/gvt/mmio_info_table.c | 72 +++++++++++++++++++++-
 drivers/gpu/drm/i915/gvt/mmio_info_table.h |  3 +
 4 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/firmware.c b/drivers/gpu/drm/i915/gvt/firmware.c
index 1a8274a3f4b1..28719c2f253f 100644
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
@@ -81,7 +75,7 @@ static int expose_firmware_sysfs(struct intel_gvt *gvt)
 	void *firmware;
 	void *p;
 	unsigned long size, crc32_start;
-	int i, ret;
+	int ret;
 
 	size = sizeof(*h) + info->mmio_size + info->cfg_space_size;
 	firmware = vzalloc(size);
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
@@ -204,36 +189,17 @@ static int verify_firmware(struct intel_gvt *gvt,
  */
 int intel_gvt_load_firmware(struct intel_gvt *gvt)
 {
-	struct intel_gvt_device_info *info = &gvt->device_info;
 	struct pci_dev *pdev = to_pci_dev(gvt->gt->i915->drm.dev);
 	struct intel_gvt_firmware *firmware = &gvt->firmware;
 	struct gvt_firmware_header *h;
 	const struct firmware *fw;
 	char *path;
-	void *mem;
 	int ret;
 
 	path = kmalloc(PATH_MAX, GFP_KERNEL);
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
index 0303fd447330..7572b255d5d0 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_info_table.h
+++ b/drivers/gpu/drm/i915/gvt/mmio_info_table.h
@@ -29,6 +29,9 @@
 
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

