Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954CB9F8B99
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1AE10EEEB;
	Fri, 20 Dec 2024 04:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Zi9qtwwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7AD10EEEA;
 Fri, 20 Dec 2024 04:46:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on1GhufKrzzZgLFqeN9RmFqkQgYgKB3OKUpmUewfv/oztyy3H/FJo/BxxBytpm+iOXz0sMhtxjEgtBY+1I0H5EeG7t2LkEJHKA9OxTrQQU/ykqYP7+07vomF2o0wU9XL/AkUnesWEHyfBQJ4q2Uj2+yAi8DLpjln3yKCZvNMYkbivqxLZdg+T922o7oJeekMKA/PFMo+/5/Gm9XT12lDYFrRmLQNorzEG51g66F3FDiUTsX7xT02vKvMmn46l42Sl5YEsG9xDwHaE26B4rxT+QJPRvdt1f7+atG9uP/glX9vSddsbnorJf2f5lhzhBTyfNf1RxRwVxRr7gVQBMRsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IG2IHCwzGp/tKsqbKJZDIL/UTE0qBqa3jpAPSnQ4dOI=;
 b=BXJkGh0T1U5dws6sOI8GuuFo4nIdQLVHJhBl7lWhwben93Y/KXFDBO6FbJGrOgSfn668Cx6dieWQASuWovFlE3eyK/3y4kaBX863VT8WFHRkfUHJqITUDMn2KzmnOiR3T+iYe7U22FhukA8K5IJllzwCkdGWMwBIu6wf9ZDgvFIkmWMKqLie9SUsigJZBY5u0P6D0fvnpKmttcN8hdfYl4ZY8qV+enSdyC6z7QTUIsosw0QG5o0K5GsL1WulusNbPvzg+fDC7LDsqcOfAZiBpSaqtmb8K5QhwIVgEexVJEKZr+Uvqfr8pKZJa3/2q0whqN9HGnAGrxhTXk3dirmQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IG2IHCwzGp/tKsqbKJZDIL/UTE0qBqa3jpAPSnQ4dOI=;
 b=Zi9qtwwprflbekcnW3F/aLjenQdvLMnJWIL1r15t1z1hHKrB415oHAHGAOG5WuK6bc/8H0LZ8FEnnxLymojLIo/TJ0uZJvDa56+gFSGxQa+ygNNR2JsxASy2raRaQ0ftF16Y4Jm1odu008TcuD+/9XNwVI8Xj5aU/TjERqBnREE=
Received: from MW4PR03CA0171.namprd03.prod.outlook.com (2603:10b6:303:8d::26)
 by SA1PR12MB5638.namprd12.prod.outlook.com (2603:10b6:806:229::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Fri, 20 Dec
 2024 04:46:20 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:303:8d:cafe::5) by MW4PR03CA0171.outlook.office365.com
 (2603:10b6:303:8d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Fri,
 20 Dec 2024 04:46:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:46:19 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:46:18 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 39/45] drm/colorop: Define LUT_1D interpolation
