Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02A957617
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 22:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321AD10E3C1;
	Mon, 19 Aug 2024 20:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e/LS5XUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2050.outbound.protection.outlook.com [40.107.101.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E510E3A1;
 Mon, 19 Aug 2024 20:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuI7RsiLQo37tdmIvNbEzO1pTU+d5OOZIHDoy/+irqJYV3rOekcxoElwD0etSycoVS7H3MibaLYQRaSZv45xC1C5zckqmaT9fcQ6tBEwVSVkKMWcXHn6Jl6aaMgHWxxgiZBOhmNvrDAaS2aGQiaBlhtuTc1e8vibhJUm+N1AecGNLsFwddykFQUfqOfmeUxxdM3hqE5NhUujFhS9OrppyaLiIUy48RJRcj8MTY8mJOxpPlYCpwvRlsv6SdffCORev6qQpiRBzJGUu0HFcL1O9t3W6iJAaLLk5Lku1YQamW14slVgF9Ay5d5JmMXd0BzhLCbgymF/l9hkPb7BNubolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylCymKfJf8x/hbJf/skbgZgbSGNcq3vIY3jhfEjU2hI=;
 b=n+ZB3ZFkLu9ak21AwkDehrx14pdAOhGhYcYwPrBgFExVZP+ZF2JW6bLDMegy0LgX4wZNwy7iPEueW3xTePjt/HrGrVHC0sHDpAS2YjamopD42EeJ1lwzQ14QdcWMqXnPVSMLOxBAd/avtyakIEADLoslfTFNQ1GZQ1WStpUmmww0ix499zGQJVoZ4810vbs3tYjB2ZLf6d5hOwLF6qoU9NsplcQ9ApQkKWzBVUjGxSguPTiy4jy6BrHybGAk8WOAvYkU6jE4g9epWXyssBda3BLCnwsowkJGSPsoU27tBbk9iFNkgh5Vf98czbpWKFpS4YFWFrhje3JZbLS41c5qjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylCymKfJf8x/hbJf/skbgZgbSGNcq3vIY3jhfEjU2hI=;
 b=e/LS5XUO+I3x5EAzxS4I/4fZ0qcshjQH/SDPtfRGwVnRh2vNy7LpqO6jmwKCiTFUaEwTIqU0XzfdS+GozeSaaQiL930TTQ+Dz+9dCbW3c0wob/PeLtSA3uZr5JxXVSElowGfDt34/r7kQhxE+fKPTWATKmG1UDtxGJDVRiDL0Ok=
Received: from MN2PR17CA0024.namprd17.prod.outlook.com (2603:10b6:208:15e::37)
 by CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:57:29 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::e8) by MN2PR17CA0024.outlook.office365.com
 (2603:10b6:208:15e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:57:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 19 Aug 2024 20:57:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:57:26 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:57:25 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH v5 12/44] drm/plane: Add COLOR PIPELINE property
