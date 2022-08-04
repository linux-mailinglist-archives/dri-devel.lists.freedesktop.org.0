Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C8589E1D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 17:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 582F09ABC5;
	Thu,  4 Aug 2022 15:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911F5968C1;
 Thu,  4 Aug 2022 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K4BbdpvRRwsAL+5c5ml4ymkqUYqGr+bLVMoyLCLysDE=; b=rXuH7xxbofC0jYQnX/Y0mDapig
 Z22d5ohdlLJib9p1EhQ7uwoXym0a7t7W8Wmg+1J1GSxRXfNxkMryn7U3KfDeLj6oeQZEclRLohfFx
 ywMpjcP4nB4dwHX9or+/bGwc1pJOgoB4Y3FdG7xcoY370Oy/4gX78gxZ8Xz3ntYRll8DuTWhotHBb
 tc+WC+gQVR88AxIXV3AwTJ1/L4QLosVRDDd4PzG0MwG+2swjTlXSMcVnTuVGpV9q0n4X5Fi5Ssa4O
 d9AzMnNQE926qqbJ0JkwuptnPty/NtFoHEya/JFgY0UfsKR1envKaT1l32i8zfW7XmV4rTl9b2cEz
 lddCpOTw==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oJcLq-00GFt0-Is; Thu, 04 Aug 2022 17:01:30 +0200
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, sungjoon.kim@amd.com, nicholas.kazlauskas@amd.com
Subject: [PATCH v2 3/4] drm/amd/display: add doc entries for MPC blending
 configuration
Date: Thu,  4 Aug 2022 14:01:06 -0100
Message-Id: <20220804150107.3435964-4-mwen@igalia.com>
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

Describe structs and enums used to set blend mode properties to MPC
blocks. Some pieces of information are already available as code
comments, and were just formatted. Others were collected and summarised
from discussions on AMD issue tracker[1][2].

[1] https://gitlab.freedesktop.org/drm/amd/-/issues/1734
[2] https://gitlab.freedesktop.org/drm/amd/-/issues/1769

v2:
- fix typos (Tales)
- add MPCC to MPC entry in the glossary

Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Tales Aparecida <tales.aparecida@gmail.com>
---
 .../gpu/amdgpu/display/dc-glossary.rst        |  2 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 91 ++++++++++++++++---
 2 files changed, 78 insertions(+), 15 deletions(-)

diff --git a/Documentation/gpu/amdgpu/display/dc-glossary.rst b/Documentation/gpu/amdgpu/display/dc-glossary.rst
index 116f5f0942fd..0b0ffd428dd2 100644
--- a/Documentation/gpu/amdgpu/display/dc-glossary.rst
+++ b/Documentation/gpu/amdgpu/display/dc-glossary.rst
@@ -170,7 +170,7 @@ consider asking in the amdgfx and update this page.
     MC
       Memory Controller
 
-    MPC
+    MPC/MPCC
       Multiple pipes and plane combine
 
     MPO
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 5097037e3962..8d86159d9de0 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -22,6 +22,16 @@
  *
  */
 
+/**
+ * DOC: mpc-overview
+ *
+ * Multiple Pipe/Plane Combined (MPC) is a component in the hardware pipeline
+ * that performs blending of multiple planes, using global and per-pixel alpha.
+ * It also performs post-blending color correction operations according to the
+ * hardware capabilities, such as color transformation matrix and gamma 1D and
+ * 3D LUT.
+ */
+
 #ifndef __DC_MPCC_H__
 #define __DC_MPCC_H__
 
@@ -48,14 +58,39 @@ enum mpcc_blend_mode {
 	MPCC_BLEND_MODE_TOP_BOT_BLENDING
 };
 
+/**
+ * enum mpcc_alpha_blend_mode - define the alpha blend mode regarding pixel
+ * alpha and plane alpha values
+ */
 enum mpcc_alpha_blend_mode {
+	/**
+	 * @MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA: per pixel alpha using DPP
+	 * alpha value
+	 */
 	MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA,
+	/**
+	 * @MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN: per
+	 * pixel alpha using DPP alpha value multiplied by a global gain (plane
+	 * alpha)
+	 */
 	MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAIN,
+	/**
+	 * @MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA: global alpha value, ignores
+	 * pixel alpha and consider only plane alpha
+	 */
 	MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA
 };
 
