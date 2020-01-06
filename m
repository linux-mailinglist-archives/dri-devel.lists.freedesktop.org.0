Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753551319AA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 21:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853786E516;
	Mon,  6 Jan 2020 20:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-oln040092067016.outbound.protection.outlook.com [40.92.67.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77376E516
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:48:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUDDxfLWj5f6UCOttygLaesMrR/F6mbrq2bbbvMh/f0bmEKO/wai5v7Y1oqEWWlPzRDuCe9mWSOWfvf7OmQor/RSrK39pJ5dsp5t5l3v3wxkTt1qV795ncw5qe35zxsV1r9Shw8RQlSnUrXMtwn5ox4zitgXGkpZD5tSNML/YF6F4C8KyMImVN1e5b6borM3AqAcQ0j8dpzSUIQ8Ih74bC9EUWe2YMIwm2N2joT24ATJ9TjJeLMYxPqTZTwhcu5/TlKBP5IVbNAtTLfWExGJjj4Kj8biWrqQqh/H2oqR44+xP7S2KrFY7rmB5RslE5z5w8PBKRv66CD2r0L4dHd/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4jXVzazZ3/9Eav2xuwB+ZquFpaK7pmEsTMFKx8yGNg=;
 b=QSwuLxtqWBJFu/segv1BkBf8qkkoQ4bjGdXKGqhRVHUGtOakqUaFb4YvfbashWEVqXP4bKKSa1eAGj/kW7veDVhhLbvyAzt0h/IIExij/qNEwQf7rEo1fCEfzIenHROhvC6CF7/6HbVsGRigBCcK40Iczue3lMTLQSNGhOmMjpL8x/B1rgtEEM4qwpvVK0oGBgp37dsP2g9AXrit5npzyw2inUmTU0EiIjGZ0baqT4i+6Azz5fAQNBioLybcjzj8cpqkiNZqhR0syc7DitZs3OK6nluher+lb/jZpmgPQO9DOH3U/kBVDV5KFj6q02iE1M658APvyRB0q8Ss7+kZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
 (10.152.12.56) by VE1EUR02HT242.eop-EUR02.prod.protection.outlook.com
 (10.152.13.235) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 20:48:24 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.60) by
 VE1EUR02FT060.mail.protection.outlook.com (10.152.13.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 20:48:24 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 20:48:24 +0000
Received: from bionic.localdomain (98.128.173.80) by
 BEXP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12 via Frontend Transport; Mon, 6 Jan 2020 20:48:23 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 05/15] phy/rockchip: inno-hdmi: force set_rate on power_on
Thread-Topic: [PATCH 05/15] phy/rockchip: inno-hdmi: force set_rate on power_on
Thread-Index: AQHVxNKjXzxE07MhTUax7MAlwfFB7w==
Date: Mon, 6 Jan 2020 20:48:24 +0000
Message-ID: <HE1PR06MB4011B7E7D45001B9AC781C52AC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BEXP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::14)
 To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:29B1B18902028F4A73CE2E7749F23753B2CF0ED26EB1BD74EE109D3728EE1E95;
 UpperCasedChecksum:09FD4E1D33D2F0A269D0F840EBDC21ED13F27482DDBC533D877DBD98B32E3297;
 SizeAsReceived:8204; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [xigJePNDY7vnVS/fUGiUoSvRA965jNoL]
x-microsoft-original-message-id: <20200106204812.5944-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: c52ba18d-dd8c-40c4-4f2d-08d792e9c5af
x-ms-traffictypediagnostic: VE1EUR02HT242:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pBD/H6NRL3RgqxLwuQxA+51tNW8rPISkTu1g2k/kvu2uY/7s/v30qXDAivMjivZHPPoaOPASX4jjLTsK0q5Dks21vwyAcj6BsaedditctzzUS5Tm2rkpYo4F8SkX81KxxlSUu3XYIlVJPrrGzkKH1izOgR/A8YV3bitu36bw4Eo0HO0ePKtfUD/421cZbgQF
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c52ba18d-dd8c-40c4-4f2d-08d792e9c5af
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 20:48:24.1018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT242
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
 Rob Herring <robh+dt@kernel.org>, Zheng Yang <zhengyang@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Huicong Xu <xhc@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Huicong Xu <xhc@rock-chips.com>

Regular 8-bit and Deep Color video formats mainly differ in TMDS rate and
not in pixel clock rate.
When the hdmiphy clock is configured with the same pixel clock rate using
clk_set_rate() the clock framework do not signal the hdmi phy driver
to set_rate when switching between 8-bit and Deep Color.
This result in pre/post pll not being re-configured when switching between
regular 8-bit and Deep Color video formats.

Fix this by calling set_rate in power_on to force pre pll re-configuration.

Signed-off-by: Huicong Xu <xhc@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index 3a59a6da0440..3719309ad0d0 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -245,6 +245,7 @@ struct inno_hdmi_phy {
 	struct clk_hw hw;
 	struct clk *phyclk;
 	unsigned long pixclock;
+	unsigned long tmdsclock;
 };
 
 struct pre_pll_config {
@@ -485,6 +486,8 @@ static int inno_hdmi_phy_power_on(struct phy *phy)
 
 	dev_dbg(inno->dev, "Inno HDMI PHY Power On\n");
 
+	inno->plat_data->clk_ops->set_rate(&inno->hw, inno->pixclock, 24000000);
+
 	ret = clk_prepare_enable(inno->phyclk);
 	if (ret)
 		return ret;
@@ -509,6 +512,8 @@ static int inno_hdmi_phy_power_off(struct phy *phy)
 
 	clk_disable_unprepare(inno->phyclk);
 
+	inno->tmdsclock = 0;
+
 	dev_dbg(inno->dev, "Inno HDMI PHY Power Off\n");
 
 	return 0;
@@ -628,6 +633,9 @@ static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
 	dev_dbg(inno->dev, "%s rate %lu tmdsclk %lu\n",
 		__func__, rate, tmdsclock);
 
+	if (inno->pixclock == rate && inno->tmdsclock == tmdsclock)
+		return 0;
+
 	cfg = inno_hdmi_phy_get_pre_pll_cfg(inno, rate);
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
@@ -670,6 +678,7 @@ static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
 	}
 
 	inno->pixclock = rate;
+	inno->tmdsclock = tmdsclock;
 
 	return 0;
 }
@@ -781,6 +790,9 @@ static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
 	dev_dbg(inno->dev, "%s rate %lu tmdsclk %lu\n",
 		__func__, rate, tmdsclock);
 
+	if (inno->pixclock == rate && inno->tmdsclock == tmdsclock)
+		return 0;
+
 	cfg = inno_hdmi_phy_get_pre_pll_cfg(inno, rate);
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
@@ -820,6 +832,7 @@ static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
 	}
 
 	inno->pixclock = rate;
+	inno->tmdsclock = tmdsclock;
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
