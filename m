Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B13E8ADC043
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344810E528;
	Tue, 17 Jun 2025 04:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xsP28AIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43EE10E4EB;
 Tue, 17 Jun 2025 04:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3YZH2ycvT9Lu1OPf/clUANDz3PGzae8DtD+0nUKlOde/s6FuQ17wFRJkDRkHCFKlW9yooX/ddA1imITRY2qLTFVpOhXNifM1s4SOJYtyCr3vomUnOzwkU1OIQqGy/y+Lnj5pL9Bg/+b5wo1ppnrKAnLngbSVdlFreWb2w3uUFqTC6392LG7ng7beXRCch2QIcjMWQXcj0i0pr57o6L6olP94Ojo/ztKaMzFETbugrdB14nDsZRaRgI7pyKrs7wxcdzrshr3urkJdy+jfmHsVLglO/DfC3OOzZLMoU34ndnR4H/c/IzWl1+exu/KZxANgCedie5r+eH4T7GsG+soNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqfcE4kIln1xRC2aXgpoeAx6+B4vn5hYtpHGUrgyR60=;
 b=TRtUr15bhbCDPMlCp6qCQ1md0W/SP+jjRf9kGeETYDSKbdL0dewd6quCIGfEdGW9mn1CTdba/7qN5a3DNBzSUtVbbQMLrdeBgbOIwLnn4uuIAQ/xpzHeA3p+uU1IqKjaB5SyY5flDhIL1UHf2HwVut7/Vf/j8NZFhECBovlSG0t0lEcx/3fJt4T7xBelUMs1CJrnXPHa2B4hadX4cqeHA2bA8hiHXyvIkEnALS8fznWgd4nSGhzRry6mi7sG6Rck29frwrdBeJfqTxeWtelRBJJsHGz5mW2wvzkxSyFKTYHNRiRpm1IyC684zUEUegcVzpufT95OcMsp5/6SsT2HDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqfcE4kIln1xRC2aXgpoeAx6+B4vn5hYtpHGUrgyR60=;
 b=xsP28AIzi4p85ewdzATRQ8W+8GyBF8Eh/lgPqp8NFifxBRCLvVO9P0ezTOpmXVhc6YlD5TQCL9EKcGWfE1BQEad0mU+29UdNnbgpP0eG4zK4uFI69pLR8veIi/UIMFhJO+01XO+03L/AgwCzi81euBUafdgks38bsKj5TiRafJw=
