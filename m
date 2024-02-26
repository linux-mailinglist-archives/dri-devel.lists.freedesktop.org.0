Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B48682B9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C20510F277;
	Mon, 26 Feb 2024 21:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DilXWR5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB6110F251;
 Mon, 26 Feb 2024 21:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTsntjykleRpeaFYp0cIIcUgm0Z/c2qEBiMA6CLRhHkvN3bWQHNlp2eMy+e/Hzl5XwZ79KgK/u3jdGtJ5lfIihd5jGm9MMCD7zVl0FJeIIJaRgb+mhoOKnXjUMLQTe+kk0X0AfyPnrw7ni0DmShjUaMtiIhO9NgpQPFP3Cdhf1VfRmfK9w+j0iJVY6KE7nos806cLRdltCGpNS9Enrh90DobJalUZk/NO5vwxRvrwlcvg57h9qM034RsRF32UbndZ+zJsuXnrH3OW6KmRrMWYC1c+jT89NAGQd56XGtD3fxOrK9zOeIw0SEaO4i+5a9GPKGJhXFjwP3FFyJz+8hHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l42nNSWpfdjLKUbwN9sPb1DvdXAC6NQ3JUVNukI6v9I=;
 b=XsDBGPZICc+w/wixa9bLwtKBPcjmXjFtk/bwMEPcDC7wN0b9B2RcY3N5iPysRUCF//19xKjiOlYi8BXOlmHdk6yGtSqZOgName8/k0ARJkZtokChWPL7fArYEXK9qe8t/z1BCbWx1Tc/doJ6l7qCutLtvt12oOhunGZ1DrM+vHDsJRLAywD5XnPuMAENJMjWNni2Poy31QWVjCdCnni3KCQjkNeMHlM4Z2qyCcv9CFoT/HspeGG5AE426+ZMzt0RgMGLTFEtiC3upLKdl28uREYAEbXhHb7aDuny9Br2FJAa/t+cNYwa8feafatdqzM0KYuyioT4I/8IucVjxZp/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l42nNSWpfdjLKUbwN9sPb1DvdXAC6NQ3JUVNukI6v9I=;
 b=DilXWR5ah/Kfzhu7AiZbWwTfVj93VatgKo/CV4ceW+KamzAb67tXWgK4hwtA2dyWz9hZqM12f099zd5RLtZzDKnGPzia3yUTrHoMPNCKrqN7of+gmsoAmXNLptnImM3DxCN1dLnbp7TXHOC25+isZWHHyMxzoNiJblqpnUhu4TM=
Received: from BLAPR03CA0062.namprd03.prod.outlook.com (2603:10b6:208:329::7)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:11:32 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:329:cafe::a0) by BLAPR03CA0062.outlook.office365.com
 (2603:10b6:208:329::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:32 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:11:31 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:31 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [RFC PATCH v4 41/42] drm/colorop: Add mutliplier type
Date: Mon, 26 Feb 2024 16:10:55 -0500
Message-ID: <20240226211100.100108-42-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3a81bd-50b5-437c-4ec3-08dc370f8214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLnAo0Q/vGmflIvXMCCMHtdxEMf0P1baDMrnMqrBUe6QxDv1ljNKYmd/WOSjlJ2kn8kcVrbJ0x/T7L0I1yiFlE6HF/JbQzkbhu/kimOt1n2VmnbE2X2xmRzIFY15ChRVgs5WDWrCawnpzMa6v5ILOmt5IrPqm5u1tGEX5PKOJ/4aZNytPYxnQq69J7SmqnifZpL1bCjnRXfe3KGOwD6ZNC6bKXxO/fWRyXmOrm2/ZbvEWOzZNkTPD5z0meza1QI96575dL3D2kmBbnH1441X/96kGCY/q1knNresWr3yFxJWSgjZzAP3s8jj3zDiAt7cCTYFClVq03aWdZ/as6GTCskSilLOQCKp1tn2tRTsOTbTZBSOcv9dQ+GGG19fiBg2kQuhgQpRYH48/mL5oiwu2MboyZi7FjoTFZKU2dCxTfzlH9UQ4P2cUAeEZbKXTp1Qs+SuKgEnQxOGfcrXmTGtdyXK/d1EUigZsh73SVZPoRc8l+tAvh2tk1Tb9HCvsNagsrYucV9UyhuKlGn7CSnCpuUApgn/mKy0JBlgzmjHgqLVRS579UL0WPBZjMi9v/Wb/Rv5O8zNpDHB15aMZ1pkm/zc4Ah0ndi9J8HNmVXZt89Ttv+8DtGiLVlHdH061HU8pVfrNI3a/qXoneSiZJGbCE8TU+GOnzZn2JS92ZJZk06ZQnZusyEi4TVM5xlA/icbaiXQTaWpGHfmLjnZjyqqJeeRWbOjocMvSZM0kFy9kgTIPkWr4GrokbFSWZK/wJzD
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:32.5705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3a81bd-50b5-437c-4ec3-08dc370f8214
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 29 +++++++++++++++++++++++++++--
 include/drm/drm_colorop.h         | 16 ++++++++++++++++
 include/uapi/drm/drm_mode.h       |  1 +
 5 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f7d51839ca03..af0b6338a55c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -806,6 +806,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_MULTIPLIER:
+		drm_printf(p, "\tmultiplier=%u\n", state->multiplier);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 6bfe857720cd..b4ecda563728 100644
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
index 4452eaeeb242..c6cdd743de51 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -35,7 +35,8 @@
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
-	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -231,6 +232,29 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 }
 EXPORT_SYMBOL(drm_colorop_ctm_3x4_init);
 
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
@@ -333,7 +357,8 @@ EXPORT_SYMBOL(drm_colorop_reset);
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
-	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
 
 /**
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 8adc7ece3bd1..f9f83644cc9f 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -64,6 +64,13 @@ struct drm_colorop_state {
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
@@ -186,6 +193,13 @@ struct drm_colorop {
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
@@ -246,6 +260,8 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
+int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 07fd66dc477c..754fd4c48123 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -876,6 +876,7 @@ enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
 	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
-- 
2.44.0

