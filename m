Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D3D7E5B6B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C394210E7CB;
	Wed,  8 Nov 2023 16:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6BA10E7C8;
 Wed,  8 Nov 2023 16:38:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1Uvvx++Ze2syBZ133mFobBirQLNG7ruc4BSK0/y5u8H6gyJEsujODLw7iyHALIJaZqgO9t64Y6JXe/aEl9IvqtMXtN4gWhGeibWfQjLokXyJkvSf9aEUf+VWaJ4zW+DlUA2haMKGrxgrZFnZ4mLET2EfgzI/WWhLSZlBpydNvkgYrhydFSrJ7ZVdjeSa4TW5rSB/Za3E0KZzMn2aNpZyCOVKA4pPwtfAL2SjT3qIh+8S1a8ibB+8Mo4gVJfPueq9+9yVT0GHK0U1+67KTK5tp38PN5RkcxGQYi5LzugEbMeYAGQsqAzMDlRjFC6B1/taYJFsL/62jCB9AKuI85coQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3RWD3YKVqTKwdaUAr/hpZ4f37qCbtFqSUrkiX3X0Lk=;
 b=U4JBa/Uqd1k/YhuSLjUaw9JchUpI1TniL0Uq6CVP/XlVhVGt1oubeFfiVzSnpya/VWDVlGP4IsXI1z19annLk1HvJ3M5WjrDm8OQbdeHZE5gdta2o8KiWCZD/LY2sFurcHWn6hWAgrT+vy4+u4kWBcsYdCqRnYAkRjLrs9p2ZeaRsRS7oY6JDg2jVPEJWqLj9GkK9BHSLGd4xDmU5rWUUuMilErmMHXKXzyGcoJCakxHEt4NBDAN2NvT+SBslLw7oel9aXRFcL0yX/IIpNZakbfEaCVdzYdp5rgX368W1LbT+LhFkgIECJiqypSrb9uIx/Kjx10SQRgda8SRybwJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3RWD3YKVqTKwdaUAr/hpZ4f37qCbtFqSUrkiX3X0Lk=;
 b=0zSgZA+c96acL44xrAN7Z/QKkbrZgY1YvYqaOF2qK1xOpNO8tQNCAn/yKDHU+4hhq/f7hm2YJNVpfPlTN7poKk+F3q1pwR9ZA2Wvxbbo0oWhLGAvxzb+YZ9dDmaiP6+pCQkKothue9TQ1cpils9yme6WqJlTbgxcgV9pr8sCuts=
Received: from CY5PR22CA0050.namprd22.prod.outlook.com (2603:10b6:930:1d::17)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:38:01 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::cd) by CY5PR22CA0050.outlook.office365.com
 (2603:10b6:930:1d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:38:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:55 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:17 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:16 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 13/23] drm/plane: Add COLOR PIPELINE property
Date: Wed, 8 Nov 2023 11:36:32 -0500
Message-ID: <20231108163647.106853-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: dc45be7f-a1c1-4c78-086a-08dbe0791245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sz+D/L4A0viG+hvlLaGUPt8XL+XPtcaSgGDkZS3iLrPCOYl3fnZjE9XrjKH9tMYI6E37PKwNyTui+Ch4qakMnj8U72OV6n32aacbrqZa8qWM5KecbV1jMCoY3PcTxNhlRqfqAnT6/3KzxBz7pMaN36274sTfxO8iPFOpAkiVEH2+Zc7ladPvXY61cYyPw5Xju3MeCgQ+J856PNZn8rzklvGDOWdfeM4n4pArkl+w14uWkJszmQihd8US83lOfjl5ZJKlVmGejbDBxErqCKtO9y7okBFKL+toR6C+KJgQiS+46OeurFXike5RP2O/Jh9k/6OwpZoizkgLjfIj4rli3VdgvZOGx7NuXJ7jRdolYpHFUDpo0lzaS51FKuA2SDTihQvuJR5JawyLdwnhYZ1dDyZn6l7fD7CrAUM7xxMcUYwFIFiyt8tVAK9f4eLryPt1gxo2DjZjp9/TPSHArflaRFSFUfK1q2YdoXw+nvPQi3jw5W/2nc1sgWLNg6GCgV/R21RJBXjEUpxRDzxbkSiANTkh/N6EKpBdAFOY0mFkf63m5mvkAfU+rQMifw8fEXqKP0GR05qy8iPwnLP0S7ZklcI3eqmddeN/TOtUyespv4J4oouHlG6GjdvRIFb7sPVohP/iNfbSMG+ZAuChrsxwgGE7FMxb5HFc8kF7CbfuzGRAHq+O2vEqNy4tytHH/xGefEDMRRwvXOqqAbb+xuA62mGht3wEYXpdENcyVretcMkHjM0Hk9fEkrQ9rty+6fLYDpf15hhG68jLegPVreccdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(336012)(47076005)(41300700001)(6666004)(426003)(26005)(2616005)(1076003)(81166007)(356005)(82740400003)(86362001)(5660300002)(4326008)(44832011)(6916009)(2906002)(83380400001)(8676002)(8936002)(478600001)(54906003)(450100002)(36756003)(36860700001)(70586007)(70206006)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:38:00.4142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc45be7f-a1c1-4c78-086a-08dbe0791245
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711
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
Cc: wayland-devel@lists.freedesktop.org
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
 drivers/gpu/drm/drm_atomic.c              | 46 +++++++++++++++++++++++
 drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++
 drivers/gpu/drm/drm_atomic_uapi.c         | 44 ++++++++++++++++++++++
 include/drm/drm_atomic_uapi.h             |  2 +
 include/drm/drm_plane.h                   |  8 ++++
 5 files changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index ccf26b034433..cf3cb6d1239f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1463,6 +1463,52 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
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
index 784e63d70a42..3c5f2c8e33d0 100644
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
index a8f7a8a6639a..c6629fdaa114 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -256,6 +256,38 @@ drm_atomic_set_fb_for_plane(struct drm_plane_state *plane_state,
 }
 EXPORT_SYMBOL(drm_atomic_set_fb_for_plane);
 
+
+/**
+ * drm_atomic_set_colorop_for_plane - set colorop for plane
+ * @plane_state: atomic state object for the plane
+ * @colorop: colorop to use for the plane
+ *
+ * Changing the assigned framebuffer for a plane requires us to grab a reference
+ * to the new fb and drop the reference to the old fb, if there is one. This
+ * function takes care of all these details besides updating the pointer in the
+ * state object itself.
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
@@ -581,6 +613,16 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
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
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -647,6 +689,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_encoding;
 	} else if (property == plane->color_range_property) {
 		*val = state->color_range;
+	} else if (property == plane->color_pipeline_property) {
+		*val = (state->color_pipeline) ? state->color_pipeline->base.id : 0;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
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
index 57bbd0cd73a9..e65074f266c0 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -745,6 +745,14 @@ struct drm_plane {
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
-- 
2.42.1

