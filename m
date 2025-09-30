Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99435BAC976
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D4F10E570;
	Tue, 30 Sep 2025 11:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ed/devgL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE16A10E573
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D559840476;
 Tue, 30 Sep 2025 11:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B479C4CEF0;
 Tue, 30 Sep 2025 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230027;
 bh=lOmXGBbLUyIfdwVdiMQLa3WZUh7ScXbGftTp19lHrpk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ed/devgLgcCMiE2IRl1LZzYStP/3ewnQ0qn0edpd4eOcdN+ZMRjjOPbafO6Zs1daU
 EGnCE/JgCEsYOcgrjJj3nWJqX7j6B+vl4IzsvJtoPNi4zKrMNlGnXE1oRvkMvHyJPY
 i/zoZy45fbyGiMqjhTq0fRBYzsQiaXveKXX6KZeSK7Chj8rq+3N205D73KgB7buej3
 x1h0i7zmjblJIE+ZmktzDa5X/f93WMT9V2mauqrvZWCfNJCeX/EdtVuOpbIoLT7ZA3
 cEq5ieCENaZNvjeuHYYg7fJeIuECW0bV/LEUKz3Y5ZL/W+MUyaqkLt5SGNXIKi8yYv
 T4KnZQLZg8Upw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:23 +0200
Subject: [PATCH v5 08/39] drm/atomic: Remove unused
 drm_atomic_get_existing_plane_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-8-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lOmXGBbLUyIfdwVdiMQLa3WZUh7ScXbGftTp19lHrpk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dyivuhJTP2GGYkijzPomq4Iv4Sszf1g/mWMluvv0h
 MMNa4Tvd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJtExirBWfpmcZ9jvOaN9f
 +f9S1jwLmaXPBf49eeZguZDcv8p3h0RfPigtefPygc355Xv/ZvuuOMrYsK2Ua+eu6M8yD9NWbcg
 OfXrvl5Jw38Q0t5kTU9Mdwjtnf+u2+nz7+IP1V1zittlLN1h0AQA=
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

The drm_atomic_get_existing_plane_state() function is deprecated and
isn't used anymore, so let's remove it.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_atomic.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index c8b88990506e5c9d2cbed76d04aca74efa8db346..b2cc9c4a9beb59980a8fb3629a11a45d08f2e86e 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -698,28 +698,10 @@ drm_atomic_get_new_crtc_state(const struct drm_atomic_state *state,
 			      struct drm_crtc *crtc)
 {
 	return state->crtcs[drm_crtc_index(crtc)].new_state;
 }
 
-/**
- * drm_atomic_get_existing_plane_state - get plane state, if it exists
- * @state: global atomic state object
- * @plane: plane to grab
- *
- * This function returns the plane state for the given plane, or NULL
- * if the plane is not part of the global atomic state.
- *
- * This function is deprecated, @drm_atomic_get_old_plane_state or
- * @drm_atomic_get_new_plane_state should be used instead.
- */
-static inline struct drm_plane_state *
-drm_atomic_get_existing_plane_state(const struct drm_atomic_state *state,
-				    struct drm_plane *plane)
-{
-	return state->planes[drm_plane_index(plane)].state;
-}
-
 /**
  * drm_atomic_get_old_plane_state - get plane state, if it exists
  * @state: global atomic state object
  * @plane: plane to grab
  *

-- 
2.51.0

