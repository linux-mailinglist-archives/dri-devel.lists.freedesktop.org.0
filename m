Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B824D51FC07
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:04:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BE210EE35;
	Mon,  9 May 2022 12:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B8210EE35;
 Mon,  9 May 2022 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097861; x=1683633861;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3gh1qeGaKZJIKdHf+x0jY08FUOydLVhyY74+iQcK1Sw=;
 b=SvN6Ogyj1eu8SWt2+NmoPcaT6/PxVij8iPAzFx8HZ+YiVj2aQM/t9kQb
 CEj+PJbm9UHGiN/NNfhsdDFXYZi9+tzaUyaVQAG4HW86uih/KWuTidIot
 IQMV2Lp27eqFdjJuzbnv+toNYdpoFE8jvKDbjjf4NyqemrTRSZR0z4Z48
 5sFkfqubRBKmtRo6SxUbHM1LDhy6GV+bkM8dYvGaNmv9oUJ7u1wl6DrkM
 LQEN3eCd3frcJySFK2jGRS0lrY1KBURCcILXDDRK0GXPPc6NymcqoHROn
 FHfAUvBuzkelJDvu7RtbD0luwzMAI+66aZtQ/epwgX077n3Z+PL2Y1ma1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="266618254"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="266618254"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="738134742"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:04:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/25] drm/edid: convert drm_dmt_modes_for_range() to
 drm_edid
Date: Mon,  9 May 2022 15:03:09 +0300
Message-Id: <a8f393263225321e74f1e2884e81b3346d1adf20.1652097712.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/drm_edid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8acdb08a8571..5d8744a7b62e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3121,16 +3121,16 @@ static bool valid_inferred_mode(const struct drm_connector *connector,
 	return ok;
 }
 
-static int
-drm_dmt_modes_for_range(struct drm_connector *connector, const struct edid *edid,
-			const struct detailed_timing *timing)
+static int drm_dmt_modes_for_range(struct drm_connector *connector,
+				   const struct drm_edid *drm_edid,
+				   const struct detailed_timing *timing)
 {
 	int i, modes = 0;
 	struct drm_display_mode *newmode;
 	struct drm_device *dev = connector->dev;
 
 	for (i = 0; i < ARRAY_SIZE(drm_dmt_modes); i++) {
-		if (mode_in_range(drm_dmt_modes + i, edid, timing) &&
+		if (mode_in_range(drm_dmt_modes + i, drm_edid->edid, timing) &&
 		    valid_inferred_mode(connector, drm_dmt_modes + i)) {
 			newmode = drm_mode_duplicate(dev, &drm_dmt_modes[i]);
 			if (newmode) {
@@ -3226,7 +3226,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 		return;
 
 	closure->modes += drm_dmt_modes_for_range(closure->connector,
-						  closure->drm_edid->edid,
+						  closure->drm_edid,
 						  timing);
 
 	if (!version_greater(closure->drm_edid->edid, 1, 1))
-- 
2.30.2

