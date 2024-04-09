Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC0789DA1F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687FC112D8E;
	Tue,  9 Apr 2024 13:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iskfGIZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BACD1123D3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:25:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EF3124000A;
 Tue,  9 Apr 2024 13:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712669143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nZnjJlnFN/i/joboChJlz6cI1gTUYT6R/8xMGdWFAtg=;
 b=iskfGIZSwLRKxE7YnjSC4i4GNkNIB0v1BfO4mUdUCTh0dC+9KB/ihO2yUoFYvmdiVDu3BU
 gKSjNe83J48H5nMJYR+/govt9gJnR0NFlBqV5TGLhAbqe7XIrOyBg9jfYGBAC+PSuXhCjF
 Yn1omsf1LhINnLrOpTEtGmKF425YHg6V+8Uy80k3mXiT/ajMXlOgO1F4MCcH4l7b5X5S3x
 9/DkR3I1vry2+ttGsRvrcD0SONxE9AV/rp8dfHNxa9+C/wBxMCDElvpbHPF3tdo66jHYDN
 L0WxdYIsMIE7kepcvB0OpOnGL1/ZqKB0qtKvobQdudnFWridrtv0NYOJHsX87Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v6 00/17] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Date: Tue, 09 Apr 2024 15:25:18 +0200
Message-Id: <20240409-yuv-v6-0-de1c5728fd70@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL5BFWYC/2XPTU7DMBAF4KtUXmNkzzh2zYp7IBb+JZZCUjmtR
 VXl7kwbJAJZvtF8b+wbm1MtaWYvhxurqZW5TCMF/XRgoXfjR+IlUmYgQAkQkl8vjUtEE62ItjO
 a0aZ3c+K+ujH0tDtehoGGp5py+XpUv71T7st8nur1canJ+/RvaZNccAwOjc5gNMKrn6bzUMbnM
 H2ye0ODjQJcFZByTvsERzDem73CrdKrQlI5aw1ZWKui3yv1q1CoVSlShk65cEzWWNyrbqPkzws
 7UklLEXwUmLt//1qW5Rvd/EgLhQEAAA==
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12082;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Yisw1eahpOV37yvSrXneB4HnqqL5SXezx0+4iMGfFLs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmFUHQhEng87Ht1yfNDaW8tm7ezctwIU843sVFM
 QqIrom9sK6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZhVB0AAKCRAgrS7GWxAs
 4rkBD/9TzzTTUTvNmYbxQKSAqUS4Q1jBEbARBSEBTzyB9iD3EhD32/PJ35C8CHUlbqXAkg5dnlA
 3ZKuzjSKLyEUNFNQatvev/k/zDqq32mRSjUQ4gjbAfUcZyrZRPUtSHQ0qk9c7O4H/JwMcDijRxz
 sGmUH42j3h17UXsI3cYQ0+hvrAA9gIMkDnX8l5hsNbRkaLH368JUSzdqcfLsp3QN/qt6B6jTP3f
 Loh/5CB+4Qa7Gu3EAoseEouGf3nf6DaGuM/Zn/4qyU2qXWb6cj8OqsQtxWPX8EmSIR4dWPToOju
 k6vVlntjxBjf5+pBbwurl64cpcrVBbUuwEt4HDLhLlzIrsJxb+AwtRZROzt5+Nx3+C28jPTM8tF
 hUQYpTVC6iYxiq9CxQZLvGbbkH+K9a2HjlsbI5ViHd/gR1OSkGyRn7p+IudjYVL0xlal8PFlctI
 m9GAla3FcB3l287RHyeUfC5QDGbU9du7ymIRzQHkepNm58/eb8atYiUsWkUpw+rAMAidFBPqYBb
 NDPUXOfqYSSLmx5KE1qpaaDlnx0CA4JuceElDjNjacbR8y13pUOse5NlLeXo4tsivi41UM3GMwy
 PfITTMMc/nx3/a+yShjJqUN/GlPamIPAPJDb/09tAoWOcgHwpRjIa95eSk6DOQmMb0T7mhuzagt
 ZV+qVDKcWbzUbQA==
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
- PATCH 11: Remove useless drm_simplify_rotation
- PATCH 12 to 16: taken from Arthur's series [2], with sometimes
  adaptation to use the pixel-by-pixel algorithm.
