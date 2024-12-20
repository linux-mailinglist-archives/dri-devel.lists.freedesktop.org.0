Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E529F9D1C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2024 00:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E9410E035;
	Fri, 20 Dec 2024 23:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOulWUAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEDF10E00C;
 Fri, 20 Dec 2024 23:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734737653; x=1766273653;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=05sipoV5dMTcdRjZIByNE8YyyEFgEfS83me2PSaMWj8=;
 b=IOulWUAjFbjNSiU8SMHzeOg3hpC4AiuOThH/TMHO/mEghQT7p9RSDpVd
 /yBgzmziBObIooiy+O0wA+9v4SFaJF9tZQOjkvXueC8BJpx0udZwqfMef
 9nMobomWm4o5/wrqkfsus4CkNLmpKtga90rP2dEf52EsFOhO9gi9ihKna
 jyr/12ObgztG4LPiKoBL58tWbSV4w4WnIzLAb31d0M/j45MiBQxvwUBjT
 xQf9Wrg4uTWYm+UZ/O/1IX1KcGs2h1L++OtrU108AodNpcRxEzqQQhDgk
 v7ZTribzMxs3THK5KNh/Hd50K1WAPg7h2ipXvFw5Voizx6Ci4lGb8tP+q Q==;
X-CSE-ConnectionGUID: 4y8o1ISfQ7yZ4tOJz7nn5g==
X-CSE-MsgGUID: jySQ8v4MR/WeT24UaKYZ1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57768594"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="57768594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 15:34:12 -0800
X-CSE-ConnectionGUID: RjTxexYNScGvYwC3V6Qwkg==
X-CSE-MsgGUID: y2kqp7wZS3GoDBoQQgDM7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; d="scan'208";a="99156403"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa009.fm.intel.com with ESMTP; 20 Dec 2024 15:34:11 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/drm_mm: Safe macro for iterating through nodes in
 range
Date: Sat, 21 Dec 2024 00:34:07 +0100
Message-Id: <20241220233409.2956004-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220233409.2956004-1-tomasz.lis@intel.com>
References: <20241220233409.2956004-1-tomasz.lis@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Benefits of drm_mm_for_each_node_safe and drm_mm_for_each_node_in_range
squished together into one macro.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
Cc: dri-devel@lists.freedesktop.org

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

