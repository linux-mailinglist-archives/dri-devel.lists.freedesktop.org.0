Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A409F8B64
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4078210EE8A;
	Fri, 20 Dec 2024 04:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ypbJCBby";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4813610EE8A;
 Fri, 20 Dec 2024 04:39:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmyPPs3HwKcHY0rKGtFktwFTDGro7FNCUW1BprHzApnSPa9/6Q+/oBiW4x7f3uV3HpVkZkZxJaihHJxt7ILJ3sBGV4UfKi1rfR1aA6QtLHF17YKVojcKx6SV8c7L028ohHxXu2Uw0r8kC+mZTTXpvMYa2pDXxW0/9DF0gmlbxElo4CXCku7WrDDI7Q9s3N/WlqvkxZH+4eFkBgCvOoqQ7kLRKylSIxYYh3Vb7YunFBcxOx15al9UVWRby6ZcpK85zEQz1WKbgwBF+IxDJwdcICrHamIn8RjpVt75GAnEBju+I2W6EMPSpl4Pvdj18s0kacF09BFHNEBi9to/WX16jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HX5qS6qftlf6gtdZnz10EirOb+ZpvnVxbr8oRssH/Q=;
 b=tYE6dZzcuPduHIjZ1OgGX955I8U2878bWaTnD73SsA7BpLGxcXwmaDGZNecnrbKP83FpX8b21+wiH0t08dcrthlXOrOOinOdXm3zok17fNckF85wz56ZBp8vMeeC6SPNTtwkTXnrZMKWPoD21IKBsyoSzhy0pKyrr0vMiSqWXx7ihhRfru562FpUG5yNASMbxY74uA988g36ZoWwqRWFBpUAyS0ayFZzAHW7SiRgrNBpfHfXoNYfjaizYy5l8nptMzW0ZWyvS1OJK+SJvtHSdqcjz/Ic/rk9gBbGi4tMK/bPeD9mrbolTi6jcoF1deHUMsSptiJE2HxKfdVF4+e9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HX5qS6qftlf6gtdZnz10EirOb+ZpvnVxbr8oRssH/Q=;
 b=ypbJCBby5m1pakiiOIag1Dsh8RYOJTpkfjNDAruDZ1NEu6+0m6/UauhZRSr1Cq7YY/OjQSBfRaunK7ShjXrk3DPsiau8HTunSyN28Lmr3uW5Z2Ak2m54UBcCtrBt17HV/b8LIPFZgGn9oaH9l7Z2aqRqlRfiNiS6Ir1fJKoxVwE=
Received: from SN1PR12CA0052.namprd12.prod.outlook.com (2603:10b6:802:20::23)
 by PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 04:39:27 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:802:20:cafe::81) by SN1PR12CA0052.outlook.office365.com
 (2603:10b6:802:20::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 04:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:39:27 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:39:26 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 16/45] drm/colorop: Add 3x4 CTM type
