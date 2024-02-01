Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E63F845E9E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 18:35:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B510EF04;
	Thu,  1 Feb 2024 17:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KusMYAD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEA610EF04
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:35:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 08B4FC2CFC
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 17:32:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98F1D1C000D;
 Thu,  1 Feb 2024 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706808731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VnJbjJTg4nEr9s3zhJjNFrJUiH61j50+UMrQv0IdY/o=;
 b=KusMYAD+N+4EtxtdQAf7yuRN3pKBtt/M/aF0WxpOadyZA6Q3/rkM83J2CXr9N/nmcu5rmP
 racJDueiAn1b5yw2A2cELbJq9nIHtOCp1cUtcN/yjbI93X2t0fHKQtWPZh2wVBzay69x4G
 HnsMyyMsPQfYjvmnBDMQ2P97kYHwJ8++w8qygWoZUPZRX9LW2297qBn9Zk76Qd/9P8E4Fp
 5hZfK7b4KiNrq+ahaDJ7gBZ5tLpvNMskx2/WPHLedR6D5hSXKloeK6mIV06s4dR3umTLKa
 dx/kwjPqBE5diw8bGdCBg++an1mvxdqT2ylP7LEAO9kKyLASJqWNfhWhLR4dew==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 0/2] Better support for complex pixel formats
Date: Thu, 01 Feb 2024 18:31:30 +0100
Message-Id: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHLVu2UC/x2MWwqAIBAArxL7naD2oq4SfZhutRAWSlJId2/pc
 4ZhMkQMhBGGIkPARJEOz6DKAuxm/IqCHDNoqWuppRLPlYSqqs710vVN1wKXs4ko5mC83bj1176
 zPAMudP/rcXrfDwOFzAZqAAAA
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, marcheu@google.com, seanpaul@google.com, 
 nicolejadeyee@google.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, 
 miquel.raynal@bootlin.com
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gFYVkNhsWMZ0PZR7CfgH9n4zYqWey4gF7lfzOXaUXvQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBlu9WYRQhES4EmjZZ7vAyXW1pFFRuarhPV03wlazy9
 DgoNLUSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZbvVmAAKCRAgrS7GWxAs4tUFEA
 Cz/OyfGWoHhrtvANxCouKVTqA7kcf3dNHSbjLAohQb5ygAHwJJXFy4VlwPI+L3xEsKxM3fxQQzNu+J
 RnxxLGbfwxGqajmUcFZTjOG5Hrx0eZ2W3QAFjV0odo6bxK0SoGfHbLDaz+o7xWyxj/Ax5QRBIdWpJB
 eU/qf3QGSCzw1YFsAkaBZr6s+9rJg9PGS/lV6jtJtn2llm1MZQL2aEOWXzdlPW693uICE150G4sGWX
 WEDY73WHutJn2n+sMWvfnwv2Nt2bhXAfxUbiLCRtS6QjV46NuS+FBVKED9NRrHyEEb+41Emd+SzdOm
 xe7qkpTk6fNc9mt0JOCfNxhnrpy5A4CRq4iS/ySD1KwO0dYHkFcHvuwWW/AJuCE/9ke7fzcP34Ufo8
 4CtXcuHl0fSmjV2mXAhm0KAGlsrJM9PuCkJxPw6NdQ7dul6Vr5Oj/c0xb3cKC0fdpasYu9ocBQ2lLG
 wRqz6N2gjjBA3ZCw/CjRcOEUFT4ziXpmXig0/knZyMYE1vuCeID856H193SDWpOv2Ip+MXnjvCl6zH
 StkiiLhQwHmwYAG5UzU9zBga7kvosVhsh0ejk1h7Jufgubk+JvFvSibiu2SROCwIJSviq5SlTVrx7n
 sOvptZ+U9af+q+jRdTNOxGf8mrhx9DMQ2x85q9Ro0v7blG8qwM50hcfoESVg==
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

This patchset aims to solve issues I found in [1], and at the same time 
simplify the composition algorithm.

I sent more igt-gpu-tools test [2] to cover more things and detect the 
issues in [1].

This patchset is based on [1].

Patch 1/2: This patch is a no-op, but make the code more readable 
regarding the pixel_read functions.

Patch 2/2: This patch is more complex. My main target was to solve issues 
I found in [1], but as it was very complex to do it "in place", I choose 
to rework the composition function.
The main two advantages are:
- It's now possible to create conversion function for packed & grouped 
pixels. Some pixel formats need absolute x/y position and not only an 
offset in the buffer to extract the correct value. This part also solve 
the issues I found in [1].
- The rotation management is now way easier to understand, there is no 
more switch case in different places and instead of copy/pasting rotation 
formula I used drm_rect_* helpers.

[1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/
[2]: https://lore.kernel.org/igt-dev/20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com/T/#t

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (2):
      drm/vkms: Create a type to check a function pointer validity
      drm/vkms: Use a simpler composition function

 drivers/gpu/drm/vkms/vkms_composer.c |  97 ++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.h      |  32 ++++-
 drivers/gpu/drm/vkms/vkms_formats.c  | 254 ++++++++++++++++++-----------------
 drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
 drivers/gpu/drm/vkms/vkms_plane.c    |  13 +-
 5 files changed, 236 insertions(+), 162 deletions(-)
---
base-commit: 5d189d57bb335a87ec38ea26fe43a5f3ed31ced7
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

