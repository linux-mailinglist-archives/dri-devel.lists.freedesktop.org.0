Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E688C8D67
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 22:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B5510EF78;
	Fri, 17 May 2024 20:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqrSrOR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFC510E18D;
 Fri, 17 May 2024 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715978590; x=1747514590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GTfAKeDB2dopS7Vzx9gfOKKkLX5ydQj9w0nD3eGwWvQ=;
 b=NqrSrOR3NJ0wGI39UMma5w75LhMDv0XE95kCovX/lbInVF3w3BhssTpd
 vaF/NkqZFzzcHPXHjjM5XWsr/+TX0bDBaNepvVpPZbLo5ru9/8NhSWseZ
 UxY43ujOa8wTjlsekFK9VMpQLsiQ45CLnZKw7Mys3EOxLoEcpr9OJJpuS
 XI6Tm6JOfoC3XHa3VsiMaLfnFe2fDsTe3Xs6d3sppXFRFSPN709hgSBMo
 +U6JTy8+zhZNGvTnL5bIq+ojlrMiZkNkg2y+SyxrKiID9HX7j47CTqD3q
 FXJH4elFr3am9Bzt2fHmcoDmmVkpmhx6oTAZEInBglthWK8mfzd++u5zS w==;
X-CSE-ConnectionGUID: 5oGl+eMaQ662v6TpI5NZ8g==
X-CSE-MsgGUID: vjomsRtfRjOdjyfTHYorqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12027911"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12027911"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:09 -0700
X-CSE-ConnectionGUID: DaExsfUvSDKBPpxbrieECA==
X-CSE-MsgGUID: CAQI1GcrTHaU7I764xr/3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="55125236"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 13:43:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v5 1/8] drm/xe: Promote xe_hw_engine_class_to_str()
Date: Fri, 17 May 2024 13:43:03 -0700
Message-ID: <20240517204310.88854-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517204310.88854-1-lucas.demarchi@intel.com>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
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
index e19af179af33..b71e90c555fa 100644
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

