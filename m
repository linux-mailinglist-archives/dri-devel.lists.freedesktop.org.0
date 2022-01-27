Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816B49E190
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 12:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDF010E15A;
	Thu, 27 Jan 2022 11:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01on2129.outbound.protection.outlook.com [40.107.23.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD24510E15A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 11:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHFwsQRqQ1yFKeaeOaLHU/FGWgBHmfcw4pMuLNxY9T+x4EyCA6F9my4/nhxD0vOxaOi8asDPin0+5/UZNCckAa4+6OZ7FG3kGFiJykPUE8Vp5J6tO5JyXijNCatWAZbZXBpnK1YVpX366fTvrmkvFOsV1x65SpsHX/pQq0hld0A0NlCOxQxRCJHSUP3N4pVDhT1lxACmor3v3mNAGZ94ragzADkro1AwbCPJ0O/TZr1OcOxycFwimzYadVAFeqzNd+0loUW8xv2Mxh0ErF+H3d1SU8IOzRbvzp8hrX2OSvdhXWCdUt1wmIkR7yyg0DYd/HwwLSVCEoYsV/KoiiCBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QMWcJG1tGgBd7UT22liNGkcKRbCjH93vZQsNe6hiC8=;
 b=T02OUXIs92lcWOAjQtBaELK76GsUBBEtou5gNHmAah32zy5amGNp4kSNzUgqnFKSIMMkTmFkOzAcrBYZcyUdfomfymfmHs1Snj/TnJkqOk10OH++WvBhcM23bNv8W2n/BS46qq4iJ+ztO6F86RM2YLn7+7J8+MmHWQTQ0A341L+o9bnbe9ILNjq/fYezT4DsTsOoyg9bDqlHD/cJMKl7uC1GjHZy88LCKAMyp0JBxV/X8lWLA4upNgchhha4xsc/IzC0xpR+/F01IA6STfF68CrjQIX8hPxxF/Hievz/GF1dDqXwtg8phZvLiUdI3bqjYfRmgbtXBJU5owsXKsJ2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QMWcJG1tGgBd7UT22liNGkcKRbCjH93vZQsNe6hiC8=;
 b=pJaRmm/vBGSyLufBI/TqloYtPr7qFRXrt2XlK70YyzaAvZ+u1MwCbosFsIzqQPI0sVadhL2ZjnkQOuR9OLxivRNE52OIN77ejKSahtfHVQdHY0+gpQfPpq6101ggNT7fwfV5LnUmqSjYM8ZfRSputzWR5p90sGFCHu5OAO/YY8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:42::9) by
 ZR0P278MB0380.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:35::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.17; Thu, 27 Jan 2022 11:48:13 +0000
