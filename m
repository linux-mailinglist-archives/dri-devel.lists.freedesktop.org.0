Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65E6C0357
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 17:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2940D10E03A;
	Sun, 19 Mar 2023 16:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CAN01-YQB-obe.outbound.protection.outlook.com
 (mail-yqbcan01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7052::718])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB4910E4A7
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Mar 2023 22:34:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luc3gvdsN33f0uviRkbCHvVmnL3O9b//Hi0Av1yU2kvr6DJz7uZDMJD23XUVIvN0czFbTMu67+XmEVeGdmp5hbvdf2RcScPItsP0A+HdOIR8vkIVXSRJv7ywFdcU9Z9Ru1a2vYMEe/nktrbTZCdOyxQEDMxWDIkMVds2avTC3GOhKfMs59eDp5FDCrGCoG3+aCmQV2YX7qnSFIiJBBLLHtvA7X6Q8ESMof+CGGGUMbk/L8A701gj0cmMmrD8/l5PuzlgIET6YWVXMXVhXFHs2bpjPRAUm2briYaY4j3nozwKtmDGzczJb/d1CnVwQjSZDcNvQozRQ+2HLCBWDjIk6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFuvkn/2hYvtzfc1dECGjIZI86v/tX+b3afU8Axxe1k=;
 b=kxf+TD7eJ40BxyOHEbEnnkgfe2jQHllHeVofK8V9UQcs25PYrEH6y0FsJZuUq4qNDfSC4yiHD714cw7Dgqkn19a4nwNX6ufEuWIQ6MnCCJ1DGdhP0TR0Bp28d80QwCFfUSMRTwI7cO338J5xM0KvE1p3oukr0vtJqooz2djW7XSoFSrq8Hqj444Y/cdoxWWe9jntfGhcknSizZxFAliieS5Y9bzQOmec4MgnU3z619/t2E8jcyedLHqgJ1/bS8p+zLdZ92BzZ8fCd6c4bPM7r51T/tJEQLBcqUgHlRnG/QVUdAlT2/6VHhS+rkg2kYXsirQBey3Cj2Xv2HTR/zDSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenbrook.com; dmarc=pass action=none header.from=lenbrook.com;
 dkim=pass header.d=lenbrook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenbrook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bFuvkn/2hYvtzfc1dECGjIZI86v/tX+b3afU8Axxe1k=;
 b=IhNV/Dn5O7pWo1QGsOYn0KXby9P2b3RN2VdjweUwF8PW+yWh5UL6ba7GmaG57oKgca2ZBYqlFWIdEDZIkRlM+4Un0Q+kGvazd8TINTGrNs8fZqHz0A2h4nkT5RXBXn/ItswITAeFdCuW/YsaU2ueQSGGyGpuNAIR3oEDNHh5uOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lenbrook.com;
Received: from YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e8::12)
 by YT2PR01MB8856.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:bb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.36; Sat, 18 Mar
 2023 22:34:20 +0000
Received: from YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2a76:b922:37e2:e1d2]) by YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::2a76:b922:37e2:e1d2%3]) with mapi id 15.20.6178.036; Sat, 18 Mar 2023
 22:34:19 +0000
