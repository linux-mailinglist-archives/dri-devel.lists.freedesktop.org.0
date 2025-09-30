Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF1BAC9A3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2786010E57C;
	Tue, 30 Sep 2025 11:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b9dIVixm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D7F10E577
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4D38842B8A;
 Tue, 30 Sep 2025 11:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FE3C4CEF0;
 Tue, 30 Sep 2025 11:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230048;
 bh=cfKBWk9jw0KIr9p0JluSWxg7pYNXEHA3aZKpd5ss0Gs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=b9dIVixmEmWisjTdcLSDNndzhGg6k4wt2aLVyBoLtXlkDlA47azjirKBM4xr6jzc1
 IS6bwoenliiZBgDTdwfTGvRHTJOCNs1iyrTgpgHcltS5dc58sk3bSx21awe/cu75KR
 9bcUXILpIfaO5yScspjbP2PAIlC5QzRqbWnCfI0Ui3EBLBJN+b1qogJBap8Bbo7AOr
 FnCU2RpMdVegRparRq5ui1fUpS+oXU6lEnzKzstPtGNblgZZbulL55MwO+G+28idyD
 qOMPvKfK9sJcfhJWdzBVCjW0z5KEcWxmhhECC9PVvWtD/N1miKbXu+s0uZ8iShgG73
 gfr0U3mPJK0kA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:30 +0200
Subject: [PATCH v5 15/39] drm/atmel-hlcdc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-15-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 Dharma Balasubiramani <dharma.b@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1737; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cfKBWk9jw0KIr9p0JluSWxg7pYNXEHA3aZKpd5ss0Gs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6h9OSNv3+0oa/MsyDa2QIvhf8cNu51Nb3i6HmZz9
 fZVOj3smMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABO5u4yxPtuWw+fOhEfRd5iP
 722u+vIkJ37ar32ndi1mYAg12MUt998wMvM8c6/Z3p+L7d8u4DD7z9jwZMqM2Quv+SvvybDS4eV
 YGz6Z7YyvxIHdzLM5ZpiIhpqrJ7EHvSpIy47aeY/j4OII0TwA
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

The atmel-hlcdc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Manikandan Muralidharan <manikandan.m@microchip.com>
To: Dharma Balasubiramani <dharma.b@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4a7ba0918eca19eca3fd8febd1db1b2d3a8a6e14..59be5f64c058e2be398f207ad436f922135a5ad0 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -712,11 +712,11 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	int i;
 
 	if (!hstate->base.crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, s->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, s->crtc);
 	mode = &crtc_state->adjusted_mode;
 
 	ret = drm_atomic_helper_check_plane_state(s, crtc_state,
 						  (1 << 16) / 2048,
 						  INT_MAX, true, true);

-- 
2.51.0

