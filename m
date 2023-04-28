Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDEC6F1E60
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 20:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E05A10EDB4;
	Fri, 28 Apr 2023 18:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C444210E138;
 Fri, 28 Apr 2023 18:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682708302; x=1714244302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nKtrQFMQPAoZEAbF1XDf35lolS7uimyl0XIkKrgjKVA=;
 b=BY7cIP+XXnzuOrFBOaA1EISsUNYKw2PTQggSiA2IWFCYkKpiAFoX772p
 4CE6jJoofbhQdhnsRcjQCig77QofPquRC4CuPlF+4sGFXiI+Bte3Fiwy5
 i01YjUgjezK1e1mSImywIptHAcpgcvNnEwLBkRBuIvyl5vlwYhwku0gq+
 psgu+Pu0Lky+JYZzm/FibSz6POt2gvCr+oyc98ETgXDsP6y+w5igIIVrb
 tXYh67pknINAYzQrbH3pmLEcjPTfScTphPAGV5x9Q214YxDnhNb3kis6X
 Y55dd+JbJBdGbHLoECAmOn6AhtGtwuZ8xADJKqjd4zd6MX0XafeF+nZg7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="350747152"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="350747152"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="645254579"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="645254579"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:58:22 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/8] DO NOT REVIEW: drm/i915: Add support for MTL GSC SW
 Proxy
Date: Fri, 28 Apr 2023 11:58:03 -0700
Message-Id: <20230428185810.4127234-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a squash of the GSC proxy series, which is being reviewed
separately [1]. It's being included here because some of the patches in
this series depend on it. This is not a functional dependencies, the
patches just touch the same code and the proxy patches are planned to be
merged first, so it is easier to base the new patches on top of it.

[1] https://patchwork.freedesktop.org/series/115806/
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  22 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  | 424 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h  |  18 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  66 ++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  17 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
 drivers/misc/mei/Kconfig                      |   2 +-
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/gsc_proxy/Kconfig            |  14 +
 drivers/misc/mei/gsc_proxy/Makefile           |   7 +
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c    | 208 +++++++++
 include/drm/i915_component.h                  |   3 +-
 include/drm/i915_gsc_proxy_mei_interface.h    |  53 +++
 15 files changed, 830 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
 create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
 create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
 create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 9af76e376ca9..f2ac803e35b4 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -194,6 +194,7 @@ i915-y += \
 # general-purpose microcontroller (GuC) support
 i915-y += \
 	  gt/uc/intel_gsc_fw.o \
+	  gt/uc/intel_gsc_proxy.o \
 	  gt/uc/intel_gsc_uc.o \
 	  gt/uc/intel_gsc_uc_heci_cmd_submit.o\
 	  gt/uc/intel_guc.o \
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index c0f3ff4746ad..95e59ed6651d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -16,6 +16,7 @@
 #include "intel_uncore.h"
 #include "intel_rps.h"
 #include "pxp/intel_pxp_irq.h"
+#include "uc/intel_gsc_proxy.h"
 
 static void guc_irq_handler(struct intel_guc *guc, u16 iir)
 {
@@ -82,6 +83,9 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 	if (instance == OTHER_GSC_INSTANCE)
 		return intel_gsc_irq_handler(gt, iir);
 
+	if (instance == OTHER_GSC_HECI_2_INSTANCE)
+		return intel_gsc_proxy_irq_handler(&gt->uc.gsc, iir);
+
 	WARN_ONCE(1, "unhandled other interrupt instance=0x%x, iir=0x%x\n",
 		  instance, iir);
 }
@@ -101,6 +105,8 @@ static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
 	case VIDEO_ENHANCEMENT_CLASS:
 		return media_gt;
 	case OTHER_CLASS:
+		if (instance == OTHER_GSC_HECI_2_INSTANCE)
+			return media_gt;
 		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
 			return media_gt;
 		fallthrough;
@@ -257,6 +263,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	u32 irqs = GT_RENDER_USER_INTERRUPT;
 	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
 	u32 gsc_mask = 0;
+	u32 heci_mask = 0;
 	u32 dmask;
 	u32 smask;
 
@@ -268,10 +275,16 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	dmask = irqs << 16 | irqs;
 	smask = irqs << 16;
 
-	if (HAS_ENGINE(gt, GSC0))
+	if (HAS_ENGINE(gt, GSC0)) {
+		/*
+		 * the heci2 interrupt is enabled via the same register as the
+		 * GSC interrupt, but it has its own mask register.
+		 */
 		gsc_mask = irqs;
-	else if (HAS_HECI_GSC(gt->i915))
+		heci_mask = GSC_IRQ_INTF(1); /* HECI2 IRQ for SW Proxy*/
+	} else if (HAS_HECI_GSC(gt->i915)) {
 		gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
+	}
 
 	BUILD_BUG_ON(irqs & 0xffff0000);
 
@@ -281,7 +294,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	if (CCS_MASK(gt))
 		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
 	if (gsc_mask)
-		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, gsc_mask);
+		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, gsc_mask | heci_mask);
 
 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
