Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077298D4922
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 12:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0106A10EACF;
	Thu, 30 May 2024 10:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eG28fZYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E006910EACF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717063347; x=1748599347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TV8L7SOfK4ik4ni0oilI243+kNblJd3tywN/0cG5/qk=;
 b=eG28fZYphVzyT0Yv8rIz1O9XK6QDUtKHVczYikyM0oFCXj4fsjx2nART
 vm3yyAIfsDLiT5nEq5noRhuksR0mFO1V4lB6l1cer3KvA6S0RhKpM/O5W
 9yo+A3Ff5DQxdAHEmq3wMnh5QjBCOhZPy7LWaDAGWohsM+6THjszaf9Dk
 +Sp0TC0SLcCse3qu7ZEYZqYaD47kVxp2MN6cGT4A2R0PqYoTR12oeDZd5
 ME5OVHBXHklMyuZSitnEOUP6vVmQmrK0ppW34iF8bf2Nm2FJlym9kF+2V
 g1OaUcdS67+Gufheu4tHEMtI3xZhlDCAMCNt7Wfp4Czcj0huLqDQs/Ept g==;
X-CSE-ConnectionGUID: IsAsTbYxQ6S0aOofZDmqxg==
X-CSE-MsgGUID: /2eTdhEITcGgLSfCiAiFqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24942842"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24942842"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 03:02:27 -0700
X-CSE-ConnectionGUID: r/VNIMo/QmWVkH1yT9iFTg==
X-CSE-MsgGUID: preaaPqTSQ2aCTnQMxZ0pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40235192"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 03:02:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 3/4] drm/exynos/vidi: simplify fake edid handling
Date: Thu, 30 May 2024 13:01:53 +0300
Message-Id: <20240530100154.317683-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240530100154.317683-1-jani.nikula@intel.com>
References: <20240530100154.317683-1-jani.nikula@intel.com>
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

Avoid assigning fake_edid_info to ctx->raw_edid. Always keep
ctx->raw_edid either an allocated pointer or NULL. Defer fake_edid_info
handling to .get_modes().

This should be functionally equivalent but slightly easier to follow.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 40 +++++++-----------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index f613df719a02..d93801ace79a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -195,12 +195,11 @@ static ssize_t vidi_store_connection(struct device *dev,
 	if (ctx->connected > 1)
 		return -EINVAL;
 
-	/* use fake edid data for test. */
-	if (!ctx->raw_edid)
-		ctx->raw_edid = (struct edid *)fake_edid_info;
-
-	/* if raw_edid isn't same as fake data then it can't be tested. */
-	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
+	/*
+	 * Use fake edid data for test. If raw_edid is set then it can't be
+	 * tested.
+	 */
+	if (ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
 		return -EINVAL;
 	}
@@ -261,15 +260,9 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 			return -ENOMEM;
 		}
 	} else {
-		/*
-		 * with connection = 0, free raw_edid
-		 * only if raw edid data isn't same as fake data.
-		 */
-		if (ctx->raw_edid && ctx->raw_edid !=
-				(struct edid *)fake_edid_info) {
-			kfree(ctx->raw_edid);
-			ctx->raw_edid = NULL;
-		}
+		/* with connection = 0, free raw_edid */
+		kfree(ctx->raw_edid);
+		ctx->raw_edid = NULL;
 	}
 
 	ctx->connected = vidi->connection;
@@ -310,16 +303,7 @@ static int vidi_get_modes(struct drm_connector *connector)
 	struct edid *edid;
 	int count;
 
-	/*
-	 * the edid data comes from user side and it would be set
-	 * to ctx->raw_edid through specific ioctl.
-	 */
-	if (!ctx->raw_edid) {
-		DRM_DEV_DEBUG_KMS(ctx->dev, "raw_edid is null.\n");
-		return 0;
-	}
-
-	edid = drm_edid_duplicate(ctx->raw_edid);
+	edid = drm_edid_duplicate(ctx->raw_edid ?: fake_edid_info);
 	if (!edid)
 		return 0;
 
@@ -467,10 +451,8 @@ static void vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
-	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
-		kfree(ctx->raw_edid);
-		ctx->raw_edid = NULL;
-	}
+	kfree(ctx->raw_edid);
+	ctx->raw_edid = NULL;
 
 	component_del(&pdev->dev, &vidi_component_ops);
 }
-- 
2.39.2

