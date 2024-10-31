Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5249B81AD
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 18:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370DF10E16B;
	Thu, 31 Oct 2024 17:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="X6YuKP+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA16510E16B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 17:53:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6732EE0005;
 Thu, 31 Oct 2024 17:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730397218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ih6dWjHrR1dPVtDKCbASUgnKbBait4nWBLJE0hJt6xc=;
 b=X6YuKP+vp3NE0uU14sl5AMeNI8pNRkrGtAs752W6XnzQqyceQwOK2L0tVaBiwBNikyBKrv
 hBPr6TzNSmj0bqO7m9rHhSY/YWjtqXaG9TINcp+evaEZSpu13YweJ0t+SPClRrWFovuxuC
 OsjMrtluIvWtup+oc+HpF40+CUahGHH6Kqts7b5pDw/QQJoEPNFIesL3bWqli1jdgj2s1U
 2SNutRzuiwyjSg5xlsNScHSo361zDHL2H5FXtvOW2Alf40Iiz7Aqwy4YUTk0Ehqh5+NQak
 lvN/+f+mNRlmYQ0HxPeVbCwZclPaLK7cO2weLV2Qj0hkSmYx0kXPUVxTJSPxZA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v13 0/9] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Date: Thu, 31 Oct 2024 18:53:24 +0100
Message-Id: <20241031-yuv-v13-0-bd5463126faa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABXEI2cC/23SzW6cMBAH8FdZca7bGduM7Zz6HlUO/uwi7UILL
 EoU5d0zLESwYm/Ynp//xp6Pash9k4fq5fRR9XlqhqZreYDqx6mKZ9/+zaJJPFFJkBokoHi/TQK
 VMslBcrWhiiuDH7IIvW/jmWvb2+XCk//6XJq3+95/Xnl8boax69/vURPOs4+bTihAqOiVoSINK
 fk7dN14adqfsbvOKffqGmmptlwdi01ULGkF+aF6zpvkLkOqRUlW3lPI0koTgjkqtVdrlmJVCpE
 s4JxO4aj0phToRWlWhqN8tNkZp46q3ilcT1izyoQQQwJVanlUtCkNblHEKmWMtZG2JANHZTZVf
 2eZ+cYtZFdKjjU8yXKbsiAX5ViB9QaIyGWko0LYs/WIyEqgN9GQRqLy5O5x1xZOwermvtABvaQ
 QS3TP8ranRgCzuvmtASP65In/zz66z6VF+/z/xl0/Ln26dDKvX5vx5ZT6q7g2Q/z1/SHa/DYy/
 fwCtN3tMzgDAAA=
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=13308;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MfAEnIVPzNuu16xBPtkP9il5gJk2aARnSpFix57/0OU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8QazicZIISoZodv5ltTKmks7L1KSN55qBrwu
 ImOf9X3GA+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPEGgAKCRAgrS7GWxAs
 4rUBD/9juRJmdvzx8NBUN0sCeVUzCjOaxUE190SSQ4BSyc/DdCB/phqymgMzLKBznjXXpnI0qC7
 fVGnc6rkgX8CGhD6thAo+JWLY21KPTLd+DV7+OyzDvefewnlF4aS0VUU08LAYZC6dELwErPIZcr
 mQCjzTu3vwt+kJLplK+wpbry/S0rgxU8oCWQlIHgEvrYmJyp1FLyQanystwXPNzdCjCeqH7gvOj
 eFlcSx7ozK8PFG8yXmWK5hgKfdiZqOFbw5mO2a7Gc7vcjWKyUmcDkt39LdCv6Qmja8BLZBXwBIR
 Mq9SKa79asQNXybevjWBcdULzuT/1eM2aAmwT4JactpU0tDZvzpJMgacgwJJNT60XR8pwSrBYvH
 kIIzwwH2o4pSEpT77X9hh/JpmP0eOUosaWilm9y7GY++l/mUdZUPFK8r6UdpBpGnWxntdgEZEzG
 llP6ZBwWA/cdXxo2nE7HQlYvDuO272yEvk0tV5GTm2ssdBRAGns6cy9MYOP1HPPpUNzayZuvOlA
 8KfaapTgy/LSPTZ9YiDhpGz2jYrgfH6/3WJwic+mpyAiyohquFUUhO9GM7GWDiYQAE+BmbPBZ2F
 zbx/NnCDRxopoFXPrLIZGq4iLm/6181IEgNczEFlUdCnL7IKbwtAn0tLfBpHzXBpdH2NtTUoPzK
 rciN/IzxOEYLbjA==
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

