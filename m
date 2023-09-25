Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65AA7AE00F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D892210E319;
	Mon, 25 Sep 2023 19:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A3810E2E7;
 Mon, 25 Sep 2023 19:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PxoXexf4rb9Bs/2tc3hugKe5I3xiiz+Rt78QsCsb+ZQ=; b=XD7qxIlPXsl7pBqXmG48O4oWZX
 4C9D6LcHN9eI2re+XaI0Jm++5fDoGlGTYrrnc3GCXNHePSnon6QpnUwO4SCfXJ279SHs1ox34xqhv
 5fedD2vyz11fY063SNL+l+PWsYkD1yuwl0DhkuU+BKI7jyEQLmBvQH87JmhKuPOzhjApCN66unNt3
 tY8XkViZhObXiFANlmwnhujqXcW/wqkpjzU/0RCwNVJ4N8mvD8cgHuM8Iu0MEsSjjaQ1tlrb2O3Fv
 pIbL25ZIzYczvKXQOXHXWmrWlv+SsSKctW1StzuJ7mtWpxyazEoPjipaGRWFfuthqLiN/Zfi7qjOC
 fyNyDIAQ==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkraw-008GsG-0U; Mon, 25 Sep 2023 21:50:14 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 17/32] drm/amd/display: mark plane as needing reset if
 color props change
Date: Mon, 25 Sep 2023 18:49:17 -0100
Message-Id: <20230925194932.1329483-18-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194932.1329483-1-mwen@igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

We should reset a plane state if at least one of the color management
properties differs from old and new state.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Joshua Ashton <joshua@froggi.es>
Co-developed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1ab2e0ecfb1d..f239326d85b9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9660,6 +9660,10 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	 */
 	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other_state, i) {
 		struct amdgpu_framebuffer *old_afb, *new_afb;
+		struct dm_plane_state *dm_new_other_state, *dm_old_other_state;
+
+		dm_new_other_state = to_dm_plane_state(new_other_state);
+		dm_old_other_state = to_dm_plane_state(old_other_state);
 
 		if (other->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
@@ -9696,6 +9700,17 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		    old_other_state->color_encoding != new_other_state->color_encoding)
 			return true;
 
+		/* HDR/Transfer Function changes. */
+		if (dm_old_other_state->degamma_tf != dm_new_other_state->degamma_tf ||
+		    dm_old_other_state->degamma_lut != dm_new_other_state->degamma_lut ||
+		    dm_old_other_state->hdr_mult != dm_new_other_state->hdr_mult ||
+		    dm_old_other_state->shaper_lut != dm_new_other_state->shaper_lut ||
+		    dm_old_other_state->shaper_tf != dm_new_other_state->shaper_tf ||
+		    dm_old_other_state->lut3d != dm_new_other_state->lut3d ||
+		    dm_old_other_state->blend_lut != dm_new_other_state->blend_lut ||
+		    dm_old_other_state->blend_tf != dm_new_other_state->blend_tf)
+			return true;
+
 		/* Framebuffer checks fall at the end. */
 		if (!old_other_state->fb || !new_other_state->fb)
 			continue;
-- 
2.40.1

