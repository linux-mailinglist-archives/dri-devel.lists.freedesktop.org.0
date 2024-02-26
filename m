Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2441F866CDD
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26F10E67C;
	Mon, 26 Feb 2024 08:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XCM7ljmJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB86710E67C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:47:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 983E6E0003;
 Mon, 26 Feb 2024 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708937265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i2+KYYyexPFl4LUlvgVyduiapb1+RIbVCY8N+OSoCGs=;
 b=XCM7ljmJcIJg2/Zf6njYJMWPlu/+Q1WsIAt0NNQzOo8ClKWq5dSo7y/QzObXzGNhU2M9y0
 KsMy0CD6cu2TE26EZ9Mk7b2HOI+nIInqYS4lVIIR6OhCUgMNoZATyO5jVmg5UsqEn8iv2i
 XP3V46kBrv6RAZ99cUK5YLkBJ2YpmnbaG8/kE/A8tQvQdp2W3Cq0qJPxAoBZr4rFTqYQL6
 uLmpluqnMJubPYBH+QPwbbPW9lGb8IFt7VtyyDO7KqKxAIBhiY5H1mwcp1mXwlafd4ovej
 7lBnzKPZmWNGXQ2EphoBmNp0RqTZrbGmpx6Un7OYF7ErX2x+JGVkgKTk+OGxyg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v3 0/9] drm/vkms: Reimplement line-per-line pixel
 conversion for plane reading
Date: Mon, 26 Feb 2024 09:46:30 +0100
Message-Id: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOZP3GUC/1WNQQ7CIBREr9KwFgMfBevKexgXQH8tSQUDLbFpe
 ndp3djlTOa9mUnC6DCRazWTiNklF3wJ4lAR22n/ROqakgkwODFgnE5jplwI1dSsqc9KkrI0OiE
 1UXvbla0f+76U74it+2zq+6PkzqUhxGl7ynxt99LMKaPCaqFkC0oKuJkQht75ow0vshoy/FEgf
 hQUSmtpEC6gjFF7almWL9LgkhPjAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6621;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3qcRaVMGc8ins339Q4R21gRbCwPBrg2acIXJ8znAOmE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl3FAtJqb0My2sMSXOGzZ+R3ICizHBPrY5BnkpXDW1
 1sLK8r6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZdxQLQAKCRAgrS7GWxAs4mSuEA
 DAmHRYqQ+2ls+HDpQIoRGwg3+M2po9gT/DsTE0h7g3V3D/aj88v+3WpldTO3T60TFxOIQEqfgI5qUd
 yLSlJ9QCwr1MajMEx9I0471khb6Si/DhR6uQ6GDPcOP1uboT2u8QbqgJuNixvXofTga263uYAU7HZA
 QPCES4iapYGicn6hprLjym06c1/VvGwPQZ68tfuA92gCl/6hsyLPT/Q/i8P9RhEr3RbcBM2oCYs25r
 rtc/khXS/naiVQ85AjB1/BQ1sLHJPF/Dcg5juCfY9dLC7mi3C7c3mQOPjMXXCw4npIbzx4WT2gktGQ
 m06UaRawPIJUhDUIqaqKVypGgEAqbtoPb+9RZdLb3AERZ4d2Lk2cO+IXWIaQa7TyUtH1kj72IjlY5d
 X1Yk6V3Rl75IqsAzflTJk6HGIzUij/Nt2NrRuZ5vkVJ9UwdDN6ZobepZSl/rbVUqTnrqWYl92zPEPd
 hWSj014x+aB1gOUD0dn1ND5uKdpWqE6fTTIwBUxolVkJotOMZb2LLigMgIBggdensnceMHPccMIeNo
 LEukRM4rG08pnO7xcysBoUvU/LxoQ7+oM5PN8XPgn2kkKOs28UWM8Dpv5RKFsDUIDhlI2dA7qpf6b/
 xB2zKsl/ZW03oBk66Q7Rwk/CpuWKyTg2bb23DZEL7MQdQEW0H5Y5u/1GkPHw==
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
 drivers/gpu/drm/vkms/vkms_drv.h               |  55 ++-
 drivers/gpu/drm/vkms/vkms_formats.c           | 565 +++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_formats.h           |  13 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  50 ++-
 drivers/gpu/drm/vkms/vkms_writeback.c         |  14 +-
 13 files changed, 915 insertions(+), 190 deletions(-)
---
base-commit: c079e2e113f2ec2803ba859bbb442a6ab82c96bd
change-id: 20240201-yuv-1337d90d9576

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

