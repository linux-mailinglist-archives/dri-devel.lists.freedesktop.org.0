Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE6B4ABD9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F289210E6B5;
	Tue,  9 Sep 2025 11:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GaJbt6QL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AD410E6AF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C60896021F;
 Tue,  9 Sep 2025 11:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3CDC4CEF4;
 Tue,  9 Sep 2025 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417312;
 bh=7S6xJQmLDWdawyaMrhXYfCH+nqZ9K/kiGNkXOq/gL6M=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GaJbt6QLtpdl4wkzlsLr2ZFMrTMsAxSduKCUfF5uTmTpGaE2pgtvqgci6p+TZ84on
 oTsBluwo27ZMO15j4NZBjNDF35atH+upGyN11lHPdVwNUnKUvZYMFFXePiZmV5LkG4
 q2zalnbR4aD55AhtIfb7vasccShI1cwfja72tYBmdLfuRKNfJ+FFnn6XP0JGF4aicu
 KZoJqJCBvGah5ufz2C8RJ/hokTuz5nSU6NulISCb00JGI3hgeYeFpOlYjTt+wzq7M2
 /yeqkr/pA5911Fy7S0ngyJdSVMgNh/K7yXhzD1pcSl/EatuUXlfVau0WKqlfUEdk0R
 X5NUU7Ymq2zZw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:34 +0200
Subject: [PATCH v3 15/39] drm/atmel-hlcdc: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-15-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7S6xJQmLDWdawyaMrhXYfCH+nqZ9K/kiGNkXOq/gL6M=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+DU+LMiTXPPx5QuZiBkrVYq698UWPjge8KF8X2Xb2
 /wzC/d3dUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJvOphbFju3nN7h3yqkH94
 E/ffY08+qcb6S6qyvU48U9iyy5g1+Nacf2er7rZsVbt5nbVF986K/4wNky/0ugT1P/VSyHNyj5C
 d5HaZJTx1QmrK5ecsN8xetiomKl58Z7fzpGfupW6hbQxMfW8B
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
2.50.1