Date: Thu, 19 Dec 2024 21:33:22 -0700
Message-ID: <20241220043410.416867-17-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|PH0PR12MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: bbad5a7c-6ca6-4476-58a1-08dd20b0497d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hq/51fR+/oQGA/Zt2UBisRguRPZoNhaz/adAouLG00B3P8+u4fKD8b4PXXX9?=
 =?us-ascii?Q?4od6l6zfCUfSZvRBP6I9OWzraIL5GZwPOAsY3xRg21gn2LMFxNu6RPfehH7V?=
 =?us-ascii?Q?Ua7yLouoT2ZuKRy9uVuiJdttlAlzht5QTn1KXiPU33ztKsuPsaqwgHhSGlpf?=
 =?us-ascii?Q?3h2bME3j2G43wa/Evn9ywTz4XI0B8PmFhZGiYjKSTqJ0cpJHDHP7yGOPiuqS?=
 =?us-ascii?Q?Xdzvu0wQAWifCY8WfE20BFlU/oGg/WXafuSsHgePo1kGNhfKgJZ7k1HYTLwH?=
 =?us-ascii?Q?1HUFLKg72J8b+RnFuSAQk8+CDs1jfPeO6XMLtBwBWcd58g1mrZWzTSfSEjkN?=
 =?us-ascii?Q?mL3D9DhpFDbQE5r3MHJNNrzQFg0IfNxmC4iJoZ6i1L3RkBDdVec5iueeyAtn?=
 =?us-ascii?Q?RfCeUReGTHMrKxCtx19BxTTK8LMOt1I0ELeU3f7YV8evRto51LyHLfaOnRgB?=
 =?us-ascii?Q?Lv7aWonia7UlRjzsyNtR13Cotk3WqAA2y0UOLkDAfYmKFpj+50lb6AQ+lhW6?=
 =?us-ascii?Q?6qE56gHNwOYgOI7b+nDh8tPgCM9cRyOHBz5MxHe+ltqeDhGZHA78oGZQMXWs?=
 =?us-ascii?Q?qqTZUjg6YmgRMn+cJ0miGunFdvaQ1yuz85/izgvtO0BZabhx2okFKGfWmfJL?=
 =?us-ascii?Q?LrhZzzGzurF8YAZ/tun9KpqAgE3jV8a7Ude5q70ZN1/+3h3ewDm6ELHKDVhk?=
 =?us-ascii?Q?SwP06SVv0kTOQP90kCbxGsM7MZah+DZhYyhyPiomLskuA63PQd5EydrMbp4X?=
 =?us-ascii?Q?rZc/2qDTNsjaqNPbKdQuc/eEteXoAT1wKD4EhtEIWWH2zeRJQFFhQ7rcDFto?=
 =?us-ascii?Q?7soQaqiYsNKQFeN9L9zoIU78pA2+r4bN5VEQm5egoBG+xNNgDZXtGYsdwIB7?=
 =?us-ascii?Q?u+VyXzYUd9Yh5Ru3Oqlnma4QBouYaWDnT2xrKP65wvQW0MHWiyy5npwB4voz?=
 =?us-ascii?Q?HslUUIxIGvq9RS5c2zDa3D8QlJX9F1NwHFejzAG1i1aInvYEKDXdUPMd4Tv7?=
 =?us-ascii?Q?ZekRhArhvwa95oyCuZD99Nn3trjq82PdXp6r9NXjgwgzXQtNM7w+SAqt6quR?=
 =?us-ascii?Q?B+FAZ1INCvXoxbYKZa5j8hM9QfUulb+P5DP4QIhHc5SIiD3owJtZzQeuY9Op?=
 =?us-ascii?Q?8NzBbqA7M1DLnh+dUriL0ZTgho94bymXX7SMnEAmgsM+o4rhQzQ+JulA60aq?=
 =?us-ascii?Q?ztn9nFpFrYb+IEaqMfA5Abv2QUjhnAL6sAYVfR8/SfDcdcvz7IrwDS6gInyk?=
 =?us-ascii?Q?r7/S2A4HtPzsVf2tyQUI36wt/MmsK1nAbMXcPBRd6dG/puOCdc3UfJDUbT5K?=
 =?us-ascii?Q?ejy0wplwWuPR4xXLNwIi2r989ltaYSawGRdgUqf1lefWmafTzwjXzy1rph/S?=
 =?us-ascii?Q?wCS5y2mtQpwJOxFYEE3Smi0ArTMDhNHyAKuwc1TCH+SmWRKghZo9rhNl43Mk?=
 =?us-ascii?Q?/uK4xD7PehvNqt+RUdgGV9WyNziUg8PgGmlSo1WLJJ6yvNKbZCaEyN4QSnY5?=
 =?us-ascii?Q?5arvxi2r0cHBJQ8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:39:27.4825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbad5a7c-6ca6-4476-58a1-08dd20b0497d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7486
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

From: Harry Wentland <harry.wentland@amd.com>

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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v6:
 - take ref for DATA blob in duplicate_state func (Xaver Hugl)

v5:
 - Add function signature for init (Sebastian)
 - Fix kernel-doc

v4:
 - Create helper function for creating 3x4 CTM colorop
 - Fix CTM indexes in comment (Pekka)

 drivers/gpu/drm/drm_atomic.c      | 14 ++++++++++-
 drivers/gpu/drm/drm_atomic_uapi.c | 29 +++++++++++++++++++++
 drivers/gpu/drm/drm_colorop.c     | 42 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 21 ++++++++++++++++
 include/uapi/drm/amdgpu_drm.h     |  9 -------
 include/uapi/drm/drm_mode.h       | 24 +++++++++++++++++-
 6 files changed, 128 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 35136987d5e8..c58663327e6b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -787,7 +787,19 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
index f0c22abcc28f..7bc4978e5441 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -692,6 +692,30 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
@@ -701,6 +725,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop,
+					state, property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -723,6 +750,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 954acd09673a..7d4b29c0a0cc 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"}
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -202,11 +203,51 @@ int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *coloro
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
 	memcpy(state, colorop->state, sizeof(*state));
 
+	if (state->data)
+		drm_property_blob_get(state->data);
+
 	state->bypass = true;
 }
 
@@ -288,6 +329,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix"
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 2f0572be37bb..e9f5c1adc2fe 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -96,6 +96,14 @@ struct drm_colorop_state {
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
@@ -200,6 +208,17 @@ struct drm_colorop {
 	 */
 	struct drm_property *curve_1d_type_property;
 
+	/**
+	 * @data_property:
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
 	 * @next_property:
 	 *
@@ -236,6 +255,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index efe5de6ce208..e44362e74fa1 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1283,15 +1283,6 @@ struct drm_amdgpu_info_gpuvm_fault {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
-/* FIXME wrong namespace! */
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 53985d2b7eea..6fc1ce24800a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -847,6 +847,20 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 11|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -872,7 +886,15 @@ enum drm_colorop_type {
 	 * A 1D curve that is being applied to all color channels. The
 	 * curve is specified via the CURVE_1D_TYPE colorop property.
 	 */
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 */
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.43.0

