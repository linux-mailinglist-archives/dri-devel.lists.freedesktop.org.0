Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA098C1E461
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FF010E97F;
	Thu, 30 Oct 2025 03:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q7/HkmBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E227010E96C;
 Thu, 30 Oct 2025 03:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reGMbBW6JuAA+Ffrq3V0JVQLKVvT+TiyGpu79bSgqf7HMpwaSKTWjujbK+lbUmQtN12qaZe0CzDri9Hl43iREsIhNeXFBmqbC1Z4BW4HxO9UauSXY2wVt87zoUtAfjn5hP9gPH2v52SvrUpkA/DVIqzKVmiSojFlROGniQSrdKzXa3Oii0RydrmuKRISxyiK9YtSHY6QCbITaeatP/cbYRxsXRZ9F9lg4L7v84EfQBJ0+aP/MNhD9YjaVVrFzVc30k2J3HEP73YU3NecaNIbDrX2vtNXIWIXTwd21isrhzytoEdx04utCd5uYXT61wdb3UQQvJ10BKEe5BHG0nIPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSpOGDkLghQfiqTEEh3h3cRd5n/ZtDx/E2FbYOLlpAw=;
 b=cjyZiFf6XCsSGZZl2ncYh5LSZvergU6O9FmYpyfcoc5n4qI95OamcnQ3FegVOh41gK6AncNemZGK9WJE8Anj6cev87qdBvKBNLsA+chk3t3PfHRwYIt7jA/PRXVtSryb5DhipgmuuRjh0zJUYdpQ5lSsB58mnRBSEOXlayuGT7KJwKJhty0fCLNCj2k01zgS+qI/qVzuNsLYQtlgCfeV+CUshGiTO/OUcqKsMZURaAVXKxuSHZRu0YFJZwbFS8qzIiGKtl7uwSDp/cUZfHT4scQM3CKCA6QOFtiEC12+t5iN2tTQ5s9X8n00y16GumxGawBQR7yTTgZcl7Xr5f0ecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSpOGDkLghQfiqTEEh3h3cRd5n/ZtDx/E2FbYOLlpAw=;
 b=q7/HkmBk2tJAEDlfyJSkBeQtet8TUgKvMuqPH0XHKVr2OqMiA5YhzFvKSDCgZCLSZORgt5NQVvDElOQrueXV7IgxXuaPgkEFxLxLmQy+SxaxYiZmTTePgmLRSRLg2720c3GZpsfqQX4lIH7JP3VlqXKXqv04rhOfOURPTV0Jp1c=
