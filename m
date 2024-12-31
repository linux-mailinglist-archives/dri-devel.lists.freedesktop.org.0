Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23B9FF0E8
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 18:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D51F10E69B;
	Tue, 31 Dec 2024 17:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ej60YuzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15F910E69B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 17:32:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AC7AFF804;
 Tue, 31 Dec 2024 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735666313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ndTR9IRSE3zD4MntjsffK7yIX9onHaM64PFZIeuBi90=;
 b=Ej60YuzLh93y90r0geqtESGkn1yOnyUnEL5bU8kkLkOjaUt4LHHllESpNSp+bfU+UDtljk
 Bs+dYn6g+fMn45CUryyhhY1JmML9/EeJC0Br+Gh6EzlNqsJWTPh3oKU14oas8tEy99PCjL
 q28Ft1cIIXLQv+ETfCG6pOmfED8AFqjNIFVvCWlgjfb/z9yeZgtDQ0oR7s7y3OsGb2zxhI
 lbrMiOUfhfABZGvkBDA99sgDd5Om31jI4uCYamt0bwnknwaAojkM4H44EH2mGMK+c9+HGB
 hoxVbq5kMJFkjTI3trH/oDSg0pWGddl/p9O/geAo9Q3pE3lnmW3M+1p1vhKWjg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v15 0/7] drm/vkms: Add support for YUV and DRM_FORMAT_R*
Date: Tue, 31 Dec 2024 18:31:43 +0100
Message-Id: <20241231-yuv-v15-0-eda6bb3028e6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH8qdGcC/23T226cMBAG4FdZcV3aGR/Gdq76HlUufOwi7UILL
 EoU5d0zLESwYu+wmY/feOyPash9k4fq5fRR9XlqhqZreYD6x6mKZ9/+zXWTeKISIBQIwPr9NtU
 opUkOktOGKq4Mfsh16H0bz1zb3i4XnvzX59K83b/955XH52YYu/79HjXhPPv40QlrqGX00lARh
 qT4HbpuvDTtz9hd55R7tUZaqi1Xx2ITFUtKQn6onvMmscsQclGClfcUsrDChGCOSu7VmiVZlUI
 kCjinUjgqtSkJalGKleEoH212xsmj0juF6wo1q0wIMSSQRYujok0pcIsiVilj1EbYkgwcldmU/
 s4y845byK6UHDU8yXKbsiAW5ViB9QaIyGWko0LYs3WJyKpGb6IhhUTlyd7j7lg4Caubz4UK6AW
 FWKJ7lre1GgHM6uZeA0b0yRP/n33itmYjol3d3G0fISWFwulnHUC1c2LdFlT3zlGyMgmbID66z
 +VK9Pn/jW/ZuNyL5ebw+2szvpxSf62vzRB/fT/UbX4bmX5+AaHr0SyoAwAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xUZ6VKBw7ulHC/fvGP6DkP9YyPIDN/Ad5QvkiBeR2/I=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBndCqEK6BoJumDIwKnmX+T8ndSL+D7vAGN+C0gK
 Vx9yG2nxaCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3QqhAAKCRAgrS7GWxAs
 4sV6D/9WP8HaHU/GbnFlsN8fYFUdpNkgqdVXp76VvlaDH+KtWofNyzkrKOSQYIGY18siWZOI/W0
 DUDlwRTsfU2+yf8boYJqzlFAX4Tk8gV2xfga0PwDiXqK94B45ieaiw1doxLBF+KYLUTNO5mTF/V
 /mNkVeRHbEa7FGV1WRtFgV53lsbUG7EscOI+lZvrfvixbSQIfBzTvEUKUGpGnFdq34c6Mu+eLvd
 mBuS75U4q5QaI4u6w+nC1bT3d1zEYnQ1x/rptkYEtSXi7fKP4Sdg3l56AtiFjE6olMqNLy+OHvm
 Mz9h+5b0jtnpp9p4Wls7vpNOpCqwnUqn/dF8jUKW/CEhM8VK4xw+/2eFLd48KipANMkXveEruK8
 NIy0TnCW+rryD2Ner/2WU3hpdU+2PU86LyBweZPtL/66PgFYxrcF/lrg2EVK2qukI2bnEuhCWn8
 II3HqnbB9GrTUzl7Q6Yh4s1bmRmjm5yZElU0Xt2y6i01hEkrwbp4kZ2qDIrj/TxqIDbEqVJ6lNS
 EVHXHxs7C4yPG8YWv4sz9jcoeczF74DJEoMJ835tUdTlSphhRgWbYp1wuILS0eDdPkgP7UFCimh
 PpzTZSLRYnbiEXC9wUo3GbkjRvpzt4PWaGdAjXigiSgEgBdHyV4chzrARzg5rfPVJmzXoLZCF3Z
 JPSEtOZ1fZ401HQ==
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
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 270 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |  18 +
 drivers/gpu/drm/vkms/vkms_formats.c           | 467 +++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_formats.h           |   9 +
 drivers/gpu/drm/vkms/vkms_plane.c             |  29 +-
 11 files changed, 829 insertions(+), 4 deletions(-)
---
base-commit: f8a2397baf041a5cee408b082334bb09c7e161df
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

