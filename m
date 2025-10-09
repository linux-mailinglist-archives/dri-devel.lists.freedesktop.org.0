Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49765BCABF9
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 22:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFFE10E23F;
	Thu,  9 Oct 2025 20:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="Rrpy17nB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1898 seconds by postgrey-1.36 at gabe;
 Thu, 09 Oct 2025 20:02:38 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EE510E23C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 20:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=tw4U5ow5h6FPqPQ3p8BSDeHqWyCqOyJva3sSK1gq9wU=; b=Rrpy17nByDvTXKcuvVcCQjnAxY
 f9ogDmNV3bsmRAENNWoDza9zFVKIH67/47SuVb5HpoNwc7vaANXPbKlE4nB3qdZGbF1smYFADF0qI
 6r18qMIVLMEvXN2gYVo24ogGgEp4+L98xTY03FAY9WuYazvY/73mxctrf7jfsj8jG3eJvbEzuJl69
 CkM9cd++SdDajDgT36qFIaSEi0+mS3ehzX/lc+4unZHys3//PsDXh2GdrF4LXovYFTJiu60ziXn98
 KgEbfX+wh5FI6fUYcXKrR9KzJrOkcFyrwtsixT6f8GC05B4kQxd0p1wWMFYIsRxXuCnPXv0QH/lR3
 dVCaodVw==;
Received: from i53875bdd.versanet.de ([83.135.91.221]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1v6wLW-000644-3I; Thu, 09 Oct 2025 21:30:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: damon.ding@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] drm/bridge: analogix_dp: Fix connector status detection for
 bridges
Date: Thu,  9 Oct 2025 21:30:28 +0200
Message-ID: <20251009193028.4952-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now if there is a next bridge attached to the analogix-dp controller
the driver always assumes this bridge is connected to something, but this
is of course not always true, as that bridge could also be a hotpluggable
dp port for example.

On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
for DisplayPort targets is more complicated than just reading the HPD pin
level" and we should be "letting the actual DP driver perform detection."

So use drm_bridge_detect() to detect the next bridge's state but ignore
that bridge if the analogix-dp is handling the hpd-gpio.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
As this patch stands, it would go on top of v6 of Damon's bridge-connector
work, but could very well be also integrated into one of the changes there.

I don't know yet if my ordering and/or reasoning is the correct one or if
a better handling could be done, but with that change I do get a nice
hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
Analogix-DP ends in a full size DP port.

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index c04b5829712b..cdc56e83b576 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->plat_data->next_bridge)
-		return connector_status_connected;
+	/*
+	 * An optional next bridge should be in charge of detection the
+	 * connection status, except if we manage a actual hpd gpio.
+	 */
+	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
+		return drm_bridge_detect(dp->plat_data->next_bridge, connector);
 
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
-- 
2.47.2

