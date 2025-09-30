Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F962BAC9DF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B6F10E58C;
	Tue, 30 Sep 2025 11:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EzFh88BY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383CF10E589
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AAFC3604C3;
 Tue, 30 Sep 2025 11:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E4FC4CEF0;
 Tue, 30 Sep 2025 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230106;
 bh=lbfudEzQ7PT8kTbKYM5vX1sk8OuxnA0ZuDlv1AlWM/k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EzFh88BYZnPDxfgYGAOeQwkb0eeztdX1XTC4Wq60fYvCtxd69B9B8Uozvw4YL12l6
 qTKwbeQ8pyK2SIK//SsIfsq7wbr1rkQVaXr6SNMot5p6JpK2BYd5Sh7ADkUntk+UiP
 me+6er1shyhUOYFSr2kNUomZuprobrXdxHF0p26i6Lvb7zFgDVGELSKZQxNfVbJDRR
 /XoyFg1emzIS6gFr8yNfXxNwBYqhmF9cCC+m3hTq5TrmBcuSyeHOfmBBjT0jbMjPZb
 FJsBRvfHZ2h/5l7SmRRP5pTaWLihimxC9Bt9GLR3NYqr0E9hw7WnDrjSxc9WaHGX9M
 IYOKRWanV5fZg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:50 +0200
Subject: [PATCH v5 35/39] drm/atomic: Remove unused
 drm_atomic_get_existing_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-35-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lbfudEzQ7PT8kTbKYM5vX1sk8OuxnA0ZuDlv1AlWM/k=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d+jPiGrftb619OnLfTql351a+tofn1pn5tfwLmofI
 5/7iZSNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiFYsZGz4cW5J4IkYods+1
 39vMhQ3FWBnVPys4hr7faaerW2NtkbTHqWvy9XzerHNcVyI8pf6fY6wPeW23tWxrV/jtaWmi0tJ
 TTRuDTyaJdr4WsRC53JS6uKFTmdNDWcevZHEjb8OHq5z6cgA=
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
index a05012adcf94741e2374d2a0c2cd66eb1d7ef98f..f53a32688b33fb0f629595cb0a2ac09d359f515a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -667,28 +667,10 @@ drm_atomic_get_old_crtc_for_encoder(struct drm_atomic_state *state,
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
2.51.0

