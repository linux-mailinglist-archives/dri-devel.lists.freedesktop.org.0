Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF9143B6E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 11:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039676EC58;
	Tue, 21 Jan 2020 10:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BC96EC59;
 Tue, 21 Jan 2020 10:53:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 02:53:37 -0800
X-IronPort-AV: E=Sophos;i="5.70,345,1574150400"; d="scan'208";a="399629440"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 02:53:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: support feature masks in drm_core_check_feature()
Date: Tue, 21 Jan 2020 12:53:30 +0200
Message-Id: <20200121105331.6825-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow a mask of features to be passed to drm_core_check_feature(). All
features in the mask are required.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_drv.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index cf13470810a5..51b486d1ee81 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -826,16 +826,18 @@ static inline bool drm_dev_is_unplugged(struct drm_device *dev)
 /**
  * drm_core_check_feature - check driver feature flags
  * @dev: DRM device to check
- * @feature: feature flag
+ * @feature: feature flag(s)
  *
  * This checks @dev for driver features, see &drm_driver.driver_features,
  * &drm_device.driver_features, and the various &enum drm_driver_feature flags.
  *
- * Returns true if the @feature is supported, false otherwise.
+ * Returns true if all features in the @feature mask are supported, false
+ * otherwise.
  */
-static inline bool drm_core_check_feature(const struct drm_device *dev, u32 feature)
+static inline bool drm_core_check_feature(const struct drm_device *dev, u32 features)
 {
-	return dev->driver->driver_features & dev->driver_features & feature;
+	return features && (dev->driver->driver_features & dev->driver_features &
+			    features) == features;
 }
 
 /**
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
