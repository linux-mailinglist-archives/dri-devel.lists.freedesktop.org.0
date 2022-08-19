Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D45E59A8D9
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 00:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F8A10F1F6;
	Fri, 19 Aug 2022 22:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB6610E4CF;
 Fri, 19 Aug 2022 22:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660949630; x=1692485630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1x3IgBHWtd5qb5tu+O8LsJWLsXZC0Yxj39GLIal2ME=;
 b=dIWzuuTy4lW1nhdKwgLpQvUiqfyTjouYlfvC0EzDWootbUqAwiW6xYu+
 5eC91bmCBlQ12owClMlu5+PHGyuoLgu33iac0/lpERqujqyDddyhVp61W
 wcHwvPqMeq6kl9W2tByiq8B29NUE6UqtZg07xxKEDUH06NlXXtZoArsJx
 dJZUNCwmiUrQjrEQeiVRijTeL4mRdhnKUh5FuEYLEU4Wn+XdpgZ3MguQn
 a7cqbBdfrmxjmrqL1MbVngMs7F4JEmLLOsrnxG3Mz/7tfb8i/qPbgYVOG
 q0pvQIhHVS7KMhRoBYCCWyjlkTOND2tFucsfQQNQEcE3jwjtvxlzPghM4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="273513224"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="273513224"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 15:53:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="936378452"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 15:53:50 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 01/15] HAX: mei: GSC support for XeHP SDV and DG2 platform
Date: Fri, 19 Aug 2022 15:53:21 -0700
Message-Id: <20220819225335.3947346-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a squash of the GSC support for XeHP SDV and DG2 series, which
is being reviewed separately at:
https://patchwork.freedesktop.org/series/106638/

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gsc.c | 118 +++++++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_gsc.h |   3 +
 drivers/misc/mei/bus-fixup.c        | 104 ++++++++++++++++--------
 drivers/misc/mei/client.c           |  14 ++--
 drivers/misc/mei/debugfs.c          |  17 ++++
 drivers/misc/mei/gsc-me.c           |  77 +++++++++++++++---
 drivers/misc/mei/hbm.c              |  12 +--
 drivers/misc/mei/hw-me-regs.h       |   7 ++
 drivers/misc/mei/hw-me.c            | 116 ++++++++++++++++++++++-----
 drivers/misc/mei/hw-me.h            |  14 +++-
 drivers/misc/mei/hw-txe.c           |   2 +-
 drivers/misc/mei/hw.h               |   5 ++
 drivers/misc/mei/init.c             |  21 ++++-
 drivers/misc/mei/main.c             |   2 +-
 drivers/misc/mei/mei_dev.h          |  26 ++++++
 drivers/misc/mei/mkhi.h             |  57 ++++++++++++++
 drivers/misc/mei/pci-me.c           |   2 +-
 include/linux/mei_aux.h             |  12 +++
 18 files changed, 518 insertions(+), 91 deletions(-)
 create mode 100644 drivers/misc/mei/mkhi.h

diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
index 0e494028b81d..162bea57fbb5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.c
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
@@ -7,6 +7,7 @@
 #include <linux/mei_aux.h>
 #include "i915_drv.h"
 #include "i915_reg.h"
+#include "gem/i915_gem_region.h"
 #include "gt/intel_gsc.h"
 #include "gt/intel_gt.h"
 
@@ -36,10 +37,68 @@ static int gsc_irq_init(int irq)
 	return irq_set_chip_data(irq, NULL);
 }
 
+static int
+gsc_ext_om_alloc(struct intel_gsc *gsc, struct intel_gsc_intf *intf, size_t size)
+{
+	struct intel_gt *gt = gsc_to_gt(gsc);
+	struct drm_i915_gem_object *obj;
+	void *vaddr;
+	int err;
+
+	obj = i915_gem_object_create_lmem(gt->i915, size, I915_BO_ALLOC_CONTIGUOUS);
+	if (IS_ERR(obj)) {
+		drm_err(&gt->i915->drm, "Failed to allocate gsc memory\n");
+		return PTR_ERR(obj);
+	}
+
+	err = i915_gem_object_pin_pages_unlocked(obj);
+	if (err) {
+		drm_err(&gt->i915->drm, "Failed to pin pages for gsc memory\n");
+		goto out_put;
+	}
+
+	vaddr = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(gt->i915, obj, true));
+	if (IS_ERR(vaddr)) {
+		err = PTR_ERR(vaddr);
+		drm_err(&gt->i915->drm, "Failed to map gsc memory\n");
+		goto out_unpin;
+	}
+
+	memset(vaddr, 0, obj->base.size);
+
+	i915_gem_object_unpin_map(obj);
+
+	intf->gem_obj = obj;
+
+	return 0;
+
+out_unpin:
+	i915_gem_object_unpin_pages(obj);
+out_put:
+	i915_gem_object_put(obj);
+	return err;
+}
+
+static void gsc_ext_om_destroy(struct intel_gsc_intf *intf)
+{
+	struct drm_i915_gem_object *obj = fetch_and_zero(&intf->gem_obj);
+
+	if (!obj)
+		return;
+
+	if (i915_gem_object_has_pinned_pages(obj))
+		i915_gem_object_unpin_pages(obj);
+
+	i915_gem_object_put(obj);
+}
+
 struct gsc_def {
 	const char *name;
 	unsigned long bar;
 	size_t bar_size;
+	bool use_polling;
+	bool slow_firmware;
+	size_t lmem_size;
 };
 
 /* gsc resources and definitions (HECI1 and HECI2) */
@@ -54,11 +113,25 @@ static const struct gsc_def gsc_def_dg1[] = {
 	}
 };
 
