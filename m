Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B67CBD7D18
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1316910E55A;
	Tue, 14 Oct 2025 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a28iVxT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C010E556;
 Tue, 14 Oct 2025 07:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760426040; x=1791962040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ieEvSJqbDmNfjTwrrLAWK98z4h+TuffhyYkWmricG8=;
 b=a28iVxT7kwU2ZQo/cljcRlJaN71gFg4ygC4GNJWcyItPLcXaKRpAaUdN
 RiXGEeQvJnEx+p03L1lz9P8mNOIryLBY0srYbD+j6QsCvS/e26LlO6u3j
 Z+9z/OIC+jfYsMt36/QLbJl+G6AoIwAgzB+hIMYaRMECvASvHrtPTAqDG
 wlOiuic577s4VeZp1DIqxmTvXDvmfOzpn5wtXU45ZvDtTFWcU3VjTDOc7
 57adMK2PPlyTw6cBYJeaDkIdTfreGpu/KHyg4D9R9VI8in/Qks1G78Cx0
 CYptnD1sRXt7Kso39UMV6eENCDh3IiQ/pAen4bOOZ5XA1Hh6O18hJ0NXK Q==;
X-CSE-ConnectionGUID: UM46mv2dSlap/C0F6swlSQ==
X-CSE-MsgGUID: X+9BE326SxO3sqaYhU3vXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257149"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="73257149"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:13:59 -0700
X-CSE-ConnectionGUID: xnweO6cwRoGzNDVsuvCsww==
X-CSE-MsgGUID: lSI1OuOZTWyCtTPEuj01Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="181369859"
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
Subject: [RFC 3/8] dma-buf: Add support for IOV interconnect
Date: Tue, 14 Oct 2025 00:08:53 -0700
Message-ID: <20251014071243.811884-4-vivek.kasireddy@intel.com>
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

The IOV interconnect is a virtual interconnect between an SRIOV
physical function (PF) and its virtual functions (VFs). In order
for negotiation (or match) to succeed, the exporter is expected
to be a VF while the importer is expected to be the PF.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/dma-buf-interconnect.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
index a72f65ed4806..b569dcab86ce 100644
--- a/include/linux/dma-buf-interconnect.h
+++ b/include/linux/dma-buf-interconnect.h
@@ -3,8 +3,17 @@
 #ifndef __DMA_BUF_INTERCONNECT_H__
 #define __DMA_BUF_INTERCONNECT_H__
 
+#include <linux/pci.h>
 #include <linux/xarray.h>
 
+#define CREATE_IOV_INTERCONNECT(pdev, bar) {		\
+	&(const struct dma_buf_iov_interconnect) {	\
+		.base.type = DMA_BUF_INTERCONNECT_IOV,	\
+		.pdev = (pdev),				\
+		.bar = (bar),				\
+	}.base						\
+}
+
 struct dma_buf_attachment;
 
 struct dma_buf_ranges {
@@ -14,6 +23,7 @@ struct dma_buf_ranges {
 
 enum dma_buf_interconnect_type {
 	DMA_BUF_INTERCONNECT_NONE = 0,
+	DMA_BUF_INTERCONNECT_IOV,
 };
 
 struct dma_buf_interconnect {
@@ -24,6 +34,12 @@ struct dma_buf_interconnect_match {
 	const struct dma_buf_interconnect *interconnect;
 };
 
+struct dma_buf_iov_interconnect {
+	struct dma_buf_interconnect base;
+	struct pci_dev *pdev;
+	unsigned int bar;
+};
+
 struct dma_buf_interconnect_ops {
 	int (*map_interconnect)(struct dma_buf_attachment *attach,
 				struct dma_buf_ranges *ranges);
-- 
2.50.1

