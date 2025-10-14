Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90952BD7D21
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439D910E55D;
	Tue, 14 Oct 2025 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LysmJff3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A8310E553;
 Tue, 14 Oct 2025 07:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426038; x=1791962038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yh1xtuPzPIYwf/mvsxOCmqZavj42ErFHrTFWR7mOTeI=;
 b=LysmJff3wV8xg4CsVSCjrHmxmj+WUBFTM6sEcvbs35JaADPV/kP6iDmo
 yOP7aFyDOubr28k3TUUoQdS6vqEOfQSm0sFSZd21Agj7r7+7aIylVYoIQ
 VISzc+MzVa3cthlI/zXRrlglGJcaeg8tUAn+/ni3YwxCGebrJoIjA8kwI
 OAtk7K2+LL3xpdgSsf0pLAuWCg2yGGTGgwKEPeUpvIVZH3GxAPZY3ohUv
 JRmWDfEosjJSGqgR/O70Z7Vdk7Rz8oJxuRCboDwj6LCyrRY9S++gzRR8f
 4I1thjmpgOfdX54c4MqEoj7IUYp95ZZ0SXAeyvl5nz+HvpK+n3jELaFk1 w==;
X-CSE-ConnectionGUID: dJhTh38RSlGl+nR5BthR4A==
X-CSE-MsgGUID: ItKirdGpSPajOk6hd2IebQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257116"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:57 -0700
X-CSE-ConnectionGUID: oGfti8sAQ5+vzaf8oPTL4A==
X-CSE-MsgGUID: ZE8b/suBRJK8pUA3alJ+8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369856"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:57 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC 2/8] dma-buf: Add a helper to match interconnects between
 exporter/importer
Date: Tue, 14 Oct 2025 00:08:52 -0700
Message-ID: <20251014071243.811884-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
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

If the importer provides an op for supports_interconnects(), the
exporter starts the matching (or negotiation) process (during
attach) by invoking the supports_interconnects() which would then
call this helper to identify the first common interconnect
supported by both exporter and importer.

Note that whether an interconnect is supported between an
exporter/importer is ultimately determined by the exporter via
the match op it is expected to provide.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/dma-buf.c            | 45 +++++++++++++++++++++++++++-
 include/linux/dma-buf-interconnect.h |  6 ++++
 include/linux/dma-buf.h              |  9 ++++++
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 162642bd53e8..ed48540d1c1d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -965,8 +965,11 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 
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
 
@@ -1680,6 +1683,46 @@ void dma_buf_unmap_interconnect(struct dma_buf_attachment *attach,
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_interconnect, "DMA_BUF");
 
+bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
+				 const struct dma_buf_interconnect_match *exp,
+				 unsigned int exp_ics,
+				 const struct dma_buf_interconnect_match *imp,
+				 unsigned int imp_ics)
+{
+	const struct dma_buf_interconnect *exp_ic, *imp_ic;
+	const struct dma_buf_interconnect_ops *ic_ops;
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
+	for (i = 0; i < exp_ics; i++) {
+		for (j = 0; j < imp_ics; j++) {
+			exp_ic = exp[i].interconnect;
+			imp_ic = imp[j].interconnect;
+
+			if (exp_ic->type == imp_ic->type) {
+				if (ic_ops->match_interconnect(exp_ic, imp_ic)) {
+					attach->interconnect.type = exp_ic->type;
+					return true;
+				}
+			}
+		}
+	}
+
+	attach->allow_ic = false;
+	return false;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_match_interconnects, "DMA_BUF");
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
index 17504dea9691..a72f65ed4806 100644
--- a/include/linux/dma-buf-interconnect.h
+++ b/include/linux/dma-buf-interconnect.h
@@ -20,10 +20,16 @@ struct dma_buf_interconnect {
 	enum dma_buf_interconnect_type type;
 };
 
+struct dma_buf_interconnect_match {
+	const struct dma_buf_interconnect *interconnect;
+};
+
 struct dma_buf_interconnect_ops {
 	int (*map_interconnect)(struct dma_buf_attachment *attach,
 				struct dma_buf_ranges *ranges);
 	void (*unmap_interconnect)(struct dma_buf_attachment *attach,
 				   struct dma_buf_ranges *ranges);
+	bool (*match_interconnect)(const struct dma_buf_interconnect *exp_ic,
+				   const struct dma_buf_interconnect *imp_ic);
 };
 #endif
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index db91c67c00d6..3e6124387f3c 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -479,6 +479,10 @@ struct dma_buf_attach_ops {
 	 * point to the new location of the DMA-buf.
 	 */
 	void (*move_notify)(struct dma_buf_attachment *attach);
+
+	bool (*supports_interconnects)(struct dma_buf_attachment *attach,
+				       const struct dma_buf_interconnect_match *,
+				       unsigned int num_ics);
 };
 
 /**
@@ -599,6 +603,11 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
 struct dma_buf_ranges *dma_buf_map_interconnect(struct dma_buf_attachment *);
 void dma_buf_unmap_interconnect(struct dma_buf_attachment *,
 				struct dma_buf_ranges *);
+bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
+				 const struct dma_buf_interconnect_match *,
+				 unsigned int exp_ics,
+				 const struct dma_buf_interconnect_match *,
+				 unsigned int imp_ics);
 
 void dma_buf_move_notify(struct dma_buf *dma_buf);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
-- 
2.50.1

