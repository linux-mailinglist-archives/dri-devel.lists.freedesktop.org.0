Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 833609F8B5B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1B10EE7E;
	Fri, 20 Dec 2024 04:38:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BS4o/umC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB7210EE7E;
 Fri, 20 Dec 2024 04:38:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/wuI5oefmdnnHXjmvAaRno03Tu0vFbrHjCLBbuaum6kQZCaSMY7KoMkDFDC35qI54VU3s/Dy/+0jUE8yGlP0rs4zXayD6eKcB/7gNtaeiKonqw8Wlv3EDmZ4zC8oenAeVI8mSHZZ8UFQwU7B89RrGTUge3SYplpJ0cUyJ/wxYcxtMxPwoBOCesSIS1igZHy9rjBtlseYPx/MA+ORjGX+4KxlxXh9hUk5W3TXZA6w+XAO2F9JpDLkV33PwceFmlS5YPbCug9p9QJqPEK6yzI+harDsby3Txy5wPGi0xqiXhBRflN9UN+7Wy5pooC1/NgI16elVVLRjUgBxZHyTlSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2lqsUGQGjT7GkBuCjKv+83YJn/yzZQclgGS+jlBsZ8=;
 b=PBLH7DrXgdAY6/1P7joIMFHkEP6LN2tbg9JFsEqX6QewBz4ub4cGfajxyZvIYd1v/coxxO94TCiOsYAeyC7ESxVxk3WnFDhfXLpR18XLqJR4XolHqeWEd4VyfydXV3Jz+536AEjdnPZQiqLtO3DMiTIBGuILLIk/SvbNSen6vHuaY1tmf/hEzt1XHRvpVDBGCIv4Nmi4aTNk/2q22zh4tJgSWlFUSyY3/ReJfFiP6G/lNHEA/1SApOJR2ZyL6vByyHA+91P0/hTzhweKfqNO8Y3fvDzQ/ABYvX4lftyx4EYJ9QXUz6NnRkRfQ/czfOiygmW3i23XWMf8o6/11sc35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2lqsUGQGjT7GkBuCjKv+83YJn/yzZQclgGS+jlBsZ8=;
 b=BS4o/umC7pcUYyzXUPOzDRHfkNgQOONB//CqirpptUL0CSqI6qv+CmlYwFl9d9UQj+0ZC3VVVYEAu63WQHB1Ag+SOBJQG0QhAVkx+0Ro9vuDl33rx/x56rZL2CcDr+NtA18YLqkeOkuWvPoSo1//UOXfuiqCU+ZFP+n2VN/tok0=
Received: from SA9PR13CA0132.namprd13.prod.outlook.com (2603:10b6:806:27::17)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 04:38:36 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::c7) by SA9PR13CA0132.outlook.office365.com
 (2603:10b6:806:27::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.12 via Frontend Transport; Fri,
 20 Dec 2024 04:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:38:36 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:38:35 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 12/45] drm/plane: Add COLOR PIPELINE property
