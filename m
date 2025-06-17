Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53650ADC080
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A690F10E4C1;
	Tue, 17 Jun 2025 04:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HHyk43Tr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F03A10E4C1;
 Tue, 17 Jun 2025 04:26:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgSMqWnEchMqV8nyY84BdO9vpY90GCuA/Hxui/GE1j6qhLwWv0ErQjYa4yk9uzw/KlhNfb8bB5KQWD8PZ4T+RVwzdGvt8RkEmAARO08EQQsHOYxGpGh7mDDMAqiexhtlo+7Yi2bjsKeWZXLxbNlB8kfwg5RVaojJkmG1ERMMqaHzKMMk49YMWUNRI/Mzx//+G5EEGIAk+XIHfFXDIM0Wq9gnzPfmnw/o1e3bmdVl8eO0yPB9pdM5SSxpiFSk3ogXgigoxoSzB/0M11xuktPqaPHEHR7QuZvpYJ3DKhp9gHLvA7VE36HNGShbTSTI6+9fLKh6IM/QTbCInD1kk4H7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1Ozy3XPbjqOnR4wHLcMwiE8A/iPmBilfKsCCPyIl34=;
 b=pAGm6D+J3kqh5GzEWwP5wt8PMWmh09XLEN2by2OvEfuSLP7iC2Bc4sG77qg5UJ3L240HIYl8BO34xFSnoZMH6c1CppiKQBIy0GILzxBBnLed2ChrRYkwBp5klfArQ7IJICRcK/lF4seG3Ur8A7Shf7AHc5Hc/EPHwvdPZTaHuWhjm8jVJlpzLyXS08cDcky+E3wjulEXwFv3++rKfz6C1fFVXxSod5RwwJhgQVllCukgdGveFBbHwGQ9yMjoRD4/Moh/dpUlRV85jG/vgIgWlchFg/iuL9mAjzogQNMYKNYU4sb5S+UWnu3274Mdkat6sDaIsYVKmwtfeQAXdCSYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1Ozy3XPbjqOnR4wHLcMwiE8A/iPmBilfKsCCPyIl34=;
 b=HHyk43TreiOgeJYipx2+GFmqdn1ct5QxUdlSoY9C/JrHF4ljiyVsMvDigEw3mnbpCqIP83yMEsQlgxFZqZr1X+Teu/jNC+qe1K59ekOduTYinI4fsPU98jxaqh4C61Tw/QNxLOYebhnlbvsiDUnENo438Fu0p7FAES7nswHclAg=
