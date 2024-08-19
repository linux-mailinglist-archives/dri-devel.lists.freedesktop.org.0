Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9729957640
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5284A10E437;
	Mon, 19 Aug 2024 20:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w2MCKyAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1A10E420;
 Mon, 19 Aug 2024 20:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TriEKUR2NAr2pd+6QTsz1NklEgfx4pt3Q0ITylLS8xUbqA7ACcM97xdN9jgUo/JVEa8nBbYME5tcQwqg9z7B1y2vbhOScWvnB5HOCfPXDrWHgpAh11EIgnLav0G7yOjjMkTf1mSjf6yKflI0zbaOoSZyajD4S0vQ0xohTAEVTOPo+OXtos0QjaNVvfbHNN8j45nE1TWmyqcjqiXaJpZ2uvVQbYE6z/1eOCpmXLVa/NFHtZtUyalsKz9AXem+k9QRy0YMWMdHjqffZVk5oZStih7QHN+vCqCVH9yNNz8KNdzwhsytYSaYJ81p2gsSLP5UBl+Z8SsNu6NwYLr/74UOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWhMFtzDhjgCysm3G5is+KSXowcKneJ+Wekmf9qgOdY=;
 b=JsIbwOZPwC9NcZ7dHhAuNKuE37//41jO9wQFBdN9IVh6FYBUkqRGregIdwL72m3Z4wTlwlhjKg7brb2MD0133SDl8hzPkjb8GTZO/1mTqfEmj2/lvXBFk/gIimLQhp8xH2cD/MyBIV/G25Kpdrgxiq8awSZdEzV+3Rfa8Obt4BRSb/var+h0HbqXQqSbSaTRWfu2GIzeVhry38CRvopn0jjGXWOxzBbPXwgXehxPKf4d9ZrwfNCzkzulZ8yKDtfKU6vAfiUOXipGP7WuZSykcEAvExs/4u0FdS1lQrJ4fgyLQv0Yw/dhyV9aaTq+mq4poeI4dclCqWvvhedTkNxD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWhMFtzDhjgCysm3G5is+KSXowcKneJ+Wekmf9qgOdY=;
 b=w2MCKyAFqI02UT0LSir1fM+x5Aott/OPX7X6uuab/4Q1Qep9rfkzqkr7liIRpWbm1ByUbwh6YeEHRn+x2zQ3/9Mce4d0LiN4DSW9XHN4zzfvGA3MWsyZUPETPHCOdc4l4nED5PwJYaSmYCVwv/ZFH5R55i3kDZRvj20jje3WwJg=
Received: from BN9PR03CA0533.namprd03.prod.outlook.com (2603:10b6:408:131::28)
 by SA0PR12MB4463.namprd12.prod.outlook.com (2603:10b6:806:92::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:41 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::14) by BN9PR03CA0533.outlook.office365.com
 (2603:10b6:408:131::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:57:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:40 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:40 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 34/44] drm/colorop: Add 1D Curve Custom LUT type
