Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66117976C70
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 16:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EB010EBB4;
	Thu, 12 Sep 2024 14:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OFiu/hJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5297110EBB2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 14:45:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 503406000E;
 Thu, 12 Sep 2024 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726152316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBo348yC3L95wfapyQgnGAiLm/Rv72oVU1O83Nnte5E=;
 b=OFiu/hJozka6/ivFs4swj6BhfqQVp6TbsLvCTZrWpi29I/ftStyKqjLujSkelIjTc9OPcY
 XGL0oL0ufRdY273o+C1oQQQdOuumtl5dwQi2pNY6eJcSkRRwolzGIgZNXi9XV/C5eqRRNv
 +hZXDfEA16e8LCa+8+vjUw1ZQHCAkWjayWMmKvRQd17w7QCTcZDcxVSB5ZxxMkl88FZsPD
 G17TbekcZZzeXN7zS5gdhpLgs6ZNFkpVVZWM4iVrszMvA4Al/3TUzncVgWV8QqgBmdAyJN
 PHtmhWIT0dM3VrVjoJQVX7M+z+2ffIlNYJe8NCyuxPx1cnPRE309GzkzEbctIg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 12 Sep 2024 16:44:57 +0200
Subject: [PATCH 2/3] drm/vkms: Switch to dynamic allocation for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-b4-vkms-allocated-v1-2-29abbaa14af9@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=R6SPGn2rr2lmfTLnTDiW499ZcaUmyciVWbCOCWFFM/c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm4v55C7WAonM/09D7jvj4bM0kTxs1GXKHqsKuU
 19CM2Y/yBSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZuL+eQAKCRAgrS7GWxAs
 4vrlD/93d+F4p2CoET3vvC5cMdZ/O8dCuPfsYI4vQJP1VnkFMgVU99qEQsP7m9m8HqLWWgFMV+R
 D4Xf/G9e1wCsKfj7r62pZXRubiGM07KU5Mpeu2lLEkX9jNeaxZbY7lf0izio58Lemj0nr10olwd
 5YevpZIq+peL9JuBXfNMjAQfRVPImNuMrI43yzSzEDlkpAXffekIgMcqek2JFWM0KaSvjUCp+oi
 FGxXO/Mh/KxyOJ53BfTA3u+xvam9D3eQ2J+al8SXkGVTckscxb6ftQ5t4E9M5nc//tErB18cOzl
 QeCXaUxBP1ntKqW/6WmDLaBJGQtbL8qVCZH6C8hvTWwzY6MZPym9KVXZixKqC7XjVlRv9YizMhj
 wCtdU26X0z0IxXGIkvjed6pDED9BUxDwId6zYSL2UDp+EMBvxc7IieKZudxGWGvMT4M91r8upOt
 GtbI7Hd5dIzWlFJxH/CcGYHJAhXR3/oki/e1XtcoRX/3gppN7PituefhF59ji+E0wLLTtZpdNlB
 uxOUlc92MJxJPYtkm9jSiixNQsxhbOSm9YaJCIcW3rscHf64Nv/u7UL0Oa9vMQ96AW+i2t4iemM
 Z+VHLnTIxE/C0gGb7lZrHgeL+YZlmtR2FpI1gaftcKz+Fua6fkqSpkprqFkJxMpS14x0gz8ZTuo
 ySAuo/GZs02wLyw==
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

A specific allocation for the encoder is not strictly necessary  at this
point, but in order to implement dynamic configuration of VKMS (configFS),
it will be easier to have one allocation per encoder.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 -
 drivers/gpu/drm/vkms/vkms_output.c | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 938f369dba7ab82b55c656ac6ccf2dfe5a11f9e6..972aee6853f2b29909291e33652f68740fdc9dbc 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -98,7 +98,6 @@ struct vkms_crtc_state {
 
 struct vkms_output {
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index a0331181ab0e369d711aee0974df4859844c6549..60d5365f8d41b8f20da489cfb9dbc85eb9df4916 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -32,7 +32,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder = &output->encoder;
+	struct drm_encoder *encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
 	int ret;
@@ -78,6 +78,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
+	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder) {
+		DRM_ERROR("Failed to allocate encoder\n");
+		ret = -ENOMEM;
+		goto err_connector;
+	}
 	ret = drmm_encoder_init(dev, encoder, NULL,
 				DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {

-- 
2.44.2

