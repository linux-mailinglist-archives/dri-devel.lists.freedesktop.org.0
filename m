Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D21976DB5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 17:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0706610EBCF;
	Thu, 12 Sep 2024 15:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UPURCvKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125310EBCF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 15:26:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BAB940002;
 Thu, 12 Sep 2024 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726154788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1N6F3NgoFy3d7URwWvnHA4RSAADZLw/Lv40JW9LXebE=;
 b=UPURCvKu35+P1Q8LdtRdWy7EZSXK74XR92SWyKBwNilWaA0zfEq5O6cbqF2ZH/8RoKD9sV
 iRrrwREOW38UPTen3l/TV9Ds24vlyejs4d/UTEMH6OU/bxH4cY+wHf8iHibc0QWjaDshRn
 WWUImmJ/b82yiUt6EWzkvDwPkE6wjJBUt99vtRBPmCHXZps1WPjC3v9EoIpPxpxI816Jxo
 3kLbpGGqtxcHyfw73/sSlm/gtR3B6qB8xtTRbiIfQgVcY7uthhfHCMbFdmzQCW+lZKQjZS
 vjhrJYEBZ/8lGVFKwMKa8Y6x/I2lpcZCIZjXhI8xztk2XCHxx2MsPTiT3xSEZQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 12 Sep 2024 17:25:33 +0200
Subject: [PATCH] drm/vkms: Suppress context imbalance sparse warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240912-vkms-warnings-v1-1-59f3e13ea8e5@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOwH42YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0Mj3bLs3GLd8sSivMy89GLdVINUY2PDpGTTVLMUJaCegqLUtMwKsHn
 RsbW1AJyIn4RfAAAA
X-Change-ID: 20240912-vkms-warnings-e0e331bc5e6d
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1435;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/qs6pBE+6TXI6raTey9HQj8iXVGyKi538F1VSOwPpiA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm4wgj0iAgp/MqkajSlDB6sB9SLJZEDklvx0dLN
 V8oHHDpCpWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZuMIIwAKCRAgrS7GWxAs
 4lX1D/0T5LCCTxAr3zJUW8h+hK6OuEwnsQqzPdoSs7c9PrIzFs/uQvdT8pvO+rgHTZIo/3z36FX
 aANh/DAGCzFyhwlXRH84O8uSK0NkGdT4tgKUwr8PBiZnACywiTzczyzCI28HBG3GLW+8k6Rrf/o
 zv3JpzgV/l1DpYJuN6ChAIgzyiS/WDI+K3BaktVqwMylUaCWrfqGrLjIuNQl7zxb7WIY2mksYGM
 7bqWv6OEnqp4QumLaksxuR9kULOK8Grq7pKZqdxBU8nRMxgHcpAYVIFYcT3Za4BOEWQQ+eixN/+
 Lde25x5Kw8bpJfBNJCz2zj5BHcMlE0jtRYE2cxs3aH6XFGhgdDMZVvmUM/v98t3o+my3E9XmDlb
 7H3QqOKdlQBTnHUrbOg3NvOkQ151z6sB37CaojFaobgQ9efprle/EKrsuToLJV2bMdYagvOBN2F
 VDJTbwJ6a3JXpGn/0nhmbSFw7E7/No7L70pUjYpsNS8fLNV1+3E6eDtMQxrYfkg4/xdBnXBKB/P
 xzIgK5X/ZALiwOUyX2VzvSSju3adc2enfla755yTULv+ZyuawTta2bAgfbLHz2vkXI1K4XLxF0D
 earPOdf0sgRYRMDqZKpIMRJm3dyhxXp+InX7Pgo5wuvpral9+eZq17eCd02NUArQWFmgZv++PFN
 sl7cMo+RPzutfGA==
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

The functions `vkms_crtc_atomic_begin` and `vkms_crtc_atomic_flush` are
responsible for locking and unlocking a mutex, respectively. Add the
`__acquires` and `__releases` annotations to these functions to prevent
the associated sparse warning about context imbalance.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 40b4d084e3ceef9e1e24b7338efdd9253afee8d6..2ad164b518fb93f5b6b86948116ff7ed97770b60 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -232,6 +232,7 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
+	__acquires(&vkms_output->lock)
 {
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
 
@@ -243,6 +244,7 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
+	__releases(&vkms_output->lock)
 {
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
 

---
base-commit: d2194256049910d286cd6c308c2689df521d8842
change-id: 20240912-vkms-warnings-e0e331bc5e6d

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

