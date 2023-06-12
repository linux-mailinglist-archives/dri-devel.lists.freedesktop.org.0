Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E672B929
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 09:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0053510E1B0;
	Mon, 12 Jun 2023 07:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2053.outbound.protection.outlook.com [40.107.14.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B92910E1B0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 07:50:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhUu5h+/jgcqHlyEcTSMaZuGv6+PV5Xkn/XpqsAg+0UBFhG40/yHHwWT+otEoZDuhhW+wuxTL/cWqMYYT9krqMHffJsmZWqA6QVZDfYAwgqdTb4ij77hiR+Thrm0Wjio0VSlg9XQ48wua7XJLO2MD5AY1yLCIAk6HSjVjv4VJKPxgtjI6F4nbxTAp2AlxN0R4B6L84fXpz1R4FilyZP2H5z2Ppd+BkpGqPbeZclaoDYz0K4X+UrdPz8cLU2HOFZfLrwSS0X8CpS3oTmWiw2I+88yz3o/hXUxgUuaLMdKqbEviqPgEWcl9rn9HTfJGK6H0qXVcN+b/Mp0Fc6RoffVAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZkjvE7w/HlvEWZJr6LrXtYDjCtx//DrSO0PQEb7CRE=;
 b=NSNCJ0xQOJOEljDyETrFmN5ZeV05A3KJrSLNoeVr6pqgTRxUCZ6M7IbmJ37AUPvMPK/pE72C2ynU3JEkd0r/JUeP8OGu9t+AuXAgl+QPeQOjlo3kJH2t9a5xBEjN+/1zaOTefWFDaUARWWPTKaCzBTc78/vqt6qVjlZ/MW4A6O7Z+b9LUeHi1zzggBPnSoZh35qWmk/4lM8iaNz/0udhN+0d4wCkOlc40vX3KH5+l5FJAU/AXw6JWYolf8Dd02mN6gbkP28pcvnqTQmvBpIm/961iQeeCEsaDPhxRJ1H1xqTrlX4x1hwSHsiYpDNCFK+yC4dcIQV1EDWq1IskIrgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZkjvE7w/HlvEWZJr6LrXtYDjCtx//DrSO0PQEb7CRE=;
 b=an+mXiy/4fsNokS0uI1QBZK76wOEeAAztuCIwpVBRY67YGVbgW959mhWTPfeFya3RoEmtahXqWhzIjOH8XLcSGBOuqxZmineskS0iwpLV8pfV55QmPA2Y6y3U1VioEGcUBO4XdqskwWMFDPJb2t6UMuNAKDR+7XmbDrx7DOXFP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7567.eurprd04.prod.outlook.com (2603:10a6:102:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Mon, 12 Jun
 2023 07:50:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 07:50:47 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mxsfb: Disable overlay plane in
 mxsfb_plane_overlay_atomic_disable()
Date: Mon, 12 Jun 2023 15:55:30 +0800
Message-Id: <20230612075530.681869-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e0c464-5201-4d7a-dfe8-08db6b19bba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Phb9qAG4idlzF9gCyih5rRKkboyI07B4wv0b8nLYPEwAUo4OXXn4a4d4NnriSEcBG4z6D9/QeuzZZoZynCNeFBrmQEOJ4ORCedplMAxblU0+Z8KX6bvDwPo9LAzV7a7wWGXX2Jx0bYWYaRcF0O7YLVRQFDg6RP0fQ/4rK9OBTUB1cfSVN1hYpgwTlmPYk0qZqwsFFitwbkO3VbQMk10WpDevju4mfYHwd+ssOQU/gLd2SVk6FRTxLf+0vbAy8b0rczTsLgB673WoIDqKZgDLidMkyt8SgTH67NTFol//yE07f8q4KcBH0UmEboCjceMkMSMq7nydZ6dVXU5duaw060xgpu5+P5XPrDOHYG4Wjm9RIr0lEtsQuQZCcb2Kofu3Z02nmsc+FMpTxHnj4quI70s670emtsqYj6b1NipEW4KtirR7ek52j7uKMxfZsGNaZtIuouu8SLUGbq7OZcDOrq28qduDSsuNnR2avqh83R11iA7yGAWVYEkcAd2olDKop1e6x+hhGe+ELhMar7d4EkSXjmZKvLGKT86sjPpIK0QL6QOnOtpOK+j6ws2h65st9z4Qv/RxjlmdEayTRfDgSpZjmLvf0tN3T/2dgi6LPj5g6RZt2iDnIV/LH8Dl6DAD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(6666004)(52116002)(6486002)(478600001)(26005)(6512007)(6506007)(1076003)(83380400001)(186003)(36756003)(2616005)(38350700002)(38100700002)(86362001)(4326008)(66476007)(66556008)(66946007)(316002)(8936002)(8676002)(7416002)(5660300002)(41300700001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bD3ERq44s8DgO19Uj77GY99mowF723xQkCF1p4WiQAyV+rlP74lOyZwsaw2R?=
 =?us-ascii?Q?0IK86eyLc2SE0+zcUaJcFbG4lc2l6wQZMlwfYrWUjI7vwfgfprkRpfu+SOf0?=
 =?us-ascii?Q?0L1/ow1xN7q9Ehp2LKV29Lcgp8xL5uCq6DYwjV2VOOu8Pb4tDhkbbCU5VDH+?=
 =?us-ascii?Q?MXd8Cs+h3XGc4n5iTv0iXPjSm+NXtDKVk/VgDXJT2tWU+ZVOAqqTl6a0LrEg?=
 =?us-ascii?Q?IZxvlz12r1QdSwnmy6BmKZrM2biMt24uOPNbRfgcVEj+rNAiJzbKwxcC2IiJ?=
 =?us-ascii?Q?aZiNz0qRLLTWvkAVv8W9MGcCeredmYqMgNH6ukUXhpwsvQJYL/ZVBciudQoW?=
 =?us-ascii?Q?UapF7n1QqiL75t9oqlQs8JYi3SiYsKw6scey2ByiABlszv987CkEGrBbEuFE?=
 =?us-ascii?Q?rUX2YqQzBvmpWGNDT91wtd8vndldWcnS57TjBW1J2tKagIPo0HtCsebpSeUA?=
 =?us-ascii?Q?WA3m3aBXZbgYHrLioO1lQ+CbR5j24rQzxEwSlEkHRsjbU2NkfX3jymguCU40?=
 =?us-ascii?Q?TK6ZgyGqdUmWIxFyoWmpPMY9BCCG3cmSfceTdK30TDutRouHYTkz9vvyfQ+k?=
 =?us-ascii?Q?l1XP0SM2VYl9yYmDipDr1hDIoLIIefBqu5gnupc5Bzzac1O3yVT+ltF3Xwp+?=
 =?us-ascii?Q?DKweWcnusleipnnwQeXCFkPfKiIggwB4VOS5saCo5fMMfPcasEKH7KbdkZTV?=
 =?us-ascii?Q?hA92f5PYgPvk6YlfKk69065MQsYl5zIQHswxq53a6S152pFhVW+G9WtRFzYk?=
 =?us-ascii?Q?LR1FaKgsBRQ2qGIq220kujG+V2dL22aWuBm+vRBUKj3ryfpbgNXayBf/1MRE?=
 =?us-ascii?Q?ZntcTch3W+62lmavAJIv0JJdgiwrmUDjFJ9fvWm0Ign1QpbmM8tYlcP2X/fJ?=
 =?us-ascii?Q?ngCUxpqaO2o8kAfQh9tOMWEnSW/NrT4Il9RiHksVToawJOJ33X9ZnChE3NOC?=
 =?us-ascii?Q?lNap7JQfzoNx94p7W9Hel+w6OJgVPnlFV9MI/+TrwvlgUEZtnEttN9Qv++vd?=
 =?us-ascii?Q?V3SoeNXZIqtR8rTY7ELI0KW1Ia3abCpVI/CwHN0vc3NK2DVf+ysM5B2ZScVC?=
 =?us-ascii?Q?CDvTy7jIYb47cv0XSczWtwJEmjSwmvcgpoTVv75hkhy2QIaElLhP9Aj4UnCs?=
 =?us-ascii?Q?erqfbsXRtjQ8mMOYfdicLccc3XxG3M6Nh999qtilVFWKFymd6fkmVD6WnQtZ?=
 =?us-ascii?Q?Vi9XFOHUDR2M7UGToArl38nKVf8cfohc5R9gGSLfd5LJHID6mQnpG68QnPpE?=
 =?us-ascii?Q?6BBVMAsNq0GBkzLFcMWDYtldO7/FpYcT3045IeuTOcq1lpXvwpd4OVNHXyZv?=
 =?us-ascii?Q?UszGzTV2NqEIjHt0H+gcTEetHU8TaLjYV651Bj2Hwg6l3B/2T1vjhDnVpudC?=
 =?us-ascii?Q?BMxn9I8xRhazVMP934bIuwICRoYlMG/VIgheFXOciMEhfz65InBfnD7sd1u0?=
 =?us-ascii?Q?DWWsBfCL6MeblIe8v3mcCGtMvplyk8KR4w/YjQyeZOtxkcug977buMgiHdgR?=
 =?us-ascii?Q?Z9/NytOw+ojpUzheBK6lX+xV4rklFbJswpsFfTg4fXJfSc9vI/hrk0rByH5K?=
 =?us-ascii?Q?d5UDnZ2iJQp/oIyJ83g7RHxWhohlDpS3OKP/AulM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e0c464-5201-4d7a-dfe8-08db6b19bba1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 07:50:47.1273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o35cvvDR3Sm/09trMZ17K2Ci9s9H+ZGLQfs00M6SZALrJpUHfYyHSJm/g6hk4UKFcqpytJVWrkCvVi/SQfbKJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7567
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
Cc: marex@denx.de, kernel@pengutronix.de, sam@ravnborg.org,
 s.hauer@pengutronix.de, linux-imx@nxp.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When disabling overlay plane in mxsfb_plane_overlay_atomic_update(),
overlay plane's framebuffer pointer is NULL.  So, dereferencing it would
cause a kernel Oops(NULL pointer dereferencing).  Fix the issue by
disabling overlay plane in mxsfb_plane_overlay_atomic_disable() instead.

Fixes: cb285a5348e7 ("drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr()")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 3bcc9c0f2019..7ed2516b6de0 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -611,6 +611,14 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
 }
 
+static void mxsfb_plane_overlay_atomic_disable(struct drm_plane *plane,
+					       struct drm_atomic_state *state)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+
+	writel(0, mxsfb->base + LCDC_AS_CTRL);
+}
+
 static bool mxsfb_format_mod_supported(struct drm_plane *plane,
 				       uint32_t format,
 				       uint64_t modifier)
@@ -626,6 +634,7 @@ static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
 static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
 	.atomic_check = mxsfb_plane_atomic_check,
 	.atomic_update = mxsfb_plane_overlay_atomic_update,
+	.atomic_disable = mxsfb_plane_overlay_atomic_disable,
 };
 
 static const struct drm_plane_funcs mxsfb_plane_funcs = {
-- 
2.37.1

