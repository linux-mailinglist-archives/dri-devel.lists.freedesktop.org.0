Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5A3AA4044
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 03:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA93810E622;
	Wed, 30 Apr 2025 01:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cjbP0vr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDAF10E611;
 Wed, 30 Apr 2025 01:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVurMndq/nNdsIAGk9DZlEalyxnQy2hc6M0d3aRd25BocYEs1J/wnOKZlv+QQ9sHP8ym6ycLz2RzBP7Cz2DSdBO/DrzRu/3jqBxkvIyxYZMtd+DtLln3Z/tY61huBuLFXhX88+6xt15jIvvStI9j8yuHk0a5NEoHnssYQ66VAT+zZZ1vZtNHvrPf1aSiOcXyw6DiF7dSnOCquMwl23RZs/YmwUIvHgQKekp78HsEjsLUhg1pQIwq86sBHT+eTLbAuMOfadWYDlj5gV2n5qY2IAVpvYPxJ437pAn3VwhyWjq9KjUEQKSZKxSbWsLm3wZu0LIjPkQWRDMUwGiD8LrRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHtcWFvF8LIWRLCJuyLWxRVO0UqimeaT/ek7sDNJtIY=;
 b=YboomNz8MGWKZPfaGRb72vf8FS4Vjm/MU8NltpcNVM5iNKxp0QNk7DyqL1SzsQ7M2EskLu+8QxwwC977DGKHYfb4s81AfSAJ5r49UdZMpKca27h0ND8ic3FEPKsuLquyo9+yX+Md40o0blxyd5DMPxFde0uNpbUp35sbvTlTsVAAlH23B//3KZdqO7bZCN9aX+qXsL2d0vmL0XPyUQCF6TAnO0HOx5eUvxGUtI6TAwWN9lmc5dGCnZ6bXejO5IUL9Uw36EPa058LNM9kNvqTXZbmU31OsZh1l7oEFzTv0mpD0EvwGZHaAMC2iAGIWJjHBnss4/G8mqiqqIpsR06TzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHtcWFvF8LIWRLCJuyLWxRVO0UqimeaT/ek7sDNJtIY=;
 b=cjbP0vr8U8J4HwKG2kiif0DReJXyDPdmw73mmBHqHUhdvs9GsHAoTwbFwtEjNaBq5rXFRpEwUGAp1iEau5ckBqxy+Jg30J39l5L4Dl+5iZZp102zTBCaUO5pvviz9umzEKuMBc4nHtLD9f9bSkE+xocietWgO/pVlLaFqJbSbas=
