Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FA5B27742
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF1E10E93C;
	Fri, 15 Aug 2025 03:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HrSvvbBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD2C10E91E;
 Fri, 15 Aug 2025 03:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iY8+Bs+v1iBm3wdkusD+WCH430imVGwE8/U69CzSecTw4saYM8PyjAY1Jsp4UM8adJnuk2AQ5OMIdQTd8lBaPDFfF4T2OlklXMwUV8VAeEJCcfbqC9IW8V3mjFUIKvEFWDEuJlfD6qIKeVQ/ltwb84Gcae8VQPGyZe/qyZwEJ6tUEk6Bc6RvSwpCopJKhsefa0CA1ZJkJllvQN7eOjCaG16QBhaWeFr4SJYJYFqvAeTYNoLEPa11PaNFq0jTq0fEiBVfd+K0OT9+BiY/fVDPff+O8afJt1sA//4bK1VURsJ/zSI3aAMTGW5+KMvpxG6pAsApRR72gveiPA33gpUtRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2svjvOf23cgdCyHMrKaPombMAZb2jh7k7J9ouxAssg=;
 b=UaX78e9NQcqfF+9KVHU8kXWarpOaZJT3ITGAuC5jmB2o+KXAA4buBsv/qK4jILJHjqf6qThOw+IaIq+TeQNUDWNPbKnQPSm96uRnBJLm9gN0dZDnhUQEx4Ck6RLzKlnQUkW1cI8dgh1XpM7nxEwYST4vP15YzXVvehSPMRafe6X0P944wuxDhSh1sceQtR/3EQ/1H+Bawf7XrR+//JY2PcrEOdsSMuX4Lfnlqj9/9+xiHp3d0BXVk/P+sdQ3XypkvjxYV/9caAMoNKOSFldB5wqGf0wHVr6j5qheYJzTKxKNEC7BM8GZyib4cReGQvWCzvq0yTOgwlU6lswg2I7pKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2svjvOf23cgdCyHMrKaPombMAZb2jh7k7J9ouxAssg=;
 b=HrSvvbBZjVpM05m4b2cePCn4K6KyGmDK1s07f4E6Mk6bXCKm+H7jj6YeK6D95RSgKh6i49NBSh8KKmYq2Pyd82VSSs4PhDvk2z4lYiTfZkSiWRBFt3B0eAVOX0gq5jzIY9TDxKIWZjS8M1UPT5Sy/QNj5cflbPMolXQp/y6SnUo=
Received: from MW3PR06CA0023.namprd06.prod.outlook.com (2603:10b6:303:2a::28)
 by DS0PR12MB8071.namprd12.prod.outlook.com (2603:10b6:8:df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.18; Fri, 15 Aug 2025 03:54:32 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:303:2a:cafe::9) by MW3PR06CA0023.outlook.office365.com
 (2603:10b6:303:2a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:54:31 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:54:28 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 12/47] Documentation/gpu: document drm_colorop
