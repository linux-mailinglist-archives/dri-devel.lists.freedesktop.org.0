Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6023C185
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D348D6E4C4;
	Tue,  4 Aug 2020 21:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D196E0AA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:32:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p20so3834073wrf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EM5WAMvVcOc0TjFl8cQotl+/VuVI26uvOlQh3N7s79Q=;
 b=moWjywPuhSFYVS3Qe2axxHHklXn3/jcEvlaYnf24H7I2CU9lOG07EbswmdbFXlx1+c
 RkIEI5UKNeWT9vdyAIsr13fsSHWDqLA2FGfZbzos2Pkt+x/uQeNUOnJnb/j9mGWdi/vy
 asyId0OQ/+uUhdKVGqG5Gc7f5J5XsEABfyC3qQJDeBPrUJiUzW83mjZJ0yyyTiVlF5Sq
 Us8a8ISAyfr4Sj50gBqehnlSjwAiPAWwIotTQSk2aRPesOc/NcRbR1XxFxkUyGVJvGvb
 FYuM9R9GExC5AwPIHuVoiwenm5Srx5fxaWK1LFy4BYWp1kiu2ZvFY7Hs/FA+Dui2vq2G
 5r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EM5WAMvVcOc0TjFl8cQotl+/VuVI26uvOlQh3N7s79Q=;
 b=eyg+QmBtxLuylkrqWswXwTfij/hPK3j3OxjH2FqUX7aa1qvAhox8q21mnfe3Y2/d4z
 lBYsqg/ha/6oLMlg6J2fWWaOAr4W6yilVJZcveNnZB41BQQqtGvGUs4LrEyMtXAiluvF
 hrXJyTI0hXEDmjDVqEDdi186uCJcDF2idDcrAuDi5oDfmMyqfg+NXBVLhb6RddjVR3Sw
 7fYxxe8cRoGIandwAk3SINW0Z6njYsQv4AqOGY+dL+UPLXlcxO5lRsOq2jJEXqNzWMy1
 CW7J6yD1DwKgi92G1sTigZyS2liHUfBYAkM1HiB2ufiD2EDXBDuwB2LxDE7+mMc6CyG3
 47Hg==
X-Gm-Message-State: AOAM5306UmC4aOYHTqs59FUxKH81ZqQ6fge/2ytLDZO8S9BuWB/LwsfF
 BJkFMqUG7qOjHtjjUeVD1L+nFA==
X-Google-Smtp-Source: ABdhPJxjwqaCDKRNM6crUDqDms5zRrFIHKr+t1fIiCA3h6O5bZGt86BsIkSEVK5836450Ayu/LRFXg==
X-Received: by 2002:a5d:4dcc:: with SMTP id f12mr4256651wru.219.1596576731143; 
 Tue, 04 Aug 2020 14:32:11 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:ce92:471f:873f:fc56])
 by smtp.gmail.com with ESMTPSA id x11sm97612wmc.33.2020.08.04.14.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:32:10 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/8] drm/amd/display: Honor the offset for plane 0.
Date: Tue,  4 Aug 2020 23:31:14 +0200
Message-Id: <20200804213119.25091-4-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With modifiers I'd like to support non-dedicated buffers for
images.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 005331c772b7..abc70fbe176d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3623,6 +3623,7 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
 	struct dc *dc = adev->dm.dc;
 	struct dc_dcc_surface_param input;
 	struct dc_surface_dcc_cap output;
+	uint64_t plane_address = afb->address + afb->base.offsets[0];
 	uint32_t offset = AMDGPU_TILING_GET(info, DCC_OFFSET_256B);
 	uint32_t i64b = AMDGPU_TILING_GET(info, DCC_INDEPENDENT_64B) != 0;
 	uint64_t dcc_address;
@@ -3666,7 +3667,7 @@ fill_plane_dcc_attributes(struct amdgpu_device *adev,
 		AMDGPU_TILING_GET(info, DCC_PITCH_MAX) + 1;
 	dcc->independent_64b_blks = i64b;
 
-	dcc_address = get_dcc_address(afb->address, info);
+	dcc_address = get_dcc_address(plane_address, info);
 	address->grph.meta_addr.low_part = lower_32_bits(dcc_address);
 	address->grph.meta_addr.high_part = upper_32_bits(dcc_address);
 
@@ -3697,6 +3698,8 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 	address->tmz_surface = tmz_surface;
 
 	if (format < SURFACE_PIXEL_FORMAT_VIDEO_BEGIN) {
+		uint64_t addr = afb->address + fb->offsets[0];
+
 		plane_size->surface_size.x = 0;
 		plane_size->surface_size.y = 0;
 		plane_size->surface_size.width = fb->width;
@@ -3705,9 +3708,10 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 			fb->pitches[0] / fb->format->cpp[0];
 
 		address->type = PLN_ADDR_TYPE_GRAPHICS;
-		address->grph.addr.low_part = lower_32_bits(afb->address);
-		address->grph.addr.high_part = upper_32_bits(afb->address);
+		address->grph.addr.low_part = lower_32_bits(addr);
+		address->grph.addr.high_part = upper_32_bits(addr);
 	} else if (format < SURFACE_PIXEL_FORMAT_INVALID) {
+		uint64_t luma_addr = afb->address + fb->offsets[0];
 		uint64_t chroma_addr = afb->address + fb->offsets[1];
 
 		plane_size->surface_size.x = 0;
@@ -3728,9 +3732,9 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 
 		address->type = PLN_ADDR_TYPE_VIDEO_PROGRESSIVE;
 		address->video_progressive.luma_addr.low_part =
-			lower_32_bits(afb->address);
+			lower_32_bits(luma_addr);
 		address->video_progressive.luma_addr.high_part =
-			upper_32_bits(afb->address);
+			upper_32_bits(luma_addr);
 		address->video_progressive.chroma_addr.low_part =
 			lower_32_bits(chroma_addr);
 		address->video_progressive.chroma_addr.high_part =
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
