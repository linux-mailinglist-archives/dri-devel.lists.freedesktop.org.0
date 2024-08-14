Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6266951D46
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9C410E4B6;
	Wed, 14 Aug 2024 14:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mvByp2Kl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FAB10E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67E001C0005;
 Wed, 14 Aug 2024 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNBsa5gXilZCMjJcUNu6qYchNDHM9vRKFj8hM50g5XU=;
 b=mvByp2Kl74mGE6PCxWmChgXv4lBKtvySDTcybijrJMUAxOd+vy1QvAIb8AhuCWJLWFpieU
 U3+Xd25mFABra3b1K3SHpELivWo1+TBqxo5M/+dgSNaUuypY8hQ4KXw/W8HI1jgT/7LTqZ
 YnaSR+f8HKUCXXYJIwHsQbyQo2AF92v2QhKTnx8lU+V38+GjTPimkMt2Xbecwwtr0qLfPA
 FcBt+B1jci95dlCZXoWgRW4k9fMRJxGFiUF8WtO5gyDJO3W2rJwUQDoARtb4aAvpCVq6lN
 m4KGvseCqgs8weym9R9KqQwgftsukbk/qANaeA9HnZTCGKkFXDGTevPW44qrNQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:36 +0200
Subject: [PATCH RFC 14/15] drm/vkms: Add name configuration for CRTCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-14-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2567;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tjoJrPo5BIMBI2L17f4sY05IB9HzBOdBn35thdcKzcY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDrCscwQsdTCWw/uxtxJAmPQDMbjohNTLsUx
 iPCzx0eA5iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6wAKCRAgrS7GWxAs
 4szQD/4rCaqKNfLW9uhjCTCTuwJ20GY0AiBdTH4uC7GxNKeazdSaRvBhCR+gxgvo3q/KeYZU98d
 LAjUvLGaT2VuQ+bsBri4pPiuhei3xyQZOw+XhOU0zQ4tQpQ6Ri43vSi4uz+hLhGKsY55GfRlAtD
 4tqAl88TKyCY2d11Ycj+nXi7xfyI1s8bGEZQYY45UwxotFdRBspHGFdUcJvjuMn1ZpIXrWdfekd
 bKLPeSaxwaz8T3mkeJkFmawMJwcZZVmTJNKmzXD/NXRoFhwZLbwGCvO41lstUn8jxB2l64rwAxh
 8WK51LtUXg+X3GOHivCl0trkdfSPhctupA8ArV2WHo1wrQkWbmmGq3mHElsneFFppgtZwtiHs17
 mAuKZ+mwLsYVJI0CM3df7n77dGXb6NqJy9lI5WxkjsxmE1S69EpoVYcg4dYAsNBYSQY8h9sVjB+
 V94MSdZyqJBQ1icnQLbBR0I9NSDmX0rK+GBDXj4zPr0z1bq+SOuvygZLqwo5aVN012LugjtICHV
 weDXWBrnNMu80tqAbFdWOkbAdwSUl60XsxG+jVtFj61KKMLkMgnJbWwBcVSaEibQ+wxgv5WBZBU
 AW9ekDYZjZxGYcprYM/QzhQsPC39b+zeLg9H99Zmvx/rTk2+znc9Z7I20UTnBSpsvVkTOdbnKfp
 SmWPO+02ojaYD6g==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

As a CRTC will be a directory in ConfigFS, add the name configuration for
CRTC name so we will be able to reflect the configfs directory name in the
drm name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 5 +++++
 drivers/gpu/drm/vkms/vkms_config.h | 2 ++
 drivers/gpu/drm/vkms/vkms_crtc.c   | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 7ef525091967..a6bf7ae6d216 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -35,6 +35,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 	if (!crtc)
 		goto err_alloc;
 	crtc->writeback = enable_writeback;
+	crtc->name = kzalloc(sizeof("Main CRTC"), GFP_KERNEL);
+	if (!crtc->name)
+		goto err_alloc;
+	sprintf(crtc->name, "Main CRTC");
 
 	encoder = vkms_config_create_encoder(vkms_config);
 	if (!encoder)
@@ -213,6 +217,7 @@ void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
 		}
 	}
 
+	kfree(vkms_config_crtc->name);
 	kfree(vkms_config_crtc);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 4223edd94ec2..4a4c16dea785 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -29,6 +29,7 @@ struct vkms_config {
  * struct vkms_config_crtc
  *
  * @link: Link to the others CRTCs
+ * @name: Name of the CRTC
  * @possible_planes: List of planes that can be used with this CRTC
  * @possible_encoders: List of encoders that can be used with this CRTC
  * @crtc: Internal usage. This pointer should never be considered as valid. It can be used to
@@ -38,6 +39,7 @@ struct vkms_config {
 struct vkms_config_crtc {
 	struct list_head link;
 
+	char *name;
 	bool writeback;
 	struct xarray possible_planes;
 	struct xarray possible_encoders;
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 654238dbba7f..5b659d67b9ce 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -298,7 +298,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 	int ret;
 
 	vkms_crtc = drmm_crtc_alloc_with_planes(dev, struct vkms_crtc, base, primary, cursor,
-						&vkms_crtc_funcs, NULL);
+						&vkms_crtc_funcs, config->name);
 	if (IS_ERR(vkms_crtc)) {
 		DRM_DEV_ERROR(vkmsdev->drm.dev, "Failed to init CRTC\n");
 		return vkms_crtc;

-- 
2.44.2

