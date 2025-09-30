Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF107BAC9AC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDF410E57D;
	Tue, 30 Sep 2025 11:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sxI+ha8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7133F10E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:01:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 593914171D;
 Tue, 30 Sep 2025 11:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D262CC116C6;
 Tue, 30 Sep 2025 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230080;
 bh=K3LziUfBs9ytpbeezz1lOPMCFrknUPtIUfo892Ag7Nw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=sxI+ha8oPgyXwDGAubnZWtgWrY2Th3iSVCafRDaRe31NjFA0fcSiDc/8Ef2J8I443
 CiU0hKLTvpLc0qWRpPz9WhuC5G3QWHSAzeGGl46Ol+io65t+QVPaU+f/eB4LzncmWe
 0dQWPFoL8Vp2aTuN0af7jgc9OUMII6etBgbbScxPPFzBX41tqa7xJDM/jM8qQgdUgT
 wOQQEHol9y2o+s+/gAAZdPXOAMS0CGWvRuf2wu3qkeaNuRGk2++rk3AXVDzV5SMzPU
 I6bw5YDu0XFcZ+BTiDPKEvvvBJUT36hCzaRWk/rd7BZi3D4djchot+Ice9E30ga//3
 ybC6MDNbSJzxw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:41 +0200
Subject: [PATCH v5 26/39] drm/omap: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-26-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=mripard@kernel.org;
 h=from:subject:message-id; bh=K3LziUfBs9ytpbeezz1lOPMCFrknUPtIUfo892Ag7Nw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d2i/kWuXu9wuu2A2K5NMnEeA4YuQuQ0v7PfvO3L7g
 yzrxLDQjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARZnnG+swHD8p331EwSGl+
 btEquvfVr//XvM6HpHQ/uql30XG7eznLV672a/+SUk7mSO/t06o/wthw+umW10nHbh1pYTtavqu
 gt/jssdSm6VorGiOP7vq3b//JNP7rZVosljM5tLwKfNJXHM0CAA==
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

The omap atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 24a2ded08b454c4f2225e84f7b0ed09ed733d6b7..d74ef6694c10995c7393217a4d81275b36e00e2b 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -227,11 +227,11 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 
 	crtc = new_plane_state->crtc ? new_plane_state->crtc : plane->state->crtc;
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
 		return 0;
 
 	/*

-- 
2.51.0

