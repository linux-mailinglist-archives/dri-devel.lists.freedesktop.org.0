Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B895760E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241CE10E3CB;
	Mon, 19 Aug 2024 20:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vVDrYagl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE33610E37C;
 Mon, 19 Aug 2024 20:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYyjb46/59fJYYdXmSgd1LW9IPVLTOrJo6Bv++udbCltEjaD7jOOY2cAjs/a3hYYg1RQCxj9TBjLgDRbA/dWTGJ9SOzu7MCWOPvocpHygTHrVqzpLvxuE1sG0UzrVdPAFtHw3HCS378EZJfgDfyuGWZV5MWCMq8mERjMrFkagBt/DxiekdeKcNpDYymlRJJMwi1oQ/cmBgJyLGMDrQWQ/GWeGqEtDRoJLYCEr36uyPBdD6FHOXXqYJ/rEc58itvdOKic3Rl0ishvMKvNWG7rd046Lt5xwS8op4wY1fmNAusyktJwjnc8avyuedgXFk2EJZ4WZfO/NFQDHhQZxf0tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMehOkTw4Lgim4yoyQQK8Zbv65hMuWlcN0j9Sq1ourc=;
 b=TJA7UQoL0hmsSgIh+6CEgtjotJ+3gFS480ASWreigezrky8a7KkEsb/RS6rUahc7biGpmlOyVl78xcynMHZftFTm5qCBTnPbElFUD+tJNAV3I6HAYMjXD2okz/lkJGfXbbQ193psTqOVpVZjcbjOWUOsGMij0daemM50a8sF7RhlsM2Lx4+su51Gw/31jFH+4NYTojRlxwEEJTx0VRPnrcTHzxiApMskG3JJniIufrg9f+ZiBVXLwcq3hnI+NBVHpz3fVVNb+RK3C0S5TKVBMsvf/3fLG04rS4+X5yhN3elGAyLuqJvJy8isKG1B79bCMYnvN6vB2q9ib8tvyDFfTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMehOkTw4Lgim4yoyQQK8Zbv65hMuWlcN0j9Sq1ourc=;
 b=vVDrYaglX4OVfeB5i2NjI4zkvlnVOishzth+o+fr5hmXPTG77Q/xShYu8FNxkADoeVJ8aRCG3zbA1PCxwnJJ4e5TW65deUDY1vnaBSy3ocFZUu17mDomg/68kKAhL7KyS+Fg4J5qYxq3vtRBn3U1gZvXmW1cFcx6i3HqTFFmyFE=
Received: from BN0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:408:e4::10)
 by DS7PR12MB8229.namprd12.prod.outlook.com (2603:10b6:8:ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:31 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::74) by BN0PR02CA0005.outlook.office365.com
 (2603:10b6:408:e4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:30 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:30 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 19/44] drm/vkms: add 3x4 matrix in color pipeline