Received: from MW4PR04CA0134.namprd04.prod.outlook.com (2603:10b6:303:84::19)
 by CY1PR12MB9649.namprd12.prod.outlook.com (2603:10b6:930:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:15:51 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::9f) by MW4PR04CA0134.outlook.office365.com
 (2603:10b6:303:84::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:15:51 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:15:47 -0500
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
 <chaitanya.kumar.borah@intel.com>, <louis.chauvet@bootlin.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
Date: Tue, 29 Apr 2025 19:10:46 -0600
Message-ID: <20250430011115.223996-17-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430011115.223996-1-alex.hung@amd.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|CY1PR12MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: b39bdd95-fdad-468e-ddfe-08dd87848c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8ws85acuYthSiuucgUgisrtiR9ryFhcv130oUnr/+RDSlOf5fSjP4u7bCUR0?=
 =?us-ascii?Q?Qjp/WYZ+VwyP7cPu7rIn1GORYIs0cKKJzilwn1V1Keh7oZsryQgPEfCTKUQ2?=
 =?us-ascii?Q?BI7Sqg66Rrxb2jcwqVmTK9IwXuKH3PcT7G6SWJw15JSq/qiWMyyWjchUx9qk?=
 =?us-ascii?Q?CZ3cktCnhZwAAfkPP/BD/Wvaq/ivNhRPh9nAxhVdNb35yyQLm6zN7hii1GuJ?=
 =?us-ascii?Q?Xer882ZN2pWQWLjSyQhGAF7Wlr0gfJkOL6HjtXozeYkE6MFg7B7m7RekXrbT?=
 =?us-ascii?Q?iSv5ZeOD0he/Kva8Wkw3kdcWbMJpN9MtgC9zmj1lZV+K849IGCV/c15Jsm6R?=
 =?us-ascii?Q?zpLqACHHn3YZc4OqvKm3F/ffQyIFG1M+ckl0EbNhhsZehBm0x/gvDZcacqR8?=
 =?us-ascii?Q?Kgb8EfiWgOSazOcfg+9rqDw8tpBNJcN1YBwZkTpOn9UIU6cBz0FXtIDi4HG3?=
 =?us-ascii?Q?PC17ZZhVJh8y11rqWQNu77HZzDNT7M2Rjavdwax51oM2slIo2+Qz3mPgg61Y?=
 =?us-ascii?Q?xdbipABQgf5XlFWXzhwgEtkyZkhJvKyMNBDTng64izd/6fNPtxk1MXypHjll?=
 =?us-ascii?Q?GXWUvZyOVvn2w2B/gc44FdT1HqbuAds/c0wJAjCxG+Qum/w+Wnhn3gA6UOCB?=
 =?us-ascii?Q?J4/W4/5uTTkWZnd+du8QbmObXllXxjdP56EGo0NE2eyZpu9AZsWOsJfLZaso?=
 =?us-ascii?Q?GGaJWKCbzBuW7a7x4kGdnzxq1MBO6RstcfdoiisXDTbWN3NKOCn9I1y71Xnz?=
 =?us-ascii?Q?0VEVGF0cgT+VnMjXW2k8lYu/CjauVQjSCVo4hfWJJG/88vGuhqmLBqSpTeW8?=
 =?us-ascii?Q?LcGcvXmQc4q+Ng+NP0BJSr7pxe/jmQoZSZ2K5oybtQ4BmV06EG+ZJOKNxKni?=
 =?us-ascii?Q?keR8oZ193TQnyWiSjd9f5stir1krJCQmCVsVf5UD3GJvTj9sE7bJ6FdUML39?=
 =?us-ascii?Q?PttPse39irC2hhCPZp+CF13ywOaoFiVPXDSElYKKEZMGYBwVnHYBFT/3odmC?=
 =?us-ascii?Q?U/piqbdfZ59sSxEW6WI/KbxNBwHFHKHWIzOLzxK/0AfXMNZm/uRRJAjfj6Mx?=
 =?us-ascii?Q?sxjrgfSWjDIZnxPx9r19I7L2qmSNLVVmv9yVrY4Nk4OiEZToDz9P6xubb8gT?=
 =?us-ascii?Q?sgW8aIAUxv8zktlZB2Vp6LVxce9cASzEArWdAsw0X08t7E+cO54dIfLJEq8e?=
 =?us-ascii?Q?jjIiNVmCHWobWpKtGeIK2vIX2jyqbpKuDKxbqmqflYqqUcfd+JBVepW3KVdV?=
 =?us-ascii?Q?1PtzdlRwz6w4Xk6xwkkeKLo4tKu1wybHSVWsK5aZjRQtFdbR0KGt2d9KC+ag?=
 =?us-ascii?Q?uwD4yrJZ9RCPeiC43YIDertYT0y8QjZ/JhEzcPx/WUJZzLl0z7ieiDSYmCUn?=
 =?us-ascii?Q?IhxuK77Ig07IzOLtyXOOUzPkkSHlfVGVvSmFLev312prw4YYAA1i9oUPvrjB?=
 =?us-ascii?Q?PFD4gjVUev3xjMpOos1GqG2PkNTGv8dDtgNJH4da0fs++RrD5fKcDFU/CmpM?=
 =?us-ascii?Q?dwB/0JjLkMg457MJouEdkdyyl/WhBy9Wbwtm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:15:51.8242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b39bdd95-fdad-468e-ddfe-08dd87848c7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9649
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
---
v9:
 - Merge cleanup code for colorop->state->data in drm_colorop_cleanup (Simon Ser)
 - Update function names by _plane_ (Chaitanya Kumar Borah)

v6:
 - take ref for DATA blob in duplicate_state func (Xaver Hugl)

v5:
 - Add function signature for init (Sebastian)
 - Fix kernel-doc

v4:
 - Create helper function for creating 3x4 CTM colorop
 - Fix CTM indexes in comment (Pekka)

 drivers/gpu/drm/drm_atomic.c      |  3 ++
 drivers/gpu/drm/drm_atomic_uapi.c | 30 ++++++++++++++++++++
 drivers/gpu/drm/drm_colorop.c     | 47 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 24 ++++++++++++++++
 include/uapi/drm/amdgpu_drm.h     |  9 ------
 include/uapi/drm/drm_mode.h       | 32 ++++++++++++++++++++-
 6 files changed, 135 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 7b042c38d50d..809bd856d378 100644
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
index c0bcaec249de..be73cb9f502e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -702,6 +702,31 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
@@ -711,6 +736,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop, state,
+							  property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -733,6 +761,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 57a8c1063fdd..65351aaa7771 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -148,6 +149,11 @@ static void drm_colorop_cleanup(struct drm_colorop *colorop)
 	list_del(&colorop->head);
 	config->num_colorop--;
 
+	if (colorop->state && colorop->state->data) {
+		drm_property_blob_put(colorop->state->data);
+		colorop->state->data = NULL;
+	}
+
 	kfree(colorop->state);
 }
 
@@ -238,11 +244,51 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
 }
 EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
 
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
+int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane)
+{
+	int ret;
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, DRM_COLOROP_CTM_3X4);
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
+EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
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
 
@@ -324,6 +370,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 8e4d79ba1eff..5f0cddc3922f 100644
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
@@ -243,6 +265,8 @@ void drm_colorop_pipeline_destroy(struct drm_plane *plane);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
+int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane);
 
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

