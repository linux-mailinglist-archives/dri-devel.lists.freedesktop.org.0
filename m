Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEAE811B97
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 18:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CB710E7FF;
	Wed, 13 Dec 2023 17:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2074.outbound.protection.outlook.com [40.107.6.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7B010E2CD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:54:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Exbk2sOsk5W5oqtwBswse+nXBNTll92aEd2AVjdK4cootEgUgbzlCvjlZTbSsywL2/MaTnR7UlnYPSn9tY+AyxrPzUh82h/8vV9NTA4ldRyUMvTQLBV0RD1B5ph2XncQyOkrsHvfr20crucKLttaJpKQra5mDYou4jCZIj9JwLVpBibwnBcRg/Y7fj/llQxj9deeX13RCU6N7hdwTzZYiinalj4TX9l3sMc0vuy5wgAKgvAuwOVxW7i+Cp0LHRwYhRIdcgZ42Gm/003suTswZDZ8I2MsPvI5QX9Bf/Tj1b8iZwg23nRkycmIdgO1AQNMKOOuo6FJuHUK2C0o0LSNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IL1PuRaEkbV1IKrXOWWlO/QhOerzEz9fCpiwLoEBpmw=;
 b=U+1tPOP8pEq8rsPv2rrbRETVzd2DUoRJ670c0eWmXyzMIwlUxCcCyTsl+ekOz9+vAIRjXS+pz/ti/TFoBW7Za9tuGIZ2qTbzGZ181+81cC4H3/zwaQUDeuxeLj+qcG3GgmNsuV+ovDvoJDw0AWArRXJBvD7PxX1rrsXMTpA9gHJltzvhY05Q+zuzDLlPvfmnGLcnmC5v2vNdoBwfmRpkV8uyrJYQWIn1KJY/bp/L6eYyMLQIvatFshiDXdY7vCdVxjCa6O4Ko3TIM1EQqtGt/sDQlBYOBGF/Fe0XJdm/3QPa39WyWIEqF9LQYkZl/xgV/oBoXi6HW2SVKqT8grEdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IL1PuRaEkbV1IKrXOWWlO/QhOerzEz9fCpiwLoEBpmw=;
 b=Lk5TjBSCOdeELgvctqt+oUz80+r3t9x1yH3Dbn49aXAcEPfE6zA+gxiVEFkivxWd85gNhsjdjrlOFuLGEqGMfQ6oHJZpkWSQ/lYy9q1WYrxmBSEu8K78PjSAzbyp7MrJ0ToDMRkyZImebYThXtNz1uu6eRsXWbxDjslIkqzowPgBgJ1bWGsxeBuFg8dbU9u7g8j8DJH23SbMdYpUkAswDcdYmQ+v5gSVDH+bvIdtDQ/cOiW7lJd26M6x4BltvaxjNzah7r0og/PUiPLrJpQuqEJrKckOpEqly8xDZTSgSR5gX1PX49rMjkmuFPIYfqsZq81WCC+XN1iCHV7iz8oIHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from AM0PR0402MB3537.eurprd04.prod.outlook.com
 (2603:10a6:208:20::21) by DB8PR04MB7131.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 14:54:53 +0000
Received: from AM0PR0402MB3537.eurprd04.prod.outlook.com
 ([fe80::e965:1a81:19ac:7bf4]) by AM0PR0402MB3537.eurprd04.prod.outlook.com
 ([fe80::e965:1a81:19ac:7bf4%5]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 14:54:52 +0000
From: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
To: quentin.schulz@theobroma-systems.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/panel: ltk050h3146w: Set burst mode for ltk050h3148w
Date: Wed, 13 Dec 2023 15:50:45 +0100
Message-Id: <20231213145045.41020-1-farouk.bouabid@theobroma-systems.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0201.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::22) To AM0PR0402MB3537.eurprd04.prod.outlook.com
 (2603:10a6:208:20::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3537:EE_|DB8PR04MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c83567-83a3-490d-5f5d-08dbfbeb767b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6HR8aeYfpZhINQY/5Nu8h+jXQ9fJNG47TvuS7T4iaPsN7YsVSX+0kA0VUNTKjPlnmQzjG5hpbtuwSPj2Bsmcy3ob+NeSS++In6huG5A+SoXDQYaljoayC7sL8fSSZZysNH1DteG7796jp6TCTp/5uY2FRYPAlbRlBKdKQzP5b/IuQxuwFiV+Qpeu7Q6eW303n+qvfVtpmqW6RbJfjgapW1laQT2Yd0KdcHpDSS5n9gw/rhcaXAsolwsJKNWbeG6J9if+M2EIlG7giwuFz3+YidNYl13F6RqiaC5XOXi6xjbavc/NDAFEnaYiUp/vKlX5YDp2yeCbOO7IjrrdcoNXrJ2XxCzyOy5kKbUo3rFnH8l3/Cl1Up/4rp02c0yvPJFEqi3OTm/8VkZ95J5IHUq73uqBiJJzcYvTzusq5rNnsz1DX8z2kfFnwcpCxeoRWudknpoSoDOBARFGFQqVDRWHfFaS3ex8VW5slye1wVc2tXZRAVYP8NXDFC4DBGtzby2z/DCazHhLhsQ4u7Huz2/2oHbibiBN0kkgtzKsJXhCHyD3hnOtlAlL8N8Qf88bW1HCYQnBpQU0uFp71XqIUCyMV8RunYyUscEk7hGxV1erBmA/lGTQyRDLMbpW1CEWO4GQaAjv5ICCxeUgpn5mFwMD2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3537.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(376002)(396003)(136003)(366004)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(2616005)(26005)(6666004)(6512007)(6506007)(107886003)(86362001)(38100700002)(38350700005)(36756003)(5660300002)(8936002)(8676002)(44832011)(7416002)(4326008)(52116002)(83380400001)(66476007)(66556008)(66946007)(41300700001)(2906002)(6486002)(316002)(478600001)(138113003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RYa7nNEvaj3LMDTFKsdz3y/toXaAPXm7n0/GFz8QjQ4sdEOICbsWCdeoUOXd?=
 =?us-ascii?Q?M4e/uW+rmNGrytzCEg29GvoJqZD41cpRF0DWbDEMCOxESMaX+8wVvN7LfyMT?=
 =?us-ascii?Q?G0fIVMlKdvDX8tKBvaytSF2fA1tOPlMeJpTqXgaQgOwJiUEEEXCUzJwb6RT5?=
 =?us-ascii?Q?RtF2PUym1gAuP19ooTSdBfEQ7Mt5Lp++MGnBolRFialAiRFhfCYxC+BnBYAP?=
 =?us-ascii?Q?lohpjM35gDzbWHTN9vuCg9V2ykr5lEEcfgnvpGK7QqlKZjRPYDJjRoGR1j1X?=
 =?us-ascii?Q?KC45md+F3A4NF16RagsCCT71vBpsz5AWKIiWdJXej3dwkO/hnvfR6PgU4yMv?=
 =?us-ascii?Q?T/VF12FZIdgFToKAtsHajIsAbTIaPmgoM75iC5K/O6mMWGJWfexqosFSi90K?=
 =?us-ascii?Q?TPTf7em5U6BanJRHeq1rApZ61LX9DVtDKwOzXORmqNRGvjEBr77asEbzYQqN?=
 =?us-ascii?Q?EXNI86r2z5/uwrZsBr3rzjt15faiAzTT0Y8BphzQDrjpd2ntA/lqq9j1fKD3?=
 =?us-ascii?Q?UcX0UczGcN4FtHMaFgR/4ewda1ipJyOrkSsE/hKy/QkNE2kxE4bYp5R6psxL?=
 =?us-ascii?Q?2HC3pwhFmYQjhPdU2xpVUPzRVfsC1LbMcUIwHYevx8kjsnhUknUXlEoFBeQa?=
 =?us-ascii?Q?ZKyB31oR09QeouOVD1+lMLNMqUPF4UpzaNiENAUs3aUvQJbJyjZkD3c4NEJZ?=
 =?us-ascii?Q?s0Cmc7jb2ai13zg6D07OLs68a6AnCnuaSrCa84TL2IgwkzdvSef8jrk2F+8F?=
 =?us-ascii?Q?tbHp2Cpm4N1d0IShUQKJAyHs1SdfR0EUR70XbbGqqyDyF0VWUng4mk/ZwYoF?=
 =?us-ascii?Q?D9/Q2vUHJhPWPMRvJUZwtEtASyYqEOkh8aBRGXCSQh9Viuj6ljpMwsKsrMnh?=
 =?us-ascii?Q?ejl98PmnS3uK68mJYj2RhKG7sTcCco3TOpO2F5PEIUdm1ju7RKu5cKaRMKgN?=
 =?us-ascii?Q?dA/s3NESzf6u07pOJErxSC1zf4DML3fugpFPzmd41MUIdKeZX5cYG1M1EDJk?=
 =?us-ascii?Q?+g+glpUx5/TITwyHKYIb1bscJTC78/E+MOr3XkM7FjM5ABXh+ht8eq95aQ25?=
 =?us-ascii?Q?zH5JQcQDQHBSLt/79Ojw4teWEV855BgCcHsQHZyi+nVW2XyopqEPLmXgRlnO?=
 =?us-ascii?Q?rmdhLg1JIVk3uPt3pghGb+BFUwUJapwGiH3aXiJwIqPboF3otyovanO94LUq?=
 =?us-ascii?Q?a8lEElAWsx/NH07sCRuidsMnDdvBqd0VSK7KxV05vjc7GxSfYhN8xCiBgVXk?=
 =?us-ascii?Q?LFOBkB+EUpAWDQIEIYj63qEb77fmhoX8L+LswwblRuz2AuzsbnfzHI0/fH89?=
 =?us-ascii?Q?CNUrSgvGYsf3nntRuRY29VebcuGkNLH5zHvAqpiVcNl2TzgewrYDhDocjPDX?=
 =?us-ascii?Q?VLtPUbJux3Q3XI6fAF9W8iD0+tjbjYoJhZEuO8rBZy5lKhPGp8Kl+UI/ZPlX?=
 =?us-ascii?Q?UC4FcmXVj69uYeAEQq2xyGGhcYPlwTE3fA7zJNuclbNVFdpXX69wbzhBu76X?=
 =?us-ascii?Q?xxz6iXMgj6wAKgiCVfVfyVAIZ3Wi8We3q+F9+WSOodGpJfc2rvEwR7IwoI86?=
 =?us-ascii?Q?OZPuvVNP6QnIkPg4lNvf2LNkLGb25ijKhSu4lefXLNK+xAKJMCr5Sc7FH9MU?=
 =?us-ascii?Q?GJIYboZ4p0VekZLp1XLZ59I=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c83567-83a3-490d-5f5d-08dbfbeb767b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3537.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 14:54:52.8389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeDaw9DLC3kBZWv7lOowR5ZlnkddM5of9zcnjg64ajZhvZ0yYBuO3NIvZYi69zDCOMvKcun35nRHJzHxNYmDvpmzRVaLxZVOw2jkKwvkQdHHUbblVeF78dO+URLx0mGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131
X-Mailman-Approved-At: Wed, 13 Dec 2023 17:54:21 +0000
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
Cc: victor.liu@nxp.com, Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ltk050h3148w variant expects the horizontal component lane byte clock
cycle(lbcc) to be calculated using lane_mbps (burst mode) instead of the
pixel clock.
Using the pixel clock rate by default for this calculation was introduced
in commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
rate to calculate lbcc") and starting from commit 93e82bb4de01
("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode")
only panels that support burst mode can keep using the lane_mbps. So add
MIPI_DSI_MODE_VIDEO_BURST as part of the mode_flags for the dsi host.

Fixes: 93e82bb4de01 ("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for burst mode")
Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
---
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index 6e3670508e3a..30919c872ac8 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -326,7 +326,7 @@ static const struct drm_display_mode ltk050h3148w_mode = {
 static const struct ltk050h3146w_desc ltk050h3148w_data = {
 	.mode = &ltk050h3148w_mode,
 	.init = ltk050h3148w_init_sequence,
-	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO_BURST,
 };
 
 static int ltk050h3146w_init_sequence(struct ltk050h3146w *ctx)
-- 
2.34.1

