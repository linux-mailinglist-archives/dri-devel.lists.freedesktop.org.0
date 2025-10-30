Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518CAC1E489
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FF810E9B8;
	Thu, 30 Oct 2025 03:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HEMMZlcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012062.outbound.protection.outlook.com
 [40.93.195.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D4510E9C2;
 Thu, 30 Oct 2025 03:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/D+Gt9C4WHnbSsh062/kMgE3pj9R19xAsb/amroCoHad3uJHwcO4fIAbVeyfGwYn5wBLaJ3U+kAhXMs/9h2b1h0jwE1wRtCRX11yXQJsbwMREN1X1X2UMhNI7RSXlIUQ/0F8hMtWM23j54Y2g/RtV8l161vbi/hmasx1XduhXgtMw9nyQZ204CudQFbR/h+8Ht1CN0bUM1EAvu4VzgV6IuP8RU3OOXaGHnQgB4yq+dAXgc70YTTs5hOGEC3hGUYFVKtz2FeL0IW398JYWTx2hUZd9g/j51OUR+3nqBM+rwMpwrO6tt6D0vfrmpWxtjXWqGUc2TT96j1O7qX4+D9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbMp9/il6X7GyO4z5fc8LaS/8lZiGBq/TxP/ixTPQ5I=;
 b=nEBmYsOkuD852+Wm9dFob9dAgZmS1kpdNd2KgMZidDAKNqowudTQidv7zV7Hpcwl5NO9/SNw0oaIsjUB5HA2XzmaAcnK8XAAv3F6ruwDp/XwY0DctC4b8t3pSEqU/4SrWYrRxk5dXBLqQ2wf9C7r9SEJD3sahfULfpU3ELOuMV88QPHkyN5+uzXxpNiQq5Y+O/GwAMSQ1k4rBW1x9bm8pRRsI1az5NZPaiL420jS+KZ/SkTXdCCvoLD54y5WIHKDTb+nf9dfm9m6B1cTVAiPgFFgwjHPa8j4aC12KGccxkZF/v/EB2X1hXHDGdzI9+5bkiwhvWup4TGUHDMCo16Iqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbMp9/il6X7GyO4z5fc8LaS/8lZiGBq/TxP/ixTPQ5I=;
 b=HEMMZlcyoM2/nuu4zO6JfjJY2uIR7zCupVjFfswyKFKH4CYPOTj3uuMzNXCC8ZusQSgcmhe+wi7aRjmbIyvndOCe6KpXENnVaN38xiIMoTg0oVV1PIzpHR6VWlXE3qYRghw86wDVpkw7uPOc3tQp2Z6di8bBG8BQFk04mnPWiMU=
Received: from BL1PR13CA0404.namprd13.prod.outlook.com (2603:10b6:208:2c2::19)
 by LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 03:52:29 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::17) by BL1PR13CA0404.outlook.office365.com
 (2603:10b6:208:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.4 via Frontend Transport; Thu,
 30 Oct 2025 03:52:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:52:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:52:25 -0700
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V12 31/49] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Wed, 29 Oct 2025 21:42:36 -0600
Message-ID: <20251030034349.2309829-32-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|LV9PR12MB9829:EE_
X-MS-Office365-Filtering-Correlation-Id: d79ee1d8-1a41-4f66-352b-08de1767bf90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jFH+P1MARMmIedP9xEBML19iCYTEEtIOMLVl5cxnQigtSq5smcIaUjU8Q6j3?=
 =?us-ascii?Q?32y7wiJUpYU2dYjgWEuk12513QFDWyMJ68phi4cAcy4xuAFpvPpD8h0o9YX1?=
 =?us-ascii?Q?Qgw1NeS/C6pvG0IUfzuFu3CHOvTsALNESlyn2EUbPG190D8PxEVdTGBoPAXV?=
 =?us-ascii?Q?08Y2KJ7htZTGP5dD46CBX73uME6u2JzUn9nGU/pwNkILkj+Bv++sSoOqDvmr?=
 =?us-ascii?Q?yPXq26oiwrP9ECD104wgtaKsWwHNYk6rEplGI54fcnohGgSMDDVS1uvdDWyr?=
 =?us-ascii?Q?zH3mhRKEUbtY5kVvq9uXC0Q8bToWGpagVwoLKpcYNeaJzBoIlKzTmIp3CCFx?=
 =?us-ascii?Q?nrZZ6J2vUc8wJpZAJQjgYyZVZX5jIQBtehEcFHIl2RR4lTCY/RQwdKKsRMP0?=
 =?us-ascii?Q?Yd3YDP5Fl6DelEdXPT1wzxsPOkct9UUaypQNdIsJB+6qQJtJERUm4wBHVObC?=
 =?us-ascii?Q?tFlaHWPYRtvLUFKkl5AKCfCMvzuFOkm9H5rtb5ulptVFqyzH8z8jQax+mBT6?=
 =?us-ascii?Q?tb7FC5nWG6m2WETeyNjK/hW7s3zcEo25WyfcocLsNz20Us56S+TYSaU1/9Ye?=
 =?us-ascii?Q?lDjHXVH1lBX5ADlMM4nhF3JoIT3POBHpOePkeCuRzV5IpAF87v417n94djni?=
 =?us-ascii?Q?XEccIwfbB5f7AL0qehmlNMdYf/UkcXmwp2u6Ciew2BCigcOfcv1Y5Hvocj2Y?=
 =?us-ascii?Q?noTY8rwmmxzGOhFb9hYBCds4cFOx2gqDK9YbikLrAM4o3LOTO+e9WeBIUfYA?=
 =?us-ascii?Q?VJY6jMAFptbZBeE/SQqqnsjh9qGFXfyFTQMPdBQYjpn131CU7ELCDUH3HDU6?=
 =?us-ascii?Q?XdUiCGs1m6k5elFFSgCGoXjc2yp6QQO7QC0BqFbKjQY6mRQBrMVdA6xxjxng?=
 =?us-ascii?Q?H/R9mN2i27cw/Rzrg9cVnSXa4MiiePL4EYtEyMGzl8E7QcIe/HCTu6dqpR3n?=
 =?us-ascii?Q?RjlSsKIfVs8tVnGzqMcL/GQ3KA+fC6Y8p7CdP7mW0Nr9FuHSjKe51qCBW1ja?=
 =?us-ascii?Q?dDoed/533rSZbHC0P9XEqpj43s3MAEPNq8/oiHaKjvku99gpinUO9co7YPpR?=
 =?us-ascii?Q?k7tDeASGzUIgzb/i34b4NX8bpLNbvkhZrP+adYpskbrXoDW2YWP3j6PsFi7e?=
 =?us-ascii?Q?aHAif9XBugAP8hViNr/JBLhVVxRUMW3bvhkfuQA0NduOhbAphDK/v6xzHppJ?=
 =?us-ascii?Q?lJz16+FZcRwnwhznibMvT9axk4sClaI/dd5ixOzL6NGN/0NklpwjySU3BVXe?=
 =?us-ascii?Q?btyvxKJhRoEE167j55Qu0FCq71EFqe01gGJYJdrRL/eZC4TGzaojPxKEaPb2?=
 =?us-ascii?Q?3IBwOc1PrEDvtq2C0VLdTcvdjqwFeUaOZwO4SrgKf4agdUzREXLsZ7whmehA?=
 =?us-ascii?Q?VIEbIRBDcSlTQoOM93PxTsjn+MtFE/azV6bAigVdWymCFD7YTKuIbdu15p2m?=
 =?us-ascii?Q?ynwgYwApb/vUmKjAFHlOzB7MnfnqSjDemPTwhb7P9DOOnyBhD1jaUOjByk4H?=
 =?us-ascii?Q?bkECE47myYx87f87RPJSoqjnsIgoKSyjf/9sXibf29k+IvKw1qDeQW1HJr/E?=
 =?us-ascii?Q?iafOm4ut+/saorHIjF8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:52:29.5721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d79ee1d8-1a41-4f66-352b-08de1767bf90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9829
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

From: Harry Wentland <harry.wentland@amd.com>

The BT.709 and BT.2020 OETFs are the same, the only difference
being that the BT.2020 variant is defined with more precision
for 10 and 12-bit per color encodings.

Both are used as encoding functions for video content, and are
therefore defined as OETF (opto-electronic transfer function)
instead of as EOTF (electro-optical transfer function).

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v9:
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)

 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 5951db1c385d..db41cda51296 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -72,6 +72,8 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_EOTF] = "PQ 125 EOTF",
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
+	[DRM_COLOROP_1D_CURVE_BT2020_INV_OETF] = "BT.2020 Inverse OETF",
+	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 };
 
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 1032d8988886..19f3778f9e9a 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -83,6 +83,29 @@ enum drm_colorop_curve_1d_type {
 	 */
 	DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF,
 
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_INV_OETF:
+	 *
+	 * enum string "BT.2020 Inverse OETF"
+	 *
+	 * The inverse of &DRM_COLOROP_1D_CURVE_BT2020_OETF
+	 */
+	DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_BT2020_OETF:
+	 *
+	 * enum string "BT.2020 OETF"
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
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *
-- 
2.43.0

