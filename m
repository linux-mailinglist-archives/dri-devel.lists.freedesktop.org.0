Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA48951E4B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 17:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA6B10E4C2;
	Wed, 14 Aug 2024 15:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ENlEKYS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7C610E497
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:16:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FC8D60004;
 Wed, 14 Aug 2024 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723648560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r1Qvrko9juw0lhGwRM2iYDhdqP2zfN581x87n+jL5CQ=;
 b=ENlEKYS/lGt3wpV64FW1shUkBKcVAvdXCsDiZlfcdboEUFoj8XNUoyDq21JL6DRgGB23ir
 MwiFJGG0RVVuoAADsAiFiH6TTPeOpwqUayD/49laZaqTdkKqnqci2TVJNlnBCB4TzE+tHN
 ZEDcDNV8WWuyNQcoXfvuKPX5tpnxXyQxCUvPpADikGSKzptrNXeL7k5QMwAxsR9y+/SGl/
 QNXhamC6prmLwpKMzesePzksw6y8QjLG1nWuYPNH01cC8U+OejQ6vuJjsQMvt4RtnyjJB+
 mJAapfyNfU/pKxc2RXXzjhiJqx1tGzQa2XELkVN5isFzJJRh67J0V+7Ay0eb6w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RFC 0/7] drm/vkms: ConfigFS interface
Date: Wed, 14 Aug 2024 17:15:47 +0200
Message-Id: <20240814-google-config-fs-v1-0-8363181907a6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACTKvGYC/5XRzU4DIRAA4Fdp9uwobHdhaYwxMfEBvJqm4WdYi
 ctSgW7bNH136Y8HDyb2BAPDxwwcqoTRYaoWs0MVcXLJhbEE9G5W6Q859gjOlLiqSd2QtqbQh9A
 PCDqM1vVgEygxbxVjqjNcVeXYOqJ1uzP5Xr29vlTLy2LEr03h83VHyXRSvHd5MTPRg3dJP/xMY
 MRdPmkeU5LnKhazx3MRHRGw30wwUQIEqOSas4YyZvmzCiEPbrwv7NMfh2kDqin6ttw9hAg2RC9
 zgqkuWKfmjRDaoiD4T2wbS0dK6s9VycWV2p/HCzdnbUM1p7xl4p/cz+sOMjrrtMzlO0px9KQhc
 ma4IbrubtPSenAZPlAajFespZzWlnSdbc1t2PTpE3g5lgRzsbhUnepETSmZ32ZF9GEq3caswY0
 Gd2Bj8LCWUXrMGC8+Q8qFVFZY0/z2l8fjN1Kbuh7BAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6655;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mZ0N4ofCQdzNrfFqiieS980B7tWtPrmaj9HBebS5+jU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMonmJPahd2dkMBNOqX9z+slF+lNIAZqnZwWd
 FrBW7YP/reJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzKJwAKCRAgrS7GWxAs
 4vbTD/9fTDKY2WqMI5+ePlJVjZNvRv4r3rtx3I3F9NT7WkaKcEZnDHCvUZBsWz2WRV8ccGBW4JF
 gEBhUvP9ZhcACvBjyGqcUXwFkUajbZSqWIY39G4r+2mTzW14rMLYlAUqVOIv9YSFKUART9vwYhQ
 GqGNGt23tQ19mB/EXhW4Wd6lp7K+ZXOQKrCUDENSV5C26/yB05xiZwwjhpUPcWFyPYQfKeFrN01
 0JeBH+7VzHzbY7dasfGvn6nOnlcRkqdIzqhXAv41uvN0u2hv1q77zc+HPvzisloK3IkRutZsXYs
 O2ZIcBbNgCzxazJmHwYETgTx81njnIVj2FhmBH0okZMIo9KEBs6FUi56Dv/DE+dZ7Jm8Mtce0fL
 QOaiipCkaZnc/l20K/GpuGJJgTmF7lX/NUo4ukaxcopDwsOnXkHTyB1/hXOT3SrQkgR0M4z340e
 xZu4GUgrWelU/N76jgrTVV/zxa0jwv3FdinJDn3hfjeFJX4+s3U/s0swHGPN2M3/6sjmcox52aq
 EcKjc7WEbhDpS5Zx3wWdokOjGzYkwBiEz6st70/RuP0zP3RKwW7428sYoqNdvOdsMaINMzvRkfd
 TV+ju6uIlIdk+zghGiT5fgbcZZDzwFb7UKe2cggEEyYS+cvFkUPNzx+K9LFVLHytFqYRIuFwIqh
 +Drj/oxJlKazl5Q==
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

