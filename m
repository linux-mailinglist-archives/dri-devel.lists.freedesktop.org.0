Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406362D740D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E99E6ED24;
	Fri, 11 Dec 2020 10:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF336ED24
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:39:16 +0000 (UTC)
Date: Fri, 11 Dec 2020 10:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607683154;
 bh=dAxiqyZAeRZSF9HRZFZR7wYT4vsv1j2bgvCu8Dri/eA=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=gHsiNKJwdPPKQnLq+bAAy4WejP2HASeD6C8TtTGZ07cQM0/wCQiWcnfyvE4f/Qvgy
 X0d+Kfru2xcZuHzNn+EblN7blFAlHtIBkbnR38VeexVT+OpOcj7Ilfog5b+YdEhZUH
 482ota448fQt9RDyhJk90EhegFbT/IIP8V6yPYhQQjmZCSOvPQQXfwHRU5rhL35gbM
 k0/JlUpzGdhUvTX3ScrQ3+S1VpTSxSUtt52PQAAYic54MvNhNMjS4+9Pp0Sl2UC9KH
 lOl5EM41Oz4zJ/VRfFbf9ZrMfOsqmAxnGJhK2lvlPEIKiVG5su5Dy0wVzVQ6tfSatq
 28Vj9ejaAUUTw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 2/4] drm: validate possible_crtcs for primary and cursor
 planes
Message-ID: <da6Qc7lX6TUJtxF2a9VsDe174t38QEgWxY3UT2CcDo@cp3-web-020.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a primary or cursor plane is not compatible with a CRTC it's attached
to via the legacy primary/cursor field, things will be broken for legacy
user-space.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index f1affc1bb679..2c73a60e8765 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -625,6 +625,7 @@ static void validate_encoder_possible_crtcs(struct drm_encoder *encoder)
 void drm_mode_config_validate(struct drm_device *dev)
 {
 	struct drm_encoder *encoder;
+	struct drm_crtc *crtc;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return;
@@ -636,4 +637,19 @@ void drm_mode_config_validate(struct drm_device *dev)
 		validate_encoder_possible_clones(encoder);
 		validate_encoder_possible_crtcs(encoder);
 	}
+
+	drm_for_each_crtc(crtc, dev) {
+		if (crtc->primary) {
+			WARN(!(crtc->primary->possible_crtcs & BIT(crtc->index)),
+			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
+			     crtc->primary->base.id, crtc->primary->name,
+			     crtc->base.id, crtc->name);
+		}
+		if (crtc->cursor) {
+			WARN(!(crtc->cursor->possible_crtcs & BIT(crtc->index)),
+			     "Bogus cursor plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
+			     crtc->cursor->base.id, crtc->cursor->name,
+			     crtc->base.id, crtc->name);
+		}
+	}
 }
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
