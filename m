Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89B4822B13
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:12:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0597210E301;
	Wed,  3 Jan 2024 10:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354410E301
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276746; x=1735812746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9KAu5XpuQmkb6FICe4JPb43WPifpjg1Bghh6UEt5Xo=;
 b=UW+0epr7iVRqyB4+1cuCkkiqKB8SGGNWGsRSUeqlCr8eIuBCP4n87FYv
 CH3Zb3ojUx73FQ80c9sD0F36LBp7PVJZEG3aykYm09aVacPWhQrzBpjZP
 /RJxSOCLKgqrS23K2LwUpjmP0AYlJsw6fNr2vNY0ruI7+NrLCjL8iHc5k
 TVUki993Q5T5rBvyWu+UUEJnFdUUHi5O1Knpu01D5ngFztOhDttmdNyxR
 zeegnQKZP7YYjL5K/zWosyJI5nnlu5AnXZjNTlFMnDDNyeCpXbwOSsNMk
 +S3i2LYHAc+ycsbys12cUp/G0Heepk28Cy+X01ewmhV6PRBidl3x5KXFX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="428159729"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="428159729"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="783464077"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="783464077"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:12:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 32/39] drm: xlnx: zynqmp_dpsub: switch to ->edid_read
 callback
Date: Wed,  3 Jan 2024 12:08:46 +0200
Message-Id: <816729df00ac5e8e041194e74fd620ff1c3a7653.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based callback and functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a0606fab0e22..24213eaa38d0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1560,12 +1560,12 @@ static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *brid
 	return connector_status_disconnected;
 }
 
-static struct edid *zynqmp_dp_bridge_get_edid(struct drm_bridge *bridge,
-					      struct drm_connector *connector)
+static const struct drm_edid *zynqmp_dp_bridge_edid_read(struct drm_bridge *bridge,
+							 struct drm_connector *connector)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 
-	return drm_get_edid(connector, &dp->aux.ddc);
+	return drm_edid_read_ddc(connector, &dp->aux.ddc);
 }
 
 static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
@@ -1579,7 +1579,7 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_check = zynqmp_dp_bridge_atomic_check,
 	.detect = zynqmp_dp_bridge_detect,
-	.get_edid = zynqmp_dp_bridge_get_edid,
+	.edid_read = zynqmp_dp_bridge_edid_read,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.39.2

