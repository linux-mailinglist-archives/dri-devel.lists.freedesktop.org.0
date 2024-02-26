Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CB88682A4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B5710F251;
	Mon, 26 Feb 2024 21:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rUyKmgBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2068.outbound.protection.outlook.com [40.107.102.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119BC10F24B;
 Mon, 26 Feb 2024 21:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meETCT1ltJ6RbCebZApl1/2GyxgYUVLLrF9+137BW2FZC79CxCWfojJbgfrL5z6P/f9mpMgix1bogV+EirRBhwK5JDIUc0SJ/m/Ot/aqznVqo3zqZXYi91V1VdwKypkbUlvncjAiBPBrGAOVmAQWKrhySAb4+Pydl2BTDYTHbiimcCnSUmlLbS6E2xqOyFfeV3ZQZ4xcX6DHkrEp5U2pNFxr3JQR8WoOkt2XK5FQkM22d+CroIRlQ9aci4/yMXFwvbI08CWr8EOncqdA9NxcZrf/Fv3lExVrfPb/mXxsE/e90wKTsJ6awp3rJDzZ1oqzQ6akLXnkf5XvIUXgHaKU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTCPVJjSzKibeZ9KAz5hTTBj4VsNQxgxrA3346K6Q+U=;
 b=YC15lLfY/EyaujMaHqiN8GCqalEzMxC2tFwo5xEGfQsvtOm4RpeMtTDfVqzmDi/KO5iEzBy0mizoKevezgelyrZacucGG2Zcq8sewD2zwRgHLkKZ//RaegDQz67j63mTtKi/xgVS6f/rimcxr9dyk5/L9+pkAcdB6kqU/l5N6MqxHogt+Gr3VkPLU2DZOcvNvK1DaiTdlU3v/aD2pHh6kucHOmZkj7CRmk5fqnmTU4TmIoGEltIxuO1H9ZJ4sK7e46TRk2vcUnWPsaR8EPDTV7V6vGrsNBufWKssRqWIXwqfVIudpFuGoivCSMvifs9xc4i56B4WajQYYT2uQ7QTPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTCPVJjSzKibeZ9KAz5hTTBj4VsNQxgxrA3346K6Q+U=;
 b=rUyKmgBmELzPgdZ0anzeklpLOVN0oPYGDWZOgTnAxIW+OUCRqEybDEzGuqp2zOHqMiW/f3wnhSjm4E8IuAwdcd87m919A87ycGT1VnSi+36wk87P/xRNesfa/kL6tZhrwFnCyw0wJFPoag6cRP+e+xu0/RQu6wE8leS5vqo4nmE=
Received: from CH0PR04CA0076.namprd04.prod.outlook.com (2603:10b6:610:74::21)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:11:34 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::39) by CH0PR04CA0076.outlook.office365.com
 (2603:10b6:610:74::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:33 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:30 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:29 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:29 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v4 38/42] drm/colorop: Add 1D Curve Custom LUT type
Date: Mon, 26 Feb 2024 16:10:52 -0500
Message-ID: <20240226211100.100108-39-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6fbf64-3eb3-46ad-7c50-08dc370f82bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /lEKIjm8rUsUeSn3ihNhijxSPYk746P3NbhEllO3VsIcgJsrcI6qaDTXuQe8awLQkUct7iVavdizGro0hniR36yE8a6BmNPpHmoavic+prPI09RV2tJ/+2LCGR7I/gder2SJywAWvvRgCvJ/KBIiG+DICN35FulMz+nbIGxYOdKerLD7xAe5GWNvxGPeX85Yf+UjFpPn+Ds0FVeEZGiygY1NvCk+NovKvkDWXHB8jasfFzB1A1435kaHB3rHJT5/1DeUgTkq0uziMp99XM9zAItl9qbfIuJ8QL9uxRK7qwCoYu7WjsWsrit8JN3GlkmGXz9r7Et3767rmKGZ9FvN0T+AqGat+uGiO1eYCYFjMlQ3NPEKq11rfSj7w+u6TMvyKes9+69zbM//eDm7dLc3hDdRgVsRU3zT7ujn7ntnGKsvf/sOwjNTZRIOmj0wf/w/lbjKr6RE41n/6qs9kb4OQ8XVPGf/wCfOA1cVktCXp7LRdYKs/Y0uwomGIm00Etr6pd7BVOkoCFLgcHW8wQXMuk9jgFI/ebrqN6L4mzxmjEhiZcabvEY2saZtlqgkmK5e5TOt8sqPY7vOhlxBdnhxBQiHnOtYIjs4WsYvTAn9LhSiwDVNZ0qS4gAK2/pS8ce9TNTguRQJ6Zb1jC1fN/LxQlIoQS6ds9WUPBmHW5JLhY6Pb/CUEpuFfMP8w9TF643gRDGo4iQXz0i5yTd2RZAHchAZsbRjmt2wsFcm3u3My0cJuOoLQheSRgg7/IZ3mBRg
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:33.6479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6fbf64-3eb3-46ad-7c50-08dc370f82bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238
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

We've previously introduced DRM_COLOROP_1D_CURVE for
pre-defined 1D curves. But we also have HW that supports
custom curves and userspace needs the ability to pass
custom curves, aka LUTs.

This patch introduces a new colorop type, called
DRM_COLOROP_1D_LUT that provides a SIZE property which
is used by a driver to advertise the supported SIZE
of the LUT, as well as a DATA property which userspace
uses to set the LUT.

DATA and size function in the same way as current drm_crtc
GAMMA and DEGAMMA LUTs.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 ++++
 drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
 drivers/gpu/drm/drm_colorop.c     | 36 +++++++++++++++++++++++++++++--
 include/drm/drm_colorop.h         | 16 ++++++++++++++
 include/uapi/drm/drm_mode.h       |  1 +
 5 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 6e736ffa6d7c..f7d51839ca03 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -799,6 +799,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tcurve_1d_type=%s\n",
 			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
 		break;
+	case DRM_COLOROP_1D_LUT:
+		drm_printf(p, "\tsize=%d\n", state->size);
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index c7c1c614b0d9..6bfe857720cd 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -700,6 +700,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	bool replaced = false;
 
 	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = state->size * sizeof(struct drm_color_lut);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
@@ -749,6 +752,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->size_property) {
+		*val = state->size;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index b10cad5a7208..4452eaeeb242 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -34,6 +34,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
 };
 
@@ -175,11 +176,41 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
 
 	colorop->data_property = prop;
 	drm_object_attach_property(&colorop->base,
-					colorop->data_property,
-					0);
+				   colorop->data_property,
+				   0);
 
 	return 0;
 }
+int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, uint32_t lut_size)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	if (ret)
+		return ret;
+
+	/* initialize 1D LUT only attribute */
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_ATOMIC, "SIZE", lut_size, lut_size);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->size_property, 0);
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+	colorop->state->size = lut_size;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
 
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane)
@@ -301,6 +332,7 @@ EXPORT_SYMBOL(drm_colorop_reset);
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 28b3136dabad..8adc7ece3bd1 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -64,6 +64,13 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @size:
+	 *
+	 * Number of entries of the custom LUT. This should be read-only.
+	 */
+	uint32_t size;
+
 	/**
 	 * @data:
 	 *
@@ -179,6 +186,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @size_property:
+	 *
+	 * Size property for custom LUT from userspace.
+	 */
+	struct drm_property *size_property;
+
 	/**
 	 * @data:
 	 *
@@ -228,6 +242,8 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 1a8ea7934fbe..07fd66dc477c 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -874,6 +874,7 @@ struct drm_color_lut {
 
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
 };
 
-- 
2.44.0

