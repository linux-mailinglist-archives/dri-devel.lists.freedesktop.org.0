Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8398F7BB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161D610E96A;
	Thu,  3 Oct 2024 20:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SaA1Bmyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E6410E96A;
 Thu,  3 Oct 2024 20:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7pejosnBPRJH2N1NigkFvocYBfPZ55RNnWRmZU8Zpoi4LYM6fUJRebBui+Nlyn0BsgBdINUYKwICGF7n0Qo5aILVEjeGRDVYwLJ+X1GiVcJzfdoUYxw54AMUIksb0qTKTz8zyjpbWVVtywCTdyGfrhH+IpfJoLDzAUUtCrXiqCgH9zgPN6+NHTtolCCyBZzsXVVjGSrDTul3Lo6wKusuOwH8Twh5BuUe5a63ZqooUyUpPTuB3Knb4S76hsv5oWrnzt/ht1NU0P4XTlJHNpweLkwSfSmHEawxmeWv5jToioGhX+GyxeGV7ghBXwHXLTZHQamovBlNiglJerDeYGKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hw1GKGgKPkaqx8yCzUsAzoFjN3EEGBKKXelolZ+urQ=;
 b=Gm2kFpncV96ruHwUvcwvinVyfsB6l7U+OpmB1Lrqj6TDGSQd8+HCpK4+MwHHM+RsND6mnztjSCyAobILvnA9+huDmGzzujC/fK5NMERsOz5tI3YL+KIi2DdZrfIMMp1RM0IOMOvllOS5NuGKyD54IIFzL0RBREyiJC6ZTcgCLr8mrV8/+Y4RGD2QPLmUyfNesor3TZwApCEGqbcjkYvBnWYs9ciFS4aNZSuwLMr6uFuoba31OFwVjG8dLiHUwas92NZHP7lWvo4eGYsvjzFmU7yCJuM2ZSEUXqibZ5thDgg7YN2Anw/ckLEl7MSQr62NhA81xEO0ALyqzmOKnXJKFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hw1GKGgKPkaqx8yCzUsAzoFjN3EEGBKKXelolZ+urQ=;
 b=SaA1BmyzK5qhYOyLvzC0l+9WELNzlotqYr86zXy3DtbRGEMB/WZXdwBo97teQwNM+F3m/VRzSPssLO7TJN/DRXGBIG+dujKw+8P/EQMlmuDz4/4ixStgng0PXcVHUdyS87nfBnOibGL2fFetizZ/uXYAr7e82SFPge81nFKiAms=
Received: from DM6PR04CA0017.namprd04.prod.outlook.com (2603:10b6:5:334::22)
 by CY8PR12MB7193.namprd12.prod.outlook.com (2603:10b6:930:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Thu, 3 Oct
 2024 20:01:54 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::18) by DM6PR04CA0017.outlook.office365.com
 (2603:10b6:5:334::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.17 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:52 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:52 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v6 34/44] drm/colorop: Add 1D Curve Custom LUT type
