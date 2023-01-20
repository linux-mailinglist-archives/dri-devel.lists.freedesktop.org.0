Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE467541D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6457E10EA2F;
	Fri, 20 Jan 2023 12:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1442 seconds by postgrey-1.36 at gabe;
 Fri, 20 Jan 2023 12:07:37 UTC
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6912610EA2F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=KN0W4cFj0cNukrPJD6vipzylE7T5CRhghDMb5r+iSYY=; b=v5
 LlvNmiAVpTvzhcvCm9UDD3fHdLaOC9AIG32VqlGioRrnvWSVTGPQRBxk/a/SrnJh+kG1idogG0Z5F
 4gbBv281XQ2Mfr2I2IaOrBr6QhrdMHutJ+OKB+vHDhbldcFLyWRK4gB/21dBlA6jiPEX9bS4nQij2
 cOIrDRjAAQfuw+NVcskI6ufqqYoz+333++G3Kovk3f4IsT37JeWk27MZ03XqOh8Blwue1vacnYGMI
 7aZQ3SuKgiuyLEZT2kOTlRjLgmk6q3bFO6ZMZl6ccrCIeiHNwkeTRTQCnD0amvjDeOz0Qs036gyAO
 /77HeurpSJmlwjYr+2lVEaqX0nRNkMwg==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1pIpnr-00007e-Tn;
 Fri, 20 Jan 2023 11:43:28 +0000
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: panel: Set orientation on panel_bridge connector
Date: Fri, 20 Jan 2023 11:43:12 +0000
Message-Id: <20230120114313.2087015-1-john@metanate.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 15b9ca1641f0 ("drm: Config orientation property if panel provides
it") added a helper to set the panel panel orientation early but only
connected this for drm_bridge_connector, which constructs a panel bridge
with DRM_BRIDGE_ATTACH_NO_CONNECTOR and creates the connector itself.

When the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag is not specified and the
panel_bridge creates its own connector the orientation is not set unless
the panel does it in .get_modes which is too late and leads to a warning
splat from __drm_mode_object_add() because the device is already
registered.

Call the necessary function to set add the orientation property when the
connector is created so that it is available before the device is
registered.

Fixes: 15b9ca1641f0 ("drm: Config orientation property if panel provides it")
Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/gpu/drm/bridge/panel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index e8aae3cdc73d..d4b112911a99 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -81,6 +81,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 		return ret;
 	}
 
+	drm_panel_bridge_set_orientation(connector, bridge);
+
 	drm_connector_attach_encoder(&panel_bridge->connector,
 					  bridge->encoder);
 
-- 
2.39.1

