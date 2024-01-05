Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92028258BD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A9110E64F;
	Fri,  5 Jan 2024 16:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ED410E64F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704473881; x=1736009881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ncNdi3DkkHOISTlB5x1q6BahDOOnFUKS2a7uCPQwtuk=;
 b=PeCSX0g8+vid4/9dmu4p6LfrAGzJyQfF4KR9Cvwit1Eeus3IyOPKsp95
 LdBVDT15TqwaK48GV1jTdTj27JqY4OwUEuIrsifbvBl0rVzYhsa8/Zh5l
 DuCb0ZAmFP+fhEW2irTijuKxpBwqKI/TJ9meYlylKmvtN0I6d7ojPE9ty
 A/09kgd7AHJzEj7muPn6ms+SJ/lpFI8h3RhRxqcgFW3i2pz+p5AlTDnbB
 Hi4+MiRfEaz2b7TdvgVHrZYm1HfM8/9AiyE720YatkoiD8HjyzXnd3Jtw
 vQ1+2CTegh5nYP9tUl80zi8SCHlavrmaG7X+FNeeeo2VbxduTGKiZtAp3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4348219"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; 
   d="scan'208";a="4348219"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:58:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="924263088"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="924263088"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.106])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 08:57:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mgag200: convert get modes to struct drm_edid
Date: Fri,  5 Jan 2024 18:57:48 +0200
Message-Id: <19a453c725fc27bd890f8fc73104f43a376dfce0.1704473654.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704473654.git.jani.nikula@intel.com>
References: <cover.1704473654.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert mgag200_vga_connector_helper_get_modes() to use struct drm_edid
based functions directly.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0f0d59938c3a..0eb769dd76ce 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -14,13 +14,13 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
-#include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
 
@@ -717,17 +717,23 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct mga_device *mdev = to_mga_device(connector->dev);
-	int ret;
+	const struct drm_edid *drm_edid;
+	int count;
 
 	/*
 	 * Protect access to I/O registers from concurrent modesetting
 	 * by acquiring the I/O-register lock.
 	 */
 	mutex_lock(&mdev->rmmio_lock);
-	ret = drm_connector_helper_get_modes_from_ddc(connector);
+
+	drm_edid = drm_edid_read(connector);
+	drm_edid_connector_update(connector, drm_edid);
+	count = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
+
 	mutex_unlock(&mdev->rmmio_lock);
 
-	return ret;
+	return count;
 }
 
 /*
-- 
2.39.2

