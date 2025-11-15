Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B361C5FA95
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 01:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A4F10EB86;
	Sat, 15 Nov 2025 00:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q8g+luf8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012049.outbound.protection.outlook.com
 [40.107.200.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736C210EB87;
 Sat, 15 Nov 2025 00:06:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/w9tJ5gHyXBFu9yZd4K1LAyCEbp5YqDH2Qr3AKFqn8+wbPq/DjUaIb3FsnlVITPSIt0zeqtX9cKqozuStpHPY+yR+KsHSBPT+3Aj4xortLW3O2+KxmsGtqMbqnaLCDEZPOcxwW6ShI2QF2rWQqjryN3IlOyafU+TdpPyKZ5Tzl3N8yvhi+h+j1WbsE59zc6c4l64B4+LrhmRO5Dv3RsATteIO0hn3k6A7/57diyej4OL8woUYVe3WUorGTvVXXMDNqwlhEUdmc/hIIMOSmg0JRLTPHsSmAVga4SGgcZBzG3aAFrtMHmOimmWDqbEWGCwO7aGBsZmg10ok0kv8uY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFBf1MpoWDUXWwmchRsuBJXTvR4wafuUj7ngsXy+22I=;
 b=Psf1yWxqli1Kk/I1iiXnkJW+NGzBp4nps6SPgRiRTZW+bYZLdLXYVP1yDBH6hT5plSkf79YkxeDFJ+2Jfdjn6ug8z1Mymb49vPiTszRZeCtu4IIH+lqD6zzDTwIsGwwJApWLcBqQcVacwy+7ZYF3ryOocvHjj51EhTnxhkAsxxjc4r0vEXMdRER3qdv3nGcT0RvI6KMzlXrni7ucPR5nqR2WnOEPKuJc7kwvd8P2q7cZp8s4mgkAK7ibLWpA/HoQDQz3QnKNY1KRU3FjOgKUMl0v+XbdjRb2TJMLVy9wpSyfaUfU34pQD+ZHCWnyVRJSBy32gLcTFJiahVsyyoOSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFBf1MpoWDUXWwmchRsuBJXTvR4wafuUj7ngsXy+22I=;
 b=Q8g+luf8YwhFqP9Yain9HgjGAAUn/jmgqjm1Q+f/X6BPkOkMxmnMruQZu4eFtSVsTkIcGZpM3ZLxD6yVFCiBuRnkv1sykTqMV8TwHKkfua9qJ+tUpD/UtjVjuQmL52zSq0Q4kFZDTcJTrQw5JVtBguq2jgm3QnJpxQSDBueymQs=
Received: from SJ0PR13CA0046.namprd13.prod.outlook.com (2603:10b6:a03:2c2::21)
 by SN7PR12MB7155.namprd12.prod.outlook.com (2603:10b6:806:2a6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sat, 15 Nov
 2025 00:06:14 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::96) by SJ0PR13CA0046.outlook.office365.com
 (2603:10b6:a03:2c2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:06:13 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:06:06 -0800
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
Subject: [PATCH V13 10/51] drm/plane: Add COLOR PIPELINE property
Date: Fri, 14 Nov 2025 17:01:35 -0700
Message-ID: <20251115000237.3561250-11-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|SN7PR12MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: fe1a7c63-e876-4c1b-7daa-08de23daca1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S57R5GPSaEfBuOpqPVbVEeIFgcdwFcK8D4me5H7zMNweoCHgeo2xQ1U5I6Qz?=
 =?us-ascii?Q?2T8UqilZTne41+jnt5k91KxXLquWm1GxgRzyathimsdzjrBToHNpZeEgBJPR?=
 =?us-ascii?Q?lhcmagLWfwmPDzzyNbnvbqt9PsOPvz46APuVujo/fzxSjiRgeTLpEZHnpSLF?=
 =?us-ascii?Q?2rCOcVpE7VKvvS7IC5s8qTDZnx8OvbYP7vG8UaR82ed4fCThbkYjKOt9LqPY?=
 =?us-ascii?Q?Ey+/WIjjOxCWa+q+AZP+0mR4N8wPxB3zrLTG9l+l1F9Ywl26/AOCqRNNuxqm?=
 =?us-ascii?Q?gmWmCE55noO+xGATtrboEfYx9DH8ylYYmXlq26/BBsDjpxLAdH9Tq99wgFm9?=
 =?us-ascii?Q?hAbd9KjnKyyDOUizS7Njikw4zZR74wIJXP04FSyUWKsfYTzYFKvBMAmlTmAA?=
 =?us-ascii?Q?9qQiCypqnla0hpBSX+9Ei6Pzv3P3i3pBUUPDf9vPRKF5muFPR6i/Oms3D5Zu?=
 =?us-ascii?Q?ONU/nTkIMPLPa9i2CsZh9hcuWVJV1dnczGguMsG6tPF7XfBtVOWpg8twJOpX?=
 =?us-ascii?Q?omQlr35CXQGxdJlgXJClao8at5m8Akj1/I2Ufj4D6JP3i71fhii8SlwkPZ6x?=
 =?us-ascii?Q?+CcqQBi3PqiZeC1mNsB4p1bzgGnh3ob7W1bJA9kVPN941JEIUynF++nD5Iha?=
 =?us-ascii?Q?QSLskcpCUE81wa6w+qwnv/9NfHFItsHAuyvoJDPVsHgXhxANGAwLKH9ds9s5?=
 =?us-ascii?Q?I56YIX05ag5HT09njyOIPNYTBAPJs7aiK970sIA6+70/4yh+6ZATFiMDVuv5?=
 =?us-ascii?Q?6X/m2fcKk97BVi7Cs2Hp38698j7SCbAkC+e7FgH+4S9OVtiYBC4QK7SFiaTL?=
 =?us-ascii?Q?zBvx8cjNHPUF2rofqKeuiiSxabG069ZwXW7ekdV55mLGYyafX9H5XZ/Lx0Gi?=
 =?us-ascii?Q?uAfs2cs8DXC+bhGLDhhsMRE9kcS/DC0N5efmp/DKnPBR7ro5lJkEmKqlm5qv?=
 =?us-ascii?Q?5XligYxtkTle+1oo/a4jwahHrqw2sfbP3K1116D3MsQJ1fqjxyAHntiNgVWY?=
 =?us-ascii?Q?8+wQoKEXHzLo60XSc/FCrS18JWtampYDQEeJsnJZVpjXqLzyU8y1CuFM79Na?=
 =?us-ascii?Q?4cLTuf67K3NrBGX0Q8lsRBYQl+V52fT0us22rni5N1i9WWPK03pcZOWNIbRW?=
 =?us-ascii?Q?lhylGB/za2BIALAjc/80rgu4P5OqWfrf3akSLup8arrdp1/o7pGsGJv+lTZs?=
 =?us-ascii?Q?d090dEcEF5wZtEq6QY1JS2ZNqRSU3d821T9oDv7yqooya4keaAEbmTliaiq8?=
 =?us-ascii?Q?fl1HAmczJQcUKoOyxUzepculgHW4s5n/LuddSe18SRJioKRkQ+zZlYwDoHqn?=
 =?us-ascii?Q?L2FufzOfJwySDc41lJsDzvX+CD5bdKWi3cQ/Dfw/eo0Oyp3e/OO6s3cscCb3?=
 =?us-ascii?Q?APzAEf8KPXBqnWFsZwNj6WIvq41TNG1UQcD20eFL6u4/+TX/r3Mt3/83oc89?=
 =?us-ascii?Q?kWOyv2zfLCfB1aZ+GEcoGJ6079yO15Vacbh0Y+ZJZUCaRlfjwMHp6MC0b3Sr?=
 =?us-ascii?Q?CNXpxckdtLvXIIrl6R0sgS3e/HLSVUAJufDEs7LyDQ52FtdbvaGE6FU5pqCk?=
 =?us-ascii?Q?4WS7i8dcikgnScEaGts=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:06:13.2551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe1a7c63-e876-4c1b-7daa-08de23daca1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7155
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
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
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
index 3dacb13649c5..2ddf1265d971 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1539,6 +1539,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
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
index 7a3ae48ac4d4..3c183ba047ae 100644
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
@@ -545,6 +575,16 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
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
@@ -627,6 +667,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
index 5f1b23a4ef13..65e619e75387 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -906,6 +906,9 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
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

