Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F2C41E86
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D5710EB84;
	Fri,  7 Nov 2025 23:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="yMFO3eL4";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YCBwyK8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD6710EB84
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 23:05:24 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d3F5b13wlz9sy9;
 Sat,  8 Nov 2025 00:05:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762556723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0evSFeD56GOAdAv0d5qxmcVH10/osVKRuYfNE0zbx2k=;
 b=yMFO3eL4LdEpjEeH5PAGf2HrYHzUkariUy78jeRpTAgfoDSMNGBRWiGftmqeC/uM4h/Sq2
 KuPyedfq3RSSJP/Ra+EHsScDQl4pcEz2OgRw97JULSV84ZFZtVkmAPS/8FPNmS/xxYfgiH
 Jc6Jks16og7y6ByS1q1jYQiPRXTjzLtAGjfTW/uTXZc4CqnEClVkqjpHNZ+uceP9l/j+QX
 Tsjbm8K/oT/a+Zx3pPWQ0os8gN2npYn+X2GUbf3LZQmJE5xIIfMsoEp2ET6upXfqAGvKQI
 yl/wk8tqKvS3EpnG8WOq6vQ4PbEklU0urPiEAVwPkmflYBe/n2EjFZHCDdkwzA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762556721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0evSFeD56GOAdAv0d5qxmcVH10/osVKRuYfNE0zbx2k=;
 b=YCBwyK8prdPevXGX4RqHyLiz9leNmnxmte3271rI5BtkzumGo29GHKVX/d1sCyQdVieisD
 JxJINhRO1FMr6kxiB+np5/ZBA/ZFji3KGSP24Io+GQdX9wOYHWg7De1P4dtVfY5Ob43fI7
 ciXvnVkd68xkAIl7jcY/hy8PsVLixPZOsg88R0mKDXBnu50TuMyoe+942MaBHWYW2Q7/i6
 liib6Bkrv8tKcSOWcQmzFhVOAgQWyGl8cjLyh5A+Nfnd1v62iInsZM2pRYGHdHrs8nz2ol
 9Hqc7xcnYEK+1Zw+vXEf1eQUEknXksii7dAupLBZ2fUvSxqprGzfNLz2gmWLDQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/atomic-helper: rcar-du: Enable CRTC early on R-Car DU
Date: Sat,  8 Nov 2025 00:04:26 +0100
Message-ID: <20251107230517.471894-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 597f3ce88561df07777
X-MBO-RS-META: iihdrhx1drn6nxepuj4bmxeibeej3iba
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

Introduce a variant of drm_atomic_helper_commit_modeset_enables()
which enables CRTC before encoder/bridge. This is needed on R-Car DU,
where the CRTC provides clock to LVDS and DSI, and has to be started
before a bridge may call .prepare , which may trigger e.g. DSI transfer.

This specifically fixes the case where ILI9881C is connected to R-Car
DU DSI. The ILI9881C panel driver does DSI command transfer in its
struct drm_panel_funcs .prepare function, which is currently called
before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
and the DSI command transfer times out.

Fix this by restoring the enable ordering introduced in commit
c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable"), to enable CRTC early.

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/drm_atomic_helper.c           | 24 +++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 include/drm/drm_atomic_helper.h               |  2 ++
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5a473a274ff06..c0cdd36a03df1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1692,6 +1692,30 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
+/**
+ * drm_atomic_helper_commit_modeset_enables_crtc_early - modeset commit to enable outputs, start CRTC early
+ * @dev: DRM device
+ * @state: atomic state object being committed
+ *
+ * This function is a variant of drm_atomic_helper_commit_modeset_enables()
+ * which enables CRTC before encoder/bridge. This is needed on R-Car DU,
+ * where the CRTC provides clock to LVDS and DSI, and has to be started
+ * before a bridge may call .prepare , which may trigger e.g. DSI transfer.
+ */
+void
+drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
+						    struct drm_atomic_state *state)
+{
+	crtc_enable(dev, state);
+
+	encoder_bridge_pre_enable(dev, state);
+
+	encoder_bridge_enable(dev, state);
+
+	drm_atomic_helper_commit_writebacks(dev, state);
+}
+EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables_crtc_early);
+
 /*
  * For atomic updates which touch just a single CRTC, calculate the time of the
  * next vblank, and inform all the fences of the deadline.
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 116ad9605704b..b7e2a735a03ae 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -547,7 +547,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables_crtc_early(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 53382fe93537b..d7fb473db3431 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -93,6 +93,8 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 					       struct drm_atomic_state *state);
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					  struct drm_atomic_state *old_state);
+void drm_atomic_helper_commit_modeset_enables_crtc_early(struct drm_device *dev,
+							 struct drm_atomic_state *old_state);
 
 int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 				     struct drm_atomic_state *state);
-- 
2.51.0