Received: from MN0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:52c::35)
 by SA1PR12MB7294.namprd12.prod.outlook.com (2603:10b6:806:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 03:51:15 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::6d) by MN0PR05CA0012.outlook.office365.com
 (2603:10b6:208:52c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.5 via Frontend Transport; Thu,
 30 Oct 2025 03:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:51:15 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:51:11 -0700
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
Subject: [PATCH V12 26/49] drm/amd/display: Add support for sRGB EOTF in DEGAM
 block
Date: Wed, 29 Oct 2025 21:42:31 -0600
Message-ID: <20251030034349.2309829-27-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SA1PR12MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5a1aec-630b-4230-42e6-08de1767935c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pxw9WDFEsD+DQvrct4w27XlQzZW5NtOOIBTe9w6dgjIxWAe9kwz6h3CMSzID?=
 =?us-ascii?Q?+Jezm9pzzDi/spFU3eV8LopOx8Ld+UfE5goCGcHoTiZGPC/JLOKWFPcyM5Zl?=
 =?us-ascii?Q?s7/ujIKr5oTMSotoxJmiUEN0FdsRLpt6+KTp03637MJxQO+AD3vSTOAdBnMK?=
 =?us-ascii?Q?is1LI7y7Koo2RICHDwtMbq4TJSPusttVsPfWGgKYvhN4XvOUYMwhwdgWrccQ?=
 =?us-ascii?Q?E5EiesFruDBOiSTgPnEgN84d/jaxPRsGMYmVL9swuePNeBLUrgNbBZzJoIqt?=
 =?us-ascii?Q?Xq0hMTnPNe1+ZnFgxxFurSRUBFF/ecZs+RynWZkhjRtCADU18Uh24UxQ9EBI?=
 =?us-ascii?Q?FkHAkQygnbx0+iT8/IYLJuwsucSdE8c/qLjMXOgF1kmITPJb09yBz4dyo6kN?=
 =?us-ascii?Q?Ng5KoIByYIUHE50grI4Cyfc3wC+L0KT+aEAFPQYXvZkLNwe128QRuoyBCFzc?=
 =?us-ascii?Q?qPAaWlh9WRAAmfzNJ6Rk+DQ7au6/adUYfs37Tnbb9VjRqQ8xvWml/CAzsXPc?=
 =?us-ascii?Q?998B1EOaevLmOAFi/YzG0XGoXg0gkq1xJqBcYBQ8n6bcGUAeNhAfByfERcpH?=
 =?us-ascii?Q?6lgoXnARjdmQCS6Hv6MUI0oqY7E7GrfRM7ZCaUJv8VOnovc6YJPIV2CGSQ/i?=
 =?us-ascii?Q?4q7RafUzEWAPtgXAOSsNF3N9JjUzH88NQD9xdiMl8aWWE2v9vgoohDvVe/d2?=
 =?us-ascii?Q?5735hxS6eVw0d45urhp+kuXD1QCr0Fxdsj06mICm28f3tjPjIJQm1B6HRK1n?=
 =?us-ascii?Q?nAffhkLamkUe+nfXosQobZTucVUbSGrJQNgEHaOFf/82GbWMrU98lUs3qPmP?=
 =?us-ascii?Q?EzWlSmWhUqYnfJflsQ2NR4F99WtF1gXUWlsrwZYXjQ6Hu9zpF4Nw05XRR6Fe?=
 =?us-ascii?Q?RuWHxxrYRij4xD2rzzKixj7h2/6/y4TwX2og0NXO5W61v+D8oeKiPcFQedBL?=
 =?us-ascii?Q?T5JRfEWMEtFa4UXcFHBbWMAb8QfFgaiZYAWjJIapprSkMrPfN9EPaJ/YJ1S+?=
 =?us-ascii?Q?k3n/Rp+u0Uju4iMtxQXPQ7HyS9WgkmELSPFiKwsvfwSOYhdcabi7RTGz3OtY?=
 =?us-ascii?Q?bbkJPblnMBgNNheIdwzmC7fiIGzZd9PM/ChRdbGGpGw3E3C01+28e5dndZut?=
 =?us-ascii?Q?iuReXWY7GgdJ05wJ+5VtEdNdoMBjoqTKBqJsIRLIec6SO3GRbS5YJx61vPrs?=
 =?us-ascii?Q?MnNkpSbJoBPHoi1dCTYs08A8r/kcoXET+uWzoV3sUXACiG37GsspS7YQ0ykB?=
 =?us-ascii?Q?veD4Ij1kga+6e+0Nlon20HDzKaNxkF4MoTD0bFKysMgp2fiXRfvYKH7gCwJy?=
 =?us-ascii?Q?SjwcvgwOl1txw/npU/U2tgWhi8FmJg26PzCvSvNLxLeLQ88RW5G0ik9yUXgY?=
 =?us-ascii?Q?TLoip5fIyBUg7F+eb9eBG+xDhs0LmsW4MBX/iwpq0v4sbCWzxGxAAQymhuzE?=
 =?us-ascii?Q?dMKWL0jf6GwqQrX3a5fbxCPWBHEbLv4BIvyHOgnmHnJxU1A3dAOAaGKOjeZf?=
 =?us-ascii?Q?48MP1L4k+9DKVOU8SNsKBhyLDZ+ssRDokm4jiXwkCtc9EZZYS7bfv2rFo5GY?=
 =?us-ascii?Q?PT4kp8SxgEROkzmhJlg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:51:15.4124 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5a1aec-630b-4230-42e6-08de1767935c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7294
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

Expose one 1D curve colorop with support for
DRM_COLOROP_1D_CURVE_SRGB_EOTF and program HW to perform
the sRGB transform when the colorop is not in bypass.

With this change the following IGT test passes:
kms_colorop --run plane-XR30-XR30-srgb_eotf

The color pipeline now consists of a single colorop:
1. 1D curve colorop w/ sRGB EOTF

Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v11:
 - Create color pipeline on supported hardware only (Melissa Wen)

v10:
 - Replace DRM_ERROR by drm_err
 - Creaet color pipeline when >= DCN_VERSION_3_0

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)
 - Update replace cleanup code by drm_colorop_pipeline_destroy (Simon Ser)

v8:
 - Fix incorrect && by || in __set_colorop_in_tf_1d_curve (Leo Li)

v7:
 - Fix checkpatch warnings
  - Change switch "{ }" position
  - Delete double ";"
  - Delete "{ }" for single-line if-statement
  - Add a new line at EOF
  - Change SPDX-License-Identifier: GPL-2.0+ from // to /* */

v6:
 - cleanup if colorop alloc or init fails

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |  3 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 86 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 71 +++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h | 34 ++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 ++++-
 5 files changed, 211 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
index 7329b8cc2576..8e949fe77312 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/Makefile
@@ -39,7 +39,8 @@ AMDGPUDM = \
 	amdgpu_dm_psr.o \
 	amdgpu_dm_replay.o \
 	amdgpu_dm_quirks.o \
-	amdgpu_dm_wb.o
+	amdgpu_dm_wb.o \
+	amdgpu_dm_colorop.o
 
 ifdef CONFIG_DRM_AMD_DC_FP
 AMDGPUDM += dc_fpu.o
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a4ac6d442278..23acc035b62d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -667,6 +667,18 @@ amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
 	}
 }
 
