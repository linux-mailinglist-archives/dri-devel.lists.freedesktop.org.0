Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61043822B1B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86EAC10E308;
	Wed,  3 Jan 2024 10:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AA210E308
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276783; x=1735812783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1AjcD+fVHi2r3HFt3IF7QnmxpmsFGmx8uWBCUF/3xq8=;
 b=NtST59zpv89MpGU/+e3A0IWGkQTY1G8dlMQNW+1BmkcBAAnX2QY4ehhN
 E8HXgz6eyNwhySvU0Z/RKmkP/vZnaJku1Uq2iYj94wxn5T2a+xantMOmT
 A+J5esfuAF5ehvL26HcxZG8EtSVkdn3co00PARpSmuxfoy7H4dItnZuIo
 7tE9YhlV6Eq9UY3GXcV6nK3fcoWyIndUxmr21z/Q9WNWq4Qe7GIpbhkQ5
 hSdOyELuVynebyufcYOVBB+XNlki6MuJS/pudzArJCP/RDaTSkrGcnRPG
 0I5+Wu0Yyi5XJ4tgjc+mBr2p7io/2UB7ytt79hHS3wmfCslBP4N/IqcBV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="394142893"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="394142893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="14462184"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:13:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 38/39] drm/bridge: ti-sn65dsi86: switch to ->edid_read
 callback
Date: Wed,  3 Jan 2024 12:08:52 +0200
Message-Id: <ed8d695126420a7ef82aa89152046aca72573881.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 62cc3893dca5..61dc6f063fb4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1207,19 +1207,19 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
 					 : connector_status_disconnected;
 }
 
-static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
-					  struct drm_connector *connector)
+static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
+						     struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
-	return drm_get_edid(connector, &pdata->aux.ddc);
+	return drm_edid_read_ddc(connector, &pdata->aux.ddc);
 }
 
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
-	.get_edid = ti_sn_bridge_get_edid,
+	.edid_read = ti_sn_bridge_edid_read,
 	.detect = ti_sn_bridge_detect,
 	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
 	.atomic_enable = ti_sn_bridge_atomic_enable,
-- 
2.39.2

