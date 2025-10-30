Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B63C1E425
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 04:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD10110E911;
	Thu, 30 Oct 2025 03:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gD45iHaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D351A10E909;
 Thu, 30 Oct 2025 03:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ak3irPuUrQSWTqeRlMotxfibMHd8mmhfFYWDQPdwPPzqP8MhNFYJesrpIdeqJBZMgJPFRaDCauJKn5UvLnNAWa0sSwAbjVWHf0U/9eK0ByznYr288WL7tWC/96HnZQ42C7MeKPVfBnKC+8b68n5PqozNsPRBVnShOYsv3d46ppqdx97PZYpusemr7bJuCjnsIQnO9BN0CNRbvecLVUjDT+PVI/nCPFQ5oHGwq9+Y/ikiCrv+afqO5rhxkTtAOok0C1BtsRof/udxPPo87/vLEpMadY+qk7KiBa8c8j7sFIIl3+iVCKW/Wj3ugNI17QctUoS6DhUAMIUx5Xanquj/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=13vWFWppddHyMe8zWi/KdN5Z99Qyn/AkhNVZtTpZKrI=;
 b=DbyVjBh8Z/+vgu2Gv85oRAjeMX1ILZL26C8qJQth729DgmAND1IvAE5+f5F8uPZhN2jrTDwiDzuOgLFnyTjFOu/szNJyM6yb1u1IPighwuzk6y6rkKJbsEV15Bziz75q6utNTvOAOLVzC+HR83Y2eWaqAZOUUgclZkFkUSueUhUiGbTONJZg+KiNChVU2ne4/hUmdJ7Xlw4vmHLeMt3cYfU2t6g8SLtrX55He6VqN2hH5mgbE33WkKWlKVSqi6O0EI14KKwLlbs79wVZ0HmX4cje9xcmFwodyNETgEdjM3tbX2dhMOvJts8ifI423L0o6YpXeLzLrxieuPOyDVVeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=13vWFWppddHyMe8zWi/KdN5Z99Qyn/AkhNVZtTpZKrI=;
 b=gD45iHaf/exoS7jgOqzyu49yU7Gq3fxwaaw8RjhW5jACVooqzkg4ORSreKvA3T2a0KnRifmNMRhWwCYyLSFXyzV9olTnpdjR23UVQblLiLcxc8LUVFE82wN1bw2RbhB09w5OJEfR4XXhLxVagroLfG8CU9ijIGMAkUKlVhViH4M=
