Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BDA8740FB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 21:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934991134F7;
	Wed,  6 Mar 2024 20:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="g2RVWGhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26BC91134F7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 20:03:29 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4Tqjzh0rjCzDqKq;
 Wed,  6 Mar 2024 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1709755408; bh=j/vS7DsxV/D4GunL1vou/Gx6H9hRsoQaXd6e18HvHpA=;
 h=From:Subject:Date:To:Cc:From;
 b=g2RVWGhN0Sxa5zndei+PgdrWdIFzhcDxdWzUG/8aQC5Tl/aktt9Xp60qlG4c9lsew
 U+yjbH3OdLYtgrqCfEk8AtVlqQGKAF+FFe0SnGTVDTF5Ddw3jQDuQxdhGsjM0v/wq0
 cqKnM+C95jakxigCMhf6kb0wGzXx1WZgbdHOjBe4=
X-Riseup-User-ID: 872E29627DD76E4FF5C5DF32076E0D07298CC61DEAD3E272343D93186CA056E9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4TqjzY0ZRFzFvsg;
 Wed,  6 Mar 2024 20:03:20 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 0/7] Additions to "Reimplement line-per-line pixel
 conversion for plane reading" series
Date: Wed, 06 Mar 2024 17:03:07 -0300
Message-Id: <20240306-louis-vkms-conv-v1-0-5bfe7d129fdd@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPvL6GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYwMz3Zz80sxi3bLs3GLd5Py8Ml0zQ2Mzo7Q0Q6PEJAsloK6CotS0zAq
 widGxtbUA+r/I92EAAAA=
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
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

These are some patches that add some fixes/features to the series by
Louis Chauvet[1], it was based on top of the patches from v4.

Patches #2 and #3 should be amended to "[PATCH v4 11/14] drm/vkms: Add
YUV support". To make patch #3 work, we need patch #1. So, please, add
it before the patch that #2 and #3 amend to.

Patches #4 to #6 should be amended to "[PATCH v4 14/14] drm/vkms: Create
KUnit tests for YUV conversions". While doing the additions, I found
some compilation issues, so I fixed them (patch #4). That's when I
thought that it would be good to add some documentation on how to run
them (patch #7), this patch should be added to the series as new patch.

[1]: https://lore.kernel.org/r/20240304-yuv-v4-0-76beac8e9793@bootlin.com

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
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: jeremie.dautheribes@bootlin.com
Cc: miquel.raynal@bootlin.com
Cc: thomas.petazzoni@bootlin.com
Cc: seanpaul@google.com
Cc: marcheu@google.com
Cc: nicolejadeyee@google.com

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
Arthur Grillo (7):
      drm: Fix drm_fixp2int_round() making it add 0.5
      drm/vkms: Add comments
      drm/vkmm: Use drm_fixed api
      drm/vkms: Fix compilation issues
      drm/vkms: Add comments to format tests
      drm/vkms: Change the gray RGB representation
      drm/vkms: Add how to run the Kunit tests

 Documentation/gpu/vkms.rst                    |  11 +++
 drivers/gpu/drm/vkms/tests/vkms_format_test.c |  81 +++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h               |   4 +
 drivers/gpu/drm/vkms/vkms_formats.c           | 101 +++++++++++++++++++-------
 include/drm/drm_fixed.h                       |   2 +-
 5 files changed, 165 insertions(+), 34 deletions(-)
---
base-commit: 9658aba38ae9f3f3068506c9c8e93e85b500fcb4
change-id: 20240306-louis-vkms-conv-61362ff12ab8

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>

