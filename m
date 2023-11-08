Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5057E5B70
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EFC10E7C3;
	Wed,  8 Nov 2023 16:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5EE10E7CA;
 Wed,  8 Nov 2023 16:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrKrrC05okxrC3+Mn4l8UEZNjZVh6miHZZ4Z9TSHvt1mNiQYIAuOQ30qLvumRe17NBbBtL+2wvO6bevhi3v9fVMBsPOIdqrAjaRrvSmw1gAbp/Y0ehTaPyFBM0Jntwzna5B7nP1IGpvygt6RO/vXP6UzGylCjbWI+DYWetp+1IpmvoUa9fXm9T3vlrr7xxwclcs0DujpHFS8D9oE8gHVa0T1e3KCqadCz+TdRq6Ktng8F1qUjtq7KQRsy+zI42BekRzy6IEMEdW/PP2GATegfClh5fx7zUnBeDhvJlPK+zbYSpricpQv47f7ufL6TG9NBYYqcCy8XLSzK4aK0DcIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYb8cwfbpQpuJLyAk68SCza7odTOs9sjnxbwr3fQRdQ=;
 b=Bz0z54ibKV7QOeZPnlAbsqpdHAmLADkaDrYwEB8ppFkUMOyXm7V/RJazFgD0REgSXhqTA/XCAXrRzuLKfIyE/tEIFQuE4s7/3gxH+t+utOA3axiOdncmCQKulbKOgkef/uiQXbtI+yAIFDlSPjsi9MKSRwwkNeJ7qSFy3xGPTHNDXJbPdbaGHy1eZWYsCZZ2HYfx++ChG/AHFzl0K8xt85U+rNTCarS74Jg7GmH5CFnltQQCb/wJWB7kB3QssUWmzyInY+Bu9hJoDG7h//TVk8HzMg21qAzk8dfiHUjI+YiIY39vvlAJLUZ13+D+JX5yeCJJKnsok+4HQD8cnjCK1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYb8cwfbpQpuJLyAk68SCza7odTOs9sjnxbwr3fQRdQ=;
 b=x1suKEYZZg9S5S2OwwQEg9I89EbIZoskVbQCmXMYd7SLDE+yQjAH88Zzi2eF9fMNspY9Q6YORJqdSIZGdoKx1obcc5FLrj04prfv3i2MEE6Zk4tLOEZkNm2aPSg5/H/qr94ftLdDDfc1NpcbzQGDBbTeT4tgOarWQob62cjg3dI=
Received: from DM6PR07CA0111.namprd07.prod.outlook.com (2603:10b6:5:330::12)
 by IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Wed, 8 Nov
 2023 16:38:02 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::ab) by DM6PR07CA0111.outlook.office365.com
 (2603:10b6:5:330::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:57 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:57 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 19/23] drm/vkms: Pull apply_colorop out of
 pre_blend_color_transform
