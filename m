Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F3957639
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F7E10E3EC;
	Mon, 19 Aug 2024 20:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BGxFYdMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBE010E3EC;
 Mon, 19 Aug 2024 20:57:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYB2p2SV93/1i3KhrHTKDSeq9E9qAu9QF89Wu0ths1kNpUmuO7pGnmUHqb5B/afNwVR5puanEmWmiM0fhUUfJ5lUkHgLUj7M6bOLCcc8v8yaqO3gF7IjB67ErIIob8LkNZkxAZNyEKi1ykWU5rsxvJmIAJRfABBH3PlvuJEGg7o7DgKrvk6EHQTzSuFAxIoaaQeOV0/sMDu39ivljkMgLA4VH52wLAWMvMhp0bqKDesAvUndFsn4z7rzuLOPbW/z5K9CF7TGgcrzmnYxKDglo0uk+SZ9Kgaa7IhDmqMXSE81ehsgvkYmZpm+Q4/4NGd32m88tew2MyyJHHJ8W+5CHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovUF0YGiQTSYufzNRUK/UIaunJg3GfXt6vqBdphX7/U=;
 b=A4FfWa+cQ2cW5sAvnuLUk+qSRIi9OQtxCpzAgZNGGQxoNEvzfBrq+RQgL5pCpMxrzViCx08VptxgUZvq6HEnobqrJASuEa/sogFyGpn0OqIrmsBL8tyHc34Lj/37v0dtYcszBWTxor7Xt0EdfO9yrbc8qXWFyDwiLDKc6TCUn3iH4JvaaKXxqA0k2hQ2ML9BTp10F+nH+EZl8R6zddrjXgUIWuLwOdIXtLqRuulOnj+S4bQKFXij0T6Sretda2l9i8G4oQZY7kDmFyYRy0VvXZsbAe9YJZCtO54em/XRZNurFArT1km9iPUvmT/UnES/EZgSoVr44B+eFXBh4VpEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovUF0YGiQTSYufzNRUK/UIaunJg3GfXt6vqBdphX7/U=;
 b=BGxFYdMA9nNGNxSAr2W/5W1ael4BP1tqP171EJ9XIOqaECuVWHOXXtH26Fu1z/NWmjO1rH/SFErCeMPA1Xcn8JRN6t44ivlvwJ6mAPx+c1ijiWhUW+o/Ds1UXaNMoDKwNBe62v9RnCvQ2t58q+vJOR5TSCDoc98SOWOG9vwBrXo=
Received: from BN9PR03CA0283.namprd03.prod.outlook.com (2603:10b6:408:f5::18)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:48 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::2) by BN9PR03CA0283.outlook.office365.com
 (2603:10b6:408:f5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:45 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:45 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 42/44] drm/colorop: Add 3D LUT supports to color pipeline
