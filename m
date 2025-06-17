Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C09ADC084
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF6B10E695;
	Tue, 17 Jun 2025 04:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="njUYsgE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1EA10E515;
 Tue, 17 Jun 2025 04:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0NdvGReSRQ6DeABeVO7YA3r3K/kTC0dY8Yup9u/Fl/pp8mmQcJB8CEpFh01kVbaaF9OTzOy2vQ0PTt225NOOG8CBRljd2PDqhZYon4Yp7IlWmxM29AyYW9dvXsevGK9Xrihxvh2T45hbagFXmyvuUBA5fEkG0fvp+LjaKP5l61xtx59VjyEG90fmddWxQgU1pGU7DrNdlW9PSTRKeuuVmwd4Mz3KzqQPon87BxaaMLEkB1ZhI/nEE8AA6FA76iPIMABtnVh1JUrgaRs83eiJr3DdGDBVLBXu/pjFre7UBxC+U1b6fJqpfHkXTiI2Q07fHhVy9G+D5wjd5GrIz8yDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VtgUwON5RQ6zfNOVNcMPPj2yMPrv0QQJEtoQWAJg1I=;
 b=THieDDOdlVWAKo+1DBIxjiKMIfvKE/kMJxgsT+86Iw1nZX6eCmC2ZVL1s3/sh+3R3PACnh61rXdmlWw3dM87SH7n/F0A2YPlgLrXY1e6YdN3TGUjxqMm49HSpeA3uIMkpsEgOP6y7t0TwEVZr6+1MDF2CdJsIZtLlLGDWpVz9b8ciye/zmtYOi86mkL3I96HZApNbEWzPo7ZAsVjgcBXQKp8ol6kOq4NbA0DbI0Kt3hm5K4ycEcBm+RjEC+RfP2lVwFekCQWY+C8mOrDAe197+d8VDG0uaNUJaOxJbATLy3OF+uANNl0W2tuIyEo4/8lcIl/zCaMm0TgQBLSR3TgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VtgUwON5RQ6zfNOVNcMPPj2yMPrv0QQJEtoQWAJg1I=;
 b=njUYsgE8cY4AXq65ztIi2KT7rQe2zA8jTGsRRMpeXz1kjafqplK4LWZmrgRjHhthnD/59nR8S5O78fqkyFjt3jFj8Hywx8wZermqrravnB8fxTtIDj58t2IHMmJ4gkKj/jkLWAuotdTsNSYK1DJtsa/qTViyGVSCtiwKu9xXPoY=
