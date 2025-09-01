Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4DB3F0A1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 23:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B265C10E0B0;
	Mon,  1 Sep 2025 21:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Gx0KrJni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C80610E0B0;
 Mon,  1 Sep 2025 21:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O8LmMWYcTlwAMuBd9MAdOTreyL7F+1Zp4nXVcPoNcfE=; b=Gx0KrJniUZrNt3oMnvRtEowgHc
 Hfg5v64UNpCgrHE+/pK65lq/alDyYJ4UrSwZpzdpx+35YmoVxtiqoHMYCWIoGeYtzoxtS/WYssHQA
 L7PNmw9gtakHtDNxxNnd1bhrRSVbpVdZF9VrZg18XZx3Za5Mo7HZ6Pr+g473Bibtrp6Z/cdoKjuHy
 cNNTvjJGZWrly60J92eGbVt3Q556fnv9xQwxIJwkcx8lh1hQwZgrJRM6Os3rFjyVxO/4qR1fqW8TD
 K8KEw3qfhLhjIk4NjJ9eYA8N6q1sITBcbLinCA1ecve94N45oUQVvE9r+wJSlJPSt/G5qQ2U3J61b
 n1TuJI3g==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1utCK9-005Rmr-4P; Mon, 01 Sep 2025 23:44:25 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Christopher Snowhill <kode54@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v2 1/2] drm/amd/display: update color on atomic commit time
Date: Mon,  1 Sep 2025 18:33:16 -0300
Message-ID: <20250901214413.12675-2-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901214413.12675-1-mwen@igalia.com>
References: <20250901214413.12675-1-mwen@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use `atomic_commit_setup` to change the DC stream state. It's a
preparation to remove from `atomic_check` changes in CRTC color
components of DC stream state and prevent DC to commit TEST_ONLY
changes.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4444
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 242f98564261..9bd82e04fe5c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -233,6 +233,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
 
 static int amdgpu_dm_connector_get_modes(struct drm_connector *connector);
 
+static int amdgpu_dm_atomic_setup_commit(struct drm_atomic_state *state);
 static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state);
 
 static int amdgpu_dm_atomic_check(struct drm_device *dev,
@@ -3651,7 +3652,7 @@ static const struct drm_mode_config_funcs amdgpu_dm_mode_funcs = {
 
 static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
 	.atomic_commit_tail = amdgpu_dm_atomic_commit_tail,
-	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
+	.atomic_commit_setup = amdgpu_dm_atomic_setup_commit,
 };
 
 static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
@@ -10279,6 +10280,39 @@ static void amdgpu_dm_update_hdcp(struct drm_atomic_state *state)
 	}
 }
 
+static int amdgpu_dm_atomic_setup_commit(struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
+	int i, ret;
+
+	ret = drm_dp_mst_atomic_setup_commit(state);
+	if (ret)
+		return ret;
+
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
+		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+		/*
+		 * Color management settings. We also update color properties
+		 * when a modeset is needed, to ensure it gets reprogrammed.
+		 */
+		if (dm_new_crtc_state->base.active && dm_new_crtc_state->stream &&
+		    (dm_new_crtc_state->base.color_mgmt_changed ||
+		     dm_old_crtc_state->regamma_tf != dm_new_crtc_state->regamma_tf ||
+		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
+			ret = amdgpu_dm_update_crtc_color_mgmt(dm_new_crtc_state);
+			if (ret) {
+				pr_info("BUG when updating crtc color\n");
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_atomic_commit_tail() - AMDgpu DM's commit tail implementation.
  * @state: The atomic state to commit
-- 
2.47.2

