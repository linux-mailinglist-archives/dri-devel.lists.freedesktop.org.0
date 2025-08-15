Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2929B2773C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 05:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B881B10E94E;
	Fri, 15 Aug 2025 03:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="34JKCZo/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8116510E91E;
 Fri, 15 Aug 2025 03:54:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=am0/3lu7w87vtpRRnaVwQR4MCvhYRTRdJ5/9OrXCXnwjJX/3hLSOct3+aMccqsFf4KtXtt+/QGTUDanMMEC+olAhxnRb/7rOVg4k4WgUJLLbChNnHcgpEjkYStymTzK+MNCQsbsZ+wHeIKDvt2eKrVMJl15Q/CYIiUmtzH55cqwadi69tNz+mkev90xjybK/wUY2hNsauBUA4CQVdd3BOgbOPPZfvL8WuAlcS3iO6O3lt6TE/wqgKa8EfXPn/uqpweglGlTT3vQwR/Be0m4inxtwcqM3EqZFpxQWyIUeDEaiLKnvVDxwCbZ2cSEaqdyEzcNmC1+ReTBilmn9OgwDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a841jznSvJK09WN82jypoDlT6bb867g5vAfcjYWC4cY=;
 b=GXaVsQ3DqIVVhkFBYt1jugURcXLsBkMV/zpXBVOndy5pPCCXGDGGI2yFTvyEjxYZ3K6Fw6PPWrVDeqDNtkUf/QFZ+lgznaraLQA2kotY1fHOc7Bn6CwvIhlsgOS4xk5M3f47iKI0utlqJyb/kOD2c00hzbaxGR8360xLtSAVZNcEs4bTKEH/1EkrZ+brBoWvoKm4DOrgDVniaH3bKru2NeVju6COkmbfpf9thCeA2DBZ6DLXO+25wF0zj180W94vf+2mxgEiAkk4o7tRZAl0aS0jo91onRXNW/1q5YwKUPMjtcy+aftJqGtHDusPnb5B8txeYm01sEIL9YHWN+ncIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a841jznSvJK09WN82jypoDlT6bb867g5vAfcjYWC4cY=;
 b=34JKCZo/Ob84JqYQdOOGJQ9jwo/tYWX5WzrNVHiNbbn6VvImMcbGTC8ZcesRuUwlX9r1f46MW+fl5lolnrsI+7HdkLx42O+MNrOWxny6/3V3Z9YxvmHOubdiuLTQtG1haEEZygXqhS8UGBJ7DWTPGxkr/HxZ8SQqlZzmzaBRPmA=
