Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24F9B8229
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3998F10E906;
	Thu, 31 Oct 2024 18:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VoKOMMRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BC010E8FE
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 18:06:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A8FD20009;
 Thu, 31 Oct 2024 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730397969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PfSvh9hpshuIpDv3dTCbHj4cZL2ICQg3ojCpbBcbwvU=;
 b=VoKOMMRBviwPCBh+kNdxCU5kGkhD99ut404SRFPFaAYNV7jdBgwebDJW0R8dx7QkYHMti0
 wKfvc8obSF2za4dfNyzTb5DbDMM6MF+KOr4QnYX0LlMf/r6CAWvPzCz6ua6ar5DCmKLHiN
 5CMnB2oak401DsMsQe0ML4xgGRK49iY5STo0moPG0AXc9iA5tuWAinODGXJpMY9IqGOzdE
 9jQjwlQwNyLGuQXdXUIH9OI5hvyDz6CT9IyWhySlztuFCFSAodig5PFoizNc9krECFcn2t
 G2ebZ5LdtrV9WDEPZGu2USb5GYkTJP9SOfI5aWsYjsPN5pL+wpU7/LiXsXmXnQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v13 0/7] drm/vkms: Add support for YUV and DRM_FORMAT_R*
Date: Thu, 31 Oct 2024 19:06:00 +0100
Message-Id: <20241031-yuv-v13-0-c67a337301ae@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAjHI2cC/23T246bMBAG4FeJuC7tjA9jO1d9j6oXPjaWAmyBo
 F2t9t1rAhGk5A7MfPwGfj6rIfY5DtX59Fn1ccpD7tpygvzbqfIX2/6JdQ5loWLABDDA+uM21ci
 5CgaCkYqqMunsEGvX29Zfymx7u17L4lsfU36/3/vX73J+ycPY9R/3qAnn1eebTlhDzb3lihJTx
 NlP13XjNbfffdfMKfdpibRM6zLtkw6UNAkO8Wl6zpvYLoPxRbGirCUXmWbKOXVUfK/WLF5USkQ
 sgTEiuKMSm+IgFiWKUiXKeh2NMvyo5E7hukNZVCQE7wLwJNlR0aYEmEVRUSGil4rpFBQcldqUf
 GSp+Y1riCal6CW8yDKb0sAWZYoCbRUQkYlIR4WwZ+sWsagarfKKBBKlF+8ed7UwHFY390I4tIy
 cT968yts+NQKo1c3fGtCjDZbK8+ln97VUtI9/b6X149LTpcnlepPH8yn0Td3kwf94HNRtfB/nK
 jZxGOz93zifllT+KPHcFRekII6MkrX/pX79A+7G48RzAwAA
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 20241031-yuv-v13-0-bd5463126faa@bootlin.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3550;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zi4doWuWL0F0LsTi1bOIRTSAxt3A7SBpfIKo4U2H4iA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnI8cMcwnj9F6GiLz8NPznIzUKkyHTaFqGesqxo
 MYiWl+lo7qJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZyPHDAAKCRAgrS7GWxAs
 4nygD/0W2QZG8tEnW7m0mFdMz84MKzHIgCTUaLoTKUIn20UuoquSukw+JNtRRpd4rUEA3Cpxfmo
 /R2wYCCdvcaTiyN/v+cHR+aKYI9bq048tvDDJF4FJpo++1bYf0z9xCD9ICfvIx1iUaJ99DHyzoB
 cQ1UwW6BctgPjGkXlbzBq/pWshE7wEVOqVNrFZuIAAgwjQJkix9uBID1lU4B5obkkrcYDFocEYa
 bSuC9ZNYFvCWbkxQtq4gBnqbnit3JypeU48a4TXELiPlYO3VrQll/gQFz4C9qEZ2rBt6RQjwH2Z
 E9PcAGrsmVKHY1c1i6dWCSSQZZr27sMM3C/jVkWrRdo5Ocyuj+YTj4GLXstNh+OvtVaaQ6lP/Oy
 gOtD/mzpF5pGUZAF3dd568X435h0KUvDD7CwK+bnpzNOBYVnrn4D8HoHpCzRRcAOhlAEZHap3lM
 rp2TdRsC1OP7k8phbORxmYTls4xGq4CabMac0qOCQR/f9zW9dmxM1f7tgHu7VlhXfyprBiRJaAj
 Ye5+LO00nZdsyyrp2cOmPQ2d7mXLDOa2Oz10TSk0rW/ECScDuOjgM0VSw/Y7wANEkmeswq4w18t
 ixRbUQdhmz11Ik4qQolzbCFEhI7fpjieojWFmIUHDFyPR59FL3773cRlmkSzst0iZhXFLajScUo
 IOU66DGywoYkE5w==
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

This series depends on [1].

This patchset is extracted from [1]. The goal is to introduce the YUV
support, thanks to Arthur's work.

- PATCH 1: Add the support of YUV formats
- PATCH 2: Add some drm properties to expose more YUV features
- PATCH 3: Cleanup the todo
- PATCH 4..6: Add some kunit tests
- PATCH 7: Add the support of DRM_FORMAT_R1/2/4/8

[1]: https://lore.kernel.org/r/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com

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
 drivers/gpu/drm/drm_color_mgmt.c              |   2 +
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 270 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_drv.h               |  18 +
 drivers/gpu/drm/vkms/vkms_formats.c           | 467 +++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_formats.h           |   9 +
 drivers/gpu/drm/vkms/vkms_plane.c             |  29 +-
 11 files changed, 828 insertions(+), 4 deletions(-)
---
base-commit: 623b1e4d2eace0958996995f9f88cb659a6f69dd
change-id: 20240201-yuv-1337d90d9576
prerequisite-message-id: 20241031-yuv-v13-0-bd5463126faa@bootlin.com
prerequisite-patch-id: 2eed29b53617ba76169e1af303e4899d517a3a18
prerequisite-patch-id: ae2d8b2efbbaa9decce56632c498c87e708288b3
prerequisite-patch-id: d1e73379a15c5062924cf2dc8619676e13f35a13
prerequisite-patch-id: 82523a917646793deeec7cdcc7ff286bd924fd21
prerequisite-patch-id: a0639eb773bf58c2ffe76f2567a8c74b6275092c
prerequisite-patch-id: 3f84c6e64b3a25510e929914e97ae2549451707c
prerequisite-patch-id: dda6bf4692cd1795c489ff58e72c0841ea8ffbc4
prerequisite-patch-id: 7a63d245a377d5f5283f48e8f52421b912811752
prerequisite-patch-id: 11ae7be077ce7022f61101d41a9ba79b98efb273

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

