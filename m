Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B074ADC047
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECE910E510;
	Tue, 17 Jun 2025 04:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QgSwlFNX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C4910E4CB;
 Tue, 17 Jun 2025 04:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyEDDfytqZ3ZaY/+Y8rFOmoB5RznkkguZeqGkwXV6BdMLhqllQrvOc7PVkIgdCtmHxxgnw220vAGQFm90R+3vUEdK9wkef9lE99+Mv4kFQTTqHOkTr2Lhz4u2EJkX5qAXoXJVDa4MJ+hEoOH79FLKtd58gz3CkfV/FZGU80rttZdrIBUs92vtTadhnedL2FU1UA7qOkeYqsS8OBhzWajeHNmvp5EfQxSqL5tERqLEjOkAS327+gbeaQaqx5fY1xvQ9zw2LOMTCoZcdUALreUX2oHyLbvIzS4pD85WU4qRqsyJiP+hc22h+S2D6ZrSbGM/KIGRpEkG9YuV2NghTmklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2svjvOf23cgdCyHMrKaPombMAZb2jh7k7J9ouxAssg=;
 b=VW4jIzXsWeezHOlVjM7al3cBZ5ApM5kbfoMdf/zzoKOh2EytX6CTybP/JkWLDoqZKmWKxwL3jMhmdjV0mUkebCIRHKKw6II1Nb7RUqDyQC+yNgZhZhb1wurt1yX7UmrLMCVCRJzaaKClmMfV7tnl0Gu55apgNo42j97EmPXFAmGnfBNAigz+0Zx5yRTArfwg/nt8YqdV92wt02/8btHfDETgaQua5i3yoMZTpZ0ip6opibs7cVNHOuxtTWm5iazmKd0HH+zrgNavTlhtnof3B41AbSTDM29ylUrFGPqV/LUdVaje6vlC3ZzaK9lg+6+GTv1XXD9RG+7ftOZhlwcqvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2svjvOf23cgdCyHMrKaPombMAZb2jh7k7J9ouxAssg=;
 b=QgSwlFNXtonrIRAj0kK82baJQWcmh2VMXGfaHI8SxCPSD2264auIK/cwj0rfmG1V74WbbpmBwaNs/VzZ7s/4O2R47pgKcpqRPTTtFOmgFQ83sGura9WyNElMMbz9w7SB/nxIwrEd9Nut49MY07WLFGdxMboR9ZKNAlIW/jE93Wg=
Received: from SA9PR13CA0124.namprd13.prod.outlook.com (2603:10b6:806:27::9)
 by MN6PR12MB8515.namprd12.prod.outlook.com (2603:10b6:208:470::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:21:11 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::b8) by SA9PR13CA0124.outlook.office365.com
 (2603:10b6:806:27::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 04:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:21:11 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:20:59 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 12/46] Documentation/gpu: document drm_colorop