Received: from CH5PR04CA0019.namprd04.prod.outlook.com (2603:10b6:610:1f4::8)
 by DM3PR12MB9413.namprd12.prod.outlook.com (2603:10b6:8:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:26:49 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:1f4:cafe::ea) by CH5PR04CA0019.outlook.office365.com
 (2603:10b6:610:1f4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.26 via Frontend Transport; Tue,
 17 Jun 2025 04:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:26:48 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:26:44 -0500
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
Subject: [PATCH V10 36/46] drm/amd/display: add 3x4 matrix colorop
Date: Mon, 16 Jun 2025 22:17:18 -0600
Message-ID: <20250617041746.2884343-37-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|DM3PR12MB9413:EE_
X-MS-Office365-Filtering-Correlation-Id: 704ce9f3-4ab0-4b6d-9043-08ddad572d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lfi1qsHgbUDm+zIMxfbAPTY9A2Tcqsy5e9Ex9YNlbEyDpMsumjZTNU8EDJxs?=
 =?us-ascii?Q?te5EZFSZkfdza8NMiEhbcKgSnckL+R7BG3yV6alHY37/rfo8lEpV7VvPKB2j?=
 =?us-ascii?Q?xlpZ9dU6jgArY7v7/B3+wJIr4lNYSam/RFZDXB/E0stRJxzW7hKo2lmkDQI8?=
 =?us-ascii?Q?EtschTwKTOrD6hZyv/Z2ycososbUJoOkwB5YvQG9N9IKxHQ2bCpeQy3uQwP8?=
 =?us-ascii?Q?DaID3kqjy+NKClkmBKBDVn16/RGGeoDew1ew4Ito9kR0BLt7S2LHLcsgqaRi?=
 =?us-ascii?Q?IaCtL1lZjQqLnazy3/zwsfsANuUYoBuCLbyNSdddrRSzlKa2y+PwD5vCd1+e?=
 =?us-ascii?Q?yNpr9zkmoXbyfiOzFCr1JDGRVCItMoP6M0ArdKyYDjlHMSFFAbGPiT7WOM7x?=
 =?us-ascii?Q?mfluMoHxZqBIJwSmeBCigXQmSeNsDIWsvcl+0EijynQTWR85MMnl9ryMi6hl?=
 =?us-ascii?Q?g8cvH3PXj0QfJccuwkY8kyb1pBW47xDpkjJZnEGYFKcHIKe8rB1JzWiqwxU+?=
 =?us-ascii?Q?ZoHNB91B4E9YeaiXGF+/C/HYPDvqHgLxmQXtETKfh28nDsWNym0DtxLHyhuz?=
 =?us-ascii?Q?0OR15Y12m9X3mudIQv1vLIY7p3Tyr1ZE11JAS5PmXO6hjfRiPFGYIA+ga19n?=
 =?us-ascii?Q?aFUdWC8hnthzUBn90QMEt1ydE4T763B+nov/58WK09PYEoQAqLYmz1A0++Zl?=
 =?us-ascii?Q?PtcliYeVLfS4wgaVazalXgtwq4pFGHQRjWyBvP9xT1YRy/KF1M1p46AgHxQ0?=
 =?us-ascii?Q?9pgxncjUiF8ks4DTNzyWtOYqDx9eBvqcIki7x3GImwPbtADtb45ZSXuudBj4?=
 =?us-ascii?Q?ZC5l7PTzBVhiXR8kh5b2JymrUlcNT2he5UlLLmK3p+zDQU4gQztWBEaAf7LU?=
 =?us-ascii?Q?JfpE0IS9AOqynRBUkGICB3mpRkW3EBTOV43ZQ4ZaEsApOxQAC1XINy0rm9Bc?=
 =?us-ascii?Q?SCJ3iXScjeHODs6Fv8ro+uVGjkeXa0QyloEpeRDJpyRExVsQR0IEjah2NrjB?=
 =?us-ascii?Q?RAd3CSqOG/KzhESVC7C6d2Jrvz9H2EaDXmPLlabjljuZBMAD7y9pm9DzcLOO?=
 =?us-ascii?Q?OennNRG1oAGxgvO0W+h8M9bjwgIbvpgPGvKxIHC7RmQlKFdRA9E6bWX9pdOC?=
 =?us-ascii?Q?oBUNlV+I1iPNDWJ3lWwCb6EG6NEF7tyQLM6fTFCsaoR3FFpWy6vX1+EsAD6a?=
 =?us-ascii?Q?q3bZ+ZkzhvqbP8q5dZHBv70ToX6cRhbpnFx1n1+oN0jV9+Lfob4AJvX78sTN?=
 =?us-ascii?Q?pgErHqjvs0du60v/0gH/k2ZAjM5TP9wXj3oRZBQb9Q2oJhNr+0/u2InPz6lx?=
 =?us-ascii?Q?CRBinI1OtkWLKBisFJqc6KD7DM7cgOGN1QqmhczFLhjdG1ed7quLYz9vl9bD?=
 =?us-ascii?Q?9esciaR+1GivXCYf77I64JI0XLZKDAzVui4c4Frc6EgukRx0ZS9k4cQ0Wq5L?=
 =?us-ascii?Q?9GbSRFakIky67xEMQ+dnh2y/xjEcyn/OPs/i2ME/N//oj4QffWDMJzb6a2f4?=
 =?us-ascii?Q?WAOejdoMS0no81Y8oBB51ikCkgnb+2e/b11j?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:26:48.7248 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 704ce9f3-4ab0-4b6d-9043-08ddad572d27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9413
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

This adds support for a 3x4 color transformation matrix.

With this change the following IGT tests pass:
kms_colorop --run plane-XR30-XR30-ctm_3x4_50_desat
kms_colorop --run plane-XR30-XR30-ctm_3x4_overdrive
kms_colorop --run plane-XR30-XR30-ctm_3x4_oversaturate
kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_enc
kms_colorop --run plane-XR30-XR30-ctm_3x4_bt709_dec

The color pipeline now consists of the following colorops:
1. 1D curve colorop
2. 3x4 CTM
3. 1D curve colorop
4. 1D LUT
5. 1D curve colorop
6. 1D LUT

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
V10: 
 - Change %lu to %zu for sizeof() in drm_warn (kernel test robot)
 - Remove redundant DRM_ERROR(...)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)

