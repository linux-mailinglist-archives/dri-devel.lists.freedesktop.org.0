Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B1C861084
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 12:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E937410EBB7;
	Fri, 23 Feb 2024 11:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="b0zmyfS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010C910E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 11:37:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3795C40003;
 Fri, 23 Feb 2024 11:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708688263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ifnpa8zr1id8PgJXAuNZq9AhudHBZLq2Kwr93pnBEgE=;
 b=b0zmyfS+9hX6zpg2BoKv+GQp29BajjAmhNNNuroNVnLpyMFMEYTCefpuKRxKkdNmuFSTPv
 fUeS2BCL1dqlcFQB1IsHDBR/YzlefjC+0nBqKWcWfPVyh3t04MvktSiSBDpANOI52SzSlS
 2Qc2alkYhbg0cICKX8HddioLKALFf+Vr1lSPVIPMhATWwjjVYfAYzcAi1ql9Nhl26izR6d
 SFdd4EgVE80RNz6U0IoP4oCvWV+/qHwP8X5xfYjRAYg40asQIRZrvVTjDjVp9Ep51YOXkX
 g5wOpIADJxJDyQ3KK9CNOuFQk976cCsHqRG9j7kN7QwXDv/OwXzXkPezoZAUPQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v2 0/9] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Date: Fri, 23 Feb 2024 12:37:20 +0100
Message-Id: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHCD2GUC/1WNyw6CMBBFf4XM2po+lAZX/odhUUqxk9TWtNBIC
 P/uyM7lObk5d4PiMroCt2aD7CoWTJFAnhqw3sSnYzgSg+TywiUXbF0qE0rpseNjd9Ut0HIwxbE
 hm2g9beMSAsl3dhN+jvSjJ/ZY5pTX46mKn/2PVsE4U9Yo3U5St0reh5TmgPFs0wv6fd+/D8E/B
 K0AAAA=
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6323;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mBNtO9MRdQyVSUnp0677/U3/dj0DCJQz7n5ZIh29cQE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl2IN+GTYEFNEAcoL/p6sJ5vjm9X3v40h/neLWa2yK
 Wgf0TvOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZdiDfgAKCRAgrS7GWxAs4rdMD/
 9Ngf3zJRcQPu9bD2hXq1E9sgmcV85hIia99c6PSm9wHwO9HHgCf7hwN01UST03oJgT/MglWYrZndXX
 zl9c0SrSrlMFznOO9E+xjNI67Kqku94u7CPun6c0UmhBk7qQYOe6x+rnABs507vUpfmIae6YD1k4g+
 hkJHKKlDYMr/PmGPpbhtQziizHrjyfaXaCGgl8zu60iJ9pjMBKKd91VDs0gtTOcq5Jtg+h9oxtRC91
 23K8sHXtVb5a03mD7h2oU7ZXVpCfUGpm+EV7ay/k0p1b28kFcWEi3YEEKz4NX132HvoD5XF7a/zAC/
 sUB1vxKM2P5Z2u0z8T4fx2MUDC7KeTvUL7if7Uvev4vqHudT1kiyRaV7bw0STMvsGzRX/fP+K0V0WG
 RsEKkLtk5BoGlv1GXj1YVMmATbQ2G7KkHZyw5Qi2O/4Lnz2G1/frgcW6h726YI4/FWwVCnrru7BXVQ
 +4XEFmdPQpdH19fMAyukAyvKPFL2AjGvZeaGBuZZyd8Mmy2WeTConPyX15+rP/MPT0Wxb+LK1Fwh1p
 EcbSNrEWSOpXB2XgNu3aml2/ZQ5PECimbtWrLys5q3vsqYF+x7YanUprayOryMjFr8arMLLZDypxlA
 EjGnU7ugmn4TPHOeOGlBaq17DWN2O3+eT6Abb2RXcf2uQ2qCKY+6bxB2G0zw==
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
documenting
(PATCH 2 is taken from [2])
- PATCH 5: main patch for this series, it reintroduce the 
line-by-line algorithm
- PATCH 6 to 9: taken from Arthur's series [2], with sometimes adaptation 
to use the pixel-by-pixel algorithm.

The PATCH 5 aims to restore the line-by-line pixel reading algorithm. It 
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
line-by-line reading. If I did something wrong here, please let me 
know.

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
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: jeremie.dautheribes@bootlin.com
Cc: miquel.raynal@bootlin.com
Cc: thomas.petazzoni@bootlin.com
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
      drm/vkms: Add range and encoding properties to pixel_read function
      drm/vkms: Drop YUV formats TODO
      drm/vkms: Create KUnit tests for YUV conversions

Louis Chauvet (4):
      drm/vkms: Code formatting
      drm/vkms: write/update the documentation for pixel conversion and pixel write functions
      drm/vkms: Add typedef and documentation for pixel_read and pixel_write functions
      drm/vkms: Re-introduce line-per-line composition algorithm

 Documentation/gpu/vkms.rst                    |   3 +-
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 155 +++++++
 drivers/gpu/drm/vkms/vkms_composer.c          | 233 ++++++++---
 drivers/gpu/drm/vkms/vkms_crtc.c              |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |   3 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  56 ++-
 drivers/gpu/drm/vkms/vkms_formats.c           | 565 +++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_formats.h           |  13 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  50 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c         |  14 +-
 13 files changed, 916 insertions(+), 190 deletions(-)
---
base-commit: aa1267e673fe5307cf00d02add4017d2878598b6
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

