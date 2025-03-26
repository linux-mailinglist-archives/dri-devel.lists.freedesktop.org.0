Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4FAA72790
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9835310E814;
	Wed, 26 Mar 2025 23:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UE78kWHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB9D10E811;
 Wed, 26 Mar 2025 23:57:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPa6bguzn7SERORpyqyYjM8gQ2gCZNwZ7Mp8BI91u/a+O8p+swG7fegLaKcRIRrUMajawW1IF6Aa3j01kqqxxEGeKJS5fx93uXOrYNBKDSc5LSlGzbhLmDmAqVuMwhDbEqWZ9pj8p3q2k7mdr6K4jEYpbbHp103tfqfA+S86NUXATCId9NkRJ7m1Zihje0LiQYpGJ+K8A+6xSGJLrqii+MwOuJEEAile++PIo9qMWTWiOe6W07aW8+C7Fu7BDE99UDgkkp8chQuXMe/8xZpuAscsuJ07TloXf8tdXeW3LjxjOO54Q6XVZTtI81juWQI1/SMmJw60UwCGt972BWarzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKkC9DbAvwH7KFiXQ2/ttZ63e259OMRFu33NSqFpXPw=;
 b=UdS2a4N6dILIlGJZ/GJ6mzmPmm0ajKxNhVOGlV4pZTYDzsqTTTxo9M0o+KufRyChH65Od2M0rN9XTLEUzf310DcvtyfCLKLXxJgBnwaVIcJxg29IkkjcqAArpo93JRytQ3yPoSmZ3Ff3Da7eiGKHLYGT7icsUaa8EAIfWbOQ/z7YjrlOCLGiOQt0Z2aCeP8i5y6Pm2YfHopc/tCM6mZwewSEohasdEb9sKYt/2vz/XVfCnj4xxpnUlZTzPDtEaEwUs7KZSRiSvXOUxuyzhv8KRkx9VjxsBz0kYY6H4DQqdR6bNwEXBr8BdCmQXfdrjVA/tdZd90lDRlQ9LZ55/ypuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKkC9DbAvwH7KFiXQ2/ttZ63e259OMRFu33NSqFpXPw=;
 b=UE78kWHB8pITaPhyqjl2nT6ULVeKTCs7bmSmDFdBAYZBGCK1e6BkS8fy5EnvIxh2yRfhUEXQ+tTXWUdaW7al5bGDJ3sdYVneTpRPfWpz+vOlC2gO4gvoghGAQR3UEj3QpaumkUgG2xT8jMC8C6iorkzMqW0mPzss+ON3mx6aXFs=