VKMS is manly used to test userspace program and its behavior. The current 
implementation is not very configurable as you can only have one device, 
with few specific planes.

This series aims to introduce a new interface, using ConfigFS, to create 
and configure more devices. This will introduce:
- Device creation
- Plane creation
- Plane configuration (type, color encoding, color range, rotations)
- Encoder creation
- CRTC creation
- Linking between CRTC and planes/encoders

The proposition is:
/config/vkms
	DEVICE_1
	┣━ enable
	┣━ writeback
	┣━ planes
	┃  ┣━ PLANE_1
	┃  ┃  ┣━ type
	┃  ┃  ┣━ supported_rotations
	┃  ┃  ┣━ color_range
	┃  ┃  ┣━ color_encoding
	┃  ┃  ┣━ default_color_encoding
	┃  ┃  ┣━ default_rotations
	┃  ┃  ┣━ default_color_range
	┃  ┃  ┗━ possible_crtcs
	┃  ┃     ┗━ >> /config/vkms/DEVICE_1/crtc/CRTC_1 
	┃  ┣━ PLANE_2
	┃  ┃  ┗━ ditto
	┃  ┗━ PLANE_3
	┃     ┗━ ditto
	┃
	┣━ encoders
	┃  ┣━ ENCODER_1
	┃  ┃  ┗━ possible_crtcs
	┃  ┃     ┗━ >> /config/vkms/DEVICE_1/crtc/CRTC_1
	┃  ┗━ ENCODER_2
	┃     ┗━ ditto
	┃
	┗━ crtc
	   ┗━ CRTC_1
	
This interface aims to be extendable (new property can easly be added in 
objects) and easy to use (objects are created simply by creating folders, 
and configured by writing files).

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (7):
      drm/vkms: Add vkms_delete/create_device helper
      drm/vkms: Introduce ConfigFS interface
      drm/vkms: Introduce basic plane creation
      drm/vkms: Introduce plane rotation in ConfigFS
      drm/vkms: Add color encoding to ConfigFS
      drm/vkms: Add color range in ConfigFS
      drm/vkms: Add crtc and encoder configuration in ConfigFS

 drivers/gpu/drm/vkms/Kconfig         |   1 +
 drivers/gpu/drm/vkms/Makefile        |   1 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 953 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h | 105 ++++
 drivers/gpu/drm/vkms/vkms_drv.c      |  19 +-
 drivers/gpu/drm/vkms/vkms_drv.h      |   3 +
 6 files changed, 1078 insertions(+), 4 deletions(-)
