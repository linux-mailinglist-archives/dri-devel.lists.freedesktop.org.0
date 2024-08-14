Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FCB951D49
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A2D910E4BB;
	Wed, 14 Aug 2024 14:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="S0CZ3pId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868B710E4B0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 695151C0013;
 Wed, 14 Aug 2024 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iv9G0qT3QDgWb7mJla/RT5pO59ye8gTf1MNCr9gFUH0=;
 b=S0CZ3pIdYc0MG0mTR5Ntzwhm/ivfK793sCZtSr+1lfpdt6l2+WQ7KMCSg4WBUNDsRxrDXI
 J/PxcGPj/zNBcv3peTnfo+nA7XT7m9JE1Go6WSEoFmZK3POZbA7lFFIrmXcek6rS55TAz7
 iHT5Ux/7WrjlI+75DLVK/J8n5ZyobFGTpZk+sTIIIFsPrmZSsRYP4+cirtwwxRdgTfTVxh
 Xe9FftWq1CA2+pU+4G/LowYt2fy9X23KG7+xTJ9FAwrkN71Jf1/do9farSsNXYDn+GTy+f
 cH6eJW+4JHuo5ptRF582y1C0Fgtk7pIJJHAwtz+HUNfZ2XlVc5cL7VCmCklw9w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:35 +0200
Subject: [PATCH RFC 13/15] drm/vkms: Add name configuration for encoders
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-13-6e179abf9fd4@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2974;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7ECEXMl0/sjLnYGUbuJj1pxIV+1npiLzlGfXdPZbOiQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDrxIqYar9la9HQlFNEf9xCptfEMltxbvRGS
 V8eIljbQaWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6wAKCRAgrS7GWxAs
 4nxMEACCHj59aLFDqD8+GAzzBA8IMbwVpDf4E4CLJT1rk5OA0WUHbHMg8xYB2nI3ieiPt/3rZlh
 o4CuzlDj58qNv1kX0tbn03M4eWFW6onC+mnmi9nDo4IveT+vB/8y1o1A1v+EEiWVfRJd2ZdiFUs
 2prGrer7ChxaPoRVy8/3npB4Nw270dQqR/p6ZoIQ/U0jTBD6OcUXuGHOTfPDl7f604iILIlHH4H
 2NC9bNgmrs5mnRdi0sgkkfVf8NNV6HP5TdWI1dVkApW1/klzch3HsmBE4Q6hAydCodMHLbmK1nU
 7XLnef1dSsiD1pKGRnRbw1hP/eJypx1Fiddo0bLZ6oyGpTU4Ciq0NBakAbF3O6SzqDXnAGzQYEl
 5bRveUyuhcxcEgqKHbyxC2cVbzFFE1H//MX5lqSoZC3eHDjLulAex/Nk9tZ0WEeiTWrATn5XgL6
 iFAf1WYddQwS/whJ3a0v0IDnyyj/dLOEIwSgWifmGYq+59IRRbcPqPCp0vvvIW8gxWKSYrGDIvg
 NcS0uOMIlJICShZrwsCbWxP8R4WF8QWMr4QwuojOjtBsbYVFH5HrNoeZ0vhUx2yw3QJw7enFNzx
 9V4ScEPGBmLg62fm3Wx5V4AEAqklj3O+sciPb1dRUlih0YaKQdmnZV6Xe2LtNz9/Xw+5CqcNTC8
 t4cXU9O/g95nBtQ==
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

As an encoder will be a directory in ConfigFS, add the configuration for
encoder name so we will be able to reflect the configfs directory name in
the drm name.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 6 ++++++
 drivers/gpu/drm/vkms/vkms_config.h | 2 ++
 drivers/gpu/drm/vkms/vkms_drv.c    | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index fcd4a128c21b..7ef525091967 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -39,6 +39,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 	encoder = vkms_config_create_encoder(vkms_config);
 	if (!encoder)
 		goto err_alloc;
+	encoder->name = kzalloc(sizeof("Main Encoder"), GFP_KERNEL);
+	if (!encoder->name)
+		goto err_alloc;
+	sprintf(encoder->name, "Main Encoder");
 
 	if (vkms_config_encoder_attach_crtc(encoder, crtc))
 		goto err_alloc;
@@ -232,6 +236,7 @@ void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
 		}
 	}
 
+	kfree(vkms_config_encoder->name);
 	kfree(vkms_config_encoder);
 }
 
@@ -394,6 +399,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link) {
 		seq_puts(m, "encoder:\n");
+		seq_printf(m, "\tname: %s\n", config_encoder->name);
 	}
 
 	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 8f247fc09373..4223edd94ec2 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -50,6 +50,7 @@ struct vkms_config_crtc {
  * struct vkms_config_encoder
  *
  * @link: Link to the others encoders
+ * @name: Name of the encoder
  * @possible_crtcs: List of CRTC that can be used with this encoder
  * @encoder: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms encoder during device creation. This pointer is
@@ -58,6 +59,7 @@ struct vkms_config_crtc {
 struct vkms_config_encoder {
 	struct list_head link;
 
+	char *name;
 	struct xarray possible_crtcs;
 
 	/* Internal usage */
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6deff5099322..cd3920270905 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -216,7 +216,7 @@ static int vkms_output_init(struct vkms_device *vkmsdev)
 		if (!config_encoder->encoder)
 			return -ENOMEM;
 		ret = drmm_encoder_init(dev, config_encoder->encoder, &vkms_encoder_funcs,
-					DRM_MODE_ENCODER_VIRTUAL, NULL);
+					DRM_MODE_ENCODER_VIRTUAL, config_encoder->name);
 		if (ret) {
 			DRM_ERROR("Failed to init encoder\n");
 			return ret;

-- 
2.44.2