From: Kevin Groeneveld <kgroeneveld@lenbrook.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: nwl-dsi: implement MIPI_DSI_MODE_NO_EOT_PACKET
Date: Sat, 18 Mar 2023 18:33:56 -0400
Message-Id: <20230318223357.3899-1-kgroeneveld@lenbrook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0171.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::17) To YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:e8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB9670:EE_|YT2PR01MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cf8a02-8cd1-4e4b-51d7-08db2800ea28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mJoIPdX7FQgu+p5EaBd2QHeqW+S/Vmoxr4RsDW7FiWDkK2xhcHS+YyNdLf5l9c9a1LhWSagYEEygJ9FwmxZEkf/hFyNFLqw80pFVrbJ9kAl3P0rVrJAQ9Qq8RJG21khIKO4PoMXfj5g7GRAOKz0rb/Y1eF7kfr97ZliCg9IYFGtKR9Z6j5TqyZSIGHRCQFpsTApkLvDLwYmMDtBouWikr3Nh7BQyrtjUlKZJfv2RQf4skMUZ02SBOXO+qZ9uF595STxVecDoTjdiQEy06a1H5TmtGyqsr7y6FE+WutARrhJCOxNXKGna4RhQFpiI5q4+GBKHKH+ji3FAvn/4lYUNg27GmAkFzl6NSBgSSXnLoYgqqLvvMWylVNVe12FHwLlrOSXc6ZG5ir+7h+dNJp6ceJHz7F5cFNnX4sAFIqiDg1Y1zDoo48h34aGO0eEABJMj6LqAUQzr/n0dJUkEW7FiPTeywoQbVHWfQyKv+43t/Dcfp3kyu16cuzcIMlK3WOQuhEatDcLd6Xh+svY761mRap4YX9cmAmMMjnFMJOQvMmTYWDAJWHSz04o835apt2+f8z52f31Kj0EuKAGMikHpBRyHjUdtKrVaP+6RmZ9lyQ6dYI3R4VRVeLLQG3vTHQEDMQof/UfWKQY986Q1i/3Ofkk6A8cunH2cSTi2idMp//CVdpJGksErcYPL4iLHzSUA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(39840400004)(136003)(396003)(376002)(451199018)(2616005)(1076003)(107886003)(186003)(6512007)(6506007)(26005)(6666004)(6486002)(316002)(110136005)(4326008)(66946007)(66556008)(66476007)(478600001)(83380400001)(41300700001)(8936002)(5660300002)(7416002)(921005)(2906002)(8676002)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DKBG1BYnouKyJUAihCLvq3zp/XbUsbKTA0Jwh+BPQ68YfaED3kEQADBxpOkp?=
 =?us-ascii?Q?xxFNdvtDkkua4uLyKk5lya2gC3T7HXkCsCiq6KyUkq/+f5fPHAfPe4nlb19+?=
 =?us-ascii?Q?hUOYmBN0GMErwQZc7cgN4UL0Xb5mE6lacvJmZS2b4x/za+gL7xEQaMXlBIfw?=
 =?us-ascii?Q?Zi5+PCvadF43rygeluy1xl76HRbaqgQPKSgNQTJ2xnkVigko+Un2Ko+oJJ51?=
 =?us-ascii?Q?2p9/kdpXDiEFDWBSYEPodcUJQg2p1JtU674WRpVQpDYKVAsR0fM+LeiE0Bs7?=
 =?us-ascii?Q?9S9qr3vs40wLsEw2eYG2A+a6mhNXCIBSTTeuij7mY44q8QFELM6dU5SsI2Uv?=
 =?us-ascii?Q?vhHCY2s0tk3znspIH00LAxcPAGc2lGtBIcRnb2gDkwE4xJ4dvB7a+qPuYoZk?=
 =?us-ascii?Q?gBgeQddpNTl7aSGewcN6au57LNSGmrCkSLLPDfO07t4Ci+JNNGsyTLApAowF?=
 =?us-ascii?Q?jzQK0NlYQLaYvwZ/28kd5Uh39Z/cqU9l/B7LNfWyhIYM+LYrB7nMNYLfoXZx?=
 =?us-ascii?Q?EGe6/D2zFCbPr1rGCQj16JIG39fvD9JlwjE3i3j33ZsYNqsAK+UeJGpduu93?=
 =?us-ascii?Q?SRFajFfXdh7Ib/IagD5GRDn3x+TQwQmZ9imQh0yGNL8NqyfcoRpuWpcjHbA1?=
 =?us-ascii?Q?/CHJdIQ4gDEmDVZeob53uKkdH/AkRWazUqpnBm/F+Zi4V3uDqlRknoxgl4Xc?=
 =?us-ascii?Q?3IBOfBvRQOehm8Yf2XWz5l4a0Xc7+Vzn2EOAXGUHqo3cDM4srw6c+dG3pngj?=
 =?us-ascii?Q?mYIxNGa02W7UhkrVPmLtsHSEB82oH+YWxxKB5AHkhNHRyGkivKzm89EQXjB9?=
 =?us-ascii?Q?v22TJ2Jc3RslQQmq6Bfazv4kD+8orGbHzaEHciBZ7PwA7k5kvK9DMterrA+9?=
 =?us-ascii?Q?XyJPHN+utDekwB63h91SmV3zmWhs3Lrk0OrMrFl+kc+NQJU5UPbYeBROMOd+?=
 =?us-ascii?Q?lf4LeepDMg38hkCjlQuX3ExpT5G9twcyBF4OjtBXpgzdZXMJPrdxONZHZbxe?=
 =?us-ascii?Q?MpIQphoaA8wfnbtcqOKH3OUPxkSOWBwdAXJqKo6wyO4rJFZ9nixu3dIKGyLl?=
 =?us-ascii?Q?hAJRMTPebhy0w4kHK1KAZwsvK1+FJZaEH9GvwmZxQPeQOrH2htxERAeqoXaO?=
 =?us-ascii?Q?40pXgQ17SBsta/ZVqY8VEI+GYvYRAv3acv2AbJJj2c0EChvXeEHr805Tu2TP?=
 =?us-ascii?Q?DAqsXJw/Dg/5fojcx0yUXXX+xPFqO+jlayZy2ImlWN4tmOIyS0kMnjynWlwU?=
 =?us-ascii?Q?IUCu8MrN6hnvrLHy6zS62cdYNAXm/q4Qxz9Qso8L+m5dZTW9Mnw8xI4/SsmB?=
 =?us-ascii?Q?U9eEdP3TRKmbxmI1zY880cp7SdNqW4s6yIujg1NO5VivggOSEMTIrxmPunhi?=
 =?us-ascii?Q?Iy8s9YCkhQdcWAyuON2NT3oqIffP8Y1QSyiQl4Or1fYy/26zolPS0fTg0Y6A?=
 =?us-ascii?Q?mOwTssCzeGtW6qELCMvxwciC+1rrUx1Lg5c2OfX6xnoSFy65tiS6qsl8Rnx7?=
 =?us-ascii?Q?OlGZjTuhv25yECnM/CRlJbAVJ6CwQfIPFeoB7/qEHfQYUZj06n3lnvTwTJpx?=
 =?us-ascii?Q?MPzAxbYZEIhx7GpfcjnyLAgPg8tFegacSbBBPU9McokNfYFoJmFjcwQSpcXm?=
 =?us-ascii?Q?XA=3D=3D?=
