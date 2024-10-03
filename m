Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85AE98F78C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 22:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0EC10E91F;
	Thu,  3 Oct 2024 20:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="B0wWRlKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8D610E923;
 Thu,  3 Oct 2024 20:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoqlyLFyoRqQ5Q7vxZv8WRegAd0pBDosoFiz711HcounGS+c3W3zwkoD5mREPoSlSYXHelA7S1Zi7Ob0Uj4Ydq5MGIZFDSU4tVc153RW78OUcsvrrk76MYyvqCkEntElxaHecmX2+E8E41vTg3dK++VG4VvG6PFZJ+yFP2wuk0zt2urm5zPx4rpsM2Fr19URrjgTPCOTumr64H8dGdotagSAYpDWLMCuL+hq8UEEjFyTB24/cXMheMcWNhq6sFtdYapnH/PZBCoVRk2MUMQCIyv4JWk33OmXllrLQDSzZvXzsL64dv7WkmS0GxeEUTDjYyz2pX9SicPSlWdSK6ac+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2NpIC/Ipt9KmCnnub4j76k9mrYakJOISNF5+8dhRIU=;
 b=HRrKDYXigArsXgQIt+zOVEuA27YaIH8hpGIzLL/AwbZKMimIh5tR+56ioQDcnT3uqSrAF1yjFpWIRmZ6FbQ8CeSN3NwYU55OV+joDDGGt+pU+3qkn1jdyEQnzH3UyT7TrLn3Bsj7E+a2lpsUtZviRHYFRq4UO+IY7/9cgLb3zVHwktvRFD2rskBfR8BDB3YwqtMGlqiw3X54phxb5T9pEnOj3K2VjfYM1RbTO/7rsrV2mw/a+sTHRJaYvfJ43asvr1VeC5kPFV3izPC83ugCsUCfqpDaveEqTLsugxpetTWWZ2OS+/BqlrS4TzsVIVgcXCXB7+FRwuPgZF5ICcuslg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2NpIC/Ipt9KmCnnub4j76k9mrYakJOISNF5+8dhRIU=;
 b=B0wWRlKa+B3yIBaSvTymcFhWiaWnSTDr6Jc6+3CHsyldDI6BHNUL4lhvQCy3BuPfKZ5P5X7Y5ou/hIUQ+XFC9mmvhQfh/Mz7BtU1FI1RxFuMiqhsDfB0B350Z7DEY7/HkFu/IjRYzvsjp0/3Jvl5YLdeQXpf/PrR/GakNuvp/9g=
Received: from CH0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:610:e5::8)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 20:01:43 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::2b) by CH0PR03CA0243.outlook.office365.com
 (2603:10b6:610:e5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 20:01:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 20:01:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 15:01:39 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Oct 2024 15:01:39 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v6 12/44] drm/plane: Add COLOR PIPELINE property
Date: Thu, 3 Oct 2024 16:00:54 -0400
Message-ID: <20241003200129.1732122-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241003200129.1732122-1-harry.wentland@amd.com>
References: <20241003200129.1732122-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DS7PR12MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 431e4d25-7fea-40a3-78f7-08dce3e6340e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yl/MOaw7sm7V9yKmPyjCr+l9B1BUaYUMFAOCOb8PpIY/IntYLEd0xjbsVW9n?=
 =?us-ascii?Q?CvBQ7Q3xsG0ba3ZQUmQeW4WVk5pnI9BS2OtJp3OJlXiF9gzfVXw6+h2nPfju?=
 =?us-ascii?Q?p47jE8vCfThMffH0TVXa8b+yPXixyKGath8sKK0JPBQAZzcnmkdPWqKdjJBX?=
 =?us-ascii?Q?kVlOvIhs5Sn2btRz1BN+ndY8mzR4s371ts+WMbpF2P7mz9LjyTmz3SumJk4o?=
 =?us-ascii?Q?0LGRWJk0LETEYr2NS5R3UfnKlSzI/tY/+zz5HOypArSxAfrOlOTZjIrDbYEG?=
 =?us-ascii?Q?ngQJFL1o/MtOB9z09veQIda0UVAhAD5ZNjVLtxjOTUNjB32jTJMxFtsyGdDn?=
 =?us-ascii?Q?TD4YC6fcygkiAvMR6QBV0YZ+vMfjPPsSNWQNuG3F756bFMFcaoD+78JfKnLy?=
 =?us-ascii?Q?wkSPLCRJQC7UKe0H7M4Y/qi+ypILMyPWgyfyd/NZmpkaFWS3MW50QT6fultf?=
 =?us-ascii?Q?IFy4bYvTG52/EYHoaEMOkj9DVROmCL1YGvxkgSbb6VbmUWUHy7zl6Fj/gko/?=
 =?us-ascii?Q?3nZyJ0g/kk9cWZ8ue+nJot8k5Wk0E/AUqleLIwt+1iDdIpnKZmJrNmSCDnqt?=
 =?us-ascii?Q?DzjHw4Jmaixcd7BRpp913qaayjy8WPhApZ4Kp+sIcBB+eLnzGNhDHOW19K5z?=
 =?us-ascii?Q?zzWPzHgv3VD+V3YIyhpKMvrJFFqPAJrJwNbJOMNW3L1qQbLuQlSsePlnwOp+?=
 =?us-ascii?Q?XTJ6UH2FwT+r8bxG0NUs5zJAL6h4qJAA4mBY/Rb2KvK39qHPSVGgYAEip4Nm?=
 =?us-ascii?Q?x9Uv+1nzqxB3gU3gbcOl0hRAwEBI+AooF689QfbSOMM192x4xXjoUdijSfZJ?=
 =?us-ascii?Q?+zuRYl10sV40bEjePIevnqTenJqxAv/IHEY1YFDZgIvUso3F270TXDpZPaiy?=
 =?us-ascii?Q?mGC0tVG6iQSViv1CJFk734MG14q4Bs4CGUhfaRLwewC6waP20VIea+EjGlxK?=
 =?us-ascii?Q?r9R/88C337AKya2omV9OCU/dxo14iopTS2IdC0SrgV95lMeTHhMk5l+6VZ+G?=
 =?us-ascii?Q?LSw+vjgOkqQ7npQcCrcRVdFXw9hhIyTS6mkDOaehIiF9YSfDI5gxxPFonlvi?=
 =?us-ascii?Q?9YFpPJaiDoHzzxjChp1HE4SXeLRDYZjkmqZB5PevzDyoLO3MTMWuqPlJzmOp?=
 =?us-ascii?Q?QKDDk4H76Xp3cGy9a0kpdsb0HMcUwGSCFhWqaU9rMZHOGylcFqi9+/2n9GOx?=
 =?us-ascii?Q?e4FbOVUtNSnWLvLDHfmQu4De17z4uoe9/hWQrPec5+gj/p97AtboeXdkNy6i?=
 =?us-ascii?Q?rMOKu1QKQcxm7Imewek+biHnWRr1jFKJgEE+Ya0GWyRTH7khElPFdYAeTplz?=
 =?us-ascii?Q?6soXCMwE/AGqzlsDMYZWnCBhEyokPIhSloABJTpYu0ovRwrEAKTbhWZoTh8k?=
 =?us-ascii?Q?tGiPA4yFJsSyyqxDAm/4ggkIGhCs?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 20:01:43.3708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 431e4d25-7fea-40a3-78f7-08dce3e6340e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249
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

