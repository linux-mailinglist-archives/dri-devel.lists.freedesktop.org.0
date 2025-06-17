Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D14ADC057
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9818210E571;
	Tue, 17 Jun 2025 04:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a5kHW5I1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1245310E55F;
 Tue, 17 Jun 2025 04:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PngDqNuZH3CRRu6AUPt8HM72+vY9KaEjUHwllenJJMLxhqmzpcHAfwlpJlm9aLwWbuZ1WV9HF0z/wwevGk2rA+ZbitpBqZQf926TIrv/aplFvCJ51YNIaa3K+ZSajtVllPSdHa4jiWkhVJbdwkmgHsEndRPrINyfB9SggptD60OTL/yiV9aVNxxW/utXrl9vslRS+Q7GrUo4rzysenmaPI51h5L8/wBGj23/393CTSaB8ViwfONtKbhEdqWrbEEbefGgNL+V8JuSV9hr2mOoBpTP8YlL/mf4VB4Ap96gVB4jYPVrUijVVbIcJSjq372rMM65z4CYPl9AuqHVrdMg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3eGPWzq2e1d2t/TAWy9AnmJhlh3M8S5ypmyUCfNAgU=;
 b=LJgEstCv5t0ArbOHiEVOgzDm+3/8gwpfhx7ns0h0NymQ1lWzja0Iu0zdusItLWVnZE6EpkHf7JdxgVaNzAOdJrKJ8caPcP2LOB8AhKwrU7At62sA5oLJNHp1rf9wHTdaedmFcZVhk6yfihcyOU+Uvy9GfaE66kBRs7y0uqFIhmooZ1ntldeDYfyDjExnbJ2az8aKPS1TA+FoE9ZeYl0gVFj9rI842szMlWr4BOrTm7OaMfgo6dj9BcSQOGwKwJq45QkT60zQ9e8vVwHtzYslaaTs4ooJP8ALoic81tOuhy24+VqSq8ymBqZla/kX9AP5SWYwMNKhs0AQd9LO2neRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3eGPWzq2e1d2t/TAWy9AnmJhlh3M8S5ypmyUCfNAgU=;
 b=a5kHW5I1Joxrz8nWrzDIbJBdKllRQ+9+k4K6aSqqU+NtgChdk7nOMX3pP/rSNrQTWmfKLGmVx/cZ8+imOhly+LEXShKD6Dd+GOj0y3QY8crW/FqotKnpJIJx8S6ZG+dno1aKKM30lEJTGmrE5n0IxGO8TRUtOWRXOl6hrNOsqOU=
