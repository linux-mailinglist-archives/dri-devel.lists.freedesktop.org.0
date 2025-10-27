Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899B8C0BC7E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 05:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF6510E342;
	Mon, 27 Oct 2025 04:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TlW/xz6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3928110E138;
 Mon, 27 Oct 2025 04:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761540517; x=1793076517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QETQnNUHOrX+XZtSdp00GyTPV7Kexn8FoUz2kcKVaxI=;
 b=TlW/xz6ul5o/mwOBbbuO3teDmsMBuDg+4YjQZukdXopCon2SWxhd0zDG
 I1Foh72bMrGDRx/mX9mIcSQnuJ2z+Ac7hDpFMFZllktlvu1qJh73JEpFF
 GZ8YQu11KLMwS9vvjXZgcPvH1Xxod0LJMEONjyDMOYMGSx/x1VKxagjHC
 YwXR2nu5pnw2gI93kbODmCbSKxldQJDfDi0rKPz5zdJffLgL+V5gi6TYD
 rzqjt/OgU3FMK89UmNWwU/394GPtw5zdUbx2rkc5v56ySmxynWnhRhTuf
 ot+BPCRBJGHRYxJznGTE734bvFo3FCjnjdwz3Nko5zXyJ2aCBDFJ0/5l9 Q==;
X-CSE-ConnectionGUID: /5tKJYDoTSWv5IB5cKi8Pg==
X-CSE-MsgGUID: QFD207bZQxu3dr8eVRbmsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63515630"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63515630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:36 -0700
X-CSE-ConnectionGUID: XJDM61bORkWP9ITsC2pStw==
X-CSE-MsgGUID: pVnkcjWXQ5eFzJyVBt4aRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="188992979"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 21:48:37 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC v2 2/8] dma-buf: Add a helper to match interconnects between
 exporter/importer
Date: Sun, 26 Oct 2025 21:44:14 -0700
Message-ID: <20251027044712.1676175-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
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

If the importer provides a callback for supports_interconnects(),
the exporter starts the matching (or negotiation) process (during
attach) by invoking the supports_interconnects() callback which
would then call this helper to identify the first common
interconnect supported by both exporter and importer.

Note that whether an interconnect is supported between an
exporter/importer is ultimately determined by the exporter via
the match callback it is expected to provide.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/dma-buf-interconnect.c | 65 ++++++++++++++++++++++++++
 drivers/dma-buf/dma-buf.c              |  6 ++-
 include/linux/dma-buf-interconnect.h   | 36 ++++++++++++++
 include/linux/dma-buf.h                | 14 ++++++
 4 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf-interconnect.c b/drivers/dma-buf/dma-buf-interconnect.c
index 690423b6682f..12db77e6b9f1 100644
--- a/drivers/dma-buf/dma-buf-interconnect.c
+++ b/drivers/dma-buf/dma-buf-interconnect.c
@@ -94,3 +94,68 @@ void dma_buf_unmap_interconnect(struct dma_buf_attachment *attach,
 	kfree(ranges);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_interconnect, "DMA_BUF");
+
+/**
+ * dma_buf_match_interconnects - determine if there is a specific interconnect
+ * that is supported by both exporter and importer.
+ * @attach:	[in]	attachment to populate ic_match field
+ * @exp:	[in]	array of interconnects supported by exporter
+ * @exp_ics:	[in]	number of interconnects supported by exporter
+ * @imp:	[in]	array of interconnects supported by importer
+ * @imp_ics:	[in]	number of interconnects supported by importer
+ *
+ * This helper function iterates through the list interconnects supported by
+ * both exporter and importer to find a match. A successful match means that
+ * a common interconnect type is supported by both parties and the exporter's
+ * match_interconnect() callback also confirms that the importer is compatible
+ * with the exporter for that interconnect type.
+ *
+ * If a match is found, the attach->ic_match field is populated with a copy
+ * of the exporter's match data.
+ * Return: true if a match is found, false otherwise.
+ */
+bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
+				 const struct dma_buf_interconnect_match *exp,
+				 unsigned int exp_ics,
+				 const struct dma_buf_interconnect_match *imp,
+				 unsigned int imp_ics)
+{
+	const struct dma_buf_interconnect_ops *ic_ops;
+	struct dma_buf_interconnect_match *ic_match;
+	struct dma_buf *dmabuf = attach->dmabuf;
+	unsigned int i, j;
+
+	if (!exp || !imp)
+		return false;
+
+	if (!attach->allow_ic)
+		return false;
+
+	ic_ops = dmabuf->ops->interconnect_ops;
+	if (!ic_ops || !ic_ops->match_interconnect)
+		return false;
+
+	ic_match = kzalloc(sizeof(*ic_match), GFP_KERNEL);
+	if (!ic_match)
+		return false;
+
+	for (i = 0; i < exp_ics; i++) {
+		for (j = 0; j < imp_ics; j++) {
+			if (exp[i].type == imp[j].type) {
+				if (ic_ops->match_interconnect(&exp[i],
+							       &imp[j])) {
+					memcpy(ic_match, &exp[i],
+					       sizeof(*ic_match));
+
+					attach->ic_match = ic_match;
+					return true;
+				}
+			}
+		}
+	}
+
+	attach->allow_ic = false;
+	kfree(ic_match);
+	return false;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_match_interconnects, "DMA_BUF");
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index daa993503052..a6977375f11e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -959,8 +959,11 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 
 	attach->dev = dev;
 	attach->dmabuf = dmabuf;
