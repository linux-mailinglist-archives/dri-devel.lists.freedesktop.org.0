Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60263180C87
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1615C6E8F6;
	Tue, 10 Mar 2020 23:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA5C89E69
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id m9so6895786wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+AaYfOR1wnxBM1UyhiMJATpoI1M1VsyY4kmM1JkCJM=;
 b=sFvOVqT4cituQqCiIE/3IQKTicsxfagkwyO34fOf7aQxw6F57CglO7DZUQFYKQk1fD
 2/1/3kKeVnKiQa26Ed7Hb7MzQ7BgVK/iU2/H4C+AlTsSh0TgbYWRClRp/OSfyRzLTve3
 2vCer/gGbmFEyolW1HyAEGmtCmby8joUH/dKC5j/OHIUBor8h8JayH6iFZBBvt7HOXkS
 zC1LzLn+9TNfhjveh6CBKvfUtk/7vqlyl5fzd5JEHDadQ8goufiHv6JKPA6mv1su+1yI
 nT8GQSnDXqZbsAL8JUDmR3nHFLatEYgWKNYiKFdf3w86EZW0WK/w5b1JWbo7Zh3QU3GP
 pWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+AaYfOR1wnxBM1UyhiMJATpoI1M1VsyY4kmM1JkCJM=;
 b=ZkO3osIe1pfBjpcKESOB5rnWi2f9loWmBba0RPjs/J1YO9SlSQ4IkDZdUvZtkzlF1c
 eP4xXA2ZKyOURutns837JsRz48X1xBYKq8I1A12YdLe+HCioEsp6Eq3W0Cu8mgTRGH+A
 gwOw6zrRe/gHteNc5sd3WBXuDCeil2c7n8tJvHtIjqis9DQ0/q6a794TXe1VNd5P0qa6
 xjFS/dzCaKfpe4Zuoc3kWprPgWe//Yhn8D9rvDxVLVIFWJToB/lNTTY2NPXCQTfj49Dl
 JhbF95mbOnmy1s2Dqr7kHOzJrrD9Ntr0fYDN2UyJul3RWSEajbPSpdcWgtwPzWd13p+U
 CMBw==
X-Gm-Message-State: ANhLgQ2bPRn7am/idtxQ6dv4yx41PFVonxqUqJz56WUKq37CXXtMvKJS
 j8HnUOtR5CnKY9e7NFAgRvg=
X-Google-Smtp-Source: ADFU+vtIMlTgA2JO19QReP8CAkx20BGfjqLewkecDbptY9AHHaVUrpZfIUTw0mEzQHyqaJ9AmhBAUA==
X-Received: by 2002:adf:f70f:: with SMTP id r15mr27908592wrp.269.1583847087056; 
 Tue, 10 Mar 2020 06:31:27 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:25 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/17] drm: subsytem-wide debugfs functions refactor
Date: Tue, 10 Mar 2020 16:31:04 +0300
Message-Id: <20200310133121.27913-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series includes work on various debugfs functions both in drm/core
and across various drivers in the subsystem.
Since commit 987d65d01356 (drm: debugfs: make drm_debugfs_create_files()
never fail), drm_debugfs_create_files() does not fail and only returns
zero. This series therefore removes the left over error handling and
checks for its return value across drm drivers.

As a result of these changes, most drm_debugfs functions are converted
to return void in this series. This also enables the
drm_driver, debugfs_init() hook to be changed to return void. 

v2: individual driver patches have been converted to have debugfs
functions return 0 instead of void to prevent breaking individual driver
builds.
The last patch then converts the .debugfs_hook() and its users across
all drivers to return void.

