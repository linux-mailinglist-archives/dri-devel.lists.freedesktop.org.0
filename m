Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 010B71319AC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 21:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FD86E525;
	Mon,  6 Jan 2020 20:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02olkn0815.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::815])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5084E6E526
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEgQNIIiKleJSe7ycBQ5wtEeI5esJbqqczYmvUpnGpkqoyK2WRSTo/j2RprUAeEaDYqsqNgBWUvbwd8VUiI2ZlR7SIVDnBBqQzwdAV6XiHpRdUxnl2034JdjVyk0iFSmc++CHCeoXt2QcneDoGfWKbDSE0i4Z7gbPQBdpmGq+8HgkPkw1U5l4hDeCVaO06KBVawgmXoLt7Kt6bg9gPZ04a2NgyBSBOtYO10N3phN3PIfC9DtcWwv+PulMqNo9M/737NxSapUiBqm0arlGSfZnxustCgJYGpolYgWw4qV4e/jCBSN8N4lUyh67NDtQ/BhLEKSKEKuHcQWWdg6bwdv4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz7zdJ2g6Cfathp4V9IAfu7oi4sCymZHFj3PJ7xFMH0=;
 b=JC9+EdPoRmaVhpelLHtIs+9F9C4mYwDADeqLTMDpAkvQownOILei0L45aqo8IxT8OmWTrvEuWdOrlG/ywa04j4a0g763pNsmke6YrTMLrJA02qmBbTtg1s6/+LGtRGTEZ6t1RUHuZS1M6vRT0Kx6lVlDfS+W0ua5MGDPzFz+johxHWrBtXQ/26n5AQV7nETj0mnJmPzO24YKQVz7I+v8AooseIBZOaYIxNMWOkiWmPUZolxxKSh84AxiGQegr4VHMr74ISpP3sw0CpCxisj03kfFFlgkmt9jUZHKPzgRNmswtbCDnHPrEPcCIXG4+2hOcNYj1XzDozPF57Iolct0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
 (10.152.12.52) by VE1EUR02HT104.eop-EUR02.prod.protection.outlook.com
 (10.152.13.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 20:48:27 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.60) by
 VE1EUR02FT060.mail.protection.outlook.com (10.152.13.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 20:48:27 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 20:48:27 +0000
Received: from bionic.localdomain (98.128.173.80) by
 BEXP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12 via Frontend Transport; Mon, 6 Jan 2020 20:48:25 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 07/15] drm/rockchip: dw-hdmi: allow high tmds bit rates
Thread-Topic: [PATCH 07/15] drm/rockchip: dw-hdmi: allow high tmds bit rates
Thread-Index: AQHVxNKkeAgLW4fg0km1/R3lpurfaA==
Date: Mon, 6 Jan 2020 20:48:26 +0000
Message-ID: <HE1PR06MB40112CF884D970B0E7C45969AC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20200106204812.5944-1-jonas@kwiboo.se>
In-Reply-To: <20200106204812.5944-1-jonas@kwiboo.se>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BEXP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::14)
 To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:FB902BBF3D2881926EE816FD8F36B41BB7B4B3D3C372D2E3186D2AAC316EF4B3;
 UpperCasedChecksum:8225127E07E57F9F417102B355F26304ACF9103D9125A3696E54680E84951F4F;
 SizeAsReceived:8151; Count:51
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [vVoqW0qdInTAr9onLaiti0enbf81W7Sz]
x-microsoft-original-message-id: <20200106204812.5944-3-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 51
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: cb547982-72c6-4a2b-5c13-08d792e9c6ec
x-ms-traffictypediagnostic: VE1EUR02HT104:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jv8BpL8GmG2vSPWBeXwI6le1sFoYUtbMuPgTC5yI+BAiYFgLBlXK4lvcbZ2MoAv6CqTwrmCYulkh6ZVde1mDt7ehVOuu1hVtGjwj309TNNMuvzBCed6K6bNuie0UbVVBayFHuzCwLQJcZyPQfeZ/Yq4sM0zDom7JcX0emZIG3z91vHg+eoYCkJCkNGXYpVKp
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cb547982-72c6-4a2b-5c13-08d792e9c6ec
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 20:48:27.0311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT104
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

Prepare support for High TMDS Bit Rates used by HDMI2.0 display modes.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 7f56d8c3491d..fae38b323a0c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -318,6 +318,8 @@ static int dw_hdmi_rockchip_genphy_init(struct dw_hdmi *dw_hdmi, void *data,
 {
 	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
 
+	dw_hdmi_set_high_tmds_clock_ratio(dw_hdmi);
+
 	return phy_power_on(hdmi->phy);
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
