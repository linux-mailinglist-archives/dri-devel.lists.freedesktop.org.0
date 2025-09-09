Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7CB4ABF8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9800610E6C8;
	Tue,  9 Sep 2025 11:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bIQEP+cy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C033210E6C8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A9F1544669;
 Tue,  9 Sep 2025 11:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD30C4CEF4;
 Tue,  9 Sep 2025 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417367;
 bh=cfDdtuJD4Kwi5Gvj11gZnxOVZppvKr93Vy4hBkEEv28=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bIQEP+cynmzx8O/jIs+cd9YT0MGSYbs6ZYuB3+Jmrr/Tes/bZKglzNVbXuzjz69Mh
 20DzAzTi75PcAPSSCjh1b837Wm5KXYcBCNGpLUbeYIiGX6m3jr4Lui1qVQ5+T5jixj
 YZkbzlSe53ett5A6gPwzSiiPV084Sxw6WlrwXg4GMSd6G55aBNeO7uBteiYZ58pBeb
 VTiBbUu7+dhQjJbFy+yBTGOnrLga4CYFelUCrwoGG1Jzxh2HY4yfw1Uqb5vRMd/MqZ
 AXOqRg888k9h08uySIHPylCAzch3BuUuOwQ65bgDyg6jXkH+Us0cZVSE4ghDWiL6Dn
 nbTmlxCHiUhLA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:54 +0200
Subject: [PATCH v3 35/39] drm/atomic: Remove unused
 drm_atomic_get_existing_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-35-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cfDdtuJD4Kwi5Gvj11gZnxOVZppvKr93Vy4hBkEEv28=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+A1XHtuw3aDeSvTVp6VRk78IPd94xfzAHr/QZnuFD
 OlUh6fpHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAitUaMDf8vHbx++cLMullf
 Hp4LPcNWf0+utSxyqoiyk43Rj08SGxsmSfC+N+HcJvpu46cH3lNLyhkbnt6t5mGSvjxT84XoWvN
 7E256N0WmxvxY6xNakBzYzX+psmOh2+y1Wo7h+Rv4r/eJzT4DAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The drm_atomic_get_existing_crtc_state() function is deprecated and
isn't used anymore, so let's remove it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 89c9a059b36763205fc2fc764283423cbea62679..cba63857e920515b48b75fc3c2d5239fc1ae59c1 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -663,28 +663,10 @@ drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 struct drm_crtc *
 drm_atomic_get_new_crtc_for_encoder(struct drm_atomic_state *state,
 					 struct drm_encoder *encoder);
 
-/**
- * drm_atomic_get_existing_crtc_state - get CRTC state, if it exists
- * @state: global atomic state object
- * @crtc: CRTC to grab
- *
- * This function returns the CRTC state for the given CRTC, or NULL
- * if the CRTC is not part of the global atomic state.
- *
- * This function is deprecated, @drm_atomic_get_old_crtc_state or
- * @drm_atomic_get_new_crtc_state should be used instead.
- */
-static inline struct drm_crtc_state *
-drm_atomic_get_existing_crtc_state(const struct drm_atomic_state *state,
-				   struct drm_crtc *crtc)
-{
-	return state->crtcs[drm_crtc_index(crtc)].state;
-}
-
 /**
  * drm_atomic_get_old_crtc_state - get old CRTC state, if it exists
  * @state: global atomic state object
  * @crtc: CRTC to grab
  *

-- 
2.50.1

