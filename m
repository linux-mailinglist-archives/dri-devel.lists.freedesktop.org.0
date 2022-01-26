Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B149DCC3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 09:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD02410E929;
	Thu, 27 Jan 2022 08:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01on2097.outbound.protection.outlook.com [40.107.24.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25FD10E2F3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 16:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO7fDMWYZMDsWS+JHIsd6U5QVS+weg5aD4wM+hDGy2T7xV5laG5LOlWXJYRu4wx7XwFg46zmn5qLFNhI2XBmNczVKLtdVHFLLFooB6UKm5u0Qte0iyopSbontswik3f5nq+PGYXGBGq9OUh/zev/zRea9QhZmeAPaSqhCZHKBefqmK4YUvD6jW3zdvetGExDPWIBb7GoTJ90gV8m5CQUafAU8GAGaFCPWSsmwZAM2yQHmYPs5Dkv29LSj973tlrY+G3QlcEm7Ou7aVG8l28KAZZfJiLZuN5EE0aYLkmnAy6r2SyjP40BRHDQhJ8ZAAe7NddwrlOLMqMsinvsxMriBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4W6z/w5SpIlyru/HK3/DpQfVuFsiJd7PNzp4/qTP4U=;
 b=RgkdmiQajXowcwu8vyyOklVHsfgFOEsJcPQGre6v2iUnay5rfUu2tXLhQ9x4XPAC7NIV1zkBK+cjlr3rh0uSHPBcv3E/Cru7bBFkiYl/PuEJ0gAh2nBZsmQFUc0AE6juHq5y35zyYrzSiwDgWw6xfIYLzK1T3aKvNPgh0Yj9MDPWlFGHaCh6ZYKHHyBnBiy2Cs3a6es8076+gElt+JfjtbDVJLsUsXmdfP2I0EZqyAcq6eZPw29+UgLpDP3n1m8I4B+A3nl/YxtVWsmM4QCozzYyzgvPj63LjxdBwwP5BSmWz1iXvFsz+RDzdbREjx+ZybmO0B+G7f3dwGDRFmuivA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4W6z/w5SpIlyru/HK3/DpQfVuFsiJd7PNzp4/qTP4U=;
 b=GazE3nq23yviAHHr4nSUttOMFdYXXrS4Y+SVemiMUSzXhjjRi19sb2+cHdWMCqe8EZmDYacCG/45UX+9Ipth1Z0cCku56pfGC0PXWl3l+Z3jr7sQ/Ib8DEGMZzMHkEO7tKSM4ZRWsM0HmALuUAcbEkqFTfqIT10J/23D0QKlCY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3d::11)
 by ZRAP278MB0580.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 26 Jan
 2022 16:55:09 +0000
