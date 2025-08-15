Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE6FB2774D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24D210E9AA;
	Fri, 15 Aug 2025 03:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Rf0WQLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA5510E9AA;
 Fri, 15 Aug 2025 03:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJTUpZDBHPMhBn4L2qXzsaNu07LRsQz7GWnk++InBPyhQm/7pZ+mxd6bxgeCFcvYi0rMv+yjLlWl8P2avg3t/48qjYePLj2CRL0xlHqSFzqpEGO+w/ntltYXV1yaMp7mLzOqXz+5qzn9uKFj9lih6cUXx2jcvvt10Gkqox5FK7/sgq9FadsqkvPK20Zd2FvIHWjrRfk3DS33XR11M0ZxBEAzPDvEE70khDWhyznoQQRqRAvQTztGMV1Kw1lA5mUwOyvIrHOYxwvS2OKEIAkd4f9d56W/7yU2abwtb3hGBbF+BLPf8Q3gHWGFwSyAga0UiISzFMko+wn6Q4mu5H1aFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hrGP1L59moQUYeyrajHk+SCwTz3yiE7GpJ6ehmYS20=;
 b=bwLV42MBD0Omd4QZkqHyAxE12RYrgmTLx+gJAiUexAJ2poraepWpNccULLyZ8XhKNkErepyWlfuJG2yq8BZfdKzXvgBQiZDVfDGMe90dOlUFaUBGnqhUHKWrohe7bWOAZ2x7mAEL9N2TvNJiZ5RmB83F8UxOp6GnHDLEsInaWC5rNBLHu6HeF6nsHuBrHKo08c/2fMxRB2y/0QVfIj/qa0SkLLMieGCQ3Rfid0ssuFbvpDN8vOs5lEU3u6RAheNMhQ8Aau/X/T09Ml7tRmkIZBTzsQRi2k5r4nhX8dwSjEI7kJULIZ0ooP/3DiSxGAhQwb/x3LWUYt04R0kE0la84Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hrGP1L59moQUYeyrajHk+SCwTz3yiE7GpJ6ehmYS20=;
 b=4Rf0WQLNflv0TQGcGNOrO9dc3QpV1oa6Tkc4B7q4ZbLLvAZtlNSWTJwY1rnOOin1Z3RisS1Bcpkb4lb1OxfeFgSJBt0m8bu0f/SO2fFuZhl1JFmfSzP6twagiKSiDNxf+eut73mdbKMiAKQ4Yk38IUE88ulSOlBFp/3QdPmYlNQ=
