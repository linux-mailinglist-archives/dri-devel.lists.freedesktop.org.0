Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A2A17C2B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF70410E558;
	Tue, 21 Jan 2025 10:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GRxrL3bh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FC010E552
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:48:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E9C4240004;
 Tue, 21 Jan 2025 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Ys+vACeQlVio6Iui4zwZCd4nyHptpoz9p1SfxBkB9E=;
 b=GRxrL3bhubmNstByBLu8myIkWyrv7Z1zC7bGW/5Jx3b6Br2mRG/2LCxF5g0a2N0jRdkAiV
 SDL8was2f6u6U3xrHiiPg3VPcqNmJ3EqFewTMc7+LcpQ3YxB1Q/vprq29jm4zlO9jF0hJk
 j7xqMpyYPWjyDQp2+whxPakhB+jfjXsAq9OOs2gloF4Z6clBdU+cNTfV/AuofHbJhGHT6G
 3ylEt4KWpgGExgsCnoV7I2zX824E3hyPC5OPdMWIMd4PZSIRreS5E7MFd3BuV1L57mzBz9
 JmDiMZEP0UTNQkn8hmI3GAmRVtZQNcKr0WjhrjnPKmnX86vwfsqst3qLjqmY8Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v16 0/7] drm/vkms: Add support for YUV and DRM_FORMAT_R*
Date: Tue, 21 Jan 2025 11:48:01 +0100
Message-Id: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGF7j2cC/23TS46cMBAG4Ku0WIekqmzK9qxyjygLP9NI3TABG
 s1oNHePebRgAjts6uM3Lvuj6GNXx754uXwUXRzrvm6bPED+din81TZ/YlmHPFEQkAQCLN8fY4l
 CqGAgmEpxkSud7WPpOtv4a65tHrdbnnztYqrf5m//+p3H17of2u59jhpxmv360RFLKIW3QnEix
 YJ+urYdbnXz3bf3KWWurpCXap2rfdKBk2YpIH6pnvJG2mWQWBRlZS27SJqUc+qoxF6tWSKrlJg
 pgTEyuKOSmxIgFyWzUjnKeh2NMuKoqp3CdYVVVpERvAsgUkVHxZuSYBbFWYWIvlKkU1BwVGpT1
 TNLTTuuIZqUoq/gJMtsSgMtymQF2ipgZhORjwphz9YlYlYlWuUVS2ROJ3uPu2NhBKxuOhfSoSV
 2Pnlzlre1GgHU6qZeA3q0wXL+P33itmYjol7d1G3rIQSJZKqzDqDcOVq3BeXcOQ5aBNIB/InbG
 o4knsd+7nheo3MCSMf//u9zuUpd/PvIt3NY7tNy4/L7ez28XEJ3L+917388H8omvg2Zfv4DXzV
 JceADAAA=
X-Change-ID: 20240201-yuv-1337d90d9576
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2563;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=iQG3Mb9N1fTfVQpi9qUaE8sCglfo0bgdGkxThiPbjEA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3tn/oNpGWTNfjm4IyLW6lplWoXIMVLA+AN1g
 iSIw2Sp1TeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497ZwAKCRAgrS7GWxAs
 4tjuD/4qUeUwgGerZPSXTDIVfa3w5hQnNg8aBoKP+Dwru6snyUBRfSMlkJPl9TvW4Z37tRGR9/V
 U7lIXP0FuvYPou7PjNZN35PvdW8i3jUpUHzRXHZtzeK9w9PV5CA+Yn/CQAj6m+vzW+SP7jI9DHs
 t3GCfMQYCB83OvwJIP94ihrgFZBFZ+V/vVAGxpffNZw4B5NieC1/h5AL6ryLJUqmvzGwGjfsZZj
 nkwF/sky7vAkUOcK84TnaEeCROCcBEmpsK5Z6GdcbeOTaK833Y2Nv33ELleM8+eRQeWwi8yVXcF
 ncCpdWv2H2jkRow/LUktyA1tBJGoGpmNu0NGr+oUw31GAavbT+hKyMXhVVPkYhJwYw0P0FhahP/
 nsZQbhZl/QMQ606ZLmHL6aENFlHJRqRnYvgVi5DWwrs9rXViNzlOFxl9BZO1xeNXfnv7tomgj/6
 Lj/iWaEc2Wp1rhcPrEqWx3WWaSMQbXchJ/fcERCkosfiG2FZFN/GUMnPsK9hmgrrRRWLULww1JM
 2Y+GBaMMcgnIh6P8ifRw8gU/1Xb3YkFt8E37UfRppb4PE9HzrQuICMSvo2syu41nha9N6yhoJgd
 D7uhSIyMiIpOr3RkGMZkiNCe+xxPzQApIFUGo1dI9P3SIfr5zJs2v24NQBzFOju2PlVpOyztLlK
 CmbH3JUHwZ1ZIeQ==
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

This patchset is extracted from [1]. The goal is to introduce the YUV
support, thanks to Arthur's work.

- PATCH 1: Add the support of YUV formats
- PATCH 2: Add some drm properties to expose more YUV features
- PATCH 3: Cleanup the todo
- PATCH 4..6: Add some kunit tests
- PATCH 7: Add the support of DRM_FORMAT_R1/2/4/8

[1]: https://lore.kernel.org/r/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v16:
- Rebased on drm-misc-next
- Updated comment and changed fail thresholds. 
- Link to v15: https://lore.kernel.org/r/20241231-yuv-v15-0-eda6bb3028e6@bootlin.com

Changes in v15:
- Export drm_get_color_encoding_name only for kunit tests
- Link to v14: https://lore.kernel.org/r/20241122-yuv-v14-0-e66d83d28d0c@bootlin.com

Changes in v14:
- Rebased on drm-misc-next
- Link to v13: https://lore.kernel.org/r/20241118-yuv-v13-0-ac0dd4129552@bootlin.com

Changes since previous series:
 - Fix build test as modules issue: https://lore.kernel.org/all/202410110407.EHvadSaF-lkp@intel.com/
 - Export required symbols in DRM core to use them in kunit
 - Update the kunit comments according to Maxime's feedback
 - Link to original series: https://lore.kernel.org/r/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com

---
Arthur Grillo (5):
      drm/vkms: Add YUV support
      drm/vkms: Add range and encoding properties to the plane
      drm/vkms: Drop YUV formats TODO
      drm/vkms: Create KUnit tests for YUV conversions
      drm/vkms: Add how to run the Kunit tests

Louis Chauvet (2):
      drm: Export symbols to use in tests
      drm/vkms: Add support for DRM_FORMAT_R*

 Documentation/gpu/vkms.rst                    |  14 +-
 drivers/gpu/drm/drm_color_mgmt.c              |   3 +
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 271 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |  18 +
 drivers/gpu/drm/vkms/vkms_formats.c           | 467 +++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_formats.h           |   9 +
 drivers/gpu/drm/vkms/vkms_plane.c             |  29 +-
 11 files changed, 830 insertions(+), 4 deletions(-)
---
base-commit: 49a167c393b0ceb592b9d2e65cc4f46bcc707108
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

