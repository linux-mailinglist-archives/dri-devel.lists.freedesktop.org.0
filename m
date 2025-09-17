Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E019B802F9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C762C10E868;
	Wed, 17 Sep 2025 14:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MhhlCJKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7100A10E866
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5920144201;
 Wed, 17 Sep 2025 14:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4B2C4CEF0;
 Wed, 17 Sep 2025 14:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120391;
 bh=3CgAY/N9EvJHZj/pAqZgDULeYazpPqIRKvcGAPYLLJM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=MhhlCJKQhS90vG1KcXaYyY3qZAysnInZltvrl1Uvihgdrap2uk6DKbO6OuswsNSM+
 SNh+H976o6kYZR9brGX+hLTDMot+oypPnPqrDDxfpPTUrOXhAQaOjLh9Ois5C9P3pS
 S/ttpqPZR4tM66EC+ToKwobvCiZoqjz8XhEVpn6EV3b9+CoOTmp/xfYF4lTW1V9llP
 yOxDd0QKotKPrjPcNJcxiyl84ZTvbcUCEHncWaLq9KBv/nHKeXUdQ6djS6fmTZ+/Y0
 TVknQi06VU50DVDagPOSK5mMjcokRim2yvNXykrC5uK2rrCq57J1R9zPT2+LbZHJ52
 KfaWV95n8xv9A==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:48 +0200
Subject: [PATCH v4 07/39] drm/tilcdc: crtc: Use
 drm_atomic_helper_check_crtc_primary_plane()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-7-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3CgAY/N9EvJHZj/pAqZgDULeYazpPqIRKvcGAPYLLJM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi7SOsJs2BejWjTbIb5pIquU97fEWwxnvzd8XfX90
 LGfj9/rd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJCMUwNmx/c13rgucDyz0F
 304+4n8g/y2xNvj40015MgxT7n2zvP7o15b0/Zo3fvforD34a8d9lquMDTt5zu8pbH/p/WlZSkP
 tShe1aTel2rxSvr6VUNbqaprfPE0k+EhEc/LX36sPP674Kv56PwA=
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
Acked-by: Jyri Sarha <jyri.sarha@iki.fi>
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

