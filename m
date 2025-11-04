Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E3EC31C8A
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F418E10E620;
	Tue,  4 Nov 2025 15:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="KyeHW6Ys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazhn15011023.outbound.protection.outlook.com [52.102.139.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A5F10E622
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:14:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KWPQu2G3zGwdjGvWmqoIZrtd4qT0TLXlePF9T9o6g9RdiMkVUKojKwOeKdTp/cIVw5XYI4ZiXrCCnswyJL8Ox4xndMs7X4OwppwYt2oMRgofy29j1bS4s7HZUibgfWn8Sz+ZL8wTWW8GmVPXeyU4SwdnXODVnNjrM1dbhqFnBsH0Lk2x2jGL+Fqm0KxJGG9iymkMZAZTVfuqfqDdEPENsrnhSycuNL0JKA0EI4MELn6NYkVRka8nZDmu+fiO0dR8x6WCofoiVS0eXlFE79vRLkYINOGQWgIzGGBsL/7CPGY5EeHtAfTXnjKkjT9qV1rlZmpuwAvn7Vv9FKtMuMfHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siv+kXmxcb8PnQx3gbwZ+mAD8sW2XcnEB9yA6ahkSnU=;
 b=nOEteS7JSf0xq/4HzJr3JdgwTcRg45+tFCKwkxID447He52tZt6MA3eYAESv8PmBkfzkTrIjD1sKOBIQ/uJlHEM6LWXmm8XEVJ6FNVfbCXRw6ZziSpZPNMxS6nA6yJ34fdVgx8VKIuXd6yWtxzPmfsJbOqX47vO51Ft8aZ0eeuNDxZPbk+0qaQtqTkVXIJmjaYh0ph5/yMaUw7nRpM1mtcvEsUREw8pReI5KAd5CU5gXfpzuIyysGd/263TEm2v2z+XMFmhN0aaNXkOULOGa/hX3SEOs0IbpyK68LGVFquE2ELiT9Eb3Ps8sJxwPBmSTQdtMVnQopDaOSp0AJRD2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siv+kXmxcb8PnQx3gbwZ+mAD8sW2XcnEB9yA6ahkSnU=;
 b=KyeHW6YsvyJWO0ncmHP5bk0ziWMOsXbjEzEGps7f0fSS00sBa6mbMt2FRzoX2i0ITETEmUpFWf5S5RBdBwWfG7xnf7HRwNzi81EUFf6Tr7lr6kzU9hHrH/Ag2FJ0LvsJPH843zaq7eJZrF/XBaRbHAhfHqijfPQmEOFNYRUFYNc=
