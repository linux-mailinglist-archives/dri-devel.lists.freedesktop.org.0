Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13CB9F8B6A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDC10EE99;
	Fri, 20 Dec 2024 04:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T6tAVkjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343A710EE92;
 Fri, 20 Dec 2024 04:39:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeYaxm0GhgTORCa+nbQ+x/W/P8GrN0FhExSul4ocz6xA9Ca5s0aiwGKc24XYtlwKBtIvc1VzbvbxOh/iHw7IlwAbN1vXcFyVgEOgQ3U2lN2RcggmuICdu9z6D+RA8KDnUjLr6xAytJZBqXM9bLUvrULjnVOeh22dJwfI3Ic9HyNzbykCF+REJGyFbOTh/lcc5Rsv+tCPPDXlvA1EGLgrO39WS9paYC82aAD3eGvBtIJcW7gF9qaJwAQlLcbUQn6VX611jeL9hIb+eFmmOWWrrSiI+R2Akdw52pFODKUjnYh1hKMUR3U5upyUGgf3k1MZXbAglw1XT3ICG7SvhgIpvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZOlLeiY4cXoI7elrlniD1wJBiQlfeceApv9mklfuzQ=;
 b=qdCVCCp4NVZbZcro4+3exruKMZ7iCOTeAF3u1GTXLf1rW2v4ZAWeRDk1qyryP28b+Qvpahgl3c+PAPqTPuVt+IVux04Ndozm6zwu/KsixQMK3CoPp6Tm96Rt7L/BJw1/WEu6zi5ZMZHJ/pTD9ywryP8MHA/eKeF6+dpXZbSouh0y/ZX7mgHu3z636bgIkh0dLEP4zXhDQOUbjXy63ciuqjTVemGG9Cicldy70sgLgAvfhIV7yR5IOVida0lZxQzW6bAwTLT4TXQr7N1lSRgjLz8EQ9zRNZ4H2IVsS1A79YQE3n9gtZXsWEWMk9Ss2FQ4WsBN6CfcenU4CK94K5qSNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DZOlLeiY4cXoI7elrlniD1wJBiQlfeceApv9mklfuzQ=;
 b=T6tAVkjtkMr07X67er8Cxosmw4Ns8wB5PQe/w4EqhdXrd2cixH0DOoiqu1MITnz5lY+tFU+AImtKhlGtIOeVnxnajdcaRb+1vJow47vicMLJydYie9BXKlRA9HwCIW4t5eA1PvmO160k/KouMxuKiKtz5BUh806yxQDoKwr5HD4=
Received: from SN7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::25)
 by SJ2PR12MB8928.namprd12.prod.outlook.com (2603:10b6:a03:53e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 04:39:54 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::e9) by SN7P222CA0030.outlook.office365.com
 (2603:10b6:806:124::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.25 via Frontend Transport; Fri,
 20 Dec 2024 04:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:39:53 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:39:51 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 18/45] drm/vkms: add 3x4 matrix in color pipeline
