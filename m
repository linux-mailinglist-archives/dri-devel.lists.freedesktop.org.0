Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D7B445794
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2647F73560;
	Thu,  4 Nov 2021 16:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F62C734F8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 16:50:58 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id h14so4709816qtb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6LDFw29hZsoKOLns/SZzto6jZDnxgAkgjGJO4dyrRY=;
 b=KDXVa/C3Mif4tYN39v3Qyyb2P2N91bdiro51TFqk/tzHL1JwG+yjARCgb9wH76RcBN
 9Acq9BsmrWBzpwxBvHGLOJrN2U2wQgrc3/SnFXJ+Ba12dGSGeM0bffUlYfu4wcfWr9c1
 vFixPsm7mXDGYFx4/IZGXfPzLM439+wu/Kbfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6LDFw29hZsoKOLns/SZzto6jZDnxgAkgjGJO4dyrRY=;
 b=40fr8JSUXknrsinfs26fqindrwTm43fz2gbEqlJjuqwp4MjNQyRXAwrku4+tWoosUZ
 nqhogSNew46ykMp0rCSZ3Q1HHGuxC6dTcgyiNK5jU7AF2Z1qOXmkLaAXgCG6Xf+KnxYz
 MclNDW6GOaQHg5EMzEO0Uhu/rM1B6UN0CwTS0qUOJKqRgS9WqtPIH7pHQXrbiTqxufRN
 bIMKYLSfSB/9rETO9jd4UXeQSH4cs317MLeGN0XWnotnwapHJgq1f8oquT7OdIYERkzJ
 NlARQY12/RPeQxVRuJjCdGXYPaVRcLiXKkqF8klh0wH3n9B/x90+QsJC24VY2S+avyES
 Ey0A==
X-Gm-Message-State: AOAM533TzD86BsoXeryHCot4Xb69eltEleKe0WUsYyKfXLei2mojmY2X
 5rQZqKginNwfS+bidLEziZtCQg==
X-Google-Smtp-Source: ABdhPJyYmqLWTC+r4y2X+PQP7SZsT12s912X50jcuVOAyhYkqzPP6T59ggFcd6/EpmPxsl7h8W1sNg==
X-Received: by 2002:a05:622a:612:: with SMTP id
 z18mr30987718qta.411.1636044657405; 
 Thu, 04 Nov 2021 09:50:57 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:1118:14fe:72e3:f013])
 by smtp.gmail.com with ESMTPSA id q20sm3976621qkl.53.2021.11.04.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:50:57 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Subject: [PATCH v4 3/3] amd/amdgpu_dm: Verify Gamma and Degamma LUT sizes
 using DRM Core check
Date: Thu,  4 Nov 2021 12:50:44 -0400
Message-Id: <20211104165046.4115042-3-markyacoub@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211104165046.4115042-1-markyacoub@chromium.org>
References: <20211104165046.4115042-1-markyacoub@chromium.org>
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
Cc: pmenzel@molgen.mpg.de, Leo Li <sunpeng.li@amd.com>,
 Mark Yacoub <markyacoub@chromium.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mark Yacoub <markyacoub@google.com>
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
2.34.0.rc0.344.g81b53c2807-goog

