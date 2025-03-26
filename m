Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B75A72758
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:51:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0538410E7CA;
	Wed, 26 Mar 2025 23:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XYi3n1et";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DE810E7C3;
 Wed, 26 Mar 2025 23:51:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d00kbcUTW8YsEqlqQUL8u+DQH42QepX2rWdj9PJFFowHkdWaBza63VPL6BcKzwAm7DpgwnR0nZQGZ2wRXJToptyn9ZWnls0Ierb4ZZzFxX9tZAwo8XJrcVFN6K1nfyMZaT7DMJk2+4AcwSt/lKW8kGD3KNFqmQ3KRAOWzHha6Uoy3AuhO390ir5qUZ12hghtdfA3jId4YVOQFlhBmIEG+OqbYYr/WktzfJb0mjZLIEDGZmSxH92a1zJ3UY9jmlgwO7nsVG865iTHjg+xLd4niYlqvvPv6wALvo50Au3PLjiEpCv1sSrzanv6JJ/bXdW0PG9YNRLCd3Z1+ZWibZJmVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7OO4tTv5QuUsQfNBAjeQB3r0ou2aIAf7kv+gIxF/q4=;
 b=OBs+MjsG12V3qYtMiJkAkOVQTLOlgfLLm6uJ6oZpQ3613XY1f/PcQjfw57wb1tmdsyMNN3GAhl5SwmpCYK47D3veuJjjgfxZDIm/8c4a9R2r+hskoqkWytpLdMdboVZB0GGZYsM/iZgDR38f/wI3vVbgSB7iSSg1cfNQR5WOkuMJvHQsGWN9Pq7ddOfOY6+tAF/0g0wvVC0xENtYxKTeraD3CbbEIlc86vP5TgB1TZSTAmrOrVGsofI3+iwnfbiRR0hs+CYTZ4PNF1QLEk+HAez3oWDWU11kCsy0raefIvYQ2oQ3NWVrGPiXqNjy8WAq14KXwFWMBuY9heqAPW3aeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7OO4tTv5QuUsQfNBAjeQB3r0ou2aIAf7kv+gIxF/q4=;
 b=XYi3n1etF7rgchhNhL+q7ec0ejEoMlFP7+B2VzX/PI9r313gl7PKN0ZlK6KT+mXr2XEeDX78qM4tDRAJLIfLUCJ30yvg2Ks+M2lrrVr/9gO9IywzGUCzljeGVAvy8kCpjXnGLpZhDdg8uNWdCqLzdrz8McnKymG2z7IAlkglITg=
Received: from BL1PR13CA0306.namprd13.prod.outlook.com (2603:10b6:208:2c1::11)
 by BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:51:24 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:2c1:cafe::7e) by BL1PR13CA0306.outlook.office365.com
 (2603:10b6:208:2c1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:51:24 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:51:21 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 12/43] Documentation/gpu: document drm_colorop
