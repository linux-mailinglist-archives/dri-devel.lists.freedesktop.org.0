Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF16C1E4F1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DEA10EAB8;
	Thu, 30 Oct 2025 03:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qIH4HW9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12CB10EAB8;
 Thu, 30 Oct 2025 03:56:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5zQR2oPyzk9cJ05B9p7BSuHsqBhw4tKfqSMV/c2sCs6356Q+GwAqMKBYAaVi8HrSa0LXu4CWZr6T8eBKykslsLIgC0N8yjJkTbV9HOlxFUHvaJGz5VoxMI9yytCGktRYFEd/EiGS8cBN7Pa9HL0Bf4NE4Fq4X55hn5d+ajTU1GdOs7++DIn013kKZyD+70ZH8h2nD6CsSzgDrfEds4HAGpyJt2gxfUGHJARTWu+4A+9RoYnxD9zNAGbYlF8Vt9HwO1+/gAHV/NeWi2QsYt8laCfic4+HZkqAo2uqIrIsQ5uKLfIAJkK3alBtiAmS2AywjTXKtxMQf/4QQhp/oehZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEBodz8tnOQ128o22+1Ha2PFcFIbcHsWkNwmezLF3TE=;
 b=XA47v989u7Li60QIF70pqUFETAxZFV2OX9kShLFZMZg1HoHn2Oa2XpUuVUF4mOrseZQIGobRpERbKjtMmUTHTg5zRXZEwggqo3I7yybsIsMpZMVitlg6irg3Pj7Pnm4+B4/mC6C0ZVI1+sEdimP6ZUGGd4aK5tuQ97Q0b7uLEYpMhZUQSqJmv/UasxY1x2JBqI0vIqGhNpRINJvwJ53hF8vIfB8zDFRIn9Hv+QevDBYnnZzSSFTEwgwkgBvSei6mRDed0+2y4slFUlzdSuvzMCXj0YHX3kCvECsuyFUaxbZU0RqvR1hrtejI56D/cdfPzx1IXkOJKdMJ+18GUUwhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEBodz8tnOQ128o22+1Ha2PFcFIbcHsWkNwmezLF3TE=;
 b=qIH4HW9Ee6TLAA3RRE8mBEwZeX/ZPDzYr3yGaaRjDGZjiwXUKJXYaPcLLJWIkhZWTiEq9aQ85gNYlUtch73rbPESPariwNKa3lbRKAA7ASXx9xz25RJ4JaVRuAz0JBAOlBm9XdYQ25tvlS1tsFY6GX9KnG/3DF5m/gK3oIV8JJ4=
