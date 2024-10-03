Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E179B98F7CA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532E410E9A1;
	Thu,  3 Oct 2024 20:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IyK7HqPu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D48210E98B;
 Thu,  3 Oct 2024 20:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1qTiP+K9JMtuNatMGIXJAWSzS1zzUaKIwrQgdtWorXsPUPATsm9+Cy76RFd3qP2KExVBbm16ZAE24HrE2JeeysNksjAnW9aDvVnAv5zvzrrFvIudiF+mUd7+ASLVQvCYusKRqermjxiXJlflOetqL9ktceh3U5ATQz48t4OaWG0FVg5rDollyQgOg/wCgoiIaLzPWJcugRGhDfyMEunIHgg0lLv3quK8dk5yCzU7i3gSWiYpehY1Xe7BaZo1s99dQ5UKN8Xn7nFytdMjlh7JXf+pycXn14NhTtfRJic5sY1Kas+Gv8BojMGuv8oCFavKZ4Ad/U2idA7UiW8YHJ1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YVpLzV285OdzrBrIoBMV1vm3xWISGuqxCGhWB8avZI=;
 b=s3SEer+Q0YTvlompM4/ONyNvx35Mz7PWLE4aDYzAfe8oyS3TUgBXmwEG5eoSK43XBQDtBDA48J5INmu2quNzqTDOz1AzVjVv8K1SLnJbs5kGF6DaGQjtMEN/0oXYQDF4CzSfCsAH0GPsoeHYSZcbF/T2cg2NFa8gIuOaHNvxcGuwIG3N3xAC2Vtj9GTtAiY5RidVdeypJkOeY1azaIg21UBNAZ63vrjjpIiY7YbdQVbmaNnt8XVctC5bA3/H9PxjHct01lXxIzbzWNT8dtMsTUqu4VT4ea5iUMe78U0Op+M8UW/jDGlf++fr6irka9UYiG7shcbt4w148JTGquEORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YVpLzV285OdzrBrIoBMV1vm3xWISGuqxCGhWB8avZI=;
 b=IyK7HqPutshP6xFcAgEh7Y5vRRvPWAxjnlznhqyQ/e/1OA3/tpWXd4uSRNpeypYcN9Z08W4Xj6M1O9RCcmM87NCMmBm5P7/May24uLnrOHugbwwvw3WT4VOrHEVXlVbiemMvR1GNjzwnmVSWOc9W8UC4YGdXs9tr4yomZUG24Wo=
Received: from DM6PR04CA0003.namprd04.prod.outlook.com (2603:10b6:5:334::8) by
 PH7PR12MB5617.namprd12.prod.outlook.com (2603:10b6:510:133::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.16; Thu, 3 Oct 2024 20:02:02 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::26) by DM6PR04CA0003.outlook.office365.com
 (2603:10b6:5:334::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:02:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:02:01 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:57 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:57 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v6 42/44] drm/colorop: Add 3D LUT supports to color pipeline
