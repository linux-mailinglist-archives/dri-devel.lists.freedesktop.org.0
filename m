Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C3868283
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2478410F1F3;
	Mon, 26 Feb 2024 21:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DhmcQ5P8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7FA10EF34;
 Mon, 26 Feb 2024 21:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZFEVhdKist5Yh9v5h5ODnUzDF5jqk1IFg8/CN+BUX2YJSArW0CdkhVnrT6RzyV34dShxBIfYokw+174Zycv4gyP4mfDiGPL/VEZy35JKE2wVkKn11vPJDlZ7jrBYiFMFhyz7EXHd/WKnB/VAtmr8l/UQ2OUCrK3TgWPnRwGIwC4SK9JgC4Oex80gM8lsdYLzm7+EujJnG0Wa/gzwBBdy75xFIO/eWalvDKxDgrVTZVmvwBDx7qj5Fd/4lYje3cO/wkPAFhBRAo/JD6CJsLqLfTswhwmPk1wq6w0tUPTbuwNeYftMGIjsiqTKtaPKKrhtywdAbCmCJslZMxMqopk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgqhagyuM+HtwrCtgydatpjGLAsu652/+AdySsCqdcE=;
 b=dMa2ctjHqAK2KsRkobapH7ItqBx/vO879IDXggq4seJHUw3YYviYmzNmFtARr9dzHmTFL6FTvc9ovja1SDYwHL84KqzukbOlYzrn5jYUqVpofpFBpn3dUc9alf7u/qihdJvq7Q4iyFsmMDwqlDctYud2HxjzJEAkzLuArrpB/A+FXkV32Qc6D6cpvbM6bUIXVK8w9ArdctoaPbWKAPorfbAoVomecPuJatMqhWUVodRhJzQRzTBTcefG7plauzmGWueOhLp1o+HTH8L2HMQeqLS23V7wGvhLFw0ZMB/jBSfUek0YrPY3QQY39b/T9bh5Pe/GIGv52u9vdcO4xZ9OLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgqhagyuM+HtwrCtgydatpjGLAsu652/+AdySsCqdcE=;
 b=DhmcQ5P8EzkOqVdsP3rm8pVx1Aisq5fI3viI0+vpooI4+iEZ8bBAV+m0JA61UTpzFXqvdubCiEycsAg/lQKqOQb42XMYIk8FoYBtY3A6PrutFA6zdJ3ZfU+Do9ojK7sjeMbFVFVF/crEFlKwzoeDlzgMuhvVVjxhCuk9kCIJTWo=
Received: from SJ0PR13CA0062.namprd13.prod.outlook.com (2603:10b6:a03:2c4::7)
 by MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:23 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::1c) by SJ0PR13CA0062.outlook.office365.com
 (2603:10b6:a03:2c4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:19 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:18 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:18 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 21/42] drm/vkms: Pull apply_colorop out of
 pre_blend_color_transform
Date: Mon, 26 Feb 2024 16:10:35 -0500
Message-ID: <20240226211100.100108-22-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff7e5c8-ddb0-4886-5db1-08dc370f7c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhCF88U6un+KZq5pxLieLhPQM3zqvX3EF9wCaN9yewzkVr855lPpsuCWF4UIoE3+bgqvQHEZEMOvYWHt4cvvqq4h9+kcdgKZU2GUPorCV6/6uyf9Un52/zMcjIVDTP9CDzCTAdrXZiOMoPL+XgIZfU8r93iUCq3tn3VRZlaRYPLwwXG+jeV8gD/xGMzOHnyBzXI/WN3eme66Z+cJcvJRK8W3AN7qqj8BicjSDKfXPSoAr663wdOMZBvmerQGbC/cMU9M1t4Po8MsRYsJR0XkaYVm8f+KroKOVg1+YN7PpgW9jJ4HUxOZBSCVvajU3cn4U59VUI2kDRUNXkSfYId8rtW9x6Bxy+Se3ghheRZWIjQDbn+9eYoZW924e68Cp4OVmPDM7g3whpzXUifsNIAEmb4qJ5aDHwJaYZE1Kc25Rcy/UzDlXhuF73Qi4x1cZIfPQBQ4qMp6wI7SUsMhEwoE7iz8QvUSN8/atk/cwRWNXcYoJHyy8s5buCVE4ivpfpKpUoXQsPBLtB4wVWVVaburj6jmPd9CmZbcFoWuRw84QmwQ5p+m2/vdr/QJC6D7SK88A7l4DIOHIUbznfPBcO3Ok0hT9pc+2W9XQx4qPEXKukQBro8L4sGJHDKNEmREpbFsCv82pgVIP0LjshoLVdhHLTfcy0UuVItXM2dMoul2EQYtSL27wg1Ot/u1sGueyWdKbs23GhhQUSmrqNCieEHQX9GwzWigdS2kWHFmltgFy8V0DnpWqRC0xdsVJRvlC0Bx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:22.4274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff7e5c8-ddb0-4886-5db1-08dc370f7c0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470
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

The if/switch statement is bound to grow with more types and
subtypes. Pull this out into its own funcion to make things more
manageable and readable.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 48 ++++++++++++++++------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9493bdb1ba3f..25b786b49db0 100644
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
2.44.0

