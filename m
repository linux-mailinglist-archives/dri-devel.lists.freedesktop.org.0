Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8EB8C7773
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E2210ED0F;
	Thu, 16 May 2024 13:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E1AgNavO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B16010ED0F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:20:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48FE01C0009;
 Thu, 16 May 2024 13:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/ArYlTqNc6RWGmShff/lcwa9Oxf7clXXs2cm446Spw0=;
 b=E1AgNavOJfLHySqAlFp8KUaKYZnT2tBfV1qO4l7MXGQjjGq0hiGoi3oulzjYJVeM0ya6O8
 Kk7jxHzjM37NE9Y/fhJzHxoyWrisKR5M4/G4850+cC8rRGReok+GO84HF/jnmon1CP1FNZ
 4h56Fp6jGbWW5v3+9Ro7uKt0RTqNLkBYK8O+jIoF0gVDqTv5JT9fqn8dLHwyuzrUwoJfvk
 5Wd4nBn9FhKPGLI4Ijv+g7XOlOa12kNkxuN5+QvqZleRhAP5Y4IeuLubraCr15UTJOqp3a
 z+N3mwOKrbpgY5lUea2AiCeTPqDJ1QGcMZBC5YOX90o57B8DBeZky758abZzjg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 0/3] drm/vkms: Reimplement line-per-line pixel conversion
 for writeback
Date: Thu, 16 May 2024 15:20:04 +0200
Message-Id: <20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQIRmYC/x2MWwqAIBAArxL7nWBLVnSVCEnbaiksNHoQ3T3pa
 5iPmQcCeaYAdfKAp4MDry5KliZgp86NJLiPDigxl4goTs87mc7OemFH2tw/RZWXqpDKZL2yEOP
 N08DXP27a9/0A6hJi8mgAAAA=
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Dpc70NziaxnrQCx0B5Ukpj1EKWrj914F9Ksg/Qy8Ihw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRggHSLSv2AbYO8SVcpvFqYDZK0xI2Wn0i1gTB
 68XbWyE6uiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYIBwAKCRAgrS7GWxAs
 4pY1D/9uuCQYR00dJIqjOdYWZe4UcthceV4K/kxpRCxeBNR4mgleY/t6rQvjrYH8wcWA62sUFYL
 ajkQuSQeL9MAEPQYJbnalmgdMK3IuQgZIEB6EQijAeCWfZztmJFvtewJx2Sl84k29JY0Mrto79g
 hkGsjXwvVWJJ8CMHh5zBvplyk5S+U33V3//zh3s6/QBklyt0hFwRCB3+4QBmXuvdZHctuKkVTF9
 rfPi+AhA1faT55RltIJ8FMFoo4m4QV6Uy5IvHSr0ZvrfXj7N+IkJCw6q/+i3yPDVZaRzXJ2745d
 xM3PIqkgavMz1oa4ae3GCkO3b68q9xe2HMqKra22S87kgWpj8ZEast1Nu1iqAlnBrnyk/PfXK1U
 KJ8hpXmMYuDmCP09vt1n0qjiNSpCDO7g/DcuRRyz0YzR2YEqQcIv3+iYn5bxtI/uIC0hy8NOy2r
 vG1/SVO6Q4qJqEkkME3FJpiMWKu4iy9cYnBrs5Lk0DD/dwKMEEBCAa1VrV5N+QCeYhv3ubNkZu3
 48oyeZs7EXppT0d/JJ6dXksiUFWYXWAuZmaTBPX8xy7kjRXmZtQBKL/s4Tj3Hd1If7D/0BswqpS
 czcGGJtIXbne1oAwAUMwg1VjYTyORvKg/+1VH+eTSdG3AkhzWquCPsAbyLqVhf5BNXqfjqnRauV
 Nh6MwTZkreneDxw==
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

This series re-introduce the line-by-line algorithm. This is simpler than 
the read part because no rotation/translations are involved. 

PATCH 1/2 is the re-introduction itself
PATCH 2/2 is a proposition to avoid code repetition using a "big" macro.

This series depends on [1].

[1]: https://lore.kernel.org/all/20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (3):
      drm/vkms: Re-introduce line-by-line algorithm for writeback
      drm/vkms: Add a macro for write_line functions
      drm/vkms: Add support for XRGB2101010

 drivers/gpu/drm/vkms/vkms_composer.c  |  18 ++++++
 drivers/gpu/drm/vkms/vkms_drv.h       |  20 ++++---
 drivers/gpu/drm/vkms/vkms_formats.c   | 104 +++++++++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_formats.h   |   2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |   6 +-
 5 files changed, 105 insertions(+), 45 deletions(-)
---
base-commit: 335e3c4175a113d1f5b089c4eb1738590d193fbc
change-id: 20240222-writeback_line_by_line-8475605b1d5c

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

