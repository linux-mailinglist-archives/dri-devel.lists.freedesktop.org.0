Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBC0957638
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BFE10E3EF;
	Mon, 19 Aug 2024 20:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X9T7QGnp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A132C10E3DD;
 Mon, 19 Aug 2024 20:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xl0OJYOfLE6vxbeNdepbLJKO1W0fI0b48wf3GOpUyL6NLITl+v7/RkVhE5V6qXSE1vT25WtTZaIaq5bFkNxO6N4KuRmuxLCYtlltJ1hZ6CqtXbleWPA1EsHVeHRbMNSSPPyKCQa4oEyOlnt5P1Z63NlOgJwhLtYLg/c5hwkbriQIdT6JTY9KOh+TowtxSMzko9LiGoimvbecYRwQTdEmR8iliXCf+rYHPza/+vGCln/UJ+m//HpavK1/vz7VL8xpDp81ueCi8KCUu1bau8WJ8HiuUaGWXy0V6pBqu1jUwuM68EicszcWqHW2CDPxclEaPFiByp6OLd8VffOSf1lTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4np/lKk3LvBeXQ7AZFD90j+hugZPnnpPxazpBvj7hw=;
 b=UIHrhU+LFnRy8IUxshEVdt3lNY+txD+cC5vixkU6n6+K1U4zCD3DV7ItuPML7EneExzmpElfUyoh+jT3U6T3IxhiQjdTJUgUgUYCS7QSuRaw4nflERkBjERFkpreRpp76aMcVfwh4fqH52j/R+lurMLhtUJNfABXWmSc5kDcGYyifu7RJMpPMqHJI2vmhWE9RTry2lvjLPWfb1YLPgC5PAcoOIsVt8UJ1TO81XWRRatlfFvjOYt7NbJn5JIcxnau9Oy95dyYSz8i1SinjRCRyMzbWC+FgbutYoTmkS5gg5l6UsyWB1WNpB3LigX6r5UncG8I/Y2JjTo/ZjS1zn3Plg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4np/lKk3LvBeXQ7AZFD90j+hugZPnnpPxazpBvj7hw=;
 b=X9T7QGnpPtJrtCs9FULWKTyBXitoRjJGOr9Tm9xUe6nJQUiw4bngMNZBowTsLqGgeclwt9PsGJaSIbx4+obFXBgId6hX/kP8u5a94iRmm2xpjC2FI4SmuH5LiXuf0aH64vuGmuOVUEvJY6cQNR6GoZBU3Yb7zaSUIoAJsQwLzOw=
Received: from BN9PR03CA0534.namprd03.prod.outlook.com (2603:10b6:408:131::29)
 by DS7PR12MB5957.namprd12.prod.outlook.com (2603:10b6:8:7c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:41 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::7d) by BN9PR03CA0534.outlook.office365.com
 (2603:10b6:408:131::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:39 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:39 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 32/44] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Mon, 19 Aug 2024 16:56:59 -0400