Date: Thu, 19 Dec 2024 21:33:24 -0700
Message-ID: <20241220043410.416867-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|SJ2PR12MB8928:EE_
X-MS-Office365-Filtering-Correlation-Id: b0992a89-9d5f-464c-3a74-08dd20b058fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9k9X9J5dK4+rLFuwUaOcYoLx5A2yiC0aCAzvbTIKT7x5xXWKt780ndJsUgRZ?=
 =?us-ascii?Q?gXFTZbm5tEyHhN2GiJDex+jBgS/l5pfuBOYHcbbpl+Qua1dETl+IOPSk5bYo?=
 =?us-ascii?Q?1uYQYhZWlAXUJMmpdpGvemjMamHqthjJi6nK/JuTBlOMJPqkiv0uPODomDBf?=
 =?us-ascii?Q?fMGzxH1R+JvYIMnwBeE4oIe5gtbej6dfB4NmpfLIs/dYBuU5OD8L/0F1MBUF?=
 =?us-ascii?Q?yDjBCpR1+NOn0rOLi8XAosH2l1N6A8YJOF888tMAnOYMiBpbww/+XMd3x5J6?=
 =?us-ascii?Q?f0Z44sqHOFE2McQvLySfkT+pZFnUl6X4K3glEQYD6VD/J0sNA6Yq5fTN+Sgc?=
 =?us-ascii?Q?QCDwH28rw1VxB3nngFxUgy1wHWHbC6U8UrP23NTNreYmeYEtgkvlB1tRUXDP?=
 =?us-ascii?Q?90o2xyiT45g2b1pl+Rz6epY1Cv4wm9ReTpcR3huOFOeJJI4mQHqvq2m16G4E?=
 =?us-ascii?Q?j58weP8aUZjcQA0jFSgmC60caUiuPLut8CPLz3NxgTdfO8zMTMY+G85BBDsu?=
 =?us-ascii?Q?4qN2VTJg5Q15CvIZ727VJ3qenHWpl27TnUGECj3SYXumGD7Ks+kJJ2aEZO7u?=
 =?us-ascii?Q?0reR393p5XdTA+JhBuitUzuknFcj5igOXgetiLeO6FS9dC22KomwjFpq/qdX?=
 =?us-ascii?Q?ES5RmMW8GYZ6VxsO1Ulo1lCybxdgv4oolWM4RAPce6+7HCsdBHy0IbFJVH7z?=
 =?us-ascii?Q?/cjnTQZyh01rwyLIBh1tHR83adLQAU6Il1FZa2aCN2pKKrTFhYUAedxNx7LU?=
 =?us-ascii?Q?e5TuFRNrw9UD9uFO96u3AYc2qad0d/cEXA3XOeWm9KtwnhEU1SPEhslMh2Qf?=
 =?us-ascii?Q?D9hrhKRhGLeSMsn/AdNCwjUZ+L/rmtPNVcKd7+Rdo+TyDVsjKabpg4/7JfSK?=
 =?us-ascii?Q?LVuiMsgmNLDK9o+APzUDbMExSBocH2661ZZSbwF2E+fihhdrjt1UJ/AWM2oL?=
 =?us-ascii?Q?whpALYt3uoofksomuzZrkRRo3Zmqt49KlIKZAZRmPMXwMeuw2L8fGjWWoZTI?=
 =?us-ascii?Q?Mzo6WhI3cZOT7sLM0U9MQ0GXkJ41eeBbYzArHXAxYU5mM/fHTMuhzG4+mJeW?=
 =?us-ascii?Q?zys2QOEcXRY+mocX5gYlTIcEDPJb0qGwNzZotGcUQaQzpJgE9ACSt3rLY2nX?=
 =?us-ascii?Q?AvzURDiOUwCQVNCvG53ZOeF21HM30+qCEjRZIGvMQJmupexD+9B7R/12bzXD?=
 =?us-ascii?Q?/6Q8bCpVaDUHF+SpgFsPqGA5w64FyR/a3njZ5ProdqpNXrjVDpacAVoejMGK?=
 =?us-ascii?Q?Dsa4OsE2qXcOxu9UUvzuj+BflOv5jESKUf9JpkJ/36h7DFvIU+Nvdka/f9Gw?=
 =?us-ascii?Q?yFu2zEQBO4DVzLYC8tZY3dLmmt0b9xYYQpL2fMy1mp2eZ5Ui4HDSiTtfOqfj?=
 =?us-ascii?Q?l92YpySJzVBL+RtTDKf0Mic5UvPAST1eupC2baaKQ/HHeb9Bx5NIdCfx52P9?=
 =?us-ascii?Q?Ug/zR56fAYyyXOyhojaCJB9p1GacWcg1zMyGoCMlNTtrYuEBPq9/z8VgwsH3?=
 =?us-ascii?Q?z+je2EItrweo098=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:39:53.4824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0992a89-9d5f-464c-3a74-08dd20b058fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8928
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
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
index af319cd3de23..b407f8ae758d 100644
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
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
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
+		DRM_ERROR("KMS: Failed to allocate colorop\n");
+		ret = -ENOMEM;
+		goto cleanup;
+	}
+
 	ret = drm_colorop_curve_1d_init(dev, ops[i], plane, supported_tfs);
 	if (ret)
 		goto cleanup;
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index b009e607a310..cdcaaf8cdb68 100644
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
@@ -180,6 +209,10 @@ static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colo
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