+static const struct gsc_def gsc_def_xehpsdv[] = {
+	{
+		/* HECI1 not enabled on the device. */
+	},
+	{
+		.name = "mei-gscfi",
+		.bar = DG1_GSC_HECI2_BASE,
+		.bar_size = GSC_BAR_LENGTH,
+		.use_polling = true,
+		.slow_firmware = true,
+	}
+};
+
 static const struct gsc_def gsc_def_dg2[] = {
 	{
 		.name = "mei-gsc",
 		.bar = DG2_GSC_HECI1_BASE,
 		.bar_size = GSC_BAR_LENGTH,
+		.lmem_size = SZ_4M,
 	},
 	{
 		.name = "mei-gscfi",
@@ -75,26 +148,32 @@ static void gsc_release_dev(struct device *dev)
 	kfree(adev);
 }
 
-static void gsc_destroy_one(struct intel_gsc_intf *intf)
+static void gsc_destroy_one(struct drm_i915_private *i915,
+			    struct intel_gsc *gsc, unsigned int intf_id)
 {
+	struct intel_gsc_intf *intf = &gsc->intf[intf_id];
+
 	if (intf->adev) {
 		auxiliary_device_delete(&intf->adev->aux_dev);
 		auxiliary_device_uninit(&intf->adev->aux_dev);
 		intf->adev = NULL;
 	}
+
 	if (intf->irq >= 0)
 		irq_free_desc(intf->irq);
 	intf->irq = -1;
+
+	gsc_ext_om_destroy(intf);
 }
 
-static void gsc_init_one(struct drm_i915_private *i915,
-			 struct intel_gsc_intf *intf,
+static void gsc_init_one(struct drm_i915_private *i915, struct intel_gsc *gsc,
 			 unsigned int intf_id)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
 	struct mei_aux_device *adev;
 	struct auxiliary_device *aux_dev;
 	const struct gsc_def *def;
+	struct intel_gsc_intf *intf = &gsc->intf[intf_id];
 	int ret;
 
 	intf->irq = -1;
@@ -105,6 +184,8 @@ static void gsc_init_one(struct drm_i915_private *i915,
 
 	if (IS_DG1(i915)) {
 		def = &gsc_def_dg1[intf_id];
+	} else if (IS_XEHPSDV(i915)) {
+		def = &gsc_def_xehpsdv[intf_id];
 	} else if (IS_DG2(i915)) {
 		def = &gsc_def_dg2[intf_id];
 	} else {
@@ -117,10 +198,14 @@ static void gsc_init_one(struct drm_i915_private *i915,
 		return;
 	}
 
+	/* skip irq initialization */
+	if (def->use_polling)
+		goto add_device;
+
 	intf->irq = irq_alloc_desc(0);
 	if (intf->irq < 0) {
 		drm_err(&i915->drm, "gsc irq error %d\n", intf->irq);
-		return;
+		goto fail;
 	}
 
 	ret = gsc_irq_init(intf->irq);
@@ -129,16 +214,31 @@ static void gsc_init_one(struct drm_i915_private *i915,
 		goto fail;
 	}
 
+add_device:
 	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
 	if (!adev)
 		goto fail;
 
+	if (def->lmem_size) {
+		drm_dbg(&i915->drm, "setting up GSC lmem\n");
+
+		if (gsc_ext_om_alloc(gsc, intf, def->lmem_size)) {
+			drm_err(&i915->drm, "setting up gsc extended operational memory failed\n");
+			kfree(adev);
+			goto fail;
+		}
+
+		adev->ext_op_mem.start = i915_gem_object_get_dma_address(intf->gem_obj, 0);
+		adev->ext_op_mem.end = adev->ext_op_mem.start + def->lmem_size;
+	}
+
 	adev->irq = intf->irq;
 	adev->bar.parent = &pdev->resource[0];
 	adev->bar.start = def->bar + pdev->resource[0].start;
 	adev->bar.end = adev->bar.start + def->bar_size - 1;
 	adev->bar.flags = IORESOURCE_MEM;
 	adev->bar.desc = IORES_DESC_NONE;
+	adev->slow_firmware = def->slow_firmware;
 
 	aux_dev = &adev->aux_dev;
 	aux_dev->name = def->name;
@@ -165,7 +265,7 @@ static void gsc_init_one(struct drm_i915_private *i915,
 
 	return;
 fail:
-	gsc_destroy_one(intf);
+	gsc_destroy_one(i915, gsc, intf->id);
 }
 
 static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
@@ -182,10 +282,8 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
 		return;
 	}
 
-	if (gt->gsc.intf[intf_id].irq < 0) {
-		drm_err_ratelimited(&gt->i915->drm, "GSC irq: irq not set");
+	if (gt->gsc.intf[intf_id].irq < 0)
 		return;
-	}
 
 	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
 	if (ret)
@@ -208,7 +306,7 @@ void intel_gsc_init(struct intel_gsc *gsc, struct drm_i915_private *i915)
 		return;
 
 	for (i = 0; i < INTEL_GSC_NUM_INTERFACES; i++)
-		gsc_init_one(i915, &gsc->intf[i], i);
+		gsc_init_one(i915, gsc, i);
 }
 
 void intel_gsc_fini(struct intel_gsc *gsc)
@@ -220,5 +318,5 @@ void intel_gsc_fini(struct intel_gsc *gsc)
 		return;
 
 	for (i = 0; i < INTEL_GSC_NUM_INTERFACES; i++)
-		gsc_destroy_one(&gsc->intf[i]);
+		gsc_destroy_one(gt->i915, gsc, i);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.h b/drivers/gpu/drm/i915/gt/intel_gsc.h
index 68582f912b21..fcac1775e9c3 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.h
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.h
@@ -20,11 +20,14 @@ struct mei_aux_device;
 
 /**
  * struct intel_gsc - graphics security controller
+ *
+ * @gem_obj: scratch memory GSC operations
  * @intf : gsc interface
  */
 struct intel_gsc {
 	struct intel_gsc_intf {
 		struct mei_aux_device *adev;
+		struct drm_i915_gem_object *gem_obj;
 		int irq;
 		unsigned int id;
 	} intf[INTEL_GSC_NUM_INTERFACES];
diff --git a/drivers/misc/mei/bus-fixup.c b/drivers/misc/mei/bus-fixup.c
index 59506ba6fc48..b350cc8d500c 100644
--- a/drivers/misc/mei/bus-fixup.c
+++ b/drivers/misc/mei/bus-fixup.c
@@ -15,6 +15,7 @@
 
 #include "mei_dev.h"
 #include "client.h"
+#include "mkhi.h"
 
 #define MEI_UUID_NFC_INFO UUID_LE(0xd2de1625, 0x382d, 0x417d, \
 			0x48, 0xa4, 0xef, 0xab, 0xba, 0x8a, 0x12, 0x06)
@@ -89,20 +90,6 @@ struct mei_os_ver {
 	u8  reserved2;
 } __packed;
 
-#define MKHI_FEATURE_PTT 0x10
-
-struct mkhi_rule_id {
-	__le16 rule_type;
-	u8 feature_id;
-	u8 reserved;
-} __packed;
-
-struct mkhi_fwcaps {
-	struct mkhi_rule_id id;
-	u8 len;
-	u8 data[];
-} __packed;
-
 struct mkhi_fw_ver_block {
 	u16 minor;
 	u8 major;
@@ -115,22 +102,6 @@ struct mkhi_fw_ver {
 	struct mkhi_fw_ver_block ver[MEI_MAX_FW_VER_BLOCKS];
 } __packed;
 
-#define MKHI_FWCAPS_GROUP_ID 0x3
-#define MKHI_FWCAPS_SET_OS_VER_APP_RULE_CMD 6
-#define MKHI_GEN_GROUP_ID 0xFF
-#define MKHI_GEN_GET_FW_VERSION_CMD 0x2
-struct mkhi_msg_hdr {
-	u8  group_id;
-	u8  command;
-	u8  reserved;
-	u8  result;
-} __packed;
-
-struct mkhi_msg {
-	struct mkhi_msg_hdr hdr;
-	u8 data[];
-} __packed;
-
 #define MKHI_OSVER_BUF_LEN (sizeof(struct mkhi_msg_hdr) + \
 			    sizeof(struct mkhi_fwcaps) + \
 			    sizeof(struct mei_os_ver))
@@ -164,7 +135,6 @@ static int mei_osver(struct mei_cl_device *cldev)
 			    sizeof(struct mkhi_fw_ver))
 #define MKHI_FWVER_LEN(__num) (sizeof(struct mkhi_msg_hdr) + \
 			       sizeof(struct mkhi_fw_ver_block) * (__num))
