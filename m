Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE9ADC081
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F02C10E6CA;
	Tue, 17 Jun 2025 04:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5Ti54Q5y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECBE10E6CF;
 Tue, 17 Jun 2025 04:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbrrhDgO3pcRPPCvMp4kun8CP/laQOK3B3XHjWo5gry9lzvA03CioPjUcK0ipEUvuzULhh4xTX1Vn23qyAYQwyCm7K5SPCjgzLc0Jz6sZLpVOAPW4IeM1ZmCk0AoRWl0TbmojNUhocSawBWXeakWpe2qtOtx8xjbOJNBJvdEREcSctaJ8afZYDjWjBPomlTNkZRkTx4AGphlCNSg7v+K+3RGyc4bdOD+yKF13Prl+BIKanMI+umUmPPh/DWDlThhsLft1a4CEkKzm8w63Fl4E9SY5s2S6loTOsiB7BqJOaUe/x6VNfNW0h15MoL63IPWPoXpJamMV/nDhi9OLeSHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfDtpl2JfSkGKW/8vHEm+EdfDvLNNfAVpwXPu9aX+1M=;
 b=JHqsHjs+75slDUD+bfJrn4vqZScarlDNgcRLu30e41xuRwVbxHIKP8dK6kA/+7rkiC5xGnDZYNPb43gCN5drKUSRFFiDAUEoCQ7KIoraOAflXwV+wQ0F4NANRjefqZubbFYVJJBZEg8LTosKQIeMWR30psb+7I4+p+YXFOO5prJlQ0y3cxTbh8UcRzjPCxCt2B7WUCVz9ssp3F8R5IqUVhGIwmRJqxYWgyOIbhoEjA7cyU/2So4dmLLXwyNmJD7Mti7SADOR5lauy4N8r1OaDzBb9DJlzMCiNS80yymIl3UVM8JYEJ9vb2Di7Nz9T7BdfKjloo0UMq/5aNLd5vurHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfDtpl2JfSkGKW/8vHEm+EdfDvLNNfAVpwXPu9aX+1M=;
 b=5Ti54Q5y3/4Z469GB7NIsqpfSkw07QCw/miQYQGb9220YpneUw3IWl6W393uLBpEDvkb56i8V+tLI7ZGbH7ZrL8qIi04ype9jQeP4FELWSCwI5xRoJ5aS1q4X2DDHkXrVQjvvvzU8E0xWeG7RioDQnu6tztgKUMdG0bB7W3gNTM=
Received: from ROAP284CA0287.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f0::11) by
 DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.28; Tue, 17 Jun 2025 04:27:05 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10d6:10:f0:cafe::e) by ROAP284CA0287.outlook.office365.com
 (2603:10d6:10:f0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 04:27:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:27:03 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:26:58 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 37/46] drm/colorop: Add multiplier type