@@ -309,6 +322,9 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
 	if (gsc_mask)
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
+	if (heci_mask)
+		intel_uncore_write(uncore, GEN12_HECI2_RSVD_INTR_MASK,
+				   ~REG_FIELD_PREP(ENGINE1_MASK, heci_mask));
 
 	if (guc_mask) {
 		/* the enable bit is common for both GTs but the masks are separate */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index af80d2fe739b..b8a39c219b60 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1596,6 +1596,7 @@
 
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
+#define   GEN12_HECI_2				(30)
 #define   GEN11_GUNIT				(28)
 #define   GEN11_GUC				(25)
 #define   MTL_MGUC				(24)
@@ -1637,6 +1638,7 @@
 /* irq instances for OTHER_CLASS */
 #define   OTHER_GUC_INSTANCE			0
 #define   OTHER_GTPM_INSTANCE			1
+#define   OTHER_GSC_HECI_2_INSTANCE		3
 #define   OTHER_KCR_INSTANCE			4
 #define   OTHER_GSC_INSTANCE			6
 #define   OTHER_MEDIA_GUC_INSTANCE		16
@@ -1652,6 +1654,7 @@
 #define GEN12_VCS6_VCS7_INTR_MASK		_MMIO(0x1900b4)
 #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
 #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
+#define GEN12_HECI2_RSVD_INTR_MASK		_MMIO(0x1900e4)
 #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
 #define MTL_GUC_MGUC_INTR_MASK			_MMIO(0x1900e8) /* MTL+ */
 #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
new file mode 100644
index 000000000000..3fa925f89dcc
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
@@ -0,0 +1,424 @@
+#include "intel_gsc_proxy.h"
+
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/component.h>
+
+#include "drm/i915_component.h"
+#include "drm/i915_gsc_proxy_mei_interface.h"
+
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
+#include "intel_gsc_uc.h"
+#include "intel_gsc_uc_heci_cmd_submit.h"
+#include "i915_drv.h"
+#include "i915_reg.h"
+
+/*
+ * GSC proxy:
+ * The GSC uC needs to communicate with the CSME to perform certain operations.
+ * Since the GSC can't perform this communication directly on platforms where it
+ * is integrated in GT, i915 needs to transfer the messages from GSC to CSME
+ * and back. i915 must manually start the proxy flow after the GSC is loaded to
+ * signal to GSC that we're ready to handle its messages and allow it to query
+ * its init data from CSME; GSC will then trigger an HECI2 interrupt if it needs
+ * to send messages to CSME again.
+ * The proxy flow is as follow:
+ * 1 - i915 submits a request to GSC asking for the message to CSME
+ * 2 - GSC replies with the proxy header + payload for CSME
+ * 3 - i915 sends the reply from GSC as-is to CSME via the mei proxy component
+ * 4 - CSME replies with the proxy header + payload for GSC
+ * 5 - i915 submits a request to GSC with the reply from CSME
+ * 6 - GSC replies either with a new header + payload (same as step 2, so we
+ *     restart from there) or with an end message.
+ */
+
+/*
+ * The component should load quite quickly in most cases, but it could take
+ * a bit. Using a very big timeout just to cover the worst case scenario
+ */
+#define GSC_PROXY_INIT_TIMEOUT_MS 20000
+
+/* the protocol supports up to 32K in each direction */
+#define GSC_PROXY_BUFFER_SIZE SZ_32K
+#define GSC_PROXY_CHANNEL_SIZE (GSC_PROXY_BUFFER_SIZE * 2)
+#define GSC_PROXY_MAX_MSG_SIZE (GSC_PROXY_BUFFER_SIZE - sizeof(struct intel_gsc_mtl_header))
+
+/* FW-defined proxy header */
+struct intel_gsc_proxy_header {
+	/*
+	 * hdr:
+	 * Bits 0-7: type of the proxy message (see enum intel_gsc_proxy_type)
+	 * Bits 8-15: rsvd
+	 * Bits 16-31: length in bytes of the payload following the proxy header
+	 */
+	u32 hdr;
+#define GSC_PROXY_TYPE		 GENMASK(7, 0)
+#define GSC_PROXY_PAYLOAD_LENGTH GENMASK(31, 16)
+
+	u32 source;		/* Source of the Proxy message */
+	u32 destination;	/* Destination of the Proxy message */
+#define GSC_PROXY_ADDRESSING_KMD  0x10000
+#define GSC_PROXY_ADDRESSING_GSC  0x20000
+#define GSC_PROXY_ADDRESSING_CSME 0x30000
+
+	u32 status;		/* Command status */
+} __packed;
+
+/* FW-defined proxy types */
+enum intel_gsc_proxy_type {
+	GSC_PROXY_MSG_TYPE_PROXY_INVALID = 0,
+	GSC_PROXY_MSG_TYPE_PROXY_QUERY = 1,
+	GSC_PROXY_MSG_TYPE_PROXY_PAYLOAD = 2,
+	GSC_PROXY_MSG_TYPE_PROXY_END = 3,
+	GSC_PROXY_MSG_TYPE_PROXY_NOTIFICATION = 4,
+};
+
+struct gsc_proxy_msg {
+	struct intel_gsc_mtl_header header;
+	struct intel_gsc_proxy_header proxy_header;
+} __packed;
+
+static int proxy_send_to_csme(struct intel_gsc_uc *gsc)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	struct i915_gsc_proxy_component *comp = gsc->proxy.component;
+	struct intel_gsc_mtl_header *hdr;
+	void *in = gsc->proxy.to_csme;
+	void *out = gsc->proxy.to_gsc;
+	u32 in_size;
+	int ret;
+
+	/* CSME msg only includes the proxy */
+	hdr = in;
+	in += sizeof(struct intel_gsc_mtl_header);
+	out += sizeof(struct intel_gsc_mtl_header);
+
+	in_size = hdr->message_size - sizeof(struct intel_gsc_mtl_header);
+
+	/* the message must contain at least the proxy header */
+	if (in_size < sizeof(struct intel_gsc_proxy_header) ||
+	    in_size > GSC_PROXY_MAX_MSG_SIZE) {
+		gt_err(gt, "Invalid CSME message size: %u\n", in_size);
+		return -EINVAL;
+	}
+
+	ret = comp->ops->send(comp->mei_dev, in, in_size);
+	if (ret < 0) {
+		gt_err(gt, "Failed to send CSME message\n");
+		return ret;
+	}
+
+	ret = comp->ops->recv(comp->mei_dev, out, GSC_PROXY_MAX_MSG_SIZE);
+	if (ret < 0) {
+		gt_err(gt, "Failed to receive CSME message\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int proxy_send_to_gsc(struct intel_gsc_uc *gsc)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	u32 *marker = gsc->proxy.to_csme; /* first dw of the reply header */
+	u64 addr_in = i915_ggtt_offset(gsc->proxy.vma);
+	u64 addr_out = addr_in + GSC_PROXY_BUFFER_SIZE;
+	u32 size = ((struct gsc_proxy_msg *)gsc->proxy.to_gsc)->header.message_size;
+	int err;
+
+	/* the message must contain at least the gsc and proxy headers */
+	if (size < sizeof(struct gsc_proxy_msg) || size > GSC_PROXY_BUFFER_SIZE) {
+		gt_err(gt, "Invalid GSC proxy message size: %u\n", size);
+		return -EINVAL;
+	}
+
+	/* clear the message marker */
+	*marker = 0;
+	wmb();
+
+	/* send the request */
+	err = intel_gsc_uc_heci_cmd_submit_packet(gsc, addr_in, size,
+						  addr_out, GSC_PROXY_BUFFER_SIZE);
+
+	if (!err) {
+		/* wait for the reply to show up */
+		err = wait_for(*marker != 0, 300);
+		if (err)
+			gt_err(gt, "Failed to get a proxy reply from gsc\n");
+	}
+
+	return err;
+}
+
+static int validate_proxy_header(struct intel_gsc_proxy_header *header,
+				 u32 source, u32 dest)
+{
+	u32 type = FIELD_GET(GSC_PROXY_TYPE, header->hdr);
+	u32 length = FIELD_GET(GSC_PROXY_PAYLOAD_LENGTH, header->hdr);
+	int ret = 0;
+
+	if (header->destination != dest || header->source != source) {
+		ret = -ENOEXEC;
+		goto fail;
+	}
+
+	switch (type) {
+	case GSC_PROXY_MSG_TYPE_PROXY_PAYLOAD:
+		if (length > 0)
+			break;
+		fallthrough;
+	case GSC_PROXY_MSG_TYPE_PROXY_INVALID:
+		ret = -EIO;
+		goto fail;
+	default:
+		break;
+	}
+
+fail:
+	return ret;
+
+}
+
+static int proxy_query(struct intel_gsc_uc *gsc)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	struct gsc_proxy_msg *to_gsc = gsc->proxy.to_gsc;
+	struct gsc_proxy_msg *to_csme = gsc->proxy.to_csme;
+	int ret;
+
+	intel_gsc_uc_heci_cmd_emit_mtl_header(&to_gsc->header,
+					      HECI_MEADDRESS_PROXY,
+					      sizeof(struct gsc_proxy_msg),
+					      0);
+
+	to_gsc->proxy_header.hdr =
+		FIELD_PREP(GSC_PROXY_TYPE, GSC_PROXY_MSG_TYPE_PROXY_QUERY) |
+		FIELD_PREP(GSC_PROXY_PAYLOAD_LENGTH, 0);
+
+	to_gsc->proxy_header.source = GSC_PROXY_ADDRESSING_KMD;
+	to_gsc->proxy_header.destination = GSC_PROXY_ADDRESSING_GSC;
+	to_gsc->proxy_header.status = 0;
+
+	while (1) {
+		/* clear the GSC response header space */
+		memset(gsc->proxy.to_csme, 0, sizeof(struct gsc_proxy_msg));
+
+		/* send proxy message to GSC */
+		ret = proxy_send_to_gsc(gsc);
+		if (ret) {
+			gt_err(gt, "failed to send proxy message to GSC! %d\n", ret);
+			goto proxy_error;
+		}
+
+		/* stop if this was the last message */
+		if (FIELD_GET(GSC_PROXY_TYPE, to_csme->proxy_header.hdr) ==
+				GSC_PROXY_MSG_TYPE_PROXY_END)
+			break;
+
+		/* make sure the GSC-to-CSME proxy header is sane */
+		ret = validate_proxy_header(&to_csme->proxy_header,
+					    GSC_PROXY_ADDRESSING_GSC,
+					    GSC_PROXY_ADDRESSING_CSME);
+		if (ret) {
+			gt_err(gt, "invalid GSC to CSME proxy header! %d\n", ret);
+			goto proxy_error;
+		}
+
+		/* send the GSC message to the CSME */
+		ret = proxy_send_to_csme(gsc);
+		if (ret < 0) {
+			gt_err(gt, "failed to send proxy message to CSME! %d\n", ret);
+			goto proxy_error;
+		}
+
+		/* update the GSC message size with the returned value from CSME */
+		to_gsc->header.message_size = ret + sizeof(struct intel_gsc_mtl_header);
+
+		/* make sure the CSME-to-GSC proxy header is sane */
+		ret = validate_proxy_header(&to_gsc->proxy_header,
+					    GSC_PROXY_ADDRESSING_CSME,
+					    GSC_PROXY_ADDRESSING_GSC);
+		if (ret) {
+			gt_err(gt, "invalid CSME to GSC proxy header! %d\n", ret);
+			goto proxy_error;
+		}
+	}
+
+proxy_error:
+	return ret < 0 ? ret : 0;
+}
+
+int intel_gsc_proxy_request_handler(struct intel_gsc_uc *gsc)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	int err;
+
+	if (!gsc->proxy.component_added)
+		return -ENODEV;
+
+	assert_rpm_wakelock_held(gt->uncore->rpm);
+
+	/* when GSC is loaded, we can queue this before the component is bound */
+	err = wait_for(gsc->proxy.component, GSC_PROXY_INIT_TIMEOUT_MS);
+	if (err) {
+		gt_err(gt, "GSC proxy component didn't bind within the expected timeout\n");
+		return -EIO;
+	}
+
+	mutex_lock(&gsc->proxy.mutex);
+	if (!gsc->proxy.component) {
+		gt_err(gt, "GSC proxy worker called without the component being bound!\n");
+		err = -EIO;
+	} else {
+		/*
+		 * write the status bit to clear it and allow new proxy
+		 * interrupts to be generated while we handle the current
+		 * request, but be sure not to write the reset bit
+		 */
+		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+				 HECI_H_CSR_RST, HECI_H_CSR_IS);
+		err = proxy_query(gsc);
+	}
+	mutex_unlock(&gsc->proxy.mutex);
+	return err;
+}
+
+void intel_gsc_proxy_irq_handler(struct intel_gsc_uc *gsc, u32 iir)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+
+	if (unlikely(!iir))
+		return;
+
+	lockdep_assert_held(gt->irq_lock);
+
+	if (!gsc->proxy.component) {
+		gt_err(gt, "GSC proxy irq received without the component being bound!\n");
+		return;
+	}
+
+	gsc->gsc_work_actions |= GSC_ACTION_SW_PROXY;
+	queue_work(gsc->wq, &gsc->work);
+}
+
+static int i915_gsc_proxy_component_bind(struct device *i915_kdev,
+					 struct device *mei_kdev, void *data)
+{
+	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
+	struct intel_gt *gt = i915->media_gt;
+	struct intel_gsc_uc *gsc = &gt->uc.gsc;
+	intel_wakeref_t wakeref;
+
+	/* enable HECI2 IRQs */
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+				 HECI_H_CSR_RST, HECI_H_CSR_IE);
+
+	mutex_lock(&gsc->proxy.mutex);
+	gsc->proxy.component = data;
+	gsc->proxy.component->mei_dev = mei_kdev;
+	mutex_unlock(&gsc->proxy.mutex);
+
+	return 0;
+}
+
+static void i915_gsc_proxy_component_unbind(struct device *i915_kdev,
+					    struct device *mei_kdev, void *data)
+{
+	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
+	struct intel_gt *gt = i915->media_gt;
+	struct intel_gsc_uc *gsc = &gt->uc.gsc;
+	intel_wakeref_t wakeref;
+
+	mutex_lock(&gsc->proxy.mutex);
+	gsc->proxy.component = NULL;
+	mutex_unlock(&gsc->proxy.mutex);
+
+	/* disable HECI2 IRQs */
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+				 HECI_H_CSR_IE | HECI_H_CSR_RST, 0);
+}
+
+static const struct component_ops i915_gsc_proxy_component_ops = {
+	.bind   = i915_gsc_proxy_component_bind,
+	.unbind = i915_gsc_proxy_component_unbind,
+};
+
+static int proxy_channel_alloc(struct intel_gsc_uc *gsc)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	struct i915_vma *vma;
+	void *vaddr;
+	int err;
+
+	err = intel_guc_allocate_and_map_vma(&gt->uc.guc, GSC_PROXY_CHANNEL_SIZE,
+					     &vma, &vaddr);
+	if (err)
+		return err;
+
+	gsc->proxy.vma = vma;
+	gsc->proxy.to_gsc = vaddr;
+	gsc->proxy.to_csme = vaddr + GSC_PROXY_BUFFER_SIZE;
+
+	return 0;
+}
+
+static void proxy_channel_free(struct intel_gsc_uc *gsc)
+{
+	if (!gsc->proxy.vma)
+		return;
+
+	gsc->proxy.to_gsc = NULL;
+	gsc->proxy.to_csme = NULL;
+	i915_vma_unpin_and_release(&gsc->proxy.vma, I915_VMA_RELEASE_MAP);
+}
+
+void intel_gsc_proxy_fini(struct intel_gsc_uc *gsc)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	struct drm_i915_private *i915 = gt->i915;
+
+	if (fetch_and_zero(&gsc->proxy.component_added))
+		component_del(i915->drm.dev, &i915_gsc_proxy_component_ops);
+
+	proxy_channel_free(gsc);
+}
+
+int intel_gsc_proxy_init(struct intel_gsc_uc *gsc)
+{
+	int err;
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+	struct drm_i915_private *i915 = gt->i915;
+
+	mutex_init(&gsc->proxy.mutex);
+
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY)) {
+		gt_info(gt, "can't init GSC proxy due to missing mei component\n");
+		return -ENODEV;
+	}
+
+	err = proxy_channel_alloc(gsc);
+	if (err)
+		return err;
+
+	err = component_add_typed(i915->drm.dev, &i915_gsc_proxy_component_ops,
+				  I915_COMPONENT_GSC_PROXY);
+	if (err < 0) {
+		gt_err(gt, "Failed to add GSC_PROXY component (%d)\n", err);
+		goto out_free;
+	}
+
+	gsc->proxy.component_added = true;
+
+	return 0;
+
+out_free:
+	proxy_channel_free(gsc);
+	return err;
+}
+
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
new file mode 100644
index 000000000000..c55bafcbaec4
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _INTEL_GSC_PROXY_H_
+#define _INTEL_GSC_PROXY_H_
+
+#include <linux/types.h>
+
+struct intel_gsc_uc;
+
+int intel_gsc_proxy_init(struct intel_gsc_uc *gsc);
+void intel_gsc_proxy_fini(struct intel_gsc_uc *gsc);
+int intel_gsc_proxy_request_handler(struct intel_gsc_uc *gsc);
+void intel_gsc_proxy_irq_handler(struct intel_gsc_uc *gsc, u32 iir);
+
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index 2d5b70b3384c..64bff01026e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -10,15 +10,50 @@
 #include "intel_gsc_uc.h"
 #include "intel_gsc_fw.h"
 #include "i915_drv.h"
