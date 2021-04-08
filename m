Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67738358DC8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 21:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409FF6E1A5;
	Thu,  8 Apr 2021 19:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE506E1A5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 19:55:26 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id v70so3537579qkb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2WI115VsuVItfr2BpF98BtkUGHktbIekuswgNtc/yWQ=;
 b=KxbRTTY6af3VKPp4S2HqE7Tp2o+8O01vqFeP8r7RbXDM/wa790hnS+UPp/y47uRqfC
 4mKjkQufJ8Yj+39Qk4PEdJDcwDihNL0in5uZ6C8Ycw32/bSew72cEdXDSkASLbOzho1+
 VSdQgKPHbdIB3+EAixCiDnzmctFhyuyEdw4PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2WI115VsuVItfr2BpF98BtkUGHktbIekuswgNtc/yWQ=;
 b=Z+hcUiKfw75tgw4FnQGHS6wGQ6ioAEKMzO8mnklw8XqkR8kQ9wztchRWfxT+1bGcYC
 yxGWqGzxptWFn7LzQGMPprWSh/vwybJKNLigCI2Iw3IsW88KunJ+pVfnGkUYNajoZwnP
 bJNi2OmKvOjWxNLnaanro2RDurYQm8oXKStsMpsvnglAP9CKdSJyz2F9NpQ0crgpOgZS
 r+oea7OEJKRL+8Xy2+qNFg3m/OofmiknOGcdyGNK73go2IuehwVTcXQdMdurstcFWXnq
 nZBiwdpFwX2dRK3GHYdw/zgEDYQX7HAeVfx7IaVGYyhdJSR+Qt+Mfq4/aGOmSlmh+aC5
 JD2A==
X-Gm-Message-State: AOAM5326k0YIV84WYVxvQhN4isM2VOLNy4UxyjV4EHokxEOrAH9ShMHu
 g0j7jiWumXcR1zD6nVOqUjOjsA==
X-Google-Smtp-Source: ABdhPJzY7r9AOqkMC5XamcJKlr8gz45ogTkiXpeO5D1cebA8+pUW0m6PHsieZZ+brHlOKRMPNZGyYg==
X-Received: by 2002:a05:620a:135a:: with SMTP id
 c26mr10226725qkl.110.1617911725823; 
 Thu, 08 Apr 2021 12:55:25 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:513:b9ea:a4f6:c7ad:d4c4])
 by smtp.gmail.com with ESMTPSA id n1sm355753qtp.76.2021.04.08.12.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 12:55:25 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Report the Frame number at beginning of CRC
 calculation
Date: Thu,  8 Apr 2021 15:55:12 -0400
Message-Id: <20210408195512.2236336-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
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
Cc: alexander.deucher@amd.com, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

On reporting back the frame number of the CRCs through
drm_crtc_add_crc_entry(), send back the vblank count at the time the frame
CRC starts calculating rather than when the CRCs are ready to be
reported.

Tested by running IGT module: kms_plane::capture_crc()

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h   |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c   | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 8bfe901cf2374..b1e7af435b440 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -461,6 +461,7 @@ struct dm_crtc_state {
 	int update_type;
 	int active_planes;
 
+	u64 vblank_at_crc_init;
 	int crc_skip_count;
 	enum amdgpu_dm_pipe_crc_source crc_src;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 66cb8730586b1..abf9dcefadbe6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -305,6 +305,17 @@ void amdgpu_dm_crtc_handle_crc_irq(struct drm_crtc *crtc)
 	 * first two CRC values.
 	 */
 	if (crtc_state->crc_skip_count < 2) {
+		/*
+		 * Save the vblank count at the time when the CRC calculation starts and comes here
+		 * for the first time (crc_skip_count=0).
+		 * drm_crtc_add_crc_entry() reports the number of the frame these CRCs are about,
+		 * which should be the vblank_count of the frame rather than when the CRCs are
+		 * ready.
+		 */
+		if (crtc_state->crc_skip_count == 0) {
+			crtc_state->vblank_at_crc_init =
+				drm_crtc_accurate_vblank_count(crtc);
+		}
 		crtc_state->crc_skip_count += 1;
 		return;
 	}
@@ -315,6 +326,6 @@ void amdgpu_dm_crtc_handle_crc_irq(struct drm_crtc *crtc)
 			return;
 
 		drm_crtc_add_crc_entry(crtc, true,
-				       drm_crtc_accurate_vblank_count(crtc), crcs);
+				       crtc_state->vblank_at_crc_init, crcs);
 	}
 }
-- 
2.31.0.208.g409f899ff0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
