Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AF2AA4049
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7FEC10E631;
	Wed, 30 Apr 2025 01:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DKa8hqj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0678810E625;
 Wed, 30 Apr 2025 01:16:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWMPpA86S894x4W0L21rXWPeIQMO065c1VmL4w3zIqEGC8QKafNFb/2+Y5UHHpQy4Uf6jN5Lhh/nC55cyybGFifOi9ovzYdm9k0tzqelrrYQyNd85fX6vzvi5KKi76PSSd5mOHfyZJrjLb+Ahs5E/FNFlx2NZ2/nBYNw2Nreu9nQ/WNopiOURtN6WhQrFDKDGLEQwU7DXdkEQR1DE2dOAsSTLmw2c67Hn9k8sLx56/NNoq/6yDapsnEk3YjTcQtaRvDKERVhaRBKWUIRWdunjzHEhgd7z1hTG/Xg8Bpwm/TSbJdXBYF+/juXCHzVpxIBbWvjzZeZL1gC3Qfss38U5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3eGPWzq2e1d2t/TAWy9AnmJhlh3M8S5ypmyUCfNAgU=;
 b=hBUYFTAWI1/5VXWPHet8dY4cfV3qLj5aBZ9A3Nni4YlqvW66P3xI+Jm7/goN3GquswU2v5i/RWXvwa2SIyr4nqPrD8z3d7qhV4BAOdO/P5XhWUjkCvrKagGyAMZzKwzRZ+rr5XSTT1aMfwEbpUPJKK5wGL65UzYlhtHsb+fWRuJCBMHKVi+7rBkqsi6jmVE3oNN8jHuFrElhIwWQePxrSDw99c/2eo5/YvuXuq5PaLAe2WPs7QUL/A1t29ozWDqaAkFcQLTbz/iSIoUN2i5PQwbP64nu8luW6SHQLNu0ZPUnfVaUZQCKEF3R53wutl8wXqvkAq+XXCDYT414WqPd9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3eGPWzq2e1d2t/TAWy9AnmJhlh3M8S5ypmyUCfNAgU=;
 b=DKa8hqj6vX4hCo/oc3T8tCOnGhJDd+a2LERfjh27hp8hKFGOZm5Mbo6Gi4RfT9auKMZOKdqasV+0AcSxObSAeCUHYjoNV/eLdtwEveIQJ+lTOXmE51dXUMv2jhK/WwhgHWSMKoNdl5+QwZ1/LCOYz183oE9Bs7KwfzxJ46SJIuo=
