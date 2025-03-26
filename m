Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E330A72769
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:52:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6334010E7DC;
	Wed, 26 Mar 2025 23:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PzeBjvtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CB710E7D9;
 Wed, 26 Mar 2025 23:52:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlOLk67dggUEh8OvSucVLqi1T6+H5h2D+Y7dTWYqhw0Yw8VlUWxiVxBBocOwmg3sOxGJTLORVaT8AMPlZydB73eEZnHEyvFoNaNxPnC0BG1vH9hmrrVCqUkro688+Nctpja6EqK39oWIIaVqU0MSCtpwLzo2zecyhTnxzgF3s4dKrula1usZ287aRjzYT2PArLRSA85W1/JBJhUIDChDkTT5ySM0UbiQ+BJ3MTUYebjK8qKw7Rj399LDjdD2A3oxHroboZAB0u4RkT7odomNT6u75+BNuaIsMi/jinYGgTqZznd0fd57MtMeQAcq5OTdi+AJhHw8c6atNBmHDXgUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a99Shx5Ax5Rf2Glgw+DV/GvArqFLGuRD5avJrB2m/kw=;
 b=QryDIjPQkpzz80XvEpFrJ0yy9U80rwKEHP1uGS7gdAJFl/mI4goCthHFZ1+AQC+0jK1wlnCaHrlC/YinAX4FvxzoiYZCdgzkvhZZBaPCOz/A8AucjVbqP0qRcT09YgZNES03GtSMw7pvzIkz9WVBIzRU480x66Z6roA0sINM5F2tHC08QdXrUZdUhljuo+paHxVKmGBpoy43RW3GwnAO5aW3dTOi3RGufKxACdif3Cw8owpuG3xyYocV/3fy3IAQafuzv+POk0j3zgQHRr1c5GV+RW/szyukZnxdFSLUsd8Nn6KUGrlin/7AoWjGLlU/RwbhSZZmLy1iqt+bpgi9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a99Shx5Ax5Rf2Glgw+DV/GvArqFLGuRD5avJrB2m/kw=;
 b=PzeBjvtIPkf7iekKsa4geU22fSCMcpL3ChEZIV4VWvOi+sZv9ZxIitXQ4TgGRnV/rJKi1HjMqFAFMMaTfC7CveBXyIYTpExGcU3payJ4X7N9iVJ3uBk59TM0PlXeb/uNt6A8e7O/XoiYo/7I4hZyBNfCgZZRN41nhbLT8FMJHCw=
