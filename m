Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A58A98F796
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598F110E943;
	Thu,  3 Oct 2024 20:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FI1iapv4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC3710E933;
 Thu,  3 Oct 2024 20:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lN/TsqVytVffdIkqloKzlqQ2d+KRWXG9Mjeqc9/te/T8bU8zJ4CgzRAthfBHeMVYv1K3hPGOmsZNrjRHACtyIn50TslMZNzL/qYf/GGdBV5T98Y3zXest6x+krhKzxI3v8521ktRWS3zb/u/YFQmqhCCsDvc1Job3wrvuoDyjQpg9kL4sA4Ofyezm8BP81axrCTeJOedH1ERrkHXwj32E1wiozTXeZL4tahc7pzcuqtbKco2QpNkuz9sfN8yYZqy5MqsOCs2KYmcxUry1p7mMN1TW8KOk63+Nr+0kw3IujVkrI0vC/vjdZhNcID4wcMlulFLga1esK7yLJuEtT71ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PG2JXaZ3XvmeDKM+maYaeJRK3XuAaGzpes4Ljpt+fhs=;
 b=Hih9wxlMWO+TabTrPJvMhwBut8Lwwyumpa+mFrJRHElcny9NSt4/TCq2A+ttJzgbcAnGhliH6uYPT/+udU55c68LMoMXDaT5yzhcn8iuHKXjw1/5EErhdqw+ZDBelqto7D5doeVMQFZkDz5KAk1I2huGU/CBBZ+lw3koCFOQgeSvJGn2/x+9J5MNGA8h5QRZyc7pUAB3IRnUw4H251pDDJh4nuNAvgCqRv6iO7X0r1oh8qHWap88eqoTaJrCIzZMyOOAJ+XkgJ1/M1BbYh6saLtp2pA9Y5lSHsn0cYmTyjcbaQpwrys63yJN+ZlvHLhXyJGHngQqcbaq+RWMSo1sqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG2JXaZ3XvmeDKM+maYaeJRK3XuAaGzpes4Ljpt+fhs=;
 b=FI1iapv4F0afjH2AwU1Zzas8G0AD3rE/6SBXa27ga6T3/P/CgoGu+3W1rMDQ5X3f9KQZcAnyPvdLwhBz7SB6Uy7mnj95+SvWuO4+6suLgnL4B24Vh03Ps5AG/r/WgeVacxmRtRvH/HuZM5cdYHdIdoVntTZ0hIh8a5paRuBknMo=
Received: from CH2PR14CA0038.namprd14.prod.outlook.com (2603:10b6:610:56::18)
 by PH7PR12MB6492.namprd12.prod.outlook.com (2603:10b6:510:1f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Thu, 3 Oct
 2024 20:01:46 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::7a) by CH2PR14CA0038.outlook.office365.com
 (2603:10b6:610:56::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:44 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:43 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 19/44] drm/vkms: add 3x4 matrix in color pipeline
