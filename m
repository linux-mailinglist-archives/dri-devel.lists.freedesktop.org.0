Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E2C1E40D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D1C10E8CD;
	Thu, 30 Oct 2025 03:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IxdOEJQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04B310E8CC;
 Thu, 30 Oct 2025 03:47:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay5DJY1rbcZ3sKGXRELNWoQq1IA/TFIXFa7KB+j9vrsXh2tqxGgEGZU8CeREGMVd6pVqTZSD7fwUEjQuKaDnAEiYu8tjZHsFFiJDnanKDOdH8img9YDeISF8wZRoYC5S0GeMaNB36V6nlYpRSS8CItDxUki2Exo6sdvNDAWI3Cmhc7/QYXJdo/pD3Xb1gMZ62N4UZ7M6L+1JJcCHSwTonP3QhXQN01Eiw3LQHTyNbII9CnZn5AIu6IL/J2eywY9ZdFiv94ZDhUSlA1+vYJ6RLex0ay0bE06UAamiMU8ST8aoUJnqDfoZxf/9sYZKGvA8hzSP6aUb3X/j9MYqGyWNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1xlLtEORkkpJrkTCoNVH1nzknia/WDIx5uk2YJorls=;
 b=D17FF4etTKAwXOa9zDgW+pH+7nijk4tbbowoa2KFYSCB+GbVlREvaaqueiM3vRFy9iHMMQ2V74ODanU3JBAVXuoFIvvdpWnejhzmsMKh2yjzMxD6Cu3deY4RlKJxSwhweRaQHidecqBhLy7ibMkKQPWIjfLbqNk5c4fuV1w2MbNK1Ucs1gAOUuiGwVhcjZClqNfh22f1v3MKxB0kDT5Tco51/VKZV59EvirordppUb2hy6IIDRK+/ATXqwnsBpmC9eBTKSghpBMgNAWn6eJ/bi6P5zPnP4QgtCCmPwEPdOX6oBoFvlu/jaoyoFSjFGw6xjCKlTGIrvRBKF6C8xwfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1xlLtEORkkpJrkTCoNVH1nzknia/WDIx5uk2YJorls=;
 b=IxdOEJQLL0htJTHIebqdlt+U12ImaQmwV3YUewnBHs9e62mp8zhh7KXGcpAj2m4F9DFhFriLOhN0AlV9I1h3yNEdQATIovlzB8fxzLx84WLGN+YUyiyylehWL0AQb1r8SeZCYSga81SZaVtqconqag8J40HJGmaCS1i9W4B1W44=
