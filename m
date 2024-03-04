Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157487056A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9570C10F986;
	Mon,  4 Mar 2024 15:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EtIEczIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B6110F986
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D3021C0005;
 Mon,  4 Mar 2024 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p4VyPuPWctRMKsSKKnHnhgfKmx3KohaktZO2hx+9UzE=;
 b=EtIEczIvozkpeBA10mLGWbF3Mk0mc6A95rd4ktHrEYfHCtyJ5F71a4Mb/71vIQa6kYYZuQ
 w9LgsvhriTyj8KGZ1NDCTZjDylVQ5e7etcqxvSVo/Yyq/tADXkI8f/T/G47012vyBTUwnb
 B9SLAQdtPEvfHaZugC/WpIJndSulgj0vPpsyJLAFDH3Uu3mIK7n93tKaNP245gdDKVblXh
 C/F4H02hQAvhR7L2cvcz7NcnLQfKfHQV7KrbTTtrANkejLmuxmWpfDabqHeoU9o77CfATc
 E+juXtwsyKsfsWDXRzHcyxE6IIQBqZzHfcIpRNJwmcRRBLACKxcuZ6MpvCf7GA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v4 00/14] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Date: Mon, 04 Mar 2024 16:28:05 +0100
Message-Id: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIbo5WUC/2XNQQ6DIBAF0KsY1qXBwULtqvdougCESmKhASU1x
 rsXdaPp8v/M+zOhqIPVEd2KCQWdbLTe5VCdCqRa4V4a2yZnBAQqAqTE45BwSSlvatLUF85QvpQ
 iaiyDcKrNt27oulx+gjb2u04/njm3NvY+jOunVC7tcTSVmGCqBOXMAGcU7tL7vrPurPwbLQsJd
 gropiArIZjUcAUuJf9XdK/YpmhWxjAGhtR11cijmuf5Bw20BCUZAQAA
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8415;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vconTWJf3hkrQzDYTc60aASNd6jpDkr3/nMsFeCdX/M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejKSkW5zpF9YuBBe/BTUGRlKz3pzdJMCieHG1pT
 hiv0gkKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXoygAKCRAgrS7GWxAs4hj3D/
 9eACMyg9HBiq7pJAfprAQKwbSZdVmwH3KxJN8FeOnLOugfSMaxU4axep1gBRvt2F6JfJU3GxaiNfO+
 phLqUZ355uZgflAH1X5C17AiR3owGznf9VeRZJ3bZXkZrLVxD4rm54wNGL160Uf62GasmMMImkR4KA
 FGthmc6mswWtuq3OGN+7kPAErGWXbBnwhDqiGoW/xEB11ivCxJpcO+PaDZ1HB7no0Wsdtd37S2UUDP
 Dik0LL+iyGSEhMBvFDHNYWXllh6+g6NlMBmGZHh5OHTe/+dKPIK9O8ZpMqkfcrgISPdzPuyX1Z5Rkz
 UkeCf0NDRqmFF242EV/cWATJpJ1ubSRfEvu+wgVbAzITpkVC55+Mm6hIIjZPrwCqs50wt3hfesv6N6
 KxtiScAm1hWy/eZmQaNG3tXHlcj2G8k5Wfbomutyt0LVN+P7aaJKKFcFErg6442zvAbh6nHfOhDpHx
 0PixxZev/+AU9iL8RZ5J4RIOxcrNFQwWlSNfongODLpqeCr6Ufp20t6iRMjD0DYEd2sqxyUtaVZdGr
 s0XDPQIphA4vnlQboYJtuXSHGG9BTzjLa7QOJsgubU4eQgcHfuvSczno0kMn7IG6+zlzDamnN95jFc
 6wT0/jIJV16Bs8QQQhHtsnc3y/D8G13GErS9kWlYU5Hk+SKimqnp3y5CoiMA==
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

