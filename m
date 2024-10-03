Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E673498F7A3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C140A10E93B;
	Thu,  3 Oct 2024 20:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KLavWVHT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B6210E930;
 Thu,  3 Oct 2024 20:01:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/hCp7GfJrm/UztsSSJbDo+o3dUrFJorAeLuE83JqfggHt58xECgmBWekUrCbdQJcNI4SD5dbjXVJe1mH/vQ0vf4G0coABJpWUFGpymBF7pq7vDxqcl3gVHnYMxxSpjVf1kilwyPWupVmYb0B43T2aTN6dBTF5aBtOCg2MjN89Q6doNKn9DoY7f+j2axZPvnPivSo9zLZ72HouR8cGpk7Kpp7Wh98wtWASPs1gNfauKsRUFaIt1zIix4tqjlJ+pG5ClrqbDDMmiVeNzrLKeElZD04u/9xyEpuwi5L6IIa/zIQ6mvoY4ZhyLiCi1j2PQRQA4zoftIYo5vzlyrZT7WBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3Oi94OEyzmMnG+tOW1/cV6nuG7DLta95nx+JmMPGzY=;
 b=dsFoY/377WNE34/urpGJWE7ow9a++sFUU/bhhP9x+B3d7d1n6vXFi4N1Md8Wygi18gcztD2yVOL4nahUunLx1jU1jFFvLvyJXle94TBCioGBIyt+PYR1AHWtDdUKeuK36u9QZ6DmXW/+WPIrAriVJnwo4qcV1XDcBMFrOc6XKRE3fSxdJK6ZM0h4S0zdoEtP9N/5rwMM9+jvWJZG5Si8uIeSrAdntcSwaQWwNgOmwlzYVmLDsvrIVPd1DwGt2VMDEw5iZeCBYYW96pnPEk9vpKOGhHxkw79Hb/TJYZD7GPWIdaZMGU5jaYiEjoW4DGjmv4TMClrW6CYAIyO6YtBT8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3Oi94OEyzmMnG+tOW1/cV6nuG7DLta95nx+JmMPGzY=;
 b=KLavWVHTHjQhMk7XRgkGDRFz8EB1KUTMq8AgB7syOSNfAlc6qyEEchDYcmsl5gtPK/QoJT3ble4J1i1uTdCX/5apECXX9480w3Cmvh98AdvH6qAXHsHULI+Jj0b528KUOCqNZ8nxuIpxPm7yPaPMzm0n5S8/pszxxXApmhTljhI=
Received: from CH0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:610:e5::22)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:45 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::da) by CH0PR03CA0257.outlook.office365.com
 (2603:10b6:610:e5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:43 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:43 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 18/44] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Thu, 3 Oct 2024 16:01:00 -0400
Message-ID: <20241003200129.1732122-19-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: be0eda44-bc1d-466b-1dd1-08dce3e63536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Tgv5TBO7Nrmn4S4aAYBlA41k6sOXfeyj5mswpfua4oDnxmVKZ+ijfp4jG2qt?=
 =?us-ascii?Q?9fsy11Wg0/EUA62sJpSHLgzIsTS1nWW9XVzt4dFP+zNaCVtmH8rZ3mRrXh3a?=
 =?us-ascii?Q?LX4cNwrOHdqdzrYgNpQfqrtT75xxBhg9Ue3j7plCIEEwGJ+ob2a9lK0oahPn?=
 =?us-ascii?Q?0Yj0Hw0G0iScumpcw54UfWxdxNEWb01YlS/IViFpYyAVoKCkIOKyTBDEmlVl?=
 =?us-ascii?Q?5FDUo02/rTA+uBBkaQTTg3QK3gBynHvrTivn6BMEU5wsH4I5Owxel1L3gmXj?=
 =?us-ascii?Q?SrF5zbtWYd3wL8xOQB/WOI+0lDEyOm7SU7izf5I7qsh1bzz+0NoAldChpFGF?=
 =?us-ascii?Q?9I99daIXzeqqIunDR0zByCY5jqTKy/eJB+CW3RevhuffxeToiVsnSPuzW9he?=
 =?us-ascii?Q?iwfDUF2Qmnvgj34TP4vHVTwus/ytbtskKD+GkrZGjC2TE4yzsimVh+Z6KGxb?=
 =?us-ascii?Q?BXRIRf5c4kuKmEXHEXatSPhrj1tWYHU2X9B1q9SWwRcyJkvlDXp+zQDuclK8?=
 =?us-ascii?Q?MwxsDcHe3joKBksMaxzL5VHPrVHcOjoIStLZWHKpXITBOS4HY64swY1dBj+8?=
 =?us-ascii?Q?i7lmpNUiSCkXObtoDCzMdkyPJMp9NJ2hEHCbq8kYcN4RULQmzWnPq014vVOU?=
 =?us-ascii?Q?0+zhkK/BT7gku6OapdkBVne94Kf1ZfyQ6M0JNUEwzDvxZLMJ5M5mN707xljp?=
 =?us-ascii?Q?Z9a6sM5tyoR7vC4RNkqcnU1ZPIZya0qQBjoz/QpF/bdtbXcPuD1GJW2Jp9JA?=
 =?us-ascii?Q?hVE1EJQKVnThnCYzV0110LTBjeT278NPt9xXdYRj5DTtxrspxDKq0lEazyWU?=
 =?us-ascii?Q?1/ymr+LGLwxVRb0FDhCQVr/NCVp6AcDdNBqNBBmXcQesZrCH9xz7b7/iCqbc?=
 =?us-ascii?Q?BTxQ2ZJdk03+d7g8uS0kxac0B8dpjUUMaOvFk661VzlqZ9fP2T3VdDqSGlGs?=
 =?us-ascii?Q?4pwQKHSaRbKCAm2u0fzUiQnm9JJsaJnQM0kwWn+qrGSA2kaS+VZZ2mV74XVK?=
 =?us-ascii?Q?FLIjkZ4DzeKlQKTotapRBp39eOgi7MIrOszuA2q3pDfv0awloVIS0RFlfC2s?=
 =?us-ascii?Q?5do03vEmZy9jaTV2aqMGfR/enkdtpA7hyNxAzrpca2t7OMCPDexAz2zNxZcq?=
 =?us-ascii?Q?LzG2r77C3L8nLUXkfEWDhrHNv+CJx6kU4YweLQhThY4Ffd9t0pATZSN4Dh2c?=
 =?us-ascii?Q?vQH215qBeZz0i1J+V1xF6uk+hvNsA8NSFbv51JMm/3F4BHt0eQyjVoEMXPk/?=
 =?us-ascii?Q?Zw9i5pPuWby2jmKF9doJL4zZBaUX1oQ7Sdmw+ZxGEH7A/qE7aOMfGjpe4GRc?=
 =?us-ascii?Q?cYkopTdXfGkPDh2hTmhEkvCvDe7PQvf+Vhj2C/1+YwCZJk6HtwjM9Sb8sOL3?=
 =?us-ascii?Q?s00KAT0AG2JT6ZZbO9lvdsK9E6N4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:45.3552 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be0eda44-bc1d-466b-1dd1-08dce3e63536
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

