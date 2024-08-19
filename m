Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E991C95763C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BC410E42F;
	Mon, 19 Aug 2024 20:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HiS/GOq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2076.outbound.protection.outlook.com [40.107.96.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C30A10E421;
 Mon, 19 Aug 2024 20:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtEvFQkVkH0/E/qUKiOQGEfMagr5+3W4nXTE6IxOtlSIOGaz83ucexE14kmrqw+W58B5/5KBFeZ0dTOau9rrWKvtr1eENo5rX/ftiJNvUrTA870BhZjsmsr2a5Xwp7qzEm9ZnI+yS9IXYlkh6Ml9anCqQ50UBwdYxsSscCwrjpIau2qh204jlaPnJmCpCgrEx9CfzR4AOLSLXYUH29K6n+J4opKCBa7eun9kTwUtLhH8FmxuWk2RqCKYCPZ8CcQ4ONokG+9mzOAnywX9qF+zAZaYu2DiS9ApQxb9aAatWBQZcFAiuQ0GvM/uk3x/S+2rGK3dJ8P3dipbTEgyvshVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/XIistwLqd5OgbrdTPFKniQ2gVMgdMxZhZClS49Xlw=;
 b=rk8WIJWvmSeYBBxEv2Csbgl8ghtZ6gqOukUlDVY7pVr9vcVKJ9ymn4wFKBXP9BTVOzKW6b+9lTJb6L2P2UhwJBdgStlyE9jPS1lO0c2gigBQQIZ/Ui3fr6njPJvnhkMx3fCTAnKAkbseg1Z48X4GKONgmSoIxyZJnABq6pDKsqHw7fIAPxL2+1PjgD+xbeRQHc+JgrRKv8APE2zgmoJeyRdw1cfMOw3WWquPVMuTU2PGhAf1nS3Xfv6rV8I7FSUYzTO9D1ZDhpy+OckV53EDCWOoYjg1JVcfZXglbJMBQ49bqUCAEpk3vUZNtLS3U5iuPG0mpNwJgIl0YlkcbdbL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/XIistwLqd5OgbrdTPFKniQ2gVMgdMxZhZClS49Xlw=;
 b=HiS/GOq2Ckf8YRs4V6ioPellaFuD7lGZUQCGqtcRZnzKa2Fl5y67GPxeUkCkvGwHmTs6Mujv8i645MjKZ3acr4oYtE3zv4U9ZJj6elulVCHQ1Z/X+AKeh4gtaJbzi8ImXoAmHywM5Jr9BFLCva8p8joVUylqRwlS1pzmDhOSwwo=
Received: from MN2PR06CA0027.namprd06.prod.outlook.com (2603:10b6:208:23d::32)
 by DS7PR12MB6165.namprd12.prod.outlook.com (2603:10b6:8:9a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:43 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::50) by MN2PR06CA0027.outlook.office365.com
 (2603:10b6:208:23d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:42 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:42 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 37/44] drm/colorop: Add mutliplier type
Date: Mon, 19 Aug 2024 16:57:04 -0400
Message-ID: <20240819205714.316380-38-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|DS7PR12MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2fa0bc-9983-442d-0f25-08dcc091922d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g0APBTFej0ooEUTkPl3sGUkTxUCiydSvTmkA9n09csSfT2bkXaFRWCN9cxnr?=
 =?us-ascii?Q?lAVt6KlK4UzJYe69swclcdXJevHGXT7AR0LOMGFeXiWWrGk3AuiL4mV19f8c?=
 =?us-ascii?Q?XXx+JISuKIi+MIkF5wHF0lG9CuAdxzg/N5U8c5SK6w37aipUvEb/Y4p3Op1j?=
 =?us-ascii?Q?TRW7QJFHDbn77wayNHV6DeHUHVHvU8n21q/82pJM3YBaTdm7XPdriFCVvH3j?=
 =?us-ascii?Q?aCM3TmvJreJew+w19/Q6lPyPokGV2afS7s46AzbktFfbCJ+efUC5rSqTGIH7?=
 =?us-ascii?Q?b5H723bt08cLtVbqHFTAdqkwFAfqHvaCdrxXJAIPWB9dthqqLKSQUgR8Kcgi?=
 =?us-ascii?Q?/PiGcTOoxcdpPfD53xa6Tk+pOtxX1AL5ccnCsDaQ7i9/UlFwt3Y7b8yU134y?=
 =?us-ascii?Q?UQKs6g8k71MhNqUN16oUfcwcb7AHb7lNd2vetmmSQWzot8SwkGfr+3Au9Y1p?=
 =?us-ascii?Q?0L6okKpC/jtdbXgrnjoNpF51arad0RAViT1Y+boKflMqh/FSgy8eJEkOZYNr?=
 =?us-ascii?Q?Xq02XrkYJ6+Inj5YOt9E/DbO5A1M/qCC/ZTephya9f52KRuUAPwxDeJAiloF?=
 =?us-ascii?Q?uCrUjoiYRFlCLrJRsf/Pv+aENUHs4CMkGw0iT6/CKCraH0wsriOIXoQyyM+Q?=
 =?us-ascii?Q?VXuZY6Asjo7ng0AFP0JgYb4DeaqGYQAeVfcSlr0nExxHkJ74lFA+CQCaYvt0?=
 =?us-ascii?Q?sWMi4HbOxzjH7agaTr6HWyZs56gQuYR5sg2/Kg9mm3222vo1G5TW2oZQD5LG?=
 =?us-ascii?Q?NLerX3r3PbXRVP5Trlo0uRsepxERu/O2G3F0J6h/2apmgH1Lq0WCZ25mmBGH?=
 =?us-ascii?Q?5uk50OIdCLevX0UbVWNt/XT8DpW3oj0KdyTnjaZeSsQ3wVTDajJN+sh3BVeq?=
 =?us-ascii?Q?K6o44ICSG4+0pG4GMUYozEu8QdosBySvkm6EztHAz93ggqyaH4PEUco+2P8e?=
 =?us-ascii?Q?7orMhKa+b7TpOTpmpD9F9x6lig/zKHnrGRF9S8R8D90NmJSv5rS4Brm8KCJd?=
 =?us-ascii?Q?WoRZqX8ixTRroDrX91S2KY7v4WYvvqWRiWeN5qn/6yAio28JWPupQTAJCCHE?=
 =?us-ascii?Q?jDBJvzHSSv2uJAhu05b26FA8Ecg4jT3aXy5SB108NGos4F6jCAdHIqvgmoDB?=
 =?us-ascii?Q?rdX88QZqAzxyMFfPlt3SGDA3D+9bXfG3vXPhTKxDznlY4dFBliP0qcjWQQaN?=
 =?us-ascii?Q?Cjr0anQAL9S9kFwlKWbsf4FRkGGceBqr22cj5bbjKEUcVn6I1TDxIDhP542p?=
 =?us-ascii?Q?UkJTeZxN0irEfFZNiTGkoScd0kf2g+Zal4bSGKoPvBBbgBSyiOApj7Z0SZvE?=
 =?us-ascii?Q?4s5vAXFz7QuPep6XayaETUVepMH+B77vm0Vem0wr5o+OgFIEPL25a49IrTNq?=
 =?us-ascii?Q?bfyp/msJjuX9pFSXvWS/lOL7vCPkwHgxryAFRwL/XL2FrpW2310HZ5n8cB+O?=
 =?us-ascii?Q?Z0gDwz8UnSYI39B6HKSKn20yinsEbJv3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:43.4360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2fa0bc-9983-442d-0f25-08dcc091922d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6165
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

From: Alex Hung <alex.hung@amd.com>

This introduces a new drm_colorop_type: DRM_COLOROP_MULTIPLIER.

It's a simple multiplier to all pixel values. The value is
specified via a S31.32 fixed point provided via the
"MULTIPLIER" property.

v5:
 - Fix atomic state print
 - Add kernel doc

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 37 +++++++++++++++++++++++++++++--
 include/drm/drm_colorop.h         | 16 +++++++++++++
 include/uapi/drm/drm_mode.h       |  9 ++++++++
 5 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 10af940de8de..2ab797e9d946 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -803,6 +803,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_MULTIPLIER:
+		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 5bbce7360262..142824de33ca 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -727,6 +727,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop,
 					state, property, val);
@@ -752,6 +754,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->size_property) {
 		*val = state->size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e760d3301d48..9634effab73a 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,7 +64,8 @@
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
-	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -285,6 +286,37 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 }
 EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
 
+/**
+ * drm_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @return zero on success, -E value on failure
+ */
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
+	if (ret)
+		return ret;
+
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "MULTIPLIER", 0, U64_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->multiplier_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->multiplier_property, 0);
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_mult_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -372,7 +404,8 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
-	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 6e5da057ef44..09e96b9a8eff 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -125,6 +125,13 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @multiplier:
+	 *
+	 * Multiplier to 'gain' the plane. Format is S31.32 sign-magnitude.
+	 */
+	uint64_t multiplier;
+
 	/**
 	 * @size:
 	 *
@@ -238,6 +245,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @multiplier_property:
+	 *
+	 * Multiplier property for plane gain
+	 */
+	struct drm_property *multiplier_property;
+
 	/**
 	 * @size_property:
 	 *
@@ -295,6 +309,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 83bf461558b5..8e9886200f4d 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -905,6 +905,15 @@ enum drm_colorop_type {
 	 * &drm_color_ctm_3x4 struct provided via the DATA property.
 	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
-- 
2.46.0

