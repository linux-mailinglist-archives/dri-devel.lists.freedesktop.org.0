Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D50562C0A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 08:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E0010FEC3;
	Fri,  1 Jul 2022 06:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70082.outbound.protection.outlook.com [40.107.7.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED28F10E2DF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 06:54:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSdRJO+f2p24Qnp/k4sQLvuq8ifxFO3/4PKSh7+scwCxuhjoC9oqwc1CQJ/qCmX45WPdZF9dKlbDqSoW+qP4f2JgvchfudteJr+gtRIoBqac+Pfghj3dFVX5BkD6UPgavldWxpXpYPk3Wpgf+8KLiNUFlKiCd40Tc7wF2IqkKlYyQP/8+4mzKv+iIamlvOhPvHFt+rtKtisYyr7GhCWtVDSzsWH4PMDPGhFzoB+BiDVZ2pFJWZUuCfn5F8QjJDgVRcceaOdvTWdtOnA7GyicsdVZnYZmS+5U+K8Dk1+Lp5Pd7jUEY9tz5TM3EEqof4S87bkxRayw0es6kg4d8iSDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRngNZAyYtWkCyIueLTFLwL0rE2iVA2RVGcS5JmbGRQ=;
 b=Zq0VosqIIOMttRo8EOWGxocHXXIx93QGehMQiJpF+rnwaHutDt5zBOSuuwuNvGc1Use/9pOHN6qNP8aisfJoRpYtWmgeRRqSO1yo77T9ZQjXDWL+7cRD1K9tyG/oagtviz8cpaycojk9FFMY+Lej8wS3S37G/cu2mgczVhEWKBjXQffEq47M8b+yho37mdDQajY+aLpoiEr8T+/Kki4FyMB2jaXieW+V6GX0DVTiXHvd1eGvdhgZBioKT8mI4FhkueEARpBQNSmQseP5xITRYTst6yGnf5iXE6NJA5syvkvC7MC6/rWXI9ZQf9EiOaW3Hb8NIYP36hHPR5d+c7Q+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRngNZAyYtWkCyIueLTFLwL0rE2iVA2RVGcS5JmbGRQ=;
 b=eWszoxanQmv1XmPHNdrcF4GFExMU2r9c0ciQmolR13fYwnZ0Ws2YTkrRxph6XObvLFODOUF8tczuPXjHh4Apgx8Doc29MyYPrMm3aWi6/7fvDoYXaiYJlwW1Vk1SpIcCDhr9vHQ/3pT6GqDlmJnnvvcWG9OzWTSfV14tTJyjK9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB5762.eurprd04.prod.outlook.com (2603:10a6:208:123::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 06:54:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 06:54:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/bridge: fsl-ldb: Fix mode clock rate validation
Date: Fri,  1 Jul 2022 14:56:32 +0800
Message-Id: <20220701065634.4027537-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701065634.4027537-1-victor.liu@nxp.com>
References: <20220701065634.4027537-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2001636-0320-4bfd-9143-08da5b2e9c06
X-MS-TrafficTypeDiagnostic: AM0PR04MB5762:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vS1JyCRMQQqary72NfeZ9gq0iaU92LT0kl+TihAq51ULEumG+73NK3kxGD9oL6d6ie3d6tg7EKf2K0rURWgbsPhsbYHEi6lnGza0jUSedKc78KkpnbdBpQ+xURzqPStDcYBGA8FJDMnSMEkBvx0VIRvESeyhxPj8+Krye3Ez1v16rhaSJPjxctxWpFpFDT9gYOK7oNIGVscNol1O2t+hlA8Q6/YLPlOMOuAY7W/ejjo3gltCvRh/JUZKjwPsOnkGUCwrUUTd1jR/rYLUJAId5aWM9yJJ/ljAo8QqLsbe9RuPI0InG2MGk6mL093tr8TrCx7R6QfHozAqJbjeZ9F8OQnEQovk4HTC4SFkBUZSgQq6Rxmqsw8PDL2x06li8bdnhZKy26pInvxHZyMWB7GkeD7fky6ckBRoABF9/x8s7qPS5lUBEK0YujDVJKyqgPCkIEZLF5It4M9ZvowOcsNkpJCyXAwoL5tjczNyMlvrkd/wj6XpzAQuC4WZSunBo6aEn1r1G4Jnr6VbPjFZy1aFgkya9Kzh/hUJOgPDu08Qtil3xODEDfn2s7MGd627770+gFKAn3fTsqYVHwSN6h+L9erYb/djOCh3XCB20Z6YVXMBBByOAlDQHVnpfFZujwxoRTYihf3C2sAwn1cNLZd6nuXcbEP0/fR6BotyH96r/we5916n6YxbU+DCfyD7x+ZRfDCI9U11uQ89Kn9OexPqBtMuElJcw57vSitUygU+WLzd7E208+8srBb9bawjOZvkOoTi9NLgKlhw2JCYfNg1uE4BInpUp48rdfkrrkBPkQ8FdFg9dwQMKGFieBzPDhWD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(8676002)(38350700002)(66476007)(316002)(4326008)(66946007)(2906002)(6512007)(38100700002)(7416002)(6666004)(66556008)(8936002)(5660300002)(86362001)(83380400001)(41300700001)(6506007)(26005)(52116002)(1076003)(186003)(6486002)(478600001)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yyssFHdRQCQZXUkYG27Nfc8fVqCgG1msysXl5SmwfcP2yFhnLA7vc/aBhuSi?=
 =?us-ascii?Q?8BIComhEmdvxBcwTWw0upMctesJSnQ/wKkvC/WWPWNzFhAhaILWKVfhQQxD2?=
 =?us-ascii?Q?xnMtbieC9IJpNCcQnhd/pq/vlyV0/Y9apXkO2SSIsvETU99hbDg4LYHcWx0H?=
 =?us-ascii?Q?UaddWzKgWtOqVWMy7iFD8phMcQ5/tVG9KdXqOeoSywJCNtQDVX3ch+woKFDm?=
 =?us-ascii?Q?lfkGZHhVMKcPrK9dzxKCXhOPgVBn1v2y5oJzyJAlqPXXXkhXSP3W7NrEpIcA?=
 =?us-ascii?Q?vJlyks+/YisQ0S0qD44OcpdydIsovqWhiFHcb1AahkIDW2YZUBmhpTpnTDlo?=
 =?us-ascii?Q?SOia64KiPRqk3sQRrXAHzOOw2ug4ldKn5mjF1mxLb4CegkYLcw7U6S508ZXC?=
 =?us-ascii?Q?wwQ1czfd7DG4bpwjULxoJazPskpYuEQQ51U8jF/1NAtw3hNNLxPnuphhgAK2?=
 =?us-ascii?Q?Yn05fX6r4tXNM3zRxQOtwOCwX6FdZOvRI4s3qold3+ciUeNGsE0lziYCFJj6?=
 =?us-ascii?Q?0mxFjvNrAhPEd70nFhKGPKjBRxrnrAFOkjwIAoqjAh3SA9w3NhgKMZycfIt6?=
 =?us-ascii?Q?CboGPJuEyxI3ICmSHZK08xlOoVJpOgbfKgxaMM2gSa3UwCxYWxe1cAuCnltK?=
 =?us-ascii?Q?oMe1btU+Pxx5PCnmIeIVeIMoYjhYv6ZnMO1ZBk9sdqBxQWhssdckzUcNXFqW?=
 =?us-ascii?Q?3okTSMFLuuAWSMIM6EiKGDqxd2eeF3H5+khHkGCPvHECgAo5EpaT2tY475/G?=
 =?us-ascii?Q?BA7l46iYHz6UY38qZuFsPYSQayx4pY80QMO/peLO/CJIpXHHfGDhcdUZxlIG?=
 =?us-ascii?Q?/Vv1ciYoibOJiaTVn/6+iJA8XBye2Rl/f4OhaMku7XeyBxThT9M3E0zKBn0B?=
 =?us-ascii?Q?oqkDEeHcvfUk4o+MGaqYtQPjjAzLOmYKHy0K9ZBNeU3NdrVVsG2T/xwkKVPt?=
 =?us-ascii?Q?I8g9xBRC6TIwpWOpGUXBQIfEamS9UxtiM4b9mK84ohcgoMdwtgTN9MSAuXIV?=
 =?us-ascii?Q?7FWI5u/SQi8p1zM39aroJ2TsYlkf0O6kt7d3fxFrrLq/+tiYmkpc7Qib8KS2?=
 =?us-ascii?Q?vwS56ogOdoSKMMTM3uHdIdJLBHOIECSy5Jsl3yJ5kVeGgQcC1irl3grdQvBv?=
 =?us-ascii?Q?Za2arhUPfKKdZR/Jc23XbC2cZkx6veJXw/bIv2yqYANrSJkU8O4pr3yiB2s9?=
 =?us-ascii?Q?xb6WhwTlr8KRNrgmKG/I3BceZTFVD+KUijZsZ2FBSvG6fdUxjtsGIxGlzerT?=
 =?us-ascii?Q?P9osLTN2YafRPuu9qXbiMbsjqzbCJdnCXoC82kGkMoksWaJkr9/xZBGjP4tt?=
 =?us-ascii?Q?9MToKGU7/+XaZQDyGl0Z6roaInJb0ZanyuDbyOQ2G1zjrQs3wBDzR/bpzq9L?=
 =?us-ascii?Q?m5xv7FII991m7mcQJ8XhBOfeUDQsbGzhjklukauMXLgV2McVO3WJyaAxGIFs?=
 =?us-ascii?Q?gyCe4Na9nzE43OGNZAZk5hKr46cz11fGojTXpL+7XmyDT9lXq0sJ+Q4qiWug?=
 =?us-ascii?Q?F/PmmQuTh2BNbwBD2cp8ejXa4/cmR7q4L/LwzFIs0EJ9/TEumJ1xTJEggjQJ?=
 =?us-ascii?Q?Jyo/SL2oMEv+fEE2QmQDh7VypaZNBgm8I7o7QJPV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2001636-0320-4bfd-9143-08da5b2e9c06
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 06:54:57.2364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yU5CXkLL10NnPkdNNbq27X7i8bXiF8F0HaQDA2/kjPe/PN98DgzU7b8YFkNkNpIPohgkRlc4fkR7P5D5mO9YVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5762
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
Cc: marex@denx.de, jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 narmstrong@baylibre.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With LVDS dual link, up to 160MHz mode clock rate is supported.
With LVDS single link, up to 80MHz mode clock rate is supported.
Fix mode clock rate validation by swapping the maximum mode clock
rates of the two link modes.

Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Vasut <marex@denx.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index b2675c769a55..3cb3b310e283 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -233,7 +233,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	if (mode->clock > (fsl_ldb->lvds_dual_link ? 80000 : 160000))
+	if (mode->clock > (fsl_ldb->lvds_dual_link ? 160000 : 80000))
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
-- 
2.25.1

