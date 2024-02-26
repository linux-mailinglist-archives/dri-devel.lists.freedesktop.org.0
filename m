Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B18682AF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228F410F267;
	Mon, 26 Feb 2024 21:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dKVEZQY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D528F10F147;
 Mon, 26 Feb 2024 21:11:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrjSH+gA8OZvovAqvM/FMMzyVI2CW5R1AbxppvM2481qcyhTWLdh8ThCaEbUqQ3ZFD60VU7y2fiwinVePfcTVhL7tS8/jgP3bUtWmSNACq+6tuj7w4S9hgDtuD5Au/nQJGaLXL6Y1QTKrJYabS2pU31zgdek75xOloPTjUk+4C/03HS9YR/98/1Kg0GfAb5FvcW5EPOPud8A32QjUyQgls3Co5SP4qZ9CyQs4oT4Mz7XiUOe4zCQGhxKq0HBYY2gM08PNp8nYzqWzVFC2McLu+RySlGWDsf/KBUNhbgOHjZXsBwi+66hhdSadwcdcMxetjYEM1/9079jTtuioqsyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLWeMH4ecQNBNdMZjCTK1JzztNjIvvvO+ZEGXVWeFos=;
 b=RGBpddEB5080A2BjTnOqKvkP0ZXmhj1mS+sS7mmFw7ITcVw97gsyKSa8Yb1ZOgz/jPKPYKgKinWJ7KjkeMtNim5HMua5BBApoEHygMS83e40aZSciPLqmTG174+upGbSrVRMYdx0eZYwjpK5d+DFqr+/6wSrogFkHbz3k6BUu+Vrpc8e4pubZ156bScieckXffeLO/6Kg/tBbbjA8Fjw1OXDMSxS9RQGpPOb8XeaQKxvj20WtZanjYoQe6848Lk0A+f/b9fTwz6AxXaE8NWNWw6CZHDSQQbSZhZVstcpMJxqDBCSQz3v4fY2aB0dl+R3EbF/1FqKS+TSfwxfn7wUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLWeMH4ecQNBNdMZjCTK1JzztNjIvvvO+ZEGXVWeFos=;
 b=dKVEZQY7TSeJrQDFqILqgj+Hi5PhgBdmuW7YHZtyvBtpRxC3KhYz7Qg6zBNv9ZeVnPvPIOLKEWIBhR1hIgHf5FR9Jn4Ntig0ZGp4YgPvtpOccTTJKCqnNLPwTeMWlnG5+lZdVRyPx2Q8aL1IZjr9LI1KzYP/l0bX8r/np1aRoeU=
Received: from CH0PR04CA0062.namprd04.prod.outlook.com (2603:10b6:610:74::7)
 by CY5PR12MB6059.namprd12.prod.outlook.com (2603:10b6:930:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:11:22 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::92) by CH0PR04CA0062.outlook.office365.com
 (2603:10b6:610:74::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:18 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:17 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [RFC PATCH v4 20/42] drm/colorop: Add 3x4 CTM type
Date: Mon, 26 Feb 2024 16:10:34 -0500
Message-ID: <20240226211100.100108-21-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CY5PR12MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: f56a8fb8-743c-463a-a9e1-08dc370f7bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzcJmhdvhIUf8An1uKlylFjbL23yxiPYHPKp2duu0QAQQyFhCH1JKKPAsKdwi/9j2bh2zvjLeTczHMbmSK+YQ+b927znwc2iFmx7rIJ+KFQEFDxupqvKWjkIjzy3nZdNoUBIwtUEAWFxeCsEPKdDGOKYyX08w8BG7Nzp3cz8dWsowbWtYhHlV7CZ3jtmDjVPia1hi39aiGwWaOm1WBY0gVI+P4sYwREImAwQwyo1EhDdT2YdhH1k7bvHGoKeKPsZPWnRfzZQWrNea+rjaDwPUvFVFXd7T8g+V88013A3xKPFomcxAMCYBa/KSOBUq3XvDyK+Hdh0pFiS1VsNvFEoDJMcmOCEyCidRRvqkf/flMXzt0oHrwvjVFN4uoW5d4rvo/WQAPvAE9NxghNKd8ATusO/xMXZ3QYoCdUVE+i51en79XaGNfXHPBoSzx0TDAQcSGaF3Z5sukKMmCBF16xg0bjapPKMCHK6TJFhE1tSHWWYsovU+x0/g6+jWb3zAJtcx2aB7ni9f88zYFkCT4wiubrlb5d6eJEyvWLGgIP3Dzi5d1zAlRv9zrdiOLq19Ij/1Jsti7kG9yRsvw1QV7dmiDi96EmXpghjQ9b+yQ9BqwmOT165HcxpbFfI6+hgdTGIndSuF+Ez644Pj7+LXUkMoPai6iGmskSsPiaf3xMU7zF+hek7AHtIi3rGz6Gc1ASiAAvSJgWoMRbo7GQ423wj202l3eEK+euoaQCAAWEVPGDdBfXxV/JZ3Of9DnnpqudS
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:21.8199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f56a8fb8-743c-463a-a9e1-08dc370f7bb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6059
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

This type is used to support a 3x4 matrix in colorops. A 3x4
matrix uses the last column as a "bias" column. Some HW exposes
support for 3x4. The calculation looks like:

 out   matrix    in
 |R|   |0  1  2  3 |   | R |
 |G| = |4  5  6  7 | x | G |
 |B|   |8  9  10 11|   | B |
                       |1.0|

This is also the first colorop where we need a blob property to
program the property. For that we'll introduce a new DATA
property that can be used by all colorop TYPEs requiring a
blob. The way a DATA blob is read depends on the TYPE of
the colorop.

We only create the DATA property for property types that
need it.

v4:
 - Create helper function for creating 3x4 CTM colorop
 - Fix CTM indexes in comment (Pekka)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      | 14 ++++++++++-
 drivers/gpu/drm/drm_atomic_uapi.c | 29 ++++++++++++++++++++++
 drivers/gpu/drm/drm_colorop.c     | 40 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 19 +++++++++++++++
 include/uapi/drm/drm_mode.h       |  9 ++++++-
 5 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d82858dabf06..6e736ffa6d7c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -793,7 +793,19 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
 	drm_printf(p, "\tbypass=%u\n", state->bypass);
-	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_CURVE:
+		drm_printf(p, "\tcurve_1d_type=%s\n",
+			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+		break;
+	case DRM_COLOROP_CTM_3X4:
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
+	default:
+		break;
+	}
+
 	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
 }
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ff258b34544e..23b248987a7c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -691,6 +691,30 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	return 0;
 }
 