Date: Thu, 19 Dec 2024 21:33:45 -0700
Message-ID: <20241220043410.416867-40-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|SA1PR12MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: f69d5c0f-1689-47c6-4dc3-08dd20b13f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xKvN16WLkrwxDk3eiVG5FsFQrmlLN6wFIg60EGPc04v5xxc2xqkW74ziV0ZK?=
 =?us-ascii?Q?3FW+5BcnGN6fNqQwDCc1vq2QYc2kQiCUx2P4N0ugAn+sUFv0iQF/eHmIZM0K?=
 =?us-ascii?Q?h9FKDMFMicD8OFqzrmmEgGeQNZeIYyqC6S0diAnfeP2JBTBciKYsIosFty0n?=
 =?us-ascii?Q?moJNnsXZW2PPtCOvHYIMDslceYCq5LFzJAeia1t9H5cjUXfx8NzhVpqfTGDL?=
 =?us-ascii?Q?5FhKVRh84UKC3Gt1tAZq5IhdnqxzEGUjEapO3WsAg6x2kifxQOCbEl7XSItP?=
 =?us-ascii?Q?eCk+ClUbFlS8LUzdV4VKo0sTZLGl00qhClh8RfeKcIF7Rkao3Mv9RyBRcI89?=
 =?us-ascii?Q?VfXRYoAejN0VBbXPE82NDXobRrc2SNVjOm/GGwwFJfH/IWRbbJ8Lx/eV/H69?=
 =?us-ascii?Q?v7gY7sWYgAIqiarso2yGYroRwbrrgHaY58Jb1w+MAaF9iJnitOMx3fbymGJu?=
 =?us-ascii?Q?XrgVxnI0RVoU9b3C3VgLT2azktLOXaYGeZ8G1hDwE5t1jHoHJDEy+gzw3v9c?=
 =?us-ascii?Q?NLHtKmanlG7vAq0FXbHsr85hVH0D/ZPV7ixLsdcCbn6GFZ9A5l4oSLfni6X8?=
 =?us-ascii?Q?6FlNDRBie5bktYrxsHnrSk6T2y6Eyqang3lJTRi//PV9TlZGvJhbKhAviA6A?=
 =?us-ascii?Q?4pojBNzWcY7BGjAVyyu1AZK4672uS1aCK6N2kY3n8/L1Wsif5Ij5zDvegRvm?=
 =?us-ascii?Q?NIkzKR9y97E0tM1VC3rIlVKvn2JwazooM8CuPgHUq+2UINWz17fwxwKmacfe?=
 =?us-ascii?Q?j6chZOqc1kD7sVxZ3A0VpQZmyhTEcObxtmDn1LHUErvc5WfeLUi6ZRCgFOU7?=
 =?us-ascii?Q?YQew1v5uqixAjBe3Gw90F9VxJEJ2fohwsGTCk8N2fWcCT5SQeH84qAmP0PiH?=
 =?us-ascii?Q?uu2WyLCVWbLZPfhji0mTuL8WzicQ+7viII2crLX3XRYRtkomv9k5v9DCR1Z0?=
 =?us-ascii?Q?U/XQixqSlz1G4d/5jql6dC5P/hIanWp5iPSQHHPZqGvNDxdmXWeJUs0AbcO6?=
 =?us-ascii?Q?ElrUXd0SZOTeys5OFR81yPMtWUnhDRrosWfhtiLYcwUNhGWkPruR3nSTsw6+?=
 =?us-ascii?Q?WFZarXyNmMvmq9PA6pPwMw+lDOwqSgR9X4heDeR+WUrUS386aHI24QPG7PsQ?=
 =?us-ascii?Q?KFbhxkERqezIUS6EdHnEX4W6OL4sT7/qkj9snhP5DlvyRPb1q/26oMvxTveM?=
 =?us-ascii?Q?pwcPCVh4JryZNFplWMgvL6P8gwWzkMdHPTlkssPczai1BmyxU49LzsURI9PJ?=
 =?us-ascii?Q?ViGpCBPs7lXgb91hox3q+5gyxxVMdc5MVqcdR4PN0HvxqqEl5OcyIYXxMv57?=
 =?us-ascii?Q?Zbd2WFiPPULH5pVt/dClLv93fSC9wnBfKDv4EbIdMkjPpe2dTfwqjjaQi2oi?=
 =?us-ascii?Q?LEKIgq+/nGUTMn7K7T50wXWy8bfQk1XlHQLh12xKMR8qkM9EDO9tZF5dyYBu?=
 =?us-ascii?Q?RItLWO0gsqvMRl4Z+EceWzgaP7BoogNNiu181rjgkJc95UzkOmRP9d040dbO?=
 =?us-ascii?Q?5jBdeueb5ezD1mg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:46:19.9703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f69d5c0f-1689-47c6-4dc3-08dd20b13f68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5638
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

We want to make sure userspace is aware of the 1D LUT
interpolation. While linear interpolation is common it
might not be supported on all HW. Give driver implementers
a way to specify their interpolation.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Fix a checkpatch long-line warning
 - Modify state->size to colorop->lut_size

 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c |  6 ++--
 drivers/gpu/drm/drm_atomic.c                  |  2 ++
 drivers/gpu/drm/drm_colorop.c                 | 36 ++++++++++++++++++-
 include/drm/drm_colorop.h                     | 19 +++++++++-
 include/uapi/drm/drm_mode.h                   | 13 +++++++
 5 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index d0777691862b..92c9f3fb0254 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -131,7 +131,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
