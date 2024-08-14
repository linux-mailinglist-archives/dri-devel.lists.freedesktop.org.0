Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A0D951D3A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7201B10E4A8;
	Wed, 14 Aug 2024 14:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Jg4WxRQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2A510E4A8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B4451C0002;
 Wed, 14 Aug 2024 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r10XbKn0C2LL96F8YKgkP1WRC33QYRh/k5Wbvd3nF2I=;
 b=Jg4WxRQPrHfOpeQClF5fLROmmZOvx+Yd/p7wkQfCegtYVpASiJZQ6MgqmFgGNAqRDBlLAc
 B+87rAlo5lNNVG8LIF9qR4LxigrlnL+AzCD5CgpuhUfPQVREJ/GDgToH+yVLN6xXzu2Vh7
 cnuY3NkyY6Si5kYi+Pt1zyNldAGJCvZbyHpabGvIpH+Nu1GIZJckjpZalPzET8J/8jeNr/
 kwfTl60AOWZsIJVkg+pRjjoD0sVFB8g5HoodtlmiCkwWtYAsytvnodWrWQ2fp6Ba+SiL4w
 6fAtYle9wY7dhVnIK9cFDPFPRPfUZMpgkrXvqdBWVWq5pxBGsCSRQhx6Fb3yrg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RFC 00/15] drm/vkms: Introduce detailed configuration
Date: Wed, 14 Aug 2024 16:36:22 +0200
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAObAvGYC/5XRS27CMBAA0KtEWXda2yRxgqqqUqUeoNsKIX/GY
 BHH1DYBhLh7TaCLLirRlX/jN+PxqYwYLMZyXpzKgKON1g95QR+KUq3FsEKwOq9LRlhFakZh5f2
 qRwjo/IigQlJgB40HMME72IogHCYMYDphJKOKi7Yus7YNaOxhyvRZfry/lYvrZsCvXc6abidSx
 Kx652yaFzo4cDaqp58JDHhIF81hjGIqbl48T7W1pIPjboSREiBABVe8qWjTGP4qvU+9HR4z+/L
 HZVqBrLK+z7l7n6v3wYkUYWQZa+Ws6jplsCN4J7YP+UVSqM0yx+JSHqfxys2ausp9obxuuju5W
 9NVL4I1VomUfykXRy8aIm8010Sx9n9a3PY2wRqFxnDDasopM6RtTa3/h40bF8GJIQfoq8WFbGX
 bMUrJ7Le1OJ+/AYFgna94AgAA
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5883;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=yDTccv+0dZ7Aabi+dmm1rf/JO0AhUOad8SHsKBlROaE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDplfCMJqfAyTZrfrb75NZMhFSSYRDmUoc5C
 JdNFOlVzn6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6QAKCRAgrS7GWxAs
 4qDFD/94Z/IWnDGvo1GWJiFiMdyOiGb5s+/7nNWQasiBBTbg9Lz12Vtjnm9oSFlogXuGbHTC8iw
 3xbkwJwXo5aFQlne6OJ29928J5JJOJl01kMixhbphjNKZUVwkhzsBW4s8dz2pv7HuAZ/Bw7f4oh
 5JYlHDu0RfLXEfseRxhQ9IS5iO4wmdAzGEiOEnV+n1GcF9X0URWGykebo1MbFeqB2ih4JJqo+zn
 OcugLg9FNELQm12n7Ocza80hpm/ic7t99EJJtfu7VHc+CfbQFxmwZg15Jwu6h+iiHtYVXwFUdYb
 24ydW8apH2w5c+kEBpgDN72zkylH24YPoKN5WHGYQy3H3JMagEZIR9i7FDgVb8uidccE1gXGgyv
 vAN4QupbC58KDb/HDxXt94uCKc4fuRKm3ksos0ZkbcucNiSYSmARYHg1z1Rupu1tbUs0ZjRFmlo
 tlCi/u93Q5Xd2uThe5Z16YETD4g6j9SK1wQBvdmawDkgEyaeLR5rvS6tFzy6wQvNgnfOo7LTJoQ
 ez/IazcWvuVlQ/dqVnM78QwukNxc4PT2DZaVL254Jxd3Kny8v0bM0+XHfFu6UFbLUCUZmqTgR7v
 78gr1C1i7eBfc1mV4t6QpsPMWhTfd51+xyb36u4vZyDl1X/OlbUQT1EYvwiCA+GT+rAoMUhQKxA
 eLM4uzWLcO96ilQ==
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

The current code is not flexible to configure the VKMS device. In
preparation for ConfigFS interface introduce few structure that can be
used to configure the device creation: `vkms_config`.

This part is splitted from the ConfigFS implementation itself to avoid
mixing two complex interfaces.

The vkms_config structure will allows the configuration of:
- planes
    - name
    - possible_crtcs
    - supported_color_encodings
    - supported_rotations
    - supported_color_ranges
    - default_rotation
    - default_color_range
    - default_color_encoding
    - type
- crtcs
    - name
    - possible_planes [automatically filled by helpers]
    - possible_encoders [automatically filled by helpers]
- encoders
    - name
    - possible_crtcs

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (15):
      drm/vkms: Remove useles devres group
      drm/vkms: remove possible crtc from parameters
      drm/vkms: Extract vkms_config header
      drm/vkms: Add a validation function for vkms configuration
      drm/vkms: Move default_config creation to its own function
      drm/vkms: Introduce plane configuration
      drm/vkms: Introduce plane name configuration
      drm/vkms: Introduce plane rotation configuration
      drm/vkms: Introduce configuration for plane color encoding
      drm/vkms: Introduce configuration for plane color range
      drm: writeback: Add drm_writeback_connector cleanup
      drm/vkms: Add configuration for CRTCs and encoders
      drm/vkms: Add name configuration for encoders
      drm/vkms: Add name configuration for CRTCs
      drm/vkms: Add test for config structure

 drivers/gpu/drm/drm_writeback.c               |  10 +
 drivers/gpu/drm/vkms/Makefile                 |   3 +-
 drivers/gpu/drm/vkms/tests/Makefile           |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 135 ++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 426 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 203 ++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c              |  22 +-
 drivers/gpu/drm/vkms/vkms_crtc.h              |   3 +-
 drivers/gpu/drm/vkms/vkms_drv.c               | 168 ++++------
 drivers/gpu/drm/vkms/vkms_drv.h               |  15 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  23 +-
 drivers/gpu/drm/vkms/vkms_plane.h             |   5 +-
 include/drm/drm_writeback.h                   |  11 +
 13 files changed, 888 insertions(+), 137 deletions(-)
---
base-commit: 219b45d023ed0902b05c5902a4f31c2c38bcf68c
change-id: 20240521-google-remove-crtc-index-from-parameter-f9afb21c7a85
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

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

