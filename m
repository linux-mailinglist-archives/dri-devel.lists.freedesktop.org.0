Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4586829C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D78910F24A;
	Mon, 26 Feb 2024 21:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t26pptGh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D0F10EF34;
 Mon, 26 Feb 2024 21:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NA/NJRPTJTjf+BtXAH+OcCTAw5bfrup5tkakdSWPlmldJegkmr07YGYtfznaKMe5oDwZpmraVK65EukQRLX6nO3U+oWd+IhmeFfNlV/oukuzS6Kvb4LwaCKspFbHyChbiZVA6INqzY+jfwrR29LSyjy5OI6VBA4O3bdGWt2csHsMQWlf9Su2u6twiite5ZH1IjcufDzkIQjP9L26LcL1NkiuRNK+4v4hsxuedeD5h91vgq5eW5ujYTnNufrHHgRuAPqVZwMZsx12JKy0Xs61EoOwifExTjQ8nTMgRW3JVN2qokSmlKTDUQiBwYIw2FR7peTW8iQENgh2vfXjy7yXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzBnvKHw/v0WnouWI4eFCZw8FBXOoQ1Q4Nk8R269oTM=;
 b=X0wih5VkC9stNtibozAMZpNRXhuqAX60Jl4cl4zsTUYJPg3wD2dgvKofitGSGeU6+pbTpZUi9JdJVyDLBE5AUoEMIimwwA7QEkgPaj3CSQ2ZTiANDtx4X7lezP1f67M1WiIz1Jsfu1BU9qXCg7nefzF4Sq7JETHCPNdvC9CzDCxzVyN4I3WhcGW3pVLFMUoaP26Ft0l/kNT/NpueELaHxnijx93kDfsFucQtKCfPXuSDw9wBpbr0p19yGDvoJ9+UNwaWSs3gEfUgxg2m7Wey2syY2QomUVW0dez20iXHqGDzzwn6lD5hb5jPfkNeH9q7XJIza7N3bKgQDuJJy/PFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzBnvKHw/v0WnouWI4eFCZw8FBXOoQ1Q4Nk8R269oTM=;
 b=t26pptGhLWWJvUwqXxqUD2PSsnVXAYy1iM+OF8tkud+wYui2L40hSWSw1gkQIzRXTFWiyUcyRiPh1wvgxG9T001C5HqZBXNUIWkJyE8B9WrBvHewCSMH8Bnzq5Meg6RwWJi7VcAjC1MlUBL3GvqkcM2IO/ZSTOEhm7ohU9SGF38=
Received: from CH0PR04CA0062.namprd04.prod.outlook.com (2603:10b6:610:74::7)
 by CH0PR12MB5347.namprd12.prod.outlook.com (2603:10b6:610:d6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:11:22 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::92) by CH0PR04CA0062.outlook.office365.com
 (2603:10b6:610:74::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:20 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:19 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 23/42] drm/vkms: add 3x4 matrix in color pipeline
Date: Mon, 26 Feb 2024 16:10:37 -0500
Message-ID: <20240226211100.100108-24-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CH0PR12MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b853ea-eaef-47b2-b876-08dc370f7c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iMr1IT7xZnt9NoMhNDVNtztP4fAo3x600wck5D37rAA7BIn5BOaa3prps3PS5+EV2rZvS8hV0xPKfwe1nayp5r9E3veUOCr5XeOujcwrpGLSRoczbCz+MWTp/pE3RArKP5WE/JN2EHEG+rZZxzXK6DLaFTmaIEGw+wA1poj8umvbR8z0pzwzzkn3AUPwsKsjFi+xpqNLBz+tflvZ3snytNfFZcq4UVDIprG6Y0tU4D9sTbg9eC+4u78s5T1gieo/g6nu7Lh2LQeto8gBZYQY7gsX1eDNkuw+lyy/hGh2lPUmhg/K+zhoT3KL7+ecynelT07ZrAgt0GpeTFfx9V3Eq8X/3E13jazeJ1+drudP/cob5QgGq74Z0DpLZof/oCbCd2JkEkng3hQtfE+9knkGBeE3W0GStpTbgbNnDqnUmOWfNPH+DXSraxkEocUaEUslb1JmdtiK9QiiDI0/2/jWxudl4U/RmLKUv1/uIagGbhCDEA1jMcmH144FefykKlJpcXxzARKhnarmzKhy5gnlpj3mBwQJwAZFGhsxbTTgHDuC3D49jT+p7dLS/zd3h+UEEJ1LdaJhbn/pkLGw8sP60cqSpt3B5ibAxqPesrTuUj14vbEDDNO11Rtc2fQyCIiH4Kyym3j1ZpWpAJmn0epuI/++EuaFgOFKIRNW2PMcfC5cnZREMnoB+g/3npUKvdzBjyzepDA1Y+S+rty3iLawAU6hWaUPg76KGerK0TKHR+QhgwJ7Bdl8Wf7O/Kl44itC
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:22.5542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b853ea-eaef-47b2-b876-08dc370f7c20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5347
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
 drivers/gpu/drm/vkms/vkms_colorop.c  | 32 +++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++
 include/drm/drm_colorop.h            |  2 ++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index d2db366da6d3..a0e54b2c1f7a 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -35,7 +35,37 @@ const int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pro
 
 	prev_op = op;
 
-	/* 2nd op: 1d curve */
+	/* 2nd op: 3x4 matrix */
+	op = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
+	if (!op) {
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
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
+	ret = drm_colorop_ctm_3x4_init(dev, op, plane);
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
index d2101fa55aa3..8bbfce651526 100644
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
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 4aee29e161d6..8710e550790c 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -224,6 +224,8 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
-- 
2.44.0