Date: Mon, 16 Jun 2025 22:17:19 -0600
Message-ID: <20250617041746.2884343-38-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|DS7PR12MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: 888cf099-fd3f-4c42-1de4-08ddad57363d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i54aWMfbH2eeHKZNq4H9xFTYg7hZLJM7xIlhnux8KSW6SGapP4Kglt3QGsEG?=
 =?us-ascii?Q?oi8SaS0ZCZKRAjZIOQzPKjAeP+YykmdxiskZO7+nqIpj4HqWW7mlSIZlmRtk?=
 =?us-ascii?Q?FBvH2abaAfd7GsybG3N5c0NxtRgdHU2O0O2iatqhQKWDiMRGX2TGv7ImOTPq?=
 =?us-ascii?Q?c3Kk518nYnpIr5pSHRRzVUEqaLc7JP3vQHRIHWqughx+s8aNfFhHIvag/uts?=
 =?us-ascii?Q?MsqtFyRH/LxOJsToQ8ZwLHkEmBTxu/MG/BhebJZQOVCsvWqWhrhQPatur2L4?=
 =?us-ascii?Q?LG0Q8Pgv9XTg7qVSUz/lzicF5aZ80qLQf9zxq0ls3I89arrJ7N490WRqGZd+?=
 =?us-ascii?Q?BJauzatMW0NN4FA7ZY3gcqbRqSxOd+6RjXHK/8tzbEWWkqyJq6CPqf8RxBvU?=
 =?us-ascii?Q?CHcLW+YzJ7CkbDoTVxPODrAvfcWGCG7jJ+P3zXbz12pOCWVpL2EkJA8ngCk2?=
 =?us-ascii?Q?FROsVtJKuEbPCn2TQ4MKdtYHjHrAt05vVoBZ0GAAb4hSCAP8nhVURkSOHhhz?=
 =?us-ascii?Q?x0ELjfGjTDZ1nqoWx71uy/p2dzPIj+4+5DOVizmy6S/NHTrfS1Biwgkg+Eib?=
 =?us-ascii?Q?EE5fhDVOQsYjn1pLeSG5kNZ2FQKqiJurr+JcFiasHoKR0EnyrZrLfxRAMuMD?=
 =?us-ascii?Q?8C5o7AVQFZkIk6EhqAgRRfT/TPj1AmVRnnqlFC1a46AdvjROiaD+K3oHcpzi?=
 =?us-ascii?Q?jwDSSToJD/M1yRCJp9Y5NeCNhK6YqkKQgGToiAtcF1Ak8aPcRb8r8mbTNEXN?=
 =?us-ascii?Q?20HWroEHJDFZo1PKLJGgwGobBS4ULjTqwazqGThIgzaA4p72Rm9IalXeZb3o?=
 =?us-ascii?Q?U8D3ObEeSOvgc9WKHjBlBFp5rPjpJG6WG0sFObXupyyLNHHT9KSUT/FfVPKy?=
 =?us-ascii?Q?RrXJ+7r5m4cN96iP+3lIRDd12MU6SZVhW6S6fVjrISbwkyKCzxJ6D1HeOD2e?=
 =?us-ascii?Q?8PnCYLPiqyOlI7s6hihbJjP9Luf2t8l4UVt8AStONoK188fbpncWb3hBwrzQ?=
 =?us-ascii?Q?PEqijo6JPVXqNIZQL/msOoH71Zt0c8sykWY0SkjrRDHyIhXxqBXK6EUFV9KU?=
 =?us-ascii?Q?4qtcguqixIc0L50ErNi11SGi0r7wsomw6ZCW034wmVboXNdR7ncH2sfyql32?=
 =?us-ascii?Q?7ojHlANTVdlXiVWsUuCFReN28L8ArelpF2v41buCGOKuNOSGxMbCyKpWOOqk?=
 =?us-ascii?Q?RzWEAurQE1WyJm6W96+EQkH4CLTFkEdHYNpUeDFbRwHwexdc3KsiD6zXef6d?=
 =?us-ascii?Q?+2L7g2V3U1RZBCVyjJvIoEggRhCJXzGZZvNWCUjIJK0hD6Asc00Hkm0wB7dn?=
 =?us-ascii?Q?JeQnCY3ugjQFeSl6F2mPkfq6NWP+aDwPHQONXpCmoUg3p9DsYN/FVwdcB6nX?=
 =?us-ascii?Q?UVDfyQXUbIP/P5GOjXvtpzqMz/KLVkLXrY+usj8JzdAV5W1OBBxI6Ih1MZdy?=
 =?us-ascii?Q?c7olCz9OngULyEMiRYub5yFq5Nm2kDTTNfLD7azWLtQtLXUP6sxrNZx3LRju?=
 =?us-ascii?Q?0GpYLYYvWZ+p046RaBC9tQo1Cfjp6BRiIGol?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:27:03.9674 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 888cf099-fd3f-4c42-1de4-08ddad57363d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959
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

This introduces a new drm_colorop_type: DRM_COLOROP_MULTIPLIER.

It's a simple multiplier to all pixel values. The value is
specified via a S31.32 fixed point provided via the
"MULTIPLIER" property.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
V10:
 - Fix typo of mutliplier to multiplier in subject (Melissa Wen)

V9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v7:
 - Modify size_property to lut_size_property

 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_colorop.c     | 33 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 16 +++++++++++++++
 include/uapi/drm/drm_mode.h       | 11 +++++++++++
 5 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1dda90554e46..907ca790689f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -800,6 +800,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
index 6839363fa05e..405f4234e641 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -739,6 +739,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -764,6 +766,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->lut_size_property) {
 		*val = colorop->lut_size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 6c87f5b9f7f9..a3cf62c5e263 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -66,6 +66,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
+	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -327,6 +328,37 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
 }
 EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
 
+/**
+ * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_MULTIPLIER);
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
+EXPORT_SYMBOL(drm_plane_colorop_mult_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -418,6 +450,7 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
 	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
+	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 52e965577bd8..888184aef7a0 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -146,6 +146,13 @@ struct drm_colorop_state {
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
 	 * @data:
 	 *
@@ -273,6 +280,13 @@ struct drm_colorop {
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
 	 * @lut_size_property:
 	 *
@@ -330,6 +344,8 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index e522723e28c5..4909809c7fbf 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -930,6 +930,17 @@ enum drm_colorop_type {
 	 * | B |   | 8  9  10 12 |   | B |
 	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * enum string "Multiplier"
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
+	DRM_COLOROP_MULTIPLIER,
 };
 
 /**
-- 
2.43.0

