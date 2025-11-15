Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6001C5FB2E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D393C10ECA0;
	Sat, 15 Nov 2025 00:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="odCNt/3R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28D610ECA0;
 Sat, 15 Nov 2025 00:11:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mXPKotBMcJGc1elE7K3ctyI2We3OC09sTMdZXRjanMvgDODPY1b3ui6e/zazXvBIUJYox8CTRJwMp3nUOErLvODNhui8E7+FLM15bqcFzeQBF8x5vt0CDgl2Ej/9ubCQAExQ+TnpUX2CZ6SvrC5jH9pEQHhvtR/6Z238wMZWdBSR3jZorjg05zonVZ8YrhqXPOFjsc5wUZayo5b7r3Q5ObqK1LhI4yvhbxjQFduR8qVn7dJBw0/7QigdigGtlGyiAYVYFNrYvia6ov3+q6vfLyrjd7VPpD4FP/yMJVnR0Qu4w0LDJBZjfWLBlrIDSP+gr3vYkQ+R2MKF5HVqprYDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbMp9/il6X7GyO4z5fc8LaS/8lZiGBq/TxP/ixTPQ5I=;
 b=L8D7ujdGP/H0O3mqm8gMjV+fFQ95E9w6TbUE9c2Qj78SrEF2FNpOVj8tqpNoFDLh+xCT8NBErkkP4h+aakI+G+34pSH8WLs9LVDxWpp9p/g5Mgm+HmmQGR98rMYCPVQ7nNdbCKRRPAv1xqycleIeQiKgsS+Ih+rPSdFSjCEV07P6oK66M50iKedsrJyuzqBOWCkLllw2FaRZrKMr5HjEp2CLmj3OD0phCi131UasA7NWWZsgO+ifm1hFWXsktbdG94w2a/3L3VZo9ilhu5BGeohGAcE3q053qkfR7rDcedRBx0NQV3hi8pi/vgI/l59GuwVPOjnB3+CLxKGqYqTf/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbMp9/il6X7GyO4z5fc8LaS/8lZiGBq/TxP/ixTPQ5I=;
 b=odCNt/3R8rJre2mz5x7mQERhIk9TY8jLpjlp38Od9FwX1luOyLgjeMTKHrsYum947Ke7s/+GqkVJP483nX9aY7Y7rTNHRmfpjYAHF5AAF9dOF3OyC/9NDD560/sqU2PqNK2+wu5CMxuIK5RVj4/o41d78Jun9+WD3XIBgpACHdU=
