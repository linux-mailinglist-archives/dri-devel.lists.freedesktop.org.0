Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE550A17C6D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3CB10E57B;
	Tue, 21 Jan 2025 10:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZwAaceVd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC5A10E573
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0D4D40012;
 Tue, 21 Jan 2025 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ubw63Fe9Yhv72/NM7/4903dvfCHgNHv426Pizoj94N8=;
 b=ZwAaceVdWyZTFSwk0cvfv/gj3c7yuj8phaj5B4PCSSsWSkZFs3YRbVaeRaKEiJO+rWMinY
 veB/mtY6R6AYhyUztLdDgCjve4n2sC8ZkjULcMF9peEgHIyb4FAEcdf0ml/JF0B2gVbFCb
 MVY9Dcswl5HHdgsVHbYkGnKl0CnR+l0tp1q2GoExIT8wu04kwLEFb+E1qerAXr+sPMWvKZ
 bT02hSM8m6+xxXx3nBMQxGihSRN7+EeCqAuVb6xNNK2pIQbYJz4U494PPGubvcnpz9awS+
 5/IsjKm8Q9A1i1Z4q43HWwZBQL0eqRAQjDprmCff1zJ0dzuNcb7ES6TA+W4aBQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:40 +0100
Subject: [PATCH v3 16/16] drm/vkms: Introduce config for encoder type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-16-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2577;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3Uxt9AsZYAsifD+dZG6PItmtjDqqXrCvkT981nanQ+w=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30l/cLzvUD0vqUSYIoiv/uUEhKQ58HtXMtFb
 Bg6Gpo1m+6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499JQAKCRAgrS7GWxAs
 4jynD/95nJtbOf6oHrZj1qKPB36gxyDHT74VRdzt2fqdRx3QvRJ1Y58YzbTZrYOvFWxEsjRsWtk
 miJTeujVuw9LKoDhjNxIa0Al1r9qR9B7cIarf+J9oIduoh4ZooJOCDR0WKxCYbOYSs0w4LqjT8b
 iu9R3q9J8ILNutmOoK23aIQC+sMxq0UP7s5fPzed8IW/XnxV9McqLPkI+GCHAeJvum9KUbRtWna
 gUhJ7sH/ZX3WjKk2VnF1H446ocQfvQYF1fNbfAHTyxRHtTILrFGjjG3M1l1QC7EFg1fFL5uicv1
 lF4eQ5XAIsuyjOyB9M7Bv1KB99QiUfSAFZohfUSBwf19k+V757KRIlAaVWXdin3KWe8TXaS3AYo
 7/l+Aa3P9+Wn3CQTM2rGwmX+YSlh7WGt+KtHeGL9ZRHTy9goUZZvAaF6kw8WblTPZX8lsq1MbBc
 aTooO/vyl2IXxdxByQvtkWKio/50wrmqnvm+FNlTdYqOI31kDlUgYaqm+eUXqjNNY22KOgUuIub
 IGl8qCXowIomGr0FyaIVXSRHgCq0C9O6Wsjz3XHxfmpx/ypKYIb00O+X8ZNKWp37ro+4JPMAfbV
 c6f+mOSFnE4fEV/LDCXQy/rsv0l2ICLCG1iH7Xw/I1yYgW5wHA3L2SMR30/WcHFt/iu0+y1TnYy
 N0x/HNTUXck029g==
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

To allow emulation of different kind of encoders, make the encoder type
configurable.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 1 +
 drivers/gpu/drm/vkms/vkms_config.h | 2 ++
 drivers/gpu/drm/vkms/vkms_output.c | 2 +-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 3e8883298e73e75fb16ac05e449a7ee8fac72935..a20644031ce923fad98d486a8bb2ec7859038dcd 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -205,6 +205,7 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *vkms_
 	if (!vkms_config_encoder)
 		return NULL;
 
+	vkms_config_encoder->type = DRM_MODE_ENCODER_VIRTUAL;
 	list_add(&vkms_config_encoder->link, &vkms_config->encoders);
 	xa_init_flags(&vkms_config_encoder->possible_crtcs, XA_FLAGS_ALLOC);
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 6844ca8523decd51116fb36f98ed40a09bc2284b..23f420291cfc0044ccb2be90688d021aab10c1c0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -55,6 +55,7 @@ struct vkms_config_crtc {
  * @link: Link to the others encoders
  * @name: Name of the encoder
  * @possible_crtcs: List of CRTC that can be used with this encoder
+ * @type: Type of encoder, see drm_mode.h, DRM_MODE_ENCODER_*
  * @encoder: Internal usage. This pointer should never be considered as valid. It can be used to
  *         store a temporary reference to a vkms encoder during device creation. This pointer is
  *         not managed by the configuration and must be managed by other means.
@@ -64,6 +65,7 @@ struct vkms_config_encoder {
 
 	char *name;
 	struct xarray possible_crtcs;
+	char type;
 
 	/* Internal usage */
 	struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 8f7df59aa2c1517eb78e9b94b8611b15431fd234..a48625e879f59a33e18e636cafcdc7f841a0ff1f 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -132,7 +132,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		if (!config_encoder->encoder)
 			return -ENOMEM;
 		ret = drmm_encoder_init(dev, config_encoder->encoder, NULL,
-					DRM_MODE_ENCODER_VIRTUAL, config_encoder->name);
+					config_encoder->type, config_encoder->name);
 		if (ret) {
 			DRM_ERROR("Failed to init encoder\n");
 			return ret;

-- 
2.47.1

