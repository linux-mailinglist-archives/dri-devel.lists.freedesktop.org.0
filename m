Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE7589E1E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 17:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9219AB5B;
	Thu,  4 Aug 2022 15:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80263968C1;
 Thu,  4 Aug 2022 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DhPzQ4uprWeFNMtx9BdIrbtqM+mhTyNnq7GC0V4sR28=; b=nLj57RmDW49eAEy0fEqVdMJnJm
 IYP6ZuMXqm+FnmWuOUCCOtoO0ZjozN4L35oVy/uvroZQdCtBwFXYLw3bTfAxE42rffO9E2k+15ODF
 1prVFL3Ne5QjXVIHWRugXtEz5EAImMgHS46KzF3YuuO8XPlihvBombXZN47E1lQxKFRebUviwJYlS
 1/8lK1Da2gmbyvAEeXaL5hE5o6vTup/+rMDJTSiE9+NnocdlWlVqUULuQ+51B5qqYAPcWcYGd5/2A
 nAyLbDfApvyHuPlNI/c+Xap8K53L6Ygc9hxvLPP14vDK+CL/PxCW0/7SVwOJ13yH1KC5rnoeU/Bhv
 0FwvMhbQ==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oJcLu-00GFt0-IJ; Thu, 04 Aug 2022 17:01:34 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, sungjoon.kim@amd.com, nicholas.kazlauskas@amd.com
Subject: [PATCH v2 4/4] Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for
 pixel blend mode
Date: Thu,  4 Aug 2022 14:01:07 -0100
Message-Id: <20220804150107.3435964-5-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220804150107.3435964-1-mwen@igalia.com>
References: <20220804150107.3435964-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMD GPU display manager (DM) maps DRM pixel blend modes (None,
Pre-multiplied, Coverage) to MPC hw blocks through blend configuration
options. Describe relevant elements and how to set and test them to get
the expected DRM blend mode on DCN hw.

v2:
- add ref tag (Tales)

Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Tales Aparecida <tales.aparecida@gmail.com>
---
 .../gpu/amdgpu/display/display-manager.rst    | 98 +++++++++++++++++++
 Documentation/gpu/drm-kms.rst                 |  2 +
 2 files changed, 100 insertions(+)

diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
index 88e2c08c7014..b7abb18cfc82 100644
--- a/Documentation/gpu/amdgpu/display/display-manager.rst
+++ b/Documentation/gpu/amdgpu/display/display-manager.rst
@@ -83,3 +83,101 @@ schemas.
 **DCN 3.0 family color caps and mapping**
 
 .. kernel-figure:: dcn3_cm_drm_current.svg
+
+Blend Mode Properties
+=====================
+
+Pixel blend mode is a DRM plane composition property of :c:type:`drm_plane` used to
+describes how pixels from a foreground plane (fg) are composited with the
+background plane (bg). Here, we present main concepts of DRM blend mode to help
+to understand how this property is mapped to AMD DC interface. See more about
+this DRM property and the alpha blending equations in :ref:`DRM Plane
+Composition Properties <plane_composition_properties>`.
+
+Basically, a blend mode sets the alpha blending equation for plane
+composition that fits the mode in which the alpha channel affects the state of
+pixel color values and, therefore, the resulted pixel color. For
+example, consider the following elements of the alpha blending equation:
+
+- *fg.rgb*: Each of the RGB component values from the foreground's pixel.
+- *fg.alpha*: Alpha component value from the foreground's pixel.
+- *bg.rgb*: Each of the RGB component values from the background.
+- *plane_alpha*: Plane alpha value set by the **plane "alpha" property**, see
+  more in :ref:`DRM Plane Composition Properties <plane_composition_properties>`.
+
+in the basic alpha blending equation::
+
+   out.rgb = alpha * fg.rgb + (1 - alpha) * bg.rgb
+
+the alpha channel value of each pixel in a plane is ignored and only the plane
+alpha affects the resulted pixel color values.
+
+DRM has three blend mode to define the blend formula in the plane composition:
+
+* **None**: Blend formula that ignores the pixel alpha.
+
+* **Pre-multiplied**: Blend formula that assumes the pixel color values in a
+  plane was already pre-multiplied by its own alpha channel before storage.
+
+* **Coverage**: Blend formula that assumes the pixel color values were not
+  pre-multiplied with the alpha channel values.
+
+and pre-multiplied is the default pixel blend mode, that means, when no blend
+mode property is created or defined, DRM considers the plane's pixels has
+pre-multiplied color values. On IGT GPU tools, the kms_plane_alpha_blend test
+provides a set of subtests to verify plane alpha and blend mode properties.
+
+The DRM blend mode and its elements are then mapped by AMDGPU display manager
+(DM) to program the blending configuration of the Multiple Pipe/Plane Combined
+(MPC), as follows:
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+   :doc: mpc-overview
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+   :functions: mpcc_blnd_cfg
+
+Therefore, the blending configuration for a single MPCC instance on the MPC
+tree is defined by :c:type:`mpcc_blnd_cfg`, where
+:c:type:`pre_multiplied_alpha` is the alpha pre-multiplied mode flag used to
+set :c:type:`MPCC_ALPHA_MULTIPLIED_MODE`. It controls whether alpha is
+multiplied (true/false), being only true for DRM pre-multiplied blend mode.
+:c:type:`mpcc_alpha_blend_mode` defines the alpha blend mode regarding pixel
+alpha and plane alpha values. It sets one of the three modes for
+:c:type:`MPCC_ALPHA_BLND_MODE`, as described below.
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+   :functions: mpcc_alpha_blend_mode
+
+DM then maps the elements of `enum mpcc_alpha_blend_mode` to those in the DRM
+blend formula, as follows:
+
+* *MPC pixel alpha* matches *DRM fg.alpha* as the alpha component value
+  from the plane's pixel
+* *MPC global alpha* matches *DRM plane_alpha* when the pixel alpha should
+  be ignored and, therefore, pixel values are not pre-multiplied
+* *MPC global gain* assumes *MPC global alpha* value when both *DRM
+  fg.alpha* and *DRM plane_alpha* participate in the blend equation
+
+In short, *fg.alpha* is ignored by selecting
+:c:type:`MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA`. On the other hand, (plane_alpha *
+fg.alpha) component becomes available by selecting
+:c:type:`MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN`. And the
+:c:type:`MPCC_ALPHA_MULTIPLIED_MODE` defines if the pixel color values are
+pre-multiplied by alpha or not.
+
+Blend configuration flow
+------------------------
+
+The alpha blending equation is configured from DRM to DC interface by the
+following path:
+
+1. When updating a :c:type:`drm_plane_state <drm_plane_state>`, DM calls
+   :c:type:`fill_blending_from_plane_state()` that maps
+   :c:type:`drm_plane_state <drm_plane_state>` attributes to
+   :c:type:`dc_plane_info <dc_plane_info>` struct to be handled in the
+   OS-agnostic component (DC).
+
+2. On DC interface, :c:type:`struct mpcc_blnd_cfg <mpcc_blnd_cfg>` programs the
+   MPCC blend configuration considering the :c:type:`dc_plane_info
+   <dc_plane_info>` input from DPP.
diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 6f9c064fd323..b4377a545425 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -532,6 +532,8 @@ Standard Plane Properties
 .. kernel-doc:: drivers/gpu/drm/drm_plane.c
    :doc: standard plane properties
 
+.. _plane_composition_properties:
+
 Plane Composition Properties
 ----------------------------
 
-- 
2.35.1

