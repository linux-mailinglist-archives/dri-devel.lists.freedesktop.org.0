Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ED07CD2C8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 05:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA47810E363;
	Wed, 18 Oct 2023 03:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2070.outbound.protection.outlook.com [40.107.6.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6C010E363
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 03:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bv4V3R2YYbww4iM2CnGJVFwCdRyXNeMXL8/mzdjuLqQw1S5UXLut6qE/X37ysGzuh/S1FJw3+7iVxf6vkrjY4WQjkmEfpfx/WRQa8a8WdBc4VEKHBTBUNHET8SAZAU02STw1hzH0QzZg6v93b4t4Jy/eQ/g7farIt+rtyAsQvYKrxnxxwNvtqw/sq2yN50hoCFyRUp1HMhdR/5JEP7J4mOMKUg8Psl36BV6Wk1AqMN9XM+4H5GP6IKqxnXrwgnKCNZ0BqU+WmEG08gah/JOskmw0aDlV1G7CTFWM7E9S6kBMIAVVXa4OBLcrsxBsgzzVz9447/xXpczpi5yv3LY3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdJNJz9rHbiULH7P/zXLw3++ML7Z4vI7lThi51JNY2s=;
 b=a1KmDSVMMv49ZzSRXr+8wXY4QaDuVrodgNBbuCCERlBcxOG80todKQ4/81GgV8BHvGevNsT4vhFZfk+t/sfmX2Y2wKwrynmJcEDsTBOworX/CGroXUT57/WcBBZ0pNBrE7kulwH0lp2lC+GLUaiXkcXuoRMTQTZm99fLagt1fP2UbkszwVoJOHLfQKYEhKgSkogmCge2EPWd5kc0MtvP1uMoTM/LkIP1IkbHNo6rJdyBgwiRQqndHC/hBORCRbcqcA15Wp3tA2YAHp4PTzmNNbrF2h/jdsqbrpWrQeIyUHny3cooOw9+lqUQL7pk6bqrPOFIoUpHfFSurrNEqFMSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdJNJz9rHbiULH7P/zXLw3++ML7Z4vI7lThi51JNY2s=;
 b=HKm5uqjZIAky83JVZk/QZ8oiVIf0BkhWhfN4kRNCdewxQNHs7chrjHEuZ3n1AahXIlvBresb5u9oNgNlnn/DgfljYIyX5aBEblrrP+ybKeQeLQSC5km1s0QwnUKeOxQtZ7ANYkdzlrT/N5QaS1hHfcBXcAlllBF75XCSQOPg7GE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9913.eurprd04.prod.outlook.com (2603:10a6:10:4c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 03:48:51 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 03:48:50 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for
 burst mode
Date: Wed, 18 Oct 2023 11:52:12 +0800
Message-Id: <20231018035212.1778767-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9913:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d3e453-e4b4-4272-7875-08dbcf8d23ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4+tbo0gyifmDTvROT13C16wO3LFDQ9uruRxQyjMrEnQT2L2hGAQfviFaEZ4TEQnFTIVToEQqdZXj4a/Hrzep3qicBiopFYtC/CkWzvGfxc7tK5Fm9wkXRgWWruJaW2GSCQa+d2AAdyCNZjAzIUE/WJrsTsFBclICVTF4DFlR8FbcTq1iG3K2UBpzIsQiwgQ4pWxAKKaXc2RtKwj6BiFW5i2TKuO32WaKc/RpU0uuyqVfJMHcZ2kjeRF3MwxL/pYyrPeuabzAC9/y0S3bvP/TNQhz3SyBHjpkZKb/LIxJZMk3L9JQCcYPnXvTT1akUUqOdMG0RT4T11uVc9bI6T8811IhxP7znpEnS7+27MCsDqb8gskL+VpxUSwgbU+QC6naBXqiCXsCbPqdjYg8ojGUMLqbCosFYEtQdMPmB/bVguRIx+iCAPwgpud/an4Tsj9HyB2bH2axADM7BGU06sgGdyJcUoheW/saWC/WucHFPe9BnwAlOe+F41DNvNhL214EsqxXvQawLkk3gNh1PU7naTeVkjE+eqhxy60UfbNutiswnj5aytgl5ZYLYVm4g+p/psq+4RCSL5LUDKniQJUMQ04hyM/d3DMAB/8HVBPE7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6512007)(36756003)(38350700005)(66476007)(66946007)(6916009)(316002)(66556008)(86362001)(1076003)(38100700002)(52116002)(83380400001)(26005)(6506007)(6486002)(2616005)(6666004)(966005)(66574015)(8676002)(8936002)(2906002)(478600001)(41300700001)(7416002)(5660300002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2EvZVA5MWF5YmE3VTdVUy9DRGdDR3dDMTl3UWlnclRtT2YvNzJFVysrSFBk?=
 =?utf-8?B?UmZpSVEyblc5ai9USVI4TVBjUjRlTTMrQzU0RzI3ZHd6SllhbmZFS0RmMU5X?=
 =?utf-8?B?eDBEUFAzNDJiS0IxNjdTMEhBRUZyT1VNVml1STluRWtzL2FEYk1GNTBLYXpn?=
 =?utf-8?B?NkorbGNIQmZWaWMweGdTMTVOMFFXanhGRFRNdnVEaXhxMlpMN2dJZ2kwZWtn?=
 =?utf-8?B?elNMK2FXZmhkbC94eFplSXcrYnBtZ0d3bnpFSjFhSGtBcURKUzJJZzJVSWM0?=
 =?utf-8?B?d0I1d1V2NFkvVWRmcTRPWEpkVlUxTWVpbGtOWWhUWnBWQ0liL05NOWxJRkZn?=
 =?utf-8?B?aHZyNG1CVERaQnRBS1pSS3FjempPMmZYVUhtbFRGKzVPdFZ3Y1JLaS81bmFZ?=
 =?utf-8?B?YW54V0IrSHZOd05GbFFINS94RUFHK2tIbGVaSXBHWjdDRzQybVJOc2FSckNY?=
 =?utf-8?B?QnBnVm03dndUSU5xRDg0T2l6SVZXU1NaT2s3QjVkdHpOZk8vajd6WWdaM0ZC?=
 =?utf-8?B?VlNjVEYxVmpnMkdiSndJK3pRZWE3VUxzODUzdEZPZmhJVWJPT3VMYm1rTk1T?=
 =?utf-8?B?ZFJzbUpISEtON3BXZ0tFVHo3N3liMUNwRkt3djBjRDFPNGUrbWdoVFlCQmVn?=
 =?utf-8?B?UitsQ1hqQjJ4enZMNEhERnczVTdXSytiMHVoc1U5RHpDNjdHVEJnbk9GQ2o3?=
 =?utf-8?B?Y1hwUTdwRXEzeG1PanVUYlJ1NzlOTFVBUW4zZGJIdjNiSUZIaE5pdGkwdWtB?=
 =?utf-8?B?VFRnM0NwMm9NR1U4NTFoVWRjeXFQUXMwRktNTWh2NGJCRE5FQlV3bjUyR0dm?=
 =?utf-8?B?c2hRSjdjN09kOGNxdlordnFLTjJ4MytjeXdTUzNGRE9za0NZTG1oUWt5Z05E?=
 =?utf-8?B?SCtWZ0E3Njllc0o5WXJtbmROWkxCTVFKRmM4OXAzbHM3Y0dlcTZLc2YyL2tC?=
 =?utf-8?B?d2tkSzdkS2VJWFVqWDIxNDV5UVlkRlkxTEl5dm82NlpDTVZnWnNiek1YK1pw?=
 =?utf-8?B?L2FVbUNRUmJNOGcyQ1k1bkxUMlBVT3ZHSU1EdUNHY2QzNlB4OFhqWDZpS0VY?=
 =?utf-8?B?WGc2Vk5NVTZxQ1cxZEs1bHdUQzJsQzZPR2MxQUl5ZzlGQXlYMXpFRS9NMDFZ?=
 =?utf-8?B?MHZmdFN1T0praVBVdXYwakpiT3c0SDB1eGtVNDFGV0JZZWM5RUFRYnFiSEFu?=
 =?utf-8?B?RU5KT2ZaOXBMaUVTaVpUMnNWQ085R3hZL2FsQ2tiZ21oUU1IT1h6Qlg0MUJ1?=
 =?utf-8?B?ZktEWjdFVmhMSG5BT3J1dGQwV1hlbzJHdU1paEZoc29UOWtNR1JpdWFma3lI?=
 =?utf-8?B?cnpjUUV3MXdKeGZlamVPaFNqekY0cEwwdXlTU2JtTXIxSmhMVUlIUDJUazdS?=
 =?utf-8?B?QTlneFRtckhkcFhzWGVDNzAxc0ZjUys4bzF3Mjh1azYyWHI0bGpkTFJHeWNy?=
 =?utf-8?B?TjEwd2pPNUVRTkdTMkpVc1h0ckdsNDVudDRvRXN6MklDcXdVTVRwQi8rclBi?=
 =?utf-8?B?NlRGMmxxVUp3UERQWi9hbDBKWkVUbW1WRjlWRXU5MG9id0lnYUY2UG1NTTMw?=
 =?utf-8?B?K1dIc0hhUG5JTkxNUTViQ2VOazdBSWlkd2w5bDdpaWYrckxxRnh2dnkzc1A4?=
 =?utf-8?B?QXBSMTUvYlY4a0N5V01lcFArNCtHUHZvK3pMelNlTTd6OUp3K21uSC9KZkp3?=
 =?utf-8?B?YXJxYkZUeGF6SUNlcGxzUnZvMFNSUDhCK3Q3NDc2N0o4NGtoMW9RRHZKMGR4?=
 =?utf-8?B?TFd4NUdmRW80RWVoOWVxWG1ocURucHByWjdUZWp0UmtySmgxbFNvTFRWYTNy?=
 =?utf-8?B?Qkt5cWgxZmw5NzFDS3ZHZCt4WnhtN3JZeFJDVTU1Tm1QbkxlbzlYb1pRcHdL?=
 =?utf-8?B?cVhmekpuOXVySVI2UHFzTEdvaEpyYkNjc3pFeWk3Q1JTaDVHVGlpS3BtRE1s?=
 =?utf-8?B?SzMxdjYxeGlHdTdWUDFhdXVxa1N4MW9HbUtNRUtSeVBlcE9Va1o5VlByYlVK?=
 =?utf-8?B?R0VuMHlaTXMvaGorN29peUhSUTAwc3VWZnNjWVk1NUtYWGhmdWFsNnNWeUVC?=
 =?utf-8?B?ZGRaOWVOdndtM04wSjhTTFdoaHdSNnc3c0ZQaXlpcDFXdm9yWllQQko3R1lX?=
 =?utf-8?Q?dDlfdBxf+GiYNtE7SFpaZ1lCN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d3e453-e4b4-4272-7875-08dbcf8d23ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 03:48:50.7050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulvgIVdpuqci6N/i2vSEQ0yZItp/HDNN1sDDr3XiRsLxrxzFUUapTBaMSdsQHIsLlAc3GluynamOIhNM2Xkgkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9913
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
Cc: mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 tzimmermann@suse.de, jonas@kwiboo.se, yannick.fertre@foss.st.com,
 raphael.gallais-pou@foss.st.com, hjc@rock-chips.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, zyw@rock-chips.com,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support burst mode, vendor drivers set lane_mbps higher than
bandwidth through DPI interface.  So, calculate horizontal component lane
byte clock cycle(lbcc) based on lane_mbps instead of pixel clock rate for
burst mode.

Fixes: ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate lbcc")
Reported-by: Heiko Stübner <heiko@sntech.de>
Closes: https://lore.kernel.org/linux-arm-kernel/5979575.UjTJXf6HLC@diego/T/#u
Tested-by: Heiko Stübner <heiko@sntech.de> # px30 minievb with xinpeng xpp055c272
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 8789eca26188..824fb3c65742 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -774,13 +774,19 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
 	u32 frac, lbcc, minimum_lbcc;
 	int bpp;
 
-	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	if (bpp < 0) {
-		dev_err(dsi->dev, "failed to get bpp\n");
-		return 0;
-	}
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+		/* lbcc based on lane_mbps */
+		lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
+	} else {
+		/* lbcc based on pixel clock rate */
+		bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+		if (bpp < 0) {
+			dev_err(dsi->dev, "failed to get bpp\n");
+			return 0;
+		}
 
-	lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
+		lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
+	}
 
 	frac = lbcc % mode->clock;
 	lbcc = lbcc / mode->clock;
-- 
2.37.1