Received: from CH2PR11CA0013.namprd11.prod.outlook.com (2603:10b6:610:54::23)
 by CH3PR10MB7233.namprd10.prod.outlook.com (2603:10b6:610:121::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 15:14:50 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::59) by CH2PR11CA0013.outlook.office365.com
 (2603:10b6:610:54::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 15:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 15:14:48 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 09:14:33 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 09:14:32 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 09:14:32 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A4FENHb2142428;
 Tue, 4 Nov 2025 09:14:28 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <tomi.valkeinen@ideasonboard.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <s-jain1@ti.com>
Subject: [PATCH v8 1/2] drm/tidss: Remove max_pclk_khz and min_pclk_khz from
 tidss display features
Date: Tue, 4 Nov 2025 20:44:21 +0530
Message-ID: <20251104151422.307162-2-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104151422.307162-1-s-jain1@ti.com>
References: <20251104151422.307162-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CH3PR10MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: cac18677-2a6f-4341-ccb5-08de1bb4e55b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|34020700016|7416014|376014|82310400026|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PpaUcGBVfe+VSiA8dt0uTRaNjgTq1A6y1wu4U/RXh2cYPqVBMn/tx0pBGpcN?=
 =?us-ascii?Q?qk8KrPoG3nuaHrcGA1Cy63nUnDra2um0024Fcc0S9Lyx9seeUZqDxAXpXnrB?=
 =?us-ascii?Q?i3z3eEikQ0nmYiOF4OQsgjqDfVcWY0VSWEs/f7cvMN9CJnfZB3nbTwHKoL6t?=
 =?us-ascii?Q?CvwR+ZVUV8svJ50N7e3G21E610XyYRLZ1aZv6b99jqq6wDXOrJAdgO1f5dth?=
 =?us-ascii?Q?XVFVIPcKaympb9nsK2vhh5InZCXGj37YvndO/BSlesM8P2cMooZh42ZTbPUe?=
 =?us-ascii?Q?sVbP3S1L1RyT9wn1ojifbdEu7XRcW0zfP6X24QhjtvaE3iGeOjOXEbm2iUGX?=
 =?us-ascii?Q?zU1fpQh0Fo9PjNX4hEosQDSdjegcDtpfdgYhBkilxzXvkaOA14klANlNodn5?=
 =?us-ascii?Q?D7i8KNvHoJrhfrnrjtGKP2zPG47LM+l/Zu1W6pAKvcv1g4dLYJ83tWuHH0cj?=
 =?us-ascii?Q?FNUojG1cXSny54kTIzv6l0MLpwxDkVc90B5O1Nqtz+IQgcCK1FDFqmqSzJgW?=
 =?us-ascii?Q?btdyooAj8XLfiH37iR7V3pIcm5vXk7hNrgiRS45Tj29CFCIfrGc0tviP4w2I?=
 =?us-ascii?Q?hYWB1ra5ryKStXpH5CkaNARjx+N5/hlLGKfocJ6zvM72vSjVmXM+yn0hJ1S+?=
 =?us-ascii?Q?Voh9AdRj9yZVXrzY4sybItO5UM4XU1HyB2WKp/68M1bdxnIi8aUtAhJP1lqE?=
 =?us-ascii?Q?86Uem/YP4BScIVGb7B81EQIZUV7saGM76KiJMs2i8HRY16Wxa2xygBQCNgWt?=
 =?us-ascii?Q?E2siIMttvCXyozUopI37m/0pQql9wE2r/6e2kxpC00hvTfA17gWDk8lvmiQg?=
 =?us-ascii?Q?Ru+NdSEVHVhFTGa4PKCmDl3DcSmjKgipYF2VuKV/9bPumCVq0gW2tWzeiiEg?=
 =?us-ascii?Q?eiNk5pQHeSw95izeQvUeu1EHIOIFszOUYEOmSjkpBKbX3oACU+s3U4cAsLaL?=
 =?us-ascii?Q?oT04T2oufH8VFy2fCVaHP9unKIfY3E4FEoYbNygm0QOp+L8cHj/i/YsBPv5t?=
 =?us-ascii?Q?S+gptkm9lIAEUHZ3dtgkU8q5hL9bTcMwAmKlWPbPVyPNxXvEOeXc+GDf4yyp?=
 =?us-ascii?Q?WRJ/eFFj1A1L8toXhZ+DsE5+xQPes7ks3li48v7fBOdpkRLbbAQwi2lobl/9?=
 =?us-ascii?Q?uejr+cvYG9ZNrI0f7AmAT1toCzbbPoamFEmU49pgtyDAODMrHiJj0squV1bu?=
 =?us-ascii?Q?USaBSV2GtXX48WM/GsFysuoJ4R/p2D5jCrlPxI5lxjr6F38WT/N0CkrIHmSm?=
 =?us-ascii?Q?jXU+Zj8DPz8Ah5OeOzz1cJ1n8UomSt8WA5cu8ZCrSSuUVMgG5+GevbDKSjzL?=
 =?us-ascii?Q?t/CA98zDy1GXFxaUvBlczmqfNZ5FaYU0NHh4OowhCmcH7jGd6MZOy+xPtHaM?=
 =?us-ascii?Q?7Oy1iRQVja2O1I6vA0tZwSVhTOdvIQWHUEM5XOYhudQUhmxQM8EeIM/1RjTX?=
 =?us-ascii?Q?cgHJgGA1jDAJhQKjWzaRyEBmJ/jsx/kJ32UpSyvDgUHOWXLT/7kn2onY/t4q?=
 =?us-ascii?Q?m7pVHBp9V9reOGq39gQKIVfvMuexj/Bcp3kBQrHMnNa8Y6/3rr9NnbEPAwsP?=
 =?us-ascii?Q?e1rA71/Y2RjtipnufrSf2GrrERxqnc3io8e723/X?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(36860700013)(34020700016)(7416014)(376014)(82310400026)(1800799024)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:14:48.8590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac18677-2a6f-4341-ccb5-08de1bb4e55b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7233
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jayesh Choudhary <j-choudhary@ti.com>

The TIDSS hardware does not have independent maximum or minimum pixel
clock limits for each video port. Instead, these limits are determined
by the SoC's clock architecture. Previously, this constraint was
modeled using the 'max_pclk_khz' and 'min_pclk_khz' fields in
'dispc_features', but this approach is static and does not account for
the dynamic behavior of PLLs.

This patch removes the 'max_pclk_khz' and 'min_pclk_khz' fields from
'dispc_features'. The correct way to check if a requested mode's pixel
clock is supported is by using 'clk_round_rate()' in the 'mode_valid()'
hook. If the best frequency match for the mode clock falls within the
supported tolerance, it is approved. TIDSS supports a 5% pixel clock
tolerance, which is now reflected in the validation logic.

This change allows existing DSS-compatible drivers to be reused across
SoCs that only differ in their pixel clock characteristics. The
validation uses 'clk_round_rate()' for each mode, which may introduce
additional delay (about 3.5 ms for 30 modes), but this is generally
negligible. Users desiring faster validation may bypass these calls
selectively, for example, checking only the highest resolution mode,
as shown here[1].

[1]: https://lore.kernel.org/all/20250704094851.182131-3-j-choudhary@ti.com/

Tested-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 86 +++++++++++------------------
 drivers/gpu/drm/tidss/tidss_dispc.h |  3 -
 2 files changed, 31 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index d0b191c470ca..b11880178cba 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -57,12 +57,6 @@ static const u16 tidss_k2g_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_k2g_feats = {
-	.min_pclk_khz = 4375,
-
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 150000,
-	},
-
 	/*
 	 * XXX According TRM the RGB input buffer width up to 2560 should
 	 *     work on 3 taps, but in practice it only works up to 1280.
@@ -145,11 +139,6 @@ static const u16 tidss_am65x_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_am65x_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_OLDI_AM65X] = 165000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -245,11 +234,6 @@ static const u16 tidss_j721e_common_regs[DISPC_COMMON_REG_TABLE_LEN] = {
 };
 
 const struct dispc_features dispc_j721e_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 170000,
-		[DISPC_VP_INTERNAL] = 600000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 2048,
 		.in_width_max_3tap_rgb = 4096,
@@ -316,11 +300,6 @@ const struct dispc_features dispc_j721e_feats = {
 };
 
 const struct dispc_features dispc_am625_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-		[DISPC_VP_INTERNAL] = 170000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -377,15 +356,6 @@ const struct dispc_features dispc_am625_feats = {
 };
 
 const struct dispc_features dispc_am62a7_feats = {
-	/*
-	 * if the code reaches dispc_mode_valid with VP1,
-	 * it should return MODE_BAD.
-	 */
-	.max_pclk_khz = {
-		[DISPC_VP_TIED_OFF] = 0,
-		[DISPC_VP_DPI] = 165000,
-	},
-
 	.scaling = {
 		.in_width_max_5tap_rgb = 1280,
 		.in_width_max_3tap_rgb = 2560,
@@ -442,10 +412,6 @@ const struct dispc_features dispc_am62a7_feats = {
 };
 
 const struct dispc_features dispc_am62l_feats = {
-	.max_pclk_khz = {
-		[DISPC_VP_DPI] = 165000,
-	},
-
 	.subrev = DISPC_AM62L,
 
 	.common = "common",
@@ -1333,33 +1299,54 @@ static void dispc_vp_set_default_color(struct dispc_device *dispc,
 			DISPC_OVR_DEFAULT_COLOR2, (v >> 32) & 0xffff);
 }
 
+/*
+ * Calculate the percentage difference between the requested pixel clock rate
+ * and the effective rate resulting from calculating the clock divider value.
+ */
+unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
+{
+	int r = rate / 100, rr = real_rate / 100;
+
+	return (unsigned int)(abs(((rr - r) * 100) / r));
+}
+
+static inline int check_pixel_clock(struct dispc_device *dispc,
+			     u32 hw_videoport, unsigned long clock)
+{
+	unsigned long round_clock;
+
+	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
+	/*
+	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
+	 * use the same 5% check here.
+	 */
+	if (dispc_pclk_diff(clock, round_clock) > 5)
+		return -EINVAL;
+
+	return 0;
+}
+
 enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
 					 u32 hw_videoport,
 					 const struct drm_display_mode *mode)
 {
 	u32 hsw, hfp, hbp, vsw, vfp, vbp;
 	enum dispc_vp_bus_type bus_type;
-	int max_pclk;
 
 	bus_type = dispc->feat->vp_bus_type[hw_videoport];
 
-	max_pclk = dispc->feat->max_pclk_khz[bus_type];
-
-	if (WARN_ON(max_pclk == 0))
+	if (WARN_ON(bus_type == DISPC_VP_TIED_OFF))
 		return MODE_BAD;
 
-	if (mode->clock < dispc->feat->min_pclk_khz)
-		return MODE_CLOCK_LOW;
-
-	if (mode->clock > max_pclk)
-		return MODE_CLOCK_HIGH;
-
 	if (mode->hdisplay > 4096)
 		return MODE_BAD;
 
 	if (mode->vdisplay > 4096)
 		return MODE_BAD;
 
+	if (check_pixel_clock(dispc, hw_videoport, mode->clock * 1000))
+		return MODE_CLOCK_RANGE;
+
 	/* TODO: add interlace support */
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		return MODE_NO_INTERLACE;
@@ -1423,17 +1410,6 @@ void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport)
 	clk_disable_unprepare(dispc->vp_clk[hw_videoport]);
 }
 
-/*
- * Calculate the percentage difference between the requested pixel clock rate
- * and the effective rate resulting from calculating the clock divider value.
- */
-unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
-{
-	int r = rate / 100, rr = real_rate / 100;
-
-	return (unsigned int)(abs(((rr - r) * 100) / r));
-}
-
 int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
 			  unsigned long rate)
 {
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 60c1b400eb89..42279312dcc1 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -77,9 +77,6 @@ enum dispc_dss_subrevision {
 };
 
 struct dispc_features {
-	int min_pclk_khz;
-	int max_pclk_khz[DISPC_VP_MAX_BUS_TYPE];
-
 	struct dispc_features_scaling scaling;
 
 	enum dispc_dss_subrevision subrev;