-/*
- * MPCC blending configuration
+/**
+ * struct mpcc_blnd_cfg - MPCC blending configuration
+ *
+ * @black_color: background color
+ * @alpha_mode: alpha blend mode (MPCC_ALPHA_BLND_MODE)
+ * @pre_multiplied_alpha: whether pixel color values were pre-multiplied by the
+ * alpha channel (MPCC_ALPHA_MULTIPLIED_MODE)
+ * @global_gain: used when blend mode considers both pixel alpha and plane
+ * alpha value and assumes the global alpha value.
+ * @global_alpha: plane alpha value
  */
 struct mpcc_blnd_cfg {
 	struct tg_color black_color;	/* background color */
@@ -107,8 +142,15 @@ struct mpc_dwb_flow_control {
 	int flow_ctrl_cnt1;
 };
 
-/*
- * MPCC connection and blending configuration for a single MPCC instance.
+/**
+ * struct mpcc - MPCC connection and blending configuration for a single MPCC instance.
+ * @mpcc_id: MPCC physical instance
+ * @dpp_id: DPP input to this MPCC
+ * @mpcc_bot: pointer to bottom layer MPCC. NULL when not connected.
+ * @blnd_cfg: the blending configuration for this MPCC
+ * @sm_cfg: stereo mix setting for this MPCC
+ * @shared_bottom: if MPCC output to both OPP and DWB endpoints, true. Otherwise, false.
+ *
  * This struct is used as a node in an MPC tree.
  */
 struct mpcc {
@@ -120,8 +162,12 @@ struct mpcc {
 	bool shared_bottom;		/* TRUE if MPCC output to both OPP and DWB endpoints, else FALSE */
 };
 
-/*
- * MPC tree represents all MPCC connections for a pipe.
+/**
+ * struct mpc_tree - MPC tree represents all MPCC connections for a pipe.
+ *
+ * @opp_id: the OPP instance that owns this MPC tree
+ * @opp_list: the top MPCC layer of the MPC tree that outputs to OPP endpoint
+ *
  */
 struct mpc_tree {
 	int opp_id;			/* The OPP instance that owns this MPC tree */
@@ -149,13 +195,18 @@ struct mpcc_state {
 	uint32_t busy;
 };
 
+/**
+ * struct mpc_funcs - funcs
+ */
 struct mpc_funcs {
 	void (*read_mpcc_state)(
 			struct mpc *mpc,
 			int mpcc_inst,
 			struct mpcc_state *s);
 
-	/*
+	/**
+	 * @insert_plane:
+	 *
 	 * Insert DPP into MPC tree based on specified blending position.
 	 * Only used for planes that are part of blending chain for OPP output
 	 *
@@ -180,7 +231,9 @@ struct mpc_funcs {
 			int dpp_id,
 			int mpcc_id);
 
-	/*
+	/**
+	 * @remove_mpcc:
+	 *
 	 * Remove a specified MPCC from the MPC tree.
 	 *
 	 * Parameters:
@@ -195,7 +248,9 @@ struct mpc_funcs {
 			struct mpc_tree *tree,
 			struct mpcc *mpcc);
 
-	/*
+	/**
+	 * @mpc_init:
+	 *
 	 * Reset the MPCC HW status by disconnecting all muxes.
 	 *
 	 * Parameters:
@@ -208,7 +263,9 @@ struct mpc_funcs {
 			struct mpc *mpc,
 			unsigned int mpcc_id);
 
-	/*
+	/**
+	 * @update_blending:
+	 *
 	 * Update the blending configuration for a specified MPCC.
 	 *
 	 * Parameters:
@@ -223,7 +280,9 @@ struct mpc_funcs {
 		struct mpcc_blnd_cfg *blnd_cfg,
 		int mpcc_id);
 
-	/*
+	/**
+	 * @cursor_lock:
+	 *
 	 * Lock cursor updates for the specified OPP.
 	 * OPP defines the set of MPCC that are locked together for cursor.
 	 *
@@ -239,8 +298,10 @@ struct mpc_funcs {
 			int opp_id,
 			bool lock);
 
-	/*
-	 * Add DPP into 'secondary' MPC tree based on specified blending position.
+	/**
+	 * @insert_plane_to_secondary:
+	 *
+	 * Add DPP into secondary MPC tree based on specified blending position.
 	 * Only used for planes that are part of blending chain for DWB output
 	 *
 	 * Parameters:
@@ -264,7 +325,9 @@ struct mpc_funcs {
 			int dpp_id,
 			int mpcc_id);
 
-	/*
+	/**
+	 * @remove_mpcc_from_secondary:
+	 *
 	 * Remove a specified DPP from the 'secondary' MPC tree.
 	 *
 	 * Parameters:
-- 
2.35.1

