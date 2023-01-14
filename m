Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEEB66AB76
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 14:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528D010E080;
	Sat, 14 Jan 2023 13:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D031310E080;
 Sat, 14 Jan 2023 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ahP7iHedGLjDB4IYyG19dWKuUkhVdOTZ48Fj8bXqNqg=; b=MYsGi6qOahttpMQOXap7WOYFPQ
 TxUpv+ZSB3PIJFo4Y8uMrIqttpFFR5I0YZOu4wr52xavDlWgv0GAi/GlJLmL7wYBek1ravtpeT7py
 DgKE9+9K88Vpynf7PoWUimppwCPSbcYNUC5K2aCxeJFpo2cmXN4yOc/Y82auFwuw62uzCvsncX2vH
 hDcn6WU3DSb/8gUmbhYp/eqPM3HyF5N7vIIAtPJIw17ZXzcXFwm3qWeLcQdYvHJquJk5in97mRIEf
 1tlUD/rQeoc2NknAf9yS2rHzRTAM11GYYHg02gUfmvaphKSkoGMlWq95fnU9LQb3d1TxV9MFBrw2j
 Sa7gmn2w==;
Received: from [187.56.70.205] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pGgIL-007y9B-54; Sat, 14 Jan 2023 14:10:02 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: Fix warning caused by a bad fake property
Date: Sat, 14 Jan 2023 10:09:37 -0300
Message-Id: <20230114130937.778199-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: kernel@gpiccoli.net, Leo Li <sunpeng.li@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Mark Broadworth <mark.broadworth@amd.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Sung Joon Kim <Sungjoon.Kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 5468c36d6285 ("drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS")
added a validation on driver probe to prevent invalid TMDS modes. For that,
it requires to fake some plane properties before submitting to the validation
routines.

Happens that one of such fake properties (swizzle) causes a boot-time
warning due to an assert on swizzle routines. Since it's a fake property,
change it hereby to a valid value to prevent such warning. Also, while at
it, fix the unnecessary double assignment of this same property in code.

Fixes: 5468c36d6285 ("drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS")
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2264
Reported-by: Melissa Wen <mwen@igalia.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Mark Broadworth <mark.broadworth@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Sung Joon Kim <Sungjoon.Kim@amd.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---


Hi folks, notice my choice here was to set swizzle to DC_SW_LINEAR;
I've considered creating a new enum member (like "DC_SW_FAKE", or
something like that) but seems it's easier to just use the LINEAR
one. In my (very cheap!) understanding, this shouldn't affect the
purpose of the TMDS validation thing.

Lemme know if there's something to improve here, and thanks in
advance for reviews/comments.
Cheers,


Guilherme


 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1b7f20a9d4ae..35ab39fd9345 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6261,9 +6261,8 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 	dc_plane_state->plane_size.surface_size.width  = stream->src.width;
 	dc_plane_state->plane_size.chroma_size.height  = stream->src.height;
 	dc_plane_state->plane_size.chroma_size.width   = stream->src.width;
-	dc_plane_state->tiling_info.gfx9.swizzle =  DC_SW_UNKNOWN;
 	dc_plane_state->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB8888;
-	dc_plane_state->tiling_info.gfx9.swizzle = DC_SW_UNKNOWN;
+	dc_plane_state->tiling_info.gfx9.swizzle = DC_SW_LINEAR;
 	dc_plane_state->rotation = ROTATION_ANGLE_0;
 	dc_plane_state->is_tiling_rotated = false;
 	dc_plane_state->tiling_info.gfx8.array_mode = DC_ARRAY_LINEAR_GENERAL;
-- 
2.39.0

