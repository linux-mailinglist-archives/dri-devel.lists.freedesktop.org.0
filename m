Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D9F51D54C
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B4E10FAA9;
	Fri,  6 May 2022 10:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC11510FA30;
 Fri,  6 May 2022 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831891; x=1683367891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nxvjmQVMpDBxOWVVORLtNNxnXWbJMPO6u1BesR+rHnA=;
 b=ECAd0i/zbxLCiGB98o2aK0+TYFMrOsJ4TTzQxirhXeb5UpQL73hsAflL
 CFI5otUsqlXqSqn3275r+7skc0StFbhL8kqA2iCIAokBTbMgqE4xrtOR9
 lZXP2rX299F3MToypXohSpVjNvz/JHBL5COWb6jovM7RmUCmQVwRjKTBU
 2x6cYBcUztY6WU87m/59RAz2S94jFKJK9coYx5d2I9RLL9P91bjEyzL8q
 FFz7zCwMScZGj1i2QcHRfaPQs6BbA5dzC7UkMNAbPGD4cMB7qOHvPAtuE
 vn0sXZ4fOZXg1X45Ep5gev+KxNg1FxOkWkNpcq6PDq4ukl80inVqBsY9G w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="328971499"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="328971499"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="600491494"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:11:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/25] drm/edid: convert struct detailed_mode_closure to
 drm_edid
Date: Fri,  6 May 2022 13:10:15 +0300
Message-Id: <19a9fa8eb9ec6eb84b9d46a164fb490891038f22.1651830938.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fdc6ad651d3f..1abdd88ff64b 100644
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
@@ -3208,25 +3208,25 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
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
@@ -3240,7 +3240,7 @@ static int add_inferred_modes(struct drm_connector *connector,
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = drm_edid->edid,
+		.drm_edid = drm_edid,
 	};
 
 	if (version_greater(drm_edid->edid, 1, 0))
@@ -3305,7 +3305,7 @@ static int add_established_modes(struct drm_connector *connector,
 	int i, modes = 0;
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = edid,
+		.drm_edid = drm_edid,
 	};
 
 	for (i = 0; i <= EDID_EST_TIMINGS; i++) {
@@ -3333,7 +3333,6 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 	struct detailed_mode_closure *closure = c;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
 	struct drm_connector *connector = closure->connector;
-	const struct edid *edid = closure->edid;
 	int i;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_STD_MODES))
@@ -3343,7 +3342,7 @@ do_standard_modes(const struct detailed_timing *timing, void *c)
 		const struct std_timing *std = &data->data.timings[i];
 		struct drm_display_mode *newmode;
 
-		newmode = drm_mode_std(connector, edid, std);
+		newmode = drm_mode_std(connector, closure->drm_edid->edid, std);
 		if (newmode) {
 			drm_mode_probed_add(connector, newmode);
 			closure->modes++;
@@ -3362,7 +3361,7 @@ static int add_standard_modes(struct drm_connector *connector,
 	int i, modes = 0;
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = drm_edid->edid,
+		.drm_edid = drm_edid,
 	};
 
 	for (i = 0; i < EDID_STD_TIMINGS; i++) {
@@ -3453,7 +3452,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 {
 	struct detailed_mode_closure closure = {
 		.connector = connector,
-		.edid = drm_edid->edid,
+		.drm_edid = drm_edid,
 	};
 
 	if (version_greater(drm_edid->edid, 1, 2))
@@ -3476,7 +3475,7 @@ do_detailed_mode(const struct detailed_timing *timing, void *c)
 		return;
 
 	newmode = drm_mode_detailed(closure->connector->dev,
-				    closure->edid, timing,
+				    closure->drm_edid->edid, timing,
 				    closure->quirks);
 	if (!newmode)
 		return;
@@ -3507,7 +3506,7 @@ static int add_detailed_modes(struct drm_connector *connector,
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