Date: Mon, 19 Aug 2024 16:57:01 -0400
Message-ID: <20240819205714.316380-35-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|SA0PR12MB4463:EE_
X-MS-Office365-Filtering-Correlation-Id: b5646311-84fc-496e-3800-08dcc09190e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+6vCZK2+43YcGZS4kenlnPVsY5QO5T2gEFEUuZukWxkQlyZlo/a6JpiSasaW?=
 =?us-ascii?Q?mysHar8RCOQulGkYr37BQNOO53++2E1BmgWk0W3f6yap9K9xCau7FRZ80dyM?=
 =?us-ascii?Q?N5i/8IVjCzXBKf2/08a6ZwECIOE4GfqKzDq/pOKPpGwB5jQqC3VCG0ZSY8oJ?=
 =?us-ascii?Q?e119crt899EqlkH11tAJ1LXhO/uOp7GL6ydCY9NuhEplJfE6iyamXZQWy1n3?=
 =?us-ascii?Q?WkksoPG1Vu/gCRuT5k2G/y6XSfgrh7UmiyQ8JBX8pODQre2uPw5dACTpluLa?=
 =?us-ascii?Q?HV1AXH5CA9K6jcP4T3kk5pFjHN/ktaXvLSW0LTSbQEqqeFAqPF0h8+tbCh3f?=
 =?us-ascii?Q?8M5JfR16wkLFlBVc6sCi9ElsxxzWsnJa1wDg2rVnG7AAupQb6AkUlggdAV3g?=
 =?us-ascii?Q?Jro/DY80Jb/225cpmcm1DCSFJFP/pyIT4t4IGc8EYXE2mhC6432rVc3x86sv?=
 =?us-ascii?Q?ZtWQNZ7TfxZeqvcaiR5Rmx+BL6oOdn29rAi81HhozU17fqY9zCjhfEp2Xumu?=
 =?us-ascii?Q?AFbVNeFmXQcVaLQPi1TSMuonl+uZl3Op2+/DlgTThmcVuDvfaQ3V/EnAsj70?=
 =?us-ascii?Q?vm+ZlQcGz4dLWZbEJQdv8SzXZyE+3/mwn8p5F1pMonhjF1/V5J9cptnTIZN1?=
 =?us-ascii?Q?aJJ/0+7TfDhM6w412LdeVn2va2vYnXgN2bkylObANG/IEYbo+pxstJQe0bDo?=
 =?us-ascii?Q?z4IgerW4l8DdFrafyDo8L8hYHwUfWIPkDax7pC4082nWYSbfiTbckuVZ52NO?=
 =?us-ascii?Q?RoF5x3atY3yPtmn3FctlrdU5rcz7wJff3/6xg4eCuzKRN4j0Vba6y7UisbdG?=
 =?us-ascii?Q?7otecXl4q7cUjpwui0Jxkfct7GdXfq4hxxEWlSQLQaBC78kFDmBbbDtTodFY?=
 =?us-ascii?Q?wZIQtqc+3ARkA6T+UiF1XziJZak1vnNyhBfU60cnUISEUIfrGw4hZApsIKyj?=
 =?us-ascii?Q?/15Qyk0Ddm1lBVXaJqOqX0i1XMqnNDuPOq2ZJJrCE1zApQUKoRO/Rkhodrju?=
 =?us-ascii?Q?zwMA3UPR8UmKiIcZRGy/MpVrTLEps+clU+XFajtSnWAI6oXSw/5NWazgXcdT?=
 =?us-ascii?Q?/bCeiRcf8SbIpaNsWFtAJcW3leeEEJ9rv9g+nozf1eakWx2xV41D4yLJoGoS?=
 =?us-ascii?Q?yTNoGJB1pbRORmMG/qpgA8/zaWvrCRM+PWARsCPK4de+thp3MYA4IaEhsZg3?=
 =?us-ascii?Q?K6qM5nB7HuqEz8/VkC6stxgcKO9i4BwJNlr5qPiMkNpGCpI8gB329ykzeJ34?=
 =?us-ascii?Q?4VCD+nMTLmLTtq36ptZIaSz726jbiouokmuth1OCN9dXH2H3IUYr4V0F5lNb?=
 =?us-ascii?Q?ZkzlCjaTZHZtMJ/uVMxtPPSLmqnQmV9xocs5+7A4mAsoNhjiAB+AbSHieDz0?=
 =?us-ascii?Q?Cow1Ape5lV2O1BzGOCfe70o1kk838s957WjGf/eVpKWacOZRsU/v5+yR0A2w?=
 =?us-ascii?Q?CcNVd/XunJHQwf3gxpKIwnIMEFVX+LBZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:41.2653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5646311-84fc-496e-3800-08dcc09190e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4463
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

v5:
 - Add kernel doc
 - Define SIZE in similar manner to GAMMA_SIZE on drm_crtc (Melissa)

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c      |  4 +++
 drivers/gpu/drm/drm_atomic_uapi.c |  5 ++++
 drivers/gpu/drm/drm_colorop.c     | 47 +++++++++++++++++++++++++++++--
 include/drm/drm_colorop.h         | 16 +++++++++++
 include/uapi/drm/drm_mode.h       |  9 ++++++
 5 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index c2fcde96e218..10af940de8de 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -796,6 +796,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
index 39805f822d44..5bbce7360262 100644
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
index 032ca65299e5..e760d3301d48 100644
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
@@ -329,6 +371,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_1D_LUT] = "1D Curve Custom LUT",
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };
 
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index d8d0e4b571ca..6e5da057ef44 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -125,6 +125,13 @@ struct drm_colorop_state {
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
@@ -231,6 +238,13 @@ struct drm_colorop {
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
@@ -277,6 +291,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, uint32_t lut_size);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index da2be67609c8..83bf461558b5 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -889,6 +889,15 @@ enum drm_colorop_type {
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
2.46.0