Date: Thu, 3 Oct 2024 16:01:24 -0400
Message-ID: <20241003200129.1732122-43-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|PH7PR12MB5617:EE_
X-MS-Office365-Filtering-Correlation-Id: cb83c87f-c86f-4337-42f9-08dce3e63f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GVRrtd6W3DbmRY7gTwwBkppgOO+xZbp+3fMtRqRaln8Dq/DGd2V4uQUQQGHY?=
 =?us-ascii?Q?klJHN7qhyWc7oTz3dmIYaEY4CCB3FyW76EQF4Qy6zKjAzQUfBz9GS1/NUUrg?=
 =?us-ascii?Q?q87oRSi5HYDm6twwTTE3K1PPEGyMOSTg1c5UXVJqnjBexZMkXHMinlfty0sW?=
 =?us-ascii?Q?6WCGU6Lb+HumfBiRsScCx3IrCKeFQ/uTr2tdj7eWIJD8zcEQJLHinf/acf6y?=
 =?us-ascii?Q?UaB5NhuTXxQvcSup4nVtgUiJhRVlGNQrNwFjcl+Bx3rQNblt/KHF89enoMM/?=
 =?us-ascii?Q?3kzwH37sRQYC/DwVH7ipPlSMHkR7ij2LO/6BgY8jruEfECd9wrpiv25keMS0?=
 =?us-ascii?Q?H194s2cHJ/26/ujLLtFearnk6zdM6PPO2Hq0xNr3ADaJjF8S6/cQt1yejZfr?=
 =?us-ascii?Q?auStsTHfSYp/m2p+mnq1qXz4ngpa4uoVA4UxoZsPhK/lS28ZPl7J8vzY0f5E?=
 =?us-ascii?Q?0Mv1i/IcTg/fseGzI2/lfr/rBCU0WprFKMK8eNgdj6SgcvAcAo6W76Bmf2xU?=
 =?us-ascii?Q?qtsR+eRU8UJ9kb9/Ij/2BKm8mcuCb8YlkVPOKrLrVyjAItcx92Qo7MqWe3qd?=
 =?us-ascii?Q?al1ZAG8zKLSAeW2vPXOylFgr4TVkVPElFPBNfor4EMgTexVEaIA8D0xyCjSJ?=
 =?us-ascii?Q?+r2k23whwtko9qnvpJlf8QZHW1y1NqUZ87Zw8p1vA54OO2/RFphcQUSdmEyb?=
 =?us-ascii?Q?+u/i1+J/F2tG0SwLO5hETQNidg8cQxGVNeoS9N1B2Y+bzLZMl7wxxOdMsqYR?=
 =?us-ascii?Q?E8v0LaNTBob/2hYotF4t9R2zURv1xNgVKq5IgooIDPv4+sKc1Xcst4UDEqAH?=
 =?us-ascii?Q?whq/wi/OdRpVDK5B8AdW2hi3wdVY835o7EYJF2qVOqDr17U/+LVfKDGPtdrR?=
 =?us-ascii?Q?/l0bShJzZT1qS+B6ucbohB9dL0lZqKJNNPg+mgjJuaTPA+pCPysPFwuySxHk?=
 =?us-ascii?Q?qSASoq5SR2+pIXPc2yxvgyHDn870mt0TSrpU/lKm2M/05wkqI/8wdIBUj9Hf?=
 =?us-ascii?Q?eID+BVreqGiNq8U7awsWJOWkmuPI611DDTSlgrXsbIKUxoSOHDOmBFboXhiU?=
 =?us-ascii?Q?kIvC4YcpD8f5ZCLyVBIouOFrbS+ky6AQyBdFH0RM60tBkTF/SMJAbucKOOuI?=
 =?us-ascii?Q?tW+P7TJo+YY5KqouVQ7EipfWPAaXjiyI2rVQZHO/T8PxYr9ehm1WqU7UU5s5?=
 =?us-ascii?Q?4wFfTX02zFMryLAMuLYzgVoT5udmutJ9iDCUGif3ZJ49TxjhBySqpM+DaciL?=
 =?us-ascii?Q?n/VujDGmPdRNf3AZYnCNfQOaLyzuF0DvGKMaDsc0qbK5IYBTGMurhlYn3xsZ?=
 =?us-ascii?Q?pwsyPANPRb52ljhav8zyfHA7wXEW6JwwACvUtXUmAUBT3IvK/xWsCsieyIkG?=
 =?us-ascii?Q?e8R4CYMrmI9l3eGR8lwz8iCUv6Mz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:02:01.9317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb83c87f-c86f-4337-42f9-08dce3e63f1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5617
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
index 29f8a8f402f2..58f0ef8b2d1d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -783,6 +783,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		const struct drm_colorop_state *state)
 {
 	struct drm_colorop *colorop = state->colorop;
+	struct drm_property_blob *modes = state->lut_3d_modes;
+	struct drm_mode_3dlut_mode *mode_3dlut;
+	int i;
 
 	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
@@ -805,6 +808,24 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
index 57029e5938f6..e978b1bf021f 100644
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
index df0266734639..fd1cd934df48 100644
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
@@ -440,7 +488,13 @@ static const char * const colorop_type_name[] = {
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
@@ -476,6 +530,21 @@ const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_inte
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
index b8c1c4da3444..bf5117f30c80 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -147,6 +147,29 @@ struct drm_colorop_state {
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
@@ -288,6 +311,21 @@ struct drm_colorop {
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
@@ -343,6 +381,9 @@ int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop
 			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, bool allow_bypass);
+int drm_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
+			   struct drm_plane *plane, struct drm_mode_3dlut_mode *mode_3dlut,
+			   size_t num, bool allow_bypass);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
@@ -393,6 +434,7 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
  */
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 const char *drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_type type);
+const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5ef87cb5b242..290c2e32f692 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -913,6 +913,90 @@ enum drm_colorop_type {
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
2.46.2

