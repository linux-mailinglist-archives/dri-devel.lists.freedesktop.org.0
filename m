Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DED49777D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 03:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F9810E79C;
	Mon, 24 Jan 2022 02:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D0B10E79C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 02:41:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPaVFgXH3En4mYohiqw6No4EYnZCTPwgxHUlfeGYvvAzrzCtY5sgesdagBEzMdvfgUFnzbxo3lSww9wDofirkqdjysY4nzxN1dGIGWFYpBIcQThTucRQ+ml6BJJBy3Br6SP0VLFEtrDK0Iih3ZtuvmW1DHumxNZTiEyJHAZZLGooVGbVSXaPr4E5f2LL4b2TOGxEzZIjMuJI6l/SYceL157hKkZNrlQhSODU0FbD9icFHTANr/XT359wNJ/4YJlrndGvaOE/Bzq6pFEY5J0q5rAW8i+EIyVnzLsqQ8y17TPFaBRRr75wXG0krb3lgjUqoPm/6/PRhfKKm+691+Mpgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ax5Pld8pRz2Hpi0aiHNbRfA2yl8XLdlsps5UXcL9ws=;
 b=UD7F2w2wUMXvzGwqCWMQhenrna1UDACVJN7T2AKOaLxUFIunzq+YrIR9LgLb1nV/EVWfZm9yYiuqlOrzM8a19U2FCJWW7paUsm75+AZlkRcgcFvkOEutWqib7NcbzVdQhTxE+C4I0diDY1IPItQZMDmBt5OwXPPfNP2TplmkJF6pYo9YSoSLaXGc/NW7sKjetPj28692S3kbuIUk75Jn7XdTiTiK9KwqROw/gOZRwrdpRPveTN0m1GlM2Jkdjt/F5RzYBDnxWnxiMfHZX3sGu7UUqyOX4b97Wa13sDHbPMwHtjKApjqHtghfwgJETYauqKlADVIh8t3GFTygtuR4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ax5Pld8pRz2Hpi0aiHNbRfA2yl8XLdlsps5UXcL9ws=;
 b=iEfyfIcMoKZZDAfuDw25u+4okwA549AxZmc0zYqIot9rQMZ9E1avLY3PGPegqrvLT3R5HLmQL81Qmph1tqkHPHr/bLLYIfvbiUkOKyCZg6ge58aokpv2eYfLLg+IAyGWhc8sEWxR0sVP9tfsrIT/WnkV+vHrTFHR5VRmea9Gvv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB6438.eurprd04.prod.outlook.com (2603:10a6:20b:fd::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 02:41:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 02:41:05 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v4] phy: dphy: Correct clk_pre parameter