Received: from BYAPR07CA0040.namprd07.prod.outlook.com (2603:10b6:a03:60::17)
 by CH3PR12MB9078.namprd12.prod.outlook.com (2603:10b6:610:196::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 03:54:07 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::6d) by BYAPR07CA0040.outlook.office365.com
 (2603:10b6:a03:60::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 03:54:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 03:54:07 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 22:53:59 -0500
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
Subject: [PATCH V11 10/47] drm/plane: Add COLOR PIPELINE property
Date: Thu, 14 Aug 2025 21:49:59 -0600
Message-ID: <20250815035047.3319284-11-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|CH3PR12MB9078:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c338b4-9eb0-4d1a-d857-08dddbaf6245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VvC1LOPqzY7iv6ZPDTm/D1c6uEANfIDdthjLxUELZXVcDhuDFP+4ddZvD2QJ?=
 =?us-ascii?Q?FSLgs2B0V5yvu49du85hslyMrg5TpzT++Y6bdVpqBG0TZQQlivfUICXAnqpi?=
 =?us-ascii?Q?qxv51sKmP+KnaUFK3/SBj+SS0R/t04JwL2gsBhiEK6+zBnNBdxCzFVKaAMTO?=
 =?us-ascii?Q?eqseinKZ67+ijuGnA4zk3XO0gL5kPdBfTJJ1mbPXSBwHF8s3QXUP8BfkptFp?=
 =?us-ascii?Q?lAKIHFzjfu40W+rh6iRmc3G572lC4K0txg8EC4RFGKuy6HGlNsjWuyOoHokQ?=
 =?us-ascii?Q?FW51UH40v4luehGw+H1KcjyD3K+ZZApBbekRivG5r3SKbXFY9i9A+LrPxBUr?=
 =?us-ascii?Q?BIKGLAqCUBF2AqQvMcMTAAwtr7tEDwo7xyJqoGaMBA8oyHGg4bq46OEbjwRG?=
 =?us-ascii?Q?YKMjKs39ZVASOxMnYoQANnZngoBH/uOaI3zhO8Uglea1iZ80chOvdq6sRZCm?=
 =?us-ascii?Q?XqhdYpgY+X5C5TlyiwAjtxPXdRG8iJY8xjYggKCDpL3ljAelKlNxg/AZyn5/?=
 =?us-ascii?Q?sRHsEwk82Un3mHFNcbckwbw9+S72J4Iu6x6tz7DJWhUykPovElDqsTA+Wnjh?=
 =?us-ascii?Q?yVGKZFIfGkKDLoUlQa2eVY6q1t0fsfEtuZ8tyfbMqZcjR2frImQuD+dKCC2n?=
 =?us-ascii?Q?BMFidR9XvHrJZrxJiVBWbvFrKGsWIoT3+VVz6kfyxcH8l/SG98Z+MZgUq2Aw?=
 =?us-ascii?Q?mGZLHBm9W7CPPQ1mrH5hz2/ZTc3WJWJ2lI16gxWBI+OWGQkfO2pr8IYZh62w?=
 =?us-ascii?Q?ALmgMNUhuwIRv2ZVZ+Sl66q8wvtQTb3Oe7BvnoidJBg5EYY1dcfJU6xp/KaD?=
 =?us-ascii?Q?Kymj54CgunfpVZJXxoSQJ5bIIxf+MGDltqDTlM4KL0LAxEWbcvCX0Sx6Wl7V?=
 =?us-ascii?Q?qPNe03L4AhIFTsZRI1aT8EXOmS/tFSEamKXWueHOEy/cOupkVA+6d/ItMzv5?=
 =?us-ascii?Q?7PAWiXxbCjNIXJ60T2pPoyPkoXaaEsjtHmD2vxIbCU7WeSo0zNIFDT1H6Bhd?=
 =?us-ascii?Q?tFjNExSDw0zj153JmlhJZtM9coFDEWYkF0pRW3rK7uxkXZNxJw/dluC8iA9q?=
 =?us-ascii?Q?JOtaqKpAOldtHHwAXdGUsx8kY8YAA3PlVG83C9hI6dFgsfkVt09/stEQiQUR?=
 =?us-ascii?Q?hFL+aIcFPDCkPZBDdGslAmhTIppfUPAVdEk9EUeazhDLpZyyvYrsG/PJYVkr?=
 =?us-ascii?Q?TW69i/riFXP79TeRRXdBcwYfKJ5cIEnKeumKwnVaH/9vrN+Qp7BA1PDSCxgq?=
 =?us-ascii?Q?OOdMzlKbtpkLeLZ59JTg9ohS3ypWFGmuDjaocseTxQ1aZVyqiPPothq973M7?=
 =?us-ascii?Q?y2YA4wF1CNBXVLhhUVzzaH96/2FXvEcIDo5h7sGdZQnXltUHBDjSEGvlZtem?=
 =?us-ascii?Q?IZo88YymeL4CGj6PtaxyLVCbbIkScEv/ug8nKOPUkhzWjgMCz53EKtSrqf87?=
 =?us-ascii?Q?+iXIvA9sYnOn3/k6Yw/DeNsMuz6tLJQgwGkxCm3FEkVNK/Adtry9PGngpP75?=
 =?us-ascii?Q?YvrcPboqUn4un+vje+F/tbhH40nfx0nd6wG6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 03:54:07.0104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c338b4-9eb0-4d1a-d857-08dddbaf6245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9078
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

We're adding a new enum COLOR PIPELINE property. This
property will have entries for each COLOR PIPELINE by
referencing the DRM object ID of the first drm_colorop
of the pipeline. 0 disables the entire COLOR PIPELINE.

Userspace can use this to discover the available color
pipelines, as well as set the desired one. The color
pipelines are programmed via properties on the actual
drm_colorop objects.

Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
V9:
 - Remove redundant comments (Simon Ser)

v8:
 - Use upper case in drm_dbg_atomic (Simon Ser)
 - Remove MAX_COLOR_PIPELINES (Simon Ser)
 - Make pipelines const in drm_plane_create_color_pipeline_property (Simon Ser)

v7:
 - Fix a checkpatch warning - a new line after variable declaration

v4:
 - Add pipeline property creation helper (Pekka)
 - Fix function comment for
   drm_atomic_set_colorop_for_plane (Pekka)
 - Always create Bypass pipeline (Pekka)
 - Add missing function declaration (Chaitanya Kumar Borah)

 drivers/gpu/drm/drm_atomic.c              | 46 ++++++++++++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c |  5 ++
 drivers/gpu/drm/drm_atomic_uapi.c         | 42 ++++++++++++++++
 drivers/gpu/drm/drm_plane.c               | 59 +++++++++++++++++++++++
 include/drm/drm_atomic.h                  |  3 ++
 include/drm/drm_atomic_uapi.h             |  2 +
 include/drm/drm_plane.h                   | 11 +++++
 7 files changed, 168 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9fef7807eec5..3bb964e378eb 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1531,6 +1531,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_add_affected_planes);
 