Received: from BN9PR03CA0107.namprd03.prod.outlook.com (2603:10b6:408:fd::22)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 04:20:35 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::90) by BN9PR03CA0107.outlook.office365.com
 (2603:10b6:408:fd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Tue,
 17 Jun 2025 04:20:35 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:20:33 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:20:30 -0500
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
 <arthurgrillo@riseup.net>, Daniel Stone <daniels@collabora.com>
Subject: [PATCH V10 10/46] drm/plane: Add COLOR PIPELINE property
Date: Mon, 16 Jun 2025 22:16:52 -0600
Message-ID: <20250617041746.2884343-11-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617041746.2884343-1-alex.hung@amd.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 549ff3e8-5770-4c2d-7f0b-08ddad564dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vLWUWWWS6ZGnhe/Tf9AUhVkbRIRxe9MdU1pF37kntdCzxo2GmC7Ori+B+ae7?=
 =?us-ascii?Q?uaOeHcEceTC9l1ofL2L5Xq7P/xysXRCuu8NPxGiMLvVWz1EJFTVEg8Ff82Py?=
 =?us-ascii?Q?svYcOHHInocKPMryerCz1xrsV/vX3MphIw3dOW/xoow8tIIMKx5ZeVOjaDbD?=
 =?us-ascii?Q?eJ7HZ4TA+G/OasWB2VlPMUfRwUhgtfnccBYrod2VKCPl9jzHX+/7TnFan20W?=
 =?us-ascii?Q?cJBpWl4PEHikPDxJUZxpvIUVxdEPw4Ft8aNluCwW9SK8jkXc+S4vodYRDMuJ?=
 =?us-ascii?Q?lOU5gE8JsTwtbyeZzkQXjUOlz8cx9hrJxurzD5TePb9hvqgUQun9ZwNVFI6j?=
 =?us-ascii?Q?znX3WOta8WSyrLLCcFrOJZ4O61eZGng1kAhLuBUyXAJamE7OlMttrqLQbLgj?=
 =?us-ascii?Q?tVxkNAAsZwHkEyOKa99XKnJrVD/1cAyf6pS09kRUlfVGBm60dohVOzgUVafW?=
 =?us-ascii?Q?Fv5UxTMb3orOnmPCY7kyB7KuPKRO8UsLZbuGhq97RMDx8j0LahozGP5gygwa?=
 =?us-ascii?Q?da0EPkwsnvXcVoY2hTw/ZNHgdrBjWKF9brCaE7vHwqyOposnA+a+LAXHA/UT?=
 =?us-ascii?Q?L/Si625K+JyzvpqBpahWVWmYPjoexGWNsbzrdsdcuj/g2WuET7YIVCqvTDqd?=
 =?us-ascii?Q?/3wSExq9yjqWFZUazW2xmja3lLkJFbmBDpAP1dnavGcf5Is1g+MPQnZ3dPqJ?=
 =?us-ascii?Q?1ax1iUgEOokmLF9pTQg2CE0Sxrxq9TWsp68oO2shLN+AfeqiQDvB4OIz037M?=
 =?us-ascii?Q?n646qXKy7dVEk/DCGi/uKuUUoKw8s+WoFJMC/75UQdu5opgpIT4iimMT6NpN?=
 =?us-ascii?Q?lblF2y1mi5TiC3q/RMmJSdZp1NyqwVO7Digl1lhHrexk8+VZF5VkOR4EuLEO?=
 =?us-ascii?Q?oMm7RERtw5eMxc2ixDDUD5n9G5KtM6yxdxZ0j0PovC6IjXj2ZpN3QOxiUSGJ?=
 =?us-ascii?Q?t0YTtw4ZItO9joHGCmuewVdkydvwdZA2ytMroA3Ox5Kh6adRNSJJO/MxJc4H?=
 =?us-ascii?Q?bbgRR2vQc6W8DKwBJqgcyd+K51G4xPgBOwXWcP/cgHDwYz3IFSYKytdnygl+?=
 =?us-ascii?Q?Hd0v1rwj7TSgacLz43j4p2+iDgnU1aybs4qVn8oU6ytJ+UXeFBz6deDX6Fkf?=
 =?us-ascii?Q?Vfg3F808EUZ4Lhj7D6UUpfBR3RvzP637d/wVAFg08KIJ9jE13OYSDaswd9X3?=
 =?us-ascii?Q?rt+lMsEcsnrqiagZ+mp0SIcXOUBeFAyMJhaHt4NJZUdF/LAYSJG+yAbYI/Yb?=
 =?us-ascii?Q?thlVsD7M8uKo1xBpZ6RSTerzupxD7EPWRB6bF4LxyGWs5mI4Ly2AP0ybCLdg?=
 =?us-ascii?Q?hZk3Dj+ccVDf8aDJkOWH2Pnc4n0WuVYxZCIJ8W/5T4ZO4BOV51+LzBz0tdgb?=
 =?us-ascii?Q?hrrMc+PqoUpcwTVoid/LWDHumsZ6MDzF90TtadURZ46AUZ2/OjllToOcPbzV?=
 =?us-ascii?Q?vvWom6lf+0KzrUsdrqzi5IEj8mAVm8dE7+JzBjQgL7oQ8dIwoBFA8A9PxPiJ?=
 =?us-ascii?Q?+9uLX/bjUglN1ezgSsrgQ4BbNom6U3oPaCm1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:20:33.9833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 549ff3e8-5770-4c2d-7f0b-08ddad564dc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732
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
index dc679c8b904e..7b042c38d50d 100644
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
index 519228eb1095..d1dd082b1286 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -267,6 +267,11 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
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
index e5da00fdbca0..0b2b3242c976 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -257,6 +257,36 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
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
@@ -540,6 +570,16 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -622,6 +662,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->color_pipeline_property) {
+		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 04992dfd4c79..d7362dfc0213 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1819,3 +1819,62 @@ int drm_plane_add_size_hints_property(struct drm_plane *plane,
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

