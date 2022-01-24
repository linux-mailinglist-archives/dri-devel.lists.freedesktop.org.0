Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A496949776B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 03:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D4B10E489;
	Mon, 24 Jan 2022 02:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E5A10E489
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 02:34:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwGiy6ZqfZCtkl26MLe9BJixUkSFsHiLC4IQ6n5qn3wS6Y3GBgn6I2r1yZLoQVOlQ6YJv/dEptEIoD6OPowaw9JJSfOiwlyG785Xu7vIyXXSQaTlNqalLJXq3ukt4fWtr+qEBuk3epg1Mc8KIqoLs6Rj0Xr+PJ679zSXZbupCHrohV4jZNel1tco8AHqf1T+TX6O7oPZcFHTDvrRPvxTAfpyHev18EO7me9yc10617FDcIqL7J7x2KyP7gSfDTVyiLDz5igcCsNbWeslZminfzK3ps4p77Iz4+hcxcnFvcQFDwAe3/fcD+Re81Rl6MNFmxkmmbVO6859cB+F/enlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCKpcpKGncII1Ok2MwnulYVFCHJAndixOIIeGy8rqFo=;
 b=n8hq6B+3jRU5Iyj9Y1efEV0AdhCcY33kErAcfqiITTDvh/psVIPB8a0tibFKB2orTvZBNv0iLlW15NCQ9pjmuK+Bm7KCiSyZ4Z/db7JI5dIP3B2+AD8JSX9X3OxYIngu+ARHnxng8tfpqi5SJ+bZ4L5UbbIvE9Uf2m0Na4QgAalJ6WD/vWAT7ijOttkkcIqkG07kkT7my/pCvsqvDkOj1XPy2LiMudwJ30jTy0yJm2Dq8OWqh0XEKhcy0xf5Fox9OgQHmldBX0vm2JBkbbo2SBdjhdeQEGSau/1/nNPVBu8+o6CMOKSMyyGYsDCDKbocUNeyBKEWyqBnSU5JGnXA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCKpcpKGncII1Ok2MwnulYVFCHJAndixOIIeGy8rqFo=;
 b=VsD12tYfHnez6/kvd8DcTSYEpFRlEcazKRz30jwOrxPbJLZKJ2ZgL3Ekm6ki6+OVPbI8EMxOLNgu0BO9hyEnQ6jWLocrqWuCc9vxak5qAH1517RqirLuD90IzTOYI4RHCPjiSu9Loh1aj/bHdHA+JfRc9E11kZjJyo+pCHOX10A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB4925.eurprd04.prod.outlook.com (2603:10a6:803:60::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 02:34:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 02:34:07 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3] phy: dphy: Correct clk_pre parameter