Date: Mon, 19 Aug 2024 16:56:39 -0400
Message-ID: <20240819205714.316380-13-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205714.316380-1-harry.wentland@amd.com>
References: <20240819205714.316380-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|CH3PR12MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cddcf8b-240f-4599-8fb7-08dcc09189b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wL6PwqBfA86jhs+Q2JSA6Cj4oz8Sue/T2u4ck5QEVzPlUwlfc6lR/PY9w8Vl?=
 =?us-ascii?Q?OUG+Qme5kESavjmY/b0zZWF3A1ku4U2StncR7aeLpV8UiklGQH2pImBxKoQ+?=
 =?us-ascii?Q?EorIIYcY5n23i5P0b6rzwHQHy2B2OnSiLCQMjH/iPFQP5XZ9U1RhffOoy0Nj?=
 =?us-ascii?Q?tPL41lVzw/vFBoAo7OrFCfZ3x1skFEUnFuZQLO85PetQycGBGNAbbfbX8oMg?=
 =?us-ascii?Q?86I6qN9xVGhRkIjRUdMlTnYyW1BKEoaB6ObvdZs83nMBxy53Y5zxC5o2Gu+G?=
 =?us-ascii?Q?4lujTDR1ndGR+1sjCfl+uHaMOBekyBQEmp1gnLXdg/0PCceF7p7SGoAQHygy?=
 =?us-ascii?Q?WoNZ1MOE9RpKunqMtG4n4BgkJoryfyD1BnxAP0zAFedNZp7IVc/jydec/xVj?=
 =?us-ascii?Q?xpozLs4geY7eXfJ99updarmabAcwGoSz3x1cS/q1LAACNRqWsNRk97BfN9JF?=
 =?us-ascii?Q?bzChLBxflYodFhnAxhm4KWjs4JQmaPIHjmfmyBB+Uum8CSaOoAQaMnWV+Bke?=
 =?us-ascii?Q?FtcaCQon5S/av2sIY7zd+DM6ppmiHO4x+pxmzeq0KrK10295piXedXL8Rpl4?=
 =?us-ascii?Q?Gj2EMlZAwuGpU4FS9yJoOworevp1vRGnr60X2GeMQguY+jLw9Bt2ZCMTzZrD?=
 =?us-ascii?Q?vkfRB8iWAxEIrMCwl/s3IqBGVDZJ9Bssi+mWpTWWs4vJPZhJ29K6Wkri1auP?=
 =?us-ascii?Q?WelNNjFxkXgZssL4fVu1opBCOWdtTdQfdah9eYM9PuS2xYX6TbomWsL24Phy?=
 =?us-ascii?Q?Op/agRGpAMdO+CYY42dG5UeDLmIdtbY8ZhsbnfpvDW/X747nF5lhLqSqXh65?=
 =?us-ascii?Q?SE132LothwNSuZoIw6LQUq9O0yMDZc6YzhsUryYTL4rcmeJpEuQ2jWZgvwwC?=
 =?us-ascii?Q?CSUyg645V7BcWvF9IM6sVWgjlARZoz/Xre/VSyk4OibIgN+M9G9K7ikG+2lj?=
 =?us-ascii?Q?t1Ii0PXFSUe+RKpK7xUKmFDySxrc3x4xMVKOu2yxJf4YZ/0Ip+OxfKaDNIEc?=
 =?us-ascii?Q?+ZiVIBdBOdQQlPMD/ERUNHEYQFpGF9aMMm2Y1wxA0eRVnlQxZy5EKayf9Kqs?=
 =?us-ascii?Q?SOs5NHgJY9wMwPI7GYos1nr4fVdb5/IEa7tzgk1TRbsN9qJtdblYrbAtqjLr?=
 =?us-ascii?Q?rgdspf/8GSPWXnp6gDjXOQQZD79jTlkZJe3XJHcUkfv/SXc9Za+PWLJEyctT?=
 =?us-ascii?Q?f7CCeMHdH4sklr8ak1Pm3UZR/XPJ+Ypjm6U19nzT/evpYcLH2ugzn+2Emk1X?=
 =?us-ascii?Q?kzIDn3GVmuGFm4VXo7jbqsKabbxKKFjmT7NPQcUNeYKp6/75GTDW3x+sgf42?=
 =?us-ascii?Q?7p5cAIeorLtfuXqWHIvhOcljveuHZQEabziBQU0EU22MOYC9jD4F2SFnSvlz?=
 =?us-ascii?Q?W95Ai/WvWpsPMYoeQ2BdtVEzf+2p3mZAbx/O4MwNPIHbGiq+d3xolcHyCS2s?=
 =?us-ascii?Q?ZvPj9UFQfV6IE3VKvG4NUP5jm7qw/ADh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:57:29.1827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cddcf8b-240f-4599-8fb7-08dcc09189b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187
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

v4:
 - Add pipeline property creation helper (Pekka)
 - Fix function comment for
   drm_atomic_set_colorop_for_plane (Pekka)
 - Always create Bypass pipeline (Pekka)
 - Add missing function declaration (Chaitanya Kumar Borah)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c              | 46 ++++++++++++++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 42 ++++++++++++++++++
 drivers/gpu/drm/drm_plane.c               | 52 +++++++++++++++++++++++
 include/drm/drm_atomic.h                  |  3 ++
 include/drm/drm_atomic_uapi.h             |  2 +
 include/drm/drm_plane.h                   | 11 +++++
 7 files changed, 161 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 096460d38545..d333433319f6 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1466,6 +1466,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
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
index 419813be21b0..d8d5be358b3e 100644
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
index d2b44121b7fb..d8232fbb002b 100644
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
2.46.0

