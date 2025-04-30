Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4194DAA4069
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BA010E673;
	Wed, 30 Apr 2025 01:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mIVdTNLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32C510E66F;
 Wed, 30 Apr 2025 01:19:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7/RVBudYlwPAJ8SETCinuw/N2abo+bhTLu0LEtcL0N56QLnVwd5fwfEylKIV15qveJEKdEBQokriW2t35mpptgVX+VKWzcUhizwimcm+hM4PP2Mk/eG/grgqyIr7xuRRDEAnhGwevk4tMuycomVRhFGIaRQt+1Gb3w2OOMsbIIMHrPR30jCZiifpcu6fR3yO3Z3IcA2rPCBX/99EKPTw0f+eSK0+fB38E/W9Ve61/eBBLHQ+nT4Xfu6YifPtQYnZKyHXIFXAXxpSG58eSOQm2+299i3rHdWA3j0Oty+T0SxityRb1zLWT/0kNMi3y7Ina5zO9knUaVw8+ktu66C3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwZuGF/HltbKvuVH6rDY8ilIuwhl8MCeckZavLgMRIg=;
 b=g7Q+kV/KCBEfTxW2IdhLmc1t/LDgCSb6wCpp1roLuzajGGUpvUgw+Q66x/N1beCEJCYPgQBw+CD7OB4MrB2kPm9v/GHZ418Cc+Ls/CeVPSH9QBEZf/psE5WXOzQJ5NlyAUtV1nfEe/0NkzXaWNCmX/G2L29sKpE/DXtFdgBcFvdZ+8tPI7WJKXku8CiU6AAqzQ+HQSXRjplgd8efTcLAEZz2SteOmobHIlbIs0FfOdKiaAAPSq7T4kA7pjh7pPozu9Qbv6kBn3onfoaRSezSrpOV6e0tPiJotGXGQT4ArtGwv5nyuLnwHLzpwnQJyUmpfypqtmWImbNzWqjPizqeAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwZuGF/HltbKvuVH6rDY8ilIuwhl8MCeckZavLgMRIg=;
 b=mIVdTNLKp1AIfaCluPzMe+L5sp5vSMuabRLzIaGzINM7WAkONlbnUejMkNpPcxiWvXHLMkyzki1tRqLJ6NjWnXe9rBVzXRSRE7+8AgCXAcIjyZbRSeoGW7c1FjVBfgaxoJxMAHrEEg+9QNjTdVWvhDjcm+ntUheZv64wvsxbx7g=
Received: from BLAPR03CA0041.namprd03.prod.outlook.com (2603:10b6:208:32d::16)
 by CH2PR12MB4087.namprd12.prod.outlook.com (2603:10b6:610:7f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:19:29 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:32d:cafe::57) by BLAPR03CA0041.outlook.office365.com
 (2603:10b6:208:32d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:19:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 01:19:29 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:19:26 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 31/43] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Tue, 29 Apr 2025 19:11:01 -0600
