Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B271822AF2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814EF10E283;
	Wed,  3 Jan 2024 10:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B377B10E281
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276584; x=1735812584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7SbY2hDAlvAoKK6uvjLMXJLdneY0Ly0AOxGvucHi3js=;
 b=PHUmOfqESiIaCpdfsFg/UEDWn8chfgzSF6LguGiC05HVEHH6/KrXCXqw
 9UbcyXm9Xb8HTi7H4TEjx4VI193EJGBpMOyZjxpjFYrINqWm9m9IQi/zV
 wEpIIEOiotp8v2bTF2GvNxId0NdSB+a5uXGp+QKje8xlbnPw93OLqJLMk
 VPj2DOT68hhQAcu1zwrdHIkMbXTHlOI7FSlOMOoVhzsQN3RxERxMtybxC
 bNj5leho7RC1L1ND45eVmNMfJxxXu6XfPmv9b4v10bYBKha00CiJ+7O0S
 DWFPeVOaNgtinPG9yg3QgnNckv5zj4mVXn5QLQl/+e6KQzxP7zXRGrqlS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="10384032"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="10384032"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="870531565"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="870531565"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:39 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 05/39] drm/bridge: lt8912b: clear the EDID property on
 failures
Date: Wed,  3 Jan 2024 12:08:19 +0200
Message-Id: <88a13c43daffb9931664f74d210746fb1c64f163.1704276309.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Adrien Grassein <adrien.grassein@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If EDID read fails, clear the EDID property.

Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 4dc748d5d1ee..9c0ffc1c6fac 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -447,8 +447,8 @@ static int lt8912_connector_get_modes(struct drm_connector *connector)
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
 	drm_edid = drm_bridge_edid_read(lt->hdmi_port, connector);
+	drm_edid_connector_update(connector, drm_edid);
 	if (drm_edid) {
-		drm_edid_connector_update(connector, drm_edid);
 		num = drm_edid_connector_add_modes(connector);
 	} else {
 		return ret;
-- 
2.39.2

