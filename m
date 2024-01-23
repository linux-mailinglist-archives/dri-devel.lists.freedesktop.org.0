Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1446F8399B1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F6710E88C;
	Tue, 23 Jan 2024 19:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E5D10E88C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038796; x=1737574796;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fVNZmGUi+HX2+gCZkSUjrOaEQ7fFci2B7cQxqP73p5w=;
 b=O4xWiNqzo+zSPwbecLTbkdIOGaQgKwvf8K8KaEAjM9e30gj0OOPBpq1+
 rOsoq6LnCLiP0AETwJA3QQCuR95oMeAajLXC/5IkP9tpyV56jsCyDSuLD
 ScVlzIyPu0OH9RmkAfMvk7yE9nun/taIuJ3TicEC+rqV8YbLDUhXrtvQj
 8T5ZbC+0OVpTfg+0KJ5sTauj6LqlElu4N4HhSl04YBo5uovp1BoS1u79S
 8ESPp+731oP0V0pLrvrwekCOPU2ojJhk/qSJUdm2dp9+Z8G9CqT5D6Es5
 moqnXKSlVENXPOnHjd8cLol2kGHUE4FDbwWJ514oX8+3kP/7AXsjUZLfN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15150384"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="15150384"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959259986"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="959259986"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 20/39] drm/bridge: lt9611: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:26 +0200
Message-Id: <0c43e5cc9f0b320abd742e7efba5af7a20d8ebd9.1706038510.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based callback and functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index b9205d14d943..a9c7e2b07ea1 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -847,13 +847,13 @@ lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
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
@@ -893,7 +893,7 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
 	.detect = lt9611_bridge_detect,
-	.get_edid = lt9611_bridge_get_edid,
+	.edid_read = lt9611_bridge_edid_read,
 	.hpd_enable = lt9611_bridge_hpd_enable,
 
 	.atomic_pre_enable = lt9611_bridge_atomic_pre_enable,
-- 
2.39.2