Received: from SA1PR04CA0017.namprd04.prod.outlook.com (2603:10b6:806:2ce::22)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:22:30 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::4) by SA1PR04CA0017.outlook.office365.com
 (2603:10b6:806:2ce::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 04:22:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:22:30 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:22:26 -0500
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
Subject: [PATCH V10 18/46] drm/vkms: add 3x4 matrix in color pipeline
Date: Mon, 16 Jun 2025 22:17:00 -0600
Message-ID: <20250617041746.2884343-19-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: fab3ceb9-2afa-43f3-49e2-08ddad5692fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o5ou5+n3pDqyhxkMxSpgWRN+Zp9iT14mkuZezcLecIObZeY33DHnVGaIGS7o?=
 =?us-ascii?Q?S/V8ZEVmYCZSYYjVQD3XO6pM+Zi20mxKcBHv48CntFuLUaIl38q7se+78hQ7?=
 =?us-ascii?Q?00sFFS2PWb8EjdiCWKGpczS+lYDbxHZuc0y3r7oesWGgesT72thIYJ7dUh9l?=
 =?us-ascii?Q?BVs2ux1D2KMi75kv0xopD/cTy3JN1RyCRjxynRJzPPccjTPLvM6cDkEHL4hI?=
 =?us-ascii?Q?lqgcLf83kh6+8geD58VEZHem6UUh5uVY7UMr+j/44WoxZqX1JV9SqQsr7ObP?=
 =?us-ascii?Q?WU+NQtGOEyYATxDvmh2RhM0qrqGKy3H1lpVY+BPtMvw8+77yW2RRaPEA6I9u?=
 =?us-ascii?Q?/U5EOecX3wtqtTk7iJEgvF/vh9ZuUIIYd/xa/BK1qwTKw7GUxWqhuB1WJMlu?=
 =?us-ascii?Q?C4YuTv8fB+qRGykD3DANFUXRd+TrXLxoWA4PoQRwtzqMGhDatgtgwRcoJJCg?=
 =?us-ascii?Q?CSW8dN9jqoERuxmNvOTknjU7pH4ZZBk4LIoJMzOyBB7hhp8QY4E+NN5WLCgF?=
 =?us-ascii?Q?UlSrh6vKr2AwD+8uws0mC2iS4BOq3t6LlO2x/h5NtVYobf10dLwq4FipgUr6?=
 =?us-ascii?Q?Qr2S54JRsphX9amExSslD15v8sWjBoOfmzSvsG0M1VkJvEste3aK1olIh3bD?=
 =?us-ascii?Q?g2R3aMYK1X4nkM1oc+C/4OeY9VIH3TsESUDhMz6aKzanYN1S7NPyzJUbzqLn?=
 =?us-ascii?Q?oMoNGOkE7VYHQArlUIxzHAZ+76bP4LVjCOGcHFzhv2dDStGwdzJnh0RgEcWK?=
 =?us-ascii?Q?uRx00ufm3LH4oKJO8LQ58d+9d/FW+t3uzW53iEIS0JNOYkfh6dgubZjMila7?=
 =?us-ascii?Q?gTHYJjUHSIKiVpMFLsqVlsGH58XfgCY/D16hNh+yPW4/+OwLaTNhb+fmjX9y?=
 =?us-ascii?Q?lfsPLA58eKqT7lIrQaHeb8fFvY2mZnDphYKMQlC1Z67UZlAsc9ttjTN+OIPh?=
 =?us-ascii?Q?yqsGgIloO1+WApPPCQnSSYkCYYg7rMxyGNvJBnkHIhNIqyTp+ccxxcYnlZwJ?=
 =?us-ascii?Q?l/3K4NsVmrV1ZwZutl/0ltXJlQd9YzcJMOM2qtLx2TqCQyez2WCROVVVrNbb?=
 =?us-ascii?Q?rjtYrQqJr1oQQpiAofT8Y/IqKd4HDa27zx5jhz8lTelWElK+b+K7gGehqLe/?=
 =?us-ascii?Q?C5oMxiBcls6NiO7QcK1CBrnrBQMuO4AOQZ8RJ2CZX/StyiOMuiHhiROBMnlt?=
 =?us-ascii?Q?1eId8fkIMdYgeUOIq3107SGLseIO0Wr1D2obzZJgw888llHwq9UB/E1dBMcz?=
 =?us-ascii?Q?yTv4qjfYLS4H9G6COIdLj3I2dGqXrK4lOLaUv4kNhV69C7RBAz6r89nVBdyv?=
 =?us-ascii?Q?av3rEhhzXVZbEcBTK8MWXdRysIjPhG9wG4lQ2UXYJq7TMeds4NI7TQhvpQwZ?=
 =?us-ascii?Q?s9epaBMVrUyVnrZ5ovoNvGBcNGsIla3QNx29vHit2CyMF8YiHJBPrDeAAXd6?=
 =?us-ascii?Q?KDBjbh2UJD6/p9XN4sM4z2Zv1iFkdnkhFTvnKRrhhqF7vnBWwR7Ul5Ga8mF6?=
 =?us-ascii?Q?Be9uMHZU6k4Gu6a4LHdiSeqVccMgWi/kZR4h?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:22:30.0762 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab3ceb9-2afa-43f3-49e2-08ddad5692fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060
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

We add two 3x4 matrices into the VKMS color pipeline. The reason
we're adding matrices is so that we can test that application
of a matrix and its inverse yields an output equal to the input
image.

One complication with the matrix implementation has to do with
the fact that the matrix entries are in signed-magnitude fixed
point, whereas the drm_fixed.h implementation uses 2s-complement.
The latter one is the one that we want for easy addition and
subtraction, so we convert all entries to 2s-complement.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Replace DRM_ERROR with drm_err (Louis Chauvet)

v7:
 - Fix checkpatch warnings
  - Change kzalloc(sizeof(struct drm_colorop) ...) to kzalloc(sizeof(*ops[i]) ...)
  - Change i-1to i - 1
  - Add a new line at EOF

v6:
 - pre-compute colors (Louis Chauvet)
 - round matrix output (Louis Chauvet)

 drivers/gpu/drm/vkms/vkms_colorop.c  | 34 +++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c | 33 +++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 2fb74b2bd001..70be35804ea9 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -12,7 +12,7 @@ static const u64 supported_tfs =
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
 	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
 
-#define MAX_COLOR_PIPELINE_OPS 2
+#define MAX_COLOR_PIPELINE_OPS 4
 
 static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
@@ -48,6 +48,38 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 		goto cleanup;
 	}
 
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
+	/* 3rd op: 3x4 matrix */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
+	/* 4th op: 1d curve */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
 	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
 	if (ret)
 		goto cleanup;
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 36f0caabb67b..8fe16d26d680 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -128,6 +128,35 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
+{
+	s64 rf, gf, bf;
+	s64 r, g, b;
+
+	r = drm_int2fixp(pixel->r);
+	g = drm_int2fixp(pixel->g);
+	b = drm_int2fixp(pixel->b);
+
+	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
+	     drm_sm2fixp(matrix->matrix[3]);
+
+	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
+	     drm_sm2fixp(matrix->matrix[7]);
+
+	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
+	     drm_sm2fixp(matrix->matrix[11]);
+
+	pixel->r = drm_fixp2int_round(rf);
+	pixel->g = drm_fixp2int_round(gf);
+	pixel->b = drm_fixp2int_round(bf);
+}
+
 static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	struct drm_colorop_state *colorop_state = colorop->state;
@@ -151,6 +180,10 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
 				      colorop_state->curve_1d_type);
 			break;
 		}
+	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
+		if (colorop_state->data)
+			apply_3x4_matrix(pixel,
+					 (struct drm_color_ctm_3x4 *) colorop_state->data->data);
 	}
 }
 
-- 
2.43.0

