Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC724A72766
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302B710E7D7;
	Wed, 26 Mar 2025 23:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k8iLOni/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0787210E7D7;
 Wed, 26 Mar 2025 23:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeYqDYBO44wyW7fKO6LN60nN/86i3pivFV9YLknG1hIDMVCcOdENlqy/bGJV9XMZYCOypvYzLMZMpKyoYFmKwuJjwMwIsLPQDdDsbF5aRBlQzQSJuxbDo2rsVjoAe5SBed1YV9d8buEO1H9HY851FjYi5WjmpJIBTpuYzxc+/czCht5XycOYFcuT/wwRLGAK256Wk2SAkSoJ15YeOZwY2KZGuHCECKUYf7dsr0ELS7LAtHoBn4YL9SUwtJUSNuyH6qyi9jaIexi8XLpY+pd77sDtkELxffkn2y2eC2L0kqsZZCR6Frv1v4+pKcdl44JZhK/YC0Bl916rsAZ56DXCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HKKY6KmgYTqkaVIKHwfeWXi9M+DGRuHmTLPwFwR+48=;
 b=LH5D5/2fm2aRsROMceZU7yEfrHw1VCfoXXGpC5GPbz4ZAVi2hzXSVFHPlNyI1WDulvu9BAfywNsjTijbZbPuzSA70V3+pS/hzpa30FN0rNBJxRdahem2HsS0nnbgTe474oF9+YUTa3kqCPwdG/RIr8YRQSJYs/bDJfq+sggs2h23YAZNeay557fqlSKQ4csY0U0+8sUrRXzxROJrDwh5vMBTdFpgckXBNof52bVM7im+SAwqY/DUaz7eUqWdoJZnyLbHM0T3/Agblf07IilzO3j3dF1nST1OVXzMLbP+UDN+kD4iUX7y+Fa6Y3JDMIokvJLTNfM3ViuRp8oQKM112w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HKKY6KmgYTqkaVIKHwfeWXi9M+DGRuHmTLPwFwR+48=;
 b=k8iLOni/Au/tlsSOUJjxDflLuF+XmCcqalTQiAyDpC5lq8TLnIu02QuFWn9Ip/XPlrkRObRm56YS0vbBrvbNk2OracMCdVajHQHCnhc7uz7CPqPxBUxFFWS7gciOCcu/1ZjqTE/gL4hYFKh69jPz7fKJ9Musr3eIeQA8e3knkbU=
