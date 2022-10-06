Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6975F7114
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 00:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02EB10E8DA;
	Thu,  6 Oct 2022 22:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C09310E0DE;
 Thu,  6 Oct 2022 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665094910; x=1696630910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4TfnmfYAWryImud7kOnUlOwxHyyQbMmrlcPPWkOQVbE=;
 b=gwzu0+x6TSB58kzI2lOftqOIwXvT2OlIfN/3+LRxfnGLjpclzxPLyy8m
 iLuqycONjbRmVfZoLmaTXt+Cqr5TA0RyI77jjGE2B8LfQoIzPSC4ZJk2v
 8OgP8JX9jfQGsJDal9n4uenLxXUWvVzKe6uXuOdgOvsf1bwu8xBZmNZz3
 bFVQT+mclfexvR1Gozgxtn0RzxBjlG54eXbU7YHxUqB9goGHegcQwHvKk
 k1pDjHIuIJzO6li/pstikWdQnP2sUKKjGQlCnKdzbd8Kcr7yFVJDNz3vL
 b6/x7df5AtGC0PBWlR3vQxInucQx6NQxzL/LY75QQltZvYJbrFCjatkK/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="389881055"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="389881055"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 15:21:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="870030520"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; d="scan'208";a="870030520"
Received: from ncercel-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.60.239])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2022 15:21:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid/firmware: stop using throwaway platform device
Date: Fri,  7 Oct 2022 01:21:46 +0300
Message-Id: <20221006222146.2375217-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Matthieu CHARETTE <matthieu.charette@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've used a temporary platform device for firmware EDID loading since
it was introduced in commit da0df92b5731 ("drm: allow loading an EDID as
firmware to override broken monitor"), but there's no explanation why.

Do we need to?

Maybe this fixes the suspend/resume issue?

(Yes, I'll rewrite the commit message if this is the way to go ;)

References: https://lore.kernel.org/r/20220727074152.43059-1-matthieu.charette@gmail.com
Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid_load.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 37d8ba3ddb46..fbae12130234 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -182,18 +182,9 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 		fwdata = generic_edid[builtin];
 		fwsize = sizeof(generic_edid[builtin]);
 	} else {
-		struct platform_device *pdev;
 		int err;
 
-		pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
-		if (IS_ERR(pdev)) {
-			DRM_ERROR("Failed to register EDID firmware platform device "
-				  "for connector \"%s\"\n", connector_name);
-			return ERR_CAST(pdev);
-		}
-
-		err = request_firmware(&fw, name, &pdev->dev);
-		platform_device_unregister(pdev);
+		err = request_firmware(&fw, name, connector->dev->dev);
 		if (err) {
 			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=%d)\n",
 				  name, err);
-- 
2.34.1

