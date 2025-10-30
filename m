Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BB9C1E4A3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1502D10E9EA;
	Thu, 30 Oct 2025 03:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AMbAXQEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDAB10E9EA;
 Thu, 30 Oct 2025 03:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7YXNkPJKfVRq6VuvvqBQXZc9EJzQ00LMAsCYdtfI4ofZhFqHgnn+n4rDfvCBHbi8T7ivgnKw0AMBM8kTSjNm7xSBngVMrQkjXPhFnEvlQhwKKLmb6c0a8EG0JkZgLyikbtoRWQaW4y6J59CbQfkdbOmWFsD6J9/AxMNc9O/BXoJwtFD4Ncjo0sAxmK1WW/oN72p9pXUqLlIqbaH/4rwkfBANWaKVlVFIm0FxBviay34vSgj4QWFJft5L0kvNF1AH58X/2kOWK7f61HDT4sLwuByo1drhFqjyxaZ9JQVZ0yOIQlJ1IoRFjR3ID1JA4bot295oJihL3YZtKtmZpq9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNcMAXIoUJFb4ulwTJ3FoSpYWaF8oHucBoMy/kfotAM=;
 b=o7CJqkXGxCedyPe8UQRkKuwsSrJYqCwXH+lbGQi1msAJEN/NtgspsLnn21ZffFYPNsnGXx/AT4ES84ukZKyi64XDfpL2w+M5aFfRLy6PiLDaIMC4pFn94WRgW34Gf6l/LLvqnZUAGulskuruaWxwMrVtIftz+zCditAhPWnRPlMRSbGbosjENr8xAb/lQIpW3F4Wp1A/ZFXnJdf6ORCINVIKSLnYmG5ssWAcSRY1ey2WFjDqaWvRJCf1+abstZfDjlE18yWRkrim3lP6RkS1ZV4IE4OIydFftNavFkggoE1DpWYaWkMgB828cTS9iRYxF7IaqQPbUxvgFR848ivMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNcMAXIoUJFb4ulwTJ3FoSpYWaF8oHucBoMy/kfotAM=;
 b=AMbAXQEd9GszTSjR5xYGdXnF0R98uFKWK3i2c1LJ2sWbiWXskdqXhNu7wH5CTMdsRw0uGLGBvlbr3cr3CxCuRIiHZewiUxUG4SvOS96BRKaBBBA0IKnaTWX7sddFjS4V4bSlvZCGC8MwDkYxsnW6T8xd2dAgtMI8ZITKdpKGipY=
Received: from MN2PR16CA0060.namprd16.prod.outlook.com (2603:10b6:208:234::29)
 by DS5PPF78FC67EBA.namprd12.prod.outlook.com (2603:10b6:f:fc00::655)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 03:53:29 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::b0) by MN2PR16CA0060.outlook.office365.com
 (2603:10b6:208:234::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 03:53:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:53:28 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:53:25 -0700
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
Subject: [PATCH V12 35/49] drm/colorop: Add 1D Curve Custom LUT type
Date: Wed, 29 Oct 2025 21:42:40 -0600
Message-ID: <20251030034349.2309829-36-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|DS5PPF78FC67EBA:EE_
X-MS-Office365-Filtering-Correlation-Id: ea757df9-d59d-4a10-4048-08de1767e2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SNOQzTULicGAPSh3SV8mKvKie9dCiFHVRDmP/tuNShJP7PtRQoRUiErQnY6o?=
 =?us-ascii?Q?tg9SQL609b2e/d+tyGS5w3Gg2BzXBCy7pVyHNV4nFzpcDEGuV+yTydfjVCML?=
 =?us-ascii?Q?D665pHRhtVnzUpOyBpIpdhQ2e+o/qvhGoD/V4kCtKTwxLKjLUZqAdASq0RbR?=
 =?us-ascii?Q?R9eu4FGi9BiTRVtjbc53Nxly427x2S51CE0XzVhQkzhyiyVrzC4dSLHQnyMu?=
 =?us-ascii?Q?3A46BC8BUXoYuK4/OdT+h98djz+KQ29aYvClqp3KDW0BiKgOq887iIstfEiJ?=
 =?us-ascii?Q?ciY5U3BRxt38LMzvJotGk53HwR6xP2U43P2TLjfoSnAxCT5PI7VGF87qW7h/?=
 =?us-ascii?Q?w9tCc0rlMm9kAbfA3veL7cpig1RIKViKuvSqUhazJiCX48cof3izPqt08LYA?=
 =?us-ascii?Q?vR4IKGNNN1yyRR0PNB3jacxZq5ddkSqHIijSR1+YyuQWHb3Y4bD8xujRAvAO?=
 =?us-ascii?Q?nElgWPiMla1qXhI6ZnaCIKVc3+L5qp0cHhTZBRQyIK0YFITpwDX1ua/HPXuk?=
 =?us-ascii?Q?OlgNuRr/SDlPQpSiZYQ6zhxzpUs02KYGA/KVGxhucwP/G3/608t/0m1U+IFW?=
 =?us-ascii?Q?932Xnl7dRP3fz5uz4Rua85baLHR8VFvZcERE0bp/zZRmQAxXWav9Bcym6pT9?=
 =?us-ascii?Q?7zLxok7JFrZJHC5W8NlC7CWV57epHPUSM51JjhSOoVyBI6u40Djs8Kcme0zK?=
 =?us-ascii?Q?T7/V3a5ImFnQ9EbuOIUm5bWuUHFtfXuitOm3X/Orx04njIsKOu/uhhBtyrBc?=
 =?us-ascii?Q?iumX7wuvXdadJEMHeyvzeaKS+K/d4wK8n8G8nvlzGeY2cBOq3HCaO+1qDDMd?=
 =?us-ascii?Q?FXAazdxT0SEJZWgXIS1I2e1XZOqmO2j4JsFCaSiuZR3+WRDXaKbIwQhiJiEG?=
 =?us-ascii?Q?U5GXLwHR0odQxLmPiYznonkAGp2egybbeBxkQCPPbR4CLK+MxiezRs1kelY4?=
 =?us-ascii?Q?CYEEqWhjRz4ohnBkDpeSAuSrwFTCSJwEAm1QaaA/l9vo7Hes8iqUpT+By0NF?=
 =?us-ascii?Q?m4iSzp00HEd1KqfaS4XuOy/jLdKoIJwsHZzwJnPBXzwgHkbzbUyExK+/xo1Q?=
 =?us-ascii?Q?r5n/juuNpmYVFKwHImQ/b1G63WQ7on0wqf/fD6GNpJQWp+QOUPFzdi9O2O5k?=
 =?us-ascii?Q?DnI8+p9v+FP6w9DRXz4EimvVmVcLkMXbJZMtnACIycB2XM0ZsKp+vn2cZiwd?=
 =?us-ascii?Q?C31n1r5O1kIjOuEbpVZ+5llpnL5PLo8+ICNCV4Jwhog/JZRvZg6dtgzWmy1d?=
 =?us-ascii?Q?/ecavOWk6BOP8dUjbjs2LAtQcAp4nXsfjBFj4hXTi8WV4wF0FvIIxkFiWGr7?=
 =?us-ascii?Q?gGnlRCxoro0kCMdCaLc/bGl8n8xtX7sDCf/M7NsWxKq0+r7zcZiUAdIXePOs?=
 =?us-ascii?Q?ypux9zi9rMRi7cFG1j4SGglCmbjJOr2+RnPlhKEQBM3F0ANKPTa/zdH6fcNt?=
 =?us-ascii?Q?59QCZB32EuZ9H1uYzpuVp79CGZOxje1QMDI06CWUmd8ORjhVxfqiU778Cx59?=
 =?us-ascii?Q?5NLUKB41ELG2TRy/PoN/v8bzZpQvyyk63HTXfqgtDmWyHSrm8/gJn0rDZr3x?=
 =?us-ascii?Q?lAHMlZSpwKvsVutVU5c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:53:28.9478 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea757df9-d59d-4a10-4048-08de1767e2f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF78FC67EBA
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

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v12:
 - Change lut_size to size (Sebastian Wick & Xaver Hugl)

v11:
 - Update names from *_lut_32_* to *_lut32_* (Simon Ser)

v10:
 - 1D LUT API is now using 32BIT RGB with drm_color_lut_32 (Uma Shankar)

v9:
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v8:
 - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
 - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)

