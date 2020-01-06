Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF55113199A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 21:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1F56E51C;
	Mon,  6 Jan 2020 20:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092068096.outbound.protection.outlook.com [40.92.68.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F30C6E51A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:47:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnueme5f0ngvz4IVyl2TE7QgQ5v8d+wYm6J6Ij6OGsEIbCOC40n7/VwEaw+h4ynDn/FbdGSOa3Zr7erWB46FKK7BPMLJH5r9O2L+DWAxAObIvOrWUPCre+KPh1EAq/O1BfM3FfQSNIL0cbOa1X+F+yAJ9ODqDaS4o0uh540WnBa64AIRp8gArpqDxpbudu41gHurhjZ4dw1B4oL2Om6eAXMIzAsapP7ep5pjCQBlHQGdcCI53Srdhqc96yK75AZsBu0XAjaOkmzXs6uMecGH+Rn3KXvbmC1+rphW4TD2HjwmnIR2q+SgwO+VQ2fd6mz//Tlo++jg7VBEWNc9CEd1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKJN8uIVQTNEywmsJYrT+i/CU1Fm3YtLuI0/Y+yPfSM=;
 b=jiAwTD9C1zhT/OAQbLUK+QBu/37NoIhN0IRPcbyw5eNDg9YWQYuXts/dRn/FdLU0O7Bf8Hkxb7qLQpyi3wMeOWctwpdKkr6Lw9Bz+o2axp4N8TuPwC4nt2tHO8EhQxO+26ex1CCwydbPm+0wek2C7CP4yF0N8qDCil80VPXnnJqtip1w/4F6PSMxjgtPjlrAEbeIYzVXZHBSK0sdk0RxgeqH2Jb2J+SNa4owwJ/txUkQBbGtDpbn8ZKfzKuTszlFSGCs2FaQQQbRoR/09NO2C3W6V3iSOgtanAX5KA3iGh8dzqrkrTPB6TLgu34NS3x7wRsczvPGeWRa52Xfdv3A9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
 (10.152.12.57) by VE1EUR02HT159.eop-EUR02.prod.protection.outlook.com
 (10.152.13.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 20:47:41 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.60) by
 VE1EUR02FT060.mail.protection.outlook.com (10.152.13.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 20:47:41 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 20:47:41 +0000
Received: from bionic.localdomain (98.128.173.80) by
 AM6P195CA0080.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10 via Frontend Transport; Mon, 6 Jan 2020 20:47:40 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 02/15] phy/rockchip: inno-hdmi: round fractal pixclock in
 rk3328 recalc_rate
Thread-Topic: [PATCH 02/15] phy/rockchip: inno-hdmi: round fractal pixclock in
 rk3328 recalc_rate
Thread-Index: AQHVxNKJGsLSKAwUL0mZqpV7XUgnkw==
Date: Mon, 6 Jan 2020 20:47:40 +0000
Message-ID: <HE1PR06MB40115385474B15A5CD757F76AC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20200106204723.5889-1-jonas@kwiboo.se>
In-Reply-To: <20200106204723.5889-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P195CA0080.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::21) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:7D05201E926B7A807AED86CE7DA3E177E4B1ED108D4B7F117BE4957957770AAA;
 UpperCasedChecksum:3201996FAD9EF958497F043F6DCF75580F62E2D9200FE7544ABF630FA5A40EC7;
 SizeAsReceived:8211; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [xZ2gScxf/Ay8kw9Y13kM8YRG7DQFkV+B]
x-microsoft-original-message-id: <20200106204723.5889-2-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: a1724c0e-3e20-4865-5d1f-08d792e9ac00
x-ms-traffictypediagnostic: VE1EUR02HT159:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F+pxF7eabRGcIqCoN1ruaOYqirxVvmGCRlcixY+ZG8U+HGC7Cr3fSFUjgKP6M+XdOIX73V1Ok8iet1ByISVdttWXd68q6SV0OIZSTDPPSqvG8gLVsBoC0JmYzhuOU0EB9J8cWVrYnKsdjU/hIpWumtXwfnDEHcjFpYY/8caQZl1jKhpMfReZWczIo422XO+a
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a1724c0e-3e20-4865-5d1f-08d792e9ac00
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 20:47:41.0112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT159
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

From: Zheng Yang <zhengyang@rock-chips.com>

inno_hdmi_phy_rk3328_clk_recalc_rate() is returning a rate not found
in the pre pll config table when the fractal divider is used.
This can prevent proper power_on because a tmdsclock for the new rate
is not found in the pre pll config table.

Fix this by saving and returning a rounded pixel rate that exist
in the pre pll config table.

Fixes: 53706a116863 ("phy: add Rockchip Innosilicon hdmi phy")
Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index b0ac1d3ee390..093d2334e8cd 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -745,10 +745,12 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 		do_div(vco, (nd * (no_a == 1 ? no_b : no_a) * no_d * 2));
 	}
 
-	inno->pixclock = vco;
-	dev_dbg(inno->dev, "%s rate %lu\n", __func__, inno->pixclock);
+	inno->pixclock = DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;
 
-	return vco;
+	dev_dbg(inno->dev, "%s rate %lu vco %llu\n",
+		__func__, inno->pixclock, vco);
+
+	return inno->pixclock;
 }
 
 static long inno_hdmi_phy_rk3328_clk_round_rate(struct clk_hw *hw,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