Date: Mon, 19 Aug 2024 16:56:46 -0400
Message-ID: <20240819205714.316380-20-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|DS7PR12MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd68ebf-d18a-4bb0-ef83-08dcc0918ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3JMxYJSH5YH4IkRBPBtCYzv4lyvcx2qtyfwrdVdoYW89XKdv7lS3MLdBbBLk?=
 =?us-ascii?Q?zPXYPj/Gxoqe4CC90oYeeuSMD9p9nsX3Y+3dxX/14Q7ScFvJ5wn02GFZMlRT?=
 =?us-ascii?Q?HAS1Ss+vl0wxYUqHTS7ZCm3yjaFmEOlkFJk2YWIa5VlKAKbht2zIpPF0PzAO?=
 =?us-ascii?Q?M+Xqrx2RrXFTdU0CZO5rT3nbOhKcJi7QwHMJwAaSB/x1jAJCvcc3aG2deG4Y?=
 =?us-ascii?Q?X1oTCfmvyntybvAwGc7I12NlIChI+M+g6l+cHfCpIaE/4cZnatUMD8yD+h0X?=
 =?us-ascii?Q?DUqNp+jeoLl6is9AQXAUGmKaruZmg+r4el0xf6FQpKSo4AlRbBsU2RPcNW/n?=
 =?us-ascii?Q?jaWwfcNlkeg1EN4kS8TS7jN6z8WEa33v06dG9RSdbnMb7VyZmBirbFJlnjFb?=
 =?us-ascii?Q?zjgdtTQz9cvCpe18894cQ9q5LW3gMEdMccJ9swOzjRHIhzg4YpscxtVgoAZe?=
 =?us-ascii?Q?MCigC0YOqjQ8nT06xrLtZhQi6DQzLsmVyh2GD2x9JqBYwRB+/QziZ2dF1ZCZ?=
 =?us-ascii?Q?a01IZifa0fZeQHK9O5Zqe5Exyjy+nvyInEsVEDKymrJ2qCtVJeGHrXb8Gzax?=
 =?us-ascii?Q?JW+dx0XyzYdn7fkyaq0ORl0Md9imgeoMXy8/ASVJBaU6TPpG6o1aWlAtv4e+?=
 =?us-ascii?Q?SmxQwPGcuGJ7A1AN6uArkkD+d2NfgZM17kvuAysZnVRePsrJRyWg8hqHcEFS?=
 =?us-ascii?Q?vPkcN8FFPldeIsDkeUgOkAyUX6iz3Mlkm3Wo4DbS4UPw6GSHH13BuVT1fojg?=
 =?us-ascii?Q?vd9dKPLJpzmuZ589WCk8Zfpr+e5lTLGwcLEYZ2B8OBRZB4rWszqUbuj+hgFw?=
 =?us-ascii?Q?g5+6s6+LrsMtyEOhZF9lzUakwMYw71QH0W0mc4lULN1q50fBWQaY0QO3Kbt+?=
 =?us-ascii?Q?/9l21+0GPrU+8lVtV8i/O3GA/0DIbqHjtJ2zhqLlb7xG4YQPyUki24YZG/AE?=
 =?us-ascii?Q?r0GLYC+Z6wPtEagIBzzdL7pcx5zyes848tipLY0hdCco3RzrisutyhOtIEJF?=
 =?us-ascii?Q?+Z2WT1mEmJhhTvNVKoMQ58Sc4Os2vIZM0RKUUmkRfQJYRP5SLForw2IFWjKO?=
 =?us-ascii?Q?Wx+6muulbzUpMAa/e/qQoQU6OFL3YvH3GT4cYAYIw93Wy+tUSwBqUkADL1Z3?=
 =?us-ascii?Q?m1eWx/NwXf9PUllo6jHlhpy+Dq7BsrxX99uAdGlW/pyxlkLNqTuV+GdVDWcR?=
 =?us-ascii?Q?iPeSTvUV/dPcPXT8ziK57qj6d1ZGrwKulzbl6lJGpZ/lGvVKP/mE09XNoJdn?=
 =?us-ascii?Q?vcHI5gaxuaD4gBXLrzVoAQmmK+sgdl3Bnm/6MdWtlJCQjAHjaJNNC/I+Uyxf?=
 =?us-ascii?Q?3rZPsEatRqSY14iEM2Nq7myBTuvG9ndYBg+/A1GpJRsB2N1Prw3pRtpIUKEm?=
 =?us-ascii?Q?IMTfOKpHhjcpC2C1ODAWHnHG4XDzeebsay4eVYw61MDPiERFO2TArufZrVxC?=
 =?us-ascii?Q?lyn6qOtYWW3+uNEIVJC/BZR73nPFzKMo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:30.9743 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd68ebf-d18a-4bb0-ef83-08dcc0918ac1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229
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
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
index f61dfde47156..adcb08153a09 100644
--- a/drivers/gpu/drm/vkms/vkms_colorop.c
+++ b/drivers/gpu/drm/vkms/vkms_colorop.c
@@ -37,7 +37,37 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
 
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
index 6e939d3a6d5c..bd1df06ced85 100644
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
 	struct drm_colorop_state *colorop_state = colorop->state;
@@ -184,6 +208,9 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
 				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
 				break;
 		}
+	} else if (colorop->type == DRM_COLOROP_CTM_3X4) {
+		if (colorop_state->data)
+			apply_3x4_matrix(pixel, (struct drm_color_ctm_3x4 *) colorop_state->data->data);
 	}
 
 }
-- 
2.46.0

