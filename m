Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479C1455468
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 06:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02E36E8FB;
	Thu, 18 Nov 2021 05:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2110.outbound.protection.outlook.com [40.107.94.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979066E8FB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 05:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpSURizjGClWBXNjfgRL13yYBfe84hXPIFtDckRRWB7HhkMrXuMZok7axhCEvuXRmApKiQ0pry/HYvsW2xth6Qprn+kHAnPn1cNZo1cPp+eyZcwHQzN1/cjbwDSLvL0WSWvKBaEV+N91c1t/ubkkEWdC66XG6iWRwpK8K9GAhijjKNMPMRQshz/qXwhNQ6HfkOXLuO5NfZn+uRN80iQMZGkkEaR+5h5jvVFJ9TJelt9IN5vNArczSPzk9zVTsdsCaB/Aer6dzTRtrM6xNXfMzZZK6uVWl1YzwKTMuzwZCm+DLfb/C0NXpm2JRCDNV77bl2BWiDi+8T/xtDuZ8YhEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39EtZ9HndNjpwi8ul7c7XTdTnWiALhPX3LVIu02Gvdc=;
 b=SbT7ANM9+A33SZJ8Z3lQACDht1XmLfDNkcVvw0oHwJo9+rRMnYCwITGRvdvTgp8sKJzk07ouf4mhJaLgdpYbZPIgnGldMy7Y0ZNNtKrOha39a9LBJDph5FA+7t5obZ0FXrsaoODpZMoAQ0shDi6y+37XwKRyL9iRrnltdO2bcfSoA+uep5adVBMEDYl4K1Qk7kUfiom/YYtb3uyHTd/Ty4MNlfOQhitNWXqr65uMr90jMGiKI//Y4UWmq2wmM/i23cf3NEvz/qDVXYDWj/KsRgBG4nhX1edv0m71Ea1QnN5fyoE2+Qzsi1XRGhp5ulUXcbchkFZgtpuc+mrwendKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39EtZ9HndNjpwi8ul7c7XTdTnWiALhPX3LVIu02Gvdc=;
 b=kunVEQy4Xpm2ndZjlbQYuJ/JNkouje90Qri63ogHAUgQRPYfCMa1oDgYztiafCV7WBkRFLsIWJa43uCCbXigXCxqjxCAfvuK2yMOuQKi0xlNBt/anxZwDWe/C5OABSBJKL9/2PVfpSrmx1kW8u9Gf0XjVWTYpALyxeVpEV8reWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from CH2PR04MB6741.namprd04.prod.outlook.com (2603:10b6:610:96::19)
 by CH2PR04MB6710.namprd04.prod.outlook.com (2603:10b6:610:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 05:45:14 +0000
Received: from CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::d062:2525:29dc:13df]) by CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::d062:2525:29dc:13df%7]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 05:45:14 +0000
From: Xin Ji <xji@analogixsemi.com>
To: narmstrong@baylibre.com, dan.carpenter@oracle.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH v2] drm/bridge: anx7625: Check GPIO description to avoid crash
Date: Thu, 18 Nov 2021 13:45:02 +0800
Message-Id: <20211118054502.3796946-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0147.apcprd02.prod.outlook.com
 (2603:1096:202:16::31) To CH2PR04MB6741.namprd04.prod.outlook.com
 (2603:10b6:610:96::19)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0147.apcprd02.prod.outlook.com (2603:1096:202:16::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Thu, 18 Nov 2021 05:45:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03848f13-8a69-497d-b3a8-08d9aa569797
X-MS-TrafficTypeDiagnostic: CH2PR04MB6710:
X-Microsoft-Antispam-PRVS: <CH2PR04MB671022FF2B480340F0510133C79B9@CH2PR04MB6710.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JlXVhMG6JqRbIX6qYM9ruDE6at9sIdbyxAXoHBDtFCmaQudFABizbkamVK4Gce7glxjAZjVNRhtLi3zwfjXJSWx2VLHOe6bx8z9Nskzh3Dw3O1MHNt4gWQa8DRhOikUyNVonvjS3RgQHafYqXhO1B0f4Il0mcX90QzxLhNomihnCwzdhjqIHrqeGEwztn1mRoUXecHCYJsgLiDL3CiBHSh6kJFE6vp9rgmzcf6lh/5KbD+UL/q6vP/muXCkYL5wDycaS1RYEabbPioh3+Ykx9HwQTKU39XVqLY35SuvT4ayTL29yzUEco2f/CpIZxv10gIXGKbmYvYwrlMHw03VKWVWQ60xi6jphhdjWWkpAVTgZDUtjVyznfoEAFDpWC4bn4DCIHj0Q1YVzCfHr1CBWd2qUAy/VC7fKpz6VwdHBjHIEd2w5hF87gSAuzxHw2ppXqzNd5piZhN9W5067hGFHVnzX2YASPyLBMathCU61vzZ1vRTi2WBSC0pvObaXm9quAz/5ge7/nBuhcKLaNyQE1yoWQ5HjgFXu/la750gkhfkUMCzJF6LMR8Gz+06cv1PCmUgjiED3nB+CDOKWya6zoWB/SAqK4QoRkDHZ4JjTWbpY0m8jJXKAUFo5l3fsEMVXgD/3EksyjiSHAvOujubORtgQuj+8cgmjIXaYpxYlgQJnezJ1Xj11qZmU4YU2RgkRBHdxwYJoFxbM064wP5wT9+56kZ3FT81AabDf/pcRh5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6741.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(921005)(5660300002)(2616005)(956004)(7416002)(6666004)(66476007)(1076003)(38350700002)(6486002)(107886003)(66946007)(66556008)(26005)(186003)(6496006)(8936002)(4326008)(52116002)(6636002)(8676002)(36756003)(508600001)(2906002)(86362001)(316002)(55236004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Py2KM3t2/HSrYSMtLI/V9Hjltukji4sqUSrv5fgtIWeNzxtNXkHG/5N4jFve?=
 =?us-ascii?Q?kMYVRRlsC1QPy225npefndXOVSCxFA92auJ/eAZ8M1/6CB12GFsznbC0owMT?=
 =?us-ascii?Q?QoR9zIDHUBKUl3BMz/Mz1zLVzQkC21cDidpo4qhLM5xLNq3+xz/qEqQkhV/J?=
 =?us-ascii?Q?BiSg6Nn5ZBSyWFhc3c4nPZy7XF3Hmt7KC2dGl4xBMbnLm9twP+6+dlY1FFos?=
 =?us-ascii?Q?exizyPLaIxb0xJC58ROqdCeXdxIAY4RZGoD8KaQUUJjwyYx5YYxJMjkb5GyS?=
 =?us-ascii?Q?OTwvPnBSjZad4P/k7oBjnCNqKSX4VAW+QOla4+b/mx3NinCsvAg01cbhSqev?=
 =?us-ascii?Q?e5h+tS11ouOEOD49hF/JnBwAKkExTzy813RgGgcmFEpP8jf1uW+I+dVsgj9K?=
 =?us-ascii?Q?yCxhNEbMslQPDLL82DcveeCiRzD4TkJ1sI2rVR72k3V5t5WfAIqSrtxSMFoc?=
 =?us-ascii?Q?2aYGtXjx5HNI76XQEVthPYVi5KfVNE6agl1zSqEfg/coulnAe00PO/UqSu2y?=
 =?us-ascii?Q?SwavJn9be9+zE+VMevp4L4BnTC9fsBsckWIK3tkMMVfYOpvGzujbgN5LzuwG?=
 =?us-ascii?Q?qnBtqtKsMlk/LhCIOMm8lKE7vKHsVefXicxKOVDkTJN3v6/sI8QKmuVRrHVk?=
 =?us-ascii?Q?j4z7u8sHh+uTbrTN2sFS9H/ItMfAC1WHbcrqRR+HtNR0n+myp/mmGUqycA22?=
 =?us-ascii?Q?1EOmogg6i7gQjIksoGoFP9JzZawbKSstbGkYGknxisOrcnu3CXCNvFoVYLa3?=
 =?us-ascii?Q?1pqiafex6a+YMqcSVlUwI42mSzQaykAd9waRp9YjkVnrR0doJdB79lY26yBe?=
 =?us-ascii?Q?Kuv6KaJpQ0Iw5zTqExv1i3fD6vzUWVzwq143VShaQeBNycOB37c4IEuOJ5NO?=
 =?us-ascii?Q?/58XrFvEvJUkW3zk+pxpicPw0wdXg5Xcv5m6+9tCch+H6gGSknvusR2O4I/2?=
 =?us-ascii?Q?zkoCFJxykXPD+kzOHw7c63Fh9o+mfjLkHyMVS/hW1snLxmkbAtA81k7vqLXY?=
 =?us-ascii?Q?phYMp7luStQubiPzF8o5GRUKvYFN0RJ/02wsXun5UYyUkojhlYumsgYkUstd?=
 =?us-ascii?Q?E2wka8mAjFPQDD/xaM2G2SN50gUWoYa+tXSeTNPyA11T+jFv940aUGIaVwaw?=
 =?us-ascii?Q?eqlYiOHTsLA20xd7XsKekiBT0m0qwRxHTzojG188LZAmuaVblRzxI1zBbq/R?=
 =?us-ascii?Q?pWeYC2IDzrhjP2txv7vBR7fHelg3NeJGGXR/YRYgTnh7xw7ibag0SdpASSwC?=
 =?us-ascii?Q?P7xvJtSSstGvepBVzoMSYiQf43I1NdulrZ4in4KBZF9NN72/1eo2P1WKoJr4?=
 =?us-ascii?Q?hi6eGEnyE1OIglDBFaUD1K24yYL+mCglhxeXRPO4mNDmrG0qA0wD2JOr34eV?=
 =?us-ascii?Q?4DBAf5proB/smyXBvmJVff0AQkFnMzapTE89hRqXN44kCKSBAhIykDYbjzHX?=
 =?us-ascii?Q?JerxeBh9TJJhZR/A+6TpRTV6i8e3G/HQh0I4il7uKAK7uD5OiwMbc5uKzaBu?=
 =?us-ascii?Q?Zb8cPOKMpMTffmtONKqR8dcBShdrTwyeuXahuei6HUMTS7jAD+uuiAarcGZq?=
 =?us-ascii?Q?+zE+NNssrXiQimRQeWkV5JG+2Gu79UiGY3F74H6mtn+4eQuhnbtZvVyauJbG?=
 =?us-ascii?Q?PSx+Lb9Qn3JXIE4hTSEhVmk=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03848f13-8a69-497d-b3a8-08d9aa569797
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6741.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 05:45:13.9783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bWDKGm98FemNi91rtXW85Ya/8ntWfOewpFCiVf8E/2owqLZAEAzGPek7NpJ2t4eptjzf+hvgotZVxb6vQDQXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6710
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
Cc: Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As GPIO probe function "devm_gpiod_get_optional()" may return error
code, driver should identify GPIO desc as NULL to avoid crash.

Acked-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 001fb39d9919..a872cfaf6257 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1098,9 +1098,18 @@ static void anx7625_init_gpio(struct anx7625_data *platform)
 	/* Gpio for chip power enable */
 	platform->pdata.gpio_p_on =
 		devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR_OR_NULL(platform->pdata.gpio_p_on)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no enable gpio found\n");
+		platform->pdata.gpio_p_on = NULL;
+	}
+
 	/* Gpio for chip reset */
 	platform->pdata.gpio_reset =
 		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR_OR_NULL(platform->pdata.gpio_reset)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no reset gpio found\n");
+		platform->pdata.gpio_p_on = NULL;
+	}
 
 	if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
 		platform->pdata.low_power_mode = 1;
-- 
2.25.1

