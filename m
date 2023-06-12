Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398EA72BBE8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB7610E1E3;
	Mon, 12 Jun 2023 09:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2050.outbound.protection.outlook.com [40.107.8.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA9110E1E3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:19:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRjZ/LTlfBhXKDeGKZsm7lW52fvoNaJR2U+kqMzXNblEjeD0rv0IEzQ2AZHMvn4uLBfVrCWZLugz9llWapukWuszOJ4QbG49+iEMQyjgkwn5QvKZgPaXZvXzSEYzBvNvHuEyhAB8otSZwOByJtlFZ2V9AFTndGtdQ08+iS/BHH/SNSWPmGdtJGyQXFX7Zc+Yu1ZZOTkWBPGuzNI8OlIoajQfddz+Rzqy6lOgwj8OkSPIYQlDdNKKJvKYfXcYHxMss2HLJkitMBk6JXtyWAnoJsrJDEgyuC3FXmqCIRBKLgT0aETd4mcJX3U30fMjWoXGn4oD9n1ZLwUTBBueEK3zfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGAZpTotqE+cRfi88Mz6qcsWFBmQbq2eXv0iNawNj4U=;
 b=YY64dTXtZzMyMrEeUqU8Js6ESDXGoS1C7/UvG18edroZtdh9wbNKoYhAGtKmpo8j++A7/3GJZN3H/IRKK11I2vMSQYBamHc17H+sKV0+YilDSCYDc2xR/K7Jn903aoZ+WZn3jmRhLIKVYW0zgFTg2mFbb+T8Sh536lAqxBU1zyXSFy2t/XKsNTm4+ur0QfvgSwuA/WOufy1q3ADuKgw3fCdr1pu64JoeCJzi9qi6KLtvlP2hkdFwiSjwu33e+R/mVxviq7xo3O5Z7+iEWtlqr6v5YsSs0l350XwpU+mc2pNYqtUH2bqmgqxx0JacPWFgvW/OnZFGmz1iqhLAzilxmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGAZpTotqE+cRfi88Mz6qcsWFBmQbq2eXv0iNawNj4U=;
 b=qjZWPwTt6cuNMbKvVCLrN561OHoyfgYMqqkCYXKSqaEhUEla2bI/d9TLOKOvnHJj01OId9jY2e3JT8/+w4353bPHYG6Q4FkdfVcIRkKSO3zXoR7XO7liEtnM4ejpP9btqpn7spPgzR1ia0NbmudTifoZjDAOxYyPrGjN20v5DJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 09:19:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 09:19:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] drm/mxsfb: Disable overlay plane in
 mxsfb_plane_overlay_atomic_disable()