Date: Thu, 14 Aug 2025 21:50:01 -0600
Message-ID: <20250815035047.3319284-13-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DS0PR12MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 137ac27d-53e3-4239-5bf6-08dddbaf7117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ka0pDgg1c3RJhsjyfKs9xH9y3I5Mvp5rRDaaAs5SMlgjvEW9N0S2BpuK1cec?=
 =?us-ascii?Q?+KaJGlJG0XndpGkk2bSY5oGHBULdZ1Dp9m1j70lUdmooQfaxWjh70ensLNwt?=
 =?us-ascii?Q?EPexmmces/LjLF5mQ4R5YlO28RG6UwnSttbKutSBCrO9VoTZBk0OHRkg8uJZ?=
 =?us-ascii?Q?M/ayeTtDXTBdL1LoaJ/BTDdpyNOq+ceMS2p8hm1oPxtWyU8cloGCmsqlBFaS?=
 =?us-ascii?Q?dBTfrPF5OhIKtuS6EZzEJdmY0vTYluFzH8QAEhopFtkdtgeu4fOAQ8tKAufN?=
 =?us-ascii?Q?OapG/85sidWe2Jpzhh12GaxgU0L7x3ivZpdKgftuCR7AGkE+vcNVtBxXXGMB?=
 =?us-ascii?Q?ChREy7LmFGGa4KtwwR68/eIzaQzUJZFzJsCiQHkdiv2hosqVGjtQLNSeoIz5?=
 =?us-ascii?Q?8FkJW6lbURdMTd74RycsXz4hviYxV6WA1GtAyfKHhRI1kgmJFeg4hlD5lOgn?=
 =?us-ascii?Q?48yWKvwRopLXxHiwhNQTtp257mxy5X09qskr6+IsPpyEYv7dOX9VazdmIHsC?=
 =?us-ascii?Q?vm8mnhinzbSw5rS/TZ8gZsRFEVcB3+jTMs3FJM7ptd3cpLZSctllNLl7phyN?=
 =?us-ascii?Q?fQXwuxgIsvNf3/l67B9DiCiV4JnukBH8axdA6JNDmEkoxz/q3KJ4pNwMr8++?=
 =?us-ascii?Q?B2SqrYwkQMA+yXlfVh8Ogs/Bo/kfouWxxOLymKwbTTY2dIZ+XhWG3theJl5R?=
 =?us-ascii?Q?DEoCpdBo/Y6tf/oMGHiUGtP9SZqmBVoIh2bzyhYT8sZtHLVFeN3SWPnvjAl8?=
 =?us-ascii?Q?T8JhWCxtQhBHNDOwuGg18VBABBJcnEfLKyUXzvsfdCCNUx0FfM6oaz/r810x?=
 =?us-ascii?Q?QTbGetcZNCebmZ5g/evYWYw6n9IL/3/8SXAZut4uJ07Cx0POjGBJ+XJ7YEvg?=
 =?us-ascii?Q?oeVhZtQ96ATksCg6SctXLrMGX2Fz0kKb5wkHJ9OkPvLaHVOzVBd0zP6l5t5g?=
 =?us-ascii?Q?9Fj+KyPT84O+H5Cy7bgawAyYQOD6YmVoA6AnELDxOym5zBzhZ++w5PZMevU7?=
 =?us-ascii?Q?88shMmHxui+gb1zmaJQ8C9j7Xop/j0WkNS8SWgbsCf71Q5k1WJwYiHt1YQ76?=
 =?us-ascii?Q?LeH/Pmq6h8Bq9nL7JttMIi4Qnz/7ggHHqfMRTxwKDgSswGfuwhOWRKGwgn4S?=
 =?us-ascii?Q?6DBPxWChY0YGGDh1V5qVgX4N1f4AGIM2ySYTuZsfD0NjdOQyuxO489UpGa78?=
 =?us-ascii?Q?IlIlfP043YCVDjytLtSU4132RZNCf76iLtt2SL5GUYyp/6VsgbTNhysCquUH?=
 =?us-ascii?Q?lJhemTwXa91TgucBIrlpJccB9AtFdor7kitY954maDbzFXXW2WBr0SybxRNE?=
 =?us-ascii?Q?PESXeMDgNSA82buF6GabQCGZf1BkUj5J5nIcLCl06iPprf49mQfUA5EVRYL4?=
 =?us-ascii?Q?gxOOgBqntWDNMa943HdHy3QRNBe6sUKGYkFJBtLjxo1pzx8+Lj2WMIuBQKXY?=
 =?us-ascii?Q?McM4kmY5MUaXRhHidIkAiGI0sykhxJwYgKm0kHhlOg8H8JDDBl9kV+3w6n0V?=
 =?us-ascii?Q?sH+2aQiq76pk/U/L1/N39nwTo1eUveX2ORkV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:54:31.8711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 137ac27d-53e3-4239-5bf6-08dddbaf7117
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071
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

