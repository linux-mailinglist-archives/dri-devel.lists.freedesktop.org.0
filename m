Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3656CC5FAA2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6630810EBA6;
	Sat, 15 Nov 2025 00:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w4gYv20p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CD810EBA6;
 Sat, 15 Nov 2025 00:06:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=apLMkstjZDUnlAep/Dvz3preyr8anmj7l6+ahit93CkRHZHPE6xG962AduLv40YNwRrMsmAV7P1F+DHsRBMqbxD8QX5fNtiIBenkS5DaGUuuStR23odO5/ErkVnD2OT/mKryWCsPs0b38QECR4pKxfiOn3TMnmeBR3Fz6o8wfDgot2YEsp7GPcfVKuXVt5wd5r0MnpcgAx7/l5i4BXKaOFvo3TZcE4bYAFBnGiH/txRhOy4KfY02FINkXd6YyvnCLreiXGcrN+OjIp6ZjncALcgO5eUdaxvWyPKqTLxHGUMcYWwR7kkK0bxfJKrzAc4fAPyJ3JMHqDAt8YkWGg0TBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1xlLtEORkkpJrkTCoNVH1nzknia/WDIx5uk2YJorls=;
 b=vnpMGexSUkCOAVdgFP2p0lkRFSgDdUIhh1SxujuhRqkfWbWKHPdr+TvPeIq9JPsLbLQrLAMa4VH95EwdKuyvxVE8dIPw3cnWUrKgeFLQDwyPWsxmGmAQm6T6N1AqdypfpcP6LoXrF1/2WSXxbkTkyuUlj1pXzUQfFeLvWDL5w7L0pqiPnbgZhe4MIH3yKb6Qi9HM3pEYALU8RmNU3ioSmxZ7oHJtawfMH6+HaFOOm3VzEAdQ378yRzVqke6rXWVgF7PdU1d8FEVOY5MCWTfJahGWL2U7rLvdcrP9M6PGhZ3f0s4dP3U7PXKK00T/HmJLGJWysy//9J8GZ5kjLAjRkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1xlLtEORkkpJrkTCoNVH1nzknia/WDIx5uk2YJorls=;
 b=w4gYv20paO78F9Vt5qoF6v2OMEXudUyaznmmF55/+CxD21a32Z91zwAxtKnANbkwjco0n2f4jNrlwgds6cu1NXFjR8yswC0yFNtx9xLd7tGTbpyLcA6G/ibKvV2rEYqoU3UCVaB9LfLCc8AZ2KajX2Hhy7eGIUyfb3GZa3sr8QE=