Date: Mon, 16 Jun 2025 22:16:54 -0600
Message-ID: <20250617041746.2884343-13-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|MN6PR12MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 608d020a-e275-4a4f-ce55-08ddad5663ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kg+0xNyWPp2er4cgRwJp6pP9wQ1kAABzd7hHFfxgI0iPrHFSgTeOs/XJe05t?=
 =?us-ascii?Q?W1E3Oo8v8JnzCB89+pSTGsnHh7wOFhbK9Zp8zwZwytEaYe68JMyClkC0R0tM?=
 =?us-ascii?Q?vkt6er6IdoNxYYoiZCtcVLJDH51brauv8T4M5adLqgdBDA03nwMpuGugGnyi?=
 =?us-ascii?Q?HGCdUZQj/Gb79Zir+SW9pv8gZoIxXII8BQZS44S1N7XDnKqPt8c7wSiEQUDD?=
 =?us-ascii?Q?Zxzqur+3JPklAmFETMwrnK6O3si2WyH9hQpWJzGsFE9kAwI1/7M6s1vTIzcD?=
 =?us-ascii?Q?8fF/eDHFvvtMHVgX5WikYREIbcZhM4MsjiXYphkEq0WyW+wnjAZyZ1veV/Dm?=
 =?us-ascii?Q?Wg75l+YtCvrA5IndDKX9upuzNNGpXA58IT0zpWd67nD6jDqJwPSQzBekmLiS?=
 =?us-ascii?Q?wNk1qtjCeaX2lMaLNhEq94wv7T05g1HBW2efzIFERniCrVdL1w0P6+XWP+nj?=
 =?us-ascii?Q?9ZnvQGoZEaqVPHQdtjQFzHi0OBJpXvBVCyhK8wTs2x9z0TV0UKKzgAFBGu+8?=
 =?us-ascii?Q?d9pgQAUtIbMKu1mi/jNdut70M6S4nXZkjr1RhUBXwM78Fj9eStRS6hqR2GHN?=
 =?us-ascii?Q?LxYmrCDrf6JaKdZ7KufsUJ/6hD7erwP3oRmWlVe6eJLF+EJ4+nBUrQdzu8ut?=
 =?us-ascii?Q?/NQODfzWcamH55m89c79bgIhFvftd9BQ3+Ab2ZUCyaW/M03hw/lz1oDzHQHh?=
 =?us-ascii?Q?VkkbAP8+wm/AiQHj0FIu8eCPiW8//u31oRKI5SRe9oW+dmDBZT7Z1twknHwu?=
 =?us-ascii?Q?sK5qpkkroQzt9xpqX7mhVneswF0a1ycSXSeZaPtqDOgfdwUXuwvOq5Sr7TK0?=
 =?us-ascii?Q?z7hFCNo2VJ7mPqelO72CFqDrcHRTsVP7LMEpozxx5LUT1cqq2rvGKhrT88yn?=
 =?us-ascii?Q?j2F6XeCfvP++Om9rXvYn7N1LgD4IVw/YYld8jWVUJUbaT90cE1R89BGOzlQ7?=
 =?us-ascii?Q?323Gb3i6pXp5ibMsVBfSdACK8R0Oq694bqN4gWxArGJb9RAN3y/1DnecPYYd?=
 =?us-ascii?Q?n4JqVIGSvhJP5PYBRiJRVkpm80lWsbmPj0NIbanxk5WqDL7epxC0IJHaZRtN?=
 =?us-ascii?Q?mcAP7v6bOcZkHYMd0c2Y13VfaKDJ5MAyb00izATwqglFW5oVgux5vqnSZlMj?=
 =?us-ascii?Q?6j8XVq2BWHeHmnxH6VQPohnU6XmXyXTJ/opSgTbUkUoCsDOc94KfaMEhzE14?=
 =?us-ascii?Q?EMvhJS32JCQCsq4lofhMnDrUKlQLWMax7YBIe09nJI/2EJN8CjVad98fyKew?=
 =?us-ascii?Q?kADAU0erQQM76XQTMWUjLnXfBdVGDMZjshwlRFDL9xzn56Ag68nXQcMPjPmL?=
 =?us-ascii?Q?v3aKTqU/G/Gkcefa9AH9kDOR4dlKNC96WMDYDAGlaeKsIA9b61jlJuydb30L?=
 =?us-ascii?Q?hptJQSUPik1P8LE3IrMGHmB2lo3Wyfh07pms5Kg9mdnq2I37FsvB3ailzzGo?=
 =?us-ascii?Q?wvmNKO941tCjKA3JFUkxWJ9jgPAbwHvF1bqTUjHKDXKvdhqv+lKO8WPH75nT?=
 =?us-ascii?Q?jUd5/RXDIWoLRwXokWMuExJL71/zxLKfzH3F?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:21:11.1071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 608d020a-e275-4a4f-ce55-08ddad5663ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8515
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

Add kernel doc for drm_colorop objects.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
v8:
 - Move this after "drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE" (Simon Ser)
 - Update DOC overview (Simon Ser)

v7:
 - Add a commit messages

v5:
 - Drop TODO

 Documentation/gpu/drm-kms.rst | 15 +++++++++++++++
 drivers/gpu/drm/drm_colorop.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..2292e65f044c 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -413,6 +413,21 @@ Plane Panic Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_panic.c
    :export:
 
+Colorop Abstraction
+===================
+
+.. kernel-doc:: drivers/gpu/drm/drm_colorop.c
+   :doc: overview
+
+Colorop Functions Reference
+---------------------------
+
+.. kernel-doc:: include/drm/drm_colorop.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_colorop.c
+   :export:
+
 Display Modes Function Reference
 ================================
 
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 43cdd68a69a2..7b3ecf7ddd11 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -31,6 +31,37 @@
 
 #include "drm_crtc_internal.h"
 
+/**
+ * DOC: overview
+ *
+ * When userspace signals the &DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE it
+ * should use the COLOR_PIPELINE plane property and associated colorops
+ * for any color operation on the &drm_plane. Setting of all old color
+ * properties, such as COLOR_ENCODING and COLOR_RANGE, will be rejected
+ * and the values of the properties will be ignored.
+ *
+ * Colorops are only advertised and valid for atomic drivers and atomic
+ * userspace that signals the &DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ * client cap.
+ *
+ * A colorop represents a single color operation. Colorops are chained
+ * via the NEXT property and make up color pipelines. Color pipelines
+ * are advertised and selected via the COLOR_PIPELINE &drm_plane
+ * property.
+ *
+ * A colorop will be of a certain type, advertised by the read-only TYPE
+ * property. Each type of colorop will advertise a different set of
+ * properties and is programmed in a different manner. Types can be
+ * enumerated 1D curves, 1D LUTs, 3D LUTs, matrices, etc. See the
+ * &drm_colorop_type documentation for information on each type.
+ *
+ * If a colorop advertises the BYPASS property it can be bypassed.
+ *
+ * Information about colorop and color pipeline design decisions can be
+ * found at rfc/color_pipeline.rst, but note that this document will
+ * grow stale over time.
+ */
+
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 };
-- 
2.43.0

