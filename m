Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE4D49D3BD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9ACF10E963;
	Wed, 26 Jan 2022 20:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFFD10E802;
 Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229387; x=1674765387;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IrlXjlrSWxXOy2UwGYcFGyJqa/q0NhSjnDXBLVc54aM=;
 b=PF6ElnBFQKkhQxfe/7+bqkSQ1NVaqiHcfvyxwetyvgQtHZMHi6HGrabz
 CGiwIczEVw9wAdPCDunMjV6hkemhdUdG2mfMLy9rGf09of4UBDTTJyl9/
 azrIDS/oHZBvBt0sRVVi9Mykvzz3z3rbQJsHs9QLstfDnXvTNdyrac6wV
 L8zu2gQkC91ljMau63OFUWB0SqA5pIAsK5TnL8e/hlyCiNR4jOa/LKHUI
 Ge7LVt0wMHEKFeBgNCWXw8wwmvTp9eM90k5T93A2JGLaJGQbcvfLbGdPc
 MtjkME+OgY5arDCwYEDyNshWLDxCaSkczprOKXwWYHE/24j5TI+a7gYPU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000505"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000505"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221519"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/19] dma-buf-map: Add wrapper over memset
Date: Wed, 26 Jan 2022 12:36:52 -0800
Message-Id: <20220126203702.1784589-10-lucas.demarchi@intel.com>
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

Just like memcpy_toio(), there is also need to write a direct value to a
memory block. Add dma_buf_map_memset() to abstract memset() vs memset_io()

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/dma-buf-map.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
index 3514a859f628..c9fb04264cd0 100644
--- a/include/linux/dma-buf-map.h
+++ b/include/linux/dma-buf-map.h
@@ -317,6 +317,23 @@ static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *sr
 		memcpy(dst->vaddr, src, len);
 }
 
+/**
+ * dma_buf_map_memset - Memset into dma-buf mapping
+ * @dst:	The dma-buf mapping structure
+ * @value:	The value to set
+ * @len:	The number of bytes to set in dst
+ *
+ * Set value in dma-buf mapping. Depending on the buffer's location, the helper
+ * picks the correct method of accessing the memory.
+ */
+static inline void dma_buf_map_memset(struct dma_buf_map *dst, int value, size_t len)
+{
+	if (dst->is_iomem)
+		memset_io(dst->vaddr_iomem, value, len);
+	else
+		memset(dst->vaddr, value, len);
+}
+
 /**
  * dma_buf_map_incr - Increments the address stored in a dma-buf mapping
  * @map:	The dma-buf mapping structure
-- 
2.35.0