Date: Mon, 12 Jun 2023 17:23:59 +0800
Message-Id: <20230612092359.784115-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 13ec43ac-6fe1-4df0-abe3-08db6b26159a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VZh806i6S7s0ON844kDMLaguGnB2dBiOUF0RYtE3jCxP1Gj/RqoPQ/azS3Lh8mN5NgywLLxvRQ9mFF5/ni/hCbQvGcSFFZSrvNXTDAj/6c6+dYqvIrjsTw5ooNvMGAJOIls3wQjAqVa+/t4MDsXU/ZTVf00mNfuUI9TEXyw03JPF+7WUXRy3bRyQ0AhxBRSSOUXCAt/2vQNBRVjyfJU6vEAp/QtgCV8LxOfI3mO2GSgEKJNrnVLzYCmrb5j2TugRwa/PzKuWXZUsPKNHxcxbEXfNwnzROg/SwcZm5bOgXKky64SUrkrWfGnplqk2Xvhn7V9TswK02+sLE6N6NHmpLJAE265ybVWfPEOLmW5FtkbbsJ10V0I1IEJIlfeDfl/fxrPcqDLjDTWDZYfWG0fkbxls16LIUtDUpzpibwcDZd37R0KcDn7sns4ju2qnDqZP+UURUlnS7MJOJ/+4eVfKcAWajHasa9v03WmtEZY5pXKZ/zLBql8ZHJx7Nf4LmY01onbNfaDaQHW9Py+Sx8aEBFpIH/GwNQgs6hdSZF7B/mE7idN1We5QTISREecvKezzfeldJfjv+8mH0/KJtRGr9LgvvdZ5fk/F+rZUv0BsRKuU4/SKEN820yV4EQzektiE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(41300700001)(316002)(478600001)(83380400001)(36756003)(66476007)(2906002)(66556008)(66946007)(86362001)(5660300002)(8676002)(38350700002)(8936002)(7416002)(4326008)(38100700002)(6486002)(6666004)(2616005)(52116002)(6512007)(186003)(1076003)(6506007)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qpnxYNTVo7Sm4TxqE/THx0GcFjGbZNfw+cg975QN6eQWTCLE1aHwKHW2bzLU?=
 =?us-ascii?Q?oKyH0ybrGHiTtlvdW+MsufhnhtjMlUN37Yi7SAvNznUCqls4tMLlPHBZT8qz?=
 =?us-ascii?Q?wmXrZ0CAhh+HOQ2c8jnXf06n59FpWX/4wuxx4D7a00tM4AKsQ+AblHoHtgXR?=
 =?us-ascii?Q?UAZSYaV2BVH0gpaRtIbC2uw+NEKwQYGGejEDBR7t9qazTsESWDf9WRaHTrdT?=
 =?us-ascii?Q?JgYfGkL9/bqba3/e5Gw0lF4ktFsRXiDLJ/deLe/SL96jj42xwaMMlw8W2Qf1?=
 =?us-ascii?Q?cF7dw6ooDM1vWTT3CGyPuPICRTr4HEm5e8RZ/iio3122Q1oQJDmV7TBvIs0y?=
 =?us-ascii?Q?LOnd/JnqP8rjfsGnPxSy0M+FzsYKNxFdx1iyqwkIxqB30dY2P0FCnRIECJBO?=
 =?us-ascii?Q?zgWrCyvf0nBobjaFRdv4Allen6Nl9pt4Yf9r5/8dspj2qyfUOJ9Bs95f/eaV?=
 =?us-ascii?Q?Sst46JuRbMF1skP1leXS52O9hYHg/EMJIfD13Oy7CvLOXrBtRfunSLnc8Yip?=
 =?us-ascii?Q?i5SPIZCQ5rkM69GiplK7vM5+fB2icMkAN9vSQ4QEnJ9GkIjaAU8nyT1m5Q5Q?=
 =?us-ascii?Q?MqYd4jFm/Vw3sSm8cRwYqkS6KzrxSYdNdu9lrSKUxjtXgFDUMP94fVvRTcNF?=
 =?us-ascii?Q?xN+TUU8/7aBdLA2A0LO4H79wwEz/2unLCXIzscTpvJJ+qony8qHu3hjYc57h?=
 =?us-ascii?Q?x87q0kSv5Z0XBNd2+muNI5znSwgM21PvupHAe/y3hX2mLJIKz2SQ9RJae36h?=
 =?us-ascii?Q?aMJBBrRMROu2ZoTf4Is4uxOD3dX6ZN+M+SW/9j+2SSIPYSGqGpl2/vkxgZ2m?=
 =?us-ascii?Q?8H6Pbt/aySwdwPaFMmz+evEoje84h6dKXILDTZuYgorzaU2bAH5U/adkNlDz?=
 =?us-ascii?Q?3GXIbn0qAO3/xiHGpQeo1N6mnfj4YFUb4P1iDQ4henDtiRN8O0U+wCM27X4H?=
 =?us-ascii?Q?Td1LyUS8f73TvNqut555+iIwlde7RNNoHHaBEhIn76/S0lO6Dvf/uJYv8ASt?=
 =?us-ascii?Q?Ge6q1Pk5sD2TcJd8f5vCrMkaE4u5LY171j29Ze8Ewegxxz1i8jOd/o+yXk5h?=
 =?us-ascii?Q?88P80doKIYzykmJXHK4sAkV1wZ+R69l9dh7llp67ON/51Pu3XhJ6wu1neLMr?=
 =?us-ascii?Q?fsOMKjDHKrpEHfZ59pf5DCjMcpetYUkPjVUvc/TaqrA8RbsCQ01drEVnxWtf?=
 =?us-ascii?Q?h+zzN23IN6eAe5fFdZUAjFEUuIxZC8DYYn5Qdj8VJiZYgazBqiKPMoRrVXvV?=
 =?us-ascii?Q?76udLIMP4+c2h95LOMmR3bQDpfR54Y5HDUaAH18HKPv3YOGil45P9CnvrliL?=
 =?us-ascii?Q?CLfr85e1B4v6VX+mnccNMZZ17vxdgAFacg1fYQEW23KuK4TYB2/e4S+8mSrT?=
 =?us-ascii?Q?dORLwjWCtVZqzp2y+Oq2ocujpe4UEmyVpJmbbeX3zTCCFKAh1SM0WotjDvwo?=
 =?us-ascii?Q?/kTBUEX1JVta5zS5Npa5grPE3UOb+PhLPPdWz4o1KglptbAa1GsSTzo4232s?=
 =?us-ascii?Q?ITEFdenA3rPsKK83mTqrjGDAUbwuBqHIy0hXYAhR9r+Yy5XjJSZmOhVN2WC9?=
 =?us-ascii?Q?gzVTIHklZy22fvct3jsJSl0IhmqQtq9qT5vCrS+5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ec43ac-6fe1-4df0-abe3-08db6b26159a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 09:19:12.0205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aXKERfr9OS2URkSIF4Y6VYF6pcBCFvu/VQLI5g6vWhvcbMnpputpESAih7CN/LHt+gBJaGVGsV+p8a6SZhaaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8898
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
 s.hauer@pengutronix.de, linux-imx@nxp.com, stable@vger.kernel.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When disabling overlay plane in mxsfb_plane_overlay_atomic_update(),
overlay plane's framebuffer pointer is NULL.  So, dereferencing it would
cause a kernel Oops(NULL pointer dereferencing).  Fix the issue by
disabling overlay plane in mxsfb_plane_overlay_atomic_disable() instead.

Fixes: cb285a5348e7 ("drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr()")
Cc: stable@vger.kernel.org # 5.19+
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* Cc stable. (Marek)

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