Date: Mon, 24 Jan 2022 10:32:53 +0800
Message-Id: <20220124023253.1457834-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2418cf-51cb-4b32-2363-08d9dee1fe7c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4925:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB49254C6A027E1B85028458E5985E9@VI1PR04MB4925.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pE+5PVNSh/wuE4wGz1wC03FrlXHj7vzeZbfCa6lqFsQaz3ViV4vl6ZUJAOkNYsDFi98LijxByfs5UobMDqU0oX0295kpkDV6J4bwY6DtN1BIjIQwkt9GGP9qng/zBvtDIMTOSFZks8DTf20Nbw7ICTsb/VQ4YwBIubBdLDTyY2rXtv6HwolWQmKcnSQ8gUQ7GRX86Dgf8WDDrcO1yItfFfglwBt02eNgnuGQ+aPnE0fE5yuLZIe6exjZU9Q1FiiDtzS28WOPecbApD4jSJVV1KrzO9r1u52kJB9GFj9/W5257+uNgpNggYATcGYaUhkaDZv13qzN4Blyj7LScf8elJ/9WpFviXfY8qs/ih3IBYKyF2zMbanlgzpdEqFEKjdN1xwnD3ecNXTFfbYo9sXYXy3ibiQIIuk+SiwdO4xS4slRoNiEyrGHxSMir2n/CSwM7LBn7mJynvdOqm5waZIRrgWR1kM9dESf8jLA4xHw7g/4QybttRTeDxrBzZwbAsAKpu4BIv/iGC4/JZvwB848EN1CCXRfKLapZs7VnHJUg8fitRXzSFCjGaAKqppPvfrlHBm58Z5x40WmBuNoTSEXYlOsnAW9zj9EbFtdZOSYL4XPhF/3IcTWpvQlpIafb+/0an/8W1GvEAr8qESijE4eOe5uy92OMUTYnjscyRHmICpESkV+AZ3pgUxONqGBZjF4vWoV40kXj8zaRqoelePDpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(1076003)(7416002)(52116002)(86362001)(8936002)(6512007)(316002)(6486002)(54906003)(83380400001)(66556008)(66476007)(66946007)(6506007)(6666004)(2616005)(66574015)(8676002)(26005)(36756003)(4326008)(38350700002)(38100700002)(5660300002)(508600001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEhRMm9FbTk4WWdYUGpEK2p6bVdlMS9pZXc0V1BvVkpBQlg5cmlhTlN5TTd0?=
 =?utf-8?B?Zk1qZ0IwOFhFaXdzTzBYWU9QNGpUTFM0SmdsY0xWVmRKUDU3bmVHUjN1TWY2?=
 =?utf-8?B?WGwrVmhQTVVuTHBxMHJGckQ3UU9ONTNNTyswN1E0Q0lON3hnTjdGNTdpSGZr?=
 =?utf-8?B?WXBCVmpGc080K3NmNzRPWmdZYkRxbEFrNEhoUHB6N2puV2R3WmVOcnREYkNV?=
 =?utf-8?B?eDFLemVrZmhHbk9Id0xudm1TR2UraGEwRjRVMG9RNGNDOGtGYXI4T1I4azVz?=
 =?utf-8?B?NnQvYjJYTkJWUmh6OVhMN2kxczZXeWtIcTZwd3BMVmJ6S21BeE91UVpaZnNO?=
 =?utf-8?B?bVAyZ05jcWFVekljMHpjNmwra3gwYnA5YlQvMzBtTEVLQXFFbW1leXA2T0ZJ?=
 =?utf-8?B?R290SWpCZStmcDJHUWxzdVZDNmx6a1JnWWFsUEtZNm44aVBKMmNaY281V0Nz?=
 =?utf-8?B?SGpCNW4rVHBLamJHdW5McFN6TjlEeUc3Y3ZrcTdIZlhNblFlWjhzbDRySU1Q?=
 =?utf-8?B?Y0EyN2dPbWdaSGZ5WU5HaXhYdlZZVmVWTGJadnhPTmVxS1g3YVJzdkxGclFW?=
 =?utf-8?B?RFZHbnU5Y2FVQUFjU3ZXYzQ3LzhXbFlhK0JOc2FHWVB4L3N4aEg5bkRwRmZH?=
 =?utf-8?B?RHVzU3ZUc2ZOamd3ZVUzOUpFbU9SKzIyM2hDLzI0alVIdkFXRWpKR1RVY052?=
 =?utf-8?B?VWtpUkhWMU13TlN5U1QydXRZVE80MGZsbnY3WFlTVzZmZHJmUTE4M0h4ZmdS?=
 =?utf-8?B?VXFLbTFTbldvdWZUNDNTOWltMjlnRjR0NFZzSjh3ZXJaWVNMREZ5d2ErQy8r?=
 =?utf-8?B?WTlJWEZLV2JwUTk3Zmg1T2xoZWxjTzZSSWpiZTBSUjJKUWVsRVNiM2FCL3I5?=
 =?utf-8?B?M1JyV0wrSU1JejNyWVQ0ZWE4c1pRSUZXVGhBRE9ycm5jL3Z0Tm5mMCtuaUZZ?=
 =?utf-8?B?TUF5ZmZMTTNmZXYrTVBCOFgramlDNTUzeUs2MWFhOUtiaW01QnZDWXdVS3JB?=
 =?utf-8?B?UUxUL2wvaG03dWJWdHVWYlJvOHRNQkdWZGw0d3RPYkEvQVI3YjN2RWRna3I1?=
 =?utf-8?B?Z0dNcjM3dTgzem44Z0hFRDBRSE5mZndlZ05icG5TRVlYT3BPYW5yejlrM2RR?=
 =?utf-8?B?cXZQK3M1TUsrZGZNczg1WHdMWFhGTUs3R0tjeExvMFA1dUFoTFovQVF6Nk9Y?=
 =?utf-8?B?aE40cEJUWmVvTllKeVFKc01WR1hBME5SMVBTVHNBRGhtWFNDdld6V2l2QkVP?=
 =?utf-8?B?ZEcrL1A1ZDdqMVFqSG1aSEI0bGVqaEx3NWhBOWxkdG1Kb0Q0bmpuaVhTaDla?=
 =?utf-8?B?MmNxSEo0aGFMbGhjaTRzayttaFNENHU1eEFLSE95bmR6Sis4ZWRyR3RNa0U1?=
 =?utf-8?B?YVAwUE10dlBWUlBWQXN5REx5dGllZXRNOE9qaVlNOWlwTk43bTNxOGdxOFdq?=
 =?utf-8?B?cVFwYjRCR1NBdXF3MUliVCtZVENWTU1QbkJGRmk4Vm1xbEtucXcrUktnV2lN?=
 =?utf-8?B?YVFNMGo4L1BSNVdNcFh1a2IxVXhYUEtoeGpwaFY3RG9TVFh4U2lwTE4zL0dQ?=
 =?utf-8?B?YmgrWUN5V1pUczZMTGpZQ09GRDhGOU9CUXloOER6WXpmOFA0cXQxSWhCTjRM?=
 =?utf-8?B?UDYzTGhmc2xsVVYyTkp5RlhmeGpkblp0dkNtOXVqZ0NkbmhwYWNnUWdSd3E1?=
 =?utf-8?B?YUNOdHhpRkMyRDV6ZTRlOFhnQTYyTEdsQ0JjNk9xeFUzTHdWWkxBbkxmVlg0?=
 =?utf-8?B?VUJBbUFLSXMxZUM3Vk14SlY0M2ZiWFlmR2pvZXZ2bHF1ZW5UQ0NRYTV5S28w?=
 =?utf-8?B?Vmo2Z05vM2l6ZHNQQ1FPYk9BZzhka1BIUDNOdjNvWXpDL29Jd3ZueThlcTln?=
 =?utf-8?B?Vjljc3RVbHZ2bGxBb2hERlBhTlpMZHllTk11V3BVdE5lVjlZcUVsK3FRcWdU?=
 =?utf-8?B?cEYxTmI2Sm1rYlJaVWJzUTVkME1MK2xEZU5lMVVoK1NuWWpQa0RCZ2tNNk5s?=
 =?utf-8?B?RUZCS2RURFpibDJrYWNoait6RXdqcWZqUTA5MXlaNXhkd2lyVkRqZ0ZDY0Fs?=
 =?utf-8?B?VlkvZUhlUlRSUzlDdEl6K3UvOTErOGs3VWlQZnBLbGdZaFVYZm01YUhiWXJK?=
 =?utf-8?B?SFdOdEZjb2QyVkVSQkcwRFp6NzVXb1BFdXdCTTIrODI2czk1TldFMEdQZlg4?=
 =?utf-8?Q?YA4OMR+NluRU5wj6DAkHeRc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2418cf-51cb-4b32-2363-08d9dee1fe7c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 02:34:07.0066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RP1XNPd7USNjurfoCWyoqUUhmWPZcV6viBDEMqATLmeB6aH7OTC1k+9PnS40Lx4/gVQlHRhgBnC/bGVY62yjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4925
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
Cc: Wyon Bi <bivvy.bi@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
mentions that it should be in UI.  However, the dphy core driver wrongly
sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
is '8 UI', instead of 8.

So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
value according to the D-PHY specification.

I'm assuming that all impacted custom drivers shall program values in
TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
specification mentions that the frequency of TxByteClkHS is exactly 1/8
the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
custom driver code is changed to program those values as
DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE), then.

Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
as I don't have the hardwares.

Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Wyon Bi <bivvy.bi@rock-chips.com>
Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> # for phy-meson-axg-mipi-dphy.c
Tested-by: Neil Armstrong <narmstrong@baylibre.com> # for phy-meson-axg-mipi-dphy.c
Tested-by: Guido Günther <agx@sigxcpu.org> # Librem 5 (imx8mq) with it's rather picky panel
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2->v3:
* Drop D-PHY documentation change. (Laurent)
* Collect R-b tags and T-b tags.
* Cc Wyon.