We're adding a new enum COLOR PIPELINE property. This
property will have entries for each COLOR PIPELINE by
referencing the DRM object ID of the first drm_colorop
of the pipeline. 0 disables the entire COLOR PIPELINE.

Userspace can use this to discover the available color
pipelines, as well as set the desired one. The color
pipelines are programmed via properties on the actual
drm_colorop objects.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---

v4:
 - Add pipeline property creation helper (Pekka)
 - Fix function comment for
   drm_atomic_set_colorop_for_plane (Pekka)
 - Always create Bypass pipeline (Pekka)
 - Add missing function declaration (Chaitanya Kumar Borah)

 drivers/gpu/drm/drm_atomic.c              | 46 ++++++++++++++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 42 ++++++++++++++++++
 drivers/gpu/drm/drm_plane.c               | 52 +++++++++++++++++++++++
 include/drm/drm_atomic.h                  |  3 ++
 include/drm/drm_atomic_uapi.h             |  2 +
 include/drm/drm_plane.h                   | 11 +++++
 7 files changed, 161 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0f4eba51ee4b..12e787e73c63 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1460,6 +1460,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
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
+		       "Adding all current colorops for [plane:%d:%s] to %p\n",
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
index 8a038e04be58..c927aa65d286 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -256,6 +256,36 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
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
@@ -539,6 +569,16 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_encoding = val;
 	} else if (property == plane->color_range_property) {
 		state->color_range = val;
+	} else if (property == plane->color_pipeline_property) {
+		/* find DRM colorop object */
+		struct drm_colorop *colorop = NULL;
+		colorop = drm_colorop_find(dev, file_priv, val);
+
+		if (val && !colorop)
+			return -EACCES;
+
+		/* set it on drm_plane_state */
+		drm_atomic_set_colorop_for_plane(state, colorop);
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -621,6 +661,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->color_pipeline_property) {
+		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index a28b22fdd7a4..e3a85a27fa7a 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1793,3 +1793,55 @@ int drm_plane_add_size_hints_property(struct drm_plane *plane,
 	return 0;
 }
 EXPORT_SYMBOL(drm_plane_add_size_hints_property);
+
+#define MAX_COLOR_PIPELINES 5
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
+					     struct drm_prop_enum_list *pipelines,
+					     int num_pipelines)
+{
+	struct drm_prop_enum_list all_pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+	int i;
+	struct drm_property *prop;
+
+	if (num_pipelines > (MAX_COLOR_PIPELINES - 1))
+		return -EINVAL;
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
+	if (IS_ERR(prop))
+		return PTR_ERR(prop);
+
+	drm_object_attach_property(&plane->base, prop, 0);
+	plane->color_pipeline_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 8e2af84a0b01..a2e7ac463eef 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -852,6 +852,9 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
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
index 2a9b902623c0..8a769c6a8251 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -774,6 +774,14 @@ struct drm_plane {
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
@@ -997,4 +1005,7 @@ int drm_plane_add_size_hints_property(struct drm_plane *plane,
 				      const struct drm_plane_size_hint *hints,
 				      int num_hints);

+int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
+					     struct drm_prop_enum_list *pipelines,
+					     int num_pipelines);
 #endif
--
2.46.2