Date: Mon, 19 Aug 2024 16:57:09 -0400
Message-ID: <20240819205714.316380-43-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 400cde9a-32bc-4129-ae92-08dcc09194eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vvlkdap8biY1Jcbd5RWsFGyEvrPTPbzvWpII0RytPf5rvXNt2NAdF7llzjje?=
 =?us-ascii?Q?pb2m1IT6mW87zHwfcRWBh/kTEmThUJA/aK8bCOpnReIEio/A9FJzNFWVbvHN?=
 =?us-ascii?Q?DCTWLxqM82ZgINRXQQFaW8FcDfg6BTj2M3Rab+8L5QEXs7V1IOXryYyxxrxu?=
 =?us-ascii?Q?j2a0CHVGiwPzfVzs8Ex9yQNqN4ptc09PkheIMMyBX+hdcWDFimj91m1yOo1R?=
 =?us-ascii?Q?I+5PjkMDIOhTGowksSEcNKgwj2S4JzovNXGz+Qp9QXV0K3VFrQSMqZS4KVvn?=
 =?us-ascii?Q?sGs+tOaEDgLcY+HHQyvoZXMQjHn+OZ9gIrbUIXDeJHEOHhTknHLWE4Kaj7nF?=
 =?us-ascii?Q?A4xxY81Pp1+t3PsJHz313fwNTVsByPyM2HmTNFmR4rWpPMGHDT74kkHliGlg?=
 =?us-ascii?Q?xrgNSQMtitCZakwZPJGxFhcRrTkwAsB4NX9MqLlBSQuSrXI13/nMaPI9cS91?=
 =?us-ascii?Q?1yZZk9R8NiIxq6GFnisI0Op4QyGVRDxt47+syHR2CSXd8IiNhHq7TDzXLsFH?=
 =?us-ascii?Q?HMp1/hjjvwNwsnVedKlWLRkzTJUKrLjZ3r8Jhtka5VvCcI0XW43bXJLXGavF?=
 =?us-ascii?Q?p0QksOSzBQ6dWZXFFdjopMQYK4I6UwOAaNh/1tIAkruNlv1QfeMezI1i9Tvx?=
 =?us-ascii?Q?m7T41Um3T+5wttNsx/ZlMjTbXcUd6LyehIiTrk2TNhst0gZia68oTR/qV2ne?=
 =?us-ascii?Q?g13Q03QXXn2GHI2dsd1rwn6vuafG9iyBswG4pYoe4x+yh8LTK7SLoE3pCkLX?=
 =?us-ascii?Q?D10eGgW3XHxSx9ksKMtj7+i3qIlqC9eKJO5fDKLNJ0JCkj4mkunx1oaBEVo6?=
 =?us-ascii?Q?YfmrHwfPwMMjFxeNSGIZ0FQ5H9O0CKF3ru/uv2+hPWUD8pTMyvDc8ubIdtzf?=
 =?us-ascii?Q?clTO5pke+eerZRq5dqUT1UGtGRURKOx6qFrSsehAmHC4C31YrGLeQeCh/YJu?=
 =?us-ascii?Q?DWesdyVyiT07MLAavixLXZ4/fNL014dZ2obqHtFWkB6+YBAQ1wjFSFjIM0Jy?=
 =?us-ascii?Q?mMPpAHYe17ZOQT55VAHDwWMv8DsENCpW6htB8WBH8kJ0SKiERcKzdlx7rO7j?=
 =?us-ascii?Q?yN7XopDFmwFJqdCZ8cmCtWdGF+j41usQpaHrzbgLQjWrUe3NVGKN0LGNb0tt?=
 =?us-ascii?Q?0X5rWmnKKTosLTMnAErogwbirO5OVWxj7ndo8c+64pplIDAJMZgHzW08HtDr?=
 =?us-ascii?Q?WyUPx1ihwI9aVSJgTaebGUGi3RXa6GoEK3NU0CaFoz59pPqJlAPg78xnytk9?=
 =?us-ascii?Q?yowKOWtevlIZCDD/H9nx/uoknu1hPX6lkmZuDBdJZm8i0EvhyXWHOwVKwFWb?=
 =?us-ascii?Q?woAy9UhMII0dqAc1UKRvANKJ/qCmxBwoeNaRR0IfWvX8C5fHsAdEk7KkR7jW?=
 =?us-ascii?Q?mvvF/HY1JM/MM2Qq07m48qn5f0C0hzDnhKeG6YiZN5IfeLHzywMzaIVhjHQU?=
 =?us-ascii?Q?O6M/9ZlEo8dTHkRFGMvL3IKGyqPgyW/+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:48.0407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 400cde9a-32bc-4129-ae92-08dcc09194eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
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

It is to be used to enable HDR by allowing userpace to create and pass
3D LUTs to kernel and hardware.

