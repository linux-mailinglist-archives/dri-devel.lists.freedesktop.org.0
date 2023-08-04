Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4DF7700B4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76CFA10E6F4;
	Fri,  4 Aug 2023 13:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2052.outbound.protection.outlook.com [40.107.247.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CFB10E0B9
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIJBGjJ6fvrZlrxYk+rx8//0rJSQRQu0blypwbcBaA4Q5H72iGar6aacPYAf6IkhZz3AjvS4vU2laTKj+NUkva/MpD5RrV6p0zxzXCUBSh/aS4QCcoNRJHVbDaZ/2Fu4fw2/YeQjAFoq1rv5Xjfjf0Dp+CBsXS/2rED7UJdmnbAi8k1D3mihFyGqYpq2bwAZr99WZ6gP3EgZkhhZzHu9YPW8CsXQgjIvlw8fSjKbZ4geH7ZgTLkPMSPLRgpFY4FMP3rEwLF2KpGl+2a9lbWO5/DSCu8NGbPoQQyVp1Ix8cRS6lT0XFddIDx9UTsU6jM8fKUfBdkd7DEd85i34AVgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac5f6Oxahs92G9BhJ5ffEeT3JoNdmuQaXl2k1ppr2BE=;
 b=oMgiqd+jtxkGA6b5pmatc/xN0DLGA8ZXUTH6HgJsM6T0V48+iBH4Q4q+1zP6O9cdhmcYfZtG8kRvYn7PCeBwAq7RqHPPslZHcnbLuItW/kXWPMyGFMCmD+1Tys0KqQuIcAnYkN1ia9rvjrEzy3Z/jeTGm5KqDO3X70mpxlsvUiFg3n+HsyySNB1C82s+xUa4ROjo7EgpzPkCbHj7sPQ3QVq4eErvNLBAm1Mr7XtSUVPVvR9XYZJ6B2YuEcn591WOhPrQIWVXOC+gSNRICmgKedXIlVDl0iNxjnkpf1AqY9kX5OggG64JBGiB8O9w1KYIIyusEpODQ5ZJhKfzi0NgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac5f6Oxahs92G9BhJ5ffEeT3JoNdmuQaXl2k1ppr2BE=;
 b=I1CdbpaGDTObP8QAZYz311fqZvgNT87qQmg7hFXHqRmcO5wDrhT8x06LZ4oavMNjDCUvpGaDnF3oNR+cIj9/yPsbA+bKLn3WPcX/gvj2/96yWiQLUly6B5DaQrbeImuR7V/iFSR3YGt27GqrskrCBZzjUadXCZq1Md/Qpbkj+98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AM0PR08MB5348.eurprd08.prod.outlook.com (2603:10a6:208:189::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 13:02:43 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 13:02:43 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Fri, 04 Aug 2023 15:02:34 +0200
Subject: [PATCH v2 3/4] drm/panel: sitronix-st7789v: add support for
 partial mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-lcd-panel-v2-3-2485ca07b49d@wolfvision.net>
References: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
In-Reply-To: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691154158; l=3358;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=ERJqwsd6TIo7l2Xda5AeUy5M5qXLm/Xs9Pw5gkTdYyM=;
 b=BMpuow4bAQ075j/GfP1eaSmmbD/fciXGPyZ2qc5mqLHkxj2BJ6IffNKcp7OnJU0q9t6FaGqMP
 jdiCQDVWOaiD2+veOQq49+EbY4jJtkjUsRDZbFt/FhgSNRFsJsdsZ91
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::36) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AM0PR08MB5348:EE_
X-MS-Office365-Filtering-Correlation-Id: ffea3589-37f0-4ade-7056-08db94eb170f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MMfnHwBZIMh/X1/zt6e0J314nRIFz5FMgXiGQU/LV92RjVeTNy8lJCOzt2Cj3PRjdeUKajF4hShR8ExJ72M6oT7z1Eyl1FBEObr4EH0IF8rALZ2heCKWtlbW3FAUW244Hd6DYqyVgkU4qeyboZd+Ag9eLj8BBKENDq5Vbu9PCJEMVCbb0YFo9DR/YE2Mj+lFKVmsJ9pPnWuDRAwLAxu3DxmI+LJ95uzzQmtgDAYhNfJ6VDXeetriCHVK/tIQjSaM9vs3xr/5zjtrE4A6ukedDjusvTINmaErRF1VARe3T+zfdU2fNXFLCu6khCWDpgF5zaq5CowB2HW9tXr7NuAutrAxDg8MNKFlowwZc8UmMeKc7Q9iB4C4R+KrtrZVESySyPsvcsWyYA00xwwValR1qB/PFiARwsAkls1mB/KrhNE2O349gyeQGwOqNl7fA+2uz4VT40vz25AR69OZ3t9+CwQnZ+5mdS+CIc0QKAApSBljFfcQK7BcTFGAFaKMxcW9udZaU3JO4rgo+mkvS0gvJfH8PCs/MvxEi3ijfPxTL/1fxKJXtvqC+VC+SuytEiuZ79cGh18DBGOFD24Eb0kW8OC2uwriCIgwLXM2ccdWO0ViPPyHrXItVVvbgOEgtNhhlrCLOmh8La2sHrIXjKonCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(366004)(376002)(346002)(39840400004)(451199021)(186006)(1800799003)(6486002)(52116002)(6666004)(6512007)(86362001)(26005)(6506007)(107886003)(36756003)(2616005)(83380400001)(38100700002)(921005)(38350700002)(66556008)(66476007)(66946007)(4326008)(2906002)(316002)(6636002)(5660300002)(7416002)(44832011)(41300700001)(8936002)(8676002)(478600001)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1RwOENSN1Z5UWlaZUtWWFVDclhhKzFjQ0ZJcTRqZ1hPUVFaZTUvT0hONkNu?=
 =?utf-8?B?N05vUXVpTmczcUlqaml4bllUQzNLdE00VEkza0RWbm0vSlhCRVlMZmNWdXFT?=
 =?utf-8?B?OU1waVdXVThKSDJpc2RNY0diZXI2TTJYdnRqRmtIRjhOVjJBTjFiYkVQRld1?=
 =?utf-8?B?RzBkaUdtSE0rU2l1Z2hnZy9EQUZyNG1CckJjNmU3TGtoTGg2NElkRk9zY3ZZ?=
 =?utf-8?B?TVY1L0x3NDdad1hJd21kT0dKYTBrQUYxREcwY3h4MTRlU0ZVb214S1g2azk3?=
 =?utf-8?B?UXZrSTI0eGQ5OW1mWmFsM3A5UWxLVmllbEMxaGFUcnd0NmU2QjlZUFBGcVU3?=
 =?utf-8?B?Qzlld1JRZ21lMjF4M2ErVURKTGY1NkZiRFU3Vkc2MGpENFVMMHRYTEFpZHhI?=
 =?utf-8?B?UDUwL29PNXhtU0tqYUtSMUZJa0RtdldhTVFKcllVc1cveWJjOTJxNFQwRElB?=
 =?utf-8?B?cVlIUS9GL1NyUzl1VUNvZVBSZW1teHhRVW5pQjVVSHZ1VG1rc1JidGhncnRw?=
 =?utf-8?B?K0xBOHRpbEgyK0tpMmZiR0p6TE9vcjFZRVFWSklEc3d3SmZLL00zSGJVNFFK?=
 =?utf-8?B?anhYWWFndHZOU3d4eWtpS29VaHlxSm1vYkpiVXljUzNvczhOb09VWkdCNUxo?=
 =?utf-8?B?endtZXpRQi85MVprdm1MZVJVTnVnb2dxREY5SUpRb1p0SFJmcDk0bEJTaWZh?=
 =?utf-8?B?Q0pRTzhYZ0NmeVowam9hUzZvaVkwbHlDalQwVGRGanMzRzdnTVppRFU4Rity?=
 =?utf-8?B?ZHJGNE5QWTN3SEwzNkJVR0lJOHpNTnc3L2l3ZEFOdy9OZm14cm13NmZKTWpi?=
 =?utf-8?B?bklCUXJ5TWc3ajlSQmMrY1ZWenBhazZvbVhNTWZNaVpVZXQxb1JzSXpFSE1S?=
 =?utf-8?B?M085c1dQUmpEVDBuUURrdjFKUnIzWUJXVzZSZ0tIaDRNU1RlTnlBM3dhWGNj?=
 =?utf-8?B?ZTJ2YzJMa1N1ZDRMK05pVzNNSCtJMVA2YUtYUmQvVDh4eStsKzZJOEdFWVlN?=
 =?utf-8?B?Q0hUT0ZxU0NFNW5PYlpRMnJRV0VWRG1hWThnRURhY0dPblA4amYwdHhveVNr?=
 =?utf-8?B?TXRBTGhDUUtWMU9hRmhXZGdxMUtXZytNUGluT1dDU2JxeWlSbmJTSVdoM05Z?=
 =?utf-8?B?bUhDVGk1Ryt2THQyUWNOd0J3SjRQZ2xLZDdLYzYwOUhUaSs5b0kwaVowOURp?=
 =?utf-8?B?dmlqV0RyVGZVSjJ1SklvK1owOVRvT2xRamZOM1BpMjVybDVYWGVlV2dLd2pX?=
 =?utf-8?B?SkJuRWF1UkMwUGlsVTVUREFWMUwxQzhaMVk5d21zdDlnblh3VUdua2t0aWhD?=
 =?utf-8?B?elNrODZZSXVJaG9NMEhQZlBZSUVhNTU0ZmZQTVNBaVRwRXFmTVBsaXZyV3Q0?=
 =?utf-8?B?aU9rUUM2RlZiVE9VNi9VcHdxeHc3NFhyYjdqVDVGV2FQRmxCaWYwZUg4V2NF?=
 =?utf-8?B?UHd4VHhXYWdQVnhTRUVhTEtwREhiczFCeUgyNDlwNTRndVRrSndqWHpWV3BR?=
 =?utf-8?B?TXEwb0lQOXVDYXRGZWYwUkxac3d2T3Vsb1NpNDZlUU9DaU9uV2VDTzM5V0Vr?=
 =?utf-8?B?UURWTFZRb1RGZzJaR05zU3JlWTZQK1pGSmUwT3lKYXpHT0JIT09seDQrbVQw?=
 =?utf-8?B?RXpxWGVuRzdwZ3FCOSs5U1BOQTBnWVFyM3hXRStWakdPUjU1UitUcFhMbWdx?=
 =?utf-8?B?VVJZL0FGc2NWUUdWMURDNXptaHRheXdGNldjOWxLdUZuV0ljTUhZcGIxUllu?=
 =?utf-8?B?VkQxOEdsbGpMeitNTEFpZytlVnhJc3hXZ20wdnh5MkVEbTlPTHI1WXhmd2ln?=
 =?utf-8?B?YjVmdjBQRlM4U1dJekc1L253eWNNZzhGSkhZSHZFY3hWQ1NhNmZIcEgrMnda?=
 =?utf-8?B?dlBNNi9kaXlyaThYb2d6aytOakh6d1FBVnpOTkM4aXArMzc5d1FUQ1RCZkE3?=
 =?utf-8?B?bzQ5K2VDZ3N1MWlobTcrcFQvaTNEMng4MFBkSkVuNlg0N2wrQVErTDNkNGpr?=
 =?utf-8?B?ak9UL3FYWFY5bXFvMEFyR1JPeFlOTTFBN1NXNXRlNndyeitXOUJ3WnQ3VERs?=
 =?utf-8?B?MUsrWmwrQXowOW4xRVI5VjhSbE1QbmdaaXhsVlVyZ09DMnpCNmZiZi9OS1Rs?=
 =?utf-8?B?VFhPZVhZTE1kRUJIS0NNa1pTU2hLMEh4ckFhdDQ4cmI4ZENmRndaVTduUjNI?=
 =?utf-8?B?b0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ffea3589-37f0-4ade-7056-08db94eb170f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:02:42.9213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0MBVvs/xHNvQ4ib5vCqPsK3y2rbHmqBQBT0JIJOdV9meKvG/j+an2tNQ1XvYe3tOYXJXzZe/Uz1+lp4VgP3bUWdR9kXthfpVisCJcXESnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5348
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
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 43 ++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 0ded72ed2fcd..ebc9a3bd6db3 100644
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
@@ -345,9 +348,14 @@ static enum drm_panel_orientation st7789v_get_orientation(struct drm_panel *p)
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
@@ -487,6 +495,37 @@ static int st7789v_prepare(struct drm_panel *panel)
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
+		/* Caution: if userspace ever pushes a mode different from the
+		 * expected one (i.e., the one advertised by get_modes), we'll
+		 * add margins.
+		 */
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
@@ -494,7 +533,7 @@ static int st7789v_prepare(struct drm_panel *panel)
 					     ST7789V_RAMCTRL_MAGIC));
 
 	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RGBCTRL_CMD));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_WO |
+	ST7789V_TEST(ret, st7789v_write_data(ctx, mode |
 					     ST7789V_RGBCTRL_RCM(2) |
 					     polarity));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));

-- 
2.37.2