Received: from CY5PR13CA0047.namprd13.prod.outlook.com (2603:10b6:930:11::29)
 by DM6PR12MB4316.namprd12.prod.outlook.com (2603:10b6:5:21a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 03:55:30 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:11:cafe::2c) by CY5PR13CA0047.outlook.office365.com
 (2603:10b6:930:11::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.4 via Frontend Transport; Fri,
 15 Aug 2025 03:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:55:29 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:55:26 -0500
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
 <mcanal@igalia.com>, <nfraprado@collabora.com>, Daniel Stone
 <daniels@collabora.com>
Subject: [PATCH V11 16/47] drm/colorop: Add 3x4 CTM type
Date: Thu, 14 Aug 2025 21:50:05 -0600
Message-ID: <20250815035047.3319284-17-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815035047.3319284-1-alex.hung@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|DM6PR12MB4316:EE_
X-MS-Office365-Filtering-Correlation-Id: e07b2dee-278f-4360-142e-08dddbaf93ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VlSqjmb0wYS0iapVmIydjbjWZQLVAEWEnozGA5R9A9vmwt1y2weRo4EtatDi?=
 =?us-ascii?Q?4t2wl/9iA9hJDTjCzyMmDdk69zahKR1mRqi7x+eqCD8jEguIU3lk7XgxaPvz?=
 =?us-ascii?Q?S5EZtEkdDO6St3bLpHkI1rePKgx1d979Z7IQXEhDcVhagKoR8bQqX5+JABx0?=
 =?us-ascii?Q?QmJxCCRbLV/fjJ97WMzLxXivKslQAng4XB/VonqKGJj6P2mpSG6Je5yDvw9p?=
 =?us-ascii?Q?R7XpGru/+hwL6YVRt13y64HTzuCtjHY1km0MtCDHD629rCiWQQhGy5MGbZ72?=
 =?us-ascii?Q?RhdEPcBD+phzjyylULJukENl10isOTYy9t6ALRK8A/SqCVdDvz9qosEbTcQ2?=
 =?us-ascii?Q?O86tKBxYlWhNYOfFJwnpBcunv1raUqyTVaikIq/UwHiN4045jVoOi6PFeUxG?=
 =?us-ascii?Q?ZXdtk9aXDRU0nX1gZwGbzyTy4oqMO80MieZxyWQqxfkO0t5EgOSBADZFwxkI?=
 =?us-ascii?Q?IoghrGeKq5B7UP2fI3ZFITec+ZRfdiysDfYyvghVlc0W6xamPlGufIrVUjaf?=
 =?us-ascii?Q?FtjgOdN2w7lqw9bkrCiWLg6CntlGbyciK593XmaIW/Vm739RgrgComt+8piI?=
 =?us-ascii?Q?9N1NQwaXNYCH7gEExN1UELB4IJismCk0JbCPUd1hXn0xbbqMGoajeBKA73nH?=
 =?us-ascii?Q?IjFeff/SoEvudzwyA8raEwROKCLUIRTqijbjOo75QzgSvOx7D7AcEeqnrpK9?=
 =?us-ascii?Q?f1PZycJ5WhUm+8lzJHsqrQZjCMQAnlqxGzV2TPHf02/Fh7D/X8erX7m1THJf?=
 =?us-ascii?Q?NNoT8LIRNE2OGvSDgBu26Wg08fON11pnjbraB0mxz7zFkVsjAXDRlLbDr8q7?=
 =?us-ascii?Q?aI3qdvIgY8VFQrcIZhMtBtX1ysGMfjwGw3ShDXbOa24nJV0z7dhFjlivr/Ne?=
 =?us-ascii?Q?sQdN4ZjqG31ZglH7ppQuWHiEny/eKDrLEbDI6o4sdc4lJJksfmrbnRV6o5AG?=
 =?us-ascii?Q?O4b8IBue3oy1YM7TFUogUkfvclX5zqWjNMAFl8Cksmh59tD5nGcAFaRenka5?=
 =?us-ascii?Q?zPegXhrqRQX3GKxaF+Ql3W+t852zphCi0neU1Zh9QeiPZIl7nuVZSOVj1qk3?=
 =?us-ascii?Q?lDSxUqx5DBONF32Iko68l/WtQ6le+/3UsNqkJ7gr0aaHty8Pxd0Uaf1cmOal?=
 =?us-ascii?Q?DvhNJY6xdUZuGQssCfYnyW/Z55o1jZ/gBnnV0+Pz6NiI1hfTizSviaURKH3G?=
 =?us-ascii?Q?L3KUxMnCWDY6Kp44JDwaPnd972F6KJvUIJf1Y2mTXYObc/ZgjvXSVNjX3AAH?=
 =?us-ascii?Q?Xtm2UUN2Vkw1omiPQlxExthQ1anjr+0TbKTzrcWUBxYToC73Z+kCq6evAu5r?=
 =?us-ascii?Q?M/aCEbp8zGGRShVJOUZiXtomZvYz0AM6jCzqAMWg3f1wUYGllB1c3zcg6IV9?=
 =?us-ascii?Q?/VRS3z8Hy50ufa6m5NvnTbgSIAwQ0Fzz7verenVOJAHC2FvHaFGg+Yke6pj6?=
 =?us-ascii?Q?HKiD2xvZfeDD8KU7NXc6GkDkta3locGrI/wKj/6URuR0YRFFKX6S3nxnvSz3?=
 =?us-ascii?Q?Rqi/VJoJfsJY0MaHv2J6u4JssytPci0wPkJF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:55:29.8950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e07b2dee-278f-4360-142e-08dddbaf93ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4316
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
index 3bb964e378eb..1f47949aa10b 100644
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
index 97eeb8aa3677..775e51f3ee06 100644
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
index 6930d39c8ad3..2d66b9a234ab 100644
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
 
@@ -237,11 +243,51 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
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
 
@@ -323,6 +369,7 @@ void drm_colorop_reset(struct drm_colorop *colorop)
 
 static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_1D_CURVE] = "1D Curve",
+	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 };
 
 const char *drm_get_colorop_type_name(enum drm_colorop_type type)
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 0ea1a01ca04e..6e810cb3f8bf 100644
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
@@ -243,6 +265,8 @@ void drm_colorop_pipeline_destroy(struct drm_device *dev);
 
 int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
 				    struct drm_plane *plane, u64 supported_tfs);
+int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
+				   struct drm_plane *plane);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index bdedbaccf776..3d9c11b6386a 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -1619,15 +1619,6 @@ struct drm_amdgpu_info_uq_metadata {
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
index 1c84384b5e8f..f309d2863180 100644
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