Received: from GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM
 ([fe80::bc7a:d19a:3cbe:30c5]) by GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM
 ([fe80::bc7a:d19a:3cbe:30c5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 11:48:13 +0000
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panel: simple: Tune timing for ET057090DHU
Date: Thu, 27 Jan 2022 12:48:10 +0100
Message-Id: <20220127114810.319121-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVAP278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:20::27) To GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:42::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b715b269-4e4a-46fb-bde6-08d9e18ae62d
X-MS-TrafficTypeDiagnostic: ZR0P278MB0380:EE_
X-Microsoft-Antispam-PRVS: <ZR0P278MB0380227C6644002A1C2BEEC5E2219@ZR0P278MB0380.CHEP278.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuY+JUPCkA4d7pUrtJWnr8W247Pivht7iEnhdcDQOleJrqXivMG7l7/ZMoJQCRLsXFNqcQBO/oHzeIoVIbLitBgDN16qFx0s+FFJYV0CaoeW7XnFwGE9IkgeWDjwhE098KZibnKP5q7EoQEPCTooAxwUNn746xmNhxjDenv/wpnXjHkV7DmJ+4E/cdWGov5rxhruvAL6owK676j/csQhtPj0mcuD4zO2GkJ14M7/ISR+SqNe5kjBEtgFIgIU7VLDmgNUBGDPq/VOF4u+c19gfDJaFs6Ej9qeORhFjTn8tB8y017DkedeIEPlTjjn5IPCpvA3fV800sr9/xWQXa19QPzK1J+nlKvJBSP9KCi9yoZKLPgEHqxbgDRxyUQlMfqHJA2UtJgqy8ZUZeZoqM+lX0YXP3ebyRcux5EKS+pR9gtOyEvuHrp5ijnDHOw3/q+gi8g5H8x9UVc54jrTIhOYCh9b6QOEPn9Jnb8DRQvPP5/yTwOiUyiGP7Pwh5LTeRQTwVVv4z+OCN2UPnrWrlNQb6h1e0CiAGCJNSqjiYQUJc/hbIeHDM9G0iWQoXV0qI4DsmRu34KjRgB6UyUjCWcDjO+9I+gHhmQ+tszXPJBtaClheEgdW/h2VhbI0tkv4BJ6oWOo9A8hIFCv+LSmST0MGmmWg49mt72XF+IqThSg68kR9v/VvpI5q6a3tYUdBPPLzsugnUaoY9KJ3cK2dtryhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(38100700002)(186003)(1076003)(38350700002)(36756003)(26005)(107886003)(52116002)(6506007)(44832011)(2616005)(2906002)(6486002)(83380400001)(66946007)(66556008)(4326008)(8676002)(66476007)(8936002)(508600001)(54906003)(110136005)(5660300002)(6512007)(86362001)(316002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tt2d5UC0DniFGVEVkLI9z43gDQZnknkWPkh6PHijWBhh764ev2oKQcrtzu2/?=
 =?us-ascii?Q?wJvdjg857GNNBG1OjWhcOPzEMveyTVnWlJIvFCHCMa/viX0R+AwiOAHXYlLQ?=
 =?us-ascii?Q?KG5QDrbjogNIYc79K0naOHXPRcxXCodqRYnigi5gWZqYfvXjfCRgrZRKk+Oj?=
 =?us-ascii?Q?nZb3QOgPgZtWaBHbU3JelYurPjroZ38pT3IbYVQ1DBB9n9FykdSDa8OtNIzM?=
 =?us-ascii?Q?Bd+hIESRmxTXpMZ1ThPDVDgItLS+x/XHzGaEU/7e1RjqmeKnwvWKpXTN8pG1?=
 =?us-ascii?Q?7idwfFvn9ZAgU8ZApQRaz993CM2kRoDirMXWmM+vfiXiEwcM2rKfZ2Kt0zo1?=
 =?us-ascii?Q?JuG1viGtjq8CIuCN8hebVyX4ZHxMSwjH9TZty/8mV+qp+9jeSqw/Wax38aqs?=
 =?us-ascii?Q?6P3K5GZ+AWLN94QzXqf8y+Z6nd94IZfX5decimyEJDZWLU3Y5gemCgCwiVh+?=
 =?us-ascii?Q?UI97ZqLEJtYj9a8vX/FjMbgfgvtrTqR+K9uKo+/NnmxdVVsOgTkG52ipg5vE?=
 =?us-ascii?Q?0wLPNCwSObFBu00kDpEO9TlsQwB9D5f5/c7YV7/WHRUgXCMKK1mEAvAeW36r?=
 =?us-ascii?Q?Ggqld1fsz5USfBhThfGlyOQz+R/1vHGS4lFO0WmDmwFiq/HdSpV1j2JN33Fz?=
 =?us-ascii?Q?u8SM44HR50XBeAmYT7xAWafJ8htdlGKeYMAcTVFdA+B507b8RHMdxOamXvgy?=
 =?us-ascii?Q?c9gZc6Mcl1yXN4Ns2pMPw7Gpew/jcnfslyo/h88MiojoywbHA1eN13ZrW5E6?=
 =?us-ascii?Q?c/O6alMYfEAo1hUw++biTdwGPCBItqbEbEQoBZvhiejehaU5LndOcsCEdwDC?=
 =?us-ascii?Q?MpBnUF+jkWogUWi2Qhd2T6Dd6RA3b0yf4cham5pyC2Lxjf2OOApx/3dcadw8?=
 =?us-ascii?Q?ZWG9aXstzlbSFkXU8wx0Ynze+6/l/Ge1empbc1y7/DHe1f62IEvBJMw+ZaC8?=
 =?us-ascii?Q?wV6Scmv4eA/w5tty/aj3e85b/zNnwb3DebTqg3n9piiUArGEZxzk/dLcyib1?=
 =?us-ascii?Q?vcPKde2DZnm0UPizBT6hqWf9VDf3Jh1rrqRnXM7xq997O4Sl2M/YTSsN5+Jm?=
 =?us-ascii?Q?n//QPZJxlfq4RuFD+JwGsbij3PBYBFElytDoduXkMz92v+nwc0iqER8uDMds?=
 =?us-ascii?Q?GJFTCrDxYFVC3ClIaDgqE9NUd0vC2mTJ95SOm0VhsmjoSPEyO9usixwTW7MW?=
 =?us-ascii?Q?kRSGnTQRPVQj1b7gqo9E9lEknAG5rbA8u0ExF//YTxu2K9crVzHTVSlPEmQN?=
 =?us-ascii?Q?MvUXE0BHOY3cCuqp6UPqqYrQ+e92MnEW40IJjyiejuGhYL945g/f64/t77Zv?=
 =?us-ascii?Q?l37RBp4ZV4xeCvlEpmv4eRL/uPzwRAZfC0L0th4qKGDHHsu+Xe0cG9nl7YLF?=
 =?us-ascii?Q?VCUFgY82eZqsUiniM3gpd6r723bw/ycYU2RgCan0khXQPDSqRv7KJpT/otXO?=
 =?us-ascii?Q?SDXPosIS+KJMpAbUqaquHDjddi8cxgp630ttHMTpLcjT/7Mu5fxQ5E98TGPO?=
 =?us-ascii?Q?ArVD/TFVWTx20ZMeJE+YLCi15UXsk4H3vYbxWOg0AMxWhe7YDjlg0YxSGq+O?=
 =?us-ascii?Q?419rnXurOQxXZVmX9KPmt+e8wejk2KXxc6IsK8UU/CXLIoq9O/Mv+1YpUTXW?=
 =?us-ascii?Q?K69flIiAFIxZgdh6BiXuU1WQzDXP892L7eMAyGT5n7u64teQAGGLYaCKzWT0?=
 =?us-ascii?Q?A3TUGQ=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b715b269-4e4a-46fb-bde6-08d9e18ae62d
X-MS-Exchange-CrossTenant-AuthSource: GV0P278MB0655.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 11:48:13.3754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCJ6SfUcImO4cvJSNvkOzmgoTu3x7Ojv6QdWyUMLKLLGlLDe8MJraFdRt5Z5j8jhaeNVtxdwmcYcEy24Sj10wNaRSN55GXfw/EziCHxFyIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0380
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
v2: removed stale vrefresh field
---
 drivers/gpu/drm/panel/panel-simple.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0c8786ebffd1..52e936dd2d6f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1598,12 +1598,12 @@ static const struct drm_display_mode edt_et057090dhu_mode = {
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
 	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
 };
 
-- 
2.25.1

