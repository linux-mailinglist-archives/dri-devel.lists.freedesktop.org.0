Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48124C5FAC5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D19610EBEF;
	Sat, 15 Nov 2025 00:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r6HkZoLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F0410EBEF;
 Sat, 15 Nov 2025 00:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFdFpxSPQCLWnLXGc1ZriOVnDVWGsXSyjPrQeadlbEXN2z8sN6KD3irgjkdyO68bbr4wHHzqnN34oGnmsGD/Rd0b+DrjJb8+bs5Xrza522Z331V5cYHZmOL0kHXJd1udFPKR1sIXuUG4HgePd/bUBL+yWLkXaVCgNMvhUyWFZZnvPxMvOw9WEJXdZKtK3RQAIgHC0YHFHYtFBk1DvX2QP0GX0+tMXIgQauKphvl6VE5+oXbdvRANpVBM7ehjh3hXw1/yiVNbo+DpULfgeoQObNiTuHP0riodFdmw6sDm1vZGVQH1PrLac2BhZq6VJi9A7vxZRs6Vv/QLtWE/hnnqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A945RPTcaxGnxKYI9HC1qnZh6W5vebN4dVJ4bmRdCOo=;
 b=ETrhwsLbGVjIvSl0m0/jqTx39y6o7ezgMOjlw7d//fe5omWrUQA3hlyJKmAhAGX1SNheOwNNSgclo+caeQU+eNj/hOatTdTuN+Cisy9MAm56ToK8dcu1Rqdr0nlmm3lEOGJa8FikGJfV87X9wpQJreE9lzmMDeqXKsxkmkVKNRvZ0T224L2iSo0ZxNx9FFbJfthZilSnD2wIFufYEBExnZbU5tRZ6J60q5Sd0EgVV0R2C8Ww26nCyJax8nl4gtBymWWmHKcnDgudUKhVxXsZ0afzOG1poryGtQDScgvGFazCsHD5n5I7+KeN+mtI6AxBmueoAkzo82IQ0sAtB2ONtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A945RPTcaxGnxKYI9HC1qnZh6W5vebN4dVJ4bmRdCOo=;
 b=r6HkZoLKxN1RSaA2ZArf8oFrD/SpsN28GJWz6OIq+rrB6Kdeh36OT4LH+oXHCf1uAOxO1jvwjTIS0to2/1zciXwxPfDVab9mMJr51cocznDMQDouSeSt8m4Q9Mi3GKl0AMQchrqYy+xWoHGy3L/gqmmTwhc04xub6M2HgStXzDg=
