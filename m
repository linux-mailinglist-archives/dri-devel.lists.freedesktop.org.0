Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275729D61F8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C29410EBF6;
	Fri, 22 Nov 2024 16:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bPPi6IQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C568A10EBF1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:19:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A74760006;
 Fri, 22 Nov 2024 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V98IkEz/nH//XNCUpYqIt70W0BYwarfmBs2KulJgoE0=;
 b=bPPi6IQ0eazwLC4e93g1tnoEU6uKBKlXdQgfvXLWeCai+ya3o8siIzGqg1seVKH94z5dF6
 GAepolRimJAZFXy6bBtsGE31BtHR2OWxKM57dX6iQnEBnnNFpwgjQYg3MtwTDCULQE5tax
 uJrcjeoBq4wzMpgT80LG1vyUv5PliVat2MAQ3+wQPnNXKDJ+onbL6ggfRZhQbJcX2VGznt
 +dKHpkLAj04jXBmXMG/SlZ6XT9unet/wp4s3P+Qorv35sMwXfXLCFm3miDropb1NgImrO4
 dJHZ78ZJLs4bh5ms68JWdN+OLK9N2lN5Z/VndomBsgD69TQh7uSJHcMbwg+2EQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v3 0/8] drm/vkms: Add support for multiple plane formats
Date: Fri, 22 Nov 2024 17:19:00 +0100
Message-Id: <20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPSuQGcC/32Qy07DMBBFfyXyuga/GjtZ8R+IhR8TaqmOwXZNq
 6r/jpMIoSJg52tpzpk7V5Qhecho7K4oQfXZx7kFvuuQPej5FbB3LSNGmCCcMmwEnuED23iMCU8
 xBV0ypgYG1ytlGNWojb4lmPx5xT6/tHzwucR0WS2VLr8bcE/734GVYoKlsNMwAZGcyicTYzn6+
 cHGgBZkZd8YRcUfGNYwynAxDHaCgcAdZrfVooTIf8adkE7viRO9FPdb3LamCd5P7W5lq4uMztA
 4Ifgydi4FHHy2j1+PZjmXxRwgZ72ed+zWLShj+HKqrbpoVuh7p7hjyhH7w3r7BGMMZLu1AQAA
X-Change-ID: 20240312-b4-new-color-formats-1be9d688b21a
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
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2477;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Vinf1Fh0fh7O0THp2yAelNV0JKYkhvdTF94u9cvD6vo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQK71RFJuyoyKdo5c9hCq7m+ppz5RvPTgvcSGO
 nJRa6JxKsqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cu9QAKCRAgrS7GWxAs
 4sFeD/9kpg/Xj/BnlhFzJjHttCbS2XzCLQId242Ke9y+AxnEsGgFSCVTi4MZUGCny32MhA6gASP
 tCFkgBDt7Lbw796J7Km2D6WWrf0MeT0M3pTlytq5cTDwQVGUt/OBVfnTEnlj78y7Dh21GOrLRTP
 mzaB2SXu9AF/eYUSPTJ7BfzGXaY0GUv12jxvJu/Hycz2AvKMsUTf9p7f9Apq29n3yodo9ezmovF
 sTo9/V3uIM8tv0INCvyXeEEGT3wR45E06UzqFqyk7lmQ4jm0sF/z8jnNqu/epW3jV73ZOHMIhvB
 baOtEVWFwd1yQh86lcI/7A6tgTzzkcH3sX/nt+M8FtXlCsiLDeC+LVcL3NoeWPHvLkaE5l92jCh
 aWhkMxd3gxPWVFk0pX326ekGvZ+kxsyrAuw1p+7gry9pqRiHVigeq4EHhF7f0XlnuCRcMCf42J0
 a6QKdLiJY1Hu2oGSR10PwX/NTd0i1tSlb5YCw+1X8eOFyXoud1C3QlpbWecT2x5D99BH/fnGWxj
 gDhXUjkDwfbwSH7CYngK8UbQEiwpm/d2FioPswMaKushb6HYDVcBO7PbnVYQbElZQEnjwb4x9jd
 EhSn4yzEO28B8nka3n99N/HPcbo+YKk8Z38qU8v0MRB3oiChntZ12aa5l7xF9kNVn4HbJl6J1Ct
 iRZCaTuiDQu4c4A==
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

This series introduce a macro to generate a function to read simple
formats. It avoid duplication of the same logic for similar formats.

PATCH 1 is the introduction of the macro and adaptation of the existing
code to avoid duplication
PATCH 2-6 introduce new formats with the help of this macro.

This series must be applied on top of [1].

[1]: https://lore.kernel.org/all/20241122-yuv-v14-0-e66d83d28d0c@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v3:
- Rebased on new YUV iterations
- Link to v2: https://lore.kernel.org/r/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com

Changes in v2:
- Add proper casting/type to __le16 when needed to avoid warnings with 
  sparse
- Change the function argb_u16_from_yuv8888 to argb_u16_from_yuv161616 to 
  support 16 bits values.
- Add support for P010/P012/P016 format
- Link to v1: https://lore.kernel.org/r/20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com

---
Louis Chauvet (8):
      drm/vkms: Create helpers macro to avoid code duplication in format  callbacks
      drm/vkms: Add support for ARGB8888 formats
      drm/vkms: Add support for ARGB16161616 formats
      drm/vkms: Add support for RGB565 formats
      drm/vkms: Add support for RGB888 formats
      drm/vkms: Change YUV helpers to support u16 inputs for conversion
      drm/vkms: Create helper macro for YUV formats
      drm/vkms: Add P01* formats

 drivers/gpu/drm/vkms/tests/vkms_format_test.c |   3 +-
 drivers/gpu/drm/vkms/vkms_formats.c           | 318 ++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_formats.h           |   4 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  14 ++
 4 files changed, 194 insertions(+), 145 deletions(-)
---
base-commit: 98efdd02e220fea84c1491012d7292749a71faeb
change-id: 20240312-b4-new-color-formats-1be9d688b21a
prerequisite-message-id: 20241122-yuv-v14-0-e66d83d28d0c@bootlin.com
prerequisite-patch-id: d08b040cfd7aeba4a237029500f5aa8266450cbd
prerequisite-patch-id: deda292af6d8bbf6762b0bf4d351ffd2225995d8
prerequisite-patch-id: 6c2aa2645c7d854951608aa4d15a02e076abe1fe
prerequisite-patch-id: 62f509c48590dc333dc84e2185dc8b9edd61761b
prerequisite-patch-id: 7d988613c79a1ab056110418c04865bf019402cc
prerequisite-patch-id: 43f37e9c1bc041d491e41dfb59548ed258a1e071
prerequisite-patch-id: 1b2a3898d5f8c21b0d306c07b424414bcb14554b

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