1. new drm_colorop_type: DRM_COLOROP_3D_LUT.
2. 3D LUT modes define hardware capabilities to userspace applications.
3. mode index points to current 3D LUT mode in lut_3d_modes.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      | 21 ++++++++
 drivers/gpu/drm/drm_atomic_uapi.c | 17 +++++++
 drivers/gpu/drm/drm_colorop.c     | 69 +++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 42 ++++++++++++++++
 include/uapi/drm/drm_mode.h       | 84 +++++++++++++++++++++++++++++++
 5 files changed, 233 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 02ff576aa7a9..1d080c367f4b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -786,6 +786,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		const struct drm_colorop_state *state)
 {
 	struct drm_colorop *colorop = state->colorop;
+	struct drm_property_blob *modes = state->lut_3d_modes;
+	struct drm_mode_3dlut_mode *mode_3dlut;
+	int i;
 
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
@@ -808,6 +811,24 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_MULTIPLIER:
 		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		mode_3dlut = (struct drm_mode_3dlut_mode *) modes->data;
+
+		drm_printf(p, "\tlut_3d_modes blob id=%d\n", modes ? modes->base.id : 0);
+		for (i = 0; i < modes->length / sizeof(struct drm_mode_3dlut_mode); i++) {
+			drm_printf(p, "\t  lut_size=%d\n", mode_3dlut[i].lut_size);
+			drm_printf(p, "\t  lut_strides=%d %d %d\n", mode_3dlut[i].lut_stride[0],
+								    mode_3dlut[i].lut_stride[1],
+								    mode_3dlut[i].lut_stride[2]);
+			drm_printf(p, "\t  interpolation=%s\n",
+				   drm_get_colorop_lut3d_interpolation_name(mode_3dlut[i].interpolation));
+			drm_printf(p, "\t  color_depth=%d\n", mode_3dlut[i].color_depth);
+			drm_printf(p, "\t  color_format=%X\n", mode_3dlut[i].color_format);
+			drm_printf(p, "\t  traversal_order=%X\n", mode_3dlut[i].traversal_order);
+		}
+		drm_printf(p, "\tlut_3d_mode_index=%d\n", state->lut_3d_mode_index);
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 142824de33ca..50212eeba272 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -695,9 +695,11 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state,
 		struct drm_property *property, uint64_t val)
 {
+	struct drm_mode_3dlut_mode *modes;
 	ssize_t elem_size = -1;
 	ssize_t size = -1;
 	bool replaced = false;
+	uint32_t index;
 
 	switch (colorop->type) {
 	case DRM_COLOROP_1D_LUT:
@@ -706,6 +708,15 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
+	case DRM_COLOROP_3D_LUT:
+		index = state->lut_3d_mode_index;
+		if (index >= (state->lut_3d_modes->length / sizeof(struct drm_mode_3dlut_mode)))
+			return -EINVAL;
+
+		modes = (struct drm_mode_3dlut_mode *) state->lut_3d_modes->data;
+		size = modes[index].lut_stride[0] * modes[index].lut_stride[1] * modes[index].lut_stride[2] *
+		       sizeof(struct drm_color_lut);
+		break;
 	default:
 		/* should never get here */
 		return -EINVAL;
@@ -729,6 +740,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->curve_1d_type = val;
 	} else if (property == colorop->multiplier_property) {
 		state->multiplier = val;
+	} else if (property == colorop->lut_3d_mode_index_property) {
+		state->lut_3d_mode_index = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop,
 					state, property, val);
@@ -756,6 +769,10 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->curve_1d_type;
 	} else if (property == colorop->multiplier_property) {
 		*val = state->multiplier;
+	} else if (property == colorop->lut_3d_modes_property) {
+		*val = (state->lut_3d_modes) ? state->lut_3d_modes->base.id : 0;
+	} else if (property == colorop->lut_3d_mode_index_property) {
+		*val = state->lut_3d_mode_index;
 	} else if (property == colorop->size_property) {
 		*val = state->size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 2b7526c9608e..86f7f084a73f 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -66,6 +66,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
+	{ DRM_COLOROP_3D_LUT, "3D LUT"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -348,6 +349,53 @@ int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 }
 EXPORT_SYMBOL(drm_colorop_mult_init);
 
+int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+			   struct drm_plane *plane, struct drm_mode_3dlut_mode *mode_3dlut,
+			   size_t num, bool allow_bypass)
+{
+	struct drm_property_blob *blob;
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_3D_LUT, allow_bypass);
+	if (ret)
+		return ret;
+
+	/* lut_3d_modes */
+	prop = drm_property_create(dev, DRM_MODE_PROP_BLOB | DRM_MODE_PROP_IMMUTABLE, "3DLUT_MODES", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_3d_modes_property = prop;
+
+
+	blob = drm_property_create_blob(colorop->dev, num * sizeof(struct drm_mode_3dlut_mode),
+					mode_3dlut);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	drm_object_attach_property(&colorop->base, colorop->lut_3d_modes_property, blob ? blob->base.id : 0);
+	drm_colorop_reset(colorop);
+
+	drm_property_replace_blob(&colorop->state->lut_3d_modes, blob);
+
+	/* lut_3d_modes index */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "3DLUT_MODE_INDEX", 0, num - 1);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->lut_3d_mode_index_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->lut_3d_mode_index_property, 0);
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_3dlut_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -437,7 +485,13 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
+	[DRM_COLOROP_3D_LUT] = "3D LUT",
 };
+
+static const char * const colorop_lu3d_interpolation_name[] = {
+	[DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL] = "Tetrahedral",
+};
+
 static const char * const colorop_lut1d_interpolation_name[] = {
 	[DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR] = "Linear",
 };
@@ -473,6 +527,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
 	return colorop_lut1d_interpolation_name[type];
 }
 
+/**
+ * drm_get_colorop_lut3d_interpolation_name - return a string for interpolation type
+ * @type: interpolation type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_lu3d_interpolation_name)))
+		return "unknown";
+
+	return colorop_lu3d_interpolation_name[type];
+}
+
 /**
  * drm_colorop_set_next_property - sets the next pointer
  * @colorop: drm colorop
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 044294b498e4..285ab8cc12f0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -139,6 +139,29 @@ struct drm_colorop_state {
 	 */
 	uint32_t size;
 
