Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED9A27E63
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 23:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB0D10E6F8;
	Tue,  4 Feb 2025 22:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+iUWDVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB6410E101
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 22:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738708901; x=1770244901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tTfo64QNYJSeFvtjFlJGX/AKG/Gy7FmzIRGSQpsEmW8=;
 b=D+iUWDVLIWX5pTQ0fnSCepD4czGzlt5lfxmdXKILWg/eDrjnAdxjd1wr
 iV8KzB6RxrGjg2P/0sYWIn4xCUAYO9QyQqyAvkhmWhSSsWAGkxtshBH0L
 hj1aBdldoKWrmrDkwj7rlKNyLhWEkdwM5dsZzpPaNApxt19rl0DUSmMar
 o3o5iTrrMGEhuBKPWZj8au185lTqsLuzhoFRPF8GzsFyMHMGZ8P0aEb2r
 M9spP/Mba6uNvWheesHGZEgds7iiDUoo4T2tGvy4430h4vKgxGW9vo6vG
 4eGhjRhyamyCq3UakguFifjYrDfJCEuL1qPxogw6fl2Tr77WfuamRAYaI w==;
X-CSE-ConnectionGUID: DoBqPW64Qgmzrj05IiHisA==
X-CSE-MsgGUID: filBq/0OSJqyVWiiNHz0Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56686001"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="56686001"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:41:40 -0800
X-CSE-ConnectionGUID: VJ+DC0w/Rf+X5bI6AqO3FA==
X-CSE-MsgGUID: WZKrbdOJSlKBmDSKDHWMcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="111272720"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 14:41:39 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [RFC 1/1] drm/mm: Introduce address space shifting
Date: Tue,  4 Feb 2025 23:41:36 +0100
Message-Id: <20250204224136.3183710-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204224136.3183710-1-tomasz.lis@intel.com>
References: <20250204224136.3183710-1-tomasz.lis@intel.com>
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

Due to resource reprovisioning, sometimes a need arises to move
a living address space to a new area, preserving all the nodes
and holes stored within.

It is possible to do that by removing all nodes to a temporary list,
reiniting the drm_mm instance and re-adding everything while applying
a shift to each node. But that is a lot of extra work for a task
which could be done internally without any node shuffle operations.

This change introduces an interface which allows to shift the range
without pruning the whole drm_mm instance.

Having a drm_mm interface for such shift significantly simplifies
the code required to adjust a KMD for a change in base address
of a space managed by drm_mm instance.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
 include/drm/drm_mm.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index ca254611b382..ce3bd8b5e41f 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -917,6 +917,30 @@ struct drm_mm_node *drm_mm_scan_color_evict(struct drm_mm_scan *scan)
 }
 EXPORT_SYMBOL(drm_mm_scan_color_evict);
 
+/**
+ * drm_mm_shift - move the range of addresses managed by this @mm
+ * @mm: the drm_mm structure instance to shift
+ * @shift: the shift value to be added to addresses of all nodes
+ *
+ * The function shifts all nodes by given offset, moving the address space
+ * range managed by this @mm.
+ */
+void drm_mm_shift(struct drm_mm *mm, s64 shift)
+{
+	struct drm_mm_node *node;
+
+	/*
+	 * Head node represents a hole, with negative size and start at the end
+	 * of addressable area. This means it is never present within nodes
+	 * list - needs to be shifted separately.
+	 */
+	mm->head_node.start += shift;
+
+	drm_mm_for_each_node(node, mm)
+		node->start += shift;
+}
+EXPORT_SYMBOL(drm_mm_shift);
+
 /**
  * drm_mm_init - initialize a drm-mm allocator
  * @mm: the drm_mm structure to initialize
diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index f654874c4ce6..798e5a4f07ad 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -465,6 +465,7 @@ static inline int drm_mm_insert_node(struct drm_mm *mm,
 void drm_mm_remove_node(struct drm_mm_node *node);
 void drm_mm_init(struct drm_mm *mm, u64 start, u64 size);
 void drm_mm_takedown(struct drm_mm *mm);
+void drm_mm_shift(struct drm_mm *mm, s64 shift);
 
 /**
  * drm_mm_clean - checks whether an allocator is clean
-- 
2.25.1