-#define MKHI_RCV_TIMEOUT 500 /* receive timeout in msec */
 static int mei_fwver(struct mei_cl_device *cldev)
 {
 	char buf[MKHI_FWVER_BUF_LEN];
@@ -187,7 +157,7 @@ static int mei_fwver(struct mei_cl_device *cldev)
 
 	ret = 0;
 	bytes_recv = __mei_cl_recv(cldev->cl, buf, sizeof(buf), NULL, 0,
-				   MKHI_RCV_TIMEOUT);
+				   cldev->bus->timeouts.mkhi_recv);
 	if (bytes_recv < 0 || (size_t)bytes_recv < MKHI_FWVER_LEN(1)) {
 		/*
 		 * Should be at least one version block,
@@ -218,6 +188,19 @@ static int mei_fwver(struct mei_cl_device *cldev)
 	return ret;
 }
 
+static int mei_gfx_memory_ready(struct mei_cl_device *cldev)
+{
+	struct mkhi_gfx_mem_ready req = {0};
+	unsigned int mode = MEI_CL_IO_TX_INTERNAL;
+
+	req.hdr.group_id = MKHI_GROUP_ID_GFX;
+	req.hdr.command = MKHI_GFX_MEMORY_READY_CMD_REQ;
+	req.flags = MKHI_GFX_MEM_READY_PXP_ALLOWED;
+
+	dev_dbg(&cldev->dev, "Sending memory ready command\n");
+	return __mei_cl_send(cldev->cl, (u8 *)&req, sizeof(req), 0, mode);
+}
+
 static void mei_mkhi_fix(struct mei_cl_device *cldev)
 {
 	int ret;
@@ -264,6 +247,39 @@ static void mei_gsc_mkhi_ver(struct mei_cl_device *cldev)
 		dev_err(&cldev->dev, "FW version command failed %d\n", ret);
 	mei_cldev_disable(cldev);
 }
+
+static void mei_gsc_mkhi_fix_ver(struct mei_cl_device *cldev)
+{
+	int ret;
+
+	/* No need to enable the client if nothing is needed from it */
+	if (!cldev->bus->fw_f_fw_ver_supported &&
+	    cldev->bus->pxp_mode != MEI_DEV_PXP_INIT)
+		return;
+
+	ret = mei_cldev_enable(cldev);
+	if (ret)
+		return;
+
+	if (cldev->bus->pxp_mode == MEI_DEV_PXP_INIT) {
+		ret = mei_gfx_memory_ready(cldev);
+		if (ret < 0)
+			dev_err(&cldev->dev, "memory ready command failed %d\n", ret);
+		else
+			dev_dbg(&cldev->dev, "memory ready command sent\n");
+		/* we go to reset after that */
+		cldev->bus->pxp_mode = MEI_DEV_PXP_SETUP;
+		goto out;
+	}
+
+	ret = mei_fwver(cldev);
+	if (ret < 0)
+		dev_err(&cldev->dev, "FW version command failed %d\n",
+			ret);
+out:
+	mei_cldev_disable(cldev);
+}
+
 /**
  * mei_wd - wd client on the bus, change protocol version
  *   as the API has changed.
@@ -503,6 +519,26 @@ static void vt_support(struct mei_cl_device *cldev)
 		cldev->do_match = 1;
 }
 
+/**
+ * pxp_is_ready - enable bus client if pxp is ready
+ *
+ * @cldev: me clients device
+ */
+static void pxp_is_ready(struct mei_cl_device *cldev)
+{
+	struct mei_device *bus = cldev->bus;
+
+	switch (bus->pxp_mode) {
+	case MEI_DEV_PXP_READY:
+	case MEI_DEV_PXP_DEFAULT:
+		cldev->do_match = 1;
+	break;
+	default:
+		cldev->do_match = 0;
+	break;
+	}
+}
+
 #define MEI_FIXUP(_uuid, _hook) { _uuid, _hook }
 
 static struct mei_fixup {
@@ -516,10 +552,10 @@ static struct mei_fixup {
 	MEI_FIXUP(MEI_UUID_WD, mei_wd),
 	MEI_FIXUP(MEI_UUID_MKHIF_FIX, mei_mkhi_fix),
 	MEI_FIXUP(MEI_UUID_IGSC_MKHI, mei_gsc_mkhi_ver),
-	MEI_FIXUP(MEI_UUID_IGSC_MKHI_FIX, mei_gsc_mkhi_ver),
+	MEI_FIXUP(MEI_UUID_IGSC_MKHI_FIX, mei_gsc_mkhi_fix_ver),
 	MEI_FIXUP(MEI_UUID_HDCP, whitelist),
 	MEI_FIXUP(MEI_UUID_ANY, vt_support),
-	MEI_FIXUP(MEI_UUID_PAVP, whitelist),
+	MEI_FIXUP(MEI_UUID_PAVP, pxp_is_ready),
 };
 
 /**
diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index 31264ab2eb13..e7a16d9b2241 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -870,7 +870,7 @@ static int mei_cl_send_disconnect(struct mei_cl *cl, struct mei_cl_cb *cb)
 	}
 
 	list_move_tail(&cb->list, &dev->ctrl_rd_list);
-	cl->timer_count = MEI_CONNECT_TIMEOUT;
+	cl->timer_count = dev->timeouts.connect;
 	mei_schedule_stall_timer(dev);
 
 	return 0;
@@ -945,7 +945,7 @@ static int __mei_cl_disconnect(struct mei_cl *cl)
 	wait_event_timeout(cl->wait,
 			   cl->state == MEI_FILE_DISCONNECT_REPLY ||
 			   cl->state == MEI_FILE_DISCONNECTED,
-			   mei_secs_to_jiffies(MEI_CL_CONNECT_TIMEOUT));
+			   dev->timeouts.cl_connect);
 	mutex_lock(&dev->device_lock);
 
 	rets = cl->status;
@@ -1065,7 +1065,7 @@ static int mei_cl_send_connect(struct mei_cl *cl, struct mei_cl_cb *cb)
 	}
 
 	list_move_tail(&cb->list, &dev->ctrl_rd_list);
-	cl->timer_count = MEI_CONNECT_TIMEOUT;
+	cl->timer_count = dev->timeouts.connect;
 	mei_schedule_stall_timer(dev);
 	return 0;
 }
@@ -1164,7 +1164,7 @@ int mei_cl_connect(struct mei_cl *cl, struct mei_me_client *me_cl,
 			 cl->state == MEI_FILE_DISCONNECTED ||
 			 cl->state == MEI_FILE_DISCONNECT_REQUIRED ||
 			 cl->state == MEI_FILE_DISCONNECT_REPLY),
-			mei_secs_to_jiffies(MEI_CL_CONNECT_TIMEOUT));
+			dev->timeouts.cl_connect);
 	mutex_lock(&dev->device_lock);
 
 	if (!mei_cl_is_connected(cl)) {
@@ -1562,7 +1562,7 @@ int mei_cl_notify_request(struct mei_cl *cl,
 			   cl->notify_en == request ||
 			   cl->status ||
 			   !mei_cl_is_connected(cl),
-			   mei_secs_to_jiffies(MEI_CL_CONNECT_TIMEOUT));
+			   dev->timeouts.cl_connect);
 	mutex_lock(&dev->device_lock);
 
 	if (cl->notify_en != request && !cl->status)
@@ -2336,7 +2336,7 @@ int mei_cl_dma_alloc_and_map(struct mei_cl *cl, const struct file *fp,
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(cl->wait,
 			   cl->dma_mapped || cl->status,
-			   mei_secs_to_jiffies(MEI_CL_CONNECT_TIMEOUT));
+			   dev->timeouts.cl_connect);
 	mutex_lock(&dev->device_lock);
 
 	if (!cl->dma_mapped && !cl->status)
@@ -2415,7 +2415,7 @@ int mei_cl_dma_unmap(struct mei_cl *cl, const struct file *fp)
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(cl->wait,
 			   !cl->dma_mapped || cl->status,
-			   mei_secs_to_jiffies(MEI_CL_CONNECT_TIMEOUT));
+			   dev->timeouts.cl_connect);
 	mutex_lock(&dev->device_lock);
 
 	if (cl->dma_mapped && !cl->status)
diff --git a/drivers/misc/mei/debugfs.c b/drivers/misc/mei/debugfs.c
index 1ce61e9e24fc..4074fec866a6 100644
--- a/drivers/misc/mei/debugfs.c
+++ b/drivers/misc/mei/debugfs.c
@@ -86,6 +86,20 @@ static int mei_dbgfs_active_show(struct seq_file *m, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(mei_dbgfs_active);
 
+static const char *mei_dev_pxp_mode_str(enum mei_dev_pxp_mode state)
+{
+#define MEI_PXP_MODE(state) case MEI_DEV_PXP_##state: return #state
+	switch (state) {
+	MEI_PXP_MODE(DEFAULT);
+	MEI_PXP_MODE(INIT);
+	MEI_PXP_MODE(SETUP);
+	MEI_PXP_MODE(READY);
+	default:
+		return "unknown";
+	}
+#undef MEI_PXP_MODE
+}
+
 static int mei_dbgfs_devstate_show(struct seq_file *m, void *unused)
 {
 	struct mei_device *dev = m->private;
@@ -112,6 +126,9 @@ static int mei_dbgfs_devstate_show(struct seq_file *m, void *unused)
 	seq_printf(m, "pg:  %s, %s\n",
 		   mei_pg_is_enabled(dev) ? "ENABLED" : "DISABLED",
 		   mei_pg_state_str(mei_pg_state(dev)));
+
+	seq_printf(m, "pxp: %s\n", mei_dev_pxp_mode_str(dev->pxp_mode));
+
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(mei_dbgfs_devstate);
diff --git a/drivers/misc/mei/gsc-me.c b/drivers/misc/mei/gsc-me.c
index c8145e9b62b6..75765e4df4ed 100644
--- a/drivers/misc/mei/gsc-me.c
+++ b/drivers/misc/mei/gsc-me.c
@@ -13,6 +13,7 @@
 #include <linux/ktime.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
+#include <linux/kthread.h>
 
 #include "mei_dev.h"
 #include "hw-me.h"
@@ -31,6 +32,17 @@ static int mei_gsc_read_hfs(const struct mei_device *dev, int where, u32 *val)
 	return 0;
 }
 
+static void mei_gsc_set_ext_op_mem(const struct mei_me_hw *hw, struct resource *mem)
+{
+	u32 low = lower_32_bits(mem->start);
+	u32 hi  = upper_32_bits(mem->start);
+	u32 limit = (resource_size(mem) / SZ_4K) | GSC_EXT_OP_MEM_VALID;
+
+	iowrite32(low, hw->mem_addr + H_GSC_EXT_OP_MEM_BASE_ADDR_LO_REG);
+	iowrite32(hi, hw->mem_addr + H_GSC_EXT_OP_MEM_BASE_ADDR_HI_REG);
+	iowrite32(limit, hw->mem_addr + H_GSC_EXT_OP_MEM_LIMIT_REG);
+}
+
 static int mei_gsc_probe(struct auxiliary_device *aux_dev,
 			 const struct auxiliary_device_id *aux_dev_id)
 {
@@ -47,7 +59,7 @@ static int mei_gsc_probe(struct auxiliary_device *aux_dev,
 
 	device = &aux_dev->dev;
 
-	dev = mei_me_dev_init(device, cfg);
+	dev = mei_me_dev_init(device, cfg, adev->slow_firmware);
 	if (!dev) {
 		ret = -ENOMEM;
 		goto err;
@@ -66,13 +78,33 @@ static int mei_gsc_probe(struct auxiliary_device *aux_dev,
 
 	dev_set_drvdata(device, dev);
 
-	ret = devm_request_threaded_irq(device, hw->irq,
-					mei_me_irq_quick_handler,
-					mei_me_irq_thread_handler,
-					IRQF_ONESHOT, KBUILD_MODNAME, dev);
-	if (ret) {
-		dev_err(device, "irq register failed %d\n", ret);
-		goto err;
+	if (adev->ext_op_mem.start) {
+		mei_gsc_set_ext_op_mem(hw, &adev->ext_op_mem);
+		dev->pxp_mode = MEI_DEV_PXP_INIT;
+	}
+
+	/* use polling */
+	if (mei_me_hw_use_polling(hw)) {
+		mei_disable_interrupts(dev);
+		mei_clear_interrupts(dev);
+		init_waitqueue_head(&hw->wait_active);
+		hw->is_active = true; /* start in active mode for initialization */
+		hw->polling_thread = kthread_run(mei_me_polling_thread, dev,
+						 "kmegscirqd/%s", dev_name(device));
+		if (IS_ERR(hw->polling_thread)) {
+			ret = PTR_ERR(hw->polling_thread);
+			dev_err(device, "unable to create kernel thread: %d\n", ret);
+			goto err;
+		}
+	} else {
+		ret = devm_request_threaded_irq(device, hw->irq,
+						mei_me_irq_quick_handler,
+						mei_me_irq_thread_handler,
+						IRQF_ONESHOT, KBUILD_MODNAME, dev);
+		if (ret) {
+			dev_err(device, "irq register failed %d\n", ret);
+			goto err;
+		}
 	}
 
 	pm_runtime_get_noresume(device);
@@ -98,7 +130,8 @@ static int mei_gsc_probe(struct auxiliary_device *aux_dev,
 
 register_err:
 	mei_stop(dev);
-	devm_free_irq(device, hw->irq, dev);
+	if (!mei_me_hw_use_polling(hw))
+		devm_free_irq(device, hw->irq, dev);
 
 err:
 	dev_err(device, "probe failed: %d\n", ret);
@@ -119,12 +152,17 @@ static void mei_gsc_remove(struct auxiliary_device *aux_dev)
 
 	mei_stop(dev);
 
+	hw = to_me_hw(dev);
+	if (mei_me_hw_use_polling(hw))
+		kthread_stop(hw->polling_thread);
+
 	mei_deregister(dev);
 
 	pm_runtime_disable(&aux_dev->dev);
 
 	mei_disable_interrupts(dev);
-	devm_free_irq(&aux_dev->dev, hw->irq, dev);
+	if (!mei_me_hw_use_polling(hw))
+		devm_free_irq(&aux_dev->dev, hw->irq, dev);
 }
 
 static int __maybe_unused mei_gsc_pm_suspend(struct device *device)
@@ -144,11 +182,22 @@ static int __maybe_unused mei_gsc_pm_suspend(struct device *device)
 static int __maybe_unused mei_gsc_pm_resume(struct device *device)
 {
 	struct mei_device *dev = dev_get_drvdata(device);
+	struct auxiliary_device *aux_dev;
+	struct mei_aux_device *adev;
 	int err;
+	struct mei_me_hw *hw;
 
 	if (!dev)
 		return -ENODEV;
 
+	hw = to_me_hw(dev);
+	aux_dev = to_auxiliary_dev(device);
+	adev = auxiliary_dev_to_mei_aux_dev(aux_dev);
+	if (adev->ext_op_mem.start) {
+		mei_gsc_set_ext_op_mem(hw, &adev->ext_op_mem);
+		dev->pxp_mode = MEI_DEV_PXP_INIT;
+	}
+
 	err = mei_restart(dev);
 	if (err)
 		return err;
@@ -185,6 +234,9 @@ static int  __maybe_unused mei_gsc_pm_runtime_suspend(struct device *device)
 	if (mei_write_is_idle(dev)) {
 		hw = to_me_hw(dev);
 		hw->pg_state = MEI_PG_ON;
+
+		if (mei_me_hw_use_polling(hw))
+			hw->is_active = false;
 		ret = 0;
 	} else {
 		ret = -EAGAIN;
@@ -209,6 +261,11 @@ static int __maybe_unused mei_gsc_pm_runtime_resume(struct device *device)
 	hw = to_me_hw(dev);
 	hw->pg_state = MEI_PG_OFF;
 
+	if (mei_me_hw_use_polling(hw)) {
+		hw->is_active = true;
+		wake_up(&hw->wait_active);
+	}
+
 	mutex_unlock(&dev->device_lock);
 
 	irq_ret = mei_me_irq_thread_handler(1, dev);
diff --git a/drivers/misc/mei/hbm.c b/drivers/misc/mei/hbm.c
index cf2b8261da14..708765056af2 100644
--- a/drivers/misc/mei/hbm.c
+++ b/drivers/misc/mei/hbm.c
@@ -232,7 +232,7 @@ int mei_hbm_start_wait(struct mei_device *dev)
 	mutex_unlock(&dev->device_lock);
 	ret = wait_event_timeout(dev->wait_hbm_start,
 			dev->hbm_state != MEI_HBM_STARTING,
-			mei_secs_to_jiffies(MEI_HBM_TIMEOUT));
+			dev->timeouts.hbm);
 	mutex_lock(&dev->device_lock);
 
 	if (ret == 0 && (dev->hbm_state <= MEI_HBM_STARTING)) {
@@ -275,7 +275,7 @@ int mei_hbm_start_req(struct mei_device *dev)
 	}
 
 	dev->hbm_state = MEI_HBM_STARTING;
-	dev->init_clients_timer = MEI_CLIENTS_INIT_TIMEOUT;
+	dev->init_clients_timer = dev->timeouts.client_init;
 	mei_schedule_stall_timer(dev);
 	return 0;
 }
@@ -316,7 +316,7 @@ static int mei_hbm_dma_setup_req(struct mei_device *dev)
 	}
 
 	dev->hbm_state = MEI_HBM_DR_SETUP;