- PATCH 17: Introduce the support for DRM_FORMAT_R1/2/4/8

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
the PATCH 7/17 can be used to manage packed pixel formats.

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
To: rdunlap@infradead.org
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

Changes in v6:
- Add Randy
- Add Review-By and Acked-By
- PATCH 2/17: Remove useless newline
- PATCH 3/17: Fix kernel doc
- PATCH 4/17: Fix typo in git commit
- PATCH 4/17: Fix kernel doc and simplify brief description of typedef
- PATCH 5/17: Change black default color to Magenta
- PATCH 5/17: Fix wording in comment
- PATCH 7/17: Fix typo in packed_pixel_offset
- PATCH 7/17: Add WARN_ON for currently not supported formats
- PATCH 8/17: Rename x_limit to pixel_count
- PATCH 8/17: Clarify kernel doc for pre_mul_alpha_blend
- PATCH 9/17: Rename get_step_next_block to get_block_step_bytes
- PATCH 9/17: Change kernel doc order
- PATCH 9/17: Rework the direction_for_rotation function to use drm
  helpers
- PATCH 9/17: Add a warn in direction_for_rotation if the result is not
  expected
- PATCH 10/17: Reword the comment of pixel color conversion functions
- PATCH 10/17: Refactor the blending function to extract functions
- PATCH 11/17: Remove useless drm_rotation_simplify
- PATCH 12/17: Fix typo in comments
- PATCH 12/17: Remove useless define
- PATCH 12/17: Fix some comments typo and kernel doc
- PATCH 12/17: Add a comma at the end of the vkms_formats list
- PATCH 12/17: Use copy of matrix instead of pointers
- PATCH 12/17: Use 16 bit range for yuv conversion
- PATCH 17/17: Add a comma at the end of the vkms_formats list
- PATCH 17/17: Add assertions
- PATCH 17/17: Fix color conversion... Next time I will read the doc 
  twice...
- Link to v5: https://lore.kernel.org/r/20240313-yuv-v5-0-e610cbd03f52@bootlin.com
Changes in v5:
- All patches: fix some formatting issues
- PATCH 4/16: Use the correct formatter for 4cc code
- PATCH 7/16: Update the pixel accessors to also return the pixel position
  inside a block.
- PATCH 8/16: Fix a temporary bug
- PATCH 9/16: Update the get_step_1x1 to get_step_next_block and update
  the documentation
- PATCH 10/16: Update to uses the new pixel accessors
- PATCH 10/16: Reword some comments
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

Louis Chauvet (11):
      drm/vkms: Code formatting
      drm/vkms: write/update the documentation for pixel conversion and pixel write functions
      drm/vkms: Add typedef and documentation for pixel_read and pixel_write functions
      drm/vkms: Add dummy pixel_read/pixel_write callbacks to avoid NULL pointers
      drm/vkms: Use const for input pointers in pixel_read an pixel_write functions
      drm/vkms: Update pixels accessor to support packed and multi-plane formats.
      drm/vkms: Avoid computing blending limits inside pre_mul_alpha_blend
      drm/vkms: Introduce pixel_read_direction enum
      drm/vkms: Re-introduce line-per-line composition algorithm
      drm/vkms: Remove useless drm_rotation_simplify
      drm/vkms: Add support for DRM_FORMAT_R*

 Documentation/gpu/vkms.rst                    |  14 +-
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 230 +++++++
 drivers/gpu/drm/vkms/vkms_composer.c          | 309 +++++++--
 drivers/gpu/drm/vkms/vkms_crtc.c              |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |   3 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  83 ++-
 drivers/gpu/drm/vkms/vkms_formats.c           | 936 ++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_formats.h           |  13 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  46 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |   5 -
 14 files changed, 1448 insertions(+), 220 deletions(-)
---
base-commit: e495e523b888a6155f82c767d34c8d712a41ee54
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