Message-ID: <20240819205714.316380-33-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|DS7PR12MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: b110eb70-def2-4ee9-633a-08dcc091908e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X8dVtJLkj8aPyOKizaMS/jgquiS2kRLZCUFYHMgbUnqK5JxoDRkLccyYLbqV?=
 =?us-ascii?Q?e+Xuq7dcSL5LAwRrZDBkXIUMmlKu6PvyiSDaOGqpGfappnNNcaIChLds55gB?=
 =?us-ascii?Q?pKi9X8lVZTbEOQIF6rYLq8rY/cI2EKI8Bf4TGALjQii4PjKGs63T802nVg8+?=
 =?us-ascii?Q?wZLbwJP2zo8+1CUN0XNNCX+v17TVtjckuAVFm4XQdwpHR+IB8+5itRKxn4f+?=
 =?us-ascii?Q?I1nU31KLtA3aWaT5C8jf3pCWLZ0JEZxYRJ1x/3lnSe7SdKqko5oN0qRaTETE?=
 =?us-ascii?Q?D9EtEEM8Z84MW03aOzysC/ZOjANjF5/knyVKvIZPAa/0ujV1nxrUl+4nR5e+?=
 =?us-ascii?Q?TRk6R/Sm04pTwsAMaGE6MRQTMuLxs5NrmZquo+b3020EVkBOtEpZ2W2qQ7zC?=
 =?us-ascii?Q?5oTgOPQ/kkscrM+JE5/YqaRy17g3JUwXpmKJssUXFb811WXFuWnmCVJHjTSb?=
 =?us-ascii?Q?mUNhVtL03qof9pmLqFfr15nQAsR4y5X0XD/GI1PSvs5V8/3CbAXVTcDB9pPK?=
 =?us-ascii?Q?Cjtg34Uu/7NR/MTzgfJS5JR7NAdg/tBNXr13Q0QMCtW0jzwSt5Y8+UsnrI0s?=
 =?us-ascii?Q?59L4h8REmEjFhm6ScvRncHSvnLk/hyLPEDxYYJOF65nSIjQkLo26NizldaZj?=
 =?us-ascii?Q?3qDZJlQ54qRLCd1dVrEjmX7DFflBBUwXglUDZlr5Gh3bNj1UMUn9AsIeLpW8?=
 =?us-ascii?Q?3fmo5YXMBXbhFPvIgNLKlxuROnRKFFQKPYjX88MY0FEkOoU9uuY0zXFUmYdv?=
 =?us-ascii?Q?WALbni2HROcJ6H4K/lhD4qTq33USZk61fcjiRJF9hXniyVq8JTmIXAulllYu?=
 =?us-ascii?Q?hDCfUArKUu84L2cfDCNmkmYzeroZJqkAbRu2gqRN1UEry8dwoxdT1tXn+3Ar?=
 =?us-ascii?Q?KTP9R0pDirfCGUptHQS7ac8+DMtDheGtL0c7xjJIglBMBsbw1mzAIIovgGJS?=
 =?us-ascii?Q?QxRTUkBt2io7iIOWo0q4s9CXxTKJuIl637fAysqx6cu5JWchvOYEnJ/THvFg?=
 =?us-ascii?Q?pPNJ/vbpYgPx5pYNiHGo5GbyL64WxUOAKlxj/8+qHZ6yU+PDnHIY6TrplicO?=
 =?us-ascii?Q?p6Y1XNtLJRmJLNYp9Ghknp6xBFYQuygtpgIBX5eumv++YLNHX7Mpl6fsWNlT?=
 =?us-ascii?Q?PzBUgPBx4j8PrvIm7LmpqVIr/bjjzummBm7Qjyv5lHBE9OCarXwEpPDu2PUG?=
 =?us-ascii?Q?PM3Q/GPGbXFsIi/RhMnnYiT1LNOd0bLXImdQ1Cl0aqWwQYx4ZDNuCD/KoZB6?=
 =?us-ascii?Q?21fzw/ZmDGsfTTGnCLrw8/w9yWXt3YPzEcZx3COwSD5BHjCwqXsZyWr0s7dS?=
 =?us-ascii?Q?KF19fn+oO126dx6mzprVzSUw8Lyugv7uElBLHm7OmRjKSDFrIscriNBiXslo?=
 =?us-ascii?Q?SRYBc2zcrO0Y1axSDNTtTaUeXvrczFo8PQB4N0Dz6Ua87Ynjz7dPTG6d0auC?=
 =?us-ascii?Q?XUx5WdXSjsL2fpHnqQLFt666ayuTQYQv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:40.7184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b110eb70-def2-4ee9-633a-08dcc091908e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5957
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

The BT.709 and BT.2020 OETFs are the same, the only difference
being that the BT.2020 variant is defined with more precision
for 10 and 12-bit per color encodings.

Both are used as encoding functions for video content, and are
therefore defined as OETF (opto-electronic transfer function)
instead of as EOTF (electro-optical transfer function).

v5:
 - Add kernel docs

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index f9dcc522c94d..032ca65299e5 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -69,6 +69,8 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index d953d16c32f7..d8d0e4b571ca 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -54,6 +54,25 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_BT2020_OETF
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_OETF:
+	 *
+	 * The BT.2020/BT.709 transfer function. The BT.709 and BT.2020
+	 * transfer functions are the same, the only difference is that
+	 * BT.2020 is defined with more precision for 10 and 12-bit
+	 * encodings.
+	 *
+	 *
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_OETF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_PQ_125_EOTF:
 	 *
-- 
2.46.0

