Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BBD49D3AC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC5610E95E;
	Wed, 26 Jan 2022 20:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41B210E421;
 Wed, 26 Jan 2022 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229386; x=1674765386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SxwOX/KvCGehbJ+xk/iHXJSG5hnovWhcQo3g+1qN37Y=;
 b=bMnqugziiU2pu2cOdKPsz+7UQMnwsOah3BxrFOhlmVLE0dnTgoFXve2G
 ngi/e0md8M3PpB9W48vQBpqHzRjisyNslDYyOW6rEaQC5NaIkAmwuYjpC
 pSPvR1/iPuZEpS1c+cc7vaAqNTon4I252U35+CCnmCYeVDx8istUJg+UR
 unMrhH/sHhwKtD9cuJ992N2bmFIAQM5XkXAsEl1IUY1lLXvsQnhCmcEyr
 A6JNADEzm1OMVEMfXXevcm3OSw1QJ6FuA1bb1ksA8LRnLQ2x7DOo1pova
 V4cFjO/FNcNicDZRQAESbsT6+LPkl85JH46XGEIvFg6ofbR8hIAm3reRi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000495"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221493"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 02/19] dma-buf-map: Add helper to initialize second map
Date: Wed, 26 Jan 2022 12:36:45 -0800
Message-Id: <20220126203702.1784589-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220126203702.1784589-1-lucas.demarchi@intel.com>
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When dma_buf_map struct is passed around, it's useful to be able to
initialize a second map that takes care of reading/writing to an offset
of the original map.

Add a helper that copies the struct and add the offset to the proper
address.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/dma-buf-map.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index 65e927d9ce33..3514a859f628 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -131,6 +131,35 @@ struct dma_buf_map {
 		.is_iomem = false, \
 	}
 
+/**
+ * DMA_BUF_MAP_INIT_OFFSET - Initializes struct dma_buf_map from another dma_buf_map
+ * @map_:	The dma-buf mapping structure to copy from
+ * @offset:	Offset to add to the other mapping
+ *
+ * Initializes a new dma_buf_struct based on another. This is the equivalent of doing:
+ *
+ * .. code-block: c
+ *
+ *	dma_buf_map map = other_map;
+ *	dma_buf_map_incr(&map, &offset);
+ *
+ * Example usage:
+ *
+ * .. code-block: c
+ *
+ *	void foo(struct device *dev, struct dma_buf_map *base_map)
+ *	{
+ *		...
+ *		struct dma_buf_map = DMA_BUF_MAP_INIT_OFFSET(base_map, FIELD_OFFSET);
+ *		...
+ *	}
+ */
+#define DMA_BUF_MAP_INIT_OFFSET(map_, offset_)	(struct dma_buf_map)	\
+	{								\
+		.vaddr = (map_)->vaddr + (offset_),			\
+		.is_iomem = (map_)->is_iomem,				\
+	}
+
 /**
  * dma_buf_map_set_vaddr - Sets a dma-buf mapping structure to an address in system memory
  * @map:	The dma-buf mapping structure
-- 
2.35.0