X-OriginatorOrg: lenbrook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cf8a02-8cd1-4e4b-51d7-08db2800ea28
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB9670.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2023 22:34:19.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3089fb55-f9f3-4ac8-ba44-52ac0e467cb6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQVSJjdWQ/W5z8NxQG0cAQuzKaDlQFXcZ1EMVrdoIcf2KQg8XH1lP8s4RYsSnaPNv4w+Y9AmTwB/SlIO1WMfIjZI/qIWxx6BkkvBNw95JT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB8856
X-Mailman-Approved-At: Sun, 19 Mar 2023 16:55:58 +0000
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
Cc: Kevin Groeneveld <kgroeneveld@lenbrook.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously EOT packets were only being enabled when
MIPI_DSI_CLOCK_NON_CONTINUOUS was set in the dsi_mode_flags. However this
really should be based on MIPI_DSI_MODE_NO_EOT_PACKET instead.

Some displays require EOT packets and a continuous clock which was an
impossible combination to achieve with the current driver.

Signed-off-by: Kevin Groeneveld <kgroeneveld@lenbrook.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 6dc2a4e191d7..bb8404ffd3f5 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -211,7 +211,7 @@ static u32 us2lp(u32 lp_clk_rate, unsigned long us)
 
 static int nwl_dsi_config_host(struct nwl_dsi *dsi)
 {
-	u32 cycles;
+	u32 val, cycles;
 	struct phy_configure_opts_mipi_dphy *cfg = &dsi->phy_cfg.mipi_dphy;
 
 	if (dsi->lanes < 1 || dsi->lanes > 4)
@@ -220,13 +220,8 @@ static int nwl_dsi_config_host(struct nwl_dsi *dsi)
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "DSI Lanes %d\n", dsi->lanes);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_NUM_LANES, dsi->lanes - 1);
 
-	if (dsi->dsi_mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
-		nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, 0x01);
-		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x01);
-	} else {
-		nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, 0x00);
-		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x00);
-	}
+	val = (dsi->dsi_mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0x01 : 0x00;
+	nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, val);
 
 	/* values in byte clock cycles */
 	cycles = ui2bc(cfg->clk_pre);
@@ -241,6 +236,8 @@ static int nwl_dsi_config_host(struct nwl_dsi *dsi)
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "cfg_tx_gap: 0x%x\n", cycles);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_TX_GAP, cycles);
 
+	val = (dsi->dsi_mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET) ? 0x00 : 0x01;
+	nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, val);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_EXTRA_CMDS_AFTER_EOTP, 0x01);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_HTX_TO_COUNT, 0x00);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_LRX_H_TO_COUNT, 0x00);
-- 
2.34.1