+#include "intel_gsc_proxy.h"
 
 static void gsc_work(struct work_struct *work)
 {
 	struct intel_gsc_uc *gsc = container_of(work, typeof(*gsc), work);
 	struct intel_gt *gt = gsc_uc_to_gt(gsc);
 	intel_wakeref_t wakeref;
+	u32 actions;
+	int ret;
+
+	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
+
+	spin_lock_irq(gt->irq_lock);
+	actions = gsc->gsc_work_actions;
+	gsc->gsc_work_actions = 0;
+	spin_unlock_irq(gt->irq_lock);
+
+	if (actions & GSC_ACTION_FW_LOAD) {
+		ret = intel_gsc_uc_fw_upload(gsc);
+		if (ret == -EEXIST) /* skip proxy if not a new load */
+			actions &= ~GSC_ACTION_FW_LOAD;
+		else if (ret)
+			goto out_put;
+	}
+
+	if (actions & (GSC_ACTION_FW_LOAD | GSC_ACTION_SW_PROXY)) {
+		if (!intel_gsc_uc_fw_init_done(gsc)) {
+			gt_err(gt, "Proxy request received with GSC not loaded!\n");
+			goto out_put;
+		}
+
+		ret = intel_gsc_proxy_request_handler(gsc);
+		if (ret)
+			goto out_put;
+
+		/* mark the GSC FW init as done the first time we run this */
+		if (actions & GSC_ACTION_FW_LOAD) {
+			gt_dbg(gt, "GSC Proxy initialized\n");
+			intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_RUNNING);
+		}
+	}
 
