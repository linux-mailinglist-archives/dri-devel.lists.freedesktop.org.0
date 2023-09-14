Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3137A0587
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E3810E275;
	Thu, 14 Sep 2023 13:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9117810E275
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694697940; x=1726233940;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wPdWv8j1bq8eluGcOmLsUVj7Cl30TAN4YguHxPP5McU=;
 b=k8uRwduA3uceD2iu4u6E4PqMxzl+VHD2pNggrnLVRBcPwyhzRBeTO3i/
 +juFhVVYYeZkwAvSFpevZtoW1IwHoRpDDsFZH+Of0XurLi324/oJUVizB
 kGDICNV/53StcSlfhViNzBPFpsy2huVjMt8yTDqjlO5GRCH7k/goCN0aG
 DDgtX93lDgzd9jKWthzUfF7HCdtKGlpbzRHL31mzy2kBtgjHfmR9sl23C
 FTzyyxvJOI+b7oBCKjho0cGcJHItIdap6vHnsQCr36toesTE7vo/RnFr2
 M2WX7enFpU1vmRB2cvhvBBuO7slwgt9kCDjTROQYFIYdEKeWg3/HvXac8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="442980003"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="442980003"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918248089"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918248089"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:14:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/bridge: use drm_bridge_get_edid() instead of using
 ->get_edid directly
Date: Thu, 14 Sep 2023 16:14:49 +0300
Message-Id: <20230914131450.2473061-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, jani.nikula@intel.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make drm_bridge_get_edid() the one place to call the hook.

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_bridge_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 1da93d5a1f61..31baf1f5ff81 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -238,7 +238,7 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 	if (status != connector_status_connected)
 		goto no_edid;
 
-	edid = bridge->funcs->get_edid(bridge, connector);
+	edid = drm_bridge_get_edid(bridge, connector);
 	if (!drm_edid_is_valid(edid)) {
 		kfree(edid);
 		goto no_edid;
-- 
2.39.2

