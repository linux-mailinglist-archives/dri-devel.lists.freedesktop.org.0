Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D279E78C936
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF77510E431;
	Tue, 29 Aug 2023 16:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241C110E41E;
 Tue, 29 Aug 2023 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324798; x=1724860798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XwhxvOU3P16BtBGSMlwCxk6Zuwv0IuNz7yvBmEEaa6U=;
 b=heycHYv0ZZZKiXiCd1MC8909QmcWIi8RyTxdObwCUUYFIu8tRAq2gULf
 W3h4DMzw/TJBDUm1nH76Zqg5mthdb3Od4vqU2U5vcqnjdd7IqEXFWq/Z6
 nToK6w8GGkrN/LqcxAuVx56LQLhY7f4y4cB515DUNmAEc+hmOboC8rGLg
 ENFrOomaRD9KwkfobZJClzgNXas66czJYXm6NMyHlADab5D6ZdtnV7OOL
 lKkkLCvIdQqMFOQdby5SQklVoQYPV1C3uVXztC4Ty2BXWS6S3igiACxKx
 silzZtmSn/6ARbUcs/apfoKzKyCMAY6BeViMmKCV1iKYCq7cVhZo8Xsw2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769490"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769490"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555223"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555223"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:45 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 31/33] drm/i915/color: Enable plane color features
Date: Tue, 29 Aug 2023 21:34:20 +0530
Message-ID: <20230829160422.1251087-32-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Initialize and expose all plane color features.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c         | 1 -
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 956080fb7fcd..4e5c82c88bd4 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4361,7 +4361,6 @@ static int intel_prepare_plane_color_pipeline(struct drm_plane *plane)
 	return ret;
 };
 
-__maybe_unused
 void intel_color_plane_init(struct drm_plane *plane)
 {
 	struct drm_i915_private *i915 = to_i915(plane->dev);
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index c85548d3210a..2e4ca55fdbb2 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2389,6 +2389,7 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
 
 	intel_plane_helper_add(plane);
+	intel_color_plane_init(&plane->base);
 
 	return plane;
 
-- 
2.38.1

