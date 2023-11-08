Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9DE7E5B63
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368DF10E7D6;
	Wed,  8 Nov 2023 16:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30FA10E7C9;
 Wed,  8 Nov 2023 16:38:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEmnLYj1CR7GjJYxMZSyFVGujj1rwmYepmdbB31jd/44shT5zmtd93bZetEIR14Nfhz81q24TakU0AQsxLatEiNDmKz84Y/C7HXGlFQqLaNyHyWOAPBAjlp+9mPUHw6YLlv/j6LVFU6xp2KRek7s0it7vnTDsPtFr+tTZJpFHPY8wsmUgFNHKuFWaCIW95rnxDz35tfGv1ln7vxjexqbVih+gI6pMlmf2UCQU1NU7STkvWTrMhnM6N7a/daPAAVTvalPs2lh13tHexZrzntxUZUGXVO38vz8AdsCnhUPLxcRoi8yywzF2PC/Sb3Yd6ekd9zulaexspMrYdRNlvkT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj99YxjU1tKr4hM2TA1N4BQzZWzavhokuAri3d5RDwU=;
 b=mBhsC2J01/KHPqis1qdE0qmOvVr7cQaaPx7yRUbOt50XqHMEeQ1ooPd5LlzuSYB9DKQOQqyxd/V+Tklbs7hZb0SLdvXIlpQ9LbgiXY0/YVk5sTtsg+pFr1ADRBG7Uednxk1Dh/N/h26ipHlPfo290Ue3AmQRZVXMA67zyv2sNxxlh9HGEHlByV8OtLEuuiIcXBfnzZPfKIOnE8XwYBx36yWeqeBJ2POvKnUpUkZspfoHFBpvy2zitudMgcLZjzNcDdnhJQjXq27AGXKHscBvBeHY7+GZ3tEumWvCKgtfvgP2aZ0QJfOdC3zaYwXfwe+Ae6sd4dYRbBL6bOTKd5YlDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj99YxjU1tKr4hM2TA1N4BQzZWzavhokuAri3d5RDwU=;
 b=prUpOCwbndByJ8hJY2tixQQBubhLjNRWQWZnSgXTzafaW0iD0gsjLOCxXUrRQ6CgTlO26a6XCbQiHBAb4JsmkW68fSa3zYOBSxoNDXZsbkvrNyVeJxa0kgbfWaCknwYCTC9VQUMxrOtKUYO9Xk54gLUtcnw5p9WUYiTz/za7OA8=
Received: from CY5PR22CA0032.namprd22.prod.outlook.com (2603:10b6:930:1d::20)
 by SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 16:38:03 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::71) by CY5PR22CA0032.outlook.office365.com
 (2603:10b6:930:1d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:58 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:58 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 21/23] drm/vkms: add 3x4 matrix in color pipeline
Date: Wed, 8 Nov 2023 11:36:40 -0500
Message-ID: <20231108163647.106853-22-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|SA1PR12MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 9394dc30-fae3-4c56-43d4-08dbe07913e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5H/3O0863PA4xHwVYuF06exQJfKTeaPZ+tSsSlfwuH90PfKAHQlNUA5dBnKgCLWj7GSbf8Ypqj2TyO3GP20kFydWcWhdz9C8SogR14bRiAT0vs0sW2M5a9Wh9B6aFmFyVgqY6Xhc7lhxUEH6hanU7443QiiRQMEfPC7Sv0+gpjV/H/XNY9HK/TItGcHYK5M9tUUMJpy+nOOh7VbxTJDip+z6aCkLXIZGqlXft9DX3EtvjuJWv99YJgwF/HBoCSVCLUCVe8zKysh4Tyzf61XmmrRQZCfLbnksGR1Kjtp5Az6du34gjigqXoqyKH8nhbR3oPhRdQQ+RHHZGqWXt7EWf+OiRLHz6pbQ9jvXpb2uRBk8LOwkhwCSX7HLscFlVqdR5kujfjhbFYk9JnPbFVFHDGAPjLdqWHokF0qld1F1h7NurezoIA5JPeN8M7SMjwt3UmZfRP6qE8S2Bw0DW6YFWv/VAbj8Cc9PiHMsLpfoSJS2NveYpPIsogn0UIGpBAgHiw1t7zR58InLnKKMyu5QfWF+sOLMy7kvmuPOlavKYrZueeXiEv1U/t32u83UwyK/xJVRxoNoUc7jlas+GOOzqtnhwF7/a64MO/SSn9eDhXx8CM59lmXuSSva9ZIRKvuovvamh5KHYaw932VaN2TcFgvPnLJi7UHPPhUH/bBAHamzvsUWM3u+NtNiqKGDCgLUGmCgp7e8mo6SIok26xVV3EwwPBSGuvYZP7yxhg0BNcGQo5ctwQciAtj4GCFmb9jan3r5cFuMPFoYL6U1Syzpg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(82310400011)(64100799003)(1800799009)(186009)(451199024)(36840700001)(40470700004)(46966006)(36860700001)(40480700001)(6666004)(47076005)(1076003)(26005)(8676002)(356005)(4326008)(81166007)(450100002)(478600001)(83380400001)(8936002)(426003)(336012)(2616005)(316002)(70586007)(54906003)(70206006)(6916009)(86362001)(36756003)(41300700001)(5660300002)(40460700003)(82740400003)(2906002)(44832011)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:03.1485 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9394dc30-fae3-4c56-43d4-08dbe07913e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7272
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
Cc: wayland-devel@lists.freedesktop.org
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
 drivers/gpu/drm/vkms/vkms_colorop.c  | 32 +++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index 9a26b9fdc4a2..4e37e805c443 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -31,7 +31,37 @@ const int vkms_initialize_tf_pipeline(struct drm_plane *plane, struct drm_prop_e
 
 	prev_op = op;
 
-	/* 2nd op: 1d curve */
+	/* 2nd op: 3x4 matrix */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
+	/* 3rd op: 3x4 matrix */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_init(dev, op, plane, DRM_COLOROP_CTM_3X4);
+	if (ret)
+		return ret;
+
+	drm_colorop_set_next_property(prev_op, op);
+
+	prev_op = op;
+
+	/* 4th op: 1d curve */
 	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
 	if (!op) {
 		DRM_ERROR("KMS: Failed to allocate colorop\n");
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index d04a235b9fcd..c278fb223188 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -164,6 +164,30 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+static void apply_3x4_matrix(struct pixel_argb_s32 *pixel, const struct drm_color_ctm_3x4 *matrix)
+{
+	s64 rf, gf, bf;
+
+	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), drm_int2fixp(pixel->r)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), drm_int2fixp(pixel->g)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), drm_int2fixp(pixel->b)) +
+	     drm_sm2fixp(matrix->matrix[3]);
+
+	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), drm_int2fixp(pixel->r)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), drm_int2fixp(pixel->g)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), drm_int2fixp(pixel->b)) +
+	     drm_sm2fixp(matrix->matrix[7]);
+
+	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), drm_int2fixp(pixel->r)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), drm_int2fixp(pixel->g)) +
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), drm_int2fixp(pixel->b)) +
+	     drm_sm2fixp(matrix->matrix[11]);
+
+	pixel->r = drm_fixp2int(rf);
+	pixel->g = drm_fixp2int(gf);
+	pixel->b = drm_fixp2int(bf);
+}
+
 static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	/* TODO is this right? */
@@ -185,6 +209,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
 				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
 				break;
 		}
+	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
+		if (colorop_state->data)
+			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->data->data);
 	}
 
 }
-- 
2.42.1