Received: from BN9PR03CA0765.namprd03.prod.outlook.com (2603:10b6:408:13a::20)
 by DS7PR12MB8202.namprd12.prod.outlook.com (2603:10b6:8:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:47:36 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:13a:cafe::1a) by BN9PR03CA0765.outlook.office365.com
 (2603:10b6:408:13a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 03:47:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:47:36 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:47:31 -0700
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
Subject: [PATCH V12 12/49] Documentation/gpu: document drm_colorop
Date: Wed, 29 Oct 2025 21:42:17 -0600
Message-ID: <20251030034349.2309829-13-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|DS7PR12MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 731283ce-77f7-4a12-466d-08de17671116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ury1RhueObkFVnzBmXUUdl4ZpPmbJXgpQo/nfaVBLz+ZhwU7gQWhAx4suJSP?=
 =?us-ascii?Q?x6q0H8Zidu5iVnfwKMQBcP1OQUGLXDJMPZJeDjOevh1Rd1e180veTZKe5hEb?=
 =?us-ascii?Q?iiGaIQsBQEZngaDiuTUZ4v0PrJgI3WpFVEesa51qFH7eEDGNtkKOrTemLS7X?=
 =?us-ascii?Q?lOjhyM2HiakRzkVBpyZ4ONMQRryvK/ODcb/KmclxqcahoMsz/BQ18n61+Vld?=
 =?us-ascii?Q?rQ1PzeVTXmDoVOYSe6hMbnntC0jybPex7SpjF38Ui9Rf+AhDsQAVqx+OyoW2?=
 =?us-ascii?Q?ocdzzziObTOMHbfxu2NZXf1uuZD+Ii4vV1Rn44qOmkLTZ3OasNIB6KI1ElZc?=
 =?us-ascii?Q?6L7/E3XgvX+YQB3ZmL6kVTVPgPs3EBI1xP6qiVcdPmO1209unDFAztYMx4OX?=
 =?us-ascii?Q?yRDqm4ed906z+LixPG42TQDZChpyV7JP3A9jmx8ujtDAPt0DIjHm4mtH5cSG?=
 =?us-ascii?Q?tjP0gcQORrlR1XuHBmV78aZlfLoayTHwbsZH+kBuGYPCoE2/qtn0KX5GDWx6?=
 =?us-ascii?Q?7RvXGz5QxgF3pv2wQ70YQrq2JZvFg9gzvciMmUsuSOv545F+iCN+TUgTNkPh?=
 =?us-ascii?Q?+BJVsn4nv0WascLSNVu8t8KbExWXQiBaeRt4gtzgitj3y43/4DqcalXZpJzk?=
 =?us-ascii?Q?F0WgO7bY4zJSECvNl3Ua2NOc1OuTDItg20TFjoz2tKoe/mOO2pPo27erTJU/?=
 =?us-ascii?Q?+emKoGiQd6WoNgnL5uTKNucIPQqwrBIMibxfiMI0j5tM164CRJJZQg0NGrXR?=
 =?us-ascii?Q?E1o5evpvGraYaMlErcQly5/OiCUE9K/TA36OO0yBIKYAp+h7KSJ7SmcXzDSn?=
 =?us-ascii?Q?tcpowL5GxG9E7GbWY92Q/TF66VGzALvXphn18ZVabcUgQZsmzj2fJB+1dPUw?=
 =?us-ascii?Q?BjvzJUOV/0ojSgclJ0Ex97SUxcFN/xGq/Qf31n1ueyEYjRqfBjYx8jlvfIOC?=
 =?us-ascii?Q?aA0FHFuwqViJ4qhkI3EF1dzRVAnUbXPMrU9sqdu5sAGprcIj+ZCpemBZfKoV?=
 =?us-ascii?Q?sXG/Xwdtqhz8go1yqJdPzI8llDiVWj2DPMsMT/1bANN4+nrFStJHA3EGV4rn?=
 =?us-ascii?Q?cM6+7loiOKgm0rpLbWPSRYsMSJvSe8c99sAg8TcH3uEM+ic7R9xCG5ojGp2K?=
 =?us-ascii?Q?sZbKZB0/kB1+0ZU1hjqcNZDqdcRKmApxKZlzwqiEforoHLyaQxSsxVBuAVpf?=
 =?us-ascii?Q?1r74R+eu7wvlcMle3Uso+k/taYSlIrGOxRetRr5d5FDYFuPuvXfOISJIhAzh?=
 =?us-ascii?Q?XXZlt4eTF8lwbKMLCvwXRMtoNVkDY5sB1LfOIcXzz4Vv+jGZQaJN7ajmQxhM?=
 =?us-ascii?Q?wmRTr/sc+eLxIVF/DzFAuKo+qeYrVsTmiw5cSEFNK0fmreAzDyW7VOem38sr?=
 =?us-ascii?Q?BXKBJCMT+GSDZqwxu3crsd0uzNhac+1sFEz+5YM7f9J88WDsunCpex34j2GH?=
 =?us-ascii?Q?Dk4PZdeKNS/1iewFb54Udwihy0uOaj4K9RTYTIEKNN5INKwDf6LHWgmES35L?=
 =?us-ascii?Q?MVthYMS2FHteIAtr+jQkIRfFRJGzweIzaXBPN55pqZfr7mrWGi5d6mXgjXBQ?=
 =?us-ascii?Q?bImWf9NO9O2RM6SIiDk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:47:36.8510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 731283ce-77f7-4a12-466d-08de17671116
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8202
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
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