Received: from BY5PR03CA0006.namprd03.prod.outlook.com (2603:10b6:a03:1e0::16)
 by DM4PR12MB9734.namprd12.prod.outlook.com (2603:10b6:8:225::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 00:08:05 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::5b) by BY5PR03CA0006.outlook.office365.com
 (2603:10b6:a03:1e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Sat,
 15 Nov 2025 00:08:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:08:05 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:08:01 -0800
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
Subject: [PATCH V13 18/51] drm/colorop: Add 3x4 CTM type
Date: Fri, 14 Nov 2025 17:01:43 -0700
Message-ID: <20251115000237.3561250-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115000237.3561250-1-alex.hung@amd.com>
References: <20251115000237.3561250-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|DM4PR12MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9cb27d-68fb-4eac-2ab9-08de23db0cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZyuRJ2I6d6sdovxQ3F0DhqjpyEzHrMvOJRt04BEUGcdTaz+3/KxtWqO6vl3H?=
 =?us-ascii?Q?JrmS5SGz/B6JXgoiNDUIpRM33aq3SZDAf9zzlYNTyGw8SEiGuPZ9pvu/Re7n?=
 =?us-ascii?Q?Hg/Ur36zBRjJtYTjtY7zgqRMrFXerCgb6+g7hFiMBCs5ZP9puW3bcu2/Fom9?=
 =?us-ascii?Q?HlJ2x0vwbQ3GaByyYJ+zvAxvr5l+f9UNtNTs2IKs9Tazg4wZerHB0Wu84/1Y?=
 =?us-ascii?Q?ygdaoEc/2ft2GXDaqKA+5heUHTT0PnBRNWuPsdKPIFkJ7YcdC/rmKmQVTeAT?=
 =?us-ascii?Q?n4rQzjDyoeM9QpixlqZ6amtc+b3JC0ddpOYGpUGoDQv1pWEKnb9ePHqFl8wM?=
 =?us-ascii?Q?1cHEMtvvM5RanJp9Jq9kJKEAA/0x+RCG3on115vx70dkhsK5/Apx6dSIZQRx?=
 =?us-ascii?Q?9oyo3L0C+A675QsmlS4beuE/p7oGI57hUMjHgwNRzOzvPQ6xy+O7zpMb9lSq?=
 =?us-ascii?Q?zM9XOKooXisUsVGL95gPLrVOjgu7lmvmEQtemI4lNbmbOczlrJc24imiUkrr?=
 =?us-ascii?Q?4p6ScUv66zLtvgmb78WzHSFSlSGlLzDOO6tuIru/6Xcjefg/Fl9uYr9N7XmM?=
 =?us-ascii?Q?bIpACFqeHfPEPmnYyC1EAFqg+v4wOeHTzREL1gZ1H4mxusJZnoDy+c7XloZK?=
 =?us-ascii?Q?lVLam8CLiDwgRXwldjqcRQEAyi81SRvrbb6OHqa3pwieKz+RfDSwpMspaY2O?=
 =?us-ascii?Q?vr1uknv1F0Hy6mG97j5QwHHFY6Wd1QKLaTy9yoSsyo8H6rjjaU4BekKmyadq?=
 =?us-ascii?Q?EN+7Wlrxdv9wNHAT0u9ylIYTcXhpRSrdC4gr5UxCepF3/pIxt/BT0uaqJufZ?=
 =?us-ascii?Q?KS9aou9px6T/xY0c2utFbdjY+RF/qRMPU3ClxWyrtpMSK4WUri0K6yhbWsLz?=
 =?us-ascii?Q?NEdNNBaskwsnbTLNroigG2U3c2vs/TXnKOovCmDZQfGnwQ44yhQM/cJGpiHF?=
 =?us-ascii?Q?9EHauMxf42uGa4vxer7JPfpUgf+F2Qn0meYTNjNMb6UuGtygA712DT2X23jb?=
 =?us-ascii?Q?r5HnJfnc9Yxxe6/lXSoH+TgXTagWoWZUbh61tEuT/6vLN+MDPH+CVZhfDVbz?=
 =?us-ascii?Q?U3FCeacrt3SgHg2XAP5sPzylOU/5lt7LWdl7QTkbLIIuHOFw6Ta0IUJ40+ad?=
 =?us-ascii?Q?Jr+AorFNae3TNRG0vsgAIjrHzgsJZvQ7zxMp6XxOZGDSil6Stf6yRWUJuxvw?=
 =?us-ascii?Q?6lTOF2p4Eg8R3ucdtWS9wegYkEm5SghttP1u5VXXj3q05NUufzIfUqSctLMZ?=
 =?us-ascii?Q?6XgfQzavEsYgef8pS0y1jJ+T13fKF38fmvRqKawxOpP6uTzDkP3By1FthBO1?=
 =?us-ascii?Q?MUnnCmlxWWfmfqOL0iq3D/U6Am0am5f9yqgQBHl8cAEVKRa0dk9Dag54BtQ6?=
 =?us-ascii?Q?chEnl1P1JcIhIjtorTZf3f7/HuUnsvXDe7Gxxmdu6ICdM2oyaVlE+cfUB7UI?=
 =?us-ascii?Q?qou9cfxilHJjYHEymgRF78IU2+OHkRBv+bUJVWmAnCuUkiEcmJVtZ8DOEDdE?=
 =?us-ascii?Q?67FXcz/bYAWOPKBtg2kdj1A6/IB8CPYQj5Ixx6NcabXY9IMIoKNnC7eTunDJ?=
 =?us-ascii?Q?7TchtbJVXHbTdLA0s8w=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:08:05.2344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9cb27d-68fb-4eac-2ab9-08de23db0cdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9734
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
index 2ddf1265d971..334f791af14c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -797,6 +797,9 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
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
index 3c183ba047ae..e502f6becbb4 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -691,6 +691,31 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
@@ -700,6 +725,9 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		state->bypass = val;
 	} else if (property == colorop->curve_1d_type_property) {
 		state->curve_1d_type = val;
+	} else if (property == colorop->data_property) {
+		return drm_atomic_color_set_data_property(colorop, state,
+							  property, val);
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
@@ -722,6 +750,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
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

