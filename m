Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497468C6DDD
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6708610E1D6;
	Wed, 15 May 2024 21:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXpZqpdC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B9A10E1D6;
 Wed, 15 May 2024 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809379; x=1747345379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VWumwO4JTUn0RMZg/K/sOdW7Z8QtJmS2dmW4AjvMp4M=;
 b=IXpZqpdCpa9J5UANVip2KMsDKUplV81DOTLXh2sxRs8Ph7dKEEHI/1fF
 pqBqHINWwvWZBhTPkYjQjpoc0Nnq5ftLvBWvijFf8r9RmCvDbZV5aFCAE
 ermnB7maG+o65EDbPxmPfr9M2pWqPvHi4IAfgeqHhsur+p7AMRb80maQy
 g6CIeWorDyKyyjaT/2H74l7P+1Q5i4eU5frAocoS8L/LNjZCHrU6YRBbE
 J25W45ZfDmJBqkecyxtIgl3ezp4M6QXzrDT2BUjwg61cD0w4RFedtWhqb
 1sbnb5uZQb4y0NX8pFqwj0de5gSJlIOc4zQz3JBYyWjneyQRmwszObcZD g==;
X-CSE-ConnectionGUID: ZPcjNUT6R+qLzMvF/p9cAQ==
X-CSE-MsgGUID: feurSZCHTVSStPFv9kXL6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11739159"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11739159"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
X-CSE-ConnectionGUID: rT02rY+CRHK+vsmTNclmZQ==
X-CSE-MsgGUID: HvABzK7zT5iMR8xmn8e/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35651125"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v4 1/8] drm/xe: Promote xe_hw_engine_class_to_str()
Date: Wed, 15 May 2024 14:42:51 -0700
Message-ID: <20240515214258.59209-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515214258.59209-1-lucas.demarchi@intel.com>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
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

Move it out of the sysfs compilation unit so it can be re-used in other
places.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c             | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h             |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 18 ------------------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 45f582a7caaa..520db5d518c3 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1099,3 +1099,21 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	return xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
+
+const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
+{
+	switch (class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return "rcs";
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		return "vcs";
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return "vecs";
+	case XE_ENGINE_CLASS_COPY:
+		return "bcs";
+	case XE_ENGINE_CLASS_COMPUTE:
+		return "ccs";
+	default:
+		return NULL;
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..843de159e47c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -67,4 +67,6 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 	return hwe->name;
 }
 
+const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
index 844ec68cbbb8..efce6c7dd2a2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
@@ -618,24 +618,6 @@ static void hw_engine_class_sysfs_fini(struct drm_device *drm, void *arg)
 	kobject_put(kobj);
 }
 
-static const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
-{
-	switch (class) {
-	case XE_ENGINE_CLASS_RENDER:
-		return "rcs";
-	case XE_ENGINE_CLASS_VIDEO_DECODE:
-		return "vcs";
-	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
-		return "vecs";
-	case XE_ENGINE_CLASS_COPY:
-		return "bcs";
-	case XE_ENGINE_CLASS_COMPUTE:
-		return "ccs";
-	default:
-		return NULL;
-	}
-}
-
 /**
  * xe_hw_engine_class_sysfs_init - Init HW engine classes on GT.
  * @gt: Xe GT.
-- 
2.43.0

