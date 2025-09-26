Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E986BA3008
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 10:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D9210EA05;
	Fri, 26 Sep 2025 08:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bf+a58Hj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C4310EA01;
 Fri, 26 Sep 2025 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758876410; x=1790412410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4hbtl1eqvnkOXSA8wF9VF6xUQPhGgLbkuCs6lSSp4c=;
 b=bf+a58HjdKF5P+ddpHAt1N1tmpCV/VIsphSusnBRG79au8ju7dqN11Cy
 ZbTAJFacLA3ZqpnM6R5ltcGjRlrgoHVk2GWX8DlY8IRZtXq3rTwEG7Nt8
 TIrdBzLnW9w0xMpdAmO7DgQlhQSQ5toRxbyVCE69qiwEyw6W4vEfN7yXE
 h5cigW+i/aLOXfFb/9vDndjFkSBJHhmtioSPBK/j3ufNMCpHOYPnNEIg5
 5FtaBwjdPsiNBDjx1KYjZkP0JYW78royB5/hrXBe6Ae3wCt7LMARX8EUy
 EW5UDugHpuVTHIQOd/tdVma+YJB2FSX7LRY/PH/IeDS0wcu18NFZDBrF/ Q==;
X-CSE-ConnectionGUID: ZfZV5U52QxaohTfcn3Xcbw==
X-CSE-MsgGUID: ED9GgsuySkSwI91pWDlAGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="65054061"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="65054061"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:46:49 -0700
X-CSE-ConnectionGUID: 1X/25W6lT2uL0UQBXmGO1g==
X-CSE-MsgGUID: gu91cI4OT3WapgxNfjcPbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="182839724"
Received: from opintica-mobl1 (HELO fedora) ([10.245.244.247])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:46:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
Date: Fri, 26 Sep 2025 10:46:23 +0200
Message-ID: <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
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

Add a function to the dma_buf_attach_ops to indicate whether the
connection is a private interconnect. If so the function returns
the address to an interconnect-defined structure that can be
used for further negotiating.

Also add a field to the dma_buf_attachment that indicates whether
a private interconnect is used by the attachment.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/linux/dma-buf.h | 51 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d58e329ac0e7..25dbf1fea09a 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -442,6 +442,39 @@ struct dma_buf {
 #endif
 };
 
+/* RFC: Separate header for the interconnect defines? */
+
+/**
+ * struct dma_buf_interconnect - Private interconnect
+ * @name: The name of the interconnect
+ */
+struct dma_buf_interconnect {
+	const char *name;
+};
+
+/**
+ * struct dma_buf_interconnect_attach_ops - Interconnect attach ops base-class
+ *
+ * Declared for type-safety. Interconnect implementations should subclass to
+ * implement negotiation-specific ops.
+ */
+struct dma_buf_interconnect_attach_ops {
+};
+
+/**
+ * struct dma_buf_interconnect_attach - Interconnect state
+ * @interconnect: The struct dma_buf_interconnect identifying the interconnect
+ *
+ * Interconnect implementations subclass as needed for attachment state
+ * that can't be stored elsewhere. It could, for example, hold a pointer
+ * to a replacement of the sg-list after the attachment has been mapped.
+ * If no additional state is needed, an exporter could define a single
+ * static instance of this struct.
+ */
+struct dma_buf_interconnect_attach {
+	const struct dma_buf_interconnect *interconnect;
+};
+
 /**
  * struct dma_buf_attach_ops - importer operations for an attachment
  *
@@ -475,6 +508,21 @@ struct dma_buf_attach_ops {
 	 * point to the new location of the DMA-buf.
 	 */
 	void (*move_notify)(struct dma_buf_attachment *attach);
+
+	/**
+	 * @supports_interconnect: [optional] - Does the driver support a local interconnect?
+	 *
+	 * Does the importer support a private interconnect? The interconnect is
+	 * identified using a unique address defined instantiated either by the driver
+	 * if the interconnect is driver-private or globally
+	 * (RFC added to the dma-buf-interconnect.c file) if cross-driver.
+	 *
+	 * Return: A pointer to the interconnect-private attach_ops structure if supported,
+	 * %NULL otherwise.
+	 */
+	const struct dma_buf_interconnect_attach_ops *
+	(*supports_interconnect)(struct dma_buf_attachment *attach,
+				 const struct dma_buf_interconnect *interconnect);
 };
 
 /**
@@ -484,6 +532,8 @@ struct dma_buf_attach_ops {
  * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
  * @peer2peer: true if the importer can handle peer resources without pages.
  * @priv: exporter specific attachment data.
+ * @interconnect_attach: Private interconnect state for the connection if used,
+ * NULL otherwise.
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
  * @importer_priv: importer specific attachment data.
@@ -503,6 +553,7 @@ struct dma_buf_attachment {
 	struct list_head node;
 	bool peer2peer;
 	const struct dma_buf_attach_ops *importer_ops;
+	struct dma_buf_interconnect_attach *interconnect_attach;
 	void *importer_priv;
 	void *priv;
 };
-- 
2.51.0