It can be divided in multiple parts:
- PATCH 1 to 3: no functional change is intended, only some formatting and
  documenting (PATCH 2 is taken from [2])
- PATCH 4 to 7: Some preparation work not directly related to the
  line-by-line algorithm
- PATCH 8: main patch for this series, it reintroduce the
  line-by-line algorithm
- PATCH 9: Remove useless drm_simplify_rotation
- Rest of the series: moved to a new series to merge this one, see the new 
  series "Add YUV ad R1..8 formats support to VKMS"

The PATCH 8 aims to restore the line-by-line pixel reading algorithm. It
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

I did not changed any expected test results as VKMS seems to have some 
existing issue:
https://gitlab.freedesktop.org/jim.cromie/kernel-drm-next-dd/-/jobs/61484201
https://gitlab.freedesktop.org/jim.cromie/kernel-drm-next-dd/-/jobs/61803193
https://gitlab.freedesktop.org/louischauvet/kernel/-/jobs/65944002

To properly test the rotation algorithm, I had to implement a new IGT
test [8]. This helped to found one issue in the YUV rotation algortihm.

My series was mainly tested with:
- kms_plane (for color conversions)
- kms_rotation_crc (for a subset of rotation and formats)
- kms_rotation (to test all rotation and formats combinations) [8]
- kms_cursor_crc (for translations)
The benchmark used to measure the improvment was done with
kms_fb_stress [10] with some modifications:
- Fixing the writeback format to XRGB8888
- Using a primary plane with odd dimension to avoid failures due to YUV
  alignment
The KMS structure was:
	CRTC:
		rectangle: 4096x2160+0+0
	primary:
		format: ABGR16161616
		rectangle: 3640x2160+101+0
	writeback:
		format: XRGB8888
		rectangle: 4096x2160+0+0
Results (on my computer):

8356b9790650: drm/test: Add test cases for drm_rect_rotate_inv() (before any regression)
322d716a3e8a: drm/vkms: isolate pixel conversion functionality (first regression)
cc4fd2934d41: drm/vkms: Isolate writeback pixel conversion functions (second regression)
2c3d1bd284c5: drm/panel: simple: Add Microtips Technology MF-103HIEB0GA0 panel (current drm-misc-next)

 Used format  | This series | 2c3d1bd284c5 | cc4fd2934d41 | 322d716a3e8a | 8356b9790650 |
--------------+-------------+--------------+--------------+--------------+--------------+
 XRGB8888     |  13.261666s |   14.289582s |   10.731272s |    9.480001s |    9.277507s |
 XRGB16161616 |  13.282479s |   13.918926s |   10.712616s |    9.776903s |    9.291766s |
 RGB565       | 136.154163s |  141.646489s |  101.744050s |  103.712164s |   87.860923s |

This is a 5-10% improvment of the performance. More work need to be done
on the writeback to gain more.

[1]: https://lore.kernel.org/all/20240201-yuv-v1-0-3ca376f27632@bootlin.com
[2]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/
[3]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-3-952fcaa5a193@riseup.net/
[4]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-5-952fcaa5a193@riseup.net/
[5]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-6-952fcaa5a193@riseup.net/
[6]: https://lore.kernel.org/all/20240110-vkms-yuv-v2-7-952fcaa5a193@riseup.net/
[8]: https://lore.kernel.org/r/20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com
[9]: https://lore.kernel.org/dri-devel/20240306-louis-vkms-conv-v1-1-5bfe7d129fdd@riseup.net/
[10]: https://lore.kernel.org/all/20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net/

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

