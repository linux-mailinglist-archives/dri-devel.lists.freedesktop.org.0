Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA593C1E4B5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51110EA36;
	Thu, 30 Oct 2025 03:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oprjPjCr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A0810E9E7;
 Thu, 30 Oct 2025 03:54:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcpnW1kcte5GgvMg41bggORFp6gyF7liccxBKmryyZH7U+EV8A57cH3kfANt6mlZDrBdp0x7N0+ZMROz/EKFNnmL32EZ6hYMF3flZLKJWuC5i8fpIucIXbL+jquxpBJDAbi967FmkCG+wJsvJIPnWSDl71LpUEHyUQpko5I/q3fUYHefJgYGd+SrBNq+r6ezGKjsPlT6wBWvbow2FBDwydlE5dB/vG/WvKgIaVYCj9fq0CA+F00To46OCeK6OvRLv56JBtR9obkZ/xLyEiQXTp37cpUwq2RngZ6Z97yVPDxcfGtHDWd97sn4sPDleozoaaL41i6wL5gdQgu8gh3PhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=at981gOxvRLSLI9ECXHHDK6yRNLEM6+ODuuDlU3NthM=;
 b=RhPLqWtdCOcRx6Ej2HZmzFUzikNQL17fqUWRBHYz9SbDEYv070+aBVLKS/oi1QmVspMIdflYzhfZ91guwE3o+tlwvI54is5eFOXuz2VUMEAKHXV2O6EruBYJ9KZ+K+87m7gBlonNbK2Oi8/g9FSjC1D31s1FMhJc4ipyCKKq4IbbCq04pXQyNKZgmsQV6DignRU7BRK8LxtdiLjrGlkOnXIYK2w+FJWLNmw9O4tNI7xLpzGxKtJMxT3BBYKXYizSLUX2MFrndqji3Tz5HeXVbqe7IGW8iiAorW2ApJjUMuGH9t/lprct+7viYF6ikwU1CSMH6w7uxtJBbp94HmII1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=at981gOxvRLSLI9ECXHHDK6yRNLEM6+ODuuDlU3NthM=;
 b=oprjPjCrU9fuQsQoBqBQbNRnLWzRGa3xB1GrjwBiH5E+6rwXGIgbfryjzWidAgq9fyWwelq/MVmSVpBbg90PD7DOPMfwbhA+u3tFBR4JnweVLRgiZByJ+um80bs81RWq8AvH2tsfGdwJ+qASXkWahpw+pRFPWoCZonqyEdfu+z0=