Received: from SJ0PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:2c0::10)
 by DM6PR12MB4434.namprd12.prod.outlook.com (2603:10b6:5:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 23:57:06 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::ab) by SJ0PR13CA0005.outlook.office365.com
 (2603:10b6:a03:2c0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:57:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:57:05 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:57:02 -0500
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
Subject: [PATCH V8 36/43] drm/amd/display: add multiplier colorop
Date: Wed, 26 Mar 2025 17:47:17 -0600
Message-ID: <20250326234748.2982010-37-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|DM6PR12MB4434:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8a2ae8-71a0-441a-0957-08dd6cc1e988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ueKnwNe+dVnSoXV9YxA23kty7+y/d3+DfuslzgpSPfGYCiQW7q9Li0Cw/MlW?=
 =?us-ascii?Q?WZ05V8cEW85LoEzPYLd246wCHMWzjB2iNWwnIIh8e332WiOl3B4A0n0pqwd5?=
 =?us-ascii?Q?WPlx/V/fxOVo1wLrmw8WibnYHztEfFt7KtS07YKArw3W1Y/+vXo+8xSFE3rf?=
 =?us-ascii?Q?n3HGmuO9mCqcbge8pRL82Ydt2I2HJaO9Qqndit8BaOnX0hqwY67q8Zj6L+2k?=
 =?us-ascii?Q?R5012tgmSTsUN3hM3vxUZM7Dy+Q5hsNZ6cRlAT/cJ4xn2cFNq7YsmdAUSlca?=
 =?us-ascii?Q?/e0Ny3nuzHIhiUyd8t/Mv4nFnugBvWovUq0tb1eIxWp5al8xAz51yUfwTgmV?=
 =?us-ascii?Q?/URrX+KH1lFD6D+RNqS0aAtGxP0PljUvwQQ5hGfDm25p7cn/duj/iy8jDfWF?=
 =?us-ascii?Q?BgibAr+tPQ8Iyoh8irp3El0AXt1It8H/lCP6NL6qk/oF++pSWhLHcDCOd2On?=
 =?us-ascii?Q?p79hFd2GYxYPZUV4eLfbcCc0P0GvMwhbmPhIOCBa62kksOORQAYdGBhohvwl?=
 =?us-ascii?Q?Z6ALpGIDfgSoiRA9eMctdbiNBAwtya5sGlO2+TP3dMAGFCn6tZ1CkGeHQlw6?=
 =?us-ascii?Q?fpO//gzWY7gJWgX1o2Bm2Y3YMF3CjDFPL2HCpgqzOaj4xySeuzYB7EhFUKpT?=
 =?us-ascii?Q?ZFD6AjWM8ZIHdgo6P2n+LgtynP5GGyhXGf7xKZ9765RNcfCQP8yJhbi2wLiG?=
 =?us-ascii?Q?SvINYEuv8iCzvOat8hwrqv/5HNefnTFAB0X/omnG8lnOUXBn93BdSaGfVkGk?=
 =?us-ascii?Q?iRvzOyCUaIHmFTnXz850IlFMDSyNGLbPSQTzbdcYtbdU2/aHJWCiLMA77bxI?=
 =?us-ascii?Q?vRDnhGWeM4Rg278rOQanMA6tMjl+NzF2/sRbQ5j+u8LuFBsKOS34/nMzgJyH?=
 =?us-ascii?Q?G9HVrlbUXgMmSiy/tOuZk8EVtrrk7N62WvZXDQkT4fh+KQ/LXiD7yy+4EDCV?=
 =?us-ascii?Q?9EE3FC0gBUScvcdM5tdfxBN89TLYNNiDhjuzLuGrYiThh59xUPO/QlzPij80?=
 =?us-ascii?Q?9VKi+HdaVaJ/iA9JbTptnMCSMN4oC6if8aoqmVKJHaSz04UaC5ybebMYH7n4?=
 =?us-ascii?Q?uKV3e+GWcM4be0k+zuF6dXXwIhzaZbETx3qTsWv0TZSmDjhBBiIdCYQ4gUxE?=
 =?us-ascii?Q?yHeV6y+oGeqLwwiAL1p1Ln7dt/fjEcszIWAY/tk/H+dWqABxziyyGrwZNMHx?=
 =?us-ascii?Q?yhso01jdXd7CDd6RNUwVMbN6f/RL+R6PYbY+utHEroI4YIru0zf/e3CGFiUB?=
 =?us-ascii?Q?Tn+XXSDw4jmD3AO0a3XCnkNoPX+NeXU5x/Ed/c261nCCYv6y/Qzf9BSnIVCk?=
 =?us-ascii?Q?0vxHZ9otOmU+PswlXSA++J+A8l9KinIrKx0T1VOGvd2tNS7V3VqXCZ5it98G?=
 =?us-ascii?Q?/Iw7I4HedUCto+8xDS9NzbbfJaDq/bf9uKP1FC9TofT2qNNvuhpHgv3s7vcd?=
 =?us-ascii?Q?OscBMDBbtinzwKnSS/9XePyx0mOcDHS+5Rj4eMh/1ObwfG6Eu2WBm+Jq4CGo?=
 =?us-ascii?Q?O2NnZQRAPBsUHxn1iwZOElzRFKN7fGEE+gdJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:57:05.7566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8a2ae8-71a0-441a-0957-08dd6cc1e988
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4434
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

This adds support for a multiplier. This multiplier is
programmed via the HDR Multiplier in DCN.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-multiply_125
kms_colorop --run plane-XR30-XR30-multiply_inv_125

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. Multiplier
4. 1D curve colorop
5. 1D LUT
6. 1D curve colorop
7. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 16 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 8a9404339da0..e3ae0c32da2b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1252,6 +1252,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
 	return 0;
 }
 
+static int
+__set_dm_plane_colorop_multiplier(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	int i = 0;
+
+	/* Multiplier */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_MULTIPLIER) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_MULTIPLIER) {
+		drm_dbg(dev, "Multiplier colorop with ID: %d\n", colorop->base.id);
+		dc_plane_state->hdr_mult = amdgpu_dm_fixpt_from_s3132(colorop_state->multiplier);
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1466,6 +1495,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* Multiplier */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no multiplier colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_multiplier(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 9a9386bf85ec..33156531d751 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -91,6 +91,22 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* Multiplier */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_mult_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
 	/* 1D curve - SHAPER TF */
 	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!ops[i]) {
-- 
2.43.0

