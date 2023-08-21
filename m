Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB5F7821F8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 05:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D0710E186;
	Mon, 21 Aug 2023 03:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2067.outbound.protection.outlook.com [40.107.104.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B2A10E186
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 03:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VG8JnuJPlyHwYj+ZEdPs3agOoJPfJE7si/jKEnpaJoZUszITAtPDPQT8cEhtVMn0gp/NHloMDfbK3b3cPUE7iNU4H5al4qQZ0p+N48g0K8HCeZrqCeHP16IqczDaur7Lf75Q45HKqPLQOju1mOm6VVM1Q9JaRojO/JggdXxQthOZz4o0Q0mIeWbI2Nd7vbZPLI+xoea+h1hqFyqSXbyRlhC6Ph7HuzJyD3jST3XC1gNlu7e81Bmkd1Jn9uewrdHV3UwKjkg82GiONh5y3u62mnbvhOXxu5qIpGL2WbtGQ/UCjv9PWtX3xSEtGTEgVT5z4ApMRNYQYCVrZBiyyJVrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVXnfxj/ckYeqKH52I7gfYVIIQEx/vEUtr+1t+l7dxw=;
 b=ZpZE6WTP/twTgI48yJ0nvMxiu/JPLqAfcwT0b5yRzS5KOOleMbvyVIdSKqZuyjAumvJsaJVhgMljiWdgc4HBVNI5+gIHvjfa/3ZO+eqb2VOV5y++v2Eb7ZWruRoObefLWAV7RnKBXJrX7we5d4igqt5/sQGVovc+SplABFgfUxVOecGtEe9b2tAqkK2l+1EqqA6Yqh/RC8lQevgj+/3JKMi9q3BW+SlQKs0XTC8v8NwouCRI31miVJ4pGtGfyZz89nRfHQpK+OHhGf9yPrAaMCLU4WkKFeDA+f8qhsQ1myNxe3K4IzIq5TMTW31gA0VZb9VLJadLbCELY0AAv1UiGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVXnfxj/ckYeqKH52I7gfYVIIQEx/vEUtr+1t+l7dxw=;
 b=mXZ72c81Yjtoem0t9J2ZC/dasMZFOpvfYQnEh+zVSnaNEehs3m70oP3VFtVJY/JCbefGz8Eq5bHDzgjJlu6mQ+vQeNLTo9AAW47bD2SvBClsVgMTcvtfN7CyYbMbREW6dm7c+foTr4GrPTmJjnnk/KnifHGNzQUrGjZwOjUJSV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7758.eurprd04.prod.outlook.com (2603:10a6:102:c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 03:37:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 03:37:35 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 RESEND 7/9] drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX
 and LPRX timeout check
Date: Mon, 21 Aug 2023 11:40:06 +0800
Message-Id: <20230821034008.3876938-8-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230821034008.3876938-1-victor.liu@nxp.com>
References: <20230821034008.3876938-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: ec70e357-7271-4be4-4a86-08dba1f7f551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZOpZch66GbntDRl5fg8MC+pacEnc3x7mHUfromG9LxxzukbDoe2Z6MAEzPqRTpNzu39B6GHVEPxb2zEdoU4Ygc4kSFVS8OZW1SakAQMWhkXR8Ylr+t/fwveNyPfISdwpzpRW5S2e06BHJM62e3j/gNUpEZKNzsZBt+Mx0yLDk20dAVUQKKv12oZoGxdkUeby/RVvgI+maj/d5b0Q4iD1irei4RPOoAA2zdO7jrXJXb3zNU7U9kgGp3ywHX7Tg2PmMQpwEcWqwkxKSlKgP5W6n6i1lrqTsh3QmOYnDU7mGS4nslOilEYjovHeBKvtnVedAbBniLW02CEk4RT60FFwKBB6VEFWPpvk1ROlNKEomKPkInWAkwPQW7jM11E2Z9Uvc1V9yuqPGEgwo51QFaFFrCOYC3CV1yy7PZf4j7IpauEPtWgTbDdyYeQVrFDhsKKudJIPUaEsXBc7rM32N3DX0aJHpmTdpQlQSV4DtHfITs5VyIh68els2dfZmdGafOawFd4ZaADR2e1YPJr3+axkCkG1iTpPbAmL85EPLKMSl3i1ShEZODPJJ8Z3AXseD6D+edU6gHkF62Jes7nX33I/8wSTS8DHAIWB70teGCCD2pH6DLvOeUBIeTi7UbPENWpo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(136003)(396003)(366004)(346002)(186009)(1800799009)(451199024)(1076003)(2616005)(26005)(6512007)(38350700002)(38100700002)(36756003)(86362001)(83380400001)(316002)(8936002)(8676002)(41300700001)(66476007)(66556008)(66946007)(2906002)(4326008)(478600001)(7416002)(6506007)(6486002)(6666004)(52116002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VWAkEEvRAjpdf9cBwXmSsRI0wem80RmRbQAeQ9gftKCBMo5wOqr18zOxDj/s?=
 =?us-ascii?Q?UNG0D0YvvwRZ5oVMUjN/Rjjbt6NqGgeU4luUZ0krmh5D/VdE+L1OAIiAktoH?=
 =?us-ascii?Q?LFNn+inGwkBVXEIr+21hWI8Y8ZGAFGOoxJFU0enIyPmTvKgP68ghTbw6Lzh9?=
 =?us-ascii?Q?8X1hOmnnEvLCfFqb7FdoUg6+eUkkAU7I9hmQAkW00l/DofHuees8DbWlO4vb?=
 =?us-ascii?Q?UBaUiVkaSEInoS4KyGlmRFAFCGNJhTPcEejW+pKJDMaoKTIJbW5DpVTOmEPm?=
 =?us-ascii?Q?4/ja3VGiyw6lDs/B1/E+zwB/zHXjzwZtzaAOrG4Dkk9XmaTmYe6j3/Ba0raO?=
 =?us-ascii?Q?VTewZHM4ZlfqoflvJjM8EgY70sQZz8jgj+JIdlBtR2bjMVEXRKwiCzknVGsE?=
 =?us-ascii?Q?uIlIxvyVo0r90RIDjewXYyDQN2tJNK8GueO/UWicD/JxYc3uGllbPhfpN2l7?=
 =?us-ascii?Q?0eH1o0IiZsNw1A02r3igoVBi5H8158460YB68KpFrCs9vicFp94vwLg1oIIg?=
 =?us-ascii?Q?u4ajJWp1KJLx1hBNdo7sCJ1j0Is6O2KAE5gBLF7I/09VUDLnXyrjhvb+/8Ja?=
 =?us-ascii?Q?W9ZAUo0FIFmk/uaQxZGDgCv4wMNO8FBwRl8hCpEk9OuG/ySw8XrDwnpVVk7N?=
 =?us-ascii?Q?N+JNto/W6HBJTohaLSiX/2dFh1AJH8NZ7ZWd3zURTYUsu+wQk1rFCjn1gPsb?=
 =?us-ascii?Q?dDHKYDneWuUeDOHlh2Ae+u5d+9ICOGL8TIkK/9pm9UGutSyiEy6mJS+665KU?=
 =?us-ascii?Q?mMrXpimjY+cSvjTXEGoMo7w3EI6+H0b6Mb+T+TKOH+G+Q9orZcNayHMKCllZ?=
 =?us-ascii?Q?Osubd/gZz6ne5cHI1Ky2yXMWAnGllL+KQxKmTUofXSwsK80iN8VKtE78fEQj?=
 =?us-ascii?Q?9w1JwX85RiHxmQon+8sFJ0kj4gK/4HGs8+Hh7rtspEDv9wVG9do1VhgVrz6s?=
 =?us-ascii?Q?/5hTNRiLD+9Nt1riR18mXfa35wSNGw5BS/ZJssOtf6juxkgBgqB6v4houuFa?=
 =?us-ascii?Q?MxFHWK8lT7wdHx30CVaNNBZ4Rtm0QgJWcSR2IIYic9zTw8CgC4EoA4PDxoxb?=
 =?us-ascii?Q?V3OPqRsJLJZPJNGSwmFbImePq0gN33pHbO4Q7LX9GWvJZ7AgiAsLOyWMmXU1?=
 =?us-ascii?Q?fMoa7brHh0xuf/1skwA/fzrF4e4/R91Pp14pvfy1dhv446SdJoNkvJepa2YU?=
 =?us-ascii?Q?vS5xvyccDuMZbfEH7Qx9b3oiSVlt9ymDAz2f8pTxxjtYCVQSruredmrPXBz1?=
 =?us-ascii?Q?j8J9IX3VM+gbUGXh7DRtP73RQukIKEbKOKj9rcVByUc3NHqxp+Bu/Z3LwO/c?=
 =?us-ascii?Q?gYfeGlJah3e6YAhVFLQfIM07iQWibeXI6sVlGy0uOdXdQCS8YjUB1BBIgPm9?=
 =?us-ascii?Q?csimznvG8uWtH0Ir59SryrUxCTW9QihRaNihWZGdmTAJr1d/aT+Xb7ijhy9+?=
 =?us-ascii?Q?JG6KR4OCOSIkgxztnvOk7QARNndVDTYYNe5sNXvjTibWR/XQ+tPZZ1NLW2xm?=
 =?us-ascii?Q?2Zgmh8qVvw+FVKXC4Qb2OqnzSml4ZYL+CgUGakj/D4aIM8xG93zrfrjDcJBo?=
 =?us-ascii?Q?r7YYn87U+LFwwUi8n5z3dLuqpRRpSaVhTR7DXvLi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec70e357-7271-4be4-4a86-08dba1f7f551
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 03:37:35.0339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz2FzhdBe4Ta/bpREumAFJTfl/AyGU/EEIWsG/MFiehx/HZC9mUCa8kkdTbLPFKmuQtnx/N2boVneVpT2dZV5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7758
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
Cc: andrzej.hajda@intel.com, alexander.stein@ew.tq-group.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 zyw@rock-chips.com, rfoss@kernel.org, sam@ravnborg.org,
 raphael.gallais-pou@foss.st.com, jernej.skrabec@gmail.com,
 jagan@amarulasolutions.com, linux-imx@nxp.com, conor+dt@kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yannick.fertre@foss.st.com,
 hjc@rock-chips.com, philippe.cornu@foss.st.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to Synopsys DW MIPI DSI host databook, HSTX and LPRX timeout
contention detections are measured in TO_CLK_DIVISION cycles.  However,
the current driver programs magic values to TO_CLK_DIVISION, HSTX_TO_CNT
and LPRX_TO_CNT register fields, which makes timeout error event wrongly
happen for some video modes, at least for the typical 1920x1080p@60 video
mode read from a HDMI monitor driven by ADV7535 DSI to HDMI bridge.
While at it, the current driver doesn't enable interrupt to handle or
complain about the error status, so true error just happens silently
except for display distortions by visual check.

Disable the timeout check by setting those timeout register fields to
zero for now until someone comes along with better computations for the
timeout values.  Although the databook doesn't mention what happens when
they are set to zero, it turns out the false error doesn't happen for
the 1920x1080p@60 video mode at least.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
v2->v3:
* Add Neil's R-b tag from v1.

v1->v2:
* No change.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index c10ca32dff0b..9af97895c243 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -686,7 +686,7 @@ static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
 	 * timeout clock division should be computed with the
 	 * high speed transmission counter timeout and byte lane...
 	 */
-	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) |
+	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(0) |
 		  TX_ESC_CLK_DIVISION(esc_clk_division));
 }
 
@@ -749,7 +749,7 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
 	 * compute high speed transmission counter timeout according
 	 * to the timeout clock division (TO_CLK_DIVISION) and byte lane...
 	 */
-	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(1000) | LPRX_TO_CNT(1000));
+	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(0) | LPRX_TO_CNT(0));
 	/*
 	 * TODO dw drv improvements
 	 * the Bus-Turn-Around Timeout Counter should be computed
-- 
2.37.1

