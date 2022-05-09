Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6451FC0E
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DEE10EEB6;
	Mon,  9 May 2022 12:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0830A10EEB6;
 Mon,  9 May 2022 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097875; x=1683633875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yazu71PAC8XEBhLVbfq25r8P51wcfXsSqbmFGiVVO7c=;
 b=iv5K3aMcJsAWZQbcgHMZx5tAy0EDAvhNA1XWlIGjHagA4JGqW9OAWRr7
 2TzMtRlve+/XrEwgX0bM+iF4bCnAtWFTy1pjy63P8Py/42jvgZ1HIG3MR
 5GqEDgSEH4pvHZR/9S83zvPX09bnIZE8wGR/SbDbVc1j4skks+Tu3nwmZ
 OzlcrAWJlImYtuQbRh5qGR21X8U8pyFlsbXv+NEjtRqO1oxzh0e6gNN1l
 eiKJ8FvwKVwPayrwibk5KHksbnw2fRXjE6qMIcExPH1DILa3HgDc4caxW
 GOD2wgy6gSYILqZMbjzc8ppzuGUoxk7h/3oCrWl/wugtvHUvyqmKDI6oK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="268693526"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="268693526"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="656731905"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/25] drm/edid: convert drm_cvt_modes_for_range() to
 drm_edid
Date: Mon,  9 May 2022 15:03:11 +0300
Message-Id: <c2c251a504933debacf78e1382ae665ae490ed40.1652097712.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 037102a4d0b5..51d918c66a26 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3185,14 +3185,14 @@ static int drm_gtf_modes_for_range(struct drm_connector *connector,
 	return modes;
 }
 
-static int
-drm_cvt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
-			const struct detailed_timing *timing)
+static int drm_cvt_modes_for_range(struct drm_connector *connector,
+				   const struct drm_edid *drm_edid,
+				   const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
 	struct drm_device *dev = connector->dev;
-	bool rb = drm_monitor_supports_rb(edid);
+	bool rb = drm_monitor_supports_rb(drm_edid->edid);
 
 	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
 		const struct minimode *m = &extra_modes[i];
@@ -3202,7 +3202,7 @@ drm_cvt_modes_for_range(struct drm_connector *connector, const struct edid *edid
 			return modes;
 
 		drm_mode_fixup_1366x768(newmode);
-		if (!mode_in_range(newmode, edid, timing) ||
+		if (!mode_in_range(newmode, drm_edid->edid, timing) ||
 		    !valid_inferred_mode(connector, newmode)) {
 			drm_mode_destroy(dev, newmode);
 			continue;
@@ -3244,7 +3244,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 			break;
 
 		closure->modes += drm_cvt_modes_for_range(closure->connector,
-							  closure->drm_edid->edid,
+							  closure->drm_edid,
 							  timing);
 		break;
 	case 0x01: /* just the ranges, no formula */
-- 
2.30.2

