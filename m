Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCEB650B2A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 13:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C16210E0C7;
	Mon, 19 Dec 2022 12:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E784D10E0C7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 12:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/tluQ4TFrQ3TOyrt0gts8VOJdh/QSCw6IFv5qhZrYGo=; b=puVSV3sDX1xa9WZfvCJhiypw2B
 QN7QKBziPoObhy+nWLHx12qSk2dYzqLv2GnYHTISTiWcQZVuaw++8miFp4AONAChwgqhb5nOh5hLu
 bNla3xQGXizq9vph1J/SUF2VO0rigzmsdjEIZGF6tICIx0HUe09pKh0MbwGpLkWOQjk6HWu/W6T9X
 wWYHItTgqqe/vJT8ve/S6O5pHXb9sNM3O4BVhEQ8HfbmcaZu8pIH6UNX4vFM8n0s9Uj2baimPx/t4
 kMajJtxWuurwpcOiQ7fl5gIv4fhGOiijjS23ttsarADNDInF14HXE5ZcLThlppu32EzddHF8hIuHs
 zQ6L42Ig==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p7Euq-006HsS-3O; Mon, 19 Dec 2022 13:06:44 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v4 0/7] Introduce debugfs device-centered functions
Date: Mon, 19 Dec 2022 09:06:14 -0300
Message-Id: <20221219120621.15086-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces the initial structure to make DRM debugfs more
device-centered and it is the first step to drop the
drm_driver->debugfs_init hooks in the future [1].

Currently, DRM debugfs files are created using drm_debugfs_create_files()
on request. The first patch of this series makes it possible for DRM devices
for creating debugfs files during drm_dev_register(). For it, it introduces
two new functions that can be used by the drivers: drm_debugfs_add_files()
and drm_debugfs_add_file(). The requests are added to a list and are created
all at once during drm_dev_register(). Moreover, the first patch was based on
this RFC series [2].

The main difference between the RFC series and the current series is the
creation of a new fops structure to accommodate the new structs and, also,
the creation of a new drm_debugfs_open. Moreover, the new series uses
device-managed allocation, returns memory allocation errors, and converts
more drivers to the new structure.

Moreover, since v3, the ability to create debugfs files at late_register hooks was
added. In previous versions, modeset components weren't able to create debugfs
files at late_register hooks as the registration of drm_minor happens before the
registration of the modeset abstractions. So, the third patch fixes this problem
by adding a drm_debugfs_late_register() function. Thanks to Melissa Wen for
catching this problem!

Apart from the third patch, the series looks similiar from its last version.

[1] https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/todo.rst#n506
[2] https://lore.kernel.org/dri-devel/20200513114130.28641-2-wambui.karugax@gmail.com/

Best Regards,
- Maíra Canal

---

v1 -> v2: https://lore.kernel.org/dri-devel/20221122190314.185015-1-mcanal@igalia.com/T/#t

- Fix compilation errors in the second patch (kernel test robot).
- Drop debugfs_init hook from vkms (Maíra Canal).
- Remove return values and error handling to debugfs related
functions (Jani Nikula).
- Remove entry from list after the file is created, so that drm_debugfs_init
can be called more than once (Maíra Canal).

v2 -> v3: https://lore.kernel.org/dri-devel/20221123220725.1272155-1-mcanal@igalia.com/

- Rebase on top of drm-misc-next

v3 -> v4: https://lore.kernel.org/dri-devel/20221207132325.140393-1-mcanal@igalia.com/

- Add Maxime's Reviewed-by tags
- Add the ability to create debugfs files at late_register hooks (Melissa Wen).

---

Maíra Canal (7):
  drm/debugfs: create device-centered debugfs functions
  drm: use new debugfs device-centered functions on DRM core files
  drm/debugfs: create debugfs late register functions
  drm/vc4: use new debugfs device-centered functions
  drm/v3d: use new debugfs device-centered functions
  drm/vkms: use new debugfs device-centered functions
  drm/todo: update the debugfs clean up task

 Documentation/gpu/todo.rst            |   9 +--
 drivers/gpu/drm/drm_atomic.c          |  11 ++-
 drivers/gpu/drm/drm_client.c          |  11 ++-
 drivers/gpu/drm/drm_debugfs.c         | 102 +++++++++++++++++++++++---
 drivers/gpu/drm/drm_drv.c             |   3 +
 drivers/gpu/drm/drm_framebuffer.c     |  11 ++-
 drivers/gpu/drm/drm_gem_vram_helper.c |  11 ++-
 drivers/gpu/drm/drm_internal.h        |   5 ++
 drivers/gpu/drm/drm_mode_config.c     |   2 +
 drivers/gpu/drm/v3d/v3d_debugfs.c     |  22 +++---
 drivers/gpu/drm/vc4/vc4_bo.c          |  10 +--
 drivers/gpu/drm/vc4/vc4_crtc.c        |   7 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c     |  36 ++-------
 drivers/gpu/drm/vc4/vc4_dpi.c         |   5 +-
 drivers/gpu/drm/vc4/vc4_drv.c         |   1 -
 drivers/gpu/drm/vc4/vc4_drv.h         |  32 ++------
 drivers/gpu/drm/vc4/vc4_dsi.c         |   6 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c        |  12 +--
 drivers/gpu/drm/vc4/vc4_hvs.c         |  24 ++----
 drivers/gpu/drm/vc4/vc4_v3d.c         |  14 +---
 drivers/gpu/drm/vc4/vc4_vec.c         |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.c       |  17 ++---
 include/drm/drm_debugfs.h             |  41 +++++++++++
 include/drm/drm_device.h              |  15 ++++
 24 files changed, 233 insertions(+), 180 deletions(-)

-- 
2.38.1