Received: from BLAPR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:36e::24)
 by CH3PR12MB9217.namprd12.prod.outlook.com (2603:10b6:610:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:52:21 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:36e:cafe::28) by BLAPR05CA0019.outlook.office365.com
 (2603:10b6:208:36e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.27 via Frontend Transport; Wed,
 26 Mar 2025 23:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:52:21 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:52:18 -0500
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
Subject: [PATCH V8 16/43] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Wed, 26 Mar 2025 17:46:57 -0600
Message-ID: <20250326234748.2982010-17-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|CH3PR12MB9217:EE_
X-MS-Office365-Filtering-Correlation-Id: b41eaa83-7004-4da6-43c9-08dd6cc13fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i8diBix4G7atNsfkb/ZnUmLe5ZIgUOZBj68RhCtOaxnn4DBImJxzchJFIxX7?=
 =?us-ascii?Q?KQFrFqHN3fmUgTu5O26PXvBf0JsoIFmRZ9VRibwy5uBgwBdcHu5uHaw5kjcL?=
 =?us-ascii?Q?aUwJg9i+gTncHrjS0PThFRAF6jf/ADJ1gtQZD5e0eEmyO8H1Q5jX5669s9DY?=
 =?us-ascii?Q?3GAd6NwmdEQYICQiWu2pO1Ne7VUrzYnevPQX4UGDPK7KmUF4FJqFk6CxfYc2?=
 =?us-ascii?Q?BZyzOq68+Hq7cfYHwsQX9VF2+UzDL1GYRdy3t4SUlSzl2APChpd6gBghFgGE?=
 =?us-ascii?Q?yt3EJv1JPSJWPTuoVI2r9nL1JShPesALGGXdlBtG8Nf4IsC3rRVMDFawJLTc?=
 =?us-ascii?Q?RBoLKBK2A921yXMduw/GxU+CpJLTAZp5w5jfH/qhdhw+OaT4z9rHiuV/fAaW?=
 =?us-ascii?Q?R+k3TgQBBRG1nTK828Uvp9wpcwJ1WHBcGU8QFwaQQXsRHTNuT6W7rCqLmjyS?=
 =?us-ascii?Q?mZ+Tv8dP0Ajpos9vYlfkCuJzc5V2Y/GQL93X2MdWFvyIDMt3m7UhXjMQ5B/y?=
 =?us-ascii?Q?orzTTxxlL35ku9NZA5CWVanqk4VRhUsLG8SFp5Nxnc9SdWpeg1mybTF68PXV?=
 =?us-ascii?Q?zm/K6RTGVmZ1H69znxLJSWcPZRQ5YIKFQpRhGlHZeJBZ6ke4uFm9h/Nc9Mew?=
 =?us-ascii?Q?VeXHWsuC59C82LkMlzpPk+Ko0vmLsxgul+QruFdyqUohamqBoeAJbSfKIega?=
 =?us-ascii?Q?1mZEr1q1jYZ/yu7y6AreV65ofusl6l2oJkjZpD7viKnQyhKbtaMxAfzKJZso?=
 =?us-ascii?Q?Lfx5INJaU1p53YxwnEMoa65gb6qA2+3dtWduPYrKjoEgFMK9QAo8qaxiluN9?=
 =?us-ascii?Q?O7cZfpGoWCUiOrWFtiI7OnALlzIeHsHKVfbGBIhXMw7bz1trKximlrEvHFcF?=
 =?us-ascii?Q?rQp8o7+CDjZLMPUrToYJn5QSD07+abB6FJPp9yBQb466vPeX/rk7bRNgy7u0?=
 =?us-ascii?Q?Ndym+2EhUBlyDbAXoQ5q/VunGV6hnfDjtaNVY9UUA33HNbQZGmLT1W3Ad4O+?=
 =?us-ascii?Q?uusmkwh0TqdGc4yh6ytt7OrsL8OOZHMAjKhINVMWGlAxjJM1LG0LJu1kNWo0?=
 =?us-ascii?Q?zbk5NmaItWldXsT6FQWURePxwCRfVZsopeApdS0iaCqNn2JxykDret5KbjDE?=
 =?us-ascii?Q?SU+upU1L68BZT6NsRwrcJlp2akB6l2kIuC8SJXDiSfshHfcdxqP5I0tZVW9S?=
 =?us-ascii?Q?45dJP/s8AWQ5Zb/imvtnpdBVG2BkkrIPvWhEznS08yWeaYSmJua/+4fUJbDK?=
 =?us-ascii?Q?c1/KnFTT/R4CNWyvkJ/WoV0dP4FhnA1NSjfFUnzT9Lj46lFCYrtWGa5SfFnI?=
 =?us-ascii?Q?p3e2+OixyBLXAU23r4Nf2O1i+JseLpduoGVx5PYfX2zRl4OB4M/jkpkbMDMz?=
 =?us-ascii?Q?4Y8uPC0TNxktx4lwz4r+YiG01OL8fzAZqI16q/mvHrUfxIkg5SG7yDGgImqV?=
 =?us-ascii?Q?zFIoR1v2McYEaN69EPB5RL3AKC94wz7wZfpUzeqL4uCkpObU9nvIPDuou+Gu?=
 =?us-ascii?Q?w2RQXcF81Kwc28w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:52:21.4347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b41eaa83-7004-4da6-43c9-08dd6cc13fff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9217
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Fix checkpatch warnings
  - Add a commit messages
  - Fix code styles by adding and removing spaces (new lines, tabs and so on)

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
index 72890ffea13a..36f0caabb67b 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -128,7 +128,7 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
 	}
 }
 
-static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colorop)
+static void apply_colorop(struct pixel_argb_s32 *pixel, struct drm_colorop *colorop)
 {
 	struct drm_colorop_state *colorop_state = colorop->state;
 	struct drm_device *dev = colorop->dev;
@@ -157,9 +157,26 @@ static void apply_colorop(struct pixel_argb_u16 *pixel, struct drm_colorop *colo
 static void pre_blend_color_transform(const struct vkms_plane_state *plane_state,
 				      struct line_buffer *output_buffer)
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
 
@@ -169,10 +186,16 @@ static void pre_blend_color_transform(const struct vkms_plane_state *plane_state
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
index 999625de0050..d9196b9db025 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -43,6 +43,10 @@ struct vkms_frame_info {
 	unsigned int rotation;
 };
 
+struct pixel_argb_s32 {
+	s32 a, r, g, b;
+};
+
 struct pixel_argb_u16 {
 	u16 a, r, g, b;
 };
-- 
2.43.0