-	dev->init_clients_timer = MEI_CLIENTS_INIT_TIMEOUT;
+	dev->init_clients_timer = dev->timeouts.client_init;
 	mei_schedule_stall_timer(dev);
 	return 0;
 }
@@ -351,7 +351,7 @@ static int mei_hbm_capabilities_req(struct mei_device *dev)
 	}
 
 	dev->hbm_state = MEI_HBM_CAP_SETUP;
-	dev->init_clients_timer = MEI_CLIENTS_INIT_TIMEOUT;
+	dev->init_clients_timer = dev->timeouts.client_init;
 	mei_schedule_stall_timer(dev);
 	return 0;
 }
@@ -385,7 +385,7 @@ static int mei_hbm_enum_clients_req(struct mei_device *dev)
 		return ret;
 	}
 	dev->hbm_state = MEI_HBM_ENUM_CLIENTS;
-	dev->init_clients_timer = MEI_CLIENTS_INIT_TIMEOUT;
+	dev->init_clients_timer = dev->timeouts.client_init;
 	mei_schedule_stall_timer(dev);
 	return 0;
 }
@@ -751,7 +751,7 @@ static int mei_hbm_prop_req(struct mei_device *dev, unsigned long start_idx)
 		return ret;
 	}
 
-	dev->init_clients_timer = MEI_CLIENTS_INIT_TIMEOUT;
+	dev->init_clients_timer = dev->timeouts.client_init;
 	mei_schedule_stall_timer(dev);
 
 	return 0;
