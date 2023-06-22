Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F7739CA4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6768E10E517;
	Thu, 22 Jun 2023 09:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD4910E502
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:22:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by albert.telenet-ops.be with bizsmtp
 id C9Nj2A00E1yfRTD069Njk1; Thu, 22 Jun 2023 11:22:43 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWX-000BwT-QE;
 Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGWZ-003Vx3-DQ;
 Thu, 22 Jun 2023 11:22:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 19/39] drm: renesas: shmobile: Convert container helpers to
 static inline functions
Date: Thu, 22 Jun 2023 11:21:31 +0200
Message-Id: <63f1bef1f316175615a54490f752d64b7ddd29ab.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687423204.git.geert+renesas@glider.be>
References: <cover.1687423204.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace to conversion helper macros using container_of() by static
inline functions, to improve type-safety.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c  | 11 ++++++++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |  5 ++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 26611440f7a12715..40948b56017ff2df 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -291,7 +291,10 @@ static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
 	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
 }
 
-#define to_shmob_crtc(c)	container_of(c, struct shmob_drm_crtc, crtc)
+static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct shmob_drm_crtc, crtc);
+}
 
 static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
@@ -571,8 +574,10 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
  * Connector
  */
 
-#define to_shmob_connector(c) \
-	container_of(c, struct shmob_drm_connector, connector)
+static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct shmob_drm_connector, connector);
+}
 
 static int shmob_drm_connector_get_modes(struct drm_connector *connector)
 {
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 17e66a018689f648..258288c80756bf16 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -34,7 +34,10 @@ struct shmob_drm_plane {
 	unsigned int crtc_h;
 };
 
-#define to_shmob_plane(p)	container_of(p, struct shmob_drm_plane, plane)
+static inline struct shmob_drm_plane *to_shmob_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct shmob_drm_plane, plane);
+}
 
 static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
 					 struct drm_framebuffer *fb,
-- 
2.34.1

