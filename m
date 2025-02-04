Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C6A277D2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A121D10E037;
	Tue,  4 Feb 2025 17:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dum4bEeD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FE410E037
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:06:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 990C3204A5;
 Tue,  4 Feb 2025 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738688791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NbKWrUj5DH+ipE3128VhtvBM8i5MKd4ENodVzB9EN24=;
 b=dum4bEeDpEMj4m3terDwTCx+AenVPo1F+TBThIxMUFSFsE7dSELNu4ktbs7cewXUAU/Z3v
 nY3iMawBw+co19WbUMa0wbqHnMc88umRGzGOLk4VGYHBV9CSGz7pk4jnj65fZzTA63Vve5
 mEPpt1zdfLqL6aSPk49FRKobJVPVm29umiTSbgPNul1kp3ubz50XSviOXHGAxdPH+ErT+V
 N7W6Fi1s3GssZ+2UpweINnpmfch5rxlZOEzchA6LfdFk7kQv1prYLA6sxgSSZkIxYS84Is
 fEqCB8WoxPFsHzbSYcRGEHiCzks4Fx9Uc1iIEf6/uOHOyAt6BPcsmku4YnvUnw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v17 0/7] drm/vkms: Add support for YUV and DRM_FORMAT_R*
Date: Tue, 04 Feb 2025 18:06:11 +0100
Message-Id: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAANJomcC/23T23KbMBAG4FfxcF3aXR1WUq76Hplc6FgzY0MKt
 ieZTN49i8GFFO6MvB8r9Gs/qiH3TR6qp8NH1edbMzRdyw9ofhyqePTtn1w3iRcqAUKBAKzfr7c
 apTTJQXLaUMWVwQ+5Dr1v45Fr2+vpxIuvfS7N2/3dzy/8fGyGS9e/31vdcFz9/tIb1lDL6KWhI
 gxJ8Tt03eXUtD9jdx673Ks10lRtuToWm6hYUhLyt+qx302segg5KcHKewpZWGFCMFsl12ruJVm
 VQiQKOKdS2Cq1KAlqUoqV4VY+2uyMk1ulVwrnHWpWmRBiSCCLFltFi1LgJkWsUsaojbAlGdgqs
 yj96GXGE7eQXSk5atjp5RZlQUzKsQLrDRCRy0hbhbBm8xaRVY3eREMKicrO2ePqWjgJsxvvhQr
 oBYVYotvrt0SNAGZ2Y9aAEX3yxN9nd9wSNiLa2Y1p+wgpKRRO7yWAauXEfCyo7slRsjIJmyDuu
 CVwFPJx7e+J8x5DkCBs3vu+f5FrQPFwY+aesDjt+Vb+Ny8vn9MI9vnvlaf6Ms3hNKn8/7m5PB1
 Sf67PzRB/PX7UbX67MP38AvJzkSoYBAAA
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
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2765;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Uo9TYmOBakXgSrIjdDYnFgF/JoUanhVHs9m3aE5b49c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnokkOHGUwUKXa03uhXBeHaYFH9DONYajB82mp9
 MyMHfVKwbyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ6JJDgAKCRAgrS7GWxAs
 4gluD/9PIcTe5DDO8UtoSpy2EsiyXYXON0qHT4cT8tEukVeLzIJDwzkErhpHwgDsXbzzdwF8tp2
 NGku79iBcBFCaWRMqTAVx742IxZTLv+yiSg9cAmld4RxohnyXMc+D/sqNV1Rq2bvPiN4Ko+t4Qe
 sA1c+NaX7HUdvRjjfWqzMtccywxa5O1Kuh7FHb8d05yk0cPPCdzUP03yVRIyk/LJHfgwGsYLbet
 n4oeWJYCk8bsRt/HZZXUz3NBFYoX/8p7PkNjWr3R/ZFDIOGaipdKhM/bHroB5BMySGj9nKmhnip
 53W+wqhSs5e7PzYs2RYoU6POD+Ep7F+80IGxW+XqT6NKZA0chrHdN3XwqXDcdlRFRi7gg14GxaW
 keF3g2b0HqMMsz+ppDNDiDnME72v4Kx1GEAGVok+uKXlJGga7eFyFKyOH7vEaTG7Ho9Thm4BLZB
 D7KWmQ7H4jCA7S4XOU2sSJ9h3lcAcSZ5c0WVM79xZEm92nXS4LRk94VD5WdNlpvTzd84l3EqdMl
 hUv/PkpYb3ghz2hq9OFDrrbt04oOb59JXPwDieQNJSUMpKRnnEBG4u6C+dT9RhyTPVNuqu+QHHp
 53/13MZBZQv3z/rZg74A7Fo/rfA9wrglLBCz4BgmMP6IoY76kUhup8icyuZzYW66HDBeyovV1gY
 p/O/Lkh0grCPEyg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeludffieekfeekjedvjeffffeuveefieeghfeihfdugeekhfejjeevhfdvfeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdeipdhrtghpthhtoheprhhoughrihhgohhsihhquhgvihhrrghmvghlohesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepnhhitgholhgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmpdhrtghpthhto
 hepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepphgvkhhkrgdrphgrrghlrghnvghnsegtohhllhgrsghorhgrrdgtohhm
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
Changes in v17:
- Rebased on drm-msic-next
- Updated comment in kunit test
- Updated test count in kunit test
- Link to v16: https://lore.kernel.org/r/20250121-yuv-v16-0-a61f95a99432@bootlin.com

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

 Documentation/gpu/vkms.rst                    |  15 +-
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
 11 files changed, 831 insertions(+), 4 deletions(-)
---
base-commit: 8cca475b8085e551b3eebf4f2164e56c800402e0
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

