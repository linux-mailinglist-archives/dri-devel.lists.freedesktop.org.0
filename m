Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66C0A55995
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 23:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A916710E04B;
	Thu,  6 Mar 2025 22:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEtGi3CS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3E310E045;
 Thu,  6 Mar 2025 22:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741299690; x=1772835690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EyULSld3oFWu1aAzKZG5HS557++PDyMmr9/yaLEX7Zw=;
 b=eEtGi3CSAHTZQMLkWJHxcuNGkakRi1yugJekdllJ1PRqrx76SRLzVH5R
 JO4sBpdluR52TkTe9BkW387iU0DW1epsIE9sKzP8M/KTJle9Q5v+6AFO0
 9bQPmpYZIjK92hp4ANeuSqry3rXfN//sVO9PujMEA89nqCsLpKrKhgRN/
 VllJu2Kjm7jwBLIthQbfFVmGtdkGEWehcOlXljpvlC9FrznNjzNP9OF/D
 myn/nSKjN/RVLVFMspV4VkXQyV0eZAGp4OXJ14d751JQiRureuIQXWqfK
 xHUQby2CGX2tFvcaCjx8xU3GEG6pu7FinIzLs2/Cmbzgh1Y9QO7XFc6hm w==;
X-CSE-ConnectionGUID: PpdKDqpYSn2v2/xHQSHkZg==
X-CSE-MsgGUID: /a+1vRN+RFaIEBOytZCe1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53736304"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53736304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:21:30 -0800
X-CSE-ConnectionGUID: unGo3IuRQbams69OC63maw==
X-CSE-MsgGUID: xTrfNQ0DSPOhf6GuySDdWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119662862"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 14:21:28 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 1/3] drm/drm_mm: Safe macro for iterating through nodes in
 range
Date: Thu,  6 Mar 2025 23:21:24 +0100
Message-Id: <20250306222126.3382322-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306222126.3382322-1-tomasz.lis@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
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

Benefits of drm_mm_for_each_node_safe and drm_mm_for_each_node_in_range
squished together into one macro.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
Cc: dri-devel@lists.freedesktop.org
Cc: Christian König <christian.koenig@amd.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

 include/drm/drm_mm.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index f654874c4ce6..43e99441f6ba 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -504,6 +504,25 @@ __drm_mm_interval_first(const struct drm_mm *mm, u64 start, u64 last);
 	     node__->start < (end__);					\
 	     node__ = list_next_entry(node__, node_list))
 
+/**
+ * drm_mm_for_each_node_in_range_safe - iterator to walk over a range of
+ * allocated nodes
+ * @node__: drm_mm_node structure to assign to in each iteration step
+ * @next__: &struct drm_mm_node to store the next step
+ * @mm__: drm_mm allocator to walk
+ * @start__: starting offset, the first node will overlap this
+ * @end__: ending offset, the last node will start before this (but may overlap)
+ *
+ * This iterator walks over all nodes in the range allocator that lie
+ * between @start and @end. It is implemented similarly to list_for_each_safe(),
+ * so safe against removal of elements.
+ */
+#define drm_mm_for_each_node_in_range_safe(node__, next__, mm__, start__, end__)	\
+	for (node__ = __drm_mm_interval_first((mm__), (start__), (end__)-1), \
+		next__ = list_next_entry(node__, node_list); \
+	     node__->start < (end__);					\
+	     node__ = next__, next__ = list_next_entry(next__, node_list))
+
 void drm_mm_scan_init_with_range(struct drm_mm_scan *scan,
 				 struct drm_mm *mm,
 				 u64 size, u64 alignment, unsigned long color,
-- 
2.25.1

