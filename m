Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53320C5FACB
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E94810EBDB;
	Sat, 15 Nov 2025 00:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J+A8JrZi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B40F10EBDB;
 Sat, 15 Nov 2025 00:08:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR6RmpK/upsAlFn8Ixu6/787RwIBRbBY0Y4ul+8ncKrPiR3AGU1QEZBHzCIUftv02VihZwRpoMYvQyO+n5T2Ew0jJbNnOK4lkUuYhZi7S91tIdbU0h4dIe0Peb/IASQGeCsNwK4LzRdIqg5rtitbT66xW/5ZX+ScXGAl4oowacRcuy+mVTLshC8AdI/+WYmdolCbDb1LQ7rFVuPgaRzpdCz0zsmr9ExXZQNKPp0EP3+kxDrvSsW3cobKGQyvAxwO5hvcoVAtD9bh1WW4yuy5eLFdBB+0Akg1+Cws3m8Z+0mQxxvt0h/UF6bnGMZX8ii7LogZWoUKYDrsy5EgAvMOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBEF228NczvLnO3/hgyTEVuxiV9RYWuoXYq7C/VB0pk=;
 b=X9STY7U+ig6c1E0F/ZfoCwrF2hfYsD2PLoltsJXl17PUmPMjmkCS9XRJpCIXYr4pFAIFyW+0iATtT/vtCNYG8CInbAOY9PMIOe5AM7u2y0Qra+Yp5oDoSl3Dg1qbg7gBomcigROljfNdGGaPU9Irz3ADg+qjWIZoOZj3JD7qOrRIXhG+R/zW+Ik3V349TC4N0PjmPM+SvwY9RjR8eEsts5IlX0g4MlTKKErDeUJpYPx6une+r/NBv9VaTXtieyO3U7h7DH4mzOh731nWLh2+I0ikiwGB3+6VF/UFz/684ItcjoEVohWs9SLCZOVQT/KwLi8QbTh7iDDdMSDJB76iog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBEF228NczvLnO3/hgyTEVuxiV9RYWuoXYq7C/VB0pk=;
 b=J+A8JrZiaEc8blOkvt5GglI3SYvK7/F82Oy8/ELTiwaMPQT8M4d99upQpgro/MpmOgDThc6aMX9uoQC9FeB84ad4SVEyX/Nfv8oBj4sHBzhKQ2acjUmyel6UEe8z+Rf81eeAaOA9L7pWJCZiC01zbPQrzrW4f/PwVQDE1ANB+wQ=
Received: from BY3PR05CA0049.namprd05.prod.outlook.com (2603:10b6:a03:39b::24)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:08:20 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::40) by BY3PR05CA0049.outlook.office365.com
 (2603:10b6:a03:39b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:08:19 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:08:16 -0800
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>,
 <mcanal@igalia.com>, <nfraprado@collabora.com>, <arthurgrillo@riseup.net>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH V13 19/51] drm/vkms: Use s32 for internal color pipeline
 precision
