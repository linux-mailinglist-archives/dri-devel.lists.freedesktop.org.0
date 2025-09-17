Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE9B80359
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1FF10E877;
	Wed, 17 Sep 2025 14:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jfe9fdEw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF0C10E875
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:47:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AF2486023C;
 Wed, 17 Sep 2025 14:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073C2C4CEE7;
 Wed, 17 Sep 2025 14:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120444;
 bh=4397DcR5AFIqz6Y/eSFEGO1CmSTv8oyb3/bQu4pR32g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Jfe9fdEwyyM/PMN9ZrH+f0VvsJ9mRzMoVx/twVWuEgVsfvbCSu/UkkCM5mWjfQxHg
 F54t9zXv4b9xwVaPrUrzEZIBCxtoWO9orWBrQuJeyzQ1vKqNznM7cRDi2D2sA9p+1+
 /IIoKSWfLq2RjtorgyNtzSUuUeG4icYTKUfE2bibtXM1lAqeK1WFOUWPUcedx1bxBs
 8cbSex8x+QhPFTziYOTZ8CeRUSHKq1f0PW8coDidk6Mvo/13g9d6XYi0+8v9yBKWsl
 UCZbM/XS6v7IdYuxC3KZm1aDOk2mN4GCZ85IvaHLDBQnqBmcGr+jCp0B0jrFMr2OBJ
 CclmloT4noUgA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:07 +0200
Subject: [PATCH v4 26/39] drm/omap: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-26-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=mripard@kernel.org;
 h=from:subject:message-id; bh=4397DcR5AFIqz6Y/eSFEGO1CmSTv8oyb3/bQu4pR32g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq5S/RRx6vDFx9VTgl/Uaa/nKtnhN/v+1vdeN8yer
 /Xo6pdi7JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATMWhnbHjqXHXm+o5vJic7
 7z2tnydvZZv8zt3/63sPef7L/vM1D1UfDvnS2N842+XbvhD/PxGT5zDWqXFcdJ22//0ci9nll2z
 9fvQdnCfz4cvvq4lrm2MbfLIiRP22HfNYus3y7e8JbGpV7XKWAA==
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
2.50.1

