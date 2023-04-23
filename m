Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C39206EC036
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F69C10E41B;
	Sun, 23 Apr 2023 14:14:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A45010E416;
 Sun, 23 Apr 2023 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=av8LLs8d/qgSpvCdtPWbCDxJo/b1Zt+to8SoXN3tsd4=; b=Wc6qM5pMHNGlmoH2r7Y20qQVBp
 NKC+XbkMbfhKMprtukVJt0Z3Hzi2/3R88FYmXDbi1XMux2VfCQ2+GUIwleAJ7MPYyXb8L6kAHGn1u
 39U8bG5NZyU8GtHxABQ5ystAiLdgU5DLuKmtmMtB9nWSSYFZ4tqRTNbgyGm+V5Z6bn7QoafOVYS1Z
 zkAg8IXz0XjRFoqPMPRuyL/a8kdnN8ItCPt57F02eEsaF5PKDCbhtTxY5/pTESDnERfs3UYazgTHS
 g/4hBaT+VASklXTwWmidyr07D28OJzyX3UPkqnS0VIJZ6pSolPWDiUAqHAu+Nh2AzaW1a+yzabwQY
 gL4oFuoA==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaTW-00ANVs-29; Sun, 23 Apr 2023 16:13:58 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 35/40] drm/adm/display: add HDR multiplier support
Date: Sun, 23 Apr 2023 13:10:47 -0100
Message-Id: <20230423141051.702990-36-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joshua Ashton <joshua@froggi.es>

With `dc_fixpt_from_s3132()` translation, we can just use it to set
hdr_mult.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index c0321272c129..0e3b6d414ec4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7991,6 +7991,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			bundle->surface_updates[planes_count].gamma = dc_plane->gamma_correction;
 			bundle->surface_updates[planes_count].in_transfer_func = dc_plane->in_transfer_func;
 			bundle->surface_updates[planes_count].gamut_remap_matrix = &dc_plane->gamut_remap_matrix;
+			bundle->surface_updates[planes_count].hdr_mult = dc_plane->hdr_mult;
 		}
 
 		amdgpu_dm_plane_fill_dc_scaling_info(dm->adev, new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index d714728ca143..854510b05194 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -939,6 +939,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
 
 #ifdef CONFIG_STEAM_DECK
+	dc_plane_state->hdr_mult = dc_fixpt_from_s3132(dm_plane_state->hdr_mult);
+
 	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
 	if (ret != -EINVAL)
 		return ret;
@@ -969,5 +971,6 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 			return ret;
 	}
 
+
 	return 0;
 }
-- 
2.39.2

