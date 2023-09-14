Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5067A0589
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6484910E277;
	Thu, 14 Sep 2023 13:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F41310E277
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694697958; x=1726233958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3CpBcXQlzPQVnEuijv2Ul9A8XBCCqbQOW9gEQQvwndE=;
 b=c0mA3RL/3Hjoj92WnQw7rH4xiEpdNatiTANEMA0KJkXyP/dX8ixM3Fv+
 4SaiyWhKdFg0oiVtFeXQ5ydCm6X/VrcigtvJa4ESHVdey1z54RWRMlX5p
 LNxD35FS2ae387s1B5Mw6DOC1qtT7vTGsAk97QjF5qcQ8ZotVqMddjnsd
 QoQ0i7Uebwaamytw74kDf2t/c4GTmIhMpikUWm0OIBGGXGlCPMAcsEl65
 pcu9f8iXGClRsrrfMpW3Son63xkNYxWw3kce8muVYX/LwlhjlJdEURBVF
 Zrx2wGxyreaMzoCx2VriYvGpzMCpBWg+geZdn538IeS54yAWkTtXIbUKE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="442980204"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="442980204"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918248270"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918248270"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:15:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: lt9611uxc: use drm_bridge_get_edid() instead
 of using ->get_edid directly
Date: Thu, 14 Sep 2023 16:14:50 +0300
Message-Id: <20230914131450.2473061-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914131450.2473061-1-jani.nikula@intel.com>
References: <20230914131450.2473061-1-jani.nikula@intel.com>
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

UNTESTED
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 22c84d29c2bc..7835738a532e 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -296,7 +296,7 @@ static int lt9611uxc_connector_get_modes(struct drm_connector *connector)
 	unsigned int count;
 	struct edid *edid;
 
-	edid = lt9611uxc->bridge.funcs->get_edid(&lt9611uxc->bridge, connector);
+	edid = drm_bridge_get_edid(&lt9611uxc->bridge, connector);
 	drm_connector_update_edid_property(connector, edid);
 	count = drm_add_edid_modes(connector, edid);
 	kfree(edid);
-- 
2.39.2

