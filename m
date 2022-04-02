Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D0F4EFE57
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 06:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4CF10E02A;
	Sat,  2 Apr 2022 04:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465A010E02A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 04:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lmop5kzwaqaqbIr0mjppc2dffhyf3PgOpLBSFAaF8Ix0FNnXHeqzaKhUEhGIkGdiLOKImHe85iBIuQ66GNM6LI5rRU03JmxdOztfoKLstlq29PswNfckHjiHtvEg9Z7mxbSOgVV73Bsv473A5FjqHvlcHBUOGEUwyNz+9cwaZGdtNWAmwz7VkyTVw54YiPpcLqxaZaGvCS2ZqB4FBu0U0Gvb/ZnjL5k4kTZRoYlNPH3R+VuI3k0N9b/hm0cSwRWh48jhTsLuTYWPSQ6MRAfH5bLx71YKMeLPhPgi1WQYT6OACN/IcG4DkAoCyiItjl37UKBhiZkGuXrgm+l44n5ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2iyT4vCBQVYLhhj2DqdYLsq/1RQuVjwDOOXOq7s36Q=;
 b=SEO6zNCtylTOHoSH+zlMepS7YfMt3wH1Hp6uVjIzURCUoRe1DNN4WXYRnrpHHQiizBKzOryNjcpkJ37c+fls6TDyD44lT07WxH3FhIf8QB643++3Sw153T5OTFxp+ylq/QNwPo6ZAnhy/f0Vd9fGdYD+B7MUKwWp+hysBYv0yzbVPQXrwJze09OH1pfj6ioSBhpOouUOSvZ99lTjNGNdnCAqEWYdbbXvEBI6qeXYMOgM0rRE+TBakYrzcBBge8jvvinwvS71tNpmQ81QOPC2Ngmrin/4HH29DHP/8+HASPeliZVhAZGbSC6tWm/ZxmklYoUZIIg6FpRJTDY0iR7XYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2iyT4vCBQVYLhhj2DqdYLsq/1RQuVjwDOOXOq7s36Q=;
 b=JlQMhSfl0TyLcAlMLsx9i9e75UWwGG7KwUk3uO7rMIKuQ3LV2cn3b8OCMFRalVOUGyRmcSLjS0YO6AJEsJTs5Ru6foKxmXfVYxtfeLpGEfLpOId+dq3SrnU4ibj/r/hzNexP3GiWO9I6UZTH3ylJKHo/jHC/JOmrujt70RQszvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3210.eurprd04.prod.outlook.com (2603:10a6:7:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Sat, 2 Apr
 2022 04:02:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 04:02:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/5] drm/bridge: nwl-dsi: Set PHY mode in nwl_dsi_mode_set()