Date: Wed, 8 Nov 2023 11:36:38 -0500
Message-ID: <20231108163647.106853-20-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|IA0PR12MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: 69dd816d-f90c-4ca3-85b5-08dbe079133e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LU4MEebh6+WE1b/qftpOP2uSiI3Id9WMHjU2u77AStin985km4KRvrvgxsiJvuwdoar6o850NGKpf8xNgczfW9WtIyWRr0OWapsC1PWTMrk5DXpc9WhW9s+56dxPr6hYo4rrP+MAGjtXHXsLkzM36rXs/ug3NLklcYlhP0igImTXGa0IXxrpf7cTrp4IebIe/fLwzvduIJATru3y0Z7zpJ69+YV2PI+BsIpjPTYwDl3bOBAuvn5Qqr41XWOQy5qskvW0do9wJzepA9AONDWC25Ued31EnxwLV3vnsTQikNK1j/o7bv8x94rYMa1K+LnsKkKRm6khjkHC12Te8uFUvuWrANb8omQhI9GZkUUXmxjGzyF2/zNcJj06tq8/NH3uQ8jmstMIjKAdL9L7LOBBXwQEcYRaJf26U7r7sfEOVt6AkxLCnh3qnpxf/l/XnCUZGCC4CM819Cu3qNWukPgl45hR8cetw9DnDt5GGw4t7RxuZqa0LCaMNBnN+EE7hyRRO8fmc/OOzFfAAluTxkAViWnO9hcAZUnT+KZNHUe2Vo7zx6iH+HerGmVChMti75LddNrGLI21NLR1maGG7UfGwMmL+ciQz+lUNjtHoPmBlGKKZL7Oq062uPZHK7E6wRinV8lV9Oi4I/e/uvj5dsk9zk4EIGWz797pwQXFqgXbPFFiKOxDV2cglaLxJth/PVqu01J7MGNcBVo4+ImhxtahGK5rT/aa72doHbdTuXEn4n85mqR5B/m/OpQGRJ2Tf7iOoR3pvRL9Iypu3JEDqVZMfA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(2616005)(6666004)(478600001)(36860700001)(36756003)(356005)(81166007)(86362001)(82740400003)(1076003)(5660300002)(70206006)(54906003)(44832011)(70586007)(83380400001)(47076005)(26005)(426003)(2906002)(41300700001)(6916009)(336012)(450100002)(316002)(8936002)(4326008)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:02.0492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69dd816d-f90c-4ca3-85b5-08dbe079133e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580
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

The if/switch statement is bound to grow with more types and
subtypes. Pull this out into its own funcion to make things more
manageable and readable.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 48 ++++++++++++++++------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index be42756e300a..9010415e4bd6 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -164,6 +164,31 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
+static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+{
+	/* TODO is this right? */
+	struct drm_colorop_state *colorop_state = colorop->state;
+
+	if (colorop->type == DRM_COLOROP_1D_CURVE) {
+		switch (colorop_state->curve_1d_type) {
+			case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
+				pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, LUT_RED);
+				pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, LUT_GREEN);
+				pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, LUT_BLUE);
+				break;
+			case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
+				pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
+				pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
+				pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
+				break;
+			default:
+				DRM_DEBUG_DRIVER("unkown colorop 1D curve type %d\n", colorop_state->curve_1d_type);
+				break;
+		}
+	}
+
+}
+
 static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
 {
 	struct drm_colorop *colorop = plane_state->base.base.color_pipeline;
@@ -180,26 +205,9 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
 		if (!colorop_state)
 			return;
 
-		for (size_t x = 0; x < output_buffer->n_pixels; x++) {
-			struct pixel_argb_u16 *pixel = &output_buffer->pixels[x];
-
-			if (colorop->type == DRM_COLOROP_1D_CURVE &&
-				colorop_state->bypass == false) {
-				switch (colorop_state->curve_1d_type) {
-					case DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF:
-						pixel->r = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->r, LUT_RED);
-						pixel->g = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->g, LUT_GREEN);
-						pixel->b = apply_lut_to_channel_value(&srgb_inv_eotf, pixel->b, LUT_BLUE);
-						break;
-					case DRM_COLOROP_1D_CURVE_SRGB_EOTF:
-					default:
-						pixel->r = apply_lut_to_channel_value(&srgb_eotf, pixel->r, LUT_RED);
-						pixel->g = apply_lut_to_channel_value(&srgb_eotf, pixel->g, LUT_GREEN);
-						pixel->b = apply_lut_to_channel_value(&srgb_eotf, pixel->b, LUT_BLUE);
-						break;
-				}
-			}
-		}
+		for (size_t x = 0; x < output_buffer->n_pixels; x++)
+			if (!colorop_state->bypass)
+				apply_colorop(&output_buffer->pixels[x], colorop);
 
 		colorop = colorop->next;
 	}
-- 
2.42.1