v7:
 - Change %lu to %zu for sizeof() in drm_warn

v6:
 - fix warnings in dbg prints

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 52 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 ++++++
 2 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 2b97a262b1c0..b0223c6884c1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1344,6 +1344,47 @@ __set_dm_plane_colorop_degamma(struct drm_plane_state *plane_state,
 	return __set_colorop_in_tf_1d_curve(dc_plane_state, colorop_state);
 }
 
+static int
+__set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
+				  struct dc_plane_state *dc_plane_state,
+				  struct drm_colorop *colorop)
+{
+	struct drm_colorop *old_colorop;
+	struct drm_colorop_state *colorop_state = NULL, *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->state;
+	const struct drm_device *dev = colorop->dev;
+	const struct drm_property_blob *blob;
+	struct drm_color_ctm_3x4 *ctm = NULL;
+	int i = 0;
+
+	/* 3x4 matrix */
+	old_colorop = colorop;
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		if (new_colorop_state->colorop == old_colorop &&
+		    new_colorop_state->colorop->type == DRM_COLOROP_CTM_3X4) {
+			colorop_state = new_colorop_state;
+			break;
+		}
+	}
+
+	if (colorop_state && !colorop_state->bypass && colorop->type == DRM_COLOROP_CTM_3X4) {
+		drm_dbg(dev, "3x4 matrix colorop with ID: %d\n", colorop->base.id);
+		blob = colorop_state->data;
+		if (blob->length == sizeof(struct drm_color_ctm_3x4)) {
+			ctm = blob ? (struct drm_color_ctm_3x4 *) blob->data : NULL;
+			__drm_ctm_3x4_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
+			dc_plane_state->gamut_remap_matrix.enable_remap = true;
+			dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
+		} else {
+			drm_warn(dev, "blob->length (%zu) isn't equal to drm_color_ctm_3x4 (%zu)\n",
+				 blob->length, sizeof(struct drm_color_ctm_3x4));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int
 __set_dm_plane_colorop_shaper(struct drm_plane_state *plane_state,
 			      struct dc_plane_state *dc_plane_state,
@@ -1547,6 +1588,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
 	if (ret)
 		return ret;
 
+	/* 3x4 matrix */
+	colorop = colorop->next;
+	if (!colorop) {
+		drm_dbg(dev, "no 3x4 matrix colorop found\n");
+		return -EINVAL;
+	}
+
+	ret = __set_dm_plane_colorop_3x4_matrix(plane_state, dc_plane_state, colorop);
+	if (ret)
+		return ret;
+
 	/* 1D Curve & LUT - SHAPER TF & LUT */
 	colorop = colorop->next;
 	if (!colorop) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 427fe5050d0d..3b099eba67d6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -74,6 +74,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* 3x4 matrix */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
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

