Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C0B9F6E7
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC4810E91A;
	Thu, 25 Sep 2025 13:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZBsKw8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EDB10E919;
 Thu, 25 Sep 2025 13:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758805756; x=1790341756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1yeksaWAq4V6BaDhQbrC0Viq6IggnZtrq6qYX3rMGdQ=;
 b=MZBsKw8zGZoAhA7Slamfoe9DZvo/37aaY7gETygT9hMvrfAG04thMzyi
 rYUK36OWV48Gce+lG0IixRPO90tU8Z4Bd1Ctwur0JH6nWuAyJK9AOZFq0
 aPm6sdHvozE0c3MyG3HzAwHA7csGYCOoPwqvfMs9OYoD4uZvh6QRjqKJ4
 tHYlmBNucZ/A97K4AXiTZp0RC0f2DflzY4nwiO3IaVw86XzmEyYT3qyJ/
 J2+y0qOEwbP6RoIf04mI3lYCwamZdwHvX3/o9CaNxKowLa+52lBBsMZBA
 pG9fK5BIpdIOoUbyh0C0HkSN4WFarZs6jhhJA/MRh0wsRFGi1vtuebHP3 g==;
X-CSE-ConnectionGUID: ozXlseftSy6vQRrc909H+A==
X-CSE-MsgGUID: z/50NLwGQkqr3a19E4RxbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61035818"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61035818"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:09:16 -0700
X-CSE-ConnectionGUID: SeOdXka9Q8yRdM297PtsgQ==
X-CSE-MsgGUID: WdQONycdTvqgPpp5BMByQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="201011381"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.100])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 06:09:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 1/2] dma-buf: Add support for private interconnects
Date: Thu, 25 Sep 2025 15:08:48 +0200
Message-ID: <20250925130849.12021-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
References: <20250925130849.12021-1-thomas.hellstrom@linux.intel.com>
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
 include/linux/dma-buf.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index d58e329ac0e7..e7191edb2125 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -475,6 +475,19 @@ struct dma_buf_attach_ops {
 	 * point to the new location of the DMA-buf.
 	 */
 	void (*move_notify)(struct dma_buf_attachment *attach);
+
+	/**
+	 * @supports_interconnect: [optional] - Does the driver support a local interconnect?
+	 *
+	 * Does the importer support a private interconnect? The interconnect is
+	 * identified using a unique address defined by the exporter and declared
+	 * in a protocol header. (RFC: Should this be a struct instead).
+	 *
+	 * Return: A pointer to the interconnect-private attach_ops structure if supported,
+	 * %NULL otherwise.
+	 */
+	const void *(*supports_interconnect)(struct dma_buf_attachment *attach,
+					     const void *interconnect);
 };
 
 /**
@@ -484,6 +497,7 @@ struct dma_buf_attach_ops {
  * @node: list of dma_buf_attachment, protected by dma_resv lock of the dmabuf.
  * @peer2peer: true if the importer can handle peer resources without pages.
  * @priv: exporter specific attachment data.
+ * @interconnect: Private interconnect to use if any, NULL otherwise.
  * @importer_ops: importer operations for this attachment, if provided
  * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
  * @importer_priv: importer specific attachment data.
@@ -503,6 +517,7 @@ struct dma_buf_attachment {
 	struct list_head node;
 	bool peer2peer;
 	const struct dma_buf_attach_ops *importer_ops;
+	const void *interconnect;
 	void *importer_priv;
 	void *priv;
 };
-- 
2.51.0