+	/**
+	 * @lut_3d_modes:
+	 *
+	 * Mode blob for displaying a list of supported 3dlut modes.
+	 *
+	 * To setup a 3D LUT, lut_3d_modes, lut_3d_modes and data are expected
+	 * to be used in the following sequence:
+	 *
+	 *  1. device driver sets a list of supported drm_mode_3dlut_mode in "lut_3d_modes".
+	 *  2. userspace reads "lut_3d_modes" to determines an appropriate mode.
+	 *  3. userspace sets "lut_3d_mode_index" pointing the selected mode.
+	 *  4. userspace passes a 3D LUT via "data"
+	 *  5. usersapce commits to device driver
+	 */
+	struct drm_property_blob *lut_3d_modes;
+
+	/**
+	 * @lut_3d_mode_index:
+	 *
+	 * A zero-based index pointing to current lut_3d_mode.
+	 */
+	uint16_t lut_3d_mode_index;
+
 	/**
 	 * @data:
 	 *
@@ -274,6 +297,21 @@ struct drm_colorop {
 	 */
 	struct drm_property *size_property;
 
+	/**
+	 * @lut_3d_modes_property:
+	 *
+	 * 3DLUT mode property used to convert the framebuffer's colors
+	 * to non-linear gamma.
+	 */
+	struct drm_property *lut_3d_modes_property;
+
+	/**
+	 * @lut_3d_mode_index_property:
+	 *
+	 * 3DLUT mode index property for choosing 3D LUT mode.
+	 */
+	struct drm_property *lut_3d_mode_index_property;
+
 	/**
 	 * @data_property:
 	 *
@@ -329,6 +367,9 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, bool allow_bypass);
+int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+			   struct drm_plane *plane, struct drm_mode_3dlut_mode *mode_3dlut,
+			   size_t num, bool allow_bypass);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
@@ -379,6 +420,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index b64f9515bd0a..ab807045003f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -914,6 +914,90 @@ enum drm_colorop_type {
 	 * property.
 	 */
 	DRM_COLOROP_MULTIPLIER,
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * A 3D LUT of &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
+	DRM_COLOROP_3D_LUT,
+};
+
+/**
+ * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
+ *
+ */
+enum drm_colorop_lut3d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL:
+	 *
+	 * Tetrahedral 3DLUT interpolation
+	 */
+	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+};
+
+/**
+ * enum drm_colorop_lut3d_traversal_order - traversal order of the 3D LUT
+ *
+ * This enum describes the order of traversal of 3DLUT elements.
+ */
+enum drm_colorop_lut3d_traversal_order {
+	/**
+	 * @DRM_COLOROP_LUT3D_TRAVERSAL_RGB:
+	 *
+	 * the LUT elements are traversed like so:
+	 *   for R in range 0..n
+	 *     for G in range 0..n
+	 *       for B in range 0..n
+	 *         color = lut3d[R][G][B]
+	 */
+	DRM_COLOROP_LUT3D_TRAVERSAL_RGB,
+	/**
+	 * @DRM_COLOROP_LUT3D_TRAVERSAL_BGR:
+	 *
+	 * the LUT elements are traversed like so:
+	 *   for R in range 0..n
+	 *     for G in range 0..n
+	 *       for B in range 0..n
+	 *         color = lut3d[B][G][R]
+	 */
+	DRM_COLOROP_LUT3D_TRAVERSAL_BGR,
+};
+
+/**
+ * struct drm_mode_3dlut_mode - 3D LUT mode
+ *
+ * The mode describes the supported and selected format of a 3DLUT.
+ */
+struct drm_mode_3dlut_mode {
+	/**
+	 * @lut_size: 3D LUT size - can be 9, 17 or 33
+	 */
+	__u16 lut_size;
+	/**
+	 * @lut_stride: dimensions of 3D LUT. Must be larger than lut_size
+	 */
+	__u16 lut_stride[3];
+	/**
+	 * @interpolation: interpolation algorithm for 3D LUT. See drm_colorop_lut3d_interpolation_type
+	 */
+	__u16 interpolation;
+	/**
+	 * @color_depth: color depth - can be 8, 10 or 12
+	 */
+	__u16 color_depth;
+	/**
+	 * @color_format: color format specified by fourcc values
+	 * ex. DRM_FORMAT_XRGB16161616 - color in order of RGB, each is 16bit.
+	 */
+	__u32 color_format;
+	/**
+	 * @traversal_order:
+	 *
+	 * Traversal order when parsing/writing the 3D LUT. See enum drm_colorop_lut3d_traversal_order
+	 */
+	 __u16 traversal_order;
 };
 
 /**
-- 
2.46.0