Date: Thu, 19 Dec 2024 21:33:18 -0700
Message-ID: <20241220043410.416867-13-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f50ff43-d75d-4031-1ced-08dd20b02b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QLd93Q8+UeQEb9m3oJr/WVwKjIVV9MM/czLxkeYg2GAJq0RHXWPM2cDZLmbl?=
 =?us-ascii?Q?mvt/BW6SAVbgwsvRxPzAzT8n0zivkYXjMhf7z/XkV+dA0efC0wdanBCO0Sfx?=
 =?us-ascii?Q?fXHPgzfwvrgjkl+JDjXS/cJkNOgrBq6IFjscWicZtEHySbN+Fxiq/n8YCviu?=
 =?us-ascii?Q?UHbUdVaYZuWQPG0xOZ1olbN8gnk2QN4ucPC21/Y/11N+FpkwUOosaUT2j7fO?=
 =?us-ascii?Q?gpXdLBHD56uKPz1IMjJezff99G9ODfz/g8zkgAu//oA6rU6oqvWRshCSih3/?=
 =?us-ascii?Q?YwCEe044So9qaFiY5FYa4B546vAK9/T3llMwKtaU7+aT2oFsr7ivjL9h8Hqa?=
 =?us-ascii?Q?Fj5JqwobOR76Xxj3s0hqZGEuEXLs8k8fci+CWrIea76o6w3xIXh4CBYFq0Mw?=
 =?us-ascii?Q?RyI+IkSmDAL30U0+ELoC028M7gMIpp7Hap1Fp8qVZfvzAhgJnZpLchtCJ92h?=
 =?us-ascii?Q?BdhfF57aOV7QFYFwfR21JNr/0CT1YT7vn3WFSES8kKVxZWLBpG/RzFP1Czqt?=
 =?us-ascii?Q?tc6Hbs/3gLQ54kD4y1WsrlBgL8SBKj98RTz1RPmnvTmccusqEqZfXdL0Gcru?=
 =?us-ascii?Q?s1HksV4SUUtTlzHAjtmuhe983nzUv0sNtNbSriOHWih4uhqoAJZxA3q/yEqr?=
 =?us-ascii?Q?WOmQv3p9BLUoS0jn6/ZhC/16PpZWG2TGdMQj+Gr5hz8JHyryUHR7qbtTpVsk?=
 =?us-ascii?Q?2j6htsCvjpYdj1hSIculyKFfdIhIecuMal+yW8VowysZjoF4cjQG0lyvQH7b?=
 =?us-ascii?Q?QmTwNeJ56lzgKhTePDRL8Fut4C18vYSFLKuDqdOHKuMh5wk9jB9pXefXUfgc?=
 =?us-ascii?Q?Gu+1WIeHJnbCFRbWk8GvhMV326/1tWEZ2dM6TyUN9XTyaKrcEzAUYt7OZ1dc?=
 =?us-ascii?Q?k9VvTBGNSADRG5LgABiObviBS9fsB7RkTfzYQ6Ji4J+cJTKY9nAAjfDeDWl+?=
 =?us-ascii?Q?598InfOyXchzBH44bEoUuNc4ZTqVoiYeKV4J7OxohFFmvD88xFsyY3EK5y3Y?=
 =?us-ascii?Q?AA2U+r3eRHsMpmzOCJ0x6jumVLjPper73xfCfA3lg5X8pARUakIs3bLTyUCp?=
 =?us-ascii?Q?WcPaGBWAsMLQ16G3+jJHjL0ndZGdXmBUrJfbu90tuMtCnPzCbpJmdYNDaAGT?=
 =?us-ascii?Q?O5RHfhYZE3SBagOhyU5mM/nZijDHfFYy/T0r9md1pRoBW+0F70Kj3HbEVsEF?=
 =?us-ascii?Q?1OTuc9vcOJnyLcW7SZ8W3gNGZ8fVorF/uguy01mZP3roS6MTmb6Sf8WCyU1K?=
 =?us-ascii?Q?wVNiXM2gxJHPAMebvWDrc/xIQxWvf+IR0gGL6uTmJiJqaLvyeXf/1wUlNxYI?=
 =?us-ascii?Q?Arhc39EDVfY6i1We4HdEGSFyg3NFcEkWfaBr5zwNppQPesObOZamdsB2xpUC?=
 =?us-ascii?Q?GYpSrmuyc9y1HocUO1mgAHntaRDhT7AQwwQxtHz5SDA80m+fiUxD/r5cg3M6?=
 =?us-ascii?Q?6JIb31UO5XXVxHbJtgBbONiy20LKXKA3pkq0Q5oiGBc+rB1+n6E6ynWGd85t?=
 =?us-ascii?Q?r477fiPDpiVY5vk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:38:36.5333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f50ff43-d75d-4031-1ced-08dd20b02b1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Fix a checkpatch warning - a new line after variable declaration

v4:
 - Add pipeline property creation helper (Pekka)
 - Fix function comment for
   drm_atomic_set_colorop_for_plane (Pekka)
 - Always create Bypass pipeline (Pekka)
 - Add missing function declaration (Chaitanya Kumar Borah)

 drivers/gpu/drm/drm_atomic.c              | 46 ++++++++++++++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 43 +++++++++++++++++++
 drivers/gpu/drm/drm_plane.c               | 52 +++++++++++++++++++++++
 include/drm/drm_atomic.h                  |  3 ++
 include/drm/drm_atomic_uapi.h             |  2 +
 include/drm/drm_plane.h                   | 11 +++++
 7 files changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 736fa6a11c08..35136987d5e8 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1461,6 +1461,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
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
index 8a038e04be58..f2503f56fc82 100644
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
@@ -539,6 +569,17 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
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
+		/* set it on drm_plane_state */
+		drm_atomic_set_colorop_for_plane(state, colorop);
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_property_replace_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -621,6 +662,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
index effd9302c979..feef16fd89e2 100644
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
2.43.0