Date: Sat,  2 Apr 2022 12:03:21 +0800
Message-Id: <20220402040325.2465222-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402040325.2465222-1-victor.liu@nxp.com>
References: <20220402040325.2465222-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f9c4514-a55d-410b-b8c3-08da145d8a6a
X-MS-TrafficTypeDiagnostic: HE1PR04MB3210:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB32108B9DF4D733C89BBFC1CD98E39@HE1PR04MB3210.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EsKRtzcGeZAi13BrROwOuTn+2oEwrbnLt8AYhVZHZ/yniufdNadhiXEtjUzEKZEu8YMudMBHdeoDeoykYuaFJ87Y9YW3pVXgJMjN/eJIyKPxNzeh7TE02m/SVp3Cq0CKSy9kFtP7G4Be9JvxYJ+QTiI+Jq5xGCqr9JjFdE/Agm8H71xFWhL6ryPWFKWtNqe/mFTAdflJOuUeUW6ObnBZqEVIjXgsZyDVTwXLT1PlNNsRAa6liTSeH5VRXnoszfPWTesbzwJroLI4Ljyw2TtHkynyaLKShpU6ikEXh/9SQp7EWVKgfmJkzSszcgfBJXMGAUsq4YLUfZLSJsRrhV8UQC7Kgvo9D+Fd5W07Nffu8w+JYPz6/2sfFPNUAtPadvNWCu0sX66W9BTApmObG/I6uKb7SA/uZfDl0l0D8LYin/4Vz3XyD5GBnD8PzB0j+/TMnNtqjH5++zS/wX/n30TtpciFpWmuniFP3hLZUi3r87kgYMBDWaEFYkeU5OOT1udjmD1pc34nZQpA2r80xf5Kg6wj8dAcnL9Kem9mVEq3gT12H6k+cOBmbE6+hBGwCAOJqn6bRkf0wOCGfB3URIlIccoMy7ceNeysJTDlWP20OVpCK3vefXKJCChBlzNQZOkJ93nGlgB8FnlEr4vmwAhVD0AbpcoQJFQoJQG259Y/kA+L6zXrPttxshaOB4Qxv9S80lZbrMt2tW/qs0zLvXi61A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(6512007)(186003)(26005)(2616005)(1076003)(4326008)(8676002)(66946007)(38350700002)(66556008)(66476007)(38100700002)(2906002)(36756003)(7416002)(5660300002)(8936002)(508600001)(52116002)(6486002)(6666004)(6506007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnJ0b05FeXhFSHQ5SjRyZ0prU0JIbUV2aDQyRTEvbmM4OG9ITEc3VWhNZWFP?=
 =?utf-8?B?QzRFWThYZ3NMbk9LaUxMS09mUjRqTkx0TzI1VEYyNXMway8wcURaRmZBMFhY?=
 =?utf-8?B?WFdlN2lRRTJ0akkrMWkvOGc1VW9PWFBpQVFnL2cxWXp2ajZ6MlViNFlQNDNp?=
 =?utf-8?B?WWhEYXRoZkNlM0ZUblY2YTNGdGhsS09hL2tPQyt3MFFMTm9kc3IrUmhqVDRq?=
 =?utf-8?B?TUJaRGZZbXhndGpnTjNGVHJIL2JNNWFla1kzdUFGTWpsdGxYaDlaQXdjYUtC?=
 =?utf-8?B?WWpTRUNYckJvRllqNWRsbFpWdnFUbkI2WkRrRDdIZGNvRW1JdFFwSlJ4OEdt?=
 =?utf-8?B?UlZDSjlkVFdEbWpXMVhVZHpISDcySG93TmM3V3FIalJSRjhJeEZJQ0FiNmd2?=
 =?utf-8?B?eXorMlFzNHZtcUdheEwrMWpVRitSTkNicloyUDNPM2FTYnIvSEZ2VlNqemYy?=
 =?utf-8?B?TnJ1M21RTG40am1TSTBrRjlKbWx5dWFiYkpsMjA0ZnZHYUZDRlRvYWZRQ1dX?=
 =?utf-8?B?d3lrTTBzNHRZTlZsb0FqbHJzSDd6NWJ6QnhUUWIvRjUzdDRUK3ZiMVFid3BR?=
 =?utf-8?B?Y2JZZDlBOTlvYWdRWDVDUENrY2RWU2o3RkpydE9GbHFpNXlDSHlkUTdCbXBv?=
 =?utf-8?B?VjlUdSs5NkhLRHFOTDgvNFEwa3ZFQjdBRXIyZ0Z2KzVMWmtiT05EQVoyRVFp?=
 =?utf-8?B?Z1p6QUptdVBxVi9hN3BWYTBsZTRSblA5MXlpNEVpSTRVZVd2cjR0VXRxQ1JW?=
 =?utf-8?B?R2txNEFFdHZXekxNcmFWV1FRUlJsWTRab0xZVkdxOUxLVG85aEU3dGE3MUc5?=
 =?utf-8?B?YlNzRHU4RjlkRnNmZStodkwvalljaEltUFExbmRaZGZtTFdaYTF4amhkNG9k?=
 =?utf-8?B?VGhvV2taWEw3WUJGSGJ4Z09DVVcwVCtpaW4xSUV5eFlERUVIOVVRdDlmYWhy?=
 =?utf-8?B?bFFKL3RnSXdvTjB1clB0SDEvaEo3SDJqRURHRDNVT01nSzZCbW9JWWlwdUpz?=
 =?utf-8?B?dlYrMFRPRCtsMkFJVHQrejNFRHd5amZ1eXVBYnhhYnBrN1ovTFFXY3JaaXRH?=
 =?utf-8?B?NStlSDlqUnkyUTVQMjZFQTJHalQxbmJVSzZTZmNyRU1vSGVuVjlaRmFzNjZJ?=
 =?utf-8?B?NU9HVjRZWHR4Yzk2VTBjdzVySXFFREsxMUJBdENxekhXRUVmT003YXlSTTlu?=
 =?utf-8?B?a202QWJhRVoxaE5pU3RteGQ5dnhVcUw3ZWhNRGphZ2hueEM2L1ZSMWtBQ09j?=
 =?utf-8?B?VW10N1hXMUwrcC8xblJ3MEVuUVpzZTZqL2dHMExqTU9uL3JZQlZhbElaUEg5?=
 =?utf-8?B?RmNUc2ZwbVZRT29XaG85clpzdkZFZUxvbkZ6YnZTeU92UmEzOWpMdndJc1pm?=
 =?utf-8?B?UDc0TWZBa3lkd2YzTE5rdHRsZFhqaENqbEdsVjNLa0JuejdGeFhxVUtxcnZo?=
 =?utf-8?B?ZzRUWFl6c2RnWkVmeWxYak1ZeTV2RXl2RkZIMlRzQkF3aXh0YUNFdWxrMm8r?=
 =?utf-8?B?TzhPa29zdFdBWVI5ZGVSam1aSHZaZlBqaFo4cFJmSTFNYTlzdTdMVTNEc2JQ?=
 =?utf-8?B?UmpTdkIxYVFqTUUxTHQyemM4ZXdFcHdSSEc1MEg2VnA1bnZBK2VDVVpJM3Nw?=
 =?utf-8?B?dHJTcXJXQWl2VkE1NXR2UTAzTkpvNHY3UE40di95dm9iSG5xbmVZdFBNRlEw?=
 =?utf-8?B?UzdxZndTTE00d3hOVU0vUllQdGFJcXZ2WTlBd2JrNUFMaFNEK3daenpVdEtn?=
 =?utf-8?B?TmxvVHJOK3p0dTU3ZTFYZ3VPU1gySHZpa3VTRTBFbjc5RmtQWW9ZT24wVlhY?=
 =?utf-8?B?VHY2UkpwZW5iZytiVUgrSklTRVM4UitXU2FLWGVlTFlFMkxZSUIxUlpaZENl?=
 =?utf-8?B?RzhzL1RROXZEcmo2Nlk0di9wSlNoZk1tZzc2Vjk1RTArYkpxL3l3ekdFTnV6?=
 =?utf-8?B?dEMwZzk0ODR5NlBGVVJ6bUZQYjBiNllXVEltOWI4M21ETEtNaVpGM0E1SE9W?=
 =?utf-8?B?VWJqSmlzK2ZkbXFPSDRpWjFTdGZ5eEFRclRZRDkvMzhKSXFzaHc0TDNzQ01R?=
 =?utf-8?B?NmxEcHZoQlJtODRkeEMxTVFVRUZyS3U0V3ByRndqTzluVi9aV3I4OFlldzhh?=
 =?utf-8?B?WHRwNEh0RWlldjRYL2FsMUsxNkZtb3IrNEZxUjY0NGhRRnlLNXJEeHJPZFpa?=
 =?utf-8?B?Q0piVGkvWDRwcGcyVFloenNQZm12YVFkU2Z2bmpRZDhhZy9OcmNrTVdvYW8v?=
 =?utf-8?B?UEdQYjRlTy9FcGdkRjlWR3Zub1Y1aEkxVms2ZVp3K1pxY2dHc2lDenVmTVRj?=
 =?utf-8?B?N285d2EybXJjOXJRTTBBMmZURmpZKzZWTm5yZUIvZW9ZWmlJOGdUQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9c4514-a55d-410b-b8c3-08da145d8a6a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 04:02:01.5309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvf7ozu6VZ8OZ5D++N9MYyk1nIlbHQtpcKxwa2K/rG1xLcu6L09XG2ehqVlfa0J0xt4bSPP8br0DEksL3xySoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3210
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
Cc: martin.kepplinger@puri.sm, jernej.skrabec@siol.net, kernel@pengutronix.de,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, a.hajda@samsung.com,
 vkoul@kernel.org, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 robert.chiras@nxp.com, shawnguo@kernel.org, agx@sigxcpu.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Northwest Logic MIPI DSI host controller embedded in i.MX8qxp
works with a Mixel MIPI DPHY + LVDS PHY combo to support either
a MIPI DSI display or a LVDS display.  So, this patch calls
phy_set_mode() from nwl_dsi_mode_set() to set PHY mode to MIPI DPHY
explicitly.

Cc: Guido Günther <agx@sigxcpu.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5->v6:
* Rebase the series upon v5.17-rc1.
* Set PHY mode in ->mode_set() instead of ->pre_enable() in the nwl-dsi
  bridge driver due to the rebase.
* Drop Guido's R-b tag due to the rebase.

v4->v5:
* No change.

v3->v4:
* No change.

v2->v3:
* No change.

v1->v2:
* Add Guido's R-b tag.

 drivers/gpu/drm/bridge/nwl-dsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index af07eeb47ca0..cbe3edb17ceb 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -671,6 +671,12 @@ static int nwl_dsi_mode_set(struct nwl_dsi *dsi)
 		return ret;
 	}
 
+	ret = phy_set_mode(dsi->phy, PHY_MODE_MIPI_DPHY);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "Failed to set DSI phy mode: %d\n", ret);
+		goto uninit_phy;
+	}
+
 	ret = phy_configure(dsi->phy, phy_cfg);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "Failed to configure DSI phy: %d\n", ret);
-- 
2.25.1