This patchset is the second version of [1]. It is almost a complete 
rewrite to use a line-by-line algorithm for the composition.
It can be divided in three parts:
- PATCH 1 to 4: no functional change is intended, only some formatting and 
documenting (PATCH 2 is taken from [2])
- PATCH 5 to 8: Some preparation work not directly related to the 
line-by-line algorithm
- PATCH 9: main patch for this series, it reintroduce the 
line-by-line algorithm
- PATCH 10 to 13: taken from Arthur's series [2], with sometimes 
adaptation to use the pixel-by-pixel algorithm.

The PATCH 9 aims to restore the line-by-line pixel reading algorithm. It 
was introduced in 8ba1648567e2 ("drm: vkms: Refactor the plane composer to 
accept new formats") but removed in 8ba1648567e2 ("drm: vkms: Refactor the 
plane composer to accept new formats") in a over-simplification effort. 
At this time, nobody noticed the performance impact of this commit. After 
the first iteration of my series, poeple notice performance impact, and it 
was the case. Pekka suggested to reimplement the line-by-line algorithm.

Expiriments on my side shown great improvement for the line-by-line 
algorithm, and the performances are the same as the original line-by-line 
algorithm. I targeted my effort to make the code working for all the 
rotations and translations. The usage of helpers from drm_rect_* avoid 
reimplementing existing logic.

The only "complex" part remaining is the clipping of the coordinate to 
avoid reading/writing outside of src/dst. Thus I added a lot of comments 
to help when someone will want to add some features (framebuffer resizing 
for example).

The YUV part is not mandatory for this series, but as my first effort was 
to help the integration of YUV, I decided to rebase Arthur's series on 
mine to help. I took [3], [4], [5] and [6] and adapted them to use the 
line-by-line reading. They were also updated to use 32.32 fixed point 
values for yuv conversion instead of 8.8 fixed points.

My series was mainly tested with:
- kms_plane (for color conversions)
- kms_rotation_crc (for rotations of planes)
- kms_cursor_crc (for translations)
The benchmark used to measure the improvment was done with:
- kms_fb_stress

[1]: https://lore.kernel.org/r/20240201-yuv-v1-0-3ca376f27632@bootlin.com
[2]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/
[3]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-3-952fcaa5a193@riseup.net/
[4]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-5-952fcaa5a193@riseup.net/
[5]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-6-952fcaa5a193@riseup.net/
[6]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-7-952fcaa5a193@riseup.net/

To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
To: Maíra Canal <mairacanal@riseup.net>
To: Haneen Mohammed <hamohammed.sa@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: arthurgrillo@riseup.net
To: Jonathan Corbet <corbet@lwn.net>
To: pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: jeremie.dautheribes@bootlin.com
Cc: miquel.raynal@bootlin.com
Cc: thomas.petazzoni@bootlin.com
Cc: seanpaul@google.com
Cc: marcheu@google.com
Cc: nicolejadeyee@google.com
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Note: after my changes, those tests seems to pass, so [7] may need 
updating (I did not check, it was maybe already the case):
- kms_cursor_legacy@flip-vs-cursor-atomic
- kms_pipe_crc_basic@nonblocking-crc
- kms_pipe_crc_basic@nonblocking-crc-frame-sequence
- kms_writeback@writeback-pixel-formats
- kms_writeback@writeback-invalid-parameters
- kms_flip@flip-vs-absolute-wf_vblank-interruptible
And those tests pass, I did not investigate why the runners fails:
- kms_flip@flip-vs-expired-vblank-interruptible
- kms_flip@flip-vs-expired-vblank
- kms_flip@plain-flip-fb-recreate
- kms_flip@plain-flip-fb-recreate-interruptible
- kms_flip@plain-flip-ts-check-interruptible
- kms_cursor_legacy@cursorA-vs-flipA-toggle
- kms_pipe_crc_basic@nonblocking-crc
- kms_prop_blob@invalid-get-prop
- kms_flip@flip-vs-absolute-wf_vblank-interruptible
- kms_invalid_mode@zero-hdisplay
- kms_invalid_mode@bad-vtotal
- kms_cursor_crc.* (everything is SUCCEED or SKIP, but no fails)

[7]: https://lore.kernel.org/all/20240201065346.801038-1-vignesh.raman@collabora.com/

Changes in v4:
- PATCH 3/14: Update comments for get_pixel_* functions
- PATCH 4/14: Add WARN when trying to get unsupported pixel_* functions
- PATCH 5/14: Create dummy pixel reader/writer to avoid NULL 
  function pointers and kernel OOPS
- PATCH 6/14: Added the usage of const pointers when needed
- PATCH 7/14: Extraction of pixel accessors modification
- PATCH 8/14: Extraction of the blending function modification
- PATCH 9/14: Extraction of the pixel_read_direction enum
- PATCH 10/14: Update direction_for_rotation documentation
- PATCH 10/14: Rename conversion functions to be explicit
- PATCH 10/14: Replace while(count) by while(out_pixel<end) in read_line 
  callbacks. It avoid a new variable+addition in the composition hot path.
- PATCH 11/14: Rename conversion functions to be explicit
- PATCH 11/14: Update the documentation for get_subsampling_offset
- PATCH 11/14: Add the matrix_conversion structure to remove a test from 
  the hot path.
- PATCH 11/14: Upadate matrix values to use 32.32 fixed floats for 
  conversion
- PATCH 12/14: Update commit message
- PATCH 14/14: Change kunit expected value
- Link to v3: https://lore.kernel.org/r/20240226-yuv-v3-0-ff662f0994db@bootlin.com
Changes in v3:
- Correction of remaining git-rebase artefacts
- Added Pekka in copy of this patch
- Link to v2: https://lore.kernel.org/r/20240223-yuv-v2-0-aa6be2827bb7@bootlin.com
Changes in v2:
- Rebased the series on top of drm-misc/drm-misc-net
- Extract the typedef for pixel_read/pixel_write
- Introduce the line-by-line algorithm per pixel format
- Add some documentation for existing and new code
- Port the series [1] to use line-by-line algorithm
- Link to v1: https://lore.kernel.org/r/20240201-yuv-v1-0-3ca376f27632@bootlin.com

---
Arthur Grillo (5):
      drm/vkms: Use drm_frame directly
      drm/vkms: Add YUV support
      drm/vkms: Add range and encoding properties to the plane
      drm/vkms: Drop YUV formats TODO
      drm/vkms: Create KUnit tests for YUV conversions

Louis Chauvet (9):
      drm/vkms: Code formatting
      drm/vkms: write/update the documentation for pixel conversion and pixel write functions
      drm/vkms: Add typedef and documentation for pixel_read and pixel_write  functions
      drm/vkms: Add dummy pixel_read/pixel_write callbacks to avoid NULL  pointers
      drm/vkms: Use const for input pointers in pixel_read an pixel_write functions
      drm/vkms: Update pixels accessor to support packed and multi-plane formats.
      drm/vkms: Avoid computing blending limits inside pre_mul_alpha_blend
      drm/vkms: Introduce pixel_read_direction enum
      drm/vkms: Re-introduce line-per-line composition algorithm

 Documentation/gpu/vkms.rst                    |   3 +-
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 158 ++++++
 drivers/gpu/drm/vkms/vkms_composer.c          | 251 ++++++--
 drivers/gpu/drm/vkms/vkms_crtc.c              |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |   3 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  86 ++-
 drivers/gpu/drm/vkms/vkms_formats.c           | 790 ++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_formats.h           |  12 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  45 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |   5 -
 14 files changed, 1167 insertions(+), 215 deletions(-)
---
base-commit: c079e2e113f2ec2803ba859bbb442a6ab82c96bd
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

