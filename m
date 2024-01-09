Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B35A827F9A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE0410E2EE;
	Tue,  9 Jan 2024 07:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2076.outbound.protection.partner.outlook.cn [139.219.17.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5B010E2EE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 07:42:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxVs48NexRbf7EPx3EeWZaKk7g+W8WQ7nDrTRMGZ+l67a8wGc0kr7WEd325oKia+1DJyJ6+uuJ0X35qoS2UR7vsIHJdUSad3Hf8U7E5JkUmeKg3IayNQwfFfBWdgEvBuQ6WCTZaXblPVBt84HtyYtt6t5pnmQoSfLxeE4eSoKnoO6vIaxhaV4snGf606scwQ1db+3GvQClwappoqgs3SXb0a0eJNK0RZxZDWHE/xv7thj6GPhwU6N3ZqnL/Mf7qkI/JOwRE71eAV6rZDenyJVEbgHBz8O6wEDYZFAVjFXZg3PSWPl5Otp87iVAWBZqklQfewcsQI7ujGAFIfNMyknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd+h3p4AbUA9qdJIyEDm4WRbS3xOSPgVlLZ2U4IUW1I=;
 b=Mn7e+hEfVrimfz+4w927C5Wl8avR2y0DUrCuigT3jbXreX0+c+yPvR6p7OVPPICQogQQTojMIvXM6UhIR01S9EYY6mxjnQeSLOyET35geFolrV2oqbyhYUHdY5QJbRGUJnOipYcmv7kDS6PK03M44RtZiqGmDmmm/LoWO54KU84Eb1ltWT1PAt0n5l0O5dN67Wj37KYlqpL6DwqCZknGrSvdLVAF6U0lKlkjIEvoPEzdY7iUlxA8oNjdgy+bjIKWJ7FC1HIMHdUsUeT3I9xtCBc4rWEVdmWsw8N8sg6U7rBy+6MDmWhBhFg8vyx4UkH9951G/f3GmrmZh97M95SRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1133.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Tue, 9 Jan
 2024 07:09:58 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::85fc:7fb9:8b00:dd88]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::85fc:7fb9:8b00:dd88%3])
 with mapi id 15.20.7135.019; Tue, 9 Jan 2024 07:09:58 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] gpu: drm: panel: panel-simple: add new display mode
 for waveshare 7inch touchscreen panel
