Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA13C9544D3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6296E10E5E6;
	Fri, 16 Aug 2024 08:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Rc+YgpS4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B33710E5E6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 08:50:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlRLeibnmbpkyCQrbqAq3AIZNVo7o4qBgznNhVq8OmpF32nAi9WmxZwyomip8BYQ9RUY+dj2gA8JpWuJnAzX3hvWs4tu3O1UavplGiFQW3bLgIMXpsWJiDspEH12ENaO18OIEifhqG6WlwJOLEHtMher1hxSTC1xm5Cng9+WO7E+PLyFtT2m5F4TxUXdqXncfs0tVaLtiwkKBsb55mt/QNPAAQbVSxmFX985pb6JlfYsimWDlMu+BHkQeT+2ojA9ABAYAE8w076hl84sfO++SVnbkcQ+YCMDYlqDUTr/c5GdjUtDz3HPc+DE0hxSsH/Lg7B7JpP7kPiCOdyrA7Bklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GDs8K/ztL9g51QZj626cDVZOi9mtkiMfFeqYnL5mWA=;
 b=b/RTSmpSvNXKM833kJ/7D5vKJei8PX20m4o/a74R85YrEoUeWxd/Hu3MByy/u24AlwOCFHC2NeRZg74CJJDTWtODkx9/UWSYF6ty5svlYFvxPL18CBulmnd+9+8w+BH1xRUNWr/EjEG21t8Et7VkdZykuw0NH9cTswNzgXs+psDe12UWRTy+bX31Z5LZE7Idwe2UTDlIYKWkDdJ/yuOMsHcZG7GM40GX/azB5rric+rMUDJdM6ennyJEKawjcRa5L9qdvx2E8/37jhz4XN1r5kSzRbp7aehKUfNxi0fMsV35W9dxcfYvq+kjJWS77aoUNyB6uTlG6O9/65cb+sO9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GDs8K/ztL9g51QZj626cDVZOi9mtkiMfFeqYnL5mWA=;
 b=Rc+YgpS4cRMg06mvKpsjSthUq4aHlduJgJtoBQBSOMQaLRl6Tozp2wKH/j8VXkArWzSkRWAYkjBJP6KsLlS9+k2zr07G+k9eFP6EhzKtLkA+9LkehXf7rhig7M+Mcwdr9k9BSYnIHqE4QU0HIhh7DjRSzC0+Nztm8C7KwK3SQ4h8xJLcHh8bfRYtDDLlbhfsLl6lGYR1nqQOV3Bdl5GnXYPSzGYex6pSFvU9IglD+Un5xuN+pk00c/dYnMULoEXIIwejLqvoxHGvnI1wVA7bDmdu60np1pkPX8jV1BerMjxh5xV7/sA266PF+REIYbOes6gmvnVFkVyXa9GeYUy0Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8278.eurprd04.prod.outlook.com (2603:10a6:20b:3ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 08:50:02 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 08:50:02 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Subject: [PATCH 2/2] drm/panel: simple: Add ON Tat Industrial Company
 KD50G21-40NT-A1 panel
Date: Fri, 16 Aug 2024 16:50:04 +0800
Message-Id: <20240816085004.491494-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816085004.491494-1-victor.liu@nxp.com>
References: <20240816085004.491494-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d301917-a8d6-430f-86c3-08dcbdd06abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NZPXV2gkZJvGwXl24QBiQZtRUbXwwXE/TjtTtcdncQPLUh0twe6UHICXi2aP?=
 =?us-ascii?Q?y7i4+JbHH5q+kZKKkrkUCUHa+alv6qNbDhoW2OA4Xzq8a7kW+FguGEp9fQhU?=
 =?us-ascii?Q?KbqV2CHFbGg/kjiJcD0Nqp0i6cM6kFFBDvUoSOPaGNIsYEC4Ni26WXI/yUZc?=
 =?us-ascii?Q?/w8stGB/7UrLdkEM9Tx3iCQxg8OkR0QGGGeBTJQERJf0hNJP9DqaJd6RyySJ?=
 =?us-ascii?Q?/1RkANGRsU3bTOCu2SxOxSQLly6vT9nxaOv8er4xvU62nJtRG86wkH+uEi6Y?=
 =?us-ascii?Q?xO23R6YDJR8EtbaF74Y6H7q4zaDEoXTjb7694P9W5jwjw5YfxqpvrVJEwZo2?=
 =?us-ascii?Q?PxriYcAjogNGZMnmr0zwMnzzGEqfMdUYk4VcZAUOd+5qt0qwEz2XWzofeToN?=
 =?us-ascii?Q?koTfVpnVvTMLfIZX6hmaCggy3Z9cWDgvoAey7hCMkxd5id2seGYa2p4YB8WM?=
 =?us-ascii?Q?G/ZRcCqHvflAmycpmBoVA69T5aXwJ0XpZRb2RhrEWj+3zojnkOdZ+wSoL+A4?=
 =?us-ascii?Q?Vwf4G9fdVCjYo8GSY4mgmEAP1DlKpQSKHKTsjDDJJhOT5QheBmrOnJBwCENA?=
 =?us-ascii?Q?5dfQydUFXh3x+6ZrOQfexiF6tLd7IC0ieVYcokWEE+SJZ7vDzbTf9SBe5CIR?=
 =?us-ascii?Q?vgJp/rBeBIHvFoNQRCXaeLMEY18Uh9jqXJCoGhTmaXCDUchMYW1Hfg843ZAs?=
 =?us-ascii?Q?Yx9kp/l3i88NxyVnmR5Utj7TOY1ZspnxExZnu5kN9fDMSpyh1r8kpaM9mA8w?=
 =?us-ascii?Q?kr+tsuSnlFin2nH6PAOIO9l1NY6tObwuaAUf/Q+GpUHsQh8btP/0tTGDq9Gl?=
 =?us-ascii?Q?CZekJyG/xUdwxIlWud83JLnhxi4RxT+LoAzG4PYcu4TA4D/KMK+xApHFQ4If?=
 =?us-ascii?Q?emlMi2WrviDHTqRUzstWyN/Ee9ir/6nLHY3RQ7inFzGXzc7Gf6X25Pdb8WxV?=
 =?us-ascii?Q?OhuQsEmKikRqg8dW0E1ifPjWp1sOq/af1VPtuviBcDIHEOoFyC/7UnkZIMRx?=
 =?us-ascii?Q?oPOrflBpJpsZtntpXZx6S69HVh7LR0913XID/I+QDgTfFL4SbUGrakRtsk8z?=
 =?us-ascii?Q?vmul5KDXaGd6LC7OHcfhrBEG2CPEZgZAbQ4UIWztE8u6cmKAD1ZAYbVKQDGX?=
 =?us-ascii?Q?oMFXudCPiFaq92/+LvBPLlNEej6iOqzG97c117qBZZ57JJGk2Uk8YRT1xWXJ?=
 =?us-ascii?Q?LIecTfxcphczrZTmqTQLNAqOnHXUDB+l7+cDHyf9g6lWqTFuSYSm1MKArZEE?=
 =?us-ascii?Q?8bjamw4pVv68LesUgWgeypuYlvDRR4UUYptILO4iyY5YhbLrAKD79l0Ru+6J?=
 =?us-ascii?Q?QIbIcoF7w7wP15vFM7T6Q35TyYj8bXu+/TFXIP6Yyeo8VPbP11hCtUMpncUx?=
 =?us-ascii?Q?U2PT68o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rcvUyVkHrW1xxGUCvHN1zUhDKnF/4Nv+K0DuzqPfEzbz47yW8jzjW33kemgB?=
 =?us-ascii?Q?0cVjlok0z9BSiwrWLY8yVHdVoalh7UxChIk3ajdwYGzFV0/15iPzFnos8WNB?=
 =?us-ascii?Q?iWfdJbA6DmmRvy6fMw4jn4++stKqwXhLRS2+q4OVh/Nvftff9HfHmWI4hGnu?=
 =?us-ascii?Q?oPvrG8GEWAGNWF9RWfc/UbMzfsmdM1SyBoYCOIWWMQWvhqqyXX6ItcEpFTth?=
 =?us-ascii?Q?eviYSRtxvH9/ZeHXKgkxmSpfmMnq8Y6paFrWm1dee4P+CGK6WsmGHEFNFvMO?=
 =?us-ascii?Q?r3wSXQYz4KMJPX6qCv4v3+qHcHK/3HWvfSsO9ooX/mrSYD+1wE1QgrE1g0Wj?=
 =?us-ascii?Q?xe448iRO8RYjShZrkzwcS7Xa05pk8on+nsqiGheZ9OqZtg/iAuSByZvlINm+?=
 =?us-ascii?Q?C/A0ZHuOFr0myuacKErcsvqfkICweTHas8GglJVEkoDuQwstMfUAzQX3c9Z0?=
 =?us-ascii?Q?yTPC0dPi56GKdnV++fGmCwCF2daCG3f7YjCFFFADmE6qjDb4VLPyWds0zoMu?=
 =?us-ascii?Q?SiQsnrc3aibpy4HdLHLE2LpljA0d35yn6vRTGdeN39a+Bon5yNaMCa0IZWwi?=
 =?us-ascii?Q?rlkNWNkEEAduOy12fUnC0meUhDEpUmAMn4Sp2fGCLD1NSS9p1Q+2hislkrbP?=
 =?us-ascii?Q?KcTvjYVtRx/gD9pVqAtiaXa3ucveqDNO8y5FxCv6S2JlDY9eDnuet0feAKFo?=
 =?us-ascii?Q?jWUPAuE3jDwLVBm9lzR7PYdhm2DbMIAn7UbwRleT+zuW/duBnQxcIrp5Kudg?=
 =?us-ascii?Q?+CQFdApkSppAKDYa/zCKK/2bkS72f7LPp2eQiIToKiog+65taNJMwIwMtAhY?=
 =?us-ascii?Q?6zVpWrBjEiN1VsxRz8rves8gMeel85H9yzRZfNwpr4CzNla/FMI4i0nivlXM?=
 =?us-ascii?Q?H2EvJn5K9UqjIKMGnh+6KA+VtcoAUx2w/VCZihCe8CL9ofztvMMc1kcfMEfI?=
 =?us-ascii?Q?nQFqpLDFMJmbeNzs6uXcifzq+QuBdOHpihmp2B2ogT9mpLk5BSjPkEdeKXX5?=
 =?us-ascii?Q?NH12Tg0Smm5Z7MWytOdVbttmyc0sl2R8Fjk9x1XLWQka/JKQF/muLzvgbyvv?=
 =?us-ascii?Q?CwzwpgAT8MP8J6XCCc+qV9VI3BYBp/n8ZL7tLxDwDISQrh4eAw7joRjFE7aO?=
 =?us-ascii?Q?q4e01lLGXk5zcdkl/7VfyrZnvSCGL6c/5iZqi6wN78D5sN4ZBCBuVmng2Bs2?=
 =?us-ascii?Q?LM6r/SzTowfSomySAyr+N6jc0h+HWe8WMAeMSFJhsKEj7A3khMYufgrcL7IT?=
 =?us-ascii?Q?/yzE4PVb5ud/treIN1oUsVvF7NwrlroEKWET9o+ikth/OU5mPMrfr2nYi07T?=
 =?us-ascii?Q?a/gKA/oIg3YeQzBKn5qPLCy5q8ciQKvjoESN2H3HVbILlra3buuMv37bFbEL?=
 =?us-ascii?Q?rSLeveR3/bqoXyri2CgW/dELt7XGh0ObMhgRJ7a+mgMBRDESavDk1u6fL3Mm?=
 =?us-ascii?Q?jS62sWg+7/FLoCwFjSBhguQQExy/1k1rq+kZkSThk5Ye6isESvrkMq8UAVbA?=
 =?us-ascii?Q?yrUKOE9Tq8zhLtp8BMmDdOP115BjLTfJoqsnJf7fdKqjJGwtmB94yKzVJiSp?=
 =?us-ascii?Q?YpbOAVq4M+ZpN7i2Ju/rTfSS8kA+92wwOxIUyurl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d301917-a8d6-430f-86c3-08dcbdd06abf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 08:50:02.4356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuYEPaesqQTsCy+vXYrmbGabgF3BuPjLIa1vS1JD2uxFdnAxUjty7uroJa/NQb+BDDF8vCy2vBrNjXtf4UBJ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8278
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ON Tat Industrial Company KD50G21-40NT-A1 is a 5" WVGA LCD panel with DPI
interface.

The LCD module specification can be found at:
https://cdn-shop.adafruit.com/datasheets/KD50G21-40NT-A1.pdf

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index bf40057c5cf3..89963df80917 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3478,6 +3478,39 @@ static const struct panel_desc olimex_lcd_olinuxino_43ts = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct display_timing ontat_kd50g21_40nt_a1_timing = {
+	.pixelclock = { 30000000, 30000000, 50000000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 1, 40, 255 },
+	.hback_porch = { 1, 40, 87 },
+	.hsync_len = { 1, 48, 87 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 1, 13, 255 },
+	.vback_porch = { 1, 29, 29 },
+	.vsync_len = { 3, 3, 31 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
+};
+
+static const struct panel_desc ontat_kd50g21_40nt_a1 = {
+	.timings = &ontat_kd50g21_40nt_a1_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 108,
+		.height = 65,
+	},
+	.delay = {
+		.prepare = 147,		/* 5 VSDs */
+		.enable = 147,		/* 5 VSDs */
+		.disable = 88,		/* 3 VSDs */
+		.unprepare = 117,	/* 4 VSDs */
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 /*
  * 800x480 CVT. The panel appears to be quite accepting, at least as far as
  * pixel clocks, but this is the timing that was being used in the Adafruit
@@ -4837,6 +4870,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "olimex,lcd-olinuxino-43-ts",
 		.data = &olimex_lcd_olinuxino_43ts,
+	}, {
+		.compatible = "ontat,kd50g21-40nt-a1",
+		.data = &ontat_kd50g21_40nt_a1,
 	}, {
 		.compatible = "ontat,yx700wv03",
 		.data = &ontat_yx700wv03,
-- 
2.34.1