+/**
+ * drm_atomic_add_affected_colorops - add colorops for plane
+ * @state: atomic state
+ * @plane: DRM plane
+ *
+ * This function walks the current configuration and adds all colorops
+ * currently used by @plane to the atomic configuration @state. This is useful
+ * when an atomic commit also needs to check all currently enabled colorop on
+ * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
+ * to avoid special code to force-enable all colorops.
+ *
+ * Since acquiring a colorop state will always also acquire the w/w mutex of the
+ * current plane for that colorop (if there is any) adding all the colorop states for
+ * a plane will not reduce parallelism of atomic updates.
+ *
+ * Returns:
+ * 0 on success or can fail with -EDEADLK or -ENOMEM. When the error is EDEADLK
+ * then the w/w mutex code has detected a deadlock and the entire atomic
+ * sequence must be restarted. All other errors are fatal.
+ */
+int
+drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+				 struct drm_plane *plane)
+{
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *colorop_state;
+
+	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
+
+	drm_dbg_atomic(plane->dev,
+		       "Adding all current colorops for [PLANE:%d:%s] to %p\n",
+		       plane->base.id, plane->name, state);
+
+	drm_for_each_colorop(colorop, plane->dev) {
+		if (colorop->plane != plane)
+			continue;
+
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state))
+			return PTR_ERR(colorop_state);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_add_affected_colorops);
+
 /**
  * drm_atomic_check_only - check whether a given config would work
  * @state: atomic configuration to check
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7142e163e618..cee6d8fc44ad 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -268,6 +268,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
 			plane_state->color_range = val;
 	}
 
+	if (plane->color_pipeline_property) {
+		/* default is always NULL, i.e., bypass */
+		plane_state->color_pipeline = NULL;
+	}
+
 	if (plane->zpos_property) {
 		if (!drm_object_property_get_default_value(&plane->base,
 							   plane->zpos_property,
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 44665efbef55..97eeb8aa3677 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -258,6 +258,36 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
 
+
+/**
+ * drm_atomic_set_colorop_for_plane - set colorop for plane
+ * @plane_state: atomic state object for the plane
+ * @colorop: colorop to use for the plane
+ *
+ * Helper function to select the color pipeline on a plane by setting
+ * it to the first drm_colorop element of the pipeline.
+ */
+void
+drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
+				 struct drm_colorop *colorop)
+{
+	struct drm_plane *plane = plane_state->plane;
+
+	if (colorop)
+		drm_dbg_atomic(plane->dev,
+			       "Set [COLOROP:%d] for [PLANE:%d:%s] state %p\n",
+			       colorop->base.id, plane->base.id, plane->name,
+			       plane_state);
+	else
+		drm_dbg_atomic(plane->dev,
+			       "Set [NOCOLOROP] for [PLANE:%d:%s] state %p\n",
+			       plane->base.id, plane->name, plane_state);
+
+	plane_state->color_pipeline = colorop;
+}
+EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
+
+
 /**
  * drm_atomic_set_crtc_for_connector - set CRTC for connector
  * @conn_state: atomic state object for the connector
@@ -541,6 +571,16 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
 		state->color_range = val;
+	} else if (property == plane->color_pipeline_property) {
+		/* find DRM colorop object */
+		struct drm_colorop *colorop = NULL;
+
+		colorop = drm_colorop_find(dev, file_priv, val);
+
+		if (val && !colorop)
+			return -EACCES;
+
+		drm_atomic_set_colorop_for_plane(state, colorop);
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -623,6 +663,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->color_pipeline_property) {
+		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 38f82391bfda..f6cfa8ac090c 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1820,3 +1820,62 @@ int drm_plane_add_size_hints_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_add_size_hints_property);
+
+/**
+ * drm_plane_create_color_pipeline_property - create a new color pipeline
+ * property
+ *
+ * @plane: drm plane
+ * @pipelines: list of pipelines
+ * @num_pipelines: number of pipelines
+ *
+ * Create the COLOR_PIPELINE plane property to specific color pipelines on
+ * the plane.
+ *
+ * RETURNS:
+ * Zero for success or -errno
+ */
+int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
+					     const struct drm_prop_enum_list *pipelines,
+					     int num_pipelines)
+{
+	struct drm_prop_enum_list *all_pipelines;
+	struct drm_property *prop;
+	int len = 0;
+	int i;
+
+	all_pipelines = kcalloc(num_pipelines + 1,
+				sizeof(*all_pipelines),
+				GFP_KERNEL);
+
+	if (!all_pipelines) {
+		drm_err(plane->dev, "failed to allocate color pipeline\n");
+		return -ENOMEM;
+	}
+
+	/* Create default Bypass color pipeline */
+	all_pipelines[len].type = 0;
+	all_pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add all other color pipelines */
+	for (i = 0; i < num_pipelines; i++, len++) {
+		all_pipelines[len].type = pipelines[i].type;
+		all_pipelines[len].name = pipelines[i].name;
+	}
+
+	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					all_pipelines, len);
+	if (IS_ERR(prop)) {
+		kfree(all_pipelines);
+		return PTR_ERR(prop);
+	}
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->color_pipeline_property = prop;
+
+	kfree(all_pipelines);
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 92dde4fb21d2..7904a38caa77 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -886,6 +886,9 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 int __must_check
 drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 			       struct drm_crtc *crtc);
