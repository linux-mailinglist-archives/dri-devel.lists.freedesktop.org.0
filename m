Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB532DA1FE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 21:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCC26E170;
	Mon, 14 Dec 2020 20:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270346E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 20:52:24 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D59641287;
 Mon, 14 Dec 2020 21:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607979141;
 bh=8i3MKwXQpnZYvvMikuzBdeCUm6nSFdpawgqtVV6v2F8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=obaa0yQbyjPDgRhBm4DDwMdP7xsJ4+0gcWszOkfktycv+8osXLn8ZQSAS/U2ZfqZi
 El7AJTIaFqm2wqi0XLTqlKpQuBcwyZ5holC9M9LklQz3c6mU1A6eM9ibnBoUM+glFK
 TwBbnXY73c7JDuienj7maJzcNALbr1bILCAi7C0A=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] drm: rcar-du: Replace dev_private with container_of
Date: Mon, 14 Dec 2020 22:52:06 +0200
Message-Id: <20201214205208.10248-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201214205208.10248-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that drm_device is embedded in rcar_du_device, we can use
container_of to get the rcar_du_device pointer from the drm_device,
instead of using the drm_device.dev_private field.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 2 --
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   | 5 +++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 8 ++++----
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 4ab99ac49891..d6a8b7899952 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -587,8 +587,6 @@ static int rcar_du_probe(struct platform_device *pdev)
 		return PTR_ERR(rcdu->mmio);
 
 	/* DRM/KMS objects */
-	rcdu->ddev.dev_private = rcdu;
-
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
 		if (ret != -EPROBE_DEFER)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 0b1726fd7bdb..02ca2d0e1b55 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -99,6 +99,11 @@ struct rcar_du_device {
 	unsigned int vspd1_sink;
 };
 
+static inline struct rcar_du_device *to_rcar_du_device(struct drm_device *dev)
+{
+	return container_of(dev, struct rcar_du_device, ddev);
+}
+
 static inline bool rcar_du_has(struct rcar_du_device *rcdu,
 			       unsigned int feature)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 57bb0dc22807..d6b71a9361ca 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -327,7 +327,7 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	unsigned int min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
 	unsigned int align;
 
@@ -349,7 +349,7 @@ static struct drm_framebuffer *
 rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	const struct rcar_du_format_info *format;
 	unsigned int chroma_pitch;
 	unsigned int max_pitch;
@@ -421,7 +421,7 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 static int rcar_du_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	int ret;
 
 	ret = drm_atomic_helper_check(dev, state);
@@ -437,7 +437,7 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
 	unsigned int i;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 5f69ff4502c1..02e5f11f38eb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -128,7 +128,7 @@ static int rcar_du_plane_hwalloc(struct rcar_du_plane *plane,
 int rcar_du_atomic_check_planes(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
-	struct rcar_du_device *rcdu = dev->dev_private;
+	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	unsigned int group_freed_planes[RCAR_DU_MAX_GROUPS] = { 0, };
 	unsigned int group_free_planes[RCAR_DU_MAX_GROUPS] = { 0, };
 	bool needs_realloc = false;
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
