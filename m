Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB5A86829E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 22:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A6410F24F;
	Mon, 26 Feb 2024 21:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oM7blnQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF4D10EEF5;
 Mon, 26 Feb 2024 21:11:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUQ9LErh0Jrlr0vgEx5iW4wsuydDOnDv/JLlTttGdIDAEijOjTaovaajsOvSN5quxtOLqF3erFzgsSklHyl4EnfXR4mrAHocecwVf9ikdQ+L7iQVtFz+fknorqRpuBrOUtmcjizkXQxpX7CEB08g4Hs6IZAXIOk4w/uv1m/3UyJk8JxYc9QdMdN3KzEEZHlIbOgyOeZAhFkrNaLQtTsVP7oJs+WNiKg4AKF6cVeI2SyxvPsmcbaOf8So+pu7SzVuuBg7eGRup1DNOn4bYAeMCFk49gue3A1LPYVDBLJLN1Qm+Uy7FNVvDUlkIWGqolpw42oERDrRV8yv66NfZgz0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h67YiQPbrCZWiwEM0EPO3XP4cfOKBaAWZ4NxkFnqqVw=;
 b=jrnDguQOY2UhkFSsxZ74jQjwrQwWkUThrZD0MeevYIr0Uh0f3W3lMv2Cee8fSjaWGMy1WhBl9JLcz3jQoCsLhAS+kSxnc+uGhXZVBFQ7scfBpMR5umlfmVsbngwUmkdc++cgr29GWjyDQexk3evHDOzROSCgD3rzM2abbr+/ZsFZfetb+6SXa6G3G6iOxaBUT90YPds3hRyCTC0/jislDEwlIs8lC7sZdqFI05XownMR0T7z5funkvLUwePn8qETTKOzM6CRnAkbD4pCaviTT8TqYACby8dr5fxhnp+9gVjZjY7+wnLDYfFmwk3fHi/ajgI3Re0V9oFMoGlbB0d29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h67YiQPbrCZWiwEM0EPO3XP4cfOKBaAWZ4NxkFnqqVw=;
 b=oM7blnQrs1DiZK1+cPi1NlHgtHdCLDeYiAiigu8TtTNJtCl34iFKPljl0RjMIr6kCwBE9qSCNNbLnKJiI8fewpni9+zI6+EBuHYBJ4RkHxbgLf9QcxBDtdgEGolSuQ710FeK4LFZ14P1bx/1cskvWQjbI3O4QaJ/fSopb0sbqMk=
Received: from CH0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:610:74::9)
 by DS0PR12MB8071.namprd12.prod.outlook.com (2603:10b6:8:df::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.34; Mon, 26 Feb 2024 21:11:18 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::5e) by CH0PR04CA0064.outlook.office365.com
 (2603:10b6:610:74::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:11:18 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:13 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:11:12 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:11:12 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, Harry Wentland
 <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [RFC PATCH v4 11/42] drm/colorop: Add 1D Curve subtype
Date: Mon, 26 Feb 2024 16:10:25 -0500
Message-ID: <20240226211100.100108-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211100.100108-1-harry.wentland@amd.com>
References: <20240226211100.100108-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS0PR12MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: baa16538-9574-48fa-fcb3-08dc370f79bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QwCn0ZvVvImFaD0bPGSVtDEonmDdLH3bJThgteCOlJjRB9pkPRBtkdJ03yi9w7psq3VPQv3r8/Fg891l5cBBOyV1im2Wx5HbL6eh8BQ9FPT5IStUoKoDus1+qxzlrrlU1Jp5bBmkWEo3rlZ9mlqAhrvObH7ttAoDlZ5/CdTg2sz+CwiLyUAv9aszFj6pKH0G8dhHFJdqLNKPM32+hBVQxXKHJwNb8aPr0Dg0uA2DBvYS+bD4lRx44HBewBV8gmc9qJ7CLyJCFX3kPsHwIZ4awl5K8qem3zuNPyWAQirvlLwyMEgzCXm7OBnN21N4Ye/9j+iXF8iWf5OKxsdPqF3nIoEjizdnEBFsze/pIuW65zHOel1Tlc3PWJPTudx9RIODN3fF08iX6XbT31Hzsj5uLsqovWtb3uaxXc4tyn44bdP0R0vdnjGjfVsS5txH3aB7lbg+kidbzQnr06ihQ0MZNkLWuC6rypD4EoWv+nQ4PpfEP93uT34bZHdqg1tA02h6qnPCqm2K4cMdO4GB22cXq+1FYbYJzayz3gdCuyyPCLSpX7Gdz4QfpHMZmKiNXgftiNWKucKHWHLVKUAXHe00lkLFoJTM/pMmhBsrfqTHHU2GuVt5G4L7lU5cW7U9EqvhmyNhnEzk5azMXu7kyu1tqxbPqf+odExdEYLbR+PBdeese1vlpJRc+4Qg0RJaeFCAqtNDtXPwdxgApvETDlTCW+qF3LJIhutXB32Iiy6qWImCTjyp/AO7SHZvBvoFahzj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:11:18.5230 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baa16538-9574-48fa-fcb3-08dc370f79bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071
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

v4:
 - Use drm_colorop_curve_1d_type_enum_list to get name (Pekka)
 - Create separate init function for 1D curve
 - Pass supported TFs into 1D curve init function

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Co-developed-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 18 +++++---
 drivers/gpu/drm/drm_colorop.c     | 71 +++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         | 24 +++++++++++
 3 files changed, 108 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index e3067c095c72..fdd540cfe24f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -648,11 +648,17 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 		struct drm_colorop_state *state, struct drm_file *file_priv,
 		struct drm_property *property, uint64_t val)
 {
-	drm_dbg_atomic(colorop->dev,
-			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
-			colorop->base.id,
-			property->base.id, property->name);
-	return -EINVAL;
+	if (property == colorop->curve_1d_type_property) {
+		state->curve_1d_type = val;
+	} else {
+		drm_dbg_atomic(colorop->dev,
+			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]]\n",
+			       colorop->base.id, colorop->type,
+			       property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
 }
 
 static int