v1->v2:
* Use BITS_PER_BYTE macro. (Andrzej)
* Drop dsi argument from ui2bc() in nwl-dsi.c.

 drivers/gpu/drm/bridge/nwl-dsi.c                 | 12 +++++-------
 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    |  3 ++-
 drivers/phy/phy-core-mipi-dphy.c                 |  4 ++--
 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c |  3 ++-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index a7389a0facfb..af07eeb47ca0 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/math64.h>
@@ -196,12 +197,9 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
 /*
  * ui2bc - UI time periods to byte clock cycles
  */
-static u32 ui2bc(struct nwl_dsi *dsi, unsigned long long ui)
+static u32 ui2bc(unsigned int ui)
 {
-	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-
-	return DIV64_U64_ROUND_UP(ui * dsi->lanes,
-				  dsi->mode.clock * 1000 * bpp);
+	return DIV_ROUND_UP(ui, BITS_PER_BYTE);
 }
 
 /*
@@ -232,12 +230,12 @@ static int nwl_dsi_config_host(struct nwl_dsi *dsi)
 	}
 
 	/* values in byte clock cycles */
-	cycles = ui2bc(dsi, cfg->clk_pre);
+	cycles = ui2bc(cfg->clk_pre);
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_t_pre: 0x%x\n", cycles);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_T_PRE, cycles);
 	cycles = ps2bc(dsi, cfg->lpx + cfg->clk_prepare + cfg->clk_zero);
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_tx_gap (pre): 0x%x\n", cycles);
-	cycles += ui2bc(dsi, cfg->clk_pre);
+	cycles += ui2bc(cfg->clk_pre);
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_t_post: 0x%x\n", cycles);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_T_POST, cycles);
 	cycles = ps2bc(dsi, cfg->hs_exit);
diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
index cd2332bf0e31..fdbd64c03e12 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
@@ -9,6 +9,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -250,7 +251,7 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
 		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
 		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
 	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
-		     DIV_ROUND_UP(priv->config.clk_pre, temp));
+		     DIV_ROUND_UP(priv->config.clk_pre, BITS_PER_BYTE));
 
 	regmap_write(priv->regmap, MIPI_DSI_HS_TIM,
 		     DIV_ROUND_UP(priv->config.hs_exit, temp) |
diff --git a/drivers/phy/phy-core-mipi-dphy.c b/drivers/phy/phy-core-mipi-dphy.c
index 288c9c67aa74..ccb4045685cd 100644
--- a/drivers/phy/phy-core-mipi-dphy.c
+++ b/drivers/phy/phy-core-mipi-dphy.c
@@ -36,7 +36,7 @@ int phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
 
 	cfg->clk_miss = 0;
 	cfg->clk_post = 60000 + 52 * ui;
-	cfg->clk_pre = 8000;
+	cfg->clk_pre = 8;
 	cfg->clk_prepare = 38000;
 	cfg->clk_settle = 95000;
 	cfg->clk_term_en = 0;
@@ -97,7 +97,7 @@ int phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg)
 	if (cfg->clk_post < (60000 + 52 * ui))
 		return -EINVAL;
 
-	if (cfg->clk_pre < 8000)
+	if (cfg->clk_pre < 8)
 		return -EINVAL;
 
 	if (cfg->clk_prepare < 38000 || cfg->clk_prepare > 95000)
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
index 347dc79a18c1..630e01b5c19b 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
@@ -5,6 +5,7 @@
  * Author: Wyon Bi <bivvy.bi@rock-chips.com>
  */
 
+#include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/clk.h>
 #include <linux/iopoll.h>
@@ -364,7 +365,7 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
 	 * The value of counter for HS Tclk-pre
 	 * Tclk-pre = Tpin_txbyteclkhs * value
 	 */
-	clk_pre = DIV_ROUND_UP(cfg->clk_pre, t_txbyteclkhs);
+	clk_pre = DIV_ROUND_UP(cfg->clk_pre, BITS_PER_BYTE);
 
 	/*
 	 * The value of counter for HS Tlpx Time
-- 
2.25.1

