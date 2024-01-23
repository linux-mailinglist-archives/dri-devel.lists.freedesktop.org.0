Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 239918399AE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:39:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FCC10E88A;
	Tue, 23 Jan 2024 19:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E9E10E88A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038778; x=1737574778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gcqtDEgmttw7VElUwFIUW3NCGombT1QAkRd+2Smeb1I=;
 b=acBv1wGi3eMOA2NT6abZfVipaIQSrdGaewS/H+NnJftJFFQCe6lCMbKt
 +b+hBC60G9hJjKr+lULt2lXRuZ38IQcN4/f8UMGxmUQXxvnsC1asy5rqu
 NhEbk6gUpPhLIoX7ispuzvfXR9g26UpF6JHbfbmN0KH/IsnmO9k69QxHs
 XvvSCFj5Xu0cKVU6NNBmnEWLGaDmmEjH3KLAF+LQQd/EKp4cfsEbM0xjH
 AXoMDk/zXa8Huw+mb1JzxCdMRyA5L37ukw+SJWBNBMFLtMfiOH1B8BgBF
 OJfdKhlgJJIH3bU4JPhEGpfrvzfrFLljT0Awzj3WZ9VLC849g2j3xtbdR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8997098"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8997098"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786156593"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="786156593"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 17/39] drm/bridge: display-connector: switch to ->edid_read
 callback
Date: Tue, 23 Jan 2024 21:37:23 +0200
Message-Id: <4e59a181e71e20158106868d1a6f7165cd9193e3.1706038510.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/display-connector.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 08bd5695ddae..ab8e00baf3f1 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -81,12 +81,12 @@ display_connector_detect(struct drm_bridge *bridge)
 	}
 }
 
-static struct edid *display_connector_get_edid(struct drm_bridge *bridge,
-					       struct drm_connector *connector)
+static const struct drm_edid *display_connector_edid_read(struct drm_bridge *bridge,
+							  struct drm_connector *connector)
 {
 	struct display_connector *conn = to_display_connector(bridge);
 
-	return drm_get_edid(connector, conn->bridge.ddc);
+	return drm_edid_read_ddc(connector, conn->bridge.ddc);
 }
 
 /*
@@ -172,7 +172,7 @@ static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
 	.attach = display_connector_attach,
 	.detect = display_connector_detect,
-	.get_edid = display_connector_get_edid,
+	.edid_read = display_connector_edid_read,
 	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
 	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.39.2

