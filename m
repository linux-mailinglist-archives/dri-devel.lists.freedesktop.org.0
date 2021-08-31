Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E07B93FC273
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 08:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2CA89B3C;
	Tue, 31 Aug 2021 06:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7872B89B22;
 Tue, 31 Aug 2021 06:14:32 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id m4so10010306pll.0;
 Mon, 30 Aug 2021 23:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=brM7hW6JylJKzonqvDJYo3SspnbZ8CW+4pmvj8jGqAU=;
 b=TYqGCHFl281XM/Qsit8ay9Zvizlo3WsBq5y4Obt8jQHjiox2dt6MPHCEVsE0keSEFe
 RVBMplpcZxGJR3qyTkA0pPPouAWFmaRtqHYDQ5q9RW0g1lwmiQjAD0ViWNUs3dao+kx4
 S2UvHOz/hjQkH9bwTm+PgxCySQVOYy02T+CcvZuSiad3G56SQJPckpPWvECGc6uGkywE
 0E6AyJFNzwK/zRaE5CXVonaqmQcKxK76Jm37BWzpf5bT2UcoYiKXeREgNDRnb1NCBqZb
 Za6F8DrOiQ0lsDgXis4hdyTqctY0f/9POhO9D/nybaASbrGDiAI7LGYTSmzHAcUG242w
 s88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=brM7hW6JylJKzonqvDJYo3SspnbZ8CW+4pmvj8jGqAU=;
 b=P86yJaFptVxKEMiHWqJvvQLQDKW3Dx2NZM2opfMeEIUDpQc/2F9ESKBZSsWKQPO736
 sqL6UpZKutJtZ89U8o0Y7S+81BRBQvo4raNXU+99XV3ZNV080h56wWzJYcP6LHOw6aJE
 yjKJuYLiHh5JaRXmYtasShJcvfPATcjNwea/RAzVbpixeIvV2oNxjNnfbd/+XW78dFFq
 lte1o5hfkAefAl+NNXpzVzBODVTxk0RLAsHXS7SgQaF7G6/k2WGGEvEm08poo7sH1w8A
 0uOmpSHZc5UrVhqGDbuRP4m8Bq6Z33LbUgPRXFcevn1duC7i2U79JrX9RGDHxofnkXZK
 mPLQ==
X-Gm-Message-State: AOAM5326uSAlG5eGJ9nA4C/Dq8xclHhnt4dKtkj0rVOIjAyAZVUzW3CB
 1XENu5ACqc06qB+xRGLVCh8=
X-Google-Smtp-Source: ABdhPJxog7P3VF21VautBAMxYZ/3o73trUNelQsW8wAG+bh7Wi6vvj2BRI8XRqDepYX6Plvg5agctw==
X-Received: by 2002:a17:902:c9d5:b0:138:a025:c944 with SMTP id
 q21-20020a170902c9d500b00138a025c944mr3135880pld.61.1630390472061; 
 Mon, 30 Aug 2021 23:14:32 -0700 (PDT)
Received: from sanitydock.wifi-cloud.jp ([210.160.217.69])
 by smtp.gmail.com with ESMTPSA id z7sm1405724pjr.42.2021.08.30.23.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 23:14:31 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v9 0/4] drm: update locking for modesetting
Date: Tue, 31 Aug 2021 14:13:44 +0800
Message-Id: <20210831061348.97696-1-desmondcheongzx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I updated the patch set with some suggestions by Daniel Vetter, and
dropped the patches after patch 4 so that we can stick the landing for
avoiding races with modesetting rights before dealing with the tricky
spinlock.

Overall, this series fixes races with modesetting rights, and converts
drm_device.master_mutex into master_rwsem.

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

v8 -> v9 (suggested by Daniel Vetter):
- Dropped patches 5-7 to handle it in another series
- Added the appropriate Fixes: tag for the null ptr dereference fix
(patch 1)
- Create a locked_ioctl bool to clarify locking/unlocking patterns in
the ioctl handler (patch 3)
- Clarified the kernel doc for master_rwsem (patch 4)

v7 -> v8:
- Avoid calling drm_lease_held in drm_mode_setcrtc and
drm_wait_vblank_ioctl, caught by Intel-gfx CI

v6 -> v7:
- Export __drm_mode_object_find for loadable modules, caught by the
Intel-gfx CI

v5 -> v6:
- Fix recursive locking on master_rwsem, caught by the Intel-gfx CI

v4 -> v5:
- Avoid calling drm_file_get_master while holding on to the modeset
mutex, caught by the Intel-gfx CI

v3 -> v4 (suggested by Daniel Vetter):
- Drop a patch that added an unnecessary master_lookup_lock in
drm_master_release
- Drop a patch that addressed a non-existent race in
drm_is_current_master_locked
- Remove fixes for non-existent null ptr dereferences
- Protect drm_master.magic_map,unique{_len} with master_rwsem instead of
master_lookup_lock
- Drop the patch that moved master_lookup_lock into struct drm_device
- Drop a patch to export task_work_add
- Revert the check for the global mutex in the ioctl handler to use
drm_core_check_feature instead of drm_dev_needs_global_mutex
- Push down master_rwsem locking for selected ioctls to avoid lock
hierarchy inversions, and to allow us to hold write locks on
master_rwsem instead of flushing readers
- Remove master_lookup_lock by replacing it with master_rwsem

v2 -> v3:
- Unexport drm_master_flush, as suggested by Daniel Vetter.
- Merge master_mutex and master_rwsem, as suggested by Daniel Vetter.
- Export task_work_add, reported by kernel test robot.
- Make master_flush static, reported by kernel test robot.
- Move master_lookup_lock into struct drm_device.
- Add a missing lock on master_lookup_lock in drm_master_release.
- Fix a potential race in drm_is_current_master_locked.
- Fix potential null ptr dereferences in drm_{auth, ioctl}.
- Protect magic_map,unique{_len} with  master_lookup_lock.
- Convert master_mutex into a rwsem.
- Update global mutex locking in the ioctl handler.

v1 -> v2 (suggested by Daniel Vetter):
- Address an additional race when drm_open runs.
- Switch from SRCU to rwsem to synchronise readers and writers.
- Implement drm_master_flush with task_work so that flushes can be
queued to run before returning to userspace without creating a new
DRM_MASTER_FLUSH ioctl flag.

Best wishes,
Desmond

Desmond Cheong Zhi Xi (4):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights

 drivers/gpu/drm/drm_auth.c    | 39 ++++++++++++++++------------
 drivers/gpu/drm/drm_debugfs.c |  4 +--
 drivers/gpu/drm/drm_drv.c     |  3 +--
 drivers/gpu/drm/drm_file.c    |  6 ++---
 drivers/gpu/drm/drm_ioctl.c   | 49 ++++++++++++++++++++++-------------
 drivers/gpu/drm/drm_lease.c   | 35 +++++++++++++++++--------
 include/drm/drm_auth.h        |  6 ++---
 include/drm/drm_device.h      | 16 +++++++++---
 include/drm/drm_file.h        | 12 ++++-----
 9 files changed, 104 insertions(+), 66 deletions(-)

-- 
2.25.1

