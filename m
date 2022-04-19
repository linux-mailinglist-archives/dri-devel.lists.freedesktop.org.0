Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24BF506174
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 03:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FBE10E1D6;
	Tue, 19 Apr 2022 01:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A1510E186
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQPxRp8iZzxMUzdZg6YDW7f0Nbp63RgVrWFHv7RZTMK2QMTER2eoHy4tdpTSiIBb9pEvmnvckTc6pJIpsljayrLEWO7l4D6Rz+ibiGxNFpAcsEm8RVPRrEs+z6hq/5NPc3CvadsnweglIQ+aK6ZANCPUB1ERQna1fiJL7cRXxXEgzv1hkUeGO5y9VvwYdn7BZPPjl0gnblCTKAth6xkeWVU/jAICdaxHMW8NP+jlMunSoH7pgryZRgoQ0RgvsCMtCA7FWfWC89TZy111PNxB0GSQG7giml97JToohc6mzaWIUt3grnFN/TapXGxDqlvQZ/gQN2hqARM67qacCdAOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oslkYcgQ48zUnKLesDh+7ZOPuZ0okPDV5oPLB5C+n30=;
 b=Dhg5xAWoTgq0yl3T6ffQEy2RuGYtvASonwr8m0GPZiECASxxe+1oJMGSioSA+I3QXbqfLr6j/333kf7Ph0YLUjp9Q0c7pNyokv6G2i8Oy8N2qIHr1ZYcDNEE3nj0BLCQgReso3fUeoiAW41whszNizwGJLGO9QtOCC0CxEnVbZ78XyypEdf5Dnt+FPxh+niGRqJSRfzznqNjNz9cMlOsoarO6fT3H8u6Dm1wGyYfkQWp2CBDQITpzCndrqpu8Bo8/g4ixmA0paE4OSn5SP8lmfphnisgbT5C5vuv+xmNRKMljekMkylRiwGOvSAk0IdmfoTmEs5F96mpJ1zK5OYNyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oslkYcgQ48zUnKLesDh+7ZOPuZ0okPDV5oPLB5C+n30=;
 b=kOGoCGQ0ihKK169HgyeuWeODWSeLSUXnSwxpe3eAHVmTqYZgr7kFZOHPQlfYGGwU1VCiDMuCNNCUKdm3e5zq3ZY8HpvnRpmANbayPlPr+xZ6KSfSUwWznFANJrpbJRuvwkgrJNcIIFQMdd0VFXzJMLDsGFUCo71rQOmgyhTmDYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by HE1PR04MB3291.eurprd04.prod.outlook.com (2603:10a6:7:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 01:07:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5164.026; Tue, 19 Apr 2022
 01:07:16 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH resend v8 1/5] drm/bridge: nwl-dsi: Set PHY mode in
 nwl_dsi_mode_set()
