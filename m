Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244007A196F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38A710E5E3;
	Fri, 15 Sep 2023 08:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4E510E5D2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:18 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
 by michel.telenet-ops.be with bizsmtp
 id m8uF2A00A3q21w7068uFDb; Fri, 15 Sep 2023 10:54:17 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aJ-003lHi-Ur;
 Fri, 15 Sep 2023 10:54:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ac-00Gdcs-Ul;
 Fri, 15 Sep 2023 10:54:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 28/41] drm: renesas: shmobile: Rename
 shmob_drm_connector.connector
Date: Fri, 15 Sep 2023 10:53:43 +0200
Message-Id: <2382c4c796b53b5d2b24f99b85954ce632f21b90.1694767209.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694767208.git.geert+renesas@glider.be>
References: <cover.1694767208.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename the "connector" member of the shmob_drm_connector subclass
structure to "base", to improve readability.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 4 ++--
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 84a773a5363035e0..f55b5263e611c782 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -560,7 +560,7 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connector *connector)
 {
-	return container_of(connector, struct shmob_drm_connector, connector);
+	return container_of(connector, struct shmob_drm_connector, base);
 }
 
 static int shmob_drm_connector_get_modes(struct drm_connector *connector)
@@ -632,7 +632,7 @@ shmob_drm_connector_init(struct shmob_drm_device *sdev,
 	if (!scon)
 		return ERR_PTR(-ENOMEM);
 
-	connector = &scon->connector;
+	connector = &scon->base;
 	scon->encoder = encoder;
 	scon->mode = &sdev->pdata->panel.mode;
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
index 79cce0a0ada4cfce..2c6d7541427581a6 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
@@ -33,7 +33,7 @@ struct shmob_drm_crtc {
 };
 
 struct shmob_drm_connector {
-	struct drm_connector connector;
+	struct drm_connector base;
 	struct drm_encoder *encoder;
 	const struct videomode *mode;
 };
-- 
2.34.1

