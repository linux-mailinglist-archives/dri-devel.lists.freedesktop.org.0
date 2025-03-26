Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A26A72765
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5984A10E7D8;
	Wed, 26 Mar 2025 23:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pQdgZTem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0076D10E7D3;
 Wed, 26 Mar 2025 23:52:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ewe6yxn9rgeNCxBagDAnRaV0LbHHjklWUQ9MxblEdt8k9HtoiJfTrbo9omUFjkrgxmf7Cw7yeo1peXnk2hjnpr5RAnD9ebbncCPpyXu4YhDIvfxBpwVCkWUymVOt4XVefpErcfOvSJ5LoQVdVBMbeTb7fR/7l3+Jy0Tl/5kKmmx7tJCsjLlvo8IyL+rmRpR9t12jZQPkUSS/psybnkFAs6hqKpAwhho18uGEpO6bVjD6+LvUkeErUR/UXA/H07Oc13EAtamf0bTgyghZNcivlfxwLGnsJt02P/ZgSzTmowd7WzxoifwfDSfWNqq8a+6c2BYW5mxX+AIsSUWIsAjbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bYypKErtZ8Od6Gzyyt8V77dOgZuuw3QsgFtkqB8kFk=;
 b=nfWFGo5zdoVRYp8AOthVlH4EnDsRQyhVHtWoWW96mn0mHJHtJ1k0hWl9wR+91a5rOO86MZJWYbhj5IyHAAbPV3qq0ZuTJXSKtC14dt9j+dotFJrTzfACs8EwobuNNr5FleSTogKqt5cXRifgCi1XTvP6ZV+RLwA4SsgCW/67X437oybfDoiCzUBVk+i+yhFNswZhsp5t0g9TbKMulNKslN0w8nR4uiAiM0fmHP2Pnx+eDXsAsWTz8/WF0fQIMCDgGepF8MLvCXWPIvujyWNP/m7Wu3VPi28l5pW3wyT+9iTMkAEShYYLvbfU+QsnR0mqt+C3L1C9yUJwxHA2eTp+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bYypKErtZ8Od6Gzyyt8V77dOgZuuw3QsgFtkqB8kFk=;
 b=pQdgZTemtA1dAZdis/Tw3E2qaoY30zwpkF2DVV0Tw7FcRslUc3HL+iF58Y87u56+A6oxJAp7fGChVM2GoiBpEVH1YxfNaHP6tVXFeaAd2Uiw68nxFA9TMVZnrwk1pgZblqLdhEResFSpURYVpyh7BLSd42BjX5cXzPFwnjxz6lQ=