Wambui Karuga (17):
  drm/tegra: remove checks for debugfs functions return value
  drm/tilcdc: remove check for return value of debugfs functions.
  drm/v3d: make v3d_debugfs_init() return 0
  drm/vc4: remove check of return value of drm_debugfs functions
  drm/arc: make arcgpu_debugfs_init() return 0.
  drm/arm: make hdlcd_debugfs_init() return 0
  drm/etnaviv: remove check for return value of
    drm_debugfs_create_files()
  drm/msm: remove checks for return value of drm_debugfs_create_files()
  drm/sti: remove use of drm_debugfs functions as return values
  drm/vram-helper: make drm_vram_mm_debugfs_init() return 0
  drm/nouveau: make nouveau_drm_debugfs_init() return 0
  drm/pl111: make pl111_debugfs_init return 0
  drm/omap: remove checks for return value of drm_debugfs functions
  drm/i915: have *_debugfs_init() functions return void.
  drm: make various debugfs_init() functions return 0
  drm/debugfs: remove checks for return value of drm_debugfs functions.
  drm: convert .debugfs_init() hook to return void.

 drivers/gpu/drm/arc/arcpgu_drv.c              |  7 +--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  7 +--
 drivers/gpu/drm/arm/malidp_drv.c              |  3 +-
 drivers/gpu/drm/drm_atomic.c                  |  8 ++--
 drivers/gpu/drm/drm_client.c                  |  8 ++--
 drivers/gpu/drm/drm_crtc_internal.h           |  2 +-
 drivers/gpu/drm/drm_debugfs.c                 | 45 +++++--------------
 drivers/gpu/drm/drm_framebuffer.c             |  8 ++--
 drivers/gpu/drm/drm_gem_vram_helper.c         | 14 ++----
 drivers/gpu/drm/drm_internal.h                |  2 +-
 drivers/gpu/drm/drm_mipi_dbi.c                |  6 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 18 ++------
 .../drm/i915/display/intel_display_debugfs.c  |  8 ++--
 .../drm/i915/display/intel_display_debugfs.h  |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  8 ++--
 drivers/gpu/drm/i915/i915_debugfs.h           |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     | 18 +++-----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 ++----
 drivers/gpu/drm/msm/msm_debugfs.c             | 23 +++-------
 drivers/gpu/drm/msm/msm_debugfs.h             |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |  2 +-
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 26 +++++------
 drivers/gpu/drm/nouveau/nouveau_debugfs.h     |  8 ++--
 drivers/gpu/drm/omapdrm/omap_debugfs.c        | 29 +++---------
 drivers/gpu/drm/omapdrm/omap_drv.h            |  2 +-
 drivers/gpu/drm/pl111/pl111_debugfs.c         |  8 ++--
 drivers/gpu/drm/pl111/pl111_drm.h             |  2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c             | 21 +++------
 drivers/gpu/drm/qxl/qxl_drv.h                 | 13 +++---
 drivers/gpu/drm/qxl/qxl_ttm.c                 |  6 +--
 drivers/gpu/drm/sti/sti_compositor.c          |  6 +--
 drivers/gpu/drm/sti/sti_compositor.h          |  4 +-
 drivers/gpu/drm/sti/sti_crtc.c                |  2 +-
 drivers/gpu/drm/sti/sti_cursor.c              | 14 +++---
 drivers/gpu/drm/sti/sti_drv.c                 | 16 ++-----
 drivers/gpu/drm/sti/sti_dvo.c                 | 13 +++---
 drivers/gpu/drm/sti/sti_gdp.c                 |  7 +--
 drivers/gpu/drm/sti/sti_hda.c                 | 13 +++---
 drivers/gpu/drm/sti/sti_hdmi.c                | 13 +++---
 drivers/gpu/drm/sti/sti_hqvdp.c               | 12 ++---
 drivers/gpu/drm/sti/sti_mixer.c               | 10 ++---
 drivers/gpu/drm/sti/sti_mixer.h               |  2 +-
 drivers/gpu/drm/sti/sti_tvout.c               | 13 +++---
 drivers/gpu/drm/sti/sti_vid.c                 |  8 ++--
 drivers/gpu/drm/sti/sti_vid.h                 |  2 +-
 drivers/gpu/drm/tegra/dc.c                    | 11 +----
 drivers/gpu/drm/tegra/drm.c                   |  8 ++--
 drivers/gpu/drm/tegra/dsi.c                   | 11 +----
 drivers/gpu/drm/tegra/hdmi.c                  | 11 +----
 drivers/gpu/drm/tegra/sor.c                   | 11 +----
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           | 17 ++-----
 drivers/gpu/drm/v3d/v3d_debugfs.c             |  8 ++--
 drivers/gpu/drm/v3d/v3d_drv.h                 |  2 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c             | 11 ++---
 drivers/gpu/drm/vc4/vc4_drv.h                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_debugfs.c      |  3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  2 +-
 include/drm/drm_client.h                      |  2 +-
 include/drm/drm_debugfs.h                     | 16 +++----
 include/drm/drm_drv.h                         |  2 +-
 include/drm/drm_gem_vram_helper.h             |  2 +-
 include/drm/drm_mipi_dbi.h                    |  2 +-
 63 files changed, 204 insertions(+), 380 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
