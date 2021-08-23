Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6335A3F4F2A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 19:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAECC89C14;
	Mon, 23 Aug 2021 17:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E422D89C14;
 Mon, 23 Aug 2021 17:15:05 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id w6so10541504plg.9;
 Mon, 23 Aug 2021 10:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fG8NNf17FBZn+wJbjBPwz4tCgByeKPl/oOGmuCamRZg=;
 b=qy03Myz+IJo3XI2Pa/OjLNRQVcFA9XwYXtgRK5gisKBMmbuz2yibe6UT9WHuswtyJR
 nNwK2qHCYX+NCPxlsqyWdt+9f3pUq9DGpeRNVwWglb/RtPk8TBtetgQ4PQiMQOdziAyX
 k8ISZXwFuRoGWI3eHgr/s4rC9gCy8J6At6eViigBk0XIJkuq8NHLNtb/rNGW0/yoaPqr
 xpD4LdeBUFkWPNHZOheFfYfpZhf4II00YbIC8ggdQnyPLVxlJFAtpbq0QUiB2erXeZmA
 sMQ5X0SmNBoDFWFtT2fdW+qt4Yplxd8KjsxPkvbdGJECBAklq+/e7Pm/b9pOY+HpCiEJ
 u3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fG8NNf17FBZn+wJbjBPwz4tCgByeKPl/oOGmuCamRZg=;
 b=hVaKUlcU+yNi4E1sn+upGYp1pfSdZshkGIZqwQJsvo12r6ZpRREjv5rFJjF+Jgz7HH
 TOT95SQosKgygA0f6LM+D153q6LUcwFdR+pedrksfsoK7awV9favyOvcdTJRfclVctSR
 yiFCkyJDh4a9GysvkTlJc/vLrgHQhZXKH8GLNvAAsjOdVIwNMpjnb1gilaQvwAaHVkQK
 mj0qxd24xviYsBI0yEdfcLna5ICiQFqkEJnrzRwY4uz18ZTKZcXYTXGpetp1HNz/rboG
 e9rCykYIebA/xYswNoSfmxCakcWFCeKo24OJDzTlhHo3qY2t689yAlRNPkYqBNV2tzFs
 9ZAw==
X-Gm-Message-State: AOAM531HRaSXnBL+ocig2r6KLxO4gvPkK8hbRbUAH/wMEv0HwBL8Fpq+
 UjpTYDwAW7UT5+IABHHc4BqYGosQpvl5RLEcPHI=
X-Google-Smtp-Source: ABdhPJwaSxPqYlsApUTHXQKlyVHVNw2D+LT4RVtxvURlnrOCQd9tMJT/xzN3FNc9RODVpb5i7bDn5w==
X-Received: by 2002:a17:90a:f285:: with SMTP id
 fs5mr2379999pjb.148.1629738905421; 
 Mon, 23 Aug 2021 10:15:05 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q4sm14290830pjd.52.2021.08.23.10.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 10:15:04 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v5 0/6] drm: update locking for modesetting
Date: Tue, 24 Aug 2021 01:14:31 +0800
Message-Id: <20210823171437.829404-1-desmondcheongzx@gmail.com>
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

I updated the series to untangle more lock inversions caught by the
Intel-gfx CI, but again there might be more that I missed.

This series now converts drm_device.master_mutex into master_rwsem, and
also removes drm_file.master_lookup_lock.

Overall, this series makes the following changes:

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

- Patch 5: Untagle remaining lock hierarchy inversions between
modeset_mutex and master_rwsem

- Patch 6: Replace master_lookup_lock with master_rwsem

v4 -> v5:
- Avoid calling drm_file_get_master while holding on to the modeset
mutex, caught by the Intel-gfx CI (split previous patch 5 into the new
patch 5 & 6)

v3 -> v4 (suggested by Daniel Vetter):
- Drop a patch that added an unnecessary master_lookup_lock in
drm_master_release (previously patch 2)
- Drop a patch that addressed a non-existent race in
drm_is_current_master_locked (previously patch 3)
- Remove fixes for non-existent null ptr dereferences (previous patch 4)
- Protect drm_master.magic_map,unique{_len} with master_rwsem instead of
master_lookup_lock (dropped previous patch 5)
- Drop the patch that moved master_lookup_lock into struct drm_device
(previously patch 1)
- Drop a patch to export task_work_add (previously patch 8)
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

Desmond Cheong Zhi Xi (6):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights
  drm: avoid circular locks with modeset_mutex and master_rwsem
  drm: remove drm_file.master_lookup_lock

 drivers/gpu/drm/drm_atomic_uapi.c |  4 +-
 drivers/gpu/drm/drm_auth.c        | 57 +++++++++++----------
 drivers/gpu/drm/drm_debugfs.c     |  4 +-
 drivers/gpu/drm/drm_drv.c         |  3 +-
 drivers/gpu/drm/drm_encoder.c     |  7 ++-
 drivers/gpu/drm/drm_file.c        |  7 ++-
 drivers/gpu/drm/drm_framebuffer.c |  2 +-
 drivers/gpu/drm/drm_internal.h    |  1 +
 drivers/gpu/drm/drm_ioctl.c       | 48 +++++++++++-------
 drivers/gpu/drm/drm_lease.c       | 83 ++++++++++++++-----------------
 drivers/gpu/drm/drm_mode_object.c | 16 ++++--
 drivers/gpu/drm/drm_plane.c       | 17 +++++--
 drivers/gpu/drm/drm_property.c    |  6 +--
 include/drm/drm_auth.h            |  6 +--
 include/drm/drm_device.h          | 15 ++++--
 include/drm/drm_file.h            | 17 ++-----
 include/drm/drm_lease.h           |  4 +-
 17 files changed, 165 insertions(+), 132 deletions(-)

-- 
2.25.1

