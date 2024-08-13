Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF997950499
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 14:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651B510E31A;
	Tue, 13 Aug 2024 12:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYaRD188";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DF010E31A;
 Tue, 13 Aug 2024 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551186; x=1755087186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e7aAkUAOvQI0AJNRk7wUAPuWDxjmt0yF+bVjRvPT56Y=;
 b=LYaRD188klC/n+CnpHyXLl20hv0kP1xJzlN9FKsDBnVNgVnlU8uSYDmI
 P0vhRSxDVWMkJUYuNJv1lfBF8ro7MPforniY/Qr/2FTf7Vqo8NosUQThF
 EH/hwQfSjGg7VnK2BecSUCIVpigKzslYQNxaSkgvFlxvenFlsevh/3zqM
 PB59kSK48gi+wBQMjryGlhyB6RfL/1bDjd6Wfw4UK6c2+peX/txrSV16+
 O+GtUkGpKNdZGJuVQuB+MoykDBFP1v6Xrievf3rVHt50X+iZt+eY+brpm
 OzNm/1+TlaKMRnQdG0oCp/KMKpJlWCtGaPTZLI7yCNjmHvkHDOSoQQzVL g==;
X-CSE-ConnectionGUID: Kjq+SYZFQEu0KnyBJfiSnQ==
X-CSE-MsgGUID: uDKyJlCJSxa+hiq4WqKV8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21682661"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21682661"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:13:05 -0700
X-CSE-ConnectionGUID: +U7NRZz+RJCuoKL1wc8Auw==
X-CSE-MsgGUID: DeUeRhHlR4m/2bjsj/r5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="89450958"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:12:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, akinobu.mita@gmail.com,
 akpm@linux-foundation.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, jani.nikula@intel.com
Subject: [PATCH 2/3] drm/msm: clean up fault injection usage
Date: Tue, 13 Aug 2024 15:12:36 +0300
Message-Id: <20240813121237.2382534-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813121237.2382534-1-jani.nikula@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

With the proper stubs in place in linux/fault-inject.h, we can remove a
bunch of conditional compilation for CONFIG_FAULT_INJECTION=n.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 --
 drivers/gpu/drm/msm/msm_drv.c     | 2 --
 drivers/gpu/drm/msm/msm_drv.h     | 4 ----
 3 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 4494f6d1c7cb..7ab607252d18 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -357,12 +357,10 @@ void msm_debugfs_init(struct drm_minor *minor)
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
 
-#ifdef CONFIG_FAULT_INJECTION
 	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
 				  &fail_gem_alloc);
 	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
 				  &fail_gem_iova);
-#endif
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9c33f4e3f822..6938410f4fc7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,10 +58,8 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-#ifdef CONFIG_FAULT_INJECTION
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
-#endif
 
 static int msm_drm_uninit(struct device *dev)
 {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index be016d7b4ef1..9b953860131b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -33,12 +33,8 @@
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
 
-#ifdef CONFIG_FAULT_INJECTION
 extern struct fault_attr fail_gem_alloc;
 extern struct fault_attr fail_gem_iova;
-#else
-#  define should_fail(attr, size) 0
-#endif
 
 struct msm_kms;
 struct msm_gpu;
-- 
2.39.2