Certain operations require us to preserve values below 0.0 and
above 1.0 (0x0 and 0xffff respectively in 16 bpc unorm). One
such operation is a BT709 encoding operation followed by its
decoding operation, or the reverse.

We'll use s32 values as intermediate in and outputs of our
color operations, for the operations where it matters.

For now this won't apply to LUT operations. We might want to
update those to work on s32 as well, but it's unclear how
that should work for unorm LUT definitions. We'll revisit
that once we add LUT + CTM tests.

In order to allow for this we'll also invert the nesting of our
colorop processing loops. We now use the pixel iteration loop
on the outside and the colorop iteration on the inside.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v6:
 - use clamp_val instead of manual clamping (Louis Chauvet)

v4:
 - Clarify that we're packing 16-bit UNORM into s32, not
   converting values to a different representation (Pekka)

v3:
 - Use new colorop->next pointer

 drivers/gpu/drm/vkms/vkms_composer.c | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  4 ++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index b4aaad2bf45f..01fa81ebc93b 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -159,7 +159,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }

-static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	struct drm_colorop_state *colorop_state = colorop->state;

@@ -185,9 +185,26 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo

 static void pre_blend_color_transform(const struct vkms_plane_state *plane_state, struct line_buffer *output_buffer)
 {
+	struct pixel_argb_s32 pixel;
+
 	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
 		struct drm_colorop *colorop = plane_state->base.base.color_pipeline;

+		/*
+		 * Some operations, such as applying a BT709 encoding matrix,
+		 * followed by a decoding matrix, require that we preserve
+		 * values above 1.0 and below 0.0 until the end of the pipeline.
+		 *
+		 * Pack the 16-bit UNORM values into s32 to give us head-room to
+		 * avoid clipping until we're at the end of the pipeline. Clip
+		 * intentionally at the end of the pipeline before packing
+		 * UNORM values back into u16.
+		 */
+		pixel.a = output_buffer->pixels[x].a;
+		pixel.r = output_buffer->pixels[x].r;
+		pixel.g = output_buffer->pixels[x].g;
+		pixel.b = output_buffer->pixels[x].b;
+
 		while (colorop) {
 			struct drm_colorop_state *colorop_state;

@@ -197,10 +214,16 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
 				return;

 			if (!colorop_state->bypass)
-				apply_colorop(&output_buffer->pixels[x], colorop);
+				apply_colorop(&pixel, colorop);

 			colorop = colorop->next;
 		}
+
+		/* clamp values */
+		output_buffer->pixels[x].a = clamp_val(pixel.a, 0, 0xffff);
+		output_buffer->pixels[x].r = clamp_val(pixel.r, 0, 0xffff);
+		output_buffer->pixels[x].g = clamp_val(pixel.g, 0, 0xffff);
+		output_buffer->pixels[x].b = clamp_val(pixel.b, 0, 0xffff);
 	}
 }

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 278cf3533f58..b78bc2611746 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -36,6 +36,10 @@ struct vkms_frame_info {
 	unsigned int cpp;
 };

+struct pixel_argb_s32 {
+	s32 a, r, g, b;
+};
+
 struct pixel_argb_u16 {
 	u16 a, r, g, b;
 };
--
2.46.2

