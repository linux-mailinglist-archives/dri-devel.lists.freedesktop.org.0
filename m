Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320EAA4035
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F35F10E604;
	Wed, 30 Apr 2025 01:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pijqE9CO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84CD10E603;
 Wed, 30 Apr 2025 01:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O26J6JgbGckAAxd1ramzONYdCfIU3a1/oXJdm/vQ5GT7f50oXJ9AUbvYkyKfdBd6PgdcR3MArMNmILubGagXIIpBBwKQ575OymxpGOV6mfhubx4oiX/NtFm8oRTQcH5A+srKuMPMe3t2EG2CK0u5wQKc08fJLaEdkm/gDAYiDJWu64xfI3YGieq0LE6yCDgeM70makRMLVgTO03MuqxqsKEn1kDmjHxrSN7Xz4nAPI0Zc+N8hu7viDnMh9E/UNgw+KTPveXtJzjmGIwhXvFYs9uhnrc2Af21yQ8pmeJ1AFlDLfDw72Xfbjw9hK2GZPM3R5mO5TWzfiIQ2+csM3jksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOlTvj1+E88HMCMyMlCo+ihVtRtegC1Owle5Xcg1ISc=;
 b=PV7E6c4ILuQ/tG1W4LPkSh3WUc1HYwc6bBRpQHaA2ggETZ1Y/YYmgFtmIOIXv5sMjSPGKYIK4S2HeY9vNUXyYQ86ZQSf02f5y1VqkFYgfnoXZ6G6zlQf5JAN7Z5ottnIc1tNPsnRFjCrbMOpYfglf7ZvXMEC34IDFFDUgNL3jGozD49g1vVN6qUDlxBBRL1nGyi2IJlK/6JLQhgW6zvMLzKy7Q3RfvVrwa+d+m2hsRhEVZeAcXqTKIx4Iwn8TavPMPLygvW9ztzpaajs0PVe+eQcJq4s7WYgCGNdZ891WuRRIpQaJySpDudXYgkzVJD6xAn+0s8oQ24QpA46fK+0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOlTvj1+E88HMCMyMlCo+ihVtRtegC1Owle5Xcg1ISc=;
 b=pijqE9COPgJ37u4j7HCtKvpQMB+n5NGR1g8L7NNEiI5lym30r0SW+gtpXY4tvnXcQJDuLjPcEXLL5dP5RlOG64ejf0FGrdItIq+vm0vSJIMYCc6wwgyfwzhL5gbYvdi3u9e2JG3Cg6djlb/Lp1GfjQkS8oxzSmcXQkwU2+r+pJ8=