+static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state,
+		struct drm_property *property, uint64_t val)
+{
+	ssize_t elem_size = -1;
+	ssize_t size = -1;
+	bool replaced = false;
+
+	switch (colorop->type) {
+	case DRM_COLOROP_CTM_3X4:
+		size = sizeof(struct drm_color_ctm_3x4);
+		break;
+	default:
+		/* should never get here */
+		return -EINVAL;
+	}
+
+	return drm_property_replace_blob_from_id(colorop->dev,
+					&state->data,
+					val,
+					size,
+					elem_size,
+					&replaced);
+}
 
 static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
@@ -700,6 +724,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop,
+					state, property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -722,6 +749,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 71c2286333a1..77777baa1eba 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -34,6 +34,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -93,6 +94,7 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   colorop->bypass_property,
 				   1);
 
+	/* next */
 	prop = drm_property_create_object(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
 					  "NEXT", DRM_MODE_OBJECT_COLOROP);
 	if (!prop)
@@ -157,6 +159,43 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
 }
 EXPORT_SYMBOL(drm_colorop_curve_1d_init);
 
+static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_colorop *colorop)
+{
+	struct drm_property *prop;
+
+	/* data */
+	prop = drm_property_create(dev, DRM_MODE_PROP_ATOMIC | DRM_MODE_PROP_BLOB,
+					"DATA", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->data_property = prop;
+	drm_object_attach_property(&colorop->base,
+					colorop->data_property,
+					0);
+
+	return 0;
+}
+
+int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane)
+{
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
+	if (ret)
+		return ret;
+
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -258,6 +297,7 @@ EXPORT_SYMBOL(drm_colorop_reset);
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };
 
 /**
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index e85ed5aa68d0..4aee29e161d6 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -60,6 +60,14 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @data:
+	 *
+	 * Data blob for any TYPE that requires such a blob. The
+	 * interpretation of the blob is TYPE-specific.
+	 */
+	struct drm_property_blob *data;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -167,6 +175,17 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @data:
+	 *
+	 * blob property for any TYPE that requires a blob of data,
+	 * such as 1DLUT, CTM, 3DLUT, etc.
+	 *
+	 * The way this blob is interpreted depends on the TYPE of
+	 * this
+	 */
+	struct drm_property *data_property;
+
 	/**
 	 * @next_property
 	 *
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 0cbd6bef52bc..1a8ea7934fbe 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -851,6 +851,12 @@ struct drm_color_ctm_3x4 {
 	/*
 	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
 	 * (not two's complement!) format.
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 11|   | B |
+	 *                       |1.0|
 	 */
 	__u64 matrix[12];
 };
@@ -867,7 +873,8 @@ struct drm_color_lut {
 };
 
 enum drm_colorop_type {
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.44.0