diff --git a/drivers/misc/mei/hw-me-regs.h b/drivers/misc/mei/hw-me-regs.h
index 15e8e2b322b1..8049f288f74c 100644
--- a/drivers/misc/mei/hw-me-regs.h
+++ b/drivers/misc/mei/hw-me-regs.h
@@ -127,6 +127,8 @@
 #  define PCI_CFG_HFS_3_FW_SKU_SPS   0x00000060
 #define PCI_CFG_HFS_4         0x64
 #define PCI_CFG_HFS_5         0x68
+#  define GSC_CFG_HFS_5_BOOT_TYPE_MSK      0x00000003
+#  define GSC_CFG_HFS_5_BOOT_TYPE_PXP               3
 #define PCI_CFG_HFS_6         0x6C
 
 /* MEI registers */
@@ -143,6 +145,11 @@
 /* H_D0I3C - D0I3 Control  */
 #define H_D0I3C    0x800
 
+#define H_GSC_EXT_OP_MEM_BASE_ADDR_LO_REG 0x100
+#define H_GSC_EXT_OP_MEM_BASE_ADDR_HI_REG 0x104
+#define H_GSC_EXT_OP_MEM_LIMIT_REG        0x108
+#define GSC_EXT_OP_MEM_VALID              BIT(31)
+
 /* register bits of H_CSR (Host Control Status register) */
 /* Host Circular Buffer Depth - maximum number of 32-bit entries in CB */
 #define H_CBD             0xFF000000
diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index 3a95fe7d4e33..ed3f361fd3a6 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
 #include <linux/sizes.h>
+#include <linux/delay.h>
 
 #include "mei_dev.h"
 #include "hbm.h"
@@ -327,9 +328,12 @@ static void mei_me_intr_clear(struct mei_device *dev)
  */
 static void mei_me_intr_enable(struct mei_device *dev)
 {
-	u32 hcsr = mei_hcsr_read(dev);
+	u32 hcsr;
 
-	hcsr |= H_CSR_IE_MASK;
+	if (mei_me_hw_use_polling(to_me_hw(dev)))
+		return;
+
+	hcsr = mei_hcsr_read(dev) | H_CSR_IE_MASK;
 	mei_hcsr_set(dev, hcsr);
 }
 
@@ -354,6 +358,9 @@ static void mei_me_synchronize_irq(struct mei_device *dev)
 {
 	struct mei_me_hw *hw = to_me_hw(dev);
 
+	if (mei_me_hw_use_polling(hw))
+		return;
+
 	synchronize_irq(hw->irq);
 }
 
@@ -380,7 +387,10 @@ static void mei_me_host_set_ready(struct mei_device *dev)
 {
 	u32 hcsr = mei_hcsr_read(dev);
 
-	hcsr |= H_CSR_IE_MASK | H_IG | H_RDY;
+	if (!mei_me_hw_use_polling(to_me_hw(dev)))
+		hcsr |= H_CSR_IE_MASK;
+
+	hcsr |=  H_IG | H_RDY;
 	mei_hcsr_set(dev, hcsr);
 }
 
@@ -423,6 +433,29 @@ static bool mei_me_hw_is_resetting(struct mei_device *dev)
 	return (mecsr & ME_RST_HRA) == ME_RST_HRA;
 }
 
