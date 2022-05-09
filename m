Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854FF51FC0A
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D4E10EE9E;
	Mon,  9 May 2022 12:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320F110EE94;
 Mon,  9 May 2022 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097866; x=1683633866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqTfDA6od/vzBsvfTa88yJL0XJ4ZCW0ZxL65nRgKaK0=;
 b=WRjDaSH1yZAArnLR4YmG9UoqkORQuhxIkhYTMlkR0Ume2FjvPLyrDaCw
 xQpXuUr3hzyjpmDOMuV/O8KH1PR5lCn97bfIEsuAhtyFOF2eeRFzKw9rK
 voAffXU6ueWw8UNzWE/++tVmCVXUlAkrr09gbzmS0MMrbDaRTMTH9LJCx
 nBHoZFXiZU3y12n6+ROwfic0dwyPUoTJWRPwfZapb+i912q5Osu+3kK6M
 0axKRKOtLe1lQNqf28j6dJy0vpdixbqiI2BZg5epEZIEg1LbYGHyV5zxl
 /py8V4FmHYpL3OFIv9BCAwthxHjXHLFrPAWuIfgO9dgAsgknauf5Cg8Zp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="268958042"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="268958042"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:11 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="550993008"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/25] drm/edid: convert struct detailed_mode_closure to
 drm_edid
Date: Mon,  9 May 2022 15:03:07 +0300
Message-Id: <da4c927cd973766568a79ef044254fff20317e7f.1652097712.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f54699422bca..c2887012add0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -96,7 +96,7 @@ static int oui(u8 first, u8 second, u8 third)
 
 struct detailed_mode_closure {
 	struct drm_connector *connector;
-	const struct edid *edid;
+	const struct drm_edid *drm_edid;
 	bool preferred;
 	u32 quirks;
 	int modes;
@@ -3226,25 +3226,25 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 		return;
 
 	closure->modes += drm_dmt_modes_for_range(closure->connector,
-						  closure->edid,
+						  closure->drm_edid->edid,
 						  timing);
 
-	if (!version_greater(closure->edid, 1, 1))
+	if (!version_greater(closure->drm_edid->edid, 1, 1))
 		return; /* GTF not defined yet */
 
 	switch (range->flags) {
 	case 0x02: /* secondary gtf, XXX could do more */
 	case 0x00: /* default gtf */
 		closure->modes += drm_gtf_modes_for_range(closure->connector,
-							  closure->edid,
+							  closure->drm_edid->edid,
 							  timing);
 		break;
 	case 0x04: /* cvt, only in 1.4+ */
-		if (!version_greater(closure->edid, 1, 3))
+		if (!version_greater(closure->drm_edid->edid, 1, 3))
 			break;
 
 		closure->modes += drm_cvt_modes_for_range(closure->connector,
-							  closure->edid,
+							  closure->drm_edid->edid,
 							  timing);
 		break;
 	case 0x01: /* just the ranges, no formula */
@@ -3258,7 +3258,7 @@ static int add_inferred_modes(struct drm_connector *connector,
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = drm_edid->edid,
+		.drm_edid = drm_edid,
 	};
 
 	if (version_greater(drm_edid->edid, 1, 0))
@@ -3323,7 +3323,7 @@ static int add_established_modes(struct drm_connector *connector,
 	int i, modes = 0;
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = edid,
+		.drm_edid = drm_edid,
 	};
 
 	for (i = 0; i <= EDID_EST_TIMINGS; i++) {
@@ -3351,7 +3351,6 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 	struct detailed_mode_closure *closure = c;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
 	struct drm_connector *connector = closure->connector;
-	const struct edid *edid = closure->edid;
 	int i;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
@@ -3361,7 +3360,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 		const struct std_timing *std = &data->data.timings[i];
 		struct drm_display_mode *newmode;
 
-		newmode = drm_mode_std(connector, edid, std);
+		newmode = drm_mode_std(connector, closure->drm_edid->edid, std);
 		if (newmode) {
 			drm_mode_probed_add(connector, newmode);
 			closure->modes++;
@@ -3380,7 +3379,7 @@ static int add_standard_modes(struct drm_connector *connector,
 	int i, modes = 0;
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = drm_edid->edid,
+		.drm_edid = drm_edid,
 	};
 
 	for (i = 0; i < EDID_STD_TIMINGS; i++) {
@@ -3471,7 +3470,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = drm_edid->edid,
+		.drm_edid = drm_edid,
 	};
 
 	if (version_greater(drm_edid->edid, 1, 2))
@@ -3494,7 +3493,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
 		return;
 
 	newmode = drm_mode_detailed(closure->connector->dev,
-				    closure->edid, timing,
+				    closure->drm_edid->edid, timing,
 				    closure->quirks);
 	if (!newmode)
 		return;
@@ -3525,7 +3524,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = drm_edid->edid,
+		.drm_edid = drm_edid,
 		.preferred = true,
 		.quirks = quirks,
 	};
-- 
2.30.2

