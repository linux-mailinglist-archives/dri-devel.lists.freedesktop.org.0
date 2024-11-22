Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A397E9D6245
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA5C10EC12;
	Fri, 22 Nov 2024 16:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HFWZhrex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F4810EC0F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:28:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 77909FF807;
 Fri, 22 Nov 2024 16:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjtQQ1bolICg0Cj3uC1vz9qBhffyIX0EePF6iMjpDpQ=;
 b=HFWZhrexD7ynn3nnjoqFLdtyQX8yrpNqYCksWwxYVwuG2jMsSYNFRFBcba/SMkntBk/MOx
 0fXWFiI1IAH1/LTcmm9obF7SUlSEu0gHLrGoblJyzE17NCIXifleZFz3NXqBzcDvuBcUc8
 IVZMfnQLdTWcNlT5O8CdA6gP0mpyx9IbWM0X4iElGtTHHutpCDhkegD+Sc/q72WHB2XNY6
 t+MS9SL2gi2H8utAC4ki/xmBFwy2mTkq+HrXU2r2QUk2qYkfAwBMKK/C1ZUlzlK67+HO7g
 AN7DrtEaVXFO3M7If+WchaJ2pIDEJe3VVExf83XHh8t0q3y0tFSe1Plyy7gJQQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 17:27:57 +0100
Subject: [PATCH v5 2/5] drm/vkms: Switch to managed for encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-vkms-managed-v5-2-1ab60403e960@bootlin.com>
References: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
In-Reply-To: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=NWshA2nhUmLf4+lUiI5nRj1x3O0ZVs1aUdEuVoWdoKs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLEOEBFS5O5qWfownFloyto/umJBvUpjk6mQb
 sMVowA0xnqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CxDgAKCRAgrS7GWxAs
 4oH8D/4k+pBR7pez2m0ozJyJXtzKZcED/qYgtMWsY6uIAFVIe7qdUBmQGalYwrxBwz5zAEgaO/u
 YQ04wBUqlf532sNqjmxIH6J+wHFD1q0TAChaJBT+RKFN8+N38BGnckitD3mq8h8MRv5EN6++/l2
 lcmAL6UpveeVn5QYdIVGRXKMmZ1AzeVRdXKI5nwSJhuWSQ50aGhEWG1HY9CioAnv9KU0JoD6TTO
 E6EvVq00K9KV8BWZJXG5eHRGG2u+kVtdJPz4wbJFOXsaQgmHOGA+N4IC1xF70Cpo5t5gQYaDnHX
 9OVDjnYqeQh78n5Tu3mjKQuN2glgr5Y+HHU8lO2tpSwZhoxYdGG1dPFcwE9Kp99zL17n5pLzBOK
 My+j9T+tGzp8FNtaCClDAjw78hLmEVS24bv0Ew8CydWg8Peblje8AqLCKmB3CwQCioGD6sQs4tN
 m8Wp6DoqWXRzFI7hYzhQ/M0R1Os8aajtlV8QEkDP1vSWXAhzJo8fLOr8bW7j58ku1mPkF1FTPQt
 eMxAQRRZm3nLOEzNFIKXRz7LWeUkDyK3IAbCbMZ1ECVerOuqppsU42zdhmw+sI/rhw+zfj80vnt
 e0ABx+laKp00UoQQylYv00PYAnaj44DljP8HB9/CnOm6PmSJ0LS18By5z0Gm1wT90kSV0hFb/nY
 mjZEa36PRlNLDcw==
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

The current VKMS driver uses non-managed function to create encoders. It
is not an issue yet, but in order to support multiple devices easily,
convert this code to use drm and device managed helpers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_output.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 570823ecb28f589e6323036590ec05a2f633bc9b..ab9affa75b66ce9f00fe025052439405206144ec 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -13,10 +13,6 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static const struct drm_encoder_funcs vkms_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
@@ -84,8 +80,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drmm_encoder_init(dev, encoder, NULL,
+				DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
 		return ret;
@@ -95,7 +91,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
 	if (vkmsdev->config->writeback) {
@@ -108,7 +104,5 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	return 0;
 
-err_attach:
-	drm_encoder_cleanup(encoder);
 	return ret;
 }

-- 
2.47.0