Message-ID: <20250430011115.223996-32-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|CH2PR12MB4087:EE_
X-MS-Office365-Filtering-Correlation-Id: ef137840-79a0-45ae-9c52-08dd87850e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MFfbQiioinH1RRxxNi7iR4BbMtKZIHcQt9RC+EMasjCdHGDOF0+vdgJp7rNI?=
 =?us-ascii?Q?fFiatrZ8JeLiEXwaoRATKdd7UfoL5SwhmWXdwVtp0nPg25E7OORLzc4rnU3O?=
 =?us-ascii?Q?kUCjNp9Qw5BRU19ePk2AGOcnUOnYrjkobbKJxCHvlgKt+NtBz0YELKowqoWS?=
 =?us-ascii?Q?XG/7PO8dy5NIRD+WllZAWr+p/nLPpCBOEMDM8OLUicCSsTpZGckz5r3rVpI9?=
 =?us-ascii?Q?GxTtANj4qdoL37FwueSvholDSvwfFlN5Nhtd1iGvj/WDN4sQ03AFtomj58BL?=
 =?us-ascii?Q?PJJ9laLqPT/m3JwKz9k6N++j4xzhaj8YBLfXZtwHRaoWlvUKAlM4rbn3Af4Y?=
 =?us-ascii?Q?4yJVg9RPC3GGglpYpfM78lHlNti1cJDbeSxZzkQOoCCHB4cBopGR2K1E0C7b?=
 =?us-ascii?Q?IHfTZf4Jh/XFL8YbrYypkQ3pZpfdJzXzoU2yAGOd+hRgAuIAk5eVVElRFdSy?=
 =?us-ascii?Q?WViZ5lBOSiLJpzaDT960uArwuH0+TEObQrsbPf5N0d5Kwrs7Ftc7zwjgChBa?=
 =?us-ascii?Q?77452jEZSw5bXmJ3DikCYYP1OXvM/LVrdw4EK/fRU/Z9sko41yb739k7WPCi?=
 =?us-ascii?Q?JJXab4PYTIeA8t+YXbQ2ho9q43Tczu3Nvt1Wi5Xm4BWg03CtJqFn/9nClXAr?=
 =?us-ascii?Q?hQkbn8YJ0mDSaWPGrL2hOw7B+ypWri5L0FK1ZVZOqhJFORPxPAQbjk3cN6RR?=
 =?us-ascii?Q?nTnUK+P8pHj3XgosVKvo7oDtKzCvIFjyC/0HY44y/i7PLO0evx5D5EsHgtIT?=
 =?us-ascii?Q?9UzHHfmbLCA4dK50FPduIfX4Xsbw0Wg2YbNIZPZB9Tq+ffV6dQTbIzF/oISP?=
 =?us-ascii?Q?lt0mOnY0DN0uWDLGXrihzxW+9S0WPFGG1G9yBl36Am9tU0+PrN91lbx3MCdz?=
 =?us-ascii?Q?xX97YVdzRmmCtdmd9sVb0DoO3Wue77ISYCDWGXXMWm9mp0IZpGDmTZiD6hVZ?=
 =?us-ascii?Q?XI+m2NwvhB4CzPWD3ldg4mCwwJINzMJ4+clcSSSI6M7jLZL+1yFZemdlxQ1L?=
 =?us-ascii?Q?CTTE3O/lnrIcZAr6FWXH4CudRpx2/pxHrFFJWrOUkstpq/V//5+xYt0b1rHx?=
 =?us-ascii?Q?Brv+jVDV2kDzW+k4mef5rX7Ym0f4O4cFs5kZr29/a75/BID8jxlEosllwcgv?=
 =?us-ascii?Q?2WZpueT5qB7WXMJ5oD/nCR44hgENCfHPkGE/BpcrZrIFa/EVcVKy95kswCHz?=
 =?us-ascii?Q?N6tD5jB523hlmE2JSEQLX9brVdRQfxgvz2Sc/H13GcrXGCgzM6BMapWaiqyI?=
 =?us-ascii?Q?UFLGHYUC/lnve1G8B9WEVQ/YraKg1TL6wiVLb3FZq+YIvvoV7QiYCUAw2T5V?=
 =?us-ascii?Q?yrquz25PPj0AAA02oiG3JRSNCbml9gGpK5sTA8gEgGMT1jUtQs2brkS8xKS2?=
 =?us-ascii?Q?glZSpeTmAoL9H1KZExWF2GG4Pi5DMJzPMuoxjIjkM414KblAm35b8CjHbTnl?=
 =?us-ascii?Q?exkTimFoyT8wjvsBoCAGWTpb+Tc6F/FZZraUkcZo1JncwyvwAGSqu3w+fyA3?=
 =?us-ascii?Q?+GlNwLRZL1xyr+XaF2qLOktd7Z30lddM9+vk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:19:29.5194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef137840-79a0-45ae-9c52-08dd87850e38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087
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
---
V9:
 - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)

 drivers/gpu/drm/drm_colorop.c |  2 ++
 include/drm/drm_colorop.h     | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 9ddb3dccaf72..3ae4a93f0200 100644
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
index 40d70d4a34a0..766caedea2f3 100644
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

