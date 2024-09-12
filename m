Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B500976C6E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF2410EBB6;
	Thu, 12 Sep 2024 14:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="USnakRW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7145C10EBB4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:45:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9446560002;
 Thu, 12 Sep 2024 14:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726152316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjOJC+EL99w5X5JPK4o+U/Y7d6sfgViwqZhRV6zOAXs=;
 b=USnakRW0P3+On5tsLuyinvtacjPXpy8jk6m6vSK0e9hSSGrgC5lcDcREmd4Lqoj8nI+3xG
 n/cZZ9kaXMaUIyuErJkrf/yDZ/rNcXrbQ3D7fGivoB7fwF2MEjLCLvYt3veMIrGYtl9nzB
 3GzEv+7HW8OCkKfb8qkwKi3MFAc49As76BSSN0CGJOnPWJvp1HN1Y9eticXFeRxAKCZC53
 1/wveso1Z8q39B29mOimsDEwOcQLSpYC1LsRSUjBdQ/JPWWMTmwjmrAkaM1/QYu4UJOn2r
 W6+QSGOD1st0q/K2CZjNWmJ/guX6Kkl2R8rNxAlZPs9mkmxi26feUs+l+6mIAg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 12 Sep 2024 16:44:56 +0200
Subject: [PATCH 1/3] drm/vkms: Switch to dynamic allocation for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-b4-vkms-allocated-v1-1-29abbaa14af9@bootlin.com>
References: <20240912-b4-vkms-allocated-v1-0-29abbaa14af9@bootlin.com>
In-Reply-To: <20240912-b4-vkms-allocated-v1-0-29abbaa14af9@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VISv8cauLqco3i0yU3WE+qBEYcD8Yqy+TzLEZjfI2aA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm4v55KfOcgsvimu2ERpNMHzA47HInyittFEgRR
 VDvWFM3DuGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZuL+eQAKCRAgrS7GWxAs
 4j/UD/4hQ/weYoMyUBLTN8U6NVvM4pvYx0eSMoehZRzPgxwhhR3D3EY32zadogiYdvftp9aWpin
 45/OGfmnpOjPvC03b5oxWpEiu9JRi5/yKzlxR7smvvxTKhoPZYHrgr0jBlFEBFPfk5CDWvN/5i+
 qvRaI4F/Yu5kgUnNhSEzBwVmddS9jQNeCmGIAMJv3J0+ttDS+yIDPaCHFlyNu+0hgvWgWaGm9yw
 8dOzZ+MGwo2VBZrxGSg1i6vtHBONUK+w0h5KKBHQWLNrGr+x81IwqU+3S+a95y15od2JlkQtLLy
 1Lm7LlXXNGCZpUhthutXrDE/wBOq/T9rgCEDqPCjeO2jtuOISk7fFhXqGC03MFFprocf4JJHNuk
 DY+rYvNWJj9ie7HIM+Y5fW2G/CUdXro2c2ttixYOYZhHMrh0UR8eL0o/OTE/ZiUiLGOABdj83Ik
 WwW7be/XZESwR3EZB+ARwE48cScO3D8qCO4cHsJfAbEYrR3yauoL/oyZOI12QFjueOuPreQbPJz
 BvUr31ITHrYzO+iPnApjPz094BUSoy5wAFxSETfZ7qXkQNY0XCkFD/XFwEeWdqayW0LNn0oa+YS
 niTtXjr8Mpf5FyJ7uwafs3MqtFd/utBcTZOzHB+aSOQp7AExKT4cc6rvSf4jqs32EqLirPulpoP
 et/l8QiVuM28kxQ==
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

A specific allocation for the connector is not strictly necessary
at this point, but in order to implement dynamic configuration of
VKMS (configFS), it will be easier to have one allocation per
connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 -
 drivers/gpu/drm/vkms/vkms_output.c | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index dac063f11dcd751865cc79d3c2466d113b8e79c7..938f369dba7ab82b55c656ac6ccf2dfe5a11f9e6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -99,7 +99,6 @@ struct vkms_crtc_state {
 struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct drm_connector connector;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 2226ba1972f3ff51483abacac45ee8914be0c94a..a0331181ab0e369d711aee0974df4859844c6549 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -31,7 +31,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
@@ -62,6 +62,13 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		DRM_ERROR("Failed to allocate connector\n");
+		ret = -ENOMEM;
+		goto err_connector;
+	}
+
 	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {

-- 
2.44.2

