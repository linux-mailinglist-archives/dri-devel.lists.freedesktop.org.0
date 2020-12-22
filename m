Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8982E0AF3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 14:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FC16E866;
	Tue, 22 Dec 2020 13:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9966F6E866
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 13:40:06 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3C151C0003;
 Tue, 22 Dec 2020 13:40:03 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: warn if cursor plane is set with legacy funcs
Date: Tue, 22 Dec 2020 14:40:02 +0100
Message-Id: <20201222134002.161613-1-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A driver must not set drm_crtc.cursor and any of the legacy funcs at the
same time, otherwise it's not clear which one DRM core should use for
legacy cursor updates.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_mode_config.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 9611f21bca00..92e56baf04ad 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -645,6 +645,16 @@ void drm_mode_config_validate(struct drm_device *dev)
 		WARN(!crtc->primary, "Missing primary plane on [CRTC:%d:%s]\n",
 		     crtc->base.id, crtc->name);
 
+		WARN(crtc->cursor && crtc->funcs->cursor_set,
+		     "[CRTC:%d:%s] must not have both a cursor plane and a cursor_set func",
+		     crtc->base.id, crtc->name);
+		WARN(crtc->cursor && crtc->funcs->cursor_set2,
+		     "[CRTC:%d:%s] must not have both a cursor plane and a cursor_set2 func",
+		     crtc->base.id, crtc->name);
+		WARN(crtc->cursor && crtc->funcs->cursor_move,
+		     "[CRTC:%d:%s] must not have both a cursor plane and a cursor_move func",
+		     crtc->base.id, crtc->name);
+
 		if (crtc->primary) {
 			WARN(!(crtc->primary->possible_crtcs & drm_crtc_mask(crtc)),
 			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
