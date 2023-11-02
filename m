Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAC27DEBCA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6418810E80E;
	Thu,  2 Nov 2023 04:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AF610E7FE;
 Thu,  2 Nov 2023 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698899072; x=1730435072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=998btFXeKIHao/vtnWrxBwSg/rS8lCXIJvNCwrK1FKc=;
 b=DTBqIRjuHqz5gDDqF+oCQ+zUpC+kJTgL8Qall/eNUx6ZN9VjRi/4ld+x
 qsRl/9HX6y3lC0v/rufA561HQHW1Jnv8KeNZF3onLW985jviZ8Vjt/Ygh
 lsQjaelK0oMuCeNUKu664GuRNDd7mNBn2oi4LirhzSPSe3bDJa4jCn5TW
 yeL6rvRk9dUbtmDXZ9vTFdD/xKLW3oD+2DTQ+dNrBMGlg2cWcQjBc4VWk
 uwJmxY34dJ4ku8xH12L7gimOBRxCEB1qwtSAftyhiFUmFVbjriLX7P+zS
 kN4X1SSZfBv2KQroum8sX4Jzq2KFptAFFqCmDOWuGJ2UY5NM/VNcZHUzl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930920"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930920"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="884762628"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="884762628"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:24:30 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC 06/11] drm/ttm: Set lru manager to ttm resource manager
Date: Thu,  2 Nov 2023 00:33:01 -0400
Message-Id: <20231102043306.2931989-7-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231102043306.2931989-1-oak.zeng@intel.com>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a weak reference of lru manager to ttm resource manager,
and add a function to set lru manager for ttm resource manager.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 include/drm/ttm/ttm_resource.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 92241c2374fa..e4fc1ada5236 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -46,6 +46,7 @@ struct iosys_map;
 struct io_mapping;
 struct sg_table;
 struct scatterlist;
+struct drm_lru_mgr;
 
 struct ttm_resource_manager_func {
 	/**
@@ -172,6 +173,12 @@ struct ttm_resource_manager {
 	 * bdev->lru_lock.
 	 */
 	uint64_t usage;
+
+	/**
+	 * @lru_mgr: weak reference of the lru manager that manages lru
+	 * list for this ttm resource manager.
+	 */
+	struct drm_lru_mgr *lru_mgr;
 };
 
 /**
@@ -326,6 +333,18 @@ static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
 	return man->use_type;
 }
 
+/**
+ * ttm_resource_manager_set_lru_mgr
+ *
+ * @man: ttm resource manager
+ * @mgr: pointing to lru manager
+ */
+static inline void
+ttm_resource_manager_set_lru_mgr(struct ttm_resource_manager *man, struct drm_lru_mgr *mgr)
+{
+	man->lru_mgr = mgr;
+}
+
 /**
  * ttm_resource_manager_cleanup
  *
-- 
2.26.3