+int __must_check
+drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+				 struct drm_plane *plane);
 
 int __must_check drm_atomic_check_only(struct drm_atomic_state *state);
 int __must_check drm_atomic_commit(struct drm_atomic_state *state);
diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
index 70a115d523cd..436315523326 100644
--- a/include/drm/drm_atomic_uapi.h
+++ b/include/drm/drm_atomic_uapi.h
@@ -50,6 +50,8 @@ drm_atomic_set_crtc_for_plane(struct drm_plane_state *plane_state,
 			      struct drm_crtc *crtc);
 void drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 				 struct drm_framebuffer *fb);
+void drm_atomic_set_colorop_for_plane(struct drm_plane_state *plane_state,
+				      struct drm_colorop *colorop);
 int __must_check
 drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 				  struct drm_crtc *crtc);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 61fedd4e253c..703ef4d1bbbc 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -791,6 +791,14 @@ struct drm_plane {
 	 */
 	struct drm_property *color_range_property;
 
+	/**
+	 * @color_pipeline_property:
+	 *
+	 * Optional "COLOR_PIPELINE" enum property for specifying
+	 * a color pipeline to use on the plane.
+	 */
+	struct drm_property *color_pipeline_property;
+
 	/**
 	 * @scaling_filter_property: property to apply a particular filter while
 	 * scaling.
@@ -1014,4 +1022,7 @@ int drm_plane_add_size_hints_property(struct drm_plane *plane,
 				      const struct drm_plane_size_hint *hints,
 				      int num_hints);
 
+int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
+					     const struct drm_prop_enum_list *pipelines,
+					     int num_pipelines);
 #endif
-- 
2.43.0