v7:
 - Change "size" to "lut_size" (this affects multiple following commits)
 - Move "lut_size" from drm_colorop_state to drm_colorop
 - Modify other files accordingly (i.e. from drm_colorop_state->size
   to drm_colorop->lut_size)

v5:
 - Add kernel doc
 - Define SIZE in similar manner to GAMMA_SIZE on drm_crtc (Melissa)

 drivers/gpu/drm/drm_atomic.c      |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  5 ++++
 drivers/gpu/drm/drm_colorop.c     | 43 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 16 ++++++++++++
 include/uapi/drm/drm_mode.h       | 14 ++++++++++
 5 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c5663b74e9d0..487bc6d9de1f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -793,6 +793,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tcurve_1d_type=%s\n",
 			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
 		break;
+	case DRM_COLOROP_1D_LUT:
+		drm_printf(p, "\tsize=%d\n", colorop->size);
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 53ad341216ed..1089836f85b0 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -697,6 +697,9 @@ static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
 	bool replaced = false;
 
 	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		size = colorop->size * sizeof(struct drm_color_lut32);
+		break;
 	case DRM_COLOROP_CTM_3X4:
 		size = sizeof(struct drm_color_ctm_3x4);
 		break;
@@ -746,6 +749,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->size_property) {
+		*val = colorop->size;
 	} else if (property == colorop->data_property) {
 		*val = (state->data) ? state->data->base.id : 0;
 	} else {
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index db41cda51296..e773259633ae 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_1D_LUT, "1D LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 };
 
@@ -266,6 +267,47 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color
 	return 0;
 }
 
+/**
+ * drm_plane_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @lut_size: LUT size supported by driver
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size)
+{
+	struct drm_property *prop;
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT);
+	if (ret)
+		return ret;
+
+	/* initialize 1D LUT only attribute */
+	/* LUT size */
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_ATOMIC,
+					 "SIZE", 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->size_property, lut_size);
+	colorop->size = lut_size;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
+
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane)
 {
@@ -374,6 +416,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 };
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 19f3778f9e9a..7f622c8a0955 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -259,6 +259,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *bypass_property;
 
+	/**
+	 * @size:
+	 *
+	 * Number of entries of the custom LUT. This should be read-only.
+	 */
+	uint32_t size;
+
 	/**
 	 * @curve_1d_type_property:
 	 *
@@ -266,6 +273,13 @@ struct drm_colorop {
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
 	 * @data_property:
 	 *
@@ -313,6 +327,8 @@ void drm_colorop_cleanup(struct drm_colorop *colorop);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
+int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+					struct drm_plane *plane, uint32_t lut_size);
 int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 				   struct drm_plane *plane);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5e637ec7b64c..bec524e2fa32 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -902,6 +902,20 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_CURVE,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * enum string "1D LUT"
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
+	 * packed into a blob via the DATA property. The driver's
+	 * expected LUT size is advertised via the SIZE property.
+	 *
+	 * The DATA blob is an array of struct drm_color_lut32 with size
+	 * of "size".
+	 */
+	DRM_COLOROP_1D_LUT,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.43.0