Date: Wed, 26 Mar 2025 17:46:53 -0600
Message-ID: <20250326234748.2982010-13-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|BL3PR12MB6595:EE_
X-MS-Office365-Filtering-Correlation-Id: 931739a1-11dd-4f14-cd2b-08dd6cc11dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FvQcoyXopYKFMqWJwAVr+eCQeAc545/Cj0vA5KvVyQFvz2JNRCKrI+1TarAs?=
 =?us-ascii?Q?8A+2Tey2CnWaPG17TwzrOA5Sdm09qsEsywdB7DS0R7ssCBWcmAwdPPe0Kn8y?=
 =?us-ascii?Q?jqelYVD9vcBgGPViQbh/Fq4vDWIJr3uAiXjqOTpHc5zPqDPh/qFaoAR5dekQ?=
 =?us-ascii?Q?Am1q44JqnP6oOYA5IiThM+qtx1bHo/T17KgOPodKw1SgRI672YCJv+qRwjoi?=
 =?us-ascii?Q?0eU7JSj7CQJFRl4burrEx97AtnjxfzVsCJOFhM8VwaWU/kihYD7RFxu5atah?=
 =?us-ascii?Q?osidoe1hLqnoDvPMzZMPE4Vlmxzie6RLEIQ4YmcsoPu4tmVW2a1IjW2SW+2Q?=
 =?us-ascii?Q?07bSVQhXqvRP61C38d+H8Y7PwUxMcQywYpzRMXUaFwSTCmCXgycv3TOuWMLe?=
 =?us-ascii?Q?IkCELngxXZGVIaR88w3xfFHe++aqHjU7P1C2BlGotnu9mE4aocsAJnFQEFR0?=
 =?us-ascii?Q?hJ9erElkll7qzPT1s1BiEfAtXAatsx83897RAC1qfnx6j+5hgUOOPLQ1pU5Z?=
 =?us-ascii?Q?kn2bAcfSc/BDefgMS7HFAobqfzG9+VS8QZDaNSGI0Lkg/Yap/K/eOtcCLz90?=
 =?us-ascii?Q?mZpT77E9pqYu93LOko93Sd2z6sA2MqcoJTLv/lK+vbTnSQ54IGffy8prKpIJ?=
 =?us-ascii?Q?6LJxeq4uEKppnT7lWP97wdwWZD+BVpSV7sW0UKTpm9B4USSbWVkXgKRZwUNA?=
 =?us-ascii?Q?QYdpzUHo239jG3zxw9PPVuRasJDhvDx06HbtE0gpgu/eke4+0nEUPlMqYxjO?=
 =?us-ascii?Q?b+MzebJBUcti/ZVOQt5wtHiaSamwT1ktfq0TS8aiZHoBDxm7D2jXAsQTAmjx?=
 =?us-ascii?Q?ofzCfwUYVPTD35ycjQ7zxSpCUERqhBV7u1XP3bfBybzlNvK0vP2I1JaXeipb?=
 =?us-ascii?Q?/HuyN2UY1b0M8/fROZF38H9hM04ZA2zxlSup5OwQ6W1R0VkAKkXWoTYLG8tD?=
 =?us-ascii?Q?GTuLE7fQ2bGDoChch1TVcdIHMdYJMK5F5CjcB9qcv63JVlfUXaDSNUuE4ptF?=
 =?us-ascii?Q?KkuLv5gN/F0p5zVE8Avy4fzKF5q5dyxT5WWsM7oBSjUXtCxbo0N9aiiGjq3y?=
 =?us-ascii?Q?1eQmK+IS2/7aRskd0zbGFdTM2ww35ttOl7cE+V2nBF59N0BWK6f809SRzF1y?=
 =?us-ascii?Q?suTJyt69D4fMeS4apjlvyZnmGl3NMLUn8JNMdnOBTQDgMibzi9EyEAJA6oPm?=
 =?us-ascii?Q?gkg3gRd39/Mqg/EYOsIxZ7DF5W3gMv3zdebBGJ4/2R7+hmUeyMEIlPLoA7mk?=
 =?us-ascii?Q?9DzpSFYg4bTjSvv4NiB7vgznpwysmVlriywTenb5QlnODXAJHP0Ffas8YCmd?=
 =?us-ascii?Q?vwPP9IKhJO++vJOy5ORgZoBK1NUvkwzE+6cBEw4aA4M1TT2LItUyX5qWWO76?=
 =?us-ascii?Q?Ce1y5CLNoOYXiHCvZqQzctMrtELl/gl5RekvrJr2Ddv1G98EK7DafPrXHMb/?=
 =?us-ascii?Q?bMD+jegyk8RzrC2J7vGD9rukf0zTMyFh4LcsX1omT/PH0VS5YPmxFKLfT4hb?=
 =?us-ascii?Q?dTjDFNG6eWqAUeA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:51:24.3891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 931739a1-11dd-4f14-cd2b-08dd6cc11dfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
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
index 05de9bf118ed..a554c51fa7f5 100644
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

