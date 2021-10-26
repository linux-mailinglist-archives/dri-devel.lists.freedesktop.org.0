Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B19743BAA0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 21:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F7B6E861;
	Tue, 26 Oct 2021 19:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6256E862
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 19:21:16 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id v10so164189qvb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 12:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HninGHjU00bH5eVCy6XooFal4vp9u3x5fJV8kIC+uA=;
 b=GdeVwkVGRtoAKblBK0G2VD/nfgvizQGhhTAf49Bf9Xmg/5ZkjUAZIbpoCiX/Yam/1l
 HetBVgYMwSDsIuTeW5IA0z0LLYtbL34MiRvI8WC30jDg1hxmtwoE54Pz0W0pvuMrPZXt
 GSvUz25vDl4FcCnMG8H9bOTY+/3gOnVeN5RJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HninGHjU00bH5eVCy6XooFal4vp9u3x5fJV8kIC+uA=;
 b=gaLi9ia08Bj6vID4aWABoi67IPB2e1q+lik1pNkRSEzowGXb1TLLH8pfTIA0n6O1fS
 pccpkpy2FR0XJVlrPH9YCeSqsmIKWIJJUfql8lvu+ZIoEVpoqiMvMKODdGOOuzVQu2W3
 xqPg9pwAJmTxJT2FyO5D1TJKPT7l3DQPSaWKVqvsA6L+JPOz1U3X+khYTV7kyokFOYOy
 eCUZvZobewQjGDgENdrGLEIHnkYbe4WTNEQzFVpcMmTB1Jlu84uNzC/Kfe5zICyuB8uI
 xzYdlLKpZisWu01KCIsl16yCFNkLL+xAh3kh5CLX+d3kEKjbPw6J4GvQ95CD6QZIdLVT
 Q3fQ==
X-Gm-Message-State: AOAM532I28kkUVovhklMvWNkP/qwAIk/LKSEPGdysnKNM0dfTy4nkf82
 D4gNf6Zn2LEB0eAI+Q4SQPBXUg==
X-Google-Smtp-Source: ABdhPJxl0hrDfXPEC/FosgSVozzhwY6YG5/Prwdr92fhPURqUtVKC40Captzm4V2tBk98zBQCz1ddA==
X-Received: by 2002:ad4:5be1:: with SMTP id k1mr13793385qvc.65.1635276074918; 
 Tue, 26 Oct 2021 12:21:14 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:6c5e:8134:a5e1:b63b])
 by smtp.gmail.com with ESMTPSA id c13sm2284643qtc.42.2021.10.26.12.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 12:21:14 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Cc: seanpaul@chromium.org, pmenzel@molgen.mpg.de,
 Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] amd/amdgpu_dm: Verify Gamma and Degamma LUT sizes
 using DRM Core check
Date: Tue, 26 Oct 2021 15:21:02 -0400
Message-Id: <20211026192104.1860504-3-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026192104.1860504-1-markyacoub@chromium.org>
References: <20211026192104.1860504-1-markyacoub@chromium.org>
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

From: Mark Yacoub <markyacoub@google.com>

[Why]
drm_atomic_helper_check_crtc now verifies both legacy and non-legacy LUT
sizes. There is no need to check it within amdgpu_dm_atomic_check.

[How]
Remove the local call to verify LUT sizes and use DRM Core function
instead.

Tested on ChromeOS Zork.

v1:
Remove amdgpu_dm_verify_lut_sizes everywhere.

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 -
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 35 -------------------
 3 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f74663b6b046e..47f8de1cfc3a5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10244,6 +10244,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		}
 	}
 #endif
+	ret = drm_atomic_helper_check_crtcs(state);
+	if (ret)
+		return ret;
+
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
 
@@ -10253,10 +10257,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			dm_old_crtc_state->dsc_force_changed == false)
 			continue;
 
-		ret = amdgpu_dm_verify_lut_sizes(new_crtc_state);
-		if (ret)
-			goto fail;
-
 		if (!new_crtc_state->enable)
 			continue;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index fcb9c4a629c32..22730e5542092 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -617,7 +617,6 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
 
 void amdgpu_dm_init_color_mod(void);
-int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a022e5bb30a5c..319f8a8a89835 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -284,37 +284,6 @@ static int __set_input_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
-/**
- * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
- * the expected size.
- * Returns 0 on success.
- */
-int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
-{
-	const struct drm_color_lut *lut = NULL;
-	uint32_t size = 0;
-
-	lut = __extract_blob_lut(crtc_state->degamma_lut, &size);
-	if (lut && size != MAX_COLOR_LUT_ENTRIES) {
-		DRM_DEBUG_DRIVER(
-			"Invalid Degamma LUT size. Should be %u but got %u.\n",
-			MAX_COLOR_LUT_ENTRIES, size);
-		return -EINVAL;
-	}
-
-	lut = __extract_blob_lut(crtc_state->gamma_lut, &size);
-	if (lut && size != MAX_COLOR_LUT_ENTRIES &&
-	    size != MAX_COLOR_LEGACY_LUT_ENTRIES) {
-		DRM_DEBUG_DRIVER(
-			"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
-			MAX_COLOR_LUT_ENTRIES, MAX_COLOR_LEGACY_LUT_ENTRIES,
-			size);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 /**
  * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
  * @crtc: amdgpu_dm crtc state
@@ -348,10 +317,6 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	bool is_legacy;
 	int r;
 
-	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
-	if (r)
-		return r;
-
 	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
 	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
 
-- 
2.33.0.1079.g6e70778dc9-goog