Received: from PH8PR07CA0020.namprd07.prod.outlook.com (2603:10b6:510:2cd::12)
 by LV8PR12MB9667.namprd12.prod.outlook.com (2603:10b6:408:297::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:11:43 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::1) by PH8PR07CA0020.outlook.office365.com
 (2603:10b6:510:2cd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:11:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:11:42 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:11:36 -0800
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
Subject: [PATCH V13 33/51] drm/colorop: add BT2020/BT709 OETF and Inverse OETF
Date: Fri, 14 Nov 2025 17:01:58 -0700
Message-ID: <20251115000237.3561250-34-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|LV8PR12MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 029e3de5-c61e-4658-8d4c-08de23db8e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OYb6BwKBzzDk9bOIQmt0nGJn7/AYwxMRWjXN1LhPyL892u/fGTnmjIq5hUZo?=
 =?us-ascii?Q?kKItLInVPP0Nl3mKSgcGHZd9RA6AubbmX7Exya8ZurMKjOom3rgg2iX1owuk?=
 =?us-ascii?Q?dGw5yw3obf/ITlbtzkTcxlPXgpa09eiWqKwH1TprYt6QdZDixhPEt0Q0Xw+Y?=
 =?us-ascii?Q?fERbSbLuWU08RwrpDYY3CpZAoO0kqdwPWLwMLTPji26N/4kJs3Xcbv1FCGxz?=
 =?us-ascii?Q?p3PnfyLRI3uvZuzRRbsoS+Os+WIo36ICbC9fpMRImB97J1I4Q9ZFVVxUMG0H?=
 =?us-ascii?Q?hyZrxTyzHfJZOPuj18Rhjzgcq2+kB7QHIpmq9ELFPe4aO+KrzETtyKRyKxo1?=
 =?us-ascii?Q?a1tKYEf4Q+lY4GMqMg9MkV6zkoyCbQgyqV3YcJyMmPFn4SOmayKquVf0VFnr?=
 =?us-ascii?Q?F97F9ZmbkO0AUynoFG/ss1Yf+0pxvbW3Zj+3e6EVbjstkCKm4P5TIc1fCIPu?=
 =?us-ascii?Q?WPH35pMqBhdeXYOI/j0IcENxBQlqJUYpeQDL6LCxxFRTGgKmpovQlWyPqdpM?=
 =?us-ascii?Q?Ws9IytQD+kjUpOonDOYZYBwpguu9I2ku65HPcbVxBhx/c55LV0lBoNBWHp3K?=
 =?us-ascii?Q?JnyDFh1g+H60HblLfCwOPYdz6Q0JTfT/95jw+3NaoZgoiKoCvApBjQXuXPPr?=
 =?us-ascii?Q?YDj8gnzf9KdTGdEeXhPscqdNaToPj5jPjXkQYmjNd+sEwnRgRq8Dy29plun2?=
 =?us-ascii?Q?pKWYieL9xY0La4ZyIilr9kqpu8C/PqF95HQ8HfpYgcbRJQdVsE5q26IeAEMe?=
 =?us-ascii?Q?deQE6roVBI85lIN6obUjtO1U+zdBBEq0eJzE5aPrCDClK+Rs95raFWQoBEWF?=
 =?us-ascii?Q?Fqauo23f7qLfEaqZnMzX+2n3XuEiFXIu+wrR8YYwCe0WZzAWCXkd+pvFj9Bj?=
 =?us-ascii?Q?gyA14Y4RvXVPsVFly/UNrZlv9Bn8I82a1C03hNMs1sJolXutw9zlG4clRA5Q?=
 =?us-ascii?Q?Cfb5afjyJGh6gB/6W2VhxxOWahLwRPl81XL1yf8P/u0CftxX20Zo43yjY16y?=
 =?us-ascii?Q?8mQQ+eaoW8uCH0o6NHKBWTEdJXBUC68uWXC3hCFk3K/PedIm4RKPPqD6niTU?=
 =?us-ascii?Q?hiU9M/qpLy5iQGChwG1XEqhPCcknxErjW/tx0myfwUNodLIrNM3SSnPuNTlu?=
 =?us-ascii?Q?bF2kIPNSlMFPcRszRSWRPEkeBoWJYSSTxmvBbJ/R9acCED7q9r7vra43XWsT?=
 =?us-ascii?Q?0ZMV1jRff271H2gg8QGvhZufbtiS2h4R3QiGNdl4+CDec+uxczuv8ZjU/7U6?=
 =?us-ascii?Q?J4D4WR1mdLiJdcOzUD3FXj5tfDCWzcnFrv65jJg7AuI1dhaDjYBlTd/X/dSI?=
 =?us-ascii?Q?dhjnjuN3hlf144glGjr7k60U/9lB2X9o53jfs0v1n9xIhlO2tAoN4b9FSxdk?=
 =?us-ascii?Q?ZIrUrYHvYGE/OECf34rV81APkAErlcltuIk6e/lYuyXQ/8N0os0Osqt3Jdtp?=
 =?us-ascii?Q?iiqN6o5QGw6bHV0iUksFKaD6Cbw77UBepRQoiOSOn9zUFSwXONGibpz9uwqa?=
 =?us-ascii?Q?zQsxPlgSTT7OWhweAY7Z8tw4zi3HSw/5O/liSO009MtvetlYxGCXZmg1rdfY?=
 =?us-ascii?Q?hfNmLazcQATTpxZcumQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:11:42.6077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 029e3de5-c61e-4658-8d4c-08de23db8e64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9667
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