Date: Mon, 24 Jan 2022 10:40:07 +0800
Message-Id: <20220124024007.1465018-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4b3e70-91c6-44d2-1674-08d9dee2f7c7
X-MS-TrafficTypeDiagnostic: AM6PR04MB6438:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB6438EB32E47B046965DA62FE985E9@AM6PR04MB6438.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4vX1Bxxw0q5afiaj6Hst2A0j2UQkONstd3yG9KcYvwzB3H4lKMnjWoUVMRvYTxvDfM1f0/Z9YT3qs0yUCd2DN2E27P+nnCdG1eZEIjBURQnCP9RVahlmvHtffISjU7s8umJFoSIRQo7ZJgyEisakI8FhqwsB03vrWffOHzFZu/AP21ltXTQVaVPEc2nxKzKX+l1hh1cE0CroE1CEJWx44pU9fDZzzLfeQFDXtEP0MCpqRvTLIlWums1WOeVNzLSprolpWwA1XLzPEo2QOMmQ6Js7yHtKGUwmZRmVfOXkD/pdUmNf8T43G8tRo1UwVCH8795oZf8sJKzzo3QTDcmCtWJGurkVJO5+CS3sjgQLTW9JeTTHVzCMpxgHIdmpd4MpfqujbkV7rGbg+Vkp/BdPM0gx5g0CzlbOFyXY9FBcHzA9kvL4ydZ73+lQwbKwH1YY2CPTd9+uCRxQY85BIdKmfEz1TaGB4lNIfIHgzxxnUr5jcZBAN3m5RiRv5Fyut8Ve+pd587lIg5ypB8sgEK1j+Kw7wvZcqupPUYpkA9G45SyNLNXlIwY/vwu48inRmi1tl0+249Q8OZwxg+FhYwcXIbqQg3sT5KH13Qn02XypqNDfPsH2nLbQ5NgRuYuucSEIkLaJ/VgCQpZcuoaJIaa0td1NHQPeCRyn+su/EGtw2ROtT+hzQ+7zBmxKGnOqdsEIjOT0G4l3QUB6mAlEwXfPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(4326008)(2906002)(54906003)(66946007)(7416002)(66556008)(1076003)(8676002)(6486002)(8936002)(6506007)(66476007)(83380400001)(186003)(316002)(26005)(86362001)(38350700002)(36756003)(6512007)(5660300002)(38100700002)(2616005)(508600001)(66574015);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NThtK1ZRQ0FvMW93bzFWVWJjV0IyRzE2cTAyYTFqdTZmeWtGanFvVTI2Z0pF?=
 =?utf-8?B?VlFVbDJSQ3dDa3RweUw4dVY5MGh6Q0IwSkFGQVBBLzY1TFNHeXdsV1NIa3hk?=
 =?utf-8?B?SFdNdm81Y3BsRzdBTXNVbW1VYUwvanA5aHgwRUZxUFAwcktyK2w1QndPNmpG?=
 =?utf-8?B?RkxrUC95S3ZBWk93dzgzcmh3SjhIT0FKblBvQ0dLMzFUTGgyS3dnVFFva1RZ?=
 =?utf-8?B?ZmRYYjVqMjJVeTM1WXh1Qmg3am1ocUl4dHV4ZEgxTVM4T0NQNUEyQU5nRiti?=
 =?utf-8?B?ODlCOGNnV2E0OVBtRHFqVG1BcEZnK0pHSzZRWXVVNnA2RFJ0R1BaNkc2ZkFE?=
 =?utf-8?B?czJkQk5wbEFtazRuSi9Vck1GZXNZMGZJMGhYSjFrMTI0RC9nSTNDVUMwNHdt?=
 =?utf-8?B?KzhUcU1CaHFQUWxSaXlDa3o5VS9Bd2hlNlE2aWhGbkxJcnZrM0ZsSEpKT2o0?=
 =?utf-8?B?KzNpK25raDREcVljM3FRSE5VR0tQOXE1c3oxemJKZFJvdkM1UFMvWEFPb2lJ?=
 =?utf-8?B?S2lkaThQNjVaRElSODhRNFZEU29wNXJNMmZXeTVXL2ZpVk45ZEFoOTN3NnpS?=
 =?utf-8?B?QnhET0I5OEx2SzJTUW5KSTh4OVRWOE55MjlVa0d1a3VsNzVZMU80RlVTSkdI?=
 =?utf-8?B?QUlBY2pCNzhIZE4xRHRSMklPWWZOUmVnTVAyV1dEZ0xmVDJha2F3enB0VTBt?=
 =?utf-8?B?NlloY2RHVGs3YWJ1Z1dmMGlrdGhGWVJJbi9MVmxVcTJTSlpvc0c2T0tLK0JE?=
 =?utf-8?B?K25OaVBCRXRDQ0pKa2pad0dYdzNMUkRBTk5USWFrL3Ixd1pqT2I0cC8wTWdw?=
 =?utf-8?B?SkNVejBkSWNsVm92aktsZTVWcmhDK0g3V3FtLzlLYlNwa1BkSTF3bnRsZ0ZC?=
 =?utf-8?B?Z3NDMzRRdytGQUZkYmhacGdjR1Nyek1vcTZ6M3ZjRnprUko0RVlWa0dnbkVP?=
 =?utf-8?B?cnMyYTA5YnFnZHpvc1hrSHE4NSt5d3RWVWswOFl5VjhhMEtzMW5oMVFqV3JM?=
 =?utf-8?B?T0NLUU1LcWg3ZEl1aW9pbXE1UGRPNmhXZ3JyTG5CMjYxenVETzdyS2JMYk42?=
 =?utf-8?B?UThUQ1VEMGVFSEZFNjNrcWpjMVdlangvNGQ0MEJVMDc0RnljR1dpNStBZkQ5?=
 =?utf-8?B?YkxZclpZTmlBK0UycVlLS2dSa3pmOTFGbGRUZHhXS2QzVTVCcC9FdVJPZ0xq?=
 =?utf-8?B?VmJ2Q1dNNktqZXJER0tTSTRYbnQ1NTg0SGtFdDEwMnRObEs2NkhSWHBQcWhY?=
 =?utf-8?B?Zm9rOFpaNGtnbUdYYWpMQ1oxMCtkTUh6SldWTk0wVFIrSllTaldyRng4Q0NI?=
 =?utf-8?B?NDVFdGthN1BDSjQwM2svbE9wSGVDMFYvbEpUQmllMVNkMHZlb1Q1STBISVRx?=
 =?utf-8?B?R05UUGpva2hJSGhBNzFlY2RsZTVRRGllRzlXaHo3Vk9XOHJGRCtpSHU2bDM4?=
 =?utf-8?B?YVdXU1R3L0gxczVzcjVONDZZaUpETjI3ZDlOUWJUR0k2WEdpb0xVUlJOMkc4?=
 =?utf-8?B?OStNbXN4anF1T3A3cWpDOU42Vm4zZGlnandlenE4K3dES3JJUXFnUmtiVlJo?=
 =?utf-8?B?TVFSTWNUQkkySVJGVm9CM2R1cnM5ck11NE9wY0tiaStiYzAzZW84cm0yTFJn?=
 =?utf-8?B?N3pvekk1eXNEYXVaRE1pM1BRWnpHdXZ4cDJBOTBocUdUSXpMalI5bTVPdXNW?=
 =?utf-8?B?bXAveVh3bFdFK0lpM2l3eWJwbjlVS0VWd2pvWGlqMkwxdE9NbWExYTJ5ZVc5?=
 =?utf-8?B?ejBVS3ZlamJCVjFTb2QxNEs1RVh0OEplUnBDK3pEemFZRHA0UVJLY1BPZ2Zs?=
 =?utf-8?B?VEVMbk9GTHN3NThBYmFCdmFQemFJdmp5NHNKcC9yMUJFamdtUE9KY2RKRjEy?=
 =?utf-8?B?VFFaeUxPOWcreEY2a054OENrTTcyRnRCVXNvZlQ5cTMyM1Y5YXV4b2RLRlN0?=
 =?utf-8?B?RU1JUUdpa2RKLzQ3VzNpNTErU3FnQlF6OFhqZzBjdGZOditNUWVTNk5DOU56?=
 =?utf-8?B?OGtOLzZHb1VKdnpmaS9VQjh1MkxlcndTSlRZNit5UUF2cjU3OGtCdVBka0R3?=
 =?utf-8?B?ODFjWEQ0SVdoMm82ak5waGNtaENjVjJoc1pUOHFGa1ViSXlGZUYwaldMdnZI?=
 =?utf-8?B?MVlpaFNCWXNwZWhoZUVGa2JKRU15ZytSd0hJUzZxREpjTlhKamg1M0ZmVEdp?=
 =?utf-8?Q?8PEMr9RDbqst+NAt1mj4bLQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4b3e70-91c6-44d2-1674-08d9dee2f7c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 02:41:05.2504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9y/49R7O0C2FJtxOJvHj2MucThCOtRqfqIYVb0r0rKPe4xr6irQ+JkeDe2nDZOZVjtExa95Rc++v5IaE3bnZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6438
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

So, let's fix the dphy core driver to correctly reflect the T-CLK-PRE
parameter's minimum value according to the D-PHY specification.

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
v3->v4:
* Fix commit message as the patch doesn't fix D-PHY documentation.

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

