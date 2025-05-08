Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDB7AAF931
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 13:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02D10E8E8;
	Thu,  8 May 2025 11:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="nMYpl5rV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4700410E8E7
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 11:54:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548BsZ7B1659097
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 May 2025 06:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1746705275;
 bh=upFvHd4shpYUIeyOf3tyoUkOxHMwThPoUVnLvtpA/pM=;
 h=From:To:CC:Subject:Date;
 b=nMYpl5rViGwUspkDJya0JClws/Dc0ULo43z2uNw8jWn6Kls19B7jf2EKTZCMjBFKt
 Glg1OXb+Nhmd3XWDI1vNFD0cTlyWiA0ILx7wJD+c3NN6R5ufZTjlNvMxgbrDTmczP+
 bPcJhFYDUO1ILLw6uI/fIAVOHxTK9Z8xoaVcA8aE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548BsZI3068180
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 May 2025 06:54:35 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 06:54:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 06:54:35 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [10.24.72.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548BsYN5026702;
 Thu, 8 May 2025 06:54:34 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <dianders@chromium.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>, <max.krummenacher@toradex.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <kieran.bingham+renesas@ideasonboard.com>,
 <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
 <devarsht@ti.com>, <j-choudhary@ti.com>
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Date: Thu, 8 May 2025 17:24:33 +0530
Message-ID: <20250508115433.449102-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

By default, HPD was disabled on SN65DSI86 bridge. When the driver was
added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
call which was moved to other function calls subsequently.
Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
state always return 1 (always connected state)

Also, with the suspend and resume calls before every register access, the
bridge starts with disconnected state and the HPD state is reflected
correctly only after debounce time (400ms). However, adding this delay
in the detect function causes frame drop and visible glitch in display.

So to get the detect utility working properly for DP mode without any
performance issues in display, instead of reading HPD state from the
register, rely on aux communication. Use 'drm_dp_dpcd_read_link_status'
to find if we have something connected at the sink.

[0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)

Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

v1 patch link which was sent as RFC:
<https://patchwork.kernel.org/project/dri-devel/patch/20250424105432.255309-1-j-choudhary@ti.com/>

Changelog v1->v2:
- Drop additional property in bindings and use conditional.
- Instead of register read for HPD state, use dpcd read which returns 0
  for success and error codes for no connection
- Add relevant history for the required change in commit message
- Drop RFC subject-prefix in v2 as v2 is in better state after discussion
  in v1 and Max's mail thread
- Add "Cc:" tag 

This approach does not make suspend/resume no-op and no additional
delay needs to be added in the detect hook which causes frame drops.

Here, I am adding conditional to HPD_DISABLE bit even when we are
not using the register read to get HPD state. This is to prevent
unnecessary register updates in every resume call.
(It was adding to latency and leading to ~2-3 frame drop every 10 sec)

Tested and verified on TI's J784S4-EVM platform:
- Display comes up
- Detect utility works with a couple of seconds latency.
  But I guess without interrupt support, this is acceptable.
- No frame-drop observed
 
Discussion thread for Max's patch:
<https://patchwork.kernel.org/project/dri-devel/patch/20250501074805.3069311-1-max.oss.09@gmail.com/>

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 60224f476e1d..9489e78b6da3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -352,8 +352,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
 	 * change this to be conditional on someone specifying that HPD should
 	 * be used.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
+				   HPD_DISABLE);
 
 	pdata->comms_enabled = true;
 
@@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int val = 0;
+	u8 link_status[DP_LINK_STATUS_SIZE];
 
-	pm_runtime_get_sync(pdata->dev);
-	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
-	pm_runtime_put_autosuspend(pdata->dev);
+	val = drm_dp_dpcd_read_link_status(&pdata->aux, link_status);
 
-	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
-					 : connector_status_disconnected;
+	if (val < 0)
+		return connector_status_disconnected;
+	else
+		return connector_status_connected;
 }
 
 static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
-- 
2.34.1

