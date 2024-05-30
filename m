Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687948D491F
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 12:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D46810E6FB;
	Thu, 30 May 2024 10:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R83T4z8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C386410E6FB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717063328; x=1748599328;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1LP2rTo7NH0u3HUMgvoQtIkwfwWpjfpCFYaEhS+TgdI=;
 b=R83T4z8O1rpXRNZ9Ji6yJHaVjStc4ZVqQg1wtDs7tcoO88ywDLuXjB4w
 O5Xbo3C4NTwMPvJmMe5Z26ILxCDOPLtZ5pN1ngvCIfQt4z180RvHe9etZ
 MwnZagCmmzrE+NaCmNGeNkeY5KyWMY73QBGF/AzP2S3yCuw2YOO1quIXw
 S4U6HsRFpDpbHo6WFYQUXRam1ULm4RAdNnxjsrfqCI+wNoXfFMwDLQuZj
 ZfBlGxZN4DXiclewHdB/gYf9vr5RIHqzuEKwQwwyMPqs1ThFFiHgPqTXP
 YoiRbCWGPK8tMYsH5ZMW3vcwVg/JkjOM5EHq8tVLXKP9TRFsiM4qQAszT A==;
X-CSE-ConnectionGUID: +/B8HHxnSnCeuCnE/FZYNA==
X-CSE-MsgGUID: 4wDjwBxvRZe/NFzozPSphA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24942805"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24942805"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 03:02:07 -0700
X-CSE-ConnectionGUID: 899tdr+XSt+622yob0QDcA==
X-CSE-MsgGUID: q2Tk505KSB+DoG7+DejYbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="40235059"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 03:02:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 Jani Nikula <jani.nikula@intel.com>, stable@vger.kernel.org
Subject: [PATCH 1/4] drm/exynos/vidi: fix memory leak in .get_modes()
Date: Thu, 30 May 2024 13:01:51 +0300
Message-Id: <20240530100154.317683-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

The duplicated EDID is never freed. Fix it.

Cc: stable@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index fab135308b70..11a720fef32b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -309,6 +309,7 @@ static int vidi_get_modes(struct drm_connector *connector)
 	struct vidi_context *ctx = ctx_from_connector(connector);
 	struct edid *edid;
 	int edid_len;
+	int count;
 
 	/*
 	 * the edid data comes from user side and it would be set
@@ -328,7 +329,11 @@ static int vidi_get_modes(struct drm_connector *connector)
 
 	drm_connector_update_edid_property(connector, edid);
 
-	return drm_add_edid_modes(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+
+	kfree(edid);
+
+	return count;
 }
 
 static const struct drm_connector_helper_funcs vidi_connector_helper_funcs = {
-- 
2.39.2