Received: from CH0PR03CA0435.namprd03.prod.outlook.com (2603:10b6:610:10e::9)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 04:27:16 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:10e:cafe::d3) by CH0PR03CA0435.outlook.office365.com
 (2603:10b6:610:10e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 04:27:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:27:16 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:27:12 -0500
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
Subject: [PATCH V10 38/46] drm/amd/display: add multiplier colorop
Date: Mon, 16 Jun 2025 22:17:20 -0600
Message-ID: <20250617041746.2884343-39-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 7312cdbb-e57f-41d6-fddf-08ddad573d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ih0p8d5NpYF9uOgaehXzz9NAKZm1jLSaxEWRMBPPiUND6GDkfA1H/Lsv7hFR?=
 =?us-ascii?Q?QmjxYreVCslVY3OjhWw3+xz5zU3piFmGH+utntpObqS1JQIVQmLP19JtfMJW?=
 =?us-ascii?Q?tzXlNSJ6cMkE+Z7sfyyfHfvr8L18HYFuZ+Luo9wMY6vkCGZBSRjN1GST1j29?=
 =?us-ascii?Q?7E14X59Qqi+3QedydUC3pkh11V7LtisBJ3NJ2RUBB7CNKSK3ZE59BnPWzIka?=
 =?us-ascii?Q?Tbmn0x4s5LYp327wo/K0ctQTHhVlmuujfCR0nt4g5IaJGshljGyeOXPaRN3O?=
 =?us-ascii?Q?Yu+NwFYjZ68S9JG5nb08qfmAwYhV50ZIz57C64VCCtIwBD57mwv9/Fm1HHAW?=
 =?us-ascii?Q?GZ3t2TxnZ2PdsxNPG5G9LAblrxFV3jgO9P1zHDYoY665AdXioFF/xA1hXHgz?=
 =?us-ascii?Q?JB2UcrpguW9QE7LKxuxZaJrqNUIOBvAzI9oIucHQKnqb3eS8vMXBU39L1qGJ?=
 =?us-ascii?Q?kEIzGXtgJ6KGUfCNuRp5LjtZFAAqdAqCRhhbqdqNRQ4We2cJ3J0Y2XHub6Zs?=
 =?us-ascii?Q?mMoRNBYTIP+D1ASpddi/C9rpXYy8Y2zBOK0CPOsO2fTIzZ9dk85rxMSfYdiZ?=
 =?us-ascii?Q?szfRWWZp4qqv5YaxDAf4ruYUKsLyhoHjlk3hLcq+2ZkqTSdOehbQ/YUoh5pa?=
 =?us-ascii?Q?rVxHoSH0lJtuptbz7z+lZv8EHnTaEWMthhdcj+YOgzaAPCAxV8N1rC52VjfU?=
 =?us-ascii?Q?Y1ZhP9qX3Tpj4Jq0/650wvCMtP7PSSy1AQzq3YR3W+DhMs5b0whbwn0FElRA?=
 =?us-ascii?Q?iBS6cd7CNWe8DXnl00svTdnAo2jya+P8Azt9knf+9quan28dl+lzwfJLVwW/?=
 =?us-ascii?Q?OGhvwdvlIemQ57IbA6RScYEnxZNYTg88+G4jff1KCLDKxnbhFyLm7PKnSjRl?=
 =?us-ascii?Q?oAMl8vsNrdU5Elvbdl2Mfijy26FO2hzv4vi6T9SpBwd1ngdthaLT7y04z2nT?=
 =?us-ascii?Q?WBWL72JdOEr4FQFJoI7K6hcP9OX44cCjLBdcW594jQbbICrqZgd8CV8g/UJT?=
 =?us-ascii?Q?bTUChRywNX/a++y3rnwfw5iAEoAzTN0ZjZSvYMTSqTzZJ1zoxUoPSxHbFXxa?=
 =?us-ascii?Q?O+P/zVMPyb59ZQWKXiXR6r+53lnKkChorrOoshjMj3S3/0fXrme7/EQ6zO1r?=
 =?us-ascii?Q?YWEQP8eKx2AEiCaYkFEqMUIppPFzRXR2DB7DRxqGsjsUMViKy4xAVLkIOpFm?=
 =?us-ascii?Q?ZR0pELZPRjDP9sqjfQFsF3DkEync/x9ZkzWozsw6VT6NeEgIsxjWfSR9Jn4e?=
 =?us-ascii?Q?yJj8kMhr4mvLG+AgL32zVukETraAsJ65+AsL1Vfqf4v8MDnhJkP3eL3tK9cG?=
 =?us-ascii?Q?wGTolNd4AzkovlfSabX2DHCm84RWy+mHYgnULBtK8m1WK+iOjIrFP2PNvR8F?=
 =?us-ascii?Q?UWRzgDPPoIg+5wxdHFwVIrXeudYmwdMvDfKZfGSJ1Pl1bVrxezcZqqn+ChLY?=
 =?us-ascii?Q?NTUYxOLMKVWe3Z7vwUYICVP7uH3czcMH6Y6jTRz7Ez8gYW6ZXtFCUxkHSOAp?=
 =?us-ascii?Q?caeV/ih5JffEfMZevQuty/HtfGFbOqhCrnjv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:27:16.2528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7312cdbb-e57f-41d6-fddf-08ddad573d8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
V10:
 - Remove redundant DRM_ERROR(...)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 15 +++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index b0223c6884c1..f110b5ae3a77 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1385,6 +1385,35 @@ __set_dm_plane_colorop_3x4_matrix(struct drm_plane_state *plane_state,
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
@@ -1599,6 +1628,17 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
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
index 3b099eba67d6..c31c201e0a83 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -89,6 +89,21 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
+	/* Multiplier */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_mult_init(dev, ops[i], plane);
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

