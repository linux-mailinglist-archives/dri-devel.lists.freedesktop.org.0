Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E763B8581
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3239A6E9F5;
	Wed, 30 Jun 2021 14:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F9A6E9F4;
 Wed, 30 Jun 2021 14:55:22 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d12so2692985pfj.2;
 Wed, 30 Jun 2021 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DbLagrqX9GyFiYDlx5GodYpslzbdCAvx8G0gowIUudY=;
 b=rnIF81Edc3BhqlLAhT7hsmv4IGJ2tTSllDOEblCmt2DkJCoHAiTvkhLTKVabX/zEIp
 jVmFNxGLpzqMD79Pwcu+S7EkwFEuzn0yfiy5i1M1TxQD6Io14xq7f1hVfw7ORpo24yXs
 u9Zx3dPG0dOmI5ovMmchBx9LUXfwLVeiJOTMUsPvr5ax+VfBqaff4BH4Aj35xcqN0pYW
 dTjvfELHQYsZiJbc+veYEh1PNrZMzYfNa4PqAkJZuJSjGDD1yHsp6ce8uQKoJZG7hVQf
 Gee2BSaK/VndKuhsqjo+Bh6H+wSDaFmkKZHpePJ+kJdIVhrEIPjzplsJDx3aj6d2DJcR
 4JpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DbLagrqX9GyFiYDlx5GodYpslzbdCAvx8G0gowIUudY=;
 b=lH/WYuRx1v7Tyo/PXjCa6ePK/1XzDy/G5vMPJJ5hODNwwcEZfPKprxNLgwvoiyhA4S
 nhdyS2a6r5GxHPX2d1ow2PWBpdprwWPI1YoquuDJFfLfghtfJpLslYE+R9O/rZv9UX18
 GDkB6YdfQtWvuWDed5+feqxT6yoUymXPKvaaE9/WJ5NGpDmceM5nV7FRCQbnQsVPcrJz
 sk6QT6lOREqgIryN+f4AKwFFmYV5D6coQ3UIKwHskZCSxWo7GBXKKOQZoLMpkKnFqKsz
 WVlUqG1i2neb6qoRtp7AAGncx/dCvzni3A10wEoJO4PD1Tnyl57j3wtW8p6fXdZNHP1K
 05Rw==
X-Gm-Message-State: AOAM532GXO6vFLe20XsGwjKP/0sBTXrqXBp16XZIqNalbHAdLSEi6sum
 sLUJdusXUs6bmUgX0deOsD4=
X-Google-Smtp-Source: ABdhPJy20ySZ9X53g3XT2CVgt7VxxhHPKHPP85Vof/2Cvj1fsukFMR41XOIOAlZsTMRR6qDi5I1c+A==
X-Received: by 2002:a65:608a:: with SMTP id t10mr8423416pgu.311.1625064921816; 
 Wed, 30 Jun 2021 07:55:21 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d13sm7157234pjr.49.2021.06.30.07.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 07:55:21 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v6 0/4] drm: address potential UAF bugs with drm_master ptrs
Date: Wed, 30 Jun 2021 22:54:00 +0800
Message-Id: <20210630145404.5958-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into four patches:

1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.

2. Move a call to _drm_lease_held() out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find().

3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

4. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

Changes in v5 -> v6:
- Patch 2:
Add patch 2 to the series. This patch moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.

- Patch 4:
Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.

Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.

Modify comparison to NULL into "!master", as suggested by the intel-gfx CI.

Changes in v4 -> v5:
- Patch 1:
Add patch 1 to the series. The changes in patch 1 do not apply to stable because they apply to new changes in the drm-misc-next branch. This patch moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.

Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.

- Patch 3:
Move changes to drm_connector.c into patch 1.

Changes in v3 -> v4:
- Patch 3:
Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/

Additionally, inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.

- Patch 4:
Modify kerneldoc formatting.

Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

Changes in v2 -> v3:
- Patch 3:
Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 4:
Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 4:
Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (4):
  drm: avoid circular locks in drm_mode_getconnector
  drm: avoid circular locks in __drm_mode_object_find
  drm: add a locked version of drm_is_current_master
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c        | 76 +++++++++++++++++++++--------
 drivers/gpu/drm/drm_connector.c   |  5 +-
 drivers/gpu/drm/drm_lease.c       | 81 +++++++++++++++++++++++--------
 drivers/gpu/drm/drm_mode_object.c | 10 ++--
 include/drm/drm_auth.h            |  1 +
 include/drm/drm_file.h            | 15 ++++--
 6 files changed, 141 insertions(+), 47 deletions(-)

-- 
2.25.1

