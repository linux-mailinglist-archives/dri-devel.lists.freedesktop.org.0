Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C780A8BEFE8
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 00:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420051126EA;
	Tue,  7 May 2024 22:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uxj4USRQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A83C1126E0;
 Tue,  7 May 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121861; x=1746657861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DmUA2h/AYvyS1Rhm7e9Y8lTqQWDErqUG/Jbau8Lf1u8=;
 b=Uxj4USRQXEjKTtNqOeB08xpmcAQEXoNQW8y0EfQMxmcW+bNIjP3g7cxr
 4J9HwAkcAh7yDU1YVKQKaxV7u1W7EZ315taJd5ZVICyUqGbiZzePimhHg
 FLi74u+M6G3LgUOJ6O8tbsPkLBy/Bp3eA3vkm9wlnmLSWgb5Vwm+vYODA
 VOX8+OZYyKexaiDGsFqtxKVQ20BlCm1CwVzXkv+q9UvppznCe4HfZMdu4
 5cOHxZWrvmVsJewOH/lwsXZ0cEm503Gjdrjyohdt5w6sjlUG+a8u45Uk+
 RuhnRQ63ubeEyOXyfRELYZh+dvPSF78Te7NEc82Qa8YAJSyPt+Crn7WcQ Q==;
X-CSE-ConnectionGUID: IISsVdi+QNKqYjARFQTT6Q==
X-CSE-MsgGUID: 4G0OhFLeS2GPZ4G9lCFLdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108492"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108492"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
X-CSE-ConnectionGUID: lRc9pZhgSfWr59U1QB+DoQ==
X-CSE-MsgGUID: zmjwI7elRzG6erCflmFYrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="29231497"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 1/6] drm/xe: Promote xe_hw_engine_class_to_str()
Date: Tue,  7 May 2024 15:45:05 -0700
Message-ID: <20240507224510.442971-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507224510.442971-1-lucas.demarchi@intel.com>
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
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
index ec69803152a2..85712650be22 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1088,3 +1088,21 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
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