Received: from BL1PR13CA0183.namprd13.prod.outlook.com (2603:10b6:208:2be::8)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 03:54:14 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::c2) by BL1PR13CA0183.outlook.office365.com
 (2603:10b6:208:2be::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 03:54:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:54:13 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:54:10 -0700
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
Subject: [PATCH V12 38/49] drm/colorop: Add multiplier type
Date: Wed, 29 Oct 2025 21:42:43 -0600
Message-ID: <20251030034349.2309829-39-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030034349.2309829-1-alex.hung@amd.com>
References: <20251030034349.2309829-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 38788315-01de-4a49-ad4a-08de1767fdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tWgpwMQ7AsUO19QxGPjqRPjjvGwZGW0+xFIHCQrux4fMv9bByz2g2di3FSe/?=
 =?us-ascii?Q?H7P8g1jKxpWfT4p1BAovFjXyD7+ioknIXg5wh8EgqDbU3I4ZfnLVwmLO6F+B?=
 =?us-ascii?Q?uy2G1McBxPF6r4gGE/frz2MB4kRTeHlunNJnyVCfFmMub3t7p4dLHHGFp9oW?=
 =?us-ascii?Q?2WGuKU7RelHyFR7zkf6xvCfW+b6oOjHstG08DDDECPNxxmvf5JHfy3iV8w7u?=
 =?us-ascii?Q?ReeK4iTqNlEO5avqD8SCvMUuj7l5Lj4XvO45kWb7y0IvT/ncElYrASv2H4TL?=
 =?us-ascii?Q?SqU7PSkPlU/OpGfByzQzWl3IisgSWNIGZTl3ZJaHgRuG98vBUwUfbSy8hZac?=
 =?us-ascii?Q?GojfPOavoPcEekHZ9j7E2OI4NYeKyba+qY1crHmjNoYJP+kLnmY/uJ64ZB0S?=
 =?us-ascii?Q?K3Ehff4QvCW5Vi8cSk+aRIO5ha0/9a7nXZF7MhYFnoyWK/HZf5p9/g9vKDHH?=
 =?us-ascii?Q?8iApIxQY9PSC6r6EewmORk+yJILpjQEvxyGbaEqEihSqJlGZR++DVZKzhz/s?=
 =?us-ascii?Q?gWnMsdfRsGRQ1XZRPEw9+0ZyFglj7UfYNA487HAe4Ryc331Yw0mxqJnZjpRl?=
 =?us-ascii?Q?oksio+zypwWRpCH/HJukR2HGEL5jaE+e6HqU8DUX11nSVeAJHKeMJ2X5wZKM?=
 =?us-ascii?Q?iJfbfGIb21GrF6F9w3ixDG/I2/MPVNBK1bod2nKb7UglfQ88aplBG7YIbcYQ?=
 =?us-ascii?Q?U43hxF7OiBBwFgq4C8OPqhr4XPU+xMSGMTzX0FQ0TFOnbNoK4tdKV8QVtaK+?=
 =?us-ascii?Q?7ye0js3OdVYEg23BVKKlbisAJfeuSWSIVYHbJJxkISSTzPJexh2YBMjikBZh?=
 =?us-ascii?Q?5FvT1ul90oVelEI7DZLmD1Y5r1LhenHVLkPglUDFX786SEmKJg2j4rytiM07?=
 =?us-ascii?Q?ZCFRWWc3ZJnCwSXwhTXXXKBSEzmHdKqV7ZbB1WmaPgDor9/NnxZ1baynwQQ5?=
 =?us-ascii?Q?ArKQgFP9TGPo7IVSPmSWf1mbUw0Q8yZ4nqytpwfw1c44GZWKfa/NLw56EwzW?=
 =?us-ascii?Q?luKVBjREgeKewN9JZu6KQ9M//lPSCscYfdAdFGdT168wsiuphCGOZkHEobV/?=
 =?us-ascii?Q?2amuzF3xNGxip4HeGTNcEHZ9iOlHdZ+8bV5XLuhsGL2G1p3E1OKjT/v232tE?=
 =?us-ascii?Q?i7I1Pjnl3+t56CoGflkazK2tEH0dm352RsilqPi+y5oamPMh3yLn+lyyY3ak?=
 =?us-ascii?Q?Kzt1gs3jxxHyOUeK4v9JE5gv9DSexMRHurw1csrCZhwuUC4C9XWlcoEqV9xv?=
 =?us-ascii?Q?s+piLTNxPLzyF+HYxOCka2Jn2dImI/3AhZmplgMUBveAiRVHetgmkrScgzFq?=
 =?us-ascii?Q?dDMmLWMFNKEAtrGwo6u5MQH+E4TDyO6ippL2sLn0RE9vjeHxlOZjBCHuQj7u?=
 =?us-ascii?Q?SdU/4peyS8vBeXPuBd2ovmcimfjV55BsUFduzHYKotW6xE/t+Lke/x3/dFfb?=
 =?us-ascii?Q?vxJBdVbDph23YfjyHrV/315wals1fCQtTQot+StEX22NdM7aF0+pp2N+AVlH?=
 =?us-ascii?Q?DZrPdwk1I8JTfBVGE5yySKa1zUvcnbmaoU9i01Py/yZ/HcrnhqwUtHZcxQa7?=
 =?us-ascii?Q?1Qp/iC6xttfjaF34De4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:54:13.9544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38788315-01de-4a49-ad4a-08de1767fdc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
---
v10:
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
index 487bc6d9de1f..cda5eba1636c 100644
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
index 1089836f85b0..47af8a553e84 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -724,6 +724,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->multiplier_property) {
+		state->multiplier = val;
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
@@ -749,6 +751,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->multiplier_property) {
+		*val = state->multiplier;
 	} else if (property == colorop->size_property) {
 		*val = colorop->size;
 	} else if (property == colorop->data_property) {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index e773259633ae..5bdeed99c9b5 100644
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
index 7f622c8a0955..f846f807d7c4 100644
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
 	 * @size_property:
 	 *
@@ -331,6 +345,8 @@ int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_color
 					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
+int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
+				struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index bec524e2fa32..cac25c0ca37b 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -931,6 +931,17 @@ enum drm_colorop_type {
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

