Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9516E6569
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D7B10E13C;
	Tue, 18 Apr 2023 13:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56DF10E13C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Og7PKoBY+s5HYgjNQNvhYJoHLRkmp50bN3zkgJgwr/U=; b=Vpj9BdrJM1l31ens4s0X9tS+FX
 QuNJEFIn0BwMxd/x/JPfgFewjda5Mp2iPxV+RMQtU9d1uRCXiFjhDrACaHvV1msExQ/wA/xhRJF4b
 BtUK53d8EDtQlWr85UKCiMjT8B+WRt+pxnAO8C6SDZzvkzYm7LK+UiP3gkL+yZL3SvjUkbFx2/r9n
 c0HKOM9Na+CHvR+KX2JPC3lfEdTRDm07rBitVe81T4h87jfGkbvz+RlDFV2btv75eDVyYVPcExbuk
 iqZtXgha26zpFMk3b6jfzRRGPX87EjwocSjLGJfqIno6MMKvBmWAIVavdksp+sTAjl2CezLqZz5+I
 s4aBDLRg==;
Received: from [143.107.183.66] (helo=bowie.hotspot.icmc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pol3L-0041UK-7C; Tue, 18 Apr 2023 15:07:23 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v4 0/6] drm/vkms: introduce plane rotation property
Date: Tue, 18 Apr 2023 10:05:20 -0300
Message-Id: <20230418130525.128733-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset implements all possible rotation value in vkms. All operations
were implemented by software by changing the way the pixels are read. The way
the blending is performed can be depicted as:

- rotate-0:
    (x) ---->
    ----------------------
(y) |                    |
  | |                    |
  | |                    |
  ˇ |                    |
    ----------------------

- rotate-90:
    <---- (y)
    ----------------------
(x) |                    |
  | |                    |
  | |                    |
  ˇ |                    |
    ----------------------

- rotate-180:
    <---- (x)
    ----------------------
(y) |                    |
  ^ |                    |
  | |                    |
  | |                    |
    ----------------------

- rotate-270:
    (y) ---->
    ----------------------
(x) |                    |
  ^ |                    |
  | |                    |
  | |                    |
    ----------------------

- reflect-x:
    <---- (x)
    ----------------------
(y) |                    |
  | |                    |
  | |                    |
  ˇ |                    |
    ----------------------

- reflect-y:
    (x) ---->
    ----------------------
(y) |                    |
  ^ |                    |
  | |                    |
  | |                    |
    ----------------------

The patchset was tested with IGT's kms_rotation_crc tests and also with some
additional tests [1] for the reflection operations.

In order to avoid code duplication, I introduced a patch that isolates the
pixel format convertion and wraps it in a single loop.

I tried to apply Ville's suggestion to avoid hand rolled coordinate
calculation stuff. Although I couldn't apply all the code suggested by
Ville, I was able to remove all the hardcoded code related to the x-offset.
As VKMS' composition is performed by line, I still need to indicate the
right pixel, which means that I still have some hardcoded code. Thanks for
the suggestion, Ville! It really reduced the code complexity. 

v1 -> v2: https://lore.kernel.org/dri-devel/20230406130138.70752-1-mcanal@igalia.com/T/

* Add patch to isolate pixel format conversion (Arthur Grillo).

v2 -> v3: https://lore.kernel.org/dri-devel/20230414135151.75975-1-mcanal@igalia.com/T/

* Use cpp to calculate pixel size instead of hard-coding (Arthur Grillo).
* Don't use the x coordinate in the pixel_read functions (Arthur Grillo).
* Use drm_rotate_simplify() to avoid hard-coding rotate-180 (Ville Syrjälä).
* Use u8* to input the src_pixels instead of using u16*.

v3 -> v4: https://lore.kernel.org/dri-devel/20230417121056.63917-1-mcanal@igalia.com/T/

* Create a original rectangle and a rotated rectangle and use the original
  rectangle to offset the x-axis (Ville Syrjälä).

[1] https://patchwork.freedesktop.org/series/116025/

Best Regards,
- Maíra Canal

Maíra Canal (6):
  drm/vkms: isolate pixel conversion functionality
  drm/vkms: add rotate-0 and reflect-x property
  drm/vkms: add reflect-y and rotate-180 property
  drm/vkms: add rotate-90 property
  drm/vkms: add rotate-270 property
  drm/vkms: drop "Rotation" TODO

 Documentation/gpu/vkms.rst           |   2 +-
 drivers/gpu/drm/vkms/vkms_composer.c |  38 ++++++--
 drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
 drivers/gpu/drm/vkms/vkms_formats.c  | 139 +++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_formats.h  |   2 +-
 drivers/gpu/drm/vkms/vkms_plane.c    |  16 ++-
 6 files changed, 117 insertions(+), 86 deletions(-)

-- 
2.39.2