Date: Tue,  9 Jan 2024 15:09:49 +0800
Message-Id: <20240109070949.23957-3-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::17) To NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1070:EE_|NT0PR01MB1133:EE_
X-MS-Office365-Filtering-Correlation-Id: ff4f1761-cb6a-487b-2d5c-08dc10e1fd95
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJPMMnpt6OEDBriSQhOsdDUFOwh9Cz/3/onDP5iTpvC+gTGv3YON2v9ES63P3Nvzi/Kb9vg16USCPLk6yOqM9YpM9u28S42B3VNcIr7Hvy37Eflt0J6KVtiKYHNCFURHdL08n63K8fn1ajS3bsaaFKjeNSBjvinf86E+4oSWr7LSvCnUw1rtwlGNCDBwHcR0Bxt+YqIbPOHgBdKmKU5KRRe0bqjiLk/wGOXRg3XiXn3Ke/clgXWx7sdsI7zFu3chMajvS72iAnl+gH25GSBxknFH6DThwEsJZtEpwIuzDW6cs+zIxHXSa+DCsiMbxK3tOKoIbD1F4QB78HPl3bxVMfc5O1CSUwjHMPg50njnMmYzwUF4HZ4CTH6ozM5F1MpQvBGSE8uzB8834Si+AMa9Wep9BvZ4jvBFetuvvPHdiu0n+jbkbcOnGJIflwBFRxDtOSr5vjTAZUAhlCDqhF86p1fcwPiZpB8HCsAFxU3WaYtch01J3ueXk16tkSIrmuJV8cqNnDuc16Y7iEN04LzsO0JxSZwXq8olZrjuwAmhKSExFJ3/wrCBnaN+P0HUj1j7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(39830400003)(366004)(346002)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66476007)(66946007)(4326008)(66556008)(8936002)(44832011)(36756003)(26005)(2616005)(6666004)(1076003)(508600001)(8676002)(41320700001)(41300700001)(5660300002)(2906002)(7416002)(52116002)(83380400001)(40180700001)(38350700005)(40160700002)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bEaRoFNRyVk4NBi/I1Vaa8N2o0eY/Cy04nk3en9dQKke75ALzK3IhrGo1KUq?=
 =?us-ascii?Q?wLpMRVjIEcnY6BL8H5FNETarbGim1iIrG9YZ+CTQ9XpByv/T6HXw8yCuZqW1?=
 =?us-ascii?Q?NWc9DFr/QBIptirLTs/+o8ZP7Xrho4ZhrwZ+MgCpIAQKyoePRLlgPVy6vtEh?=
 =?us-ascii?Q?bGhXpTDIOgZ5Ygk4W+6MjPRVRsXhV4TkJztNVqaSMWFWHxphRBv9WFNGWQRX?=
 =?us-ascii?Q?t2C73NOK5RxViaB7QF52BExIezvFYkp+7YIEtOLya3+TLCvwRBzqzFZlrEuW?=
 =?us-ascii?Q?pbq5dzFyvgHgN8offmRHt79L8i9QhJB1WLd2qvZBdM1U8nxY9P/ZDFi/Ptvk?=
 =?us-ascii?Q?HIlw1Pp7odfmWk5F3ky1MSU4P5eh74rHNXMLIsyfKvs1A8A5UWTiTadrltuL?=
 =?us-ascii?Q?k0aXywKFAq+XVThGTtlxzpAeox2VEg5FPKHSH7+69Ywe8fV/uFPfobQAPJYO?=
 =?us-ascii?Q?milwgV0qmc1eIjpg1nq8IOTy90Zb1C8oQINt3AYf5NYhXNfGxBX3KvDWyqAp?=
 =?us-ascii?Q?mOojdK1rNu2aprdZT9YT7S69upbMcUDMka7je2cIF0FcoiQMTXVr9pFp+5XL?=
 =?us-ascii?Q?q/lL24vZbd7EbzeLSmvKwIbj3bwMF35BdeUmeFeR7ne54GeqJPEOqToOiCNi?=
 =?us-ascii?Q?CV+YciWk7qoljzZXpYh/DGNphNzPj91SWJD7yXkxXa/m/AX5FCaFqjZoY9A8?=
 =?us-ascii?Q?Y1+Az6VfSlMEXgDmppDwXmmK+6a2CumvfwYG3JL2eFjY+UcjPPfoqQLIVWAv?=
 =?us-ascii?Q?L0XwQ8x/1p1oy/fez3TW5jvWHO01HzK3Z9KmQxOzyQRtzJSvldccTvpuonPS?=
 =?us-ascii?Q?WsckpG3Dehr+F/rzYpS7SeBzE9qI+AnzHLjUa1CZPqlWfd/4JsDi0bsq4GWz?=
 =?us-ascii?Q?Zc2eiDoSoLM2BD6x+xH269JSYNTwgNwbNiZPNoLvapMGdM2Gzl60bunKTmwJ?=
 =?us-ascii?Q?GzS046XfxiGd4Zlw4sq7eyHrLocqmYz3iGxMNt44tHLS8a9FP1kBiekuRVgj?=
 =?us-ascii?Q?QUWwLnu2oCuHbt+YtmGvNFg4DEWw1JuYxFKeNpMkyEdaDt1SFWNu2YqbJRRx?=
 =?us-ascii?Q?J4lK93X+JHLtaKQSyFVT02/rz0JBllHgdeavGknwcPBCrUilpO8DkIa/Xt+w?=
 =?us-ascii?Q?29ut94wcqUDCvzQ6B04q7Jpfla8rVpOzXhN/R1AbWe5ZBBQUBteGrVBzC8Oz?=
 =?us-ascii?Q?xrKogSK05rZKmrfhso+b8UAN9nMenGVsotuRgamQOLoWoTPno+b96AfCohuw?=
 =?us-ascii?Q?tXubGOzshpQ3x8v+urcMJAyexkWdAp8m0FVOd4bsQQ7m9XU4s/TiIYM6rzhW?=
 =?us-ascii?Q?TbfJlWsR6tfvnUu/+466u0kyl1KvW2K1Wnxh2aojw1qw3JEjHWifswXyku6J?=
 =?us-ascii?Q?52jZWJx875st8VrdcxkQyE1wQ2k0X2Us58iMuDCgq65IdfPwOmyVrA9LrfsN?=
 =?us-ascii?Q?ERqwPyZDppKOrHOdDHiTMSU7ixYKXavt72j21QEgicy08JvJRAePlmpj3SBf?=
 =?us-ascii?Q?i9hklUb40qywQdJJ2o5JMPiWcFEuZN6DMAbdXcy76fufcb/DV9fsGFyj6UZq?=
 =?us-ascii?Q?iHgpNd2imvBRH1RfnhI7d0zP9E5zYp7l1OHXyxyO9M/z4FAiyktWtbxfIZz+?=
 =?us-ascii?Q?Ry+ugPCnFI38ae7wJLL2wf0=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff4f1761-cb6a-487b-2d5c-08dc10e1fd95
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:09:58.8763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/57sZTqDxPW3GyM9eN6T12L5wqF0Gr7t+nK5a7f9jkbRot2HBFv78Y2FD3s6+G66wwnydhclTL1PB6875DOb/DuZQ1wUbs3ZzsV7uU8NFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1133
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, keith.zhao@starfivetech.com,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org,
 dave.stevenson@raspberrypi.com, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, jack.zhu@starfivetech.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, wahrenst@gmx.net, shengyang.chen@starfivetech.com,
 quic_jesszhan@quicinc.com, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The waveshare 7" 800x480 panel is a clone of Raspberry Pi 7" 800x480 panel
It also uses a Toshiba TC358762 DSI to DPI bridge chip but it needs different
timing from Raspberry Pi panel. Add new timing for it.

Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9367a4572dcf..e0896873ea33 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -4110,6 +4110,31 @@ static const struct panel_desc vl050_8048nt_c01 = {
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
 };
 
+static const struct drm_display_mode waveshare_7inch_mode = {
+	.clock = 29700000 / 1000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 90,
+	.hsync_end = 800 + 90 + 5,
+	.htotal = 800 + 90 + 5 + 5,
+	.vdisplay = 480,
+	.vsync_start = 480 + 60,
+	.vsync_end = 480 + 60 + 5,
+	.vtotal = 480 + 60 + 5 + 5,
+	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc waveshare_7inch = {
+	.modes = &waveshare_7inch_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DSI,
+};
+
 static const struct drm_display_mode winstar_wf35ltiacd_mode = {
 	.clock = 6410,
 	.hdisplay = 320,
@@ -4592,6 +4617,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "vxt,vl050-8048nt-c01",
 		.data = &vl050_8048nt_c01,
+	}, {
+		.compatible = "waveshare,7inch-touchscreen",
+		.data = &waveshare_7inch,
 	}, {
 		.compatible = "winstar,wf35ltiacd",
 		.data = &winstar_wf35ltiacd,
-- 
2.17.1