Received: from MW4PR04CA0138.namprd04.prod.outlook.com (2603:10b6:303:84::23)
 by MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:14:53 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::9f) by MW4PR04CA0138.outlook.office365.com
 (2603:10b6:303:84::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:14:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:14:53 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:14:49 -0500
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
Subject: [PATCH V9 12/43] Documentation/gpu: document drm_colorop
Date: Tue, 29 Apr 2025 19:10:42 -0600
Message-ID: <20250430011115.223996-13-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|MW5PR12MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: aab7f9b4-d4bb-4282-2f73-08dd87846983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s2JgXg+0EQLuShbup6p40Uo0d9mWyzjFlbGlu0+60oCKqosNzLCZXU07+XxZ?=
 =?us-ascii?Q?Wo0S3K7XllBMV3j75Xhin/vGh2kxOrjWwhaj/CDg6whD4Jqxo4bxRIw9lpnO?=
 =?us-ascii?Q?8FssDu3w4poGlp3njHD7pZRfIvIV9echx3huIlZzhXRyK2hDWFew9nwpNC60?=
 =?us-ascii?Q?HvTfucEMWW9fYGx2ihLidB0mXnHmMzFtySR3V8ubhEbfugY7QbjTpwbbCYVQ?=
 =?us-ascii?Q?yQ+vHSmSDOM/E6UZWUHWmAjg1L8ohBnPNVJwlG+GZZ3VSjL8hI8fs7cmfwY3?=
 =?us-ascii?Q?FUCUmLEeQV64kkvgWrSNfpLiuLhC2bHllx9J/bKeR17CGpVUKMERUnbXg9hR?=
 =?us-ascii?Q?JyDkFsj+1MVZ3hBSZ7PnQtoGy1S/LAf6ew0HPPZvzoxGoedrrcWHbN4IxFaP?=
 =?us-ascii?Q?/EkPsdniFZrUob6e5Tow0dny6L10R9SEvEkn5EK7hYMCqScj4QXgZr78hpGY?=
 =?us-ascii?Q?5mEsgVWD0NGEThaX3U4QynScOdnUg8qvV35oychd5YKg9efvBlg5IcUIQQTm?=
 =?us-ascii?Q?0yOngcogKMeEimEo2/l3lZQGhFE8v7pPRe+Mq3oircsegp07cwfeluW4gjAr?=
 =?us-ascii?Q?QigA6PyWM+42by4CbmR/G4N/HbvukLrwC89Mj+Uhgl6TL8adfS7mGtHiFrJ/?=
 =?us-ascii?Q?RLOZPZBJdf1wsEioEy3rFRH+lBX8otBkZgYlFnpKEs9xNI2a3paX6xjzF61l?=
 =?us-ascii?Q?T+bL3VZxXJrBleG5YguLVdZfndlgcwbgmQQ5XBHdVIaOreHp6BFHNpsyomUk?=
 =?us-ascii?Q?oMbOZjN6joPQMfZmFvljHGwPkbyXu+pIpwqgtOiNz1uFpY5tBX2HBFNcetC+?=
 =?us-ascii?Q?kuJECwzs6+yaLQa6UL97zhowK7PBTP6KUKJRHvefqGZ+HWyPp8ck3GTk2xc3?=
 =?us-ascii?Q?Q5lIXc83haz0Z0228kby52RZbfSLAQwNb2wMC+3Z17FXuMvMj+m/Zcp6RYoT?=
 =?us-ascii?Q?mrd+BFy/Yu2L06icMOQTIOpOmY8iHKQAbIIkRW85BNRk73lPsuKlASCRY0j1?=
 =?us-ascii?Q?UcyZGMpiIhytJtLf2kdss1XapBh1u3C+xQ2hPwuEfXoAWqiSqKvqbcahyE2I?=
 =?us-ascii?Q?yf5AQxTlg5w09ltXcXrIfY/hx0LcvuKrrAlFkRbXx11GV6Wjbf8xCkF9S9Oq?=
 =?us-ascii?Q?ZqeFX3XkGsW0SrMCexD8B3ZTCnSBJhor9zkaEn09rXb2to1EX1huGs+JM3Ao?=
 =?us-ascii?Q?/VNhotMQDOv+hZMpqC1uV7W2IL0bvoIOj3uFuafg8SiEAB0FXOKCMucN5F/F?=
 =?us-ascii?Q?MOvS5XZOzHbvkPksCpL43ZMqpFJZfYM/mYMLk1JgP6zrSlezgNmfp8oU5jeX?=
 =?us-ascii?Q?0N4zbZF7bQE3IHSimZVA+fR/hP8c31O2lH8JRG0eXm/yKbQErrjPbZgshn2i?=
 =?us-ascii?Q?qcZmbWxYJmn9pFdKXnwGK1+74fe2hgmMfjDHbwsntWyeY3CGZOHLQyiGZ3nO?=
 =?us-ascii?Q?0TzjX2jHxSo0oGCR2iDXNTSVWPdIpsuziUaF2dOpSalNSmwWOGdZLMfAPna7?=
 =?us-ascii?Q?83Mt9cvoUQ0CFFF7NaE4pvkwlUYyRyCQOPbU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:14:53.1321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab7f9b4-d4bb-4282-2f73-08dd87846983
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5684
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

