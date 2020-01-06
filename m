Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1341319C5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 21:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E2F6E52D;
	Mon,  6 Jan 2020 20:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092070052.outbound.protection.outlook.com [40.92.70.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA146E52D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:50:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlvJIjjfWrCP1UjieUwTTDn/W/bWj2xbe4kXDfrEEXA5vxJa4j3Z4tyuRnZK0EwROf/r0vjwBlCM2NbkukbwObOUGYOTe5esZkxegrp51AKw5UimUx7mrZi97aqaYlGcaQuCS06jZwCAdsI/rqlMh7VnOyaNRLQFroaCo8b8F+hV/0iXyffBE9h+70Qbc5aa2o3AU0RM7fi4wbQ0zXKbtLOb1U5GYB+B6QCa3MRHfeczuew8zm9d+l7FbLoBSid9xtPluHmZhDkMoMCjVavRnCsuBqCjjuayWEzz5e1da5DVWKQR7jVxEsVAoQbFDsMRtsIYiViFhHHEgP5/KLmzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlKHrTOqsAVSdlZMiJZ1edfCPDb++y9Qlo88ad7C+QU=;
 b=DhekyVk3M5vi/0QJPjeHd3II/HZehA5ZN4/GCgkmFE7B5KASNlez3FLNKiF45/r23m9y1ee6yQS/JVuYyFPzl7rvllaU+RendLcNYAaWgde/p13BhZ7YmL0f0I9DQsJiKh6UJcrRNDR67sC8RfNv/nAEwQf4ShClw/tMblPIJlyOMbnNxHYD7Cn5VSrG0WcYm2Mlu/IPLFjs920WSR17JvTDI5rAWctH+PbMecjpswTOTqLQIdpA/B44kh57hHtwilROazUs542BWqjJKhcPDwMv/FjytHnhCNqk4oMmrckWouQEG4NfxKwhiFj33xfQTjAo7dUaK1vGz5nCfvhBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (10.152.18.59) by VE1EUR03HT162.eop-EUR03.prod.protection.outlook.com
 (10.152.19.186) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 20:50:00 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.18.51) by
 VE1EUR03FT047.mail.protection.outlook.com (10.152.19.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 20:50:00 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 20:50:00 +0000
Received: from bionic.localdomain (98.128.173.80) by
 AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12 via Frontend Transport; Mon, 6 Jan 2020 20:49:59 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 13/15] drm/rockchip: dw-hdmi: limit tmds to 340mhz on
 rk3228/rk3328
Thread-Topic: [PATCH 13/15] drm/rockchip: dw-hdmi: limit tmds to 340mhz on
 rk3228/rk3328
Thread-Index: AQHVxNLcCglm8AAmg0a0X6vD7F1/yA==
Date: Mon, 6 Jan 2020 20:50:00 +0000
Message-ID: <HE1PR06MB4011783219A9A6FCE76DA16FAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR02CA0026.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::39) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:AB8C425C86532D77E6649070CEE523E8B6C0720331FFAA8FDBC9BE057AA1C4F3;
 UpperCasedChecksum:6D88C61442898C4BD18C9D558ECD22A52DDAF77DD42A07FA3CADA659CBDDBA25;
 SizeAsReceived:8198; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [sS1bMFFduIyhXRMcBGOPHGeLfvaMPx2X]
x-microsoft-original-message-id: <20200106204951.6060-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 3b9c3efc-8435-4b77-9242-08d792e9feea
x-ms-traffictypediagnostic: VE1EUR03HT162:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VareEuWCl2yDbV5bsV+UpRLabhkELuRwSi9zblqROQZIQLBVv+45ksnu8cCIN+9Z42Dk5ZKdE4OgcREnHV5jqABdMMq92ddOMLX8aob05PaUKzmkOiQz5BK3tC0uKngRekSeEmIJvsjcxU5XffvitYPAEcW5uLXopzIu4s3teW+Y4+VtH+tufVHHJqFfml8h
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9c3efc-8435-4b77-9242-08d792e9feea
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 20:50:00.1643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR03HT162
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RK3228/RK3328 does not provide a stable hdmi signal at TMDS rates
above 371.25MHz (340MHz pixel clock).

Limit the pixel clock rate to 340MHz to provide a stable signal.
Also limit the pixel clock to the display reported max tmds clock.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 22 +++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 45fcdce3f27f..66c14df4a680 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -237,6 +237,24 @@ dw_hdmi_rockchip_mode_valid(struct drm_connector *connector,
 	return (valid) ? MODE_OK : MODE_BAD;
 }
 
+static enum drm_mode_status
+dw_hdmi_rk3228_mode_valid(struct drm_connector *connector,
+			  const struct drm_display_mode *mode)
+{
+	struct drm_display_info *info = &connector->display_info;
+	int max_tmds_clock = max(info->max_tmds_clock, 165000);
+	int clock = mode->clock;
+
+	if (connector->ycbcr_420_allowed && drm_mode_is_420(info, mode) &&
+	    (info->color_formats & DRM_COLOR_FORMAT_YCRCB420))
+		clock /= 2;
+
+	if (clock > max_tmds_clock || clock > 340000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_funcs dw_hdmi_rockchip_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -424,7 +442,7 @@ static struct rockchip_hdmi_chip_data rk3228_chip_data = {
 };
 
 static const struct dw_hdmi_plat_data rk3228_hdmi_drv_data = {
-	.mode_valid = dw_hdmi_rockchip_mode_valid,
+	.mode_valid = dw_hdmi_rk3228_mode_valid,
 	.mpll_cfg = rockchip_mpll_cfg,
 	.cur_ctr = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
@@ -461,7 +479,7 @@ static struct rockchip_hdmi_chip_data rk3328_chip_data = {
 };
 
 static const struct dw_hdmi_plat_data rk3328_hdmi_drv_data = {
-	.mode_valid = dw_hdmi_rockchip_mode_valid,
+	.mode_valid = dw_hdmi_rk3228_mode_valid,
 	.mpll_cfg = rockchip_mpll_cfg,
 	.cur_ctr = rockchip_cur_ctr,
 	.phy_config = rockchip_phy_config,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
