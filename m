Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3002D6062
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 16:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB036E3F5;
	Thu, 10 Dec 2020 15:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D3D6E3F5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 15:50:41 +0000 (UTC)
Date: Thu, 10 Dec 2020 15:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1607615439;
 bh=y+0dg4WXnd7ljhZe0I2fblcXDIe0tyImGeiQ1ppGIBc=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=LmKCF48ND2zZ16o9AJQfQo5kCgwKPhZpgdsVI5wReiJmG4z0//lXQBM0cNa6cmO1x
 FyThT17SA+1infnQggb4NvctKxijowfspT9t8S4BVgug/z2YHiEzVdOsZpP8mqC1oI
 g5vu33WvKvTFWhkl+ertHRPOybZpkJQjJcLoeOFzaqMwj+2Thwm4SGTpUIKpQVOIxD
 nlD1tSyJJqnbNvmaC2rCth46EcBse+06AYoxsgFsM4N2P93iS4x4PcI7rpEb1XvPxC
 Ghyl84FVLeTw02ihke8Zez2o1e0pTOoxRh/t+5/ABN4c07F2tWqi8/didxniZUafZy
 sqqqZ3d+f2lYg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/3] drm: validate possible_crtcs for primary and cursor planes
Message-ID: <9YgBvQ4vfzhtRAXphq8hsw4alh2IZQ3Jh3aQztBFk@cp7-web-042.plabs.ch>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a primary or cursor plane is not compatible with a CRTC it's attached
to via the legacy primary/cursor field, things will be broken for legacy
user-space.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
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
