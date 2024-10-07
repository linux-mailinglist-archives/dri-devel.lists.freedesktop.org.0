Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87C9933B3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 18:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE7410E174;
	Mon,  7 Oct 2024 16:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LX6GGkh4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4E610E174
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 16:46:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75BF340004;
 Mon,  7 Oct 2024 16:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728319582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=68iNExvNeA0rf2jARUcLXniQceO7yvKffrTY9YRTkNM=;
 b=LX6GGkh4hbgv7HyiuIkaOK30G50unQLlbxQtDQE3wzf4nobQ7sG1Lgn5y6ZlWjA+FJ1Ih8
 FbCTj0Ug7G3hs8b9KL/FAL+LoYROOOT2lTmLG8thUDYRLhwqBRLXLnf8DkD55sC7rABq5I
 znWgnRam5ZJwrI1ub0djF3zxtV7PUsbowrMqtXohx3xirsmbwTm/B7ndFhaKnTrz8tiVJ7
 PzWFWDoesgJGZ9U3LPFrNefdVP+OUtlqgS5B1qIDBh8YKrWw5tb7l05YgilIWM+fTkFGZS
 86wMUmIKy0zU35mb9d5wyXn4P6j6Y9BGG1Kf/bV6DX/RIGPb6SMUnbuwyGxSpA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RESEND v2 0/8] drm/vkms: Add support for multiple plane formats
Date: Mon, 07 Oct 2024 18:46:05 +0200
Message-Id: <20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE4QBGcC/3WQwU7EIBCGX6XhLMrQ2pbGmD24Vw96NB6ADi7JU
 lZg6242++5S1KiJ3maG8H3/zIlEDBYjGaoTCTjbaP2UG35REb2R0wtSO+aecMYbVgOnqqETvlH
 ttz5Q44OTKVJQKMa27xUHSfLXXUBjDwX7RB7Wj+v7O/Kc5xsbkw/HYpuhvBbwNbR/g2egjHaNN
 sIg62roVsr7tLXTpfauIGf+jemh+QfDM6ZXdSOENigY/sacPyIHfN3nA6TP3EpGzBznbBqqMTj
 qbNRXX0W2HNKyq8MYZbnTUN0sMYCxjh73cw6/aBlokKNsDer+p/Y2e8/v3XF05YABAAA=
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=G6NoUnV37AMwHpKWS9b6mDPoI0P/vDZmmDA5MGx/CGQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnBBBVhGQMNVHiFK/ZyaxeFywMZs/DgAgmzojK8
 33SZX1A1feJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwQQVQAKCRAgrS7GWxAs
 4p9AD/0WTIJsdlEB9iLSnZ6K7dk7/e6BJeNSxoc4w0Ycx1Tx2yBb408LgGsD5uPUen97y+vNelf
 bUe3sdGfTuPYQS1PFpjKT+0kFeTpalPvW14IX8vWCvg53Ui8mCRgJCFb8r3qV4YkwtGwmLMrnXL
 bubyR9eQlMc2v8s1lFcfSZbu2DZkZP9DNp7k/8cc7LlZnDb3JyKU8/CPxDpibJoBlrG2KOItCIk
 YOQRgR6jCFJA+Gci50tZdFkNAURAmAgR/PeUbahlauJ05vZ/HDeeV/YGoBs7nNJL2Tm49XoYPPh
 QfzAnFQXI20jPugaizOAV4AFt1JvkYief853yxrv7S7zDWD3A8+loHuXFV8QIpbdj/2ZbFWWRjz
 UDYEoGebM0fcmynwIdH8sZc2IvLu+X+2iTZw95Ab2sm9bu6Yj2Obk1Ed/mg6eAmNAKRyacB3Jkt
 VzhGMWe75dnEGK4Wf5cRsHMc7fmz394rfC5NV5PHX2q31ZqOCAFA4k7KXG6ykVGst1Z72p2DY3M
 thpLom763uNxIEwXXZkOne81VzPBK59mydDYPlN6D42dz+TYr73xqX08BM0OeH4AeYZrO+kl/F1
 37WIwqdZs3AJBAGB9BN9tIGO2+DDmXVG3eaCY5QfpSK1Fn+Q9w6YQ7kDFNpZ6YfDYA7dyxNfxgj
 xHcUKKFgL30TgHA==
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

[1]: https://lore.kernel.org/all/20240809-yuv-v10-0-1a7c764166f7@bootlin.com/ 

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
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
 drivers/gpu/drm/vkms/vkms_formats.c           | 320 ++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_formats.h           |   4 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  14 ++
 4 files changed, 195 insertions(+), 146 deletions(-)
---
base-commit: 82fe69e63d2b5a5e86ea94c7361c833d3848ab69
change-id: 20240312-b4-new-color-formats-1be9d688b21a
prerequisite-message-id: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
prerequisite-patch-id: ae2d8b2efbbaa9decce56632c498c87e708288b3
prerequisite-patch-id: d1e73379a15c5062924cf2dc8619676e13f35a13
prerequisite-patch-id: 2eed29b53617ba76169e1af303e4899d517a3a18
prerequisite-patch-id: 3f84c6e64b3a25510e929914e97ae2549451707c
prerequisite-patch-id: 82523a917646793deeec7cdcc7ff286bd924fd21
prerequisite-patch-id: dda6bf4692cd1795c489ff58e72c0841ea8ffbc4
prerequisite-patch-id: a0639eb773bf58c2ffe76f2567a8c74b6275092c
prerequisite-patch-id: 7a63d245a377d5f5283f48e8f52421b912811752
prerequisite-patch-id: deda292af6d8bbf6762b0bf4d351ffd2225995d8
prerequisite-patch-id: 6c2aa2645c7d854951608aa4d15a02e076abe1fe
prerequisite-patch-id: 11ae7be077ce7022f61101d41a9ba79b98efb273
prerequisite-patch-id: 18554f49b53cbcfd4a8ca50dc83b17dd3cf96474
prerequisite-patch-id: dc61c6d3db73053fc36e115af561e0c42b467de2
prerequisite-patch-id: 43f37e9c1bc041d491e41dfb59548ed258a1e071
prerequisite-patch-id: 5633292e10132d29be2467812e6e2e824cfedb67

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