Date: Thu, 3 Oct 2024 16:01:01 -0400
Message-ID: <20241003200129.1732122-20-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|PH7PR12MB6492:EE_
X-MS-Office365-Filtering-Correlation-Id: e4335768-296a-4ea5-b23b-08dce3e63539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ctRcb1eY2HflNVf5KaV0tClPkuD611Z7JuuWfuwuaO7jNx6Q+JjVH/p39VS?=
 =?us-ascii?Q?lvDrzWO4ABeHGC5e9/jbJsDqZTXxtvVA1jVCi8LCemEKcIOELLrAab2Ril2b?=
 =?us-ascii?Q?zQA2gT+2KNPBJDrCqLt1/Tuo4M51VOtU4zFsJUKKh2+yh2pDvhbHkFuI4lIT?=
 =?us-ascii?Q?ktpuNWbDG5TmooPwJiSdiqgjQnu8u6vSIzE29dEn7h7ne/NzpkjQEd/jNNaO?=
 =?us-ascii?Q?tUNpYy/trXiXyhGGJvEWVkjff473fBEHUgPQExMQ2EaQV8Nljf9UqkDvo5YT?=
 =?us-ascii?Q?LpHkf8j7GBuScoxX1cjf65te5KG4Dqi29qUvtSL3fXvbE7+cb7aZ5ppq7m5b?=
 =?us-ascii?Q?yju9kKbJPXlawDFQGgIEjQJFSAa8VGbiotmBmNnE2Ue5V6/joh93xH1Y9H6c?=
 =?us-ascii?Q?pDxygj+5/IB4w0Ou4wa7RL1RBB8cuJNVgph581HF5jPGn2NoTlnN6xJnZ1BE?=
 =?us-ascii?Q?J2UxhGqY++SsMwX5FpxtAwnGlHMxpMmOwYcRTWigJSXgKqbti9DZlXh5vyVn?=
 =?us-ascii?Q?0uvK5a5GDlO9B9pPStR5zyhkvRc4cjn3RAWbYhqRzmmV+Eq2B6DpmaMShRWs?=
 =?us-ascii?Q?EQAiHpEE2wc8xdBYF6pCJOXthdRLNtEBEijAAB+247fJMnRI9Qi4VLFnhqo7?=
 =?us-ascii?Q?srCWP7GbPnFoPeam85nTVVPmvQWYe2srrxPKnyE78BIbxZvmY1e1ow/WHcby?=
 =?us-ascii?Q?XBK+GSfOsdfWDA/3DHzk0CwtcdR2BBDhNsxRJlJb6OvGE6f5QZ7cjbp6bylx?=
 =?us-ascii?Q?rKpEPxx4LoRu4XWlPSdyJ6R2+APhKp0nA0YiLaFmOHree+cjgokNGw5jfb5C?=
 =?us-ascii?Q?5IWoLMcwtXt7/hAzOjoM+mUbEs7IfsBZofUqU+YOvUc+cqEmL2fC5yriT2Na?=
 =?us-ascii?Q?xbMVTKWTeIwruftXVAbslyb1FOPALoZJc02a0267wjljt3AUo4P+AEoJp/PA?=
 =?us-ascii?Q?euFad8XYDy+b8qb10gLb9Ur5ioYvp07dMJvM6cQlmHUqCCgNC+ozcnHfo7QA?=
 =?us-ascii?Q?4VrdteciIoY84ihluIk2Hvw3sPAlE2NvqiPHo/2muEStC2j0icVOp3O+xJVM?=
 =?us-ascii?Q?rFhf2wsCarw/ikrpCZZOKCkLok0ySP209+EWhlNCzzaximpZoyWs2A6X8Yno?=
 =?us-ascii?Q?JoyYyn0RxvKYOABMD4UMnk6G+ZkRzjJTC3PeDqYkpTmGAIoxvtmNs8ffE0Kv?=
 =?us-ascii?Q?LWZ8iySMyihiPROW413T7Zo8n/ht4hGFZ29CH68YgHMFWrRrxO5nVH1OYlja?=
 =?us-ascii?Q?KECiR7RBT9trlpVIUAgjVL7piBjPFPScGtoniRTCGsY9dWVq/1x2/azimhCg?=
 =?us-ascii?Q?II5z5hVgfIr0TA+V5y3oJBmHZpjc+g3w5VXYn5ZOB/c5IY5m2vJG62tyjO1u?=
 =?us-ascii?Q?mNXrU62+rVzkT3y4ZL/8zo60FGup?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:45.3474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4335768-296a-4ea5-b23b-08dce3e63539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6492
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

We add two 3x4 matrices into the VKMS color pipeline. The reason
we're adding matrices is so that we can test that application
of a matrix and its inverse yields an output equal to the input
image.

One complication with the matrix implementation has to do with
the fact that the matrix entries are in signed-magnitude fixed
point, whereas the drm_fixed.h implementation uses 2s-complement.
The latter one is the one that we want for easy addition and
subtraction, so we convert all entries to 2s-complement.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v6:
 - pre-compute colors (Louis Chauvet)
 - round matrix output (Louis Chauvet)

 drivers/gpu/drm/vkms/vkms_colorop.c  | 34 +++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c | 32 ++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index aebd467c4e61..f0c264820a81 100644
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
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
+	/* 3rd op: 3x4 matrix */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
+	ret = drm_colorop_ctm_3x4_init(dev, ops[i], plane);
+	if (ret)
+		goto cleanup;
+
+	drm_colorop_set_next_property(ops[i-1], ops[i]);
+
+	i++;
+
+	/* 4th op: 1d curve */
+	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!ops[i]) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
 	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
 	if (ret)
 		goto cleanup;
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 01fa81ebc93b..c8b9b9d7f78f 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -159,6 +159,35 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
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
@@ -179,6 +208,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
 				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
 				break;
 		}
+	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
+		if (colorop_state->data)
+			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->data->data);
 	}

 }
--
2.46.2

