Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561B7580F2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E4610E36C;
	Tue, 18 Jul 2023 15:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A7510E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:31:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3d08Dsri7bOk3yeHQBb1oPUgieo67JLCUBRaqkkounNBYruQd1SCP6eyRrZVT2BdM4zlOt6+0yCR3FCWZJ/z1PeNjLLdvuEXnqr7GTHJUX09sP1g8LdIsdcfmaLHWc2YcRht/+m1tUUCwjUcLWRnpQnRs+cEDFeLwVn/ZLldUYK5M0xmwwurtXTfrdzAbMMrZvv2QiPfN6WBpeN6xse17CmnvTHvM4uvgllBnfPrE9eoM7Oiuz4DPUafsmALTpR1TSHI+tBeDUiW1pncCv7PKw1J9QkXsn7u4R/apg6+Ja4uIL9lhdYrPiCEEno10e/lUkrt+3jdfaNlfNRwUnDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bahtR5u3eXvX7PUqZt+TFypJQJ9zUX6zk+Qjn5hZJqA=;
 b=f4GcwWyXjq3eejvlFqLcUt67ujn1KQB2HTVL4hiSZvyCZfHcSn/JUlcEEoJVCbfnWQt8slw0dzX64xyNreUN///R0XP9HwBWmbk6lJzoU2zedTkQxOaK2iu4KIdymxqiF1UJz8W2pFj0CdIpg7qWZhdRZvukyFDpuj538tYKbzxuYtXiuXiJ64+D165Pv9oGY7GRBEQrW98ss6L2OohihHG6QoFITr2TF+OTHF0WqyzLD8TV/lFqcp1tRhNllRzY2VygDI3GkPtCxaIOMFzdmGln/UiR85rGgAZS/KxtvSKnosnW0VJguwhEw2DFHEciFVEUOykatKF+qDRpZWxdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bahtR5u3eXvX7PUqZt+TFypJQJ9zUX6zk+Qjn5hZJqA=;
 b=fpAQ8Df01H0z1pv29U4UcISprs6+8zqkRFRwXftT9IT/cJe8+LVY2RLoc1TihPAQaky64GbFUshF/9Odj1bANaHC0KEn9tx/Dn8H7sjdrEZkcOl52xTk0Q38Y2Xlls6p5AgKjpaOZITfryVmlniZ+CzmnlcGh+Jp0hUJUcqsOm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU2PR08MB10201.eurprd08.prod.outlook.com (2603:10a6:10:496::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:31:56 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:31:56 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 18 Jul 2023 17:31:52 +0200
Subject: [PATCH 3/4] drm/panel: sitronix-st7789v: add support for partial mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-lcd-panel-v1-3-e9a85d5374fd@wolfvision.net>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
In-Reply-To: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689694312; l=3168;
 i=michael.riesch@wolfvision.net; s=20230406; h=from:subject:message-id;
 bh=jeJJ+u4OpfXsl48pQ7Q1EFWjMOtdcHSSY9AikfRBA2c=;
 b=knE3W7nh8qLU99h6O3VwPeWN9JwfRa5ph4S01oDDKG8Z/dGP/J2qc2GhE3OSG2D016/1huSXy
 HC7dMmglbyQCByFB+UnQdTGX1qiPaGPSYjGGn9faqc+FhteFiWOrNB7
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=G03kuYHL670EcdsWaNfVA7KnHWmkSpj98XziQm/hjbk=
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU2PR08MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f2a0475-97d0-40ac-2246-08db87a41e9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t9yjwTodAoQGx7mUOA0MWGcdmxEEF6haZGCBmB+2dtsv10J2Trd3imkFCJ07xe6150lZ41C0kOiuKwFYnWbQ8m/4/sCDQgRfjXX2VYe9c6Ppra2pF6kRfsOHfeUN3N0fw+il3KFZk8SfoPtVB4LNmgyTDYUGzslYPDGSbo5IbBiSfwNFwAqicDUxJ5vRSDYlZR+x01NUAGMQ+gHmqAZdry9IYG5saukLb7oIocJ1Dp6Pt7f0Q5m2LRKx7XF9PFFtwx/jpDcxCi62B73hvgeUJ+eoebLuqrMJTMFfHn/R1ipJE/tNKICCqVJnzH4pLaYyd2YvpWrmM0e0zI6y+F4svZ8tBEafrN0f7beGV771oA6gjGbgubhZEwGOP+X+OI7bOWb/hRalU0exkKPw7ewBxd37Mx97WNRJqatJYdRn1qSNtY3utvlV1oiIdgeXfg6eEaCnc01Ci84dcBWCcOwFZtILs2YVya5HGR02wKVs2aXXNO1vPI/jdg+7h8C0lKQXrIRdg3B01voYD4LIwhMCGNE/UBfJQbbS5WZHqD+laxt2aG3u/XS62KHwEPEKq/aWIv3rYSVoy9CyHngfNCzadAVgFhfRdecCdKBD/U8m6r9OAFi3LBfztiNVJ8i2IpUn/ANlmlivKEQ58Csy2+3YDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(451199021)(6486002)(107886003)(52116002)(26005)(6506007)(6512007)(38350700002)(2616005)(83380400001)(86362001)(38100700002)(921005)(186003)(36756003)(8676002)(8936002)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(6636002)(316002)(66556008)(66946007)(66476007)(44832011)(110136005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9aSUExbmVQMk9oZ3JQRmhaTkNsQ25pRmNPYnVrVm16UmdMK2pXbGFBTVFi?=
 =?utf-8?B?WHlCY3VoeE95bzFPRXJzUVBMR25qNXNTMDg3UmpKVTJrVUk4bGNyN1c0eW00?=
 =?utf-8?B?dVRiMldxMWtERm9sQi93TFh1S0szYjJoN2w4U3BDL0txaEhjOHpwKzZBdEpG?=
 =?utf-8?B?LzhCVkp6ZmMrOElEL2x0ekZPYmllc0R0L0c3R2dzTmkxU2VXY0tjb0xjTEFS?=
 =?utf-8?B?ZTVXd1ZsY1JKbGU5MkFBMEFGYmgvWFVqVXUvZnV2UmcwNGV2OXVNYVdseHV6?=
 =?utf-8?B?NUdqa2ZjUEFOeEdpMGhya20wdHoxV1VQYVJUOUxRKzBqbGZ2ODJmclNCZXNu?=
 =?utf-8?B?VG4xbnhzT2w0Q3h4cHRveitvOGlqVCs3U3pDc3ZtS2tTZ0ZGazJZU00rb0dT?=
 =?utf-8?B?MjBoQjd6TmpXaXFWWE1pWTFRRWcrOFhGVDJ5Y3R5VVJrSFpkOGpEcFhMd3Va?=
 =?utf-8?B?MmoyelJBRnd1M251SWU1SzlVRkw1OFNHaSt2RFcvN01ROGVEd2JFamN2WDB0?=
 =?utf-8?B?MExPbDA0aWgzNHZoU29waXJMRDdrRVdpaWR6UWdxMU5ublBnUDNMc1hOdGMy?=
 =?utf-8?B?L2RLU29JNDQ2NUhHWXVlYVZNTU1WU3p3ZG5jWC9HWllwc3dJa2hCR2xnemF0?=
 =?utf-8?B?THpRV0pMbzNsUGlkQ2xGWGNoeEdZUmJ3Njhlem8xNEN5aHg5ZTRtd2lPNUdl?=
 =?utf-8?B?RTNqSzZzR213VlMxWkxmVk5PMjhUbnlpUlFqVzV5eEtOalhnREMxOERwWHhh?=
 =?utf-8?B?cDRnOUdsZzlZdll2WGpJeHVaZTJ2aHh2MlBwelVLWmdHbURYeWxpaFFIbTN2?=
 =?utf-8?B?K3ZTckhPYkhWUlpZZnRaaVpvYndZM0pzUG5wNTZYQXAyNUc0OEtTUVM0ZlFI?=
 =?utf-8?B?NDlnN1YxUGJ2dHA4RU1mTWNaOHd1Mk1YSTJjdS95Y2xlUU5XMlhBUHRMNmJC?=
 =?utf-8?B?VHRqRWNXelJiaWZCZEhnUVB3Y211bk81cGJDM2V4aTVRUktidjVFV0RKWGZ1?=
 =?utf-8?B?M0JXcllKcEk0elhRNW5lZWxDZXVpbkQ2clVNV29aYVV0M3FuekhSQUtpdyth?=
 =?utf-8?B?Uk5tYzRsOEJ5VVlmbmJ0MmNzZWdTYWg1cmxKTXFLRWk3RW4zTTNqUU54VHQz?=
 =?utf-8?B?MHprTjlxNWNxS1ZQQWNET2RySVJRZXFmOHp5cXRHb3hJeGFPVU92UkxOZzhS?=
 =?utf-8?B?VGRDNTFQRDdoazBRSk9UNnNBeEdiQ0xCM1RsRzZkclBXc3MxVExoRzlSakhJ?=
 =?utf-8?B?RngwMzBBZlBOVnRzL1BtQTVYdnhIdHV3R1FoNzBiallncUJWaW1FNnZrWFZE?=
 =?utf-8?B?ZHNWN3IzR1Axa3NTWGI2dVZjN1pXb2tDcGlRTHBQdGRvT2RBZ2twTzlSTjFX?=
 =?utf-8?B?dWdRMTEvTStIbGxKVFArYUFPNEJJNHRUdFFSTjJBdzNSNFc0RXR5N0xLUklp?=
 =?utf-8?B?UDI5aU9CWXVSc3grenB3RGlGWWRqMnpGUFl4eDJ4ZFJJaVJzNE05TzAxVWF2?=
 =?utf-8?B?L29wTSttclprTWtOSG00cFdWcTBHWnVnL0Z0M2ZRY3ZLb2tyY05OTUlNdkN6?=
 =?utf-8?B?ZkxzNlNkVktlb3ZqQjUvTnFHeENlUUtnSnlLZlV5WFNIZkkrR1VmRUNJREl5?=
 =?utf-8?B?dHJldUtGV1BqQldUQUF5NDk0M2dUNEVDYVBkdWtiWXkxRjNGeXIya1llandn?=
 =?utf-8?B?VmVXcHNKUm9nR0hyVUhJamF3ZU9pS0VzMURxMEV0a3NHUXM1OFc2Qyt3NlVq?=
 =?utf-8?B?SUgzWGplUWJoU0l1SFNMSDBlYnFvcFdoOWdmNTdxcTBvYlppd1p2a1dRVDRP?=
 =?utf-8?B?WUUvbzVkUFViR0xUb0RjWnBQNGcrRGg2US9YVHhqRTkrNURnWGRiMlpWY3ht?=
 =?utf-8?B?eUcvWEVPQldwbGdkZFRtZVhFZnZBZlVnWUYrdWpReEQxa1BWb1VPTDlKeTRK?=
 =?utf-8?B?aTM3a3BGbmgyQVgwamZVTVlhL3BlbnRxeXNVTkp3S3RxdXRqcG4rMGlKcUVQ?=
 =?utf-8?B?MW1Sc1dxaHRRbGhoREx4YU5sRU0vZzlYR1R2UlVrUFdibDdCQTA1UVhqSTdv?=
 =?utf-8?B?TUR6ZzllL1A4TThBWmJBenlqc3U4czF2WjBlTGg2eU5ERVB6NnVYdEwrMnFn?=
 =?utf-8?B?cEV0aWhnZ1JwYjNIaG5EbUlHandzWmREWktycFFNNUpHOElsSUQ3MytrZ0tr?=
 =?utf-8?B?U3c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f2a0475-97d0-40ac-2246-08db87a41e9b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:31:56.1902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dC8lpJQzRT6+atZm38LmsJEpK1Gw7Wvr3CrN6FVGxZq/x1Q07NlxSmXnkrLIMCn4c3pfVLICqg2UxbemBCJElZKJmgzVb3WETzwyGdPlBMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ST7789V controller features support for the partial mode. Here,
the area to be displayed can be restricted in one direction (by default,
in vertical direction). This is useful for panels that are partially
occluded by design. Add support for the partial mode.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 38 ++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index d16d17f21d92..729d8d7dbf7f 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -118,6 +118,9 @@ struct st7789_panel_info {
 	u32 bus_format;
 	u32 bus_flags;
 	bool invert_mode;
+	bool partial_mode;
+	u16 partial_start;
+	u16 partial_end;
 };
 
 struct st7789v {
@@ -330,9 +333,14 @@ static int st7789v_get_modes(struct drm_panel *panel,
 static int st7789v_prepare(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
-	u8 pixel_fmt, polarity;
+	u8 mode, pixel_fmt, polarity;
 	int ret;
 
+	if (!ctx->info->partial_mode)
+		mode = ST7789V_RGBCTRL_WO;
+	else
+		mode = 0;
+
 	switch (ctx->info->bus_format) {
 	case MEDIA_BUS_FMT_RGB666_1X18:
 		pixel_fmt = MIPI_DCS_PIXEL_FMT_18BIT;
@@ -472,6 +480,32 @@ static int st7789v_prepare(struct drm_panel *panel)
 						MIPI_DCS_EXIT_INVERT_MODE));
 	}
 
+	if (ctx->info->partial_mode) {
+		u8 area_data[4] = {
+			(ctx->info->partial_start >> 8) & 0xff,
+			(ctx->info->partial_start >> 0) & 0xff,
+			((ctx->info->partial_end - 1) >> 8) & 0xff,
+			((ctx->info->partial_end - 1) >> 0) & 0xff,
+		};
+
+		ST7789V_TEST(ret, st7789v_write_command(
+					  ctx, MIPI_DCS_ENTER_PARTIAL_MODE));
+
+		ST7789V_TEST(ret, st7789v_write_command(
+					  ctx, MIPI_DCS_SET_PAGE_ADDRESS));
+		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[0]));
+		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[1]));
+		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[2]));
+		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[3]));
+
+		ST7789V_TEST(ret, st7789v_write_command(
+					  ctx, MIPI_DCS_SET_PARTIAL_ROWS));
+		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[0]));
+		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[1]));
+		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[2]));
+		ST7789V_TEST(ret, st7789v_write_data(ctx, area_data[3]));
+	}
+
 	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RAMCTRL_CMD));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_DM_RGB |
 					     ST7789V_RAMCTRL_RM_RGB));
@@ -479,7 +513,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 					     ST7789V_RAMCTRL_MAGIC));
 
 	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RGBCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_WO |
+	ST7789V_TEST(ret, st7789v_write_data(ctx, mode |
 					     ST7789V_RGBCTRL_RCM(2) |
 					     polarity));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));

-- 
2.30.2

