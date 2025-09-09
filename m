Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339EB4ABCE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D6E10E6B2;
	Tue,  9 Sep 2025 11:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H5gMkvSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4CB10E6B2
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A579A6021E;
 Tue,  9 Sep 2025 11:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCB7C4CEF7;
 Tue,  9 Sep 2025 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417290;
 bh=bVkKLNjeLVsN48sZMryE2q75MdZSzeJj9+aV8Zff0Jg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=H5gMkvSyrFx3l1zLF5YxNyF4Z3J9IsGsRDyJQrrKlsx6c6lLJ2bfdsGZW3/v7Kl2Y
 koQ3jb6ruknYO/Qr/f81nLP+nD8eS7QeqXx9yRHwB8meWQo/V8x6/I/hV0gPf3JMmM
 a7xrKBC+OM4RPY2H9xyqWAI9PZnbZ8U/LHi3BhwmAYAFHJwq1hf+bWOoE/95D9vzIN
 SBfe24KY/F/B5V1KGd92sPTnwLUdXerW4FAz1ynlxpi/YRzBS1jZ7XJL8+Mcj59GUn
 4AOSvhu5rUUW9llo4RKAgFq1LaL+IK7hwy9LqJOvLWslsfx9ZluSzK2EqdHlIlbimb
 BBo+Tzle+T+2w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:26 +0200
Subject: [PATCH v3 07/39] drm/tilcdc: crtc: Use
 drm_atomic_helper_check_crtc_primary_plane()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-7-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1551; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bVkKLNjeLVsN48sZMryE2q75MdZSzeJj9+aV8Zff0Jg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+FXjqt0OPGmTOdEs7Lr3Znzpr81P4zQusj52WzvTl
 8fyNItCx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI9A7Gho8PBJPUHup5RP9u
 YXtxiGWH0sbs6beW+u2aw1Jd/eTljYMP6neV/Akwldr34HqoZft7L8Y6s4secj+nnH/t0iF/aH6
 z+YpFsQv2TJYscvvxwmd7Ymd38z+eZ6b/5QN2OTRoLH07TYkHAA==
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

In the tilcdc_crtc_atomic_check(), the tilcdc driver hand-crafts its own
implementation of drm_atomic_helper_check_crtc_primary_plane(). And it
does so by accessing the state pointer in drm_atomic_state->planes which
is deprecated.

Let's use the right helper here.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Jyri Sarha <jyri.sarha@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e72ae8ec0f3f4e5e85bc5004e6e5b..5718d9d83a49f38081aabbc9860847bdc83cf773 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -674,18 +674,11 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	/* If we are not active we don't care */
 	if (!crtc_state->active)
 		return 0;
 
-	if (state->planes[0].ptr != crtc->primary ||
-	    state->planes[0].state == NULL ||
-	    state->planes[0].state->crtc != crtc) {
-		dev_dbg(crtc->dev->dev, "CRTC primary plane must be present");
-		return -EINVAL;
-	}
-
-	return 0;
+	return drm_atomic_helper_check_crtc_primary_plane(crtc_state);
 }
 
 static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);

-- 
2.50.1