@@ -662,6 +668,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 {
 	if (property == colorop->type_property) {
 		*val = colorop->type;
+	} else if (property == colorop->curve_1d_type_property) {
+		*val = state->curve_1d_type;
 	} else {
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 3a07a8fe2842..f4740b6115d1 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -36,6 +36,12 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_1D_CURVE, "1D Curve" },
 };
 
+static const char * const colorop_curve_1d_type_names[] = {
+	[DRM_COLOROP_1D_CURVE_SRGB_EOTF] = "sRGB EOTF",
+	[DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF] = "sRGB Inverse EOTF",
+};
+
+
 /* Init Helpers */
 
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -78,6 +84,56 @@ int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 }
 EXPORT_SYMBOL(drm_colorop_init);
 
+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs)
+{
+	struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
+	int i, len;
+
+	struct drm_property *prop;
+	int ret;
+
+	if (!supported_tfs) {
+		drm_err(dev,
+			"No supported TFs for new 1D curve colorop on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if ((supported_tfs & -BIT(DRM_COLOROP_1D_CURVE_COUNT)) != 0) {
+		drm_err(dev, "Unknown TF provided on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_CURVE);
+	if (ret)
+		return ret;
+
+	len = 0;
+	for (i = 0; i < DRM_COLOROP_1D_CURVE_COUNT; i++) {
+		if ((supported_tfs & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = colorop_curve_1d_type_names[i];
+		len++;
+	}
+
+	/* initialize 1D curve only attribute */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CURVE_1D_TYPE",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->curve_1d_type_property = prop;
+	drm_object_attach_property(&colorop->base, colorop->curve_1d_type_property, 0);
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_curve_1d_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -192,3 +248,18 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type)
 
 	return colorop_type_name[type];
 }
+
+/**
+ * drm_get_colorop_curve_1d_type_name - return a string for 1D curve type
+ * @range: 1d curve type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_curve_1d_type_names)))
+		return "unknown";
+
+	return colorop_curve_1d_type_names[type];
+}
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index cb98c55f8387..539db900f16f 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -30,6 +30,12 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_property.h>
 
+enum drm_colorop_curve_1d_type {
+	DRM_COLOROP_1D_CURVE_SRGB_EOTF,
+	DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF,
+	DRM_COLOROP_1D_CURVE_COUNT
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -39,6 +45,13 @@ struct drm_colorop_state {
 
 	/* colorop properties */
 
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Type of 1D curve.
+	 */
+	enum drm_colorop_curve_1d_type curve_1d_type;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -118,6 +131,14 @@ struct drm_colorop {
 	 * this color operation. The type is enum drm_colorop_type.
 	 */
 	struct drm_property *type_property;
+
+	/**
+	 * @curve_1d_type:
+	 *
+	 * Sub-type for DRM_COLOROP_1D_CURVE type.
+	 */
+	struct drm_property *curve_1d_type_property;
+
 };
 
 #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
@@ -144,6 +165,9 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
 int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 		     struct drm_plane *plane, enum drm_colorop_type type);
 
+int drm_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
+			      struct drm_plane *plane, u64 supported_tfs);
+
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
 
-- 
2.44.0