+/**
+ * mei_gsc_pxp_check - check for gsc firmware entering pxp mode
+ *
+ * @dev: the device structure
+ */
+static void mei_gsc_pxp_check(struct mei_device *dev)
+{
+	struct mei_me_hw *hw = to_me_hw(dev);
+	u32 fwsts5 = 0;
+
+	if (dev->pxp_mode == MEI_DEV_PXP_DEFAULT)
+		return;
+
+	hw->read_fws(dev, PCI_CFG_HFS_5, &fwsts5);
+	trace_mei_pci_cfg_read(dev->dev, "PCI_CFG_HFS_5", PCI_CFG_HFS_5, fwsts5);
+	if ((fwsts5 & GSC_CFG_HFS_5_BOOT_TYPE_MSK) == GSC_CFG_HFS_5_BOOT_TYPE_PXP) {
+		dev_dbg(dev->dev, "pxp mode is ready 0x%08x\n", fwsts5);
+		dev->pxp_mode = MEI_DEV_PXP_READY;
+	} else {
+		dev_dbg(dev->dev, "pxp mode is not ready 0x%08x\n", fwsts5);
+	}
+}
+
 /**
  * mei_me_hw_ready_wait - wait until the me(hw) has turned ready
  *  or timeout is reached
@@ -435,13 +468,15 @@ static int mei_me_hw_ready_wait(struct mei_device *dev)
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(dev->wait_hw_ready,
 			dev->recvd_hw_ready,
-			mei_secs_to_jiffies(MEI_HW_READY_TIMEOUT));
+			dev->timeouts.hw_ready);
 	mutex_lock(&dev->device_lock);
 	if (!dev->recvd_hw_ready) {
 		dev_err(dev->dev, "wait hw ready failed\n");
 		return -ETIME;
 	}
 
+	mei_gsc_pxp_check(dev);
+
 	mei_me_hw_reset_release(dev);
 	dev->recvd_hw_ready = false;
 	return 0;
@@ -697,7 +732,6 @@ static void mei_me_pg_unset(struct mei_device *dev)
 static int mei_me_pg_legacy_enter_sync(struct mei_device *dev)
 {
 	struct mei_me_hw *hw = to_me_hw(dev);
-	unsigned long timeout = mei_secs_to_jiffies(MEI_PGI_TIMEOUT);
 	int ret;
 
 	dev->pg_event = MEI_PG_EVENT_WAIT;
@@ -708,7 +742,8 @@ static int mei_me_pg_legacy_enter_sync(struct mei_device *dev)
 
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(dev->wait_pg,
-		dev->pg_event == MEI_PG_EVENT_RECEIVED, timeout);
+		dev->pg_event == MEI_PG_EVENT_RECEIVED,
+		dev->timeouts.pgi);
 	mutex_lock(&dev->device_lock);
 
 	if (dev->pg_event == MEI_PG_EVENT_RECEIVED) {
@@ -734,7 +769,6 @@ static int mei_me_pg_legacy_enter_sync(struct mei_device *dev)
 static int mei_me_pg_legacy_exit_sync(struct mei_device *dev)
 {
 	struct mei_me_hw *hw = to_me_hw(dev);
-	unsigned long timeout = mei_secs_to_jiffies(MEI_PGI_TIMEOUT);
 	int ret;
 
 	if (dev->pg_event == MEI_PG_EVENT_RECEIVED)
@@ -746,7 +780,8 @@ static int mei_me_pg_legacy_exit_sync(struct mei_device *dev)
 
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(dev->wait_pg,
-		dev->pg_event == MEI_PG_EVENT_RECEIVED, timeout);
+		dev->pg_event == MEI_PG_EVENT_RECEIVED,
+		dev->timeouts.pgi);
 	mutex_lock(&dev->device_lock);
 
 reply:
@@ -762,7 +797,8 @@ static int mei_me_pg_legacy_exit_sync(struct mei_device *dev)
 
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(dev->wait_pg,
-		dev->pg_event == MEI_PG_EVENT_INTR_RECEIVED, timeout);
+		dev->pg_event == MEI_PG_EVENT_INTR_RECEIVED,
+		dev->timeouts.pgi);
 	mutex_lock(&dev->device_lock);
 
 	if (dev->pg_event == MEI_PG_EVENT_INTR_RECEIVED)
@@ -877,8 +913,6 @@ static u32 mei_me_d0i3_unset(struct mei_device *dev)
 static int mei_me_d0i3_enter_sync(struct mei_device *dev)
 {
 	struct mei_me_hw *hw = to_me_hw(dev);
-	unsigned long d0i3_timeout = mei_secs_to_jiffies(MEI_D0I3_TIMEOUT);
-	unsigned long pgi_timeout = mei_secs_to_jiffies(MEI_PGI_TIMEOUT);
 	int ret;
 	u32 reg;
 
@@ -900,7 +934,8 @@ static int mei_me_d0i3_enter_sync(struct mei_device *dev)
 
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(dev->wait_pg,
-		dev->pg_event == MEI_PG_EVENT_RECEIVED, pgi_timeout);
+		dev->pg_event == MEI_PG_EVENT_RECEIVED,
+		dev->timeouts.pgi);
 	mutex_lock(&dev->device_lock);
 
 	if (dev->pg_event != MEI_PG_EVENT_RECEIVED) {
@@ -920,7 +955,8 @@ static int mei_me_d0i3_enter_sync(struct mei_device *dev)
 
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(dev->wait_pg,
-		dev->pg_event == MEI_PG_EVENT_INTR_RECEIVED, d0i3_timeout);
+		dev->pg_event == MEI_PG_EVENT_INTR_RECEIVED,
+		dev->timeouts.d0i3);
 	mutex_lock(&dev->device_lock);
 
 	if (dev->pg_event != MEI_PG_EVENT_INTR_RECEIVED) {
@@ -980,7 +1016,6 @@ static int mei_me_d0i3_enter(struct mei_device *dev)
 static int mei_me_d0i3_exit_sync(struct mei_device *dev)
 {
 	struct mei_me_hw *hw = to_me_hw(dev);
-	unsigned long timeout = mei_secs_to_jiffies(MEI_D0I3_TIMEOUT);
 	int ret;
 	u32 reg;
 
@@ -1003,7 +1038,8 @@ static int mei_me_d0i3_exit_sync(struct mei_device *dev)
 
 	mutex_unlock(&dev->device_lock);
 	wait_event_timeout(dev->wait_pg,
-		dev->pg_event == MEI_PG_EVENT_INTR_RECEIVED, timeout);
+		dev->pg_event == MEI_PG_EVENT_INTR_RECEIVED,
+		dev->timeouts.pgi);
 	mutex_lock(&dev->device_lock);
 
 	if (dev->pg_event != MEI_PG_EVENT_INTR_RECEIVED) {
@@ -1176,7 +1212,7 @@ static int mei_me_hw_reset(struct mei_device *dev, bool intr_enable)
 
 	hcsr |= H_RST | H_IG | H_CSR_IS_MASK;
 
-	if (!intr_enable)
+	if (!intr_enable || mei_me_hw_use_polling(to_me_hw(dev)))
 		hcsr &= ~H_CSR_IE_MASK;
 
 	dev->recvd_hw_ready = false;
@@ -1259,7 +1295,8 @@ irqreturn_t mei_me_irq_thread_handler(int irq, void *dev_id)
 
 	/* check if ME wants a reset */
 	if (!mei_hw_is_ready(dev) && dev->dev_state != MEI_DEV_RESETTING) {
-		dev_warn(dev->dev, "FW not ready: resetting.\n");
+		dev_warn(dev->dev, "FW not ready: resetting: dev_state = %d pxp = %d\n",
+			 dev->dev_state, dev->pxp_mode);
 		if (dev->dev_state == MEI_DEV_POWERING_DOWN ||
 		    dev->dev_state == MEI_DEV_POWER_DOWN)
 			mei_cl_all_disconnect(dev);
@@ -1331,6 +1368,46 @@ irqreturn_t mei_me_irq_thread_handler(int irq, void *dev_id)
 }
 EXPORT_SYMBOL_GPL(mei_me_irq_thread_handler);
 