Received: from BL1PR13CA0312.namprd13.prod.outlook.com (2603:10b6:208:2c1::17)
 by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:52:35 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:2c1:cafe::dd) by BL1PR13CA0312.outlook.office365.com
 (2603:10b6:208:2c1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:52:35 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:52:32 -0500
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
Subject: [PATCH V8 17/43] drm/vkms: add 3x4 matrix in color pipeline
Date: Wed, 26 Mar 2025 17:46:58 -0600
Message-ID: <20250326234748.2982010-18-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: ec773187-3739-4a6b-042f-08dd6cc14872
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IWOCBC8LldW43bHtjxpZWOI0VDySZsHjXjbCwNBPGwMZ+5JOBlbvXkLVjJ/P?=
 =?us-ascii?Q?eDihow8XISkz3c3s/8zxukf7WI0dtl4TiS91lY5hKfUYlAH7JnkJLJU4w6zO?=
 =?us-ascii?Q?8UYMwGgH5uBag6lUvh8lLnXBQVgGVe3b4nAGTeMLyLKp3MunQJG5JQiYgXXh?=
 =?us-ascii?Q?1cJQbxGv6tfgyACpROuH5dI3CPZraxsVnkSLhkX0FZXQST7HThOp0O3jU45Y?=
 =?us-ascii?Q?Xnd8pqL/dA45xV8InQMztRPOS9zcNbfQwCNUMUPFx5FcyotK7wKEjSXRvFl9?=
 =?us-ascii?Q?TVjlN+O1V+t2fx0NA3enl23ihd8VYR2qx2ekbKR5u+f4fFyHAFMAtPodNP1E?=
 =?us-ascii?Q?9QxYrTex1Ypx+qotQ39XObV3yjfGleHgEKWf3ET+kTOIIndShu1GjVWVxqrk?=
 =?us-ascii?Q?bGskj6LyyHYfxzL+nb08RvF0e94rrgQm3wX2LGCdYYw8cVy12s8mlrRG0azJ?=
 =?us-ascii?Q?666/k/IArbk3Vr4/FiPW5darTMmp1aOJQ3sgX2BHYFqqE3VRIqhjqVHkiRR2?=
 =?us-ascii?Q?Gaz8F24R86CmKykLEmfFzPjTMqfOMNjFgMi+eBQTx3SlFSCjmApj73/j4OLU?=
 =?us-ascii?Q?496uqMMviOYWty0sF2eA5UEJBZr43g+lS4XjaGfpju1xSc+7l+gMoHVwmMLQ?=
 =?us-ascii?Q?oYoNkJ6ANORr1iAwCz2UND5+b+vceY26/2nhn7MB4wO2/W3WTsSxF2J95wa7?=
 =?us-ascii?Q?p0Yyx+CZ7ouAeEQILsopUPn+pxniTSXLFlmGx3x5wmgwlaXQ5NZZGwgXZ+bW?=
 =?us-ascii?Q?Nc4fNpMARplVQOTmSc3pnEPAQTELbVaUerEG/SlEb/tRjyjOm6j/Jv5BdVrY?=
 =?us-ascii?Q?RLtDXYhFXyD/T1cTaFnlWiRihD+5E5hSYkyXP/TN6dHlk30FziMvm9q0tmjQ?=
 =?us-ascii?Q?SbIQCFf93kN5Q14cp0u1/ZRnlo2nWU/lgy2cZD/2uGpF9WXzb7s/p0tlrZ2M?=
 =?us-ascii?Q?qiQ0T8oCrI5tkIWR2BJs/jmJVgpbfrcZnh7Wo6CU449I0cjLHTCEAn9elcTw?=
 =?us-ascii?Q?M7HaW1OoC5v4XlTRPYMliH2BbHUlPKDT6zjN52MuMaxbS7faemZLrStvAMHK?=
 =?us-ascii?Q?sMCgv03g6Nts6i41IDThDve2L4MAezH04dAWtlZsfeYLygbVcFFF/djPY4Hn?=
 =?us-ascii?Q?4/bvB/HqSoFXTqY7Xurz9pzYcFfous9lvfuNij6YanKrHHMOqmbTJOcVZ4kz?=
 =?us-ascii?Q?fF7y3yHqTIDp12AD5rotfzTDztfURXVQdAUwr7y5LjylHGatXrHeleGqVW3D?=
 =?us-ascii?Q?Wbfq6DSW7nNDZyT3kmSFctuFgkunUfSfXpSKPMkPF1KRHYs4puJzjddWBpFL?=
 =?us-ascii?Q?51gspbhubZ8HpwQwcGJQUG0+1T4MWxk1jRe82ZdY94NB56ASjCl3Ge1vvJ1y?=
 =?us-ascii?Q?9zK5EqojLBr7rIVCIIbLXB0Zp1GbefVqiDUJwxGwvq/aSMZ3RRnfyYy2zuMG?=
 =?us-ascii?Q?6zSA2w/AZsFpHUkom1E7xV2B8PAQDzEc5hPpJ8CnPRL3rvKXhHO58Gj4POcb?=
 =?us-ascii?Q?QfthHOBJR/mqBDY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:52:35.6085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec773187-3739-4a6b-042f-08dd6cc14872
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138
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
---
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
index 4fe22368c8e3..0fbb9262bfc5 100644
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
 
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
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
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
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
 	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
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