-	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
-		intel_gsc_uc_fw_upload(gsc);
+out_put:
+	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
 }
 
 static bool gsc_engine_supported(struct intel_gt *gt)
@@ -43,6 +78,8 @@ static bool gsc_engine_supported(struct intel_gt *gt)
 
 void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
 {
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+
 	intel_uc_fw_init_early(&gsc->fw, INTEL_UC_FW_TYPE_GSC);
 	INIT_WORK(&gsc->work, gsc_work);
 
@@ -50,10 +87,16 @@ void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc)
 	 * GT with it being not fully setup hence check device info's
 	 * engine mask
 	 */
-	if (!gsc_engine_supported(gsc_uc_to_gt(gsc))) {
+	if (!gsc_engine_supported(gt)) {
 		intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
 		return;
 	}
+
+	gsc->wq = alloc_ordered_workqueue("i915_gsc", 0);
+	if (!gsc->wq) {
+		gt_err(gt, "failed to allocate WQ for GSC, disabling FW\n");
+		intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
+	}
 }
 
 int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
@@ -88,6 +131,9 @@ int intel_gsc_uc_init(struct intel_gsc_uc *gsc)
 
 	gsc->ce = ce;
 
+	/* if we fail to init proxy we still want to load GSC for PM */
+	intel_gsc_proxy_init(gsc);
+
 	intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_LOADABLE);
 
 	return 0;