Changes in v13:
- Removed the YUV part to prepare the merge
- Add Acked-by from Maíra
- Link to v12: https://lore.kernel.org/r/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com
Changes in v12:
- Fix documentation issues as suggested by Randy
- Link to v11: https://lore.kernel.org/r/20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com
Changes in v11:
- Remove documentation patch (already merged)
- Fix sparse warning about documentation
- Link to v10: https://lore.kernel.org/r/20240809-yuv-v10-0-1a7c764166f7@bootlin.com
Changes in v10:
- Properly remove the patch introducing dummy read/write functions
- PATCH 8/16: Format fixups
- PATCH 9/16: Format fixups
- PATCH 11/16: Format fixups
- PATCH 14/16: Fix test compilation, add module description
- Link to v9: https://lore.kernel.org/r/20240802-yuv-v9-0-08a706669e16@bootlin.com
Changes in v9:
- PATCH 3/17: Fix docs as Maíra suggested
- PATCH 4,6,10,12,15,17/17: Fix sparse warning about __le16 casting
- Link to v8: https://lore.kernel.org/all/20240516-yuv-v8-0-cf8d6f86430e@bootlin.com/
Changes in v8:
- PATCH 7/17: Update pitch access to use the proper value for block
  formats
- PATCH 9/17: Update pitch access to use the proper value for block
  formats
- Link to v7: https://lore.kernel.org/r/20240513-yuv-v7-0-380e9ffec502@bootlin.com
Changes in v7:
- Some typos and indent fixes
- Add Review-By, Acked-By
- PATCH 3/17: Clarify src/dst unit
- PATCH 9/17: Clarify documentation
- PATCH 9/17: Restrict conditions for direction
- PATCH 9/17: Rename get_block_step_byte to get_block_step_bytes
- PATCH 10/17: Clarify kernel doc for clamp_line_coordinates, blend_line,
  pixel_read_line_t
- PATCH 10/17: Fix the case when src_*_start >= fb->width/height
- PATCH 10/17: Change y in blend to be an int
- PATCH 10/17: Clarify documentation for read functions
- PATCH 12/17: Fix the type of rgb variables in argb_u16_from_yuv888
- PATCH 12/17: Move comments at the right place, remove useless ones
- PATCH 12/17: Add missing const
- PATCH 17/17: Use drm_format_info_bpp and computation to avoid hard-coded
  values
- Link to v6: https://lore.kernel.org/r/20240409-yuv-v6-0-de1c5728fd70@bootlin.com
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
Arthur Grillo (1):
      drm/vkms: Use drm_frame directly

Louis Chauvet (8):
      drm/vkms: Code formatting
      drm/vkms: Add typedef and documentation for pixel_read and pixel_write functions
      drm/vkms: Use const for input pointers in pixel_read an pixel_write functions
      drm/vkms: Update pixels accessor to support packed and multi-plane formats.
      drm/vkms: Avoid computing blending limits inside pre_mul_alpha_blend
      drm/vkms: Introduce pixel_read_direction enum
      drm/vkms: Re-introduce line-per-line composition algorithm
      drm/vkms: Remove useless drm_rotation_simplify

 drivers/gpu/drm/vkms/vkms_composer.c  | 312 ++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_crtc.c      |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c       |   3 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |  55 ++++-
 drivers/gpu/drm/vkms/vkms_formats.c   | 409 ++++++++++++++++++++++++----------
 drivers/gpu/drm/vkms/vkms_formats.h   |   4 +-
 drivers/gpu/drm/vkms/vkms_plane.c     |  17 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |   5 -
 8 files changed, 588 insertions(+), 223 deletions(-)
---
base-commit: 623b1e4d2eace0958996995f9f88cb659a6f69dd
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

