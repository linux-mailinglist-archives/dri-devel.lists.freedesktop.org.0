Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392E5822B01
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9C910E2C6;
	Wed,  3 Jan 2024 10:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FAF10E27A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276675; x=1735812675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KcRwH7nwtEN8CaRJEFZJf/qLkNQSk6hJgy0PxP78fjY=;
 b=Dh0qtS/C5jrftcsEhviD3viEpjwCeDUtU8vcnNPXKK+eGy32HAtQ6HvZ
 fl+JVqhO5lFRQWbTTyiPt7runOFnv+O88qUHMzsSC37X76A39zHDtZdhf
 9w+/BqoOrsM5wYkX3vXpuuNGIF5DfUjCOGWTUfs07ONUbEoNn6mYztK5c
 EaaOBaX+ZhdAEKvRn5yfoTQZOWSFA4y0EQDTrOeb87GY96yhpiGC7JOGY
 tXgrZPTwPG60QhnW2shBYt/5y8mzfsifFXX2SW7Z1en+yyy3uhoXgAoM3
 izpaY+0s/krhrXn2dFezYBF2AlhS846elNFO95GgIgGeabpRPxBcG9m03 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3760066"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="3760066"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="22053275"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 20/39] drm/bridge: lt9611: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:34 +0200
Message-Id: <be109714343ecd68bd3dccabb91e1b8110eb1ce8.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/lontium-lt9611.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 9663601ce098..1385e3378985 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -846,13 +846,13 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	lt9611_sleep_setup(lt9611);
 }
 
-static struct edid *lt9611_bridge_get_edid(struct drm_bridge *bridge,
-					   struct drm_connector *connector)
+static const struct drm_edid *lt9611_bridge_edid_read(struct drm_bridge *bridge,
+						      struct drm_connector *connector)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
 	lt9611_power_on(lt9611);
-	return drm_do_get_edid(connector, lt9611_get_edid_block, lt9611);
+	return drm_edid_read_custom(connector, lt9611_get_edid_block, lt9611);
 }
 
 static void lt9611_bridge_hpd_enable(struct drm_bridge *bridge)
@@ -892,7 +892,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
 	.detect = lt9611_bridge_detect,
-	.get_edid = lt9611_bridge_get_edid,
+	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
-- 
2.39.2