Received: from BY5PR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:1d0::22)
 by DS0PR12MB999081.namprd12.prod.outlook.com (2603:10b6:8:2ff::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:06:40 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::de) by BY5PR04CA0012.outlook.office365.com
 (2603:10b6:a03:1d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:06:39 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:06:35 -0800
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
Subject: [PATCH V13 12/51] Documentation/gpu: document drm_colorop
Date: Fri, 14 Nov 2025 17:01:37 -0700
Message-ID: <20251115000237.3561250-13-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|DS0PR12MB999081:EE_
X-MS-Office365-Filtering-Correlation-Id: 921ba5df-59ff-4fa6-0cfa-08de23dad9ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F23x71v5/+i83QeT7JvGhnD8CfREgSF0PK4VvNhdq93ZTsMr0YvDuZdmCnT0?=
 =?us-ascii?Q?zWOv2wvyJdjt0g5zAdChB1lnWKMLUyn4a0IAX0e1jg9fA3s42QqMLk8kL+LV?=
 =?us-ascii?Q?gHh2sZ+QVecsNzvNn+GN5egOXMDM55mfGImhAyup/NGqhIolnTeD/a83Fb3C?=
 =?us-ascii?Q?ecrc04kRiLPi9H18GVkhE2AC5aRvIWm+Jq652rNEdwArd8qFtvGadOlZLVoq?=
 =?us-ascii?Q?49bNwPkzWbwDVs6u0ius70g6ovi/C923Nor+KKGxV7rR+gKI4zRCSS+cTHsk?=
 =?us-ascii?Q?UeKFc8p5gBxaNSLvh4v9L0p1o9e9kbUeegzrvAVnKAbYmXCoFqASk603wvEc?=
 =?us-ascii?Q?Rw5aVR1wJ90Hk+D0/EK888Tx8AsWxdTeDbMOlppxRwO5VegQ7Vye25SlFDgF?=
 =?us-ascii?Q?V0PLeZfH/NaBmHsJ9BQVOToZ9IQgkiK139Nxhgk6CPLkvRyq22NXWAAiw96y?=
 =?us-ascii?Q?X2IMnMiHngEwYcN3ADKuJMIfx04AFkOXjLJ6O9QcKHxEAKhwYaEbcymUwths?=
 =?us-ascii?Q?MovO/eOSXJDXEEJcmdZgQMuEea2QchVY0KNPIGnrW15gbQmE79+DNWK5xNZk?=
 =?us-ascii?Q?mUEDlje8mO9LybUNQeVpqBNZoOa/hDQ9lMXnlpLOSx7VofO+kX2ZfPDA4Srr?=
 =?us-ascii?Q?ejlRYx3m7OIYwJh6Nth0h46r8WQWJfX8PvI3F5JTo+ue7teUlNkdkLWxnETL?=
 =?us-ascii?Q?QlbIH9pBJ//cIcF+ZbnTPRckY+AoElNY69ekdPaQY44DHqvAXGTaVvu+kASc?=
 =?us-ascii?Q?11weIkc3BaCPGWw53lvhxykffXVATgC9dLCqx4C7YqlSzUawLbWGRg++0+pj?=
 =?us-ascii?Q?D5a+gCrQWam74p/IGmSMyPn3mu2gsgAH4Q/MJcTdqDM7ph9uBMkorIcMFdN/?=
 =?us-ascii?Q?uRqEyKV6BR7DzL/KZM1X2u2MSEUCuiRzUZcHSLQSRAUeNxHDk+/bArpqhS1Q?=
 =?us-ascii?Q?aAAfiUfZocbiYRroo1a/IyPIlANHbfKc8cvQbdFYKlkf6v1DM0oorptbbmO7?=
 =?us-ascii?Q?O6BSgKm9IICZt5nrb5+aDx6caecMH0nY4BIaMfkNOeb6Tzrh032ucxFrvGou?=
 =?us-ascii?Q?Az8zMliVmrdjB6H+mBiwyS8PEKVDdd4Pezi3IQnLIQkmwFbf7jmqPqILcWJB?=
 =?us-ascii?Q?9eVq33RobzcgoibOBNibkRAmBfTJRXJzDtnNprB17wJRaaMy856qzZ+zBeSJ?=
 =?us-ascii?Q?Q9LAEoDGqL6dG6vCGYD9rboeYoZc6dY66Z1u4XrgmHIZ1xXYESy7AGBQPv1h?=
 =?us-ascii?Q?z7/33XSzgxBWkK544x0QvCuD7OqAan1fRWkdqvvrIE1CGmy92CmfZerKPZ8s?=
 =?us-ascii?Q?dN2k1HiP8DQeO+mid/e8Nh8bEkeZMF/1kSm9anmo+tzHPCE6PbKT7MykIEWE?=
 =?us-ascii?Q?aiil3S2KigWufWy9TLE9NWtr9N3CTuJUJCul0kxsaJA4S2AU5xf/bIJ+TpYr?=
 =?us-ascii?Q?wBenlSVxEXyLMsegaESq4OjRFECbUrqCi7OmbhM1OMZ8jrd5YR486gXOaNXn?=
 =?us-ascii?Q?Pb6Rbju2l2sUAVYbvmzObbxyc9lljJ8dF5dGoUSocJ+gZWwgUwoN0z9/CtvV?=
 =?us-ascii?Q?bCOTdUN6ozerybDeV4g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:06:39.5855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921ba5df-59ff-4fa6-0cfa-08de23dad9ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999081
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

