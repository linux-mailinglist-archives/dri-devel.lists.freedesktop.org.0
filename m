Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C86487ADE2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B486310F68A;
	Wed, 13 Mar 2024 17:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YUBe9IrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AF410F68A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:45:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B703340003;
 Wed, 13 Mar 2024 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710351927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sIA7nJwwGB6vEsSNOsGuHoNpvL2AY7FODXqPt0l5Iqg=;
 b=YUBe9IrN1/nLzi/vvNNLk+lkREghD5INxs5xJgxCEORTJqM83kGbF3K8b3zMv0Nnoe4pYs
 f3BgukCNV+gAaWX/bBAqKbpJ5HwH8qAJU0JkiuHq/RrkMywZqv4u1LM6DD086w+GatILmB
 9utuzBx2KqM1lWiLowHgwqXNpVCQYnbYk80kNQbMMQ/2rZrRA0kj4Ma+znaJyAGYumrsRb
 d07Mo6SpxvnN47flV4bqnfkbPyHi0GPCv7AkW7t0GN8BadYamCbNgeXdGfSBoHiAZiYiw4
 3bR6NiGONooN3lhaImrZO8N+EOwvCl6uaQSpJQ4IHT+KcxrvK2vrVbc/aoGa1g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v5 00/16] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Date: Wed, 13 Mar 2024 18:44:54 +0100
Message-Id: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABbm8WUC/2XNwW4CIRAG4FcxnEvDziBIT76H6QFYcEm20ICSG
 rPv3tE9qPH4/5nvnytroabQ2NfmymroqaWSKWw/NsxPNh8DTyNlBgKkADHwy7nzAVGPRoxmqxW
 jS2db4K7a7Ce6zed5pvK3hpj+7tOHb8pTaqdSL/dPfbi1r6N94IKjt6hVBK0Q9q6U05zypy8/7
 LbQ4UkBrgpIWatcgB1o5/S7wmelVoWkYlQKojBGju5dyYdCIVclSWl6Zf0uGG3wVS3L8g9Nqzz
 DTwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10384;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Mw0GRWWNFAX4jApUCq/E1GODOxaJYOd3gJt9W8nPisE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8eYyOzTGf6MYIrxrXfptqrBQlG8/hQrgZ2kcKnO5
 vJVrnlOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHmMgAKCRAgrS7GWxAs4ibND/
 4q0MCv1BgIDfl9iHW3veFRvO7jbsATRqTG+Eo+0qD3AxqExiAoAKV9UMmeZZPHesOOFN3RZK9q8Pfb
 OiFOxbNfiCvAi4Tax4ZGScLREBHYFqAfv4cyfddwvBKdVGrzei32zb1to8VYdZ++Jq7eyWK1nHGkW/
 Mgp7m2wCcm/WZHtUcRVVLcOyoshb9nZEgM2g9fL59uQCZ8tRXZf/4s1b4aU8YfDi8n+8q3Xv2e6Q4D
 C3TMSk3hzlrA05CsImDFG6AvZBYs58mNNkj6BQHiFuB5SdoOT8Z+9nrTcQBANCeRomczk2o/DC34CQ
 ik8haO85FV/vmI9LlZubjdaxTDrsJ2tbiztgPxdSNrWTJOZJkyGa7Uv5PBAnV7M4tS2OpBjiqQ8Rzl
 Tu1rc4SkE2KOIR+py5ZI1zEyd/GfqJJpAEq/meKAHxdeFS9wow9ue5JRas5hmU8aoB7TCpLZhzx+TB
 G+7QdJyUOUP+ZBS3WozLFHjHM68fsoFcv4JH20P6KIU9WkOk0I4Y0djOQbxii7lRnLHJpfLgYwKnT0
 B3OaIbKiqwK9hqGV/wRsgjWHJ/yhCEw9MBMBBPB46lt31prqAKvPPII0QLd9CbD/YH6UEuGM471nHE
 ROPKPuCnYT+r0urtah6TmKcn/72dxhLGD0Rcj+qU/6rDsnUs2wpqI91CyDjA==
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

During the development of this series Pekka and Arthur found an issue in 
drm core. The YUV part of this series depend on the fix [9]. I'll let 
Arthur extract it and submit a new independant patch.

It can be divided in three parts:
- PATCH 1 to 4: no functional change is intended, only some formatting and 
  documenting (PATCH 2 is taken from [2])
- PATCH 5 to 8: Some preparation work not directly related to the 
  line-by-line algorithm
