Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72BC9FEA0B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A0F10E572;
	Mon, 30 Dec 2024 18:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DpCBW6mR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA0C10E56D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:40:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5650D60004;
 Mon, 30 Dec 2024 18:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735584018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCBx3ymlkAhH0BIP1JaOeEyel3tpTFiAF8iXUOkELOM=;
 b=DpCBW6mREzMqaKiESWr2KmwWBHsiDKBb98cdLojq2JGbCU1w6ykQ+FpzqPfM+WEWK4dWdL
 bFE0Z/RX7DHUA+7dbrvCD/bg4qJuez7RWKC+g2oVSqzyh75J0pSR/W7BxjN1adQQseP1HW
 G4cfWEess+KzMXm1feu+FbIb2m7K3XrdfRGcc8SNaSVMiBBtFHq00aaIGPm+IK6lkDqPMR
 mKq7KsHSN7ufHFqUmnsEP+c7HGlS35VxqvhQ/QxEwO3w6F7Wql1KejYn98o6pJ+YoWBSHD
 5gZ932Q06Be8WsJk1fpR/4DyL3cOwrvxGE7u4kp/wG0U4Y3FtpJxJEu9p1CXHQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:39:44 +0100
Subject: [PATCH v3 1/3] drm/vkms: Switch to dynamic allocation for
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241230-b4-vkms-allocated-v3-1-5dda4c1bd459@bootlin.com>
References: <20241230-b4-vkms-allocated-v3-0-5dda4c1bd459@bootlin.com>
In-Reply-To: <20241230-b4-vkms-allocated-v3-0-5dda4c1bd459@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2110;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=RPpG/0FEqNsXZD4OHFcxE/BsPBQGg3e6ebFJPMqGBAE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncukOiFm1TkkE+Nn+y0jo+bAfa6zWsEq3rk/LC
 iG8HEAhTvGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LpDgAKCRAgrS7GWxAs
 4iEJEACsJBtBVHn7zawhLmQC43uvRSn6iCccVfYfP4qDeHSSJ/OlgRqJFeKfgNQmJia8FkQiSmz
 R/+2vuxWmMBYYnVP+NnW5RmC3jjumgVIqsBwu9VyDN0eQMgTodiwNP1miSoWFq8vHutTTNKMvtZ
 od5PKpl/qZKXudQH9OdeZ24dnpbn4j4qdVUvrhz2kWMHHAYmsYk8j0VHkv3INcx12IsrgucxLhr
 RwiM4fmXLXbEmgotmkpcdetKWG5XR+o6uIwlKnJxgcgD4Nm/FSYdrAVUtIsYfw8+j2oR8KUcH+0
 lmp9b8YWICiiuke6ZN5tcT7p5aolq03e3aXfS7Ip2LUkgBNwWZYC/6gkPrd7d8SvIj/6cK3qTiI
 FQMPlH40Cr0rvtfysErVHCSXZd3nD7vsuI/f7fPyBPvkG3Pcclj9en/+xUBMd3stEOeerCCBEBW
 Y1pV2bVjULKob257fAm1YegY55esa3syoqFwILebgdrzWT64Wi96r0hEz+LOSyUQ1+j4KWxln2j
 oY/hgGl3regiv7ylMRWS9oXw/vpDUHEmAOcEZU1rl4if8qLw0WVwaIF5AgKpy4uXjDx5qmTsIxk
 EuhtMCJqxiKkpi9vGfsbifn6fEh+0lB/Pe2UoRIRKUqPCUfUh9467QWRWIHK8fnAiEy1elaaBsf
 YukFqwfp6MFoZpw==
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 -
 drivers/gpu/drm/vkms/vkms_output.c | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 00541eff3d1b0aa4b374fb94c8fe34932df31509..820e7899cb049b45d8bdbe5a0dc7be08eee6db69 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -177,7 +177,6 @@ struct vkms_crtc_state {
 struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct drm_connector connector;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index ab9affa75b66ce9f00fe025052439405206144ec..ec3545730ef79af0db51d8ec605b9cdfff52c2a3 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -32,7 +32,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
@@ -71,6 +71,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		DRM_ERROR("Failed to allocate connector\n");
+		return -ENOMEM;
+	}
+
 	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {

-- 
2.47.1

