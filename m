Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27AD2D7EE4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 19:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B1B6E8A2;
	Fri, 11 Dec 2020 18:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC286E8A2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:56:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id D78853A7D8C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 18:46:58 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4531BE000C;
 Fri, 11 Dec 2020 18:46:36 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/4] drm: validate possible_crtcs for primary and cursor
 planes
Date: Fri, 11 Dec 2020 19:46:32 +0100
Message-Id: <20201211184634.74534-2-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211184634.74534-1-contact@emersion.fr>
References: <20201211184634.74534-1-contact@emersion.fr>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a primary or cursor plane is not compatible with a CRTC it's attached
to via the legacy primary/cursor field, things will be broken for legacy
user-space.

v4: use drm_crtc_mask instead of BIT (Ville)

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index f1affc1bb679..1628c8b60d9a 100644
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
+			WARN(!(crtc->primary->possible_crtcs & drm_crtc_mask(crtc)),
+			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
+			     crtc->primary->base.id, crtc->primary->name,
+			     crtc->base.id, crtc->name);
+		}
+		if (crtc->cursor) {
+			WARN(!(crtc->cursor->possible_crtcs & drm_crtc_mask(crtc)),
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