Received: from SJ0PR05CA0203.namprd05.prod.outlook.com (2603:10b6:a03:330::28)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 03:56:43 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::c6) by SJ0PR05CA0203.outlook.office365.com
 (2603:10b6:a03:330::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:56:43 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:56:39 -0700
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>, <leo.liu@amd.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <agoins@nvidia.com>, <joshua@froggi.es>, <mdaenzer@redhat.com>,
 <aleixpol@kde.org>, <xaver.hugl@gmail.com>, <victoria@system76.com>,
 <daniel@ffwll.ch>, <uma.shankar@intel.com>, <quic_naseer@quicinc.com>,
 <quic_cbraga@quicinc.com>, <quic_abhinavk@quicinc.com>, <marcan@marcan.st>,
 <Liviu.Dudau@arm.com>, <sashamcintosh@google.com>,
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>
Subject: [PATCH V12 48/49] drm/colorop: Add DRM_COLOROP_1D_CURVE_GAMMA22 to 1D
 Curve
Date: Wed, 29 Oct 2025 21:42:53 -0600
Message-ID: <20251030034349.2309829-49-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: af15f1d3-8ca1-489a-2578-08de176856c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GDXsAr2VKA5AwnEPh4PghzT5lcxKm4+9jAYXscZZXN5Nkut9XICNkeUeY5Nj?=
 =?us-ascii?Q?0k8pGyMz/dx4z5NHvhukidH4fsXw+Ng3fr3SlnmLfOcLT5M/Eu4+0c/ewK2B?=
 =?us-ascii?Q?GqMlEwEozQuBAcBRg31dtUVpzM33L/9j5FW1BvjG4QDJYB1AZkBezSHq084X?=
 =?us-ascii?Q?x2i3X0xlAxdn2PL86Lnq0xl5U0lI+3+VlPxs5dmKK/HDkcfC9s7VopJv7HMW?=
 =?us-ascii?Q?dchfmimCMJz64SZWEWZD+JNrnDwSgpmHFC4bMGN+MIXUQkG8RW9rMEfCV0SR?=
 =?us-ascii?Q?Bek2nBwcmrHX5B3M5+XQY3y756MzzujbfyTsKWXKRwiwN36QJwlpP/wxuRHT?=
 =?us-ascii?Q?vjkzwqOmBg7Mtu3Hh7RHwEdQ85D0sl/iei3Ab/YJSG45/3fOHhK5zKEuvPPl?=
 =?us-ascii?Q?A054pSb8QemCUnF5zAh+qbxezT+yO3OI7Wj3yoDTZ4xnrtBO7BZUQfC/EqkA?=
 =?us-ascii?Q?qWRaNMGqJSdBGD5+aArgEcrYr4KGXIbMPNnmXbYTEZ3oivg41j5tyZu1zHgL?=
 =?us-ascii?Q?UvJgLBFLCLrj4Y0pqsiBZTzqHYBUoy7Czrxoasyg8Ly5mLttmthW0StSBG1g?=
 =?us-ascii?Q?FuvbtPH1uJpPjKddbJJ9A4OwawIw2SjWiy/VzAbt0Sk/3tV0JVhHKGPF7ywr?=
 =?us-ascii?Q?hdzqu85ACsQ1mT6PLWWjE0/7FrrEJiKGf4+TrVCYRatTD6C5jlSmkmVL3h4y?=
 =?us-ascii?Q?Z4h0Gx5A1isxIjECUueaqFpRoJDJ86458LqrZqkz/Qvz/bLOX3le/xRcUBky?=
 =?us-ascii?Q?ocPIgsFjakqsQMI0Fs0Sv5UYl7MlPKxmifXS3ddtjwpWvt8DxGeUlyTvf/qY?=
 =?us-ascii?Q?g+W3b2HeEQIo04sFEsdnBmWxGKOTIJ9OMx9hgPL5hZi37Wkm0yeTRmdkCR9b?=
 =?us-ascii?Q?POq5t6jjFoWw5+gh/rXEbn3pZYcYhqGELdRO8fMLap5/P4EL1Z68ZEE9Zeph?=
 =?us-ascii?Q?9eSfaoVaqTAtFeLK9DnTTfbtbAuhUvAbLcC9YyyQAPJ0xD6hSDDoqsI2WYcd?=
 =?us-ascii?Q?eChM4uSN1mYoeFhyXJvyxSH4qD6gz9zZKzL6NFGaKj+KWCekodK6azfsA0Ii?=
 =?us-ascii?Q?GjhdTLgVZFzrJlMF2gFo553PBOdwFhqIzVBFHDRej9e0yLumLelHhitUtaXz?=
 =?us-ascii?Q?yIWpTTMRA+jScXFyApANAj4LR6vRo5IIeG+xzmX575dftHuD6YTbH1x/eojy?=
 =?us-ascii?Q?QSa60+fHPdumdQ0BMDkXLmdh0jBZTV3RliQwQsYlvrysnch9X90VOdiByk3p?=
 =?us-ascii?Q?tIRGL7eM0crbZ8+zrh+XYaexCezEDO4zzRu3fpegLsr9RObxtR1RQkZsmK3N?=
 =?us-ascii?Q?YUBGAAVepCE2k19Jjf53q3Gl2FZ8BshXBHC/QH+QWn/ZUKOCzuIiIaTSFar3?=
 =?us-ascii?Q?yB9tYuJzcifbFINSZHavG+up29C5dJG3tbiihEc1C7qXz+w7/74S24Sx1K/Q?=
 =?us-ascii?Q?2NPMq6S1Dv1uKtOgMEeoJoofkLUeWOEwT53nGyCIwHJbTIOKVmfIVZpnr+CX?=
 =?us-ascii?Q?sqMEOhpo8MsDpQBvr0M1IDwQLCeT5ifXF0SAIq63XtVDMCa7s2LGIzPT3XC0?=
 =?us-ascii?Q?AQvf3AbYxpxd89X2bvE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:56:43.1581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af15f1d3-8ca1-489a-2578-08de176856c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739
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

Add "DRM_COLOROP_1D_CURVE_GAMMA22" and DRM_COLOROP_1D_CURVE_GAMMA22_INV
subtypes to drm_colorop of DRM_COLOROP_1D_CURVE.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
v12:
 - Add gamma 2.2 (Sebastian Wick & Xaver Hugl & Pekka)

 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e1b2b446faf2..4e54bd46be7a 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -77,6 +77,8 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
 	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
+	[DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
+	[DRM_COLOROP_1D_CURVE_GAMMA22_INV] = "Gamma 2.2 Inverse",
 };
 
 static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 3e70f66940e0..01e6774c482e 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -108,6 +108,24 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_BT2020_OETF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_GAMMA22:
+	 *
+	 * enum string "Gamma 2.2"
+	 *
+	 * A gamma 2.2 power function. This applies a power curve with
+	 * gamma value of 2.2 to the input values.
+	 */
+	DRM_COLOROP_1D_CURVE_GAMMA22,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_GAMMA22_INV:
+	 *
+	 * enum string "Gamma 2.2 Inverse"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_GAMMA22
+	 */
+	DRM_COLOROP_1D_CURVE_GAMMA22_INV,
 	/**
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *
-- 
2.43.0

