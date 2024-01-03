Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E90822B02
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F004710E27A;
	Wed,  3 Jan 2024 10:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1566C10E287
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276681; x=1735812681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XMsUPbcsiOhwIOBW8Sl5ZAqxyVjtHheTk0Ub8kUzzBE=;
 b=i7ob+0BQ5RTUmogsIO5xCBN5tCzpyb7Y8T4mzwDSr6heFUolsl90BC83
 XVIMC8kMWm+9LnT8/ExHYcNE4C2coUxoKoM+siogNXODzadq7Ztrvh53i
 B8LWIeCO4xpxzohTE4k9G7tUvPX5+fUXy/cekbiAs3thyYEQ0iiR5XwkJ
 UxiFYK1AH5IBS3fNJutBmAyhkGIE0gpROkEXfHN+76Bo8q2UFb75W9NHT
 ZKFTHJMsabeJiKT9ckdyspdIE7fz10GcghEXWKtdTlgh60G4r903MUsRd
 80Rzu59cOlizp64HKObCqF04DkyS/253lKO4/+HIPn4cfWcTPaeAVkajY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3760078"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3760078"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="22053288"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 21/39] drm/bridge: lt9611uxc: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:35 +0200
Message-Id: <54ca929a5bf43f8999453f583d4337565599a6bd.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 3d916306a47d..28ceae10fa25 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -494,8 +494,8 @@ static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, siz
 	return 0;
 };
 
-static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
-					      struct drm_connector *connector)
+static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *bridge,
+							 struct drm_connector *connector)
 {
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 	int ret;
@@ -509,7 +509,7 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
 		return NULL;
 	}
 
-	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
+	return drm_edid_read_custom(connector, lt9611uxc_get_edid_block, lt9611uxc);
 }
 
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
@@ -517,7 +517,7 @@ static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
-	.get_edid = lt9611uxc_bridge_get_edid,
+	.edid_read = lt9611uxc_bridge_edid_read,
 };
 
 static int lt9611uxc_parse_dt(struct device *dev,
-- 
2.39.2