+#define MEI_POLLING_TIMEOUT_ACTIVE 100
+#define MEI_POLLING_TIMEOUT_IDLE   500
+
+int mei_me_polling_thread(void *_dev)
+{
+	struct mei_device *dev = _dev;
+	irqreturn_t irq_ret;
+	long polling_timeout = MEI_POLLING_TIMEOUT_ACTIVE;
+
+	dev_dbg(dev->dev, "kernel thread is running\n");
+	while (!kthread_should_stop()) {
+		struct mei_me_hw *hw = to_me_hw(dev);
+		u32 hcsr;
+
+		wait_event_timeout(hw->wait_active,
+				   hw->is_active || kthread_should_stop(),
+				   msecs_to_jiffies(MEI_POLLING_TIMEOUT_IDLE));
+
+		if (kthread_should_stop())
+			break;
+
+		hcsr = mei_hcsr_read(dev);
+		if (me_intr_src(hcsr)) {
+			polling_timeout = MEI_POLLING_TIMEOUT_ACTIVE;
+			irq_ret = mei_me_irq_thread_handler(1, dev);
+			if (irq_ret != IRQ_HANDLED)
+				dev_err(dev->dev, "irq_ret %d\n", irq_ret);
+		} else {
+			polling_timeout = clamp_val(polling_timeout + MEI_POLLING_TIMEOUT_ACTIVE,
+						    MEI_POLLING_TIMEOUT_ACTIVE,
+						    MEI_POLLING_TIMEOUT_IDLE);
+		}
+
+		schedule_timeout_interruptible(msecs_to_jiffies(polling_timeout));
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mei_me_polling_thread);
+
 static const struct mei_hw_ops mei_me_hw_ops = {
 
 	.trc_status = mei_me_trc_status,
@@ -1636,11 +1713,12 @@ EXPORT_SYMBOL_GPL(mei_me_get_cfg);
  *
  * @parent: device associated with physical device (pci/platform)
  * @cfg: per device generation config
+ * @slow_fw: configure longer timeouts as FW is slow
  *
  * Return: The mei_device pointer on success, NULL on failure.
  */
 struct mei_device *mei_me_dev_init(struct device *parent,
-				   const struct mei_cfg *cfg)
+				   const struct mei_cfg *cfg, bool slow_fw)
 {
 	struct mei_device *dev;
 	struct mei_me_hw *hw;
@@ -1655,7 +1733,7 @@ struct mei_device *mei_me_dev_init(struct device *parent,
 	for (i = 0; i < DMA_DSCR_NUM; i++)
 		dev->dr_dscr[i].size = cfg->dma_size[i];
 
-	mei_device_init(dev, parent, &mei_me_hw_ops);
+	mei_device_init(dev, parent, slow_fw, &mei_me_hw_ops);
 	hw->cfg = cfg;
 
 	dev->fw_f_fw_ver_supported = cfg->fw_ver_supported;
diff --git a/drivers/misc/mei/hw-me.h b/drivers/misc/mei/hw-me.h
index a071c645e905..0e9d90808bcf 100644
--- a/drivers/misc/mei/hw-me.h
+++ b/drivers/misc/mei/hw-me.h
@@ -51,6 +51,8 @@ struct mei_cfg {
  * @d0i3_supported: di03 support
  * @hbuf_depth: depth of hardware host/write buffer in slots
  * @read_fws: read FW status register handler
+ * @wait_active: the polling thread activity wait queue
+ * @is_active: the device is active
  */
 struct mei_me_hw {
 	const struct mei_cfg *cfg;
@@ -60,10 +62,19 @@ struct mei_me_hw {
 	bool d0i3_supported;
 	u8 hbuf_depth;
 	int (*read_fws)(const struct mei_device *dev, int where, u32 *val);
+	/* polling */
+	struct task_struct *polling_thread;
+	wait_queue_head_t wait_active;
+	bool is_active;
 };
 
 #define to_me_hw(dev) (struct mei_me_hw *)((dev)->hw)
 
+static inline bool mei_me_hw_use_polling(const struct mei_me_hw *hw)
+{
+	return hw->irq < 0;
+}
+
 /**
  * enum mei_cfg_idx - indices to platform specific configurations.
  *
@@ -120,12 +131,13 @@ enum mei_cfg_idx {
 const struct mei_cfg *mei_me_get_cfg(kernel_ulong_t idx);
 
 struct mei_device *mei_me_dev_init(struct device *parent,
-				   const struct mei_cfg *cfg);
+				   const struct mei_cfg *cfg, bool slow_fw);
 
 int mei_me_pg_enter_sync(struct mei_device *dev);
 int mei_me_pg_exit_sync(struct mei_device *dev);
 
 irqreturn_t mei_me_irq_quick_handler(int irq, void *dev_id);
 irqreturn_t mei_me_irq_thread_handler(int irq, void *dev_id);
+int mei_me_polling_thread(void *_dev);
 
 #endif /* _MEI_INTERFACE_H_ */
diff --git a/drivers/misc/mei/hw-txe.c b/drivers/misc/mei/hw-txe.c
index 00652c137cc7..fccfa806bd63 100644
--- a/drivers/misc/mei/hw-txe.c
+++ b/drivers/misc/mei/hw-txe.c
@@ -1201,7 +1201,7 @@ struct mei_device *mei_txe_dev_init(struct pci_dev *pdev)
 	if (!dev)
 		return NULL;
 
-	mei_device_init(dev, &pdev->dev, &mei_txe_hw_ops);
+	mei_device_init(dev, &pdev->dev, false, &mei_txe_hw_ops);
 
 	hw = to_txe_hw(dev);
 
diff --git a/drivers/misc/mei/hw.h b/drivers/misc/mei/hw.h
index b46077b17114..9381e5c13b4f 100644
--- a/drivers/misc/mei/hw.h
+++ b/drivers/misc/mei/hw.h
@@ -16,11 +16,16 @@
 #define MEI_CONNECT_TIMEOUT         3  /* HPS: at least 2 seconds */
 
 #define MEI_CL_CONNECT_TIMEOUT     15  /* HPS: Client Connect Timeout */
+#define MEI_CL_CONNECT_TIMEOUT_SLOW 30 /* HPS: Client Connect Timeout, slow FW */
 #define MEI_CLIENTS_INIT_TIMEOUT   15  /* HPS: Clients Enumeration Timeout */
 
 #define MEI_PGI_TIMEOUT             1  /* PG Isolation time response 1 sec */
 #define MEI_D0I3_TIMEOUT            5  /* D0i3 set/unset max response time */
 #define MEI_HBM_TIMEOUT             1  /* 1 second */
+#define MEI_HBM_TIMEOUT_SLOW        5  /* 5 second, slow FW */
+
+#define MKHI_RCV_TIMEOUT 500 /* receive timeout in msec */
+#define MKHI_RCV_TIMEOUT_SLOW 10000 /* receive timeout in msec, slow FW */
 
 /*
  * FW page size for DMA allocations
diff --git a/drivers/misc/mei/init.c b/drivers/misc/mei/init.c
index eb052005ca86..ce030a882d0c 100644
--- a/drivers/misc/mei/init.c
+++ b/drivers/misc/mei/init.c
@@ -320,6 +320,8 @@ void mei_stop(struct mei_device *dev)
 
 	mei_clear_interrupts(dev);
 	mei_synchronize_irq(dev);
+	/* to catch HW-initiated reset */
+	mei_cancel_work(dev);
 
 	mutex_lock(&dev->device_lock);
 
@@ -357,14 +359,16 @@ bool mei_write_is_idle(struct mei_device *dev)
 EXPORT_SYMBOL_GPL(mei_write_is_idle);
 
 /**
- * mei_device_init  -- initialize mei_device structure
+ * mei_device_init - initialize mei_device structure
  *
  * @dev: the mei device
  * @device: the device structure
+ * @slow_fw: configure longer timeouts as FW is slow
  * @hw_ops: hw operations
  */
 void mei_device_init(struct mei_device *dev,
 		     struct device *device,
+		     bool slow_fw,
 		     const struct mei_hw_ops *hw_ops)
 {
 	/* setup our list array */
@@ -402,6 +406,21 @@ void mei_device_init(struct mei_device *dev,
 	dev->pg_event = MEI_PG_EVENT_IDLE;
 	dev->ops      = hw_ops;
 	dev->dev      = device;
+
+	dev->timeouts.hw_ready = mei_secs_to_jiffies(MEI_HW_READY_TIMEOUT);
+	dev->timeouts.connect = MEI_CONNECT_TIMEOUT;
+	dev->timeouts.client_init = MEI_CLIENTS_INIT_TIMEOUT;
+	dev->timeouts.pgi = mei_secs_to_jiffies(MEI_PGI_TIMEOUT);
+	dev->timeouts.d0i3 = mei_secs_to_jiffies(MEI_D0I3_TIMEOUT);
+	if (slow_fw) {
+		dev->timeouts.cl_connect = mei_secs_to_jiffies(MEI_CL_CONNECT_TIMEOUT_SLOW);
+		dev->timeouts.hbm = mei_secs_to_jiffies(MEI_HBM_TIMEOUT_SLOW);
+		dev->timeouts.mkhi_recv = msecs_to_jiffies(MKHI_RCV_TIMEOUT_SLOW);
+	} else {
+		dev->timeouts.cl_connect = mei_secs_to_jiffies(MEI_CL_CONNECT_TIMEOUT);
+		dev->timeouts.hbm = mei_secs_to_jiffies(MEI_HBM_TIMEOUT);
+		dev->timeouts.mkhi_recv = msecs_to_jiffies(MKHI_RCV_TIMEOUT);
+	}
 }
 EXPORT_SYMBOL_GPL(mei_device_init);
 
diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 786f7c8f7f61..261939b945ef 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -571,7 +571,7 @@ static int mei_ioctl_connect_vtag(struct file *file,
 				    cl->state == MEI_FILE_DISCONNECTED ||
 				    cl->state == MEI_FILE_DISCONNECT_REQUIRED ||
 				    cl->state == MEI_FILE_DISCONNECT_REPLY),
-				   mei_secs_to_jiffies(MEI_CL_CONNECT_TIMEOUT));
+				   dev->timeouts.cl_connect);
 		mutex_lock(&dev->device_lock);
 	}
 
diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
index 694f866f87ef..7c508bca9a00 100644
--- a/drivers/misc/mei/mei_dev.h
+++ b/drivers/misc/mei/mei_dev.h
@@ -62,6 +62,14 @@ enum mei_dev_state {
 	MEI_DEV_POWER_UP
 };
 
+/* MEI PXP mode state */
+enum mei_dev_pxp_mode {
+	MEI_DEV_PXP_DEFAULT = 0,
+	MEI_DEV_PXP_INIT    = 1,
+	MEI_DEV_PXP_SETUP   = 2,
+	MEI_DEV_PXP_READY   = 3,
+};
+
 const char *mei_dev_state_str(int state);
 
 enum mei_file_transaction_states {
@@ -415,6 +423,17 @@ struct mei_fw_version {
 
 #define MEI_MAX_FW_VER_BLOCKS 3
 
+struct mei_dev_timeouts {
+	unsigned long hw_ready; /* Timeout on ready message, in jiffies */
+	int connect; /* HPS: at least 2 seconds, in seconds */
+	unsigned long cl_connect; /* HPS: Client Connect Timeout, in jiffies */
+	int client_init; /* HPS: Clients Enumeration Timeout, in seconds */
+	unsigned long pgi; /* PG Isolation time response, in jiffies */
+	unsigned int d0i3; /* D0i3 set/unset max response time, in jiffies */
+	unsigned long hbm; /* HBM operation timeout, in jiffies */
+	unsigned long mkhi_recv; /* receive timeout, in jiffies */
+};
+
 /**
  * struct mei_device -  MEI private device struct
  *
@@ -443,6 +462,7 @@ struct mei_fw_version {
  * @reset_count : number of consecutive resets
  * @dev_state   : device state
  * @hbm_state   : state of host bus message protocol
+ * @pxp_mode    : PXP device mode
  * @init_clients_timer : HBM init handshake timeout
  *
  * @pg_event    : power gating event
@@ -480,6 +500,8 @@ struct mei_fw_version {
  * @allow_fixed_address: allow user space to connect a fixed client
  * @override_fixed_address: force allow fixed address behavior
  *
+ * @timeouts: actual timeout values
+ *
  * @reset_work  : work item for the device reset
  * @bus_rescan_work : work item for the bus rescan
  *
@@ -524,6 +546,7 @@ struct mei_device {
 	unsigned long reset_count;
 	enum mei_dev_state dev_state;
 	enum mei_hbm_state hbm_state;
+	enum mei_dev_pxp_mode pxp_mode;
 	u16 init_clients_timer;
 
 	/*
@@ -568,6 +591,8 @@ struct mei_device {
 	bool allow_fixed_address;
 	bool override_fixed_address;
 
+	struct mei_dev_timeouts timeouts;
+
 	struct work_struct reset_work;
 	struct work_struct bus_rescan_work;
 
@@ -632,6 +657,7 @@ static inline u32 mei_slots2data(int slots)
  */
 void mei_device_init(struct mei_device *dev,
 		     struct device *device,
+		     bool slow_fw,
 		     const struct mei_hw_ops *hw_ops);
 int mei_reset(struct mei_device *dev);
 int mei_start(struct mei_device *dev);
diff --git a/drivers/misc/mei/mkhi.h b/drivers/misc/mei/mkhi.h
new file mode 100644
index 000000000000..056b76e73d40
--- /dev/null
+++ b/drivers/misc/mei/mkhi.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2003-2021, Intel Corporation. All rights reserved.
+ * Intel Management Engine Interface (Intel MEI) Linux driver
+ */
+
+#ifndef _MEI_MKHI_H_
+#define _MEI_MKHI_H_
+
+#include "mei_dev.h"
+
+#define MKHI_FEATURE_PTT 0x10
+
+#define MKHI_FWCAPS_GROUP_ID 0x3
+#define MKHI_FWCAPS_SET_OS_VER_APP_RULE_CMD 6
+#define MKHI_GEN_GROUP_ID 0xFF
+#define MKHI_GEN_GET_FW_VERSION_CMD 0x2
+
+#define MCHI_GROUP_ID  0xA
+
+#define MKHI_GROUP_ID_GFX              0x30
+#define MKHI_GFX_RESET_WARN_CMD_REQ    0x0
+#define MKHI_GFX_MEMORY_READY_CMD_REQ  0x1
+
+/* Allow transition to PXP mode without approval */
+#define MKHI_GFX_MEM_READY_PXP_ALLOWED  0x1
+
+struct mkhi_rule_id {
+	__le16 rule_type;
+	u8 feature_id;
+	u8 reserved;
+} __packed;
+
+struct mkhi_fwcaps {
+	struct mkhi_rule_id id;
+	u8 len;
+	u8 data[];
+} __packed;
+
+struct mkhi_msg_hdr {
+	u8  group_id;
+	u8  command;
+	u8  reserved;
+	u8  result;
+} __packed;
+
+struct mkhi_msg {
+	struct mkhi_msg_hdr hdr;
+	u8 data[];
+} __packed;
+
+struct mkhi_gfx_mem_ready {
+	struct mkhi_msg_hdr hdr;
+	u32    flags;
+} __packed;
+
+#endif /* _MEI_MKHI_H_ */
diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index 5435604327a7..b5af4e79bd52 100644
--- a/drivers/misc/mei/pci-me.c
+++ b/drivers/misc/mei/pci-me.c
@@ -203,7 +203,7 @@ static int mei_me_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	/* allocates and initializes the mei dev structure */
-	dev = mei_me_dev_init(&pdev->dev, cfg);
+	dev = mei_me_dev_init(&pdev->dev, cfg, false);
 	if (!dev) {
 		err = -ENOMEM;
 		goto end;
diff --git a/include/linux/mei_aux.h b/include/linux/mei_aux.h
index 587f25128848..506912ad363b 100644
--- a/include/linux/mei_aux.h
+++ b/include/linux/mei_aux.h
@@ -7,10 +7,22 @@
 
 #include <linux/auxiliary_bus.h>
 
+/**
+ * struct mei_aux_device - mei auxiliary device
+ * @aux_dev: - auxiliary device object
+ * @irq: interrupt driving the mei auxiliary device
+ * @bar: mmio resource bar reserved to mei auxiliary device
+ * @ext_op_mem: resource for extend operational memory
+ *              used in graphics PXP mode.
+ * @slow_firmware: The device has slow underlying firmware.
+ *                 Such firmware will require to use larger operation timeouts.
+ */
 struct mei_aux_device {
 	struct auxiliary_device aux_dev;
 	int irq;
 	struct resource bar;
+	struct resource ext_op_mem;
+	bool slow_firmware;
 };
 
 #define auxiliary_dev_to_mei_aux_dev(auxiliary_dev) \
-- 
2.37.2