Received: from ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d837:7398:e400:25f0]) by ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 ([fe80::d837:7398:e400:25f0%2]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 16:55:08 +0000
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/panel: simple: Tune timing for ET057090DHU
Date: Wed, 26 Jan 2022 17:55:06 +0100
Message-Id: <20220126165506.222331-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVAP278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:20::17) To ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:3d::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0d44c42-fa61-4d68-6d4c-08d9e0ec9c44
X-MS-TrafficTypeDiagnostic: ZRAP278MB0580:EE_
X-Microsoft-Antispam-PRVS: <ZRAP278MB0580EB725BBD4EA3DE7239D5E2209@ZRAP278MB0580.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwClk7gHrHUO8NkoiG6XOtg5PDjJQ7c74vnjtFDuNDSo3zn3oadJ+sPhVMxjM6T12jejwo3JZdtpmHie0NhMA9burRjniMUGWxxP8VF/VL75ac/dJEnODSt0aq1ZcX6AYICnq4z2qFap9h+UpWOGkDCO/n4flnujhY4fuLrn8amhyFULjBOQwkXk7Mb5GJfCeVq0AHcWJySYhEdXKJqUUyLzpl+LtdglkoO5V9F42OY16UfIUI84+7nb/E0kIxdhJTKqBbDKNks14dN12EREXnN1UYn//gr7vJ+L2Vv7gKNaLAmhnEsEPMCWiufjOzg4liLoVgzXb985Y8urCo/PVU8VGlrmcuyy1E/ifGpazXhcMEVw2IN9tlvIlPaJSgC/n3PMDMCLS2rEAbYtHAkWS5XbBh0qIdpWTofvmS57Cdi+6i9/sJ5vmqvErbp+j/0aSplKs3yNJRcHULBsrZLhWmusfvA05Qs2xyiPtT6qf21aGvZ57PJwr83i+vfAB/suKSvdq+jJaOKqCGLYk0ZujUe63Tbtw3sUVJSJRywhR9UVcHJMs4j9m9qH1UVzK+jXIFEjIsEdPfOwkrmPxn6KrZ185JW0aGrd1mNbS5hNHtc9Hj/AvSBMq//pWKeuKbb2y2wn5Q6Zo6IpoXYT7YFsKg14FOWAYIu1qMJ0tXIqwCnUZvCaasXhafyjILu5eGiPXKSGx4c+XNxUE95JT3Lg6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(66476007)(83380400001)(54906003)(66946007)(38350700002)(86362001)(508600001)(66556008)(110136005)(36756003)(316002)(5660300002)(6506007)(6512007)(4326008)(26005)(38100700002)(1076003)(6486002)(52116002)(107886003)(8936002)(44832011)(2616005)(8676002)(2906002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qk34Qucz8T1eoBhGpMYLwhDnC+1JMejYrYwSY77m9JrbxzaycLb8kar7ClcK?=
 =?us-ascii?Q?SGBIA+GZGwT4bcj/s9ny0taHz2dSU7rB/sZxqjfm4M1XYQpQxzO9AQyYkLK8?=
 =?us-ascii?Q?/ecXR4J8CpMrMbQF07kCiiyRmCU2G7OcH83d7n/Miqo7kzeurKPbXHKgh3Aq?=
 =?us-ascii?Q?4Ik/38xniSgfqEj7JUCDEgBAfH0/qsh7bBNZUVg+/TGSdQy5c3F6uQP1A2d+?=
 =?us-ascii?Q?dvJhlsBH9hqUHwYVysbkAfi/uk1kgLKjub5G+Bzqq8Jyh5r7QLIpYVKNAqWf?=
 =?us-ascii?Q?D3xYk2haeuFDVDgDbKo48eycvN6Fz0MxmPqfdspgpVxxzyhM7HG1K5u/j26c?=
 =?us-ascii?Q?PvD7sT1wg9cqKYJXijckYQ0P4DFPUDaoBaamALUV4QH8bw31lPeSnq2bwPeY?=
 =?us-ascii?Q?cAeDE0xUl/WjDzYRieFzlC8u00j3722ziQxmbMuRT8W/VEDCfcTaCmcsN8EW?=
 =?us-ascii?Q?AgJkTSBPPrcnAw2KFnbaTTVSjysYN9DmBP98CDgK6Et81/jUQghkRAJuiH4k?=
 =?us-ascii?Q?yqCTdHAWpoBduGfjrD1rD/A+kW25vm4LbnZsJPS9/74gBjxFLCftbnXxIKdp?=
 =?us-ascii?Q?KSXW1SRZKIFXvM3lhphHVglbsZ1SbQZzZj47gj9rRWNQRgz/5SssIpshO87B?=
 =?us-ascii?Q?aIrp6jd1IuWMvi+gPGxOQJzB98sIT7gEMsv+NFYTxp3j4aYutZ7hONGWbAex?=
 =?us-ascii?Q?hVjDLthvjzlWL81ElmeoHlocfRZFsAEEusbZFY7OP5SQ4hd+Gon3sE7O7rDD?=
 =?us-ascii?Q?TGf7PzNBR9/xKUStwpYREAkipTdDZWegWt0zh39TUCzjGjMCMF/NOodlwmsd?=
 =?us-ascii?Q?sRkgJuFDkmXieHWm1SeBu0eVMDxHyMKdqj7Wj55OtkLOATXUybLYBTjJtAb0?=
 =?us-ascii?Q?EqwkNlmfo+ImN7mkNAcq2OY8enw8qsDB8culOVe3XUqEKH1Wax8W4SX85Nck?=
 =?us-ascii?Q?E3YRQs6UGja+B4BtrgCIBQYC09fIckaizBEA/C90v2PhZOxXEYkyTiaAh8qv?=
 =?us-ascii?Q?njRZNxZuMdUOcXP+QIDf+5B+5tg8SVxVnt0z6pyfLcwJBvYm68DCxS3CkmnR?=
 =?us-ascii?Q?CuJzX9a3odOoDTwTJVzFSCsbrjm9A24u8L+q0jM238P6/gcgxy9CCo0MdbGn?=
 =?us-ascii?Q?jrmWc4T481KIxy1XT/BYbWI9PJqYT/Q9D0IJaj2HxdyYXis/G5kPmsN0hpmW?=
 =?us-ascii?Q?7TcGJjtg4nEKe9BggzoDqfmLy6OUMTiJrcG98QLF0q/lIfL2yWOqSNpTe06f?=
 =?us-ascii?Q?RKO0jlzwQLUrVLQnv+qZz6JU0kRjE6nBo/FrArkWGz/Jc+iiUw9vmo3WUP9j?=
 =?us-ascii?Q?MiUDaS87JPhCTGodv32ndBfiIb6N3xNPyksHlfcXFIt6TH/4i0P8P4bKy3Rm?=
 =?us-ascii?Q?MlcUeMOK34RN5eKdTcH9knZBamrrPuf889KZpmin2H3SsUjMwB0bLbyTGalD?=
 =?us-ascii?Q?1pdRgTLUSZ7LWgkj7Y2eTXoxm31Ln1y2p63NkWYKJjuHajKJ1mdNiZli0Oov?=
 =?us-ascii?Q?nNClHhT+3sVxV3pJD/H6V1hQPZWcd2/J275d5/tsffiGKftKcHj1ymPLxO5B?=
 =?us-ascii?Q?/ok2SDMiE2ouwaGnK7jTbBJXeJA+tqigmFzPEisXhJQ5CMnb6cpOdJFj5vh+?=
 =?us-ascii?Q?yK6TSIn/Oa4Ue3/V/Ge2e/fSbHTy+j4910UoE4M20pR16QNIFDt7cXVzy/i9?=
 =?us-ascii?Q?8Zgvhw=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d44c42-fa61-4d68-6d4c-08d9e0ec9c44
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0642.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:55:08.9225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VyQ1QtZCCg5Isjccr6aS1gYf3rXxi5nGValqxzBc9ji1QgwMU2nrjJuv0Dd/oSGXmg0l73IGe+kciO58zBrYukUDFdEK4if3PtYftQhJkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0580
X-Mailman-Approved-At: Thu, 27 Jan 2022 08:44:34 +0000
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
Cc: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

VESA Display Monitor Timing v1.13 has recommendations for the historical
VGA mode 640x480 60Hz. These parameters are compatible with EDT
ET057090DHU recommended timings.

Use VESA DMT timing parameters for EDT ET057090DHU panel.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e46db5e359c..c11427f94ac5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1598,12 +1598,13 @@ static const struct drm_display_mode edt_et057090dhu_mode = {
 	.clock = 25175,
 	.hdisplay = 640,
 	.hsync_start = 640 + 16,
-	.hsync_end = 640 + 16 + 30,
-	.htotal = 640 + 16 + 30 + 114,
+	.hsync_end = 640 + 16 + 48,
+	.htotal = 640 + 16 + 48 + 96,
 	.vdisplay = 480,
 	.vsync_start = 480 + 10,
-	.vsync_end = 480 + 10 + 3,
-	.vtotal = 480 + 10 + 3 + 32,
+	.vsync_end = 480 + 10 + 2,
+	.vtotal = 480 + 10 + 2 + 33,
+	.vrefresh = 60,
 	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
 
-- 
2.25.1