Date: Thu, 3 Oct 2024 16:01:16 -0400
Message-ID: <20241003200129.1732122-35-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|CY8PR12MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e8e255-158a-4c8c-2774-08dce3e63ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XlIjgfuR9TPHPoM2tZaxE2I+AYcXOz4x1yfDzckbXYh2BXCoMrRcsYuluQ23?=
 =?us-ascii?Q?8Z6eaUzRL1ZdLDxeOvSlApqUa1gMCsoCKvlZLrGePA2GIrr+neg5PUmrZKxF?=
 =?us-ascii?Q?T9IWmXmlg5eDNkB9LIz7MfnMSdBjsOhrzM5blAcC919+zyo2nKPTTD41Lu+A?=
 =?us-ascii?Q?fZfY3vbFDdErl/ZXTV2BBZaa1xEaE2R3J4CawYRKEbNfVqCFGAiB5avcmQji?=
 =?us-ascii?Q?BX5Nb6Yaadq/7OrBK4T0VnEaA32i30F70Zd+86k7m7TNYwN32Q/JrgeXpKcA?=
 =?us-ascii?Q?sy33RBkHPjJ41SF0KX4YTWKdWTC6Q/mB01/tQQZnPouHGgcqrQOTzMWbhujZ?=
 =?us-ascii?Q?NEd06Otj6bvT36o3hvuNtqmiQPmhbH+c71sJIz6AHORmOxc25s2jzrvjJt1G?=
 =?us-ascii?Q?UuFO/h6tgyY+xYIRsqR7jowKh8ZewWb6PDQuIbO+F02I7xIYrArGD4jJuO7O?=
 =?us-ascii?Q?Qtg715k/Dxv3jwdrS2PU24VxoDM0+o3L+zaqieOmCwYOGtB1cooo5uMGE51G?=
 =?us-ascii?Q?JAV9GSCQhqujVCDBNjRtMuRzwWVk5QyurS2Qhy+XoR8y7qDJwyxNbmgCHa5S?=
 =?us-ascii?Q?B5OQas+oMSVIGwKWOlF8YJrk+uNYYO+UOLwDAUrcgRIQcrEaGbfhupOTY+e/?=
 =?us-ascii?Q?lsRIJn4Xewhc0IC0PmXhyojqFvCL741LELqOYHxJEl5+YPtvw8j0b7V8TzJs?=
 =?us-ascii?Q?0jSIKnnqXzLdPBb0iA72v/DKR1PewV/wLLfChJvCLHt3gIuwiiU5BFlG4xJW?=
 =?us-ascii?Q?Hmdm/NZEO2glj+uJ7fRO6soMLSFig2GyryZWIAVv6VjeSvBd0SoyBfgCTkdn?=
 =?us-ascii?Q?207Gx1GsRvL6A0PxwXXVmp9H6YPq8XMac22opMCtvcxpeRP5qvE4eFaxk5pY?=
 =?us-ascii?Q?RCr8jetNoKjOCN/Iem8Ti7DAtheiDTbVvtt2gS6RIYVEOzD40dJzcg6RqwMP?=
 =?us-ascii?Q?FZLxBCoc+jMZQ1i2E0Vbgjt7RMNKhaHwwkJnPSg3kcqO5yolk0ygfrYPNP/t?=
 =?us-ascii?Q?zFrMU+YANXLrkTG2W5MBNVojLYod/reWPdGlmj9UWSTJ9kVauv+8vNjWYDm+?=
 =?us-ascii?Q?51+f3U9OrOKTZ1mWxhsjT8IUIoyU5Q3Oi3Ekn/qBz6LqNU4nCIoGra7RpZv7?=
 =?us-ascii?Q?ZgziqzkiHkHfcqxLfa3JAavEG7JyKzuJEq2zncFwQH34GRwClcUfwyCgB8Kd?=
 =?us-ascii?Q?mLcQ7j6gQ+IP3BCjE5gvf4V+ipqeqsdDpuYa5joQ26ZY4tRDt/xU5dcQGSdF?=
 =?us-ascii?Q?CPSyPu84AaiZuhFzSCKKCQX9dpljdwPd6xY9zpm7Efle6TZ+PUj55FrYgqeY?=
 =?us-ascii?Q?igm37owXQ4Blk1neIol/Ezut9VgIpQNpFkHnnkaaNTq22fepF+gbPUF+CTiD?=
 =?us-ascii?Q?KMEoXUNBKRsMn3zqTM44rPqTrn6x?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:54.7286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e8e255-158a-4c8c-2774-08dce3e63ad1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7193
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

v5:
 - Add kernel doc
 - Define SIZE in similar manner to GAMMA_SIZE on drm_crtc (Melissa)

 drivers/gpu/drm/drm_atomic.c      |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  5 ++++
 drivers/gpu/drm/drm_colorop.c     | 47 +++++++++++++++++++++++++++++--
 include/drm/drm_colorop.h         | 16 +++++++++++
 include/uapi/drm/drm_mode.h       |  9 ++++++
 5 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c58663327e6b..f06b1d5a61ed 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -793,6 +793,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
index fafbaa73b95f..2b7368b337a4 100644
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
index d6af7910ffc0..1d3fef74a30e 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -63,6 +63,7 @@

 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
 };

@@ -218,12 +219,53 @@ static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_color

 	colorop->data_property = prop;
 	drm_object_attach_property(&colorop->base,
-					colorop->data_property,
-					0);
+				   colorop->data_property,
+				   0);

 	return 0;
 }

+/**
+ * drm_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @lut_size: LUT size supported by driver
+ * @return zero on success, -E value on failure
+ */
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
+	prop = drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE, "SIZE",
+					 0, UINT_MAX);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->size_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->size_property, lut_size);
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
+
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane)
 {
@@ -332,6 +374,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)

 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };

diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index ca3a480db787..32973ad99f8c 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -133,6 +133,13 @@ struct drm_colorop_state {
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
@@ -245,6 +252,13 @@ struct drm_colorop {
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
@@ -291,6 +305,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,

 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 6fc1ce24800a..40cc5c661cff 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -888,6 +888,15 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_CURVE,

+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
+	DRM_COLOROP_1D_LUT,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
--
2.46.2

