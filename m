Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D34B39BDD5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 18:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7986E12A;
	Fri,  4 Jun 2021 16:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1206E12A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 16:59:43 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id t9so1004978qtw.7
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bh04H7Tcy+Yj9VMjnrHi1k31kTkyYQ9k7jX6b4bdZfw=;
 b=C6Zw4MMP63rzKfA7qlVqEcesd/tAoSiqWlvgE+anqg/Gyg+3tA5SN7znWdKVzOplLD
 4M0mnc5RJk55rwrZ9zPrvPsDPUj2eYB5eR7O87CO56MFGK2kSxughd0abuAkV0IPSPQ6
 RQAKfLGRTQ4f0+lTh9pyTeKs6QBIqOGkqz0xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bh04H7Tcy+Yj9VMjnrHi1k31kTkyYQ9k7jX6b4bdZfw=;
 b=r70TondlvefOglGA9H5Hrdxa+KQdSz9uXkThlEHchMkVjsCTsDr4jmrq6c4I5rz/0T
 JKaESdBb6dKknyC0n5ZARvfSe35fWj7qkBl7COXPFGd67DZvmblyrs6GtSQbFRm1St6V
 G3Kg/T+JO3lMvj6LRmXP/Zir49bhUniMGmpHpVdVmE9WsxRaKtI0ir/kdyYGTvs9Skjb
 enIexZwnVhzJHjJuSoMU1qj6NRxDEKCdxB0PuIkPx/ysuxCvz532t2Y8o8w+psh9xjOQ
 K+Fhn7TRqHefykPj+QuEBAULZR7MQDm753GCQJgzoXBjScohdoUXbfKo8/rHvNhaIx7K
 obVw==
X-Gm-Message-State: AOAM530U5Q1NBuCB88I5uh6bZWaE2Ek51HIPc9vxG3JIkkv08llA9E26
 YT15KDB5n4mQdk3QtSXFtIJL/A==
X-Google-Smtp-Source: ABdhPJxYVXfJLm2LsTzKrH6wYmuyscFqtBbSN+dVKkvwurFsDkXTZkWQLKpE9plljFl7tAg8PQ71eg==
X-Received: by 2002:a05:622a:3c6:: with SMTP id
 k6mr5480762qtx.341.1622825982348; 
 Fri, 04 Jun 2021 09:59:42 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:416:a12b:207e:d5a0:e673])
 by smtp.gmail.com with ESMTPSA id j127sm4421788qke.90.2021.06.04.09.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:59:41 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] Verify Gamma & Degamma LUT sizes in amdgpu_dm_atomic_check
Date: Fri,  4 Jun 2021 12:59:38 -0400
Message-Id: <20210604165938.2022663-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
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
Cc: alexander.deucher@amd.com, rodrigo.siqueira@amd.com,
 Mark Yacoub <markyacoub@chromium.org>, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

For each CRTC state, check the size of Gamma and Degamma LUTs  so
unexpected and larger sizes wouldn't slip through.

TEST: IGT:kms_color::pipe-invalid-gamma-lut-sizes

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 ++++++++++++++++---
 3 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 38d497d30dba8..f6cd522b42a80 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9402,6 +9402,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			dm_old_crtc_state->dsc_force_changed == false)
 			continue;
 
+		if ((ret = amdgpu_dm_verify_lut_sizes(new_crtc_state)))
+			goto fail;
+
 		if (!new_crtc_state->enable)
 			continue;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 8bfe901cf2374..1b77cd2612691 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -541,6 +541,7 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
 
 void amdgpu_dm_init_color_mod(void);
+int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 157fe4efbb599..da6f9fcc0b415 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -284,6 +284,37 @@ static int __set_input_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+/**
+ * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
+ * the expected size.
+ * Returns 0 on success.
+ */
+int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
+{
+	const struct drm_color_lut *lut = NULL;
+	uint32_t size = 0;
+
+	lut = __extract_blob_lut(crtc_state->degamma_lut, &size);
+	if (lut && size != MAX_COLOR_LUT_ENTRIES) {
+		DRM_DEBUG_DRIVER(
+			"Invalid Degamma LUT size. Should be %u but got %u.\n",
+			MAX_COLOR_LUT_ENTRIES, size);
+		return -EINVAL;
+	}
+
+	lut = __extract_blob_lut(crtc_state->gamma_lut, &size);
+	if (lut && size != MAX_COLOR_LUT_ENTRIES &&
+	    size != MAX_COLOR_LEGACY_LUT_ENTRIES) {
+		DRM_DEBUG_DRIVER(
+			"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
+			MAX_COLOR_LUT_ENTRIES, MAX_COLOR_LEGACY_LUT_ENTRIES,
+			size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
  * @crtc: amdgpu_dm crtc state
@@ -317,14 +348,11 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	bool is_legacy;
 	int r;
 
-	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
-	if (degamma_lut && degamma_size != MAX_COLOR_LUT_ENTRIES)
-		return -EINVAL;
+	if ((r = amdgpu_dm_verify_lut_sizes(&crtc->base)))
+		return r;
 
+	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
 	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
-	if (regamma_lut && regamma_size != MAX_COLOR_LUT_ENTRIES &&
-	    regamma_size != MAX_COLOR_LEGACY_LUT_ENTRIES)
-		return -EINVAL;
 
 	has_degamma =
 		degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
-- 
2.32.0.rc1.229.g3e70b5a671-goog