Received: from SJ0PR03CA0059.namprd03.prod.outlook.com (2603:10b6:a03:33e::34)
 by SN7PR12MB8129.namprd12.prod.outlook.com (2603:10b6:806:323::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.32; Wed, 30 Apr
 2025 01:16:22 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::8a) by SJ0PR03CA0059.outlook.office365.com
 (2603:10b6:a03:33e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:16:21 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:16:17 -0500
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
Subject: [PATCH V9 18/43] drm/vkms: add 3x4 matrix in color pipeline
Date: Tue, 29 Apr 2025 19:10:48 -0600
Message-ID: <20250430011115.223996-19-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|SN7PR12MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: fda4d781-8f79-4eb0-2349-08dd87849dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gOvk+lj5w+GG94zIJZ8M7XNd564mMypdooNx681Bq0PbSRUrT+VE+Jt//kdF?=
 =?us-ascii?Q?E4MK6qklhPghmNZ15BidINz9Oz6Dd66v58/Eef3I9U1Cs1LtslYT8lQ4OQYJ?=
 =?us-ascii?Q?E3u4vp/aEF/sSwaCLzAGbbki86GBcMng2XBeab69kU8fpzLvmE0/TD0LT5Ms?=
 =?us-ascii?Q?B6OO9e6ZwwNuurPDl8on2s1B9GGY464v2eeJ8zPOO+FYtrc9qu8MZsAvGP6q?=
 =?us-ascii?Q?kSKT4HD8oWCsPgvCAw68kXTvkLpS/ispLScYEqfN4UCHWc7rgz4KbHNNlv05?=
 =?us-ascii?Q?PtYAQMgwiATfuHMjiwaXqvsoSrPzE5ycYNj021rk45pEn9i5pEG6dTeYuVVt?=
 =?us-ascii?Q?BdVeuS8TEFwIYfdTXFwvOWhWta168QdHySpLb9nB7dqXQ2UjLAGyYg7Uwuog?=
 =?us-ascii?Q?RInp9rfdVJInPFsdLf93Jzo3LhYgJjwmtHDCaTebnGyCxTjfsB/FispCVYrB?=
 =?us-ascii?Q?OAA9Cbok7sf5nocZEDZ4QbR6JV6M5jRC4jqPHi6kw9Yz3insBLTeRHcUh6zo?=
 =?us-ascii?Q?xuXgXjrGdedwMr1p/LHGrmTQ0ubvMfyERGdw7AnWlan/P2Fo7hpWFqbgcfKP?=
 =?us-ascii?Q?zkISuOi0qU1TzwvYQABuoK7UvWbmFgjAiKGXS2/9cvOHiS+qAF3NrL3DEH8r?=
 =?us-ascii?Q?BiB70QxtySISmg6rAG9MmKFFfT4Cq8Ktfhe+kkiydKrl4v1izCPiieKqBOvQ?=
 =?us-ascii?Q?DH1ZkSTsbPMLFirTZ+KUZ2vUBdF7N5cipvGoCi/bW/CbOfoPFpD17iq4d6z6?=
 =?us-ascii?Q?zt8EHjU1S2O+XOED71J2SCVyJBB/saJUVMXhGBATGeJDt61ljTdHyqnHO5LL?=
 =?us-ascii?Q?I+Bm4teFHcSogiBJLfhHRidKLE58HXLFPYspD0CCdfmcF52P31cnmCCZiGt9?=
 =?us-ascii?Q?QJIaQUuxOO555TqsfDREQU6LognuhEdgJ/fMbvG9VS+LyhOT2UaHFN+jT1vQ?=
 =?us-ascii?Q?+DcDtcycRYxQ83C9n3EDTv1M+9I1aDbusGIAsSYLNSLXCD3/mtV+bzSzbJK9?=
 =?us-ascii?Q?yZqF4krSNVhRGvRyXUXiv3tT01LrfxffNXfVFwNngeVHjMNu5JzoBO0jXBxg?=
 =?us-ascii?Q?96POgkkYB/siLdgDZQY6t+PiQ8G9CmUeo91zKYRrKkQtsMDwqZgMeg7AMNKj?=
 =?us-ascii?Q?FI+0rTsOPrT+vdlS4inj7GGFBFZrB69KUtf1Vub8tlYGt49gJOC1GtPofEJ7?=
 =?us-ascii?Q?PbQmLPKfzAmomavPHvUKn2+sUqgQC9uP6rWRe5YwnIiOizUwpjTcxO1V24ph?=
 =?us-ascii?Q?kUP1oYN7rMdQma8V219J9hEXrSpTtBb8/S6tiQEnsLWHQ5sI+6Ki+Tcb6nyK?=
 =?us-ascii?Q?6l5eg1wcEhL8d8M+AuQu6x6xukDz6/OlXG26BW1qpmiKKNa/8yE8mn53gltG?=
 =?us-ascii?Q?ARajrItGINVo4XCS4i5RDGOTRjio2tFYMYXYtRBVThlaiAQ/0iVUAnd+6M19?=
 =?us-ascii?Q?fQ/WxrnyFo26P3ZtvxlRFpqIyXym8iuXp4R6LdzbKcqow/ziioEhr2VU1Sio?=
 =?us-ascii?Q?OUzpPKIMW/YV20b8+B52KOlfv49wsE2VXTYV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:16:21.0624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fda4d781-8f79-4eb0-2349-08dd87849dec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8129
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