+static enum dc_transfer_func_predefined
+amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
+{
+	switch (tf) {
+	case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+	case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+		return TRANSFER_FUNCTION_SRGB;
+	default:
+		return TRANSFER_FUNCTION_LINEAR;
+	}
+}
+
 static void __to_dc_lut3d_color(struct dc_rgb *rgb,
 				const struct drm_color_lut lut,
 				int bit_precision)
@@ -1177,6 +1189,59 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
+		       struct drm_colorop_state *colorop_state)
+{
+	struct dc_transfer_func *tf = &dc_plane_state->in_transfer_func;
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct drm_device *drm = colorop->dev;
+
+	if (colorop->type != DRM_COLOROP_1D_CURVE ||
+	    colorop_state->curve_1d_type != DRM_COLOROP_1D_CURVE_SRGB_EOTF)
+		return -EINVAL;
+
+	if (colorop_state->bypass) {
+		tf->type = TF_TYPE_BYPASS;
+		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		return 0;
+	}
+
+	drm_dbg(drm, "Degamma colorop with ID: %d\n", colorop->base.id);
+
+	tf->type = TF_TYPE_PREDEFINED;
+	tf->tf = amdgpu_colorop_tf_to_dc_tf(colorop_state->curve_1d_type);
+
+	return 0;
+}
+
+static int
+__set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
+			       struct dc_plane_state *dc_plane_state,
+			       struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	int i = 0;
+
+	old_colorop = colorop;
+
+	/* 1st op: 1d curve - degamma */
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->curve_1d_type == DRM_COLOROP_1D_CURVE_SRGB_EOTF) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (!colorop_state)
+		return -EINVAL;
+
+	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
+}
+
 static int
 amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 				     struct dc_plane_state *dc_plane_state)
@@ -1227,6 +1292,24 @@ amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
+		       struct dc_plane_state *dc_plane_state)
+{
+	struct drm_colorop *colorop = plane_state->color_pipeline;
+	int ret;
+
+	/* 1D Curve - DEGAM TF */
+	if (!colorop)
+		return -EINVAL;
+
+	ret = __set_dm_plane_colorop_degamma(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
  * @crtc: amdgpu_dm crtc state
@@ -1323,5 +1406,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
 	}
 
+	if (!amdgpu_dm_plane_set_colorop_properties(plane_state, dc_plane_state))
+		return 0;
+
 	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
 }
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
new file mode 100644
index 000000000000..a61250f7fdd4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <drm/drm_print.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_property.h>
+#include <drm/drm_colorop.h>
+
+#include "amdgpu_dm_colorop.h"
+
+const u64 amdgpu_dm_supported_degam_tfs =
+	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF);
+
+#define MAX_COLOR_PIPELINE_OPS 10
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct drm_device *dev = plane->dev;
+	int ret;
+	int i = 0;
+
+	memset(ops, 0, sizeof(ops));
+
+	/* 1D curve - DEGAM TF */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, amdgpu_dm_supported_degam_tfs);
+	if (ret)
+		goto cleanup;
+
+	list->type = ops[i]->base.id;
+	list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]->base.id);
+
+	return 0;
+
+cleanup:
+	if (ret == -ENOMEM)
+		drm_err(plane->dev, "KMS: Failed to allocate colorop\n");
+
+	drm_colorop_pipeline_destroy(dev);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
new file mode 100644
index 000000000000..3324e2a66079
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __AMDGPU_DM_COLOROP_H__
+#define __AMDGPU_DM_COLOROP_H__
+
+extern const u64 amdgpu_dm_supported_degam_tfs;
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
+
+#endif /* __AMDGPU_DM_COLOROP_H__*/
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index f3efaf55e099..f79ad08c0c57 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -37,6 +37,7 @@
 #include "amdgpu_display.h"
 #include "amdgpu_dm_trace.h"
 #include "amdgpu_dm_plane.h"
+#include "amdgpu_dm_colorop.h"
 #include "gc/gc_11_0_0_offset.h"
 #include "gc/gc_11_0_0_sh_mask.h"
 
@@ -1790,13 +1791,28 @@ static int
 dm_plane_init_colorops(struct drm_plane *plane)
 {
 	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	struct dc *dc = adev->dm.dc;
 	int len = 0;
+	int ret;
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		return 0;
 
-	/* Create COLOR_PIPELINE property and attach */
-	drm_plane_create_color_pipeline_property(plane, pipelines, len);
+	/* initialize pipeline */
+	if (dc->ctx->dce_version >= DCN_VERSION_3_0) {
+		ret = amdgpu_dm_initialize_default_pipeline(plane, &(pipelines[len]));
+		if (ret) {
+			drm_err(plane->dev, "Failed to create color pipeline for plane %d: %d\n",
+				plane->base.id, ret);
+			return ret;
+		}
+		len++;
+
+		/* Create COLOR_PIPELINE property and attach */
+		drm_plane_create_color_pipeline_property(plane, pipelines, len);
+	}
 
 	return 0;
 }
-- 
2.43.0