-	if (importer_ops)
+	if (importer_ops) {
 		attach->peer2peer = importer_ops->allow_peer2peer;
+		if (importer_ops->supports_interconnects)
+			attach->allow_ic = true;
+	}
 	attach->importer_ops = importer_ops;
 	attach->importer_priv = importer_priv;
 
@@ -1017,6 +1020,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 	if (dmabuf->ops->detach)
 		dmabuf->ops->detach(dmabuf, attach);
 
+	kfree(attach->ic_match);
 	kfree(attach);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
index 50fc7a8272ce..efe3ca1c354a 100644
--- a/include/linux/dma-buf-interconnect.h
+++ b/include/linux/dma-buf-interconnect.h
@@ -3,8 +3,14 @@
 #ifndef __DMA_BUF_INTERCONNECT_H__
 #define __DMA_BUF_INTERCONNECT_H__
 
+#include <linux/device.h>
 #include <linux/xarray.h>
 
+#define MATCH_INTERCONNECT(interconnect, ...)				\
+	((const struct dma_buf_interconnect_match) {			\
+		.type = interconnect __VA_OPT__(, __VA_ARGS__)		\
+	})								\
+
 #define CREATE_INTERCONNECT(type)					       \
 	static const struct dma_buf_interconnect __##type##_interconnect = {   \
 		.name = #type"_interconnect",				       \
@@ -25,6 +31,22 @@ struct dma_buf_interconnect {
 	const char *name;
 };
 
+/**
+ * struct dma_buf_interconnect_match - holds data used to match interconnects
+ * @type: pointer to the interconnect instance
+ * @dev: the device associated with a given exporter or importer
+ * @bar: the BAR index associated with the device
+ *
+ * The exporter and importer are expected to populate this structure with
+ * their respective device and BAR information for each interconnect type they
+ * support. This data is used to determine if a match exists between them.
+ */
+struct dma_buf_interconnect_match {
+	const struct dma_buf_interconnect *type;
+	struct device *dev;
+	unsigned int bar;
+};
+
 /**
  * struct dma_buf_ranges - holds info about interconnect address ranges
  * @ranges: xarray that contains the address ranges
@@ -71,9 +93,23 @@ struct dma_buf_interconnect_ops {
 	 */
 	void (*unmap_interconnect)(struct dma_buf_attachment *attach,
 				   struct dma_buf_ranges *ranges);
+	/**
+	 * @match_interconnect:
+	 *
+	 * This is called by dma_buf_match_interconnects() and is used by
+	 * the exporter to determine if the importer is compatible for a
+	 * given interconnect type.
+	 */
+	bool (*match_interconnect)(const struct dma_buf_interconnect_match *,
+				   const struct dma_buf_interconnect_match *);
 };
 
 struct dma_buf_ranges *dma_buf_map_interconnect(struct dma_buf_attachment *);
 void dma_buf_unmap_interconnect(struct dma_buf_attachment *,
 				struct dma_buf_ranges *);
+bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
+				 const struct dma_buf_interconnect_match *,
+				 unsigned int exp_ics,
+				 const struct dma_buf_interconnect_match *,
+				 unsigned int imp_ics);
 #endif
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index a675bc89a69c..f7d0b0dbcb24 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -487,6 +487,18 @@ struct dma_buf_attach_ops {
 	 * point to the new location of the DMA-buf.
 	 */
 	void (*move_notify)(struct dma_buf_attachment *attach);
+
+	/**
+	 * @supports_interconnects: [optional] indicate interconnect support
+	 *
+	 * If this callback is provided, it means that the importer would
+	 * provide a list of interconnects that it supports and would
+	 * invoke dma_buf_match_interconnects() to identify a match with the
+	 * exporter's interconnects.
+	 */
+	bool (*supports_interconnects)(struct dma_buf_attachment *attach,
+				       const struct dma_buf_interconnect_match *,
+				       unsigned int num_ics);
 };
 
 /**
@@ -498,6 +510,7 @@ struct dma_buf_attach_ops {
  * @allow_ic: true if the importer is allowed to use interconnect ops.
  * @priv: exporter specific attachment data.
  * @importer_ops: importer operations for this attachment, if provided
+ * @ic_match: copy of exporter's interconnect match data.
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
  * @importer_priv: importer specific attachment data.
  *
@@ -517,6 +530,7 @@ struct dma_buf_attachment {
 	bool peer2peer;
 	bool allow_ic;
 	const struct dma_buf_attach_ops *importer_ops;
+	struct dma_buf_interconnect_match *ic_match;
 	void *importer_priv;
 	void *priv;
 };
-- 
2.50.1

