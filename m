Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12877A19A3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 10:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D7E10E5F3;
	Fri, 15 Sep 2023 08:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDBA10E5E3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:54:17 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7135:da8b:ba1d:1a7c])
 by laurent.telenet-ops.be with bizsmtp
 id m8uE2A00U3q21w7018uEgN; Fri, 15 Sep 2023 10:54:16 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4aJ-003lHC-MX;
 Fri, 15 Sep 2023 10:54:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qh4ac-00GdcI-NN;
 Fri, 15 Sep 2023 10:54:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v4 21/41] drm: renesas: shmobile: Convert container helpers to
 static inline functions
Date: Fri, 15 Sep 2023 10:53:36 +0200
Message-Id: <7d1f1aa4b832499f9e527353ce0ad6d84ff9a74a.1694767209.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace to conversion helper macros using container_of() by static
inline functions, to improve type-safety.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c  | 11 ++++++++---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c |  5 ++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 9c66e00ed70ea582..207fa98fe76d6f88 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -258,7 +258,10 @@ static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
 	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
 }
 
-#define to_shmob_crtc(c)	container_of(c, struct shmob_drm_crtc, crtc)
+static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct shmob_drm_crtc, crtc);
+}
 
 static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
 {
@@ -538,8 +541,10 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
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

