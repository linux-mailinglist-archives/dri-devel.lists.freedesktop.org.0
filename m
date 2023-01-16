Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9A866BBB3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 11:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDB410E2CE;
	Mon, 16 Jan 2023 10:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7B410E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 10:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xm3GmY5rsZahfepwo5CbyHG2fugF9HusQKwMVvxqNQY=; b=lTBck8hjnnke/ozgCOI7lvyHpu
 QI7CCUwp+kg/t7/2ATuWXeOMZ6x4JY22rDdOeV3FUzuPgOpghx22Ei6hHWWmRFviGn45+W9qOvfWQ
 fASiK05WvaV4EmXDTqhNBYgJ2C7ZqYPd2ve65rJOIVvgI+XqIlNVzxxu/GFklhGmfCLe6ZIxdGNaj
 GDGuUBdR7m5fXfFB2ufvuwQStTcbJ3XwuhA/40oC61AhkvYy48CldUWQaU8f7rbly6ecRPVDP/v4z
 su4e4TlOfVz2peA+DXaxGD4E0ZWMg4uWbcQkneMuq5oFmj0fdXTR3D5iZRzWHXlRs+dPVJrxlcr3E
 FVz+kA4Q==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHMkI-009j44-3r; Mon, 16 Jan 2023 11:29:42 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Brian Starkey <brian.starkey@arm.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 0/6] drm/debugfs: Make the debugfs structure more generic
Date: Mon, 16 Jan 2023 07:28:10 -0300
Message-Id: <20230116102815.95063-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
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
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is the first step to introduce a debugfs structure to KMS objects
and it is inspired by the feedback provided in [1]. Thanks, Jani and Daniel for
all the feedback provided!

This first step is making the current API more generic and preparing it to
receive the KMS objects in the future. Moreover, this will help to avoid
copypasting when expanding the API.

Make the debug structure more generic by:

- Passing the right pointer to the functions as an explicit parameter. So, the
  show function signature should be

    int show(struct seq_file *m, struct drm_device *dev, void *data)

  Note that with this approach, the show callback doesn't need to use the struct
  drm_debugfs_entry anymore.

- Switch the pointer in struct drm_debugfs_entry to void *, so that, in the
  future, the struct drm_debugfs_entry can receive different types of DRM
  objects (struct drm_device, struct drm_connector, struct drm_crtc...).

- Switch the show callback pointer to void * and cast it in the show callback
  wrapper. This way in the future we can create different callback wrappers and
  cast each one to the proper function signature.

- Add a struct wrapper for debugfs_list and debugfs_mutex, and also create
  helpers to init the list, destroy the list, register the list's files and add
  files to the list.

[1] https://lore.kernel.org/dri-devel/20230111173748.752659-1-mcanal@igalia.com/T/

Any feedback is welcomed!

Best Regards,
- Maíra Canal

Maíra Canal (6):
  drm/debugfs: Introduce wrapper for debugfs list
  drm/debugfs: Make drm_device use the struct drm_debugfs_list
  drm/debugfs: Create wrapper to add files to debugfs list
  drm/debugfs: Create wrapper to register debugfs
  drm/debugfs: Make the struct drm_debugfs_entry independent of DRM
    device
  drm/debugfs: Make the show callback pass the pointer to the right
    object

 drivers/gpu/drm/arm/hdlcd_drv.c       |  8 +--
 drivers/gpu/drm/drm_atomic.c          |  4 +-
 drivers/gpu/drm/drm_client.c          |  5 +-
 drivers/gpu/drm/drm_debugfs.c         | 74 ++++++++++++++++-----------
 drivers/gpu/drm/drm_drv.c             |  7 +--
 drivers/gpu/drm/drm_framebuffer.c     |  4 +-
 drivers/gpu/drm/drm_gem_vram_helper.c |  2 +-
 drivers/gpu/drm/drm_internal.h        | 11 ++++
 drivers/gpu/drm/gud/gud_drv.c         |  5 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c     | 16 ++----
 drivers/gpu/drm/vc4/vc4_bo.c          |  4 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c     |  6 +--
 drivers/gpu/drm/vc4/vc4_hdmi.c        |  6 +--
 drivers/gpu/drm/vc4/vc4_hvs.c         |  8 +--
 drivers/gpu/drm/vc4/vc4_v3d.c         |  4 +-
 drivers/gpu/drm/vkms/vkms_drv.c       |  4 +-
 include/drm/drm_debugfs.h             | 34 +++++++++---
 include/drm/drm_device.h              | 10 +---
 18 files changed, 110 insertions(+), 102 deletions(-)

-- 
2.39.0