Received: from BN0PR04CA0028.namprd04.prod.outlook.com (2603:10b6:408:ee::33)
 by BL4PR12MB9534.namprd12.prod.outlook.com (2603:10b6:208:58f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 03:48:45 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:ee:cafe::b0) by BN0PR04CA0028.outlook.office365.com
 (2603:10b6:408:ee::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Thu,
 30 Oct 2025 03:48:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 03:48:45 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 20:48:41 -0700
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
Subject: [PATCH V12 16/49] drm/colorop: Add 3x4 CTM type
Date: Wed, 29 Oct 2025 21:42:21 -0600
Message-ID: <20251030034349.2309829-17-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|BL4PR12MB9534:EE_
X-MS-Office365-Filtering-Correlation-Id: e5963b71-1b65-4ce4-0d50-08de176739cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PVt+rQOe9iipWoWHKdhZ4/Ql84YvPeSnC6Z9GY0pn1UkJDpI8WQ7bH3K1qCH?=
 =?us-ascii?Q?ZRWR+fjGGQaXyXMtCHT2s8iEG4g3amcQ2psL+Lxs+XBdVF3sFvGN7jCv7wnZ?=
 =?us-ascii?Q?1SBKhe6CJPAyReNXWHQ/a5yTnxDZ7fX/12fw953jnFL+6UBJT1LGENcuCgk/?=
 =?us-ascii?Q?lvXM+7Zrvt6JFR+pFeLBEdef3qMgT0fs01s/s8paZ1Ek4c2g+HMnJw1NTrrf?=
 =?us-ascii?Q?ZdLvECbqCbeOhQ9Zn+FM5hi2MxXTRJUJ3E1tf7Fmqa7U3ngEug9MZOilmEZT?=
 =?us-ascii?Q?G3LFn/bf7nb+3RN01d/Wfq0sNvdymopZzcC4UDP1b3b0Ud7gWOcxznNxKvyT?=
 =?us-ascii?Q?pMKpar548Es1eeq0nw++jp7TtGILCRUqUf+C31Hx5+YRgyj6fQuqq1tuxWos?=
 =?us-ascii?Q?A8u92VkTGBdjY/TMQbLGx3WoJbE5DXy5PMa4iVib5/bveyY895qv3VplObOa?=
 =?us-ascii?Q?1x9/yPmn84TNj4NQGCAK5byMR4MfVdxNX/KeLx5ORCUtl/VmBIpbQ8ChdzqH?=
 =?us-ascii?Q?kh54DciENJqBWDNDhK4mYiax9Bu6F4/F/AkTrFRzt7aU3UkOlm9fHPkIqBRl?=
 =?us-ascii?Q?suFA163m+TxaOE6BzN3nZoZVC3S1AF2v7HTF551HX1dTizGkWZyLVrpIGq+8?=
 =?us-ascii?Q?CNCrY6KU/Gi161tI3C9r7eM84VBp+ZNzEvUNcKZEucG7z5dkZxDt10yuyOUT?=
 =?us-ascii?Q?mE8JMH54RN8J36Epyi47q0JujDZvMfdnlrwD1JJ8nawaR3xgN5YYmYGM80xa?=
 =?us-ascii?Q?jpnskOXplWP7m13pKnFi6JnlzJP82TcWP5a2cGtZJkffFs+ou+1SuhBSW4eP?=
 =?us-ascii?Q?ZU3yJ3rTp3soGFfs+dPOWjHlszqzvZt47RqFH9pH7YnzaZkjeP1KnYf+VOgY?=
 =?us-ascii?Q?Uh/9pBBZna/IA+2FIb8CZX0K89oGHe53Trs+uk637Ev6OKc4tBOcj3QTX6Ug?=
 =?us-ascii?Q?Xgb38VwnNyAD1sSI+CQySbB6JkrThHrCPG1weyK0jiemVaT83wXgx5oJ2PJ/?=
 =?us-ascii?Q?GohDz0ZulvWHHPZsHPapeTB1t71p+USDlTAXGmnDZmnm6p+DP+j2Fa69c6qt?=
 =?us-ascii?Q?4DviZw2iRLiAdCAv92EWKd15BF4g7aYvbU+5rwiUiG5RY8LG9PEuWZFD8sLP?=
 =?us-ascii?Q?flTgvF8glTL+0cIqe7lYoWiXm/CmiE3WR+6y1mlCHlqKlp8rRJH9yz2ad78e?=
 =?us-ascii?Q?cY2mSWc4Ph7sqmSlAjmGglsL2EDguC4G+KmH06YMeiHrfdb/rRzNGJHSOpvn?=
 =?us-ascii?Q?hyG92+9PmM977Easzz0kQmmb3EXlKfyRWuSJFIxcTcCCe6CN3+iaJ3OLAGXT?=
 =?us-ascii?Q?uoYqk/SDyguDubPrpvRhcuz+ur2yw5OHIYSd2eKwY0RDtPt7/MMOZqBrVJJn?=
 =?us-ascii?Q?ARogAdJkzuDeCRFLmGpkjowwuP9DjoIaoDHOxbFpJUqpPmt9eaTUZPCunntG?=
 =?us-ascii?Q?eBQIJXv4d1rUGDyJYTqsIwZ4UOzBEzr4OSMW2x3yqTT6t3WvN3kI/qckhmsK?=
 =?us-ascii?Q?dVBNjAwBksQvLYbG+2j01ka8F5WTT7L8OB/GAB6h2xr+mNZvwtrRj80s9gGV?=
 =?us-ascii?Q?p4s53B/F1nmXUUj5NhA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 03:48:45.1698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5963b71-1b65-4ce4-0d50-08de176739cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9534
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
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
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
index a210c2b6c5cd..c5663b74e9d0 100644
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
index ad5c4d726ac8..ba4327fc0a87 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -687,6 +687,31 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
@@ -696,6 +721,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop, state,
+							  property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -718,6 +746,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = state->bypass;
 	} else if (property == colorop->curve_1d_type_property) {
 		*val = state->curve_1d_type;
+	} else if (property == colorop->data_property) {
+		*val = (state->data) ? state->data->base.id : 0;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 182468eb2897..aca02ca05785 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -64,6 +64,7 @@
 
 static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
+	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -148,6 +149,11 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
 	list_del(&colorop->head);
 	config->num_colorop--;
 
+	if (colorop->state && colorop->state->data) {
+		drm_property_blob_put(colorop->state->data);
+		colorop->state->data = NULL;
+	}
+
 	kfree(colorop->state);
 }
 EXPORT_SYMBOL(drm_colorop_cleanup);
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
index 2c6b761fd182..1c313257cc89 100644
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
@@ -244,6 +266,8 @@ void drm_colorop_cleanup(struct drm_colorop *colorop);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
+int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 406a42be429b..f80aa4c9d88f 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1656,15 +1656,6 @@ struct drm_amdgpu_info_uq_metadata {
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
index c419f93eb94d..054561022953 100644
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

