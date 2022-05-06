Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BF51D54A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBAD10FA02;
	Fri,  6 May 2022 10:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F05610FA02;
 Fri,  6 May 2022 10:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831888; x=1683367888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oGfL6pVEC0/nbza0+8u7aT3a+2A57rimpskxY/H6Knw=;
 b=l3UsLCMYcQJi6N2mZwbHCv2+NtmZ2ATe2A4soatzrKlskkUIK4zG19Zg
 xvvwyf3SSmJeV0XRlcG6aL0SSEW23ItY9n1vp452I0ALoN2ZDh+EsLBYn
 nOxt34403t0lTZ+jSSLsLKxbug/MELZwTZk1HprkcQSDBNg/FxfZrvDRC
 a82e6YAhSmol9dRCJYQIOYkwRdbJb7ri81pohY08rRJ9yn2PhqTOojJjv
 R6VgLfrcmnOgmLtJumNlccnJb46UwiXUsTPRDg0xxWNOJw6kCaIofHLuG
 NG6mbT/HS1gsLlQUVn8+dyhLnzadLuAlgLrutyfv2Oi/RJKQRYYgmzRCG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268570642"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268570642"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549800317"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/25] drm/edid: convert drm_mode_detailed() to drm_edid
Date: Fri,  6 May 2022 13:10:16 +0300
Message-Id: <1677d143644ad79af11149d8c14e6aeb36130668.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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
index 1abdd88ff64b..b5d7347f32d9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2910,7 +2910,7 @@ drm_mode_do_interlace_quirk(struct drm_display_mode *mode,
  * drm_display_mode.
  */
 static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
-						  const struct edid *edid,
+						  const struct drm_edid *drm_edid,
 						  const struct detailed_timing *timing,
 						  u32 quirks)
 {
@@ -2998,8 +2998,8 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 	}
 
 	if (quirks & EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE) {
-		mode->width_mm = edid->width_cm * 10;
-		mode->height_mm = edid->height_cm * 10;
+		mode->width_mm = drm_edid->edid->width_cm * 10;
+		mode->height_mm = drm_edid->edid->height_cm * 10;
 	}
 
 	mode->type = DRM_MODE_TYPE_DRIVER;
@@ -3475,7 +3475,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
 		return;
 
 	newmode = drm_mode_detailed(closure->connector->dev,
-				    closure->drm_edid->edid, timing,
+				    closure->drm_edid, timing,
 				    closure->quirks);
 	if (!newmode)
 		return;
-- 
2.30.2