@@ -107,6 +153,12 @@ void intel_gsc_uc_fini(struct intel_gsc_uc *gsc)
 		return;
 
 	flush_work(&gsc->work);
+	if (gsc->wq) {
+		destroy_workqueue(gsc->wq);
+		gsc->wq = NULL;
+	}
+
+	intel_gsc_proxy_fini(gsc);
 
 	if (gsc->ce)
 		intel_engine_destroy_pinned_context(fetch_and_zero(&gsc->ce));
@@ -145,11 +197,17 @@ void intel_gsc_uc_resume(struct intel_gsc_uc *gsc)
 
 void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc)
 {
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+
 	if (!intel_uc_fw_is_loadable(&gsc->fw))
 		return;
 
 	if (intel_gsc_uc_fw_init_done(gsc))
 		return;
 
-	queue_work(system_unbound_wq, &gsc->work);
+	spin_lock_irq(gt->irq_lock);
+	gsc->gsc_work_actions |= GSC_ACTION_FW_LOAD;
+	spin_unlock_irq(gt->irq_lock);
+
+	queue_work(gsc->wq, &gsc->work);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
index 5f50fa1ff8b9..a2a0813b8a76 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
@@ -10,6 +10,7 @@
 
 struct i915_vma;
 struct intel_context;
+struct i915_gsc_proxy_component;
 
 struct intel_gsc_uc {
 	/* Generic uC firmware management */
@@ -19,7 +20,21 @@ struct intel_gsc_uc {
 	struct i915_vma *local; /* private memory for GSC usage */
 	struct intel_context *ce; /* for submission to GSC FW via GSC engine */
 
-	struct work_struct work; /* for delayed load */
+	/* for delayed load and proxy handling */
+	struct workqueue_struct *wq;
+	struct work_struct work;
+	u32 gsc_work_actions; /* protected by gt->irq_lock */
+#define GSC_ACTION_FW_LOAD BIT(0)
+#define GSC_ACTION_SW_PROXY BIT(1)
+
+	struct {
+		struct i915_gsc_proxy_component *component;
+		bool component_added;
+		struct i915_vma *vma;
+		void *to_gsc;
+		void *to_csme;
+		struct mutex mutex; /* protects the tee channel binding */
+	} proxy;
 };
 
 void intel_gsc_uc_init_early(struct intel_gsc_uc *gsc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
index 3d56ae501991..8f199d5f963e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
@@ -14,6 +14,7 @@ struct intel_gsc_mtl_header {
 #define GSC_HECI_VALIDITY_MARKER 0xA578875A
 
 	u8 heci_client_id;
+#define HECI_MEADDRESS_PROXY 10
 #define HECI_MEADDRESS_PXP 17
 #define HECI_MEADDRESS_HDCP 18
 
diff --git a/drivers/misc/mei/Kconfig b/drivers/misc/mei/Kconfig
index d21486d69df2..37db142de413 100644
--- a/drivers/misc/mei/Kconfig
+++ b/drivers/misc/mei/Kconfig
@@ -62,4 +62,4 @@ config INTEL_MEI_GSC
 
 source "drivers/misc/mei/hdcp/Kconfig"
 source "drivers/misc/mei/pxp/Kconfig"
-
+source "drivers/misc/mei/gsc_proxy/Kconfig"
diff --git a/drivers/misc/mei/Makefile b/drivers/misc/mei/Makefile
index fb740d754900..14aee253ae48 100644
--- a/drivers/misc/mei/Makefile
+++ b/drivers/misc/mei/Makefile
@@ -30,3 +30,4 @@ CFLAGS_mei-trace.o = -I$(src)
 
 obj-$(CONFIG_INTEL_MEI_HDCP) += hdcp/
 obj-$(CONFIG_INTEL_MEI_PXP) += pxp/
+obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += gsc_proxy/
diff --git a/drivers/misc/mei/gsc_proxy/Kconfig b/drivers/misc/mei/gsc_proxy/Kconfig
new file mode 100644
index 000000000000..5f68d9f3d691
--- /dev/null
+++ b/drivers/misc/mei/gsc_proxy/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2022-2023, Intel Corporation. All rights reserved.
+#
+config INTEL_MEI_GSC_PROXY
+	tristate "Intel GSC Proxy services of ME Interface"
+	select INTEL_MEI_ME
+	depends on DRM_I915
+	help
+         MEI Support for GSC Proxy Services on Intel platforms.
+
+         MEI GSC proxy enables messaging between GSC service on
+         Intel graphics card and services on CSE (MEI) firmware
+         residing SoC or PCH.
+
diff --git a/drivers/misc/mei/gsc_proxy/Makefile b/drivers/misc/mei/gsc_proxy/Makefile
new file mode 100644
index 000000000000..358847e9aaa9
--- /dev/null
+++ b/drivers/misc/mei/gsc_proxy/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2022-2023, Intel Corporation. All rights reserved.
+#
+# Makefile - GSC Proxy client driver for Intel MEI Bus Driver.
+
+obj-$(CONFIG_INTEL_MEI_GSC_PROXY) += mei_gsc_proxy.o
diff --git a/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
new file mode 100644
index 000000000000..be52b113aea9
--- /dev/null
+++ b/drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2023 Intel Corporation
+ */
+
+/**
+ * DOC: MEI_GSC_PROXY Client Driver
+ *
+ * The mei_gsc_proxy driver acts as a translation layer between
+ * proxy user (I915) and ME FW by proxying messages to ME FW
+ */
+
+#include <linux/component.h>
+#include <linux/mei_cl_bus.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/uuid.h>
+#include <drm/drm_connector.h>
+#include <drm/i915_component.h>
+#include <drm/i915_gsc_proxy_mei_interface.h>
+
+/**
+ * mei_gsc_proxy_send - Sends a proxy message to ME FW.
+ * @dev: device corresponding to the mei_cl_device
+ * @buf: a message buffer to send
+ * @size: size of the message
+ * Return: bytes sent on Success, <0 on Failure
+ */
+static int mei_gsc_proxy_send(struct device *dev, const void *buf, size_t size)
+{
+	ssize_t ret;
+
+	if (!dev || !buf)
+		return -EINVAL;
+
+	ret = mei_cldev_send(to_mei_cl_device(dev), buf, size);
+	if (ret < 0)
+		dev_dbg(dev, "mei_cldev_send failed. %zd\n", ret);
+
+	return ret;
+}
+
+/**
+ * mei_gsc_proxy_recv - Receives a proxy message from ME FW.
+ * @dev: device corresponding to the mei_cl_device
+ * @buf: a message buffer to contain the received message
+ * @size: size of the buffer
+ * Return: bytes received on Success, <0 on Failure
+ */
+static int mei_gsc_proxy_recv(struct device *dev, void *buf, size_t size)
+{
+	ssize_t ret;
+
+	if (!dev || !buf)
+		return -EINVAL;
+
+	ret = mei_cldev_recv(to_mei_cl_device(dev), buf, size);
+	if (ret < 0)
+		dev_dbg(dev, "mei_cldev_recv failed. %zd\n", ret);
+
+	return ret;
+}
+
+static const struct i915_gsc_proxy_component_ops mei_gsc_proxy_ops = {
+	.owner = THIS_MODULE,
+	.send = mei_gsc_proxy_send,
+	.recv = mei_gsc_proxy_recv,
+};
+
+static int mei_component_master_bind(struct device *dev)
+{
+	struct mei_cl_device *cldev = to_mei_cl_device(dev);
+	struct i915_gsc_proxy_component *comp_master = mei_cldev_get_drvdata(cldev);
+
+	comp_master->ops = &mei_gsc_proxy_ops;
+	comp_master->mei_dev = dev;
+	return component_bind_all(dev, comp_master);
+}
+
+static void mei_component_master_unbind(struct device *dev)
+{
+	struct mei_cl_device *cldev = to_mei_cl_device(dev);
+	struct i915_gsc_proxy_component *comp_master = mei_cldev_get_drvdata(cldev);
+
+	component_unbind_all(dev, comp_master);
+}
+
+static const struct component_master_ops mei_component_master_ops = {
+	.bind = mei_component_master_bind,
+	.unbind = mei_component_master_unbind,
+};
+
+/**
+ * mei_gsc_proxy_component_match - compare function for matching mei.
+ *
+ *    The function checks if the device is pci device and
+ *    Intel VGA adapter, the subcomponent is SW Proxy
+ *    and the parent of MEI PCI and the parent of VGA are the same PCH device.
+ *
+ * @dev: master device
+ * @subcomponent: subcomponent to match (I915_COMPONENT_SWPROXY)
+ * @data: compare data (mei pci parent)
+ *
+ * Return:
+ * * 1 - if components match
+ * * 0 - otherwise
+ */
+static int mei_gsc_proxy_component_match(struct device *dev, int subcomponent,
+					 void *data)
+{
+	struct pci_dev *pdev;
+
+	if (!dev_is_pci(dev))
+		return 0;
+
+	pdev = to_pci_dev(dev);
+
+	if (pdev->class != (PCI_CLASS_DISPLAY_VGA << 8) ||
+	    pdev->vendor != PCI_VENDOR_ID_INTEL)
+		return 0;
+
+	if (subcomponent != I915_COMPONENT_GSC_PROXY)
+		return 0;
+
+	return component_compare_dev(dev->parent, ((struct device *)data)->parent);
+}
+
+static int mei_gsc_proxy_probe(struct mei_cl_device *cldev,
+			       const struct mei_cl_device_id *id)
+{
+	struct i915_gsc_proxy_component *comp_master;
+	struct component_match *master_match = NULL;
+	int ret;
+
+	ret = mei_cldev_enable(cldev);
+	if (ret < 0) {
+		dev_err(&cldev->dev, "mei_cldev_enable Failed. %d\n", ret);
+		goto enable_err_exit;
+	}
+
+	comp_master = kzalloc(sizeof(*comp_master), GFP_KERNEL);
+	if (!comp_master) {
+		ret = -ENOMEM;
+		goto err_exit;
+	}
+
+	component_match_add_typed(&cldev->dev, &master_match,
+				  mei_gsc_proxy_component_match, cldev->dev.parent);
+	if (IS_ERR_OR_NULL(master_match)) {
+		ret = -ENOMEM;
+		goto err_exit;
+	}
+
+	mei_cldev_set_drvdata(cldev, comp_master);
+	ret = component_master_add_with_match(&cldev->dev,
+					      &mei_component_master_ops,
+					      master_match);
+	if (ret < 0) {
+		dev_err(&cldev->dev, "Master comp add failed %d\n", ret);
+		goto err_exit;
+	}
+
+	return 0;
+
+err_exit:
+	mei_cldev_set_drvdata(cldev, NULL);
+	kfree(comp_master);
+	mei_cldev_disable(cldev);
+enable_err_exit:
+	return ret;
+}
+
+static void mei_gsc_proxy_remove(struct mei_cl_device *cldev)
+{
+	struct i915_gsc_proxy_component *comp_master = mei_cldev_get_drvdata(cldev);
+	int ret;
+
+	component_master_del(&cldev->dev, &mei_component_master_ops);
+	kfree(comp_master);
+	mei_cldev_set_drvdata(cldev, NULL);
+
+	ret = mei_cldev_disable(cldev);
+	if (ret)
+		dev_warn(&cldev->dev, "mei_cldev_disable() failed %d\n", ret);
+}
+
+#define MEI_UUID_GSC_PROXY UUID_LE(0xf73db04, 0x97ab, 0x4125, \
+				   0xb8, 0x93, 0xe9, 0x4, 0xad, 0xd, 0x54, 0x64)
+
+static struct mei_cl_device_id mei_gsc_proxy_tbl[] = {
+	{ .uuid = MEI_UUID_GSC_PROXY, .version = MEI_CL_VERSION_ANY },
+	{ }
+};
+MODULE_DEVICE_TABLE(mei, mei_gsc_proxy_tbl);
+
+static struct mei_cl_driver mei_gsc_proxy_driver = {
+	.id_table = mei_gsc_proxy_tbl,
+	.name = KBUILD_MODNAME,
+	.probe = mei_gsc_proxy_probe,
+	.remove	= mei_gsc_proxy_remove,
+};
+
+module_mei_cl_driver(mei_gsc_proxy_driver);
+
+MODULE_AUTHOR("Intel Corporation");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MEI GSC PROXY");
diff --git a/include/drm/i915_component.h b/include/drm/i915_component.h
index c1e2a43d2d1e..56a84ee1c64c 100644
--- a/include/drm/i915_component.h
+++ b/include/drm/i915_component.h
@@ -29,7 +29,8 @@
 enum i915_component_type {
 	I915_COMPONENT_AUDIO = 1,
 	I915_COMPONENT_HDCP,
-	I915_COMPONENT_PXP
+	I915_COMPONENT_PXP,
+	I915_COMPONENT_GSC_PROXY,
 };
 
 /* MAX_PORT is the number of port
diff --git a/include/drm/i915_gsc_proxy_mei_interface.h b/include/drm/i915_gsc_proxy_mei_interface.h
new file mode 100644
index 000000000000..9462341d3ae1
--- /dev/null
+++ b/include/drm/i915_gsc_proxy_mei_interface.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (c) 2022-2023 Intel Corporation
+ */
+
+#ifndef _I915_GSC_PROXY_MEI_INTERFACE_H_
+#define _I915_GSC_PROXY_MEI_INTERFACE_H_
+
+#include <linux/types.h>
+
+struct device;
+struct module;
+
+/**
+ * struct i915_gsc_proxy_component_ops - ops for GSC Proxy services.
+ * @owner: Module providing the ops
+ * @send: sends a proxy message from GSC FW to ME FW
+ * @recv: receives a proxy message for GSC FW from ME FW
+ */
+struct i915_gsc_proxy_component_ops {
+	struct module *owner;
+
+	/**
+	 * send - Sends a proxy message to ME FW.
+	 * @dev: device struct corresponding to the mei device
+	 * @buf: message buffer to send
+	 * @size: size of the message
+	 * Return: bytes sent on success, negative errno value on failure
+	 */
+	int (*send)(struct device *dev, const void *buf, size_t size);
+
+	/**
+	 * recv - Receives a proxy message from ME FW.
+	 * @dev: device struct corresponding to the mei device
+	 * @buf: message buffer to contain the received message
+	 * @size: size of the buffer
+	 * Return: bytes received on success, negative errno value on failure
+	 */
+	int (*recv)(struct device *dev, void *buf, size_t size);
+};
+
+/**
+ * struct i915_gsc_proxy_component - Used for communication between i915 and
+ * MEI drivers for GSC proxy services
+ * @mei_dev: device that provide the GSC proxy service.
+ * @ops: Ops implemented by GSC proxy driver, used by i915 driver.
+ */
+struct i915_gsc_proxy_component {
+	struct device *mei_dev;
+	const struct i915_gsc_proxy_component_ops *ops;
+};
+
+#endif /* _I915_GSC_PROXY_MEI_INTERFACE_H_ */
-- 
2.40.0