Date: Tue, 19 Apr 2022 09:08:48 +0800
Message-Id: <20220419010852.452169-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419010852.452169-1-victor.liu@nxp.com>
References: <20220419010852.452169-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bf39387-859e-435b-acf7-08da21a0f21a
X-MS-TrafficTypeDiagnostic: HE1PR04MB3291:EE_
X-Microsoft-Antispam-PRVS: <HE1PR04MB32913CA1D9C8BF5219AE665398F29@HE1PR04MB3291.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nL/pFJA02ZzuemXlJL3P1PATUtkJ5u/Lf4RIBp49gjaJK5t7us6zygQe56W2GUIqDJwBlk9bKc4XdqxQXdtYTsgtTScHdavchI47QBZY6LKOhyfPlKiBLupq/URltnYi7buWQ5G9oDDoZJHggB/5IxMBwPPijc4rvfPMzYZghpjuHWs7GeJGiFRNwMcEOmb4JGv2Zw3E/eUlPkclWLDPfVebO/5JmF7hTuiHGkm1g/e0vbhhPfjcbzlrMLzCMo/g+eIVBEd+du2au9TAzK62uuoE89EmeSTxPYpwFCOHhtLrsnipRBnoq+O9NsyfKqlvMrXcuXlkqkond/O7pKEdQkBwei02h72ydCGkWB8KGuKXZUwrCtiLI/+0V6qLGq6KuDxoAHBiGqzVvQ3YXsE6CgNxME3N91mq/xD4vadB9VsMCejbDPqM2+E40uYEgaBuHuuM3Bq5siFvgXUPYRKROta+VjE8gYgJ6yFRAW3Sz/2NiVzfJu92mRQnBH8ndatG4dLx7PoxxQ/8HgE04Xr55a4blRoxRYP8eT9YWXRKCMcdHLDhhBBLqgDsgCY8gnRJtxPiFmvDfduIvRbqSLYL3fFubNDmdWbb8pKkfTjWeZpmsyw9Bei1331AkkWkzAcjCCx6sjc140B164N59OUgu6GX5rfs9jHASAU3cIM5qHoCX7blo38gUMPfbf105ennBGzFAc+Pj3nImUC3tm4qZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(508600001)(8676002)(4326008)(86362001)(6486002)(36756003)(52116002)(6512007)(6506007)(6666004)(316002)(66556008)(66476007)(2906002)(26005)(186003)(83380400001)(2616005)(1076003)(5660300002)(7416002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVdOQkNOZVFhMjluSXJieEdvSmUySXJ1VjNqcks5bmhrc3U2d0g0UWlHMitm?=
 =?utf-8?B?Z0UxOFlaek1PQ1dYOW9QTEk1ckJ1UGVnVEpwVHBoRDdXTVl0YmsxaHAwWVFn?=
 =?utf-8?B?VXBoMW02Qnp6MnU0UGdtVHFaTjcxa01DZ3JrTGJPeEJDVDJVRkdPMm54VVZr?=
 =?utf-8?B?SUNEcEhjK3lLeXpJbGdCVTloZHlJcTVZcFoyYTROOTF4V2lGd3liZ0lGQnQz?=
 =?utf-8?B?Z1pjVHdUZFpGT0pIOU1xRTFoY04vekN5WnNvSkdVWHROVmMvUVZJNy8rUFJo?=
 =?utf-8?B?UDVQM21uQnNKNFZrS0pTMnhLRjlVZWhiajZpcmVMUjZXYVVkVmpDWnhkMzJh?=
 =?utf-8?B?QjQ1QnIrMFl6VzAyZlozYldFMCtyVkpUNTNWQ2pCNm1WeVovNDA0OXg2VDV3?=
 =?utf-8?B?MUVoV0tUUHBXb0tyT1NuMzI4UmpUVEFBYVI0cFljdjNVNFlINmlndndKcU94?=
 =?utf-8?B?QVFxSEZPeWVWNXYxRjNLTjdhR1RhVDNpS0xNZ2dRVnF0NE94b3JUakUrYW1W?=
 =?utf-8?B?VVJBOEZpaEhkaVpPNnR6NzVqQ01WVWV1TmthR0tyTXRHUW92UVlLcCtzYjVY?=
 =?utf-8?B?aysraUlFRnpRU1JJM0tNaFRJRlUzWEZldHplWitOYjljZFl6TjRJVkZZOVJa?=
 =?utf-8?B?cUpiZk5NeitqK21XZVhPZldkZ1VGK2tWNkRoaHB6WGdGWm5uaGJwdWRFMHFz?=
 =?utf-8?B?YUhiM2pYeFdyMS9xVzFGSWlZQzY0TUl3MTRLOHJyYkV3ZzI0QkV6QTlSdnFp?=
 =?utf-8?B?dFh2cE91M2hPREs1OHdhVTlYbytEVzZWVjZCNlFIQkFvTXdKQXNDVXovb2Jw?=
 =?utf-8?B?bm5kSEdCY0ZwQXRJeXhuQUdFeE5mMlRCQzVwZ2NWa0xtRHp0UnY5a2xvaXBs?=
 =?utf-8?B?MU5FMmRsdDJKWHpUZUFtQm5YbW9nNU5RSDBTMGlJY09uM2tqa1ROUHBvTmN2?=
 =?utf-8?B?UHlUMUh2c2NhRGVhaTNEMFVvalhYUENRTmhkR2ZTMnJLRFRybHJHZmVyZmkr?=
 =?utf-8?B?bkJ2MXk5ay9QZmRrcjhjcUVlSzYrOFhaTFY1eEZhM2tnWHQwMFJ6L2pDMXZx?=
 =?utf-8?B?RGZnYk9lT1hwUCtpRW5CaWEvNFNkNDBjRFBDVmJpSEFsamxvWnAySTQybi90?=
 =?utf-8?B?bUh3cUV4bjZkclpxZVV6L3FUZ0doZ2JCYUppKzZ5TDRXNnRrbktoaUkvbFU3?=
 =?utf-8?B?VkY3a2F0RnREZ3M3YlROVmFycEdUQ3VQWXNkWm94aENwTjFTSU9VMU9JeHNB?=
 =?utf-8?B?NzF1OEkxODY3eVNLTUhucitFeVlCenVpa0JDQ3NCNWN6eVhzWXl5NlFJREQz?=
 =?utf-8?B?S1kxY2hBeEtVdXBaTHlNcTg4K2lURk9NajNLVjNON3h3dHZMNnlmN1ZmV1Vy?=
 =?utf-8?B?MWZBbncrUno5b3RWS3Rac1hucC9lckZodEc5QkVSSmJTeXN4cHQ1aHdBWDQ5?=
 =?utf-8?B?bVFOY2YvV0c1THd4NDBOVVRZTUNlRkEzRE9jaGIxNXkzNjA0Y2xLbFJXbnpt?=
 =?utf-8?B?QWxLZUNhZzZ1b2xMajIyQk40QXRTUjViZDBGVG1XbW1UYy9IY3hNOXVrNDdw?=
 =?utf-8?B?UjRvYjdSM3pDRUF4ZnorblJrQnV1L3dYRjZpaWFDTllVeXZQOTY5ancrTjJ3?=
 =?utf-8?B?OStpQlVEdHNTVXhpenhReFNHeWhqZnN4OFU2dWRNeUdxKzRpOEdSS0VwYTlq?=
 =?utf-8?B?UFFaMWVyWDdNVVBMT00zRlhHditGWjRSWmhXQnBnVXZSNDViRUVyR25McFBM?=
 =?utf-8?B?a1p0Y0dRcUZTS0VpVXdhbFJhT0x3SGdjUVdMTHVnQ2NscUlqZ0RJRFVPdjFj?=
 =?utf-8?B?WFQwZEJLTDZpallVT1VFdGpTLy9tRER6VFNNTlI1d3RoNHFwMVU5dGwyZDB1?=
 =?utf-8?B?VE1FMGFSeXduRUFLUjhQcWtmR2VDcHNJTkl1L1VnMWgrZlRDUXB2TTlYcGRp?=
 =?utf-8?B?SCtFUlFsdndSb0V5TVNSMkVrOGVUaXRCQWdaZjV5cU1HVEFNMWgrZFlxSTdG?=
 =?utf-8?B?dk9uVnJYVmZST21McDM0N1FwZDQwMFVncFoyZGdLMkU1TVV5aWRkalpaMWNU?=
 =?utf-8?B?cnRmaDVObkMza3FGV3NZMkVPQ1Y3b282KytBdDNZWndsK0ViWkJlZEpHUndn?=
 =?utf-8?B?dEFhc1Jyby9nTGIvQlZRUGlXTzNSU2dKQTIvYjc0Q2p1MDAxL0lVcTdyMjdN?=
 =?utf-8?B?TnczTHp2TmV2U21LL2c1T01ldXRSRTdYZmRMWG00dVNPUHJ2U2xRaXhMNGx3?=
 =?utf-8?B?aUpmRWtsWUFGUm05Si9rN2dwcmk0YU00T2ptWFpVUXFFVDBWQ2J3WTV5MGZ4?=
 =?utf-8?B?YXBLZXZVRklacitEcEJTV2JWZGtxRUM3anp2MkpUajNLNXJTTDBxdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf39387-859e-435b-acf7-08da21a0f21a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 01:07:16.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLRPclahNG4QUxk7/OJ9RbHl+rWD3isTjXQ8yDJ2+o5cC1Kc+myJyHxpzVp5UWRO9R9hJY7JNN9Zlipv8Fu31A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3291
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
Cc: martin.kepplinger@puri.sm, agx@sigxcpu.org, jernej.skrabec@gmail.com,
 narmstrong@baylibre.com, airlied@linux.ie, s.hauer@pengutronix.de,
 jonas@kwiboo.se, robert.foss@linaro.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 robert.chiras@nxp.com, krzk+dt@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v7->v8:
* Resend with Andrzej's and Jernej's mail addressed updated.

v6->v7:
* No change.

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
index d5945501a5ee..85bab7372af1 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -666,6 +666,12 @@ static int nwl_dsi_mode_set(struct nwl_dsi *dsi)
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