- PATCH 10: main patch for this series, it reintroduce the 
  line-by-line algorithm
- PATCH 11 to 15: taken from Arthur's series [2], with sometimes 
  adaptation to use the pixel-by-pixel algorithm.
- PATCH 16: Introduce the support for DRM_FORMAT_R1/2/4/8

The PATCH 10 aims to restore the line-by-line pixel reading algorithm. It 
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

The last patch of this series introduce DRM_FORMAT_R1/2/4/8 to show how 
the PATCH 7/16 can be used to manage packed pixel formats.

To properly test the rotation algorithm, I had to implement a new IGT 
test [8]. This helped to found one issue in the YUV rotation algortihm.

My series was mainly tested with:
- kms_plane (for color conversions)
- kms_rotation_crc (for a subset of rotation and formats)
- kms_rotation (to test all rotation and formats combinations) [8]
- kms_cursor_crc (for translations)
The benchmark used to measure the improvment was done with:
- kms_fb_stress

[1]: https://lore.kernel.org/all/20240201-yuv-v1-0-3ca376f27632@bootlin.com
[2]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/
[3]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-3-952fcaa5a193@riseup.net/
[4]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-5-952fcaa5a193@riseup.net/
[5]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-6-952fcaa5a193@riseup.net/
[6]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-7-952fcaa5a193@riseup.net/
[8]: https://lore.kernel.org/r/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com
[9]: https://lore.kernel.org/dri-devel/20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net/

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
- kms_cursor_crc.* (everything is SUCCEED or SKIP, except for 
  rapid_movement)

[7]: https://lore.kernel.org/all/20240201065346.801038-1-vignesh.raman@collabora.com/

Changes in v5:
- All patches: fix some formatting issues
- PATCH 4/16: Use the correct formatter for 4cc code
- PATCH 7/16: Update the pixel accessors to also return the pixel position 
  inside a block.
- PATCH 8/16: Fix a temporary bug
- PATCH 9/16: Update the get_step_1x1 to get_step_next_block and update 
  the documentation
- PATCH 10/16: Update to uses the new pixel accessors
- PATCH 11/16: Update to use the new pixel accessors
- PATCH 11/16: Fix a bug in the subsampling offset for inverted reading 
  (right to left/bottom to top). Found by [8].
- PATCH 11/16: Apply Arthur's modifications (comments, algorithm 
  clarification)
- PATCH 11/16: Use the correct formatter for 4cc code
- PATCH 11/16: Update to use the new get_step_next_block
- PATCH 14/16: Apply Arthur's modification (comments, compilation issue)
- PATCH 15/16: Add Arthur's patch to explain the kunit tests
- PATCH 16/16: Introduce DRM_FORMAT_R* support.
- Link to v4: https://lore.kernel.org/r/20240304-yuv-v4-0-76beac8e9793@bootlin.com
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
Arthur Grillo (6):
      drm/vkms: Use drm_frame directly
      drm/vkms: Add YUV support
      drm/vkms: Add range and encoding properties to the plane
      drm/vkms: Drop YUV formats TODO
      drm/vkms: Create KUnit tests for YUV conversions
      drm/vkms: Add how to run the Kunit tests

Louis Chauvet (10):
      drm/vkms: Code formatting
      drm/vkms: write/update the documentation for pixel conversion and pixel write functions
      drm/vkms: Add typedef and documentation for pixel_read and pixel_write  functions
      drm/vkms: Add dummy pixel_read/pixel_write callbacks to avoid NULL  pointers
      drm/vkms: Use const for input pointers in pixel_read an pixel_write functions
      drm/vkms: Update pixels accessor to support packed and multi-plane formats.
      drm/vkms: Avoid computing blending limits inside pre_mul_alpha_blend
      drm/vkms: Introduce pixel_read_direction enum
      drm/vkms: Re-introduce line-per-line composition algorithm
      drm/vkms: Add support for DRM_FORMAT_R*

 Documentation/gpu/vkms.rst                    |  14 +-
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 230 ++++++
 drivers/gpu/drm/vkms/vkms_composer.c          | 244 +++++--
 drivers/gpu/drm/vkms/vkms_crtc.c              |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |   3 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  85 ++-
 drivers/gpu/drm/vkms/vkms_formats.c           | 983 ++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_formats.h           |  12 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  50 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |   5 -
 14 files changed, 1440 insertions(+), 215 deletions(-)
---
base-commit: ae4928daaf4d7b2012c97c9109f608fcf6c60df3
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