@@ -163,7 +164,8 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
-	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES);
+	ret = drm_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
+					    DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR);
 	if (ret)
 		goto cleanup;
 
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1fa6818794d6..9a17fe11bcb3 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -795,6 +795,8 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		break;
 	case DRM_COLOROP_1D_LUT:
 		drm_printf(p, "\tsize=%d\n", colorop->lut_size);
+		drm_printf(p, "\tinterpolation=%s\n",
+			   drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
 	case DRM_COLOROP_CTM_3X4:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 9fbfb2b89b1b..e8d8806e94cf 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -78,6 +78,9 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
 };
 
+static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
+	{ DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR, "Linear" },
+};
 
 /* Init Helpers */
 
@@ -234,10 +237,12 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
  * @colorop: The drm_colorop object to initialize
  * @plane: The associated drm_plane
  * @lut_size: LUT size supported by driver
+ * @lut1d_interpolation: 1D LUT interpolation type
  * @return zero on success, -E value on failure
  */
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, uint32_t lut_size)
+				  struct drm_plane *plane, uint32_t lut_size,
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation)
 {
 	struct drm_property *prop;
 	int ret;
@@ -257,6 +262,17 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 	drm_object_attach_property(&colorop->base, colorop->lut_size_property, lut_size);
 	colorop->lut_size = lut_size;
 
+	/* Interpolation */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_IMMUTABLE, "LUT1D_INTERPOLATION",
+					drm_colorop_lut1d_interpolation_list,
+					ARRAY_SIZE(drm_colorop_lut1d_interpolation_list));
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut1d_interpolation_property = prop;
+	drm_object_attach_property(&colorop->base, prop, lut1d_interpolation);
+	colorop->lut1d_interpolation = lut1d_interpolation;
+
 	/* data */
 	ret = drm_colorop_create_data_prop(dev, colorop);
 	if (ret)
@@ -411,6 +427,9 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
+static const char * const colorop_lut1d_interpolation_name[] = {
+	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
+};
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 {
@@ -428,6 +447,21 @@ const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type ty
 	return colorop_curve_1d_type_names[type];
 }
 
+/**
+ * drm_get_colorop_lut1d_interpolation_name: return a string for interpolation type
+ * @type: interpolation type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_lut1d_interpolation_name)))
+		return "unknown";
+
+	return colorop_lut1d_interpolation_name[type];
+}
+
 /**
  * drm_colorop_set_next_property - sets the next pointer
  * @colorop: drm colorop
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index d84f457a2b65..01c7f5cd6019 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -253,6 +253,21 @@ struct drm_colorop {
 	 */
 	uint32_t lut_size;
 
+	/**
+	 * @lut1d_interpolation:
+	 *
+	 * Read-only
+	 * Interpolation for DRM_COLOROP_1D_LUT
+	 */
+	enum drm_colorop_lut1d_interpolation_type lut1d_interpolation;
+
+	/**
+	 * @lut1d_interpolation_property:
+	 *
+	 * Read-only property for DRM_COLOROP_1D_LUT interpolation
+	 */
+	struct drm_property *lut1d_interpolation_property;
+
 	/**
 	 * @curve_1d_type_property:
 	 *
@@ -322,7 +337,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
 int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
-				  struct drm_plane *plane, uint32_t lut_size);
+				  struct drm_plane *plane, uint32_t lut_size,
+				  enum drm_colorop_lut1d_interpolation_type lut1d_interpolation);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -376,6 +392,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  * const pointer and hence is threadsafe.
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
+const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 96cb32e6980c..5ef87cb5b242 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -915,6 +915,19 @@ enum drm_colorop_type {
 	DRM_COLOROP_MULTIPLIER,
 };
 
+/**
+ * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
+ */
+enum drm_colorop_lut1d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR:
+	 *
+	 * Linear interpolation. Values between points of the LUT will be
+	 * linearly interpolated.
+	 */
+	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
-- 
2.43.0

