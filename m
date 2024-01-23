Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C038399A7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A12F10E846;
	Tue, 23 Jan 2024 19:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3236710E846
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038703; x=1737574703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7SbY2hDAlvAoKK6uvjLMXJLdneY0Ly0AOxGvucHi3js=;
 b=j0HSht0WTMIo1RM8vmT/mJKKSdkrs69KYFPkQMAJAxG9Pgj6UZggKxC+
 doSsORTaZLPvf6KQryT7ls7hmsZIB2IGihTdtvcD9SkJ83n21OhHQqRA6
 Y6wJpGzJqEDCewxb8HOE2cWUVer/R5ETm/SFkYO+xjNYH2dVPugMFso6D
 AzvBCfRTbbf9n9HRlBxje0mFr56n11qa6gbiEjJXLAxdsi40JDxh9/J30
 1ZKxzIbgt/KEC5Mf3/r3eJBJkTu828hC3ZQW7vTpjgS7oy+bdyxVg/F0Q
 SBMy4z89k50EPGZfXYWIW9X3jpxxb2DqzWEbcZ8d/c2Ih/GZILdryDOZF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8283411"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8283411"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="34519843"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:38:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 05/39] drm/bridge: lt8912b: clear the EDID property on
 failures
Date: Tue, 23 Jan 2024 21:37:11 +0200
Message-Id: <2080adaadf4bba3d85f58c42c065caf9aad9a4ef.1706038510.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706038510.git.jani.nikula@intel.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
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

