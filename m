Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB65455335
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 04:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C8D6E25B;
	Thu, 18 Nov 2021 03:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2106.outbound.protection.outlook.com [40.107.243.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625BB6E243
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 03:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpOsJaXiyUO4AlGgU0jxar2NpiKyUI/YbmeAl6hQprsK8Pt9bYAG+BMkj2KzaUqlyxXH6eFCxbvb+kJ/JA3/AaJigMvaVeBbf+miJ9sZOr1+9G98LZiKTneBrwjvaGq0fWYqPbN8dHgxP/c7ZDXW/iuVQNsdXuVlpMCD2yF1yz2vjTbclJlmTWu1mtH83Ey2d/tblkNbiHOgRADCS7Na/tYO619EDZc0qQ9FhD/VZbqarEoPsDbUd19RhfSRvcovbEvdFIQCgWxDdZr4O+4SeNMl6oxLl2XjE+kUi+rqIREp02G1zpEJyTNC5y3DwKZ/47lJ/uyGcz2o57CnZIzYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGgQ4eVZy1XXCtze9igLJSqpF3XlLiJRqfbzrTAN+Zc=;
 b=LApnJ1OfCzP3h0I7H5HOVABkJbneAg3Aj/aqmPJGVdMkvu8x1bGWpUbLfPYnT4R7uG2lkpgHKEkQsb0N3gjiw4w4Oc64yM+/E2U93jNWt1u+KLWeesoC6JzC4KKdkTR5k31QiFQ1Hng9y1cg05ZetAhA29gEMi4XV2WzCN6k93yrk3r685IJtnKLLnpatfS8wMTl784u1bpSAO66YwnsEfZXNConzcXrHRDt87aOctN6rF1M4oHB0oWrymOLHeg6+2QdGw4+ISbppxRviaU1pFta6aFL8tVyIcNrtO4sElI6qnok9laLgRebDPjcMIj4n/5n0evqyJTuddVG/fE9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGgQ4eVZy1XXCtze9igLJSqpF3XlLiJRqfbzrTAN+Zc=;
 b=3/k68S8x1a9SbUaedgANMY+7Ea/vO1RJH5umvQnqx25bglmpm4j5xd+cjREsunkCjMovuw9KTgo6Z/2u44SwNsda+O94nQfDElYzrsXye95xbUwjTi7DPdJLN/59JUhuXvNynrfNuKZlIAps/lRC6gTEH7aURd6Eblu7QLJz0/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6788.namprd04.prod.outlook.com (2603:10b6:a03:219::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 03:11:41 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4713.021; Thu, 18 Nov 2021
 03:11:41 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH] drm/bridge: anx7625: Check GPIO description to avoid crash
Date: Thu, 18 Nov 2021 11:11:25 +0800
Message-Id: <20211118031125.3778969-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:202:16::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 03:11:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91070a6a-8400-4b24-40b1-08d9aa41244e
X-MS-TrafficTypeDiagnostic: BY5PR04MB6788:
X-Microsoft-Antispam-PRVS: <BY5PR04MB678873E0B43A8A1676422E0AC79B9@BY5PR04MB6788.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kbgI7JY7BGSZLzddqUBQXtJu3Cr7Ran21tznQbGr3rQXykE3avNNBsdt2u1lSBxLAi/5X9jz+hCaBrrJDCqrdewNRUNKgoVMEfrKJtO8NcVPJS4SYOqB9TfmlHJOgNrAgaiOYBDw2kwH4pEVMvVhpEcrcIxdAJqOLWHUzYuF9g3kbGSXUFREsf9PwPQnvakaC4bPfYpp/KNCf4sBN3SYuZCtOHpMBx1wqVpUPDLma3ugmx5OZABT8zkRSAfLa1o5pPR0042ufPRy79xAyIl9Hk8Tbg+X7p9kOM9cJXKffiVcLGZUbSKCNPHg64iAaw0lf0Qwklhe2094uvLKh5cf+/14pKMThiG7yt8BC7riu6YAL00rkBEj6r96xutpjrFAbWkDlGcJYhLY1Wx8kGPm5QdrCrnQ//GKdQ043oWHjWXg0zm7632T8u48mRBVNMttkBn2h45DPfMl/+i1Tj6KoMwTYqs+3JVZQmIku2glO6mAEQfI4/pvjmOqqLkc0b4jt8M/Gk9VtuBZkawV47iNuY++uXXqdHnrI0k+C+3CP3C7SguWc/QGGCqkbvwBlmHF/mZMclBoAsOT0dC1ZBcpdVztdhz8Z0FItiq8fAE5r47uZq69ZMrk6IJjH0E0JVLYzu2FkvyxctbsOyxbxMWWnI1lALihryjNmKVF0t0J+Qxi6eJ8iz6xc+SEdukMISzcB53X/Qq6gqkD+xW78CIoApfslO+9fiesRodIULEh/aA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52116002)(36756003)(8676002)(6636002)(8936002)(26005)(186003)(6496006)(4326008)(508600001)(316002)(86362001)(55236004)(2906002)(5660300002)(2616005)(921005)(38100700002)(956004)(38350700002)(1076003)(6486002)(107886003)(66946007)(66556008)(7416002)(6666004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gRRzy0Nb1m2z1pun1824szfRS1/aTS55hqBG/CINDFIFEMUtVEvzImqXDIoc?=
 =?us-ascii?Q?JCuxt9oO74fDv3DjrbHmL/VqL1C70PGTCvQBxux9T5WJe8ES30pFms3QCBz8?=
 =?us-ascii?Q?4gDegxlbYLuE+VbsQp3gGJuLaAcL0e5VDJwmB3rHPaeHzotRVdD31agfTrrh?=
 =?us-ascii?Q?jxru8jtMa1y1V+neLNadOlwM5VSQRVOcd+lQ3QVbr+hpohn1XQBL4GKY85Kq?=
 =?us-ascii?Q?KOfyvs1lsy39A7RrYtzUfzhY5PEmESrehgRUGAtpS63BxOds/DJoVIQR8slj?=
 =?us-ascii?Q?aNbEYUgIOXxbRjmZLWWc2WVlpP9dQlCr8o0pSydWJn2Y0VfNNpc4cSUpnq4c?=
 =?us-ascii?Q?FxG4ZPzarwoU96iaIDhNljZ3+ccU3zYxFfSSx35FU8HF2i1LZ+B9KAPjEJth?=
 =?us-ascii?Q?pJglYG6abnvE4vW+88XxOKDkRA7N6IPS6QxlEYfO+73wQ/aMGDGjOPUbeizg?=
 =?us-ascii?Q?hpneiA6wHwXVrY3zT1ULyTiZi1O5ZuSIIvy0EuimKGd1vwS8zI3SUF0Njyd9?=
 =?us-ascii?Q?4u1mlk4O6rlZhL1HXCCW+ayKsXiSfdQCFOb4jwGN+M9hTuZaz1665hRFz6uI?=
 =?us-ascii?Q?LNdiHFgi8bbeJgalKqn7bdrU0uRwORasAx6Z9jlFQ3BgE1TfL5TQ7OgRgC7O?=
 =?us-ascii?Q?4pPo3/H0nfq+qiqnz8hip/LvLQYO9NyPs1w/d23manWUQJueSdbCkZ54JW74?=
 =?us-ascii?Q?lNmLVDuybIY6aPHOwOOGfLyNUy8W0ZdHu3Fo+mORUmCsfe9S5ndqAFBiy0S1?=
 =?us-ascii?Q?PjTINEnyC5oQK09FxokdTE558J4oObYtEZngz89lNUOJ0zBjddNsA9fxeuH4?=
 =?us-ascii?Q?h2iXlwEQb+zi4VvZXf+FHaolty157drsuWpeLqCT1tNYpyAna77b35QPiUD/?=
 =?us-ascii?Q?jjuVf63IdwIO3APeRoLw2RgddNMZvD15bQMM0Egus1ORGAywcbEKXh7Blh7V?=
 =?us-ascii?Q?bDQQjAVZjtM4LC7uYs7tplfj3aL6uZfwmQqNf6IXlIAdzyhTvQJj1ZfAPnzD?=
 =?us-ascii?Q?0wrEEYCZq65gGZFNMN/7CjzgVhgE1TQY2n1I3jtZDqj/E1rLEw/B6NKJqa2G?=
 =?us-ascii?Q?BMjTtG4ni1VIPAp4d2pk9LhqruBgwPPJ758k7J8wNh4qeyrxMw7CdYWq1I0R?=
 =?us-ascii?Q?GBuVJY03AfJKMR104RwgY3fknXN8IvN29iTNJ0+eD1F3NxAno9yQcIJTQkeS?=
 =?us-ascii?Q?yoId2vRH+XNsm/w2C6bmYKVJx/YV0Z9wwoP0jVcUnv4ykzZXw7/tzjXNvEcQ?=
 =?us-ascii?Q?6aWPiQIFnRayq0RvOZ7zvCVkS1ufJXeo38+o6q/i8yvqt6ESM16esRQcrS6V?=
 =?us-ascii?Q?e6TOj8E3eVqianbp1H1P4l3mK5WsDkXyhVrO34lwWqdN9aC2/uW40neZjgH3?=
 =?us-ascii?Q?coIstQrxElTGMz0TvtFylv9PbSW9KLyqOFJOTYyUtco5dmViZfxJbF0cvfl4?=
 =?us-ascii?Q?0rqihHvrUToiOC1Up+l+zUBlDCCmovSJ/na9x+Py1sowbATi78c5XS+Fk4NQ?=
 =?us-ascii?Q?PvmU/bUIHPb/gvw1+uM579SAQPIzF2ulTKXLSTJzjFbZnhHlLKSdTtpnJzmE?=
 =?us-ascii?Q?dlqq2jusVQdKg/KieuiROnIExYnlXkArTzAYyuNPTFVFHPddy8k0SDiEv3IQ?=
 =?us-ascii?Q?833vo8V8VAI0Gnts+fOk8TE=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91070a6a-8400-4b24-40b1-08d9aa41244e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 03:11:41.1297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYCHWFCW7guMtAo7G6ol2fQ8taL5PE99mkOifBuaSsDjvei79Z4be8BWM+cnmojvvhz2dGV8MrmxIM6ghUWYKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6788
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

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 001fb39d9919..36e0ae5a1c7b 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1098,9 +1098,18 @@ static void anx7625_init_gpio(struct anx7625_data *platform)
 	/* Gpio for chip power enable */
 	platform->pdata.gpio_p_on =
 		devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(platform->pdata.gpio_p_on)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no enable gpio found\n");
+		platform->pdata.gpio_p_on = NULL;
+	}
+
 	/* Gpio for chip reset */
 	platform->pdata.gpio_reset =
 		devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(platform->pdata.gpio_reset)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "no reset gpio found\n");
+		platform->pdata.gpio_p_on = NULL;
+	}
 
 	if (platform->pdata.gpio_p_on && platform->pdata.gpio_reset) {
 		platform->pdata.low_power_mode = 1;
-- 
2.25.1