Received: from BN0PR04CA0008.namprd04.prod.outlook.com (2603:10b6:408:ee::13)
 by DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:52:07 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::49) by BN0PR04CA0008.outlook.office365.com
 (2603:10b6:408:ee::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:52:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:52:07 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:52:04 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>
Subject: [PATCH V8 15/43] drm/colorop: Add 3x4 CTM type
Date: Wed, 26 Mar 2025 17:46:56 -0600
Message-ID: <20250326234748.2982010-16-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326234748.2982010-1-alex.hung@amd.com>
References: <20250326234748.2982010-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DS0PR12MB8044:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8c1efe-732b-4a70-3660-08dd6cc13798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S1FJuab2OzcHWfa3A+AUF3OqPQEDrJVbGA7Qre4RIqKedyCIQKwJ2Ynbzeo2?=
 =?us-ascii?Q?8/K/CCVB90BzpDPbY/OsBfEufI+cxISxcnkU5Pti4qkbFFhhFcFe7TbC/Bes?=
 =?us-ascii?Q?IeUhDFntvCulqCgKCd8Ynan0FEJQYJWA1mkQ2eFRo3/mpmYFmC0W+gYDdrfG?=
 =?us-ascii?Q?NY6iEWvKMHhmApeheh4pkF/Gev4ltTgG+SiFm4wdoTuKgGcs6rWsFnZm2rhF?=
 =?us-ascii?Q?0nTn4NKsNw2gdI2g4XXdJDQyO+hang9/9CyaSRGFgBcRKu2da9s13FlrpHCJ?=
 =?us-ascii?Q?PzQjAjHqVjpZasKWdgV/gOBlv+o4k+bHyZ9BOCZcUxdqqpMCP/291sZRwBX0?=
 =?us-ascii?Q?MhPzhPFOkWjeLbt1seJEkFIK0sCkqKKyQ51yxLK2KQhoDdTh49u4CS+/dnh4?=
 =?us-ascii?Q?o3PsbhPIbRQRNOglZroEgFjP0JM0MDRLkCY9NRZHY51IVODXbJbFkjPSgUDR?=
 =?us-ascii?Q?gYgxl63MxiQT4bsNNPbu4VzYixTyxCGg4TycGqpckH3sgk27dKdoqgsNzkHg?=
 =?us-ascii?Q?1zAckb2o1OLmWBA9Ey7B0M92PeUliUcbAOv9E2nhqTOCpp4FAvdHrRy965Cc?=
 =?us-ascii?Q?KwpPqPs8lLa9ji+TVcxXHUP8/UuAeyP5JzbTBtou4sgbk4J/fGaYggs3RO4W?=
 =?us-ascii?Q?ZWO8Yi4oJTpJG0pW+oPV5SJUEWLFLDcE7JN8M/LnwRF0ksEodFn4iPKr553u?=
 =?us-ascii?Q?dZt39jO1l6obD1iMGMWqQWJXENDqaotmTKzh1UzAPAMqufN7Bez47Nvuriva?=
 =?us-ascii?Q?xs3ACV3yj1lkcoUKuXN1Oqk9edrterQd9jLZ0M5NNBEepiO0/y30Mo35gPeK?=
 =?us-ascii?Q?46iYh6uRdglL79fybTew/CR5HV0LS7FOnmujKYfb5mzkOJZMzcfO+aDDyqSN?=
 =?us-ascii?Q?gvUotcVrWc0t7Xd5UEEqPWi4M3EcS7vDK8k55HUi1LeqCohrYeZxl7ESQ2iI?=
 =?us-ascii?Q?2iIj73yKnRgZwjoQcbEalTFlLrZoGNSbwBgWmdvWGva/tNheuRWs2jo/QXOA?=
 =?us-ascii?Q?CQMbTaUDfhPGaUkNeDpiG5ckTRFheTn+IkkEDjl2VzhCdLbg3NaZlRaghpb8?=
 =?us-ascii?Q?tX7J5tbt6XI+SVsGrzOptD4Oy5a/V2spVW2nNoGYrU0VjC9BzIf838zHY0Yd?=
 =?us-ascii?Q?lBg3a8IwaeFQNrTN1CAadrnzut6PZBtXcergzsbH2RTCQ+7e+DZabPeQsKsn?=
 =?us-ascii?Q?kmXidJnI8h1qUjalCqxRSrKbB4lnJftD7zQ86CGNbkMCV+whF6HkBl08t+DS?=
 =?us-ascii?Q?zQmbhIaem8KRUykW0GrRLTIQZT165iPcEm5DWHWDjKKHHIAHZJCQb0LFx3Gw?=
 =?us-ascii?Q?lbnD/c/P2CWaaBrh1KO92OPtbUujWfI9gjczwS0qla2XgQXly8gBOzzHa9Lb?=
 =?us-ascii?Q?n5RtlBnQkUSEPa/lw8zDqkZIzUv5JE7EfzV/2KQ4wwo+bVIOuScWft5QKW6P?=
 =?us-ascii?Q?FCi+5jMBONG1ZrDZcIH1YVVmxX37Y7H2aTpTmqb8TtVTMFzW8sPk6L88hKze?=
 =?us-ascii?Q?AJBn7WHN2Bd0/QY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:52:07.3219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8c1efe-732b-4a70-3660-08dd6cc13798
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8044
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

Reviewed-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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

 drivers/gpu/drm/drm_atomic.c      |  3 +++
 drivers/gpu/drm/drm_atomic_uapi.c | 30 ++++++++++++++++++++++
 drivers/gpu/drm/drm_colorop.c     | 42 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 24 ++++++++++++++++++
 include/uapi/drm/amdgpu_drm.h     |  9 -------
 include/uapi/drm/drm_mode.h       | 32 ++++++++++++++++++++++-
 6 files changed, 130 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e67d7a68e8a8..5223cf363692 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -793,6 +793,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 		drm_printf(p, "\tcurve_1d_type=%s\n",
 			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
 		break;
+	case DRM_COLOROP_CTM_3X4:
+		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index e0b4b122ef6b..52c6a4dfbc47 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -703,6 +703,31 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	return 0;
 }
 
+static int drm_atomic_color_set_data_property(struct drm_colorop *colorop,
+					      struct drm_colorop_state *state,
+					      struct drm_property *property,
+					      uint64_t val)
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
+						 &state->data,
+						 val,
+						 size,
+						 elem_size,
+						 &replaced);
+}
 
 static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
@@ -712,6 +737,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop, state,
+							  property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -734,6 +762,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index a554c51fa7f5..8ab754f935e6 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
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
+				   "DATA", 0);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->data_property = prop;
+	drm_object_attach_property(&colorop->base,
+				   colorop->data_property,
+				   0);
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
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 7948de5c4994..d9149c320bac 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -99,6 +99,17 @@ struct drm_colorop_state {
 	 */
 	enum drm_colorop_curve_1d_type curve_1d_type;
 
+	/**
+	 * @data:
+	 *
+	 * Data blob for any TYPE that requires such a blob. The
+	 * interpretation of the blob is TYPE-specific.
+	 *
+	 * See the &drm_colorop_type documentation for how blob is laid
+	 * out.
+	 */
+	struct drm_property_blob *data;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -208,6 +219,17 @@ struct drm_colorop {
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
@@ -241,6 +263,8 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 
 int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 			      struct drm_plane *plane, u64 supported_tfs);
+int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+			     struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 25d5c6e90a99..96fabf9c9827 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1300,15 +1300,6 @@ struct drm_amdgpu_info_gpuvm_fault {
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
index ea6d88f683cd..651bdf48b766 100644
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
@@ -874,7 +888,23 @@ enum drm_colorop_type {
 	 * A 1D curve that is being applied to all color channels. The
 	 * curve is specified via the CURVE_1D_TYPE colorop property.
 	 */
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * enum string "3x4 Matrix"
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 *
+	 * The DATA blob is a float[12]:
+	 * out   matrix          in
+	 * | R |   | 0  1  2  3  |   | R |
+	 * | G | = | 4  5  6  7  | x | G |
+	 * | B |   | 8  9  10 12 |   | B |
+	 */
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.43.0

