Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE71D3D15A4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB556E894;
	Wed, 21 Jul 2021 17:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DB96E894
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:55:33 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id q190so2897339qkd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 10:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ck6w+ozmARoHM7fPwd7UrPrPUBhHX94Jf9tLQFozCx0=;
 b=T9vL87nQa/Pz+KQ//WVPNZ++hQz/xLF1IASV3dblbhtDRc3rUwG/4j2OOUCgpGk5v8
 Nlh+jgeS/AIc3ckm/BHWcKI0t4w7beXQzIoLJVOSAmEKsL0HYxE2wuY0Gpu9BM05rHVU
 +L0pcLchYvegtks0/ZFb8SZu1RjjfwchMmroh8+FcXN7t/KkFsC2PjKs7ta2fdwNJ0tS
 cpTL8dSSOHcGrtPUyoAWf7i84wNLS1yPumEgx9B/HeuJJsSXv+xKF346UQl9TUSQd1EW
 0HpRsG070OQ/acdmOl4ur+3XL6s1VncRsPjxWh8Pl5LYWKbcTxzy+XnCivKUyhS3mjr1
 tgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ck6w+ozmARoHM7fPwd7UrPrPUBhHX94Jf9tLQFozCx0=;
 b=R5zJRCH5jRH9B7JwHgz6+OaRoWYbCcP2A/4Q+6w2/JPBuJuCsV/peInbwnAaCI0jIM
 Yx2QOAllQ2pNetAC04/wc+UqafKKnveOA8SseuK2eg6AuHNc7TPgopLI+O72Wmeeyala
 0iXTuC1Rk8WKGT9zNBa7p1FdaW7TkhS/296BSXzUTluU87bc0HgdlWeN423IElDSMSC1
 e1W8jK91kRKVx6dWRcZE4/JI6F/UX4anXr/5Bim3P1vs8yoSJQxU67KaOPSqjhtEGmMH
 rWLO5/0yM0Pke4aSlqUcD0gpXkLZ63skDWuhriP5GyZZg4dfSSW7GmE9FdfGBLNiX32C
 LAyQ==
X-Gm-Message-State: AOAM531Daw+AQ7uH9N244jFDRJOjSNBX9/ihUsUY105y+Xr/4q310M5t
 7serl8rX2kxuBmQdM2UEtnbQGhIQt171+A==
X-Google-Smtp-Source: ABdhPJyVRPh8HA3N/m69uJ6njJQbvaQyJmTZyG3AIMKiCRLMKqmYjBYkidpUtqxVTHt8iZXoQHOHmg==
X-Received: by 2002:a37:38c:: with SMTP id 134mr24533918qkd.182.1626890132300; 
 Wed, 21 Jul 2021 10:55:32 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id x14sm4029407qts.13.2021.07.21.10.55.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Jul 2021 10:55:31 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@linux.ie,
 daniel.vetter@ffwll.ch
Subject: [RESEND PATCH v6 00/14] drm/trace: Mirror DRM debug logs to tracefs
Date: Wed, 21 Jul 2021 13:55:07 -0400
Message-Id: <20210721175526.22020-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Hi all,
I just had the pleasure of rebasing this set on our CrOS downstream
kernel and wanted to resend it for consideration once again. There
hasn't been any resistence to the set AFAIK, just perhaps not enough
motivation for anyone to hit the go bit. There was some interest from
the msm folks about a month ago, and it has been an invaluable tool
on CrOS for the past ~year. Hopefully someone can dig into this and
provide some feedback so we can move this forward.

Thanks!

Sean

Changes since last v6:
-Rebased on drm-tip

Original v6 of the set available here:
https://patchwork.freedesktop.org/series/78133/
https://lore.kernel.org/dri-devel/20200818210510.49730-1-sean@poorly.run/

Sean Paul (14):
  drm/mipi_dbi: Convert pr_debug calls to DRM_DEBUG_DRIVER
  drm/sil164: Convert dev_printk to drm_dev_dbg
  drm/i915/utils: Replace dev_printk with drm helpers
  drm/msm/dpu: Replace definitions for dpu debug macros
  drm/print: rename drm_debug* to be more syslog-centric
  drm/amd: Gate i2c transaction logs on drm_debug_syslog
  drm/etnaviv: Change buffer dump checks to target syslog
  drm/nouveau: Change debug checks to specifically target syslog
  drm/i915: Change infoframe debug checks to specify syslog
  drm/print: Add drm_debug_category_printer
  drm/mst: Convert debug printers to debug category printers
  drm/i915: Use debug category printer for welcome message
  drm/atomic: Use debug category printer for atomic state printer
  drm/print: Add tracefs support to the drm logging helpers

 Documentation/gpu/drm-uapi.rst               |   6 +
 drivers/gpu/drm/amd/amdgpu/smu_v11_0_i2c.c   |   4 +-
 drivers/gpu/drm/drm_atomic_uapi.c            |   2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c        |   9 +-
 drivers/gpu/drm/drm_drv.c                    |   3 +
 drivers/gpu/drm/drm_mipi_dbi.c               |   8 +-
 drivers/gpu/drm/drm_print.c                  | 242 ++++++++++++++++---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |   8 +-
 drivers/gpu/drm/i2c/sil164_drv.c             |  12 +-
 drivers/gpu/drm/i915/display/intel_display.c |   4 +-
 drivers/gpu/drm/i915/i915_drv.c              |   3 +-
 drivers/gpu/drm/i915/i915_utils.c            |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h      |  20 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h        |   4 +-
 include/drm/drm_print.h                      |  96 +++++++-
 15 files changed, 331 insertions(+), 95 deletions(-)

-- 
Sean Paul, Software Engineer, Google / Chromium OS

