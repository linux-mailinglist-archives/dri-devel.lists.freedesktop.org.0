Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB96851FC06
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC8C10EE90;
	Mon,  9 May 2022 12:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B2F10EE90;
 Mon,  9 May 2022 12:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097856; x=1683633856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtfG02UbYRHP0rHfM0XwTThLqP0C5LUYodFejnkxU/k=;
 b=RTZ9qltEQGMmzJt6/35q4Eq6SKp7kc2GIInbIUw+ONry4BYxdJt8tu+1
 QudNmpXKo0KMEKsYTgnHgG0SwsOKKdfMrYMRGm/A7ANj1ihjmtth6XkSM
 fv6tSwTMn/ZZ83W10Rl/Q6lpRgt72279cbEwXs2zlUtfmxWSrkMS+Bz4D
 XhVAQzpaRrOMmekOjcKCWhbtTprJ4Fu3sL/PQDZv+QJBLUxbxke1X4wKB
 PjeK3OtBmQBffHGnZhyHAeRuvvGyRn6hjXlaFCvmagcjhd7h3dphed92Z
 B4G5gN+OUbJnYKMnxQ1nt5WsrbxgyaWZuD4xmyRjd6c9Umd4+1dOP4hTR g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="355456644"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355456644"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="601935231"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/25] drm/edid: convert drm_mode_detailed() to drm_edid
Date: Mon,  9 May 2022 15:03:08 +0300
Message-Id: <6e4625d529ee4bfb2f6ebbfef5fb707d65a0554d.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need to propagate drm_edid everywhere.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c2887012add0..8acdb08a8571 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2928,7 +2928,7 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
  * drm_display_mode.
  */
 static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
-						  const struct edid *edid,
+						  const struct drm_edid *drm_edid,
 						  const struct detailed_timing *timing,
 						  u32 quirks)
 {
@@ -3016,8 +3016,8 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 	}
 
 	if (quirks & EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE) {
-		mode->width_mm = edid->width_cm * 10;
-		mode->height_mm = edid->height_cm * 10;
+		mode->width_mm = drm_edid->edid->width_cm * 10;
+		mode->height_mm = drm_edid->edid->height_cm * 10;
 	}
 
 	mode->type = DRM_MODE_TYPE_DRIVER;
@@ -3493,7 +3493,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
 		return;
 
 	newmode = drm_mode_detailed(closure->connector->dev,
-				    closure->drm_edid->edid, timing,
+				    closure->drm_edid, timing,
 				    closure->quirks);
 	if (!newmode)
 		return;
-- 
2.30.2