---
base-commit: 219b45d023ed0902b05c5902a4f31c2c38bcf68c
change-id: 20240521-google-config-fs-b935b66b8d7b
prerequisite-message-id: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
prerequisite-patch-id: ae2d8b2efbbaa9decce56632c498c87e708288b3
prerequisite-patch-id: c26b6d4867eaf6566195aa0002765357d4f69f8c
prerequisite-patch-id: 8791d34a6f3148dc518da5249453067e40d346e3
prerequisite-patch-id: 26ec7cd5a449004bcfd6ce483671f87655f8635c
prerequisite-patch-id: 2e855ba871f2e99d4b6b7d85da2ddac6bb32262e
prerequisite-patch-id: 82523a917646793deeec7cdcc7ff286bd924fd21
prerequisite-patch-id: 0e355e5316281f53ab5e97ab6e63b0a682f3eb9e
prerequisite-patch-id: 7a63d245a377d5f5283f48e8f52421b912811752
prerequisite-patch-id: dda6bf4692cd1795c489ff58e72c0841ea8ffbc4
prerequisite-patch-id: f70e535b6086cc587975fbfa75741f485f679a32
prerequisite-patch-id: 6c2aa2645c7d854951608aa4d15a02e076abe1fe
prerequisite-patch-id: dc61c6d3db73053fc36e115af561e0c42b467de2
prerequisite-patch-id: deda292af6d8bbf6762b0bf4d351ffd2225995d8
prerequisite-patch-id: 18554f49b53cbcfd4a8ca50dc83b17dd3cf96474
prerequisite-patch-id: 5633292e10132d29be2467812e6e2e824cfedb67
prerequisite-patch-id: 43f37e9c1bc041d491e41dfb59548ed258a1e071
prerequisite-message-id: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
prerequisite-patch-id: d10db4cb12a88de2e5f6440e9fcf5ddda191e3cd
prerequisite-patch-id: 16bac0ef1f1dc010a72ce2faae66631797d23d3f
prerequisite-patch-id: 8e0e5cc0727e8fd2d14ebafc5538fd987c2dd38e
prerequisite-patch-id: 32bad3bf3df46d042e9edd4c1259c2e2a3fb8975
prerequisite-patch-id: 4bd9e4cef308abd17b7b274a5575a3de73a1503b
prerequisite-patch-id: a98fac5a2c60fe23fbc6a455e9a4ab8b0f187ee8
prerequisite-patch-id: 62c8d109a22b9978f755255b67f13fe74fb7008d
prerequisite-patch-id: baa8da4871dd90b03a07c6d9ddb45e10929ee70a
prerequisite-message-id: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
prerequisite-patch-id: df699289213021fa202fcdf1b4bdff513d09caa2
prerequisite-patch-id: 59d021ccb166fbe2962de9cda72aceb3caa9cabe
prerequisite-patch-id: 895ace6d58b3776798791705b7b05e26b8d37c7b
prerequisite-message-id: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
prerequisite-patch-id: a4408d1de7730262456bdd618d3cb86f5f5b01ba
prerequisite-patch-id: f215b5aee5644d2e5b1b2af0bb0f4f1e7609558b
prerequisite-patch-id: d4f3b4c714324c5f326af3daba394899e6663d75
prerequisite-message-id: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
prerequisite-patch-id: 55e5c2ded8332cd6600d9c0c2b7be657c793e2a0
prerequisite-patch-id: 88323ab9ea04fb21a0a4c65642bcd499f2354042
prerequisite-patch-id: 437b67cf9bdc036fa7c5e11b5c9ab387b10cc151
prerequisite-patch-id: d34801b7f3035ab15facd42281c1c96e61d35a4c
prerequisite-patch-id: 37862a6437ff407a42e5aaff0b8e742fc9901e03
prerequisite-patch-id: 43a5079497a1579aef713ea9c4ec47ef53a177a2
prerequisite-message-id: <20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com>
prerequisite-patch-id: f07b5109188f67a6b11f83e6c591d04d8d9f7eb4
prerequisite-patch-id: 29f74417aff64dc7bb65ecc2902540073cd73352
prerequisite-patch-id: 23bdc1fb18aba22e0f40f62a7aaae1619f0eb89c
prerequisite-patch-id: 0acd7f43a33491b7987e9665b5b800c4f8aa266a
prerequisite-message-id: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
prerequisite-patch-id: fd938b3fbc43ffddcc868695ce51365ed409422f
prerequisite-patch-id: 9a7fc92090a98cd28fcfedc70c5a9bb0dc84aff0
prerequisite-patch-id: a1eede0b482e196cba448de0ce20e7fd8a1ad340
prerequisite-patch-id: f0d5640738b5947ab84272c458a2f729a611ab0f
prerequisite-patch-id: 06cccc5f67dbf4ee107fb589db683520a461a3dc
prerequisite-patch-id: 9e8a432700a4ff98afe15c13b4f9c16c3e37ff8f
prerequisite-patch-id: 32b3f0835d1af86ea0abf6036187217a490a70a8
prerequisite-patch-id: 93571d6f80d345fa5d705d8a677bca183852554f
prerequisite-patch-id: 26b9a61db21be516a2c84072a71f2c11d21a828d
prerequisite-patch-id: 2fb61fa3f3dca5be99a3f911a60fc0746fbc32b1
prerequisite-patch-id: 8f7cafe2af8d20568c82c378e75a3f1fc891f83c
prerequisite-patch-id: aad52692d9f74d57c0c39a7c326397721ad7a1ab
prerequisite-patch-id: 5e7e07bbddfe053a2d0f88f529be7986cb94c057
prerequisite-patch-id: e943af2b2aae5adcba568d63e74e8b361a0a9336
prerequisite-patch-id: aad15fe60f490bb6d7af23a4aa705dd5ec8e3167

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