Date: Fri, 14 Nov 2025 17:01:44 -0700
Message-ID: <20251115000237.3561250-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: f80c589f-eb20-48de-e13a-08de23db1597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+q983SPQWY929EHiK+YOE5UivpCgDzeDj1bGIwSFWfO9qRlCkkbTeIc045q6?=
 =?us-ascii?Q?vkbWX0XtrkukGa6hL4omTvr4EQMEmc8bHyM7eUdmo6zHkqpptMHZpHWPPAuY?=
 =?us-ascii?Q?rR0ELRue3axQKh4UmxW6Bnk6Eo4USvkspRcxaffV7aReBadIokXyYP21Gg2Q?=
 =?us-ascii?Q?/IV45By5MWzRyq5ZdIS7K7dVTaIJjJdQNKUOLzSsADl9OP94t7RoK7gzW5JA?=
 =?us-ascii?Q?ouBvINrUYeAXUS9wdNPjwAPTfZNDxaus1nTaqDu2XxTqlrdpuzdDRLlpY+XU?=
 =?us-ascii?Q?My48aObVW10XXT9zBDfvb/evOv/8oZ8oV2Wnyi4eKOp9ZT2zpohnI+w8PNKW?=
 =?us-ascii?Q?vrZFqzpsQenblq3733J4Z91ZpbxPLRapYZ1eEuq+vXfT8NS5uCRSp3Qev1fo?=
 =?us-ascii?Q?2z0tsKqU2IwOxzKIiuQhYrHjEBUrH9j9hxiaeN/HHbVP0FYQCfVsewtAdPGg?=
 =?us-ascii?Q?xD1KNI1cIkNs94eTHgKdE0WYf/8uE4SNKCAKgDz4UgGKaUvABCcTFPogH674?=
 =?us-ascii?Q?IOP3dtTalW3On5qTV9vZOtPKtgOTcHxfHjneMjKhK9sBM/5KEnMLDr+dUe7A?=
 =?us-ascii?Q?GjVXfxuyDPNj71UpnMxAkwQo/cz7fwaHZ8V4B2yIzMNhEd0kDnXnXDoe1Fbb?=
 =?us-ascii?Q?krW+omcY0fu7vTZ0yW2QfIB/3RgdpxmwQDcWo4TdUHV188KACeAFSnx29Toe?=
 =?us-ascii?Q?aJzZR0AeaFDNfxvHtYn+RVB1lhb4VX8FVMWnSMrAEJlk/75hAsSGxps0WIU2?=
 =?us-ascii?Q?tI9+IIeNmy4VX/x8kpKkKUEBa8TRY5cEteXQ+Rlz0h36IUkEfCeVp1+wMMyM?=
 =?us-ascii?Q?lYb4R+a11wmYdqbrCMoeY8HWXp1Z5QDpop6bLIZ7/OahXnHpmjmZbHoyV/QP?=
 =?us-ascii?Q?Ik1WjGMYpfHRFeq1mUanAbmdz1ON8KBm1Re7HV9jmlkOdWil1o4xRvXYVzu7?=
 =?us-ascii?Q?0/e01bSngFJvba1c+TOd4QccRE1wndFT/7RpAP8u9sRZOWCOeVwIFxmoAeGS?=
 =?us-ascii?Q?DmziHpuFwkPIv+xFPh4MZjtgQzgSdKwhCGQGCZdlr7hJRDiEjIx9/8Aya9BR?=
 =?us-ascii?Q?TQIgwVkNrCl9Ygze/vmt7KNZsgnvLgTDQdsN47Q2eMjmTo0MevVR330QbuCP?=
 =?us-ascii?Q?ILx5v11dO8+djSl3A/BpRxqwZCakOdY9+u2rg67QXHr8ytE1JMNzKPWjRmUb?=
 =?us-ascii?Q?WCedf3jkVQJSvM/PdypwZtVVPsuCKYSBRavHIPaXZ0tpvEq6IS61f2fQi8Oe?=
 =?us-ascii?Q?/v1P2e6xXCde2JBzUXDGF1Nn0JljM1lP0a8QN2WcMZdNfmw7ZKWJGvnkDCGn?=
 =?us-ascii?Q?OAITnFNDmGlKWrloRGfK8A9FlOaEI82+6F82URezg6xg8WeevD5Dj/z+t5DI?=
 =?us-ascii?Q?yQ2D3L2gBFKD3fnAS+SgbnW2LbjKDBO9Lf9bXHWiewsgp59N9p9w8vDKrkSh?=
 =?us-ascii?Q?T9tJ8RhZZtaOy3qdRhN9sBbKipqlYuYHQ8vEcSKjyIMT9LT0rqiE2K4DTNYL?=
 =?us-ascii?Q?p2lRr0a/8sKJ3ggEm8nnPlfL99TK0bsd5zSyEe6p+jnjOUiZBblJ6o9e0n7p?=
 =?us-ascii?Q?/FfOuj5q6JrdLeo/6EY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:08:19.8923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80c589f-eb20-48de-e13a-08de23db1597
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v12:
 - Remove outdated commit messages (Pekka)

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
index 82116e283e6a..3c1ec430f509 100644
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
index b4e5e4b9958f..0933e4ce0ff0 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -45,6 +45,10 @@ struct vkms_frame_info {
 	unsigned int rotation;
 };
 
+struct pixel_argb_s32 {
+	s32 a, r, g, b;
+};
+
 /**
  * struct pixel_argb_u16 - Internal representation of a pixel color.
  * @a: Alpha component value, stored in 16 bits, without padding, using
-- 
2.43.0

