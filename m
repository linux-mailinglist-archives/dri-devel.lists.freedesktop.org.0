Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C943F29C2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 12:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42CD6EA4F;
	Fri, 20 Aug 2021 10:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5076888EE3;
 Fri, 20 Aug 2021 10:03:29 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id j2so1253807pll.1;
 Fri, 20 Aug 2021 03:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bUKxomWQZ5QxIYFDsb+klHkUJT56TTMlo6NJBPgwDTw=;
 b=XQIzz6ucLOTQp2DzVHYZkL6sgdA78JVrYg5osuKw9srS4VYeK+4UG5Ocu2rjdGl72K
 hozy0pXafCIL3DzoAGv1/Ynts0t1R95UT4eRGw8efB1QbFsTMQZcZzNzVsRTrIG8Jjsx
 T8XGwXtDc6W1lq8IAGR67sSlxVxx5EVaKUDjyTWi9PWFB78PE35CBfisPfwjL5ZGOqIz
 I3jWnfUS86KLf9vU9Kc1KZ2TAw1LjhjPGp1branPwgmPnlTWP17YOW4FMxOb6Une8Jga
 qPm9GimVgYFG94rKXQtAimPIneqpt2CG69j+fuCneS+OnoCnAwijNwLS1/8pxSTsjEtr
 pP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bUKxomWQZ5QxIYFDsb+klHkUJT56TTMlo6NJBPgwDTw=;
 b=MzmmU3ZfNYpiY41mSnbYY4yuAHZBTTADa1neVLzn3uycOuEku1rsSWTYavZ+kSct5D
 WqJG0NHiics5q0jT7WHMITZmU8AmFyoe2wu1+JphCyKwqscQosw43GFLWb5XFlxiW2wS
 GuaecNEYOKPYQ94/kabCQgUSQK2CL3sZDbUf/BvxM1aNjJks8IX2G3mWF6Vcxwdf44aj
 JZ0Sb5a53krkNKK6k3yiVZVWMbexw3DVWStPoaqthlBoupzpzj5bd5GFF61IJ6FTjIOv
 e8EpvT5Hddgk3LGwdOh5sNb6STSvvdV2e8lDG5hXV+v3MaBFcXKaciOBNn0OgT65cr/o
 x58g==
X-Gm-Message-State: AOAM5309HNIrKzztt+QZXc5W5RtMXRcqI3p1enCtKMpQnC4aMLtCqWQH
 xLkeu2St44tvG7AprCkllRk=
X-Google-Smtp-Source: ABdhPJyVUBpUuyiz1RaVzTh1c7byc8ylmZizw2oW+a4dWyMXQewAPos+qDRZ0N0on3UDesmH/00SKQ==
X-Received: by 2002:a17:90a:d791:: with SMTP id
 z17mr3743696pju.203.1629453808880; 
 Fri, 20 Aug 2021 03:03:28 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i8sm6503876pfo.117.2021.08.20.03.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:03:28 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4 0/5] drm: update locking for modesetting
Date: Fri, 20 Aug 2021 18:02:46 +0800
Message-Id: <20210820100251.448346-1-desmondcheongzx@gmail.com>
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

Thanks for all the helpful feedback on the previous version.

Taking all the suggestions together, this series now converts
drm_device.master_mutex into master_rwsem, and also attempts to remove
drm_file.master_lookup_lock. There might still be lock inversions
lurking, so the output from Intel-gfx CI should be interesting to see.

Overall, this series makes the following changes:

- Patch 1: Fix a potential null ptr dereference in drm_master_release

- Patch 2: Convert master_mutex into rwsem (avoids creating a new lock)

- Patch 3: Update global mutex locking in the ioctl handler (avoids
deadlock when grabbing read lock on master_rwsem in drm_ioctl_kernel)

- Patch 4: Plug races with drm modesetting rights

- Patch 5: Replace master_lookup_lock with master_rwsem by untangling
remaining lock hierarchy inversions

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

Desmond Cheong Zhi Xi (5):
  drm: fix null ptr dereference in drm_master_release
  drm: convert drm_device.master_mutex into a rwsem
  drm: lock drm_global_mutex earlier in the ioctl handler
  drm: avoid races with modesetting rights
  drm: remove drm_file.master_lookup_lock

 drivers/gpu/drm/drm_auth.c        | 54 ++++++++++++------------
 drivers/gpu/drm/drm_debugfs.c     |  4 +-
 drivers/gpu/drm/drm_drv.c         |  3 +-
 drivers/gpu/drm/drm_file.c        |  7 ++--
 drivers/gpu/drm/drm_internal.h    |  1 +
 drivers/gpu/drm/drm_ioctl.c       | 48 ++++++++++++---------
 drivers/gpu/drm/drm_lease.c       | 69 ++++++++++++++-----------------
 drivers/gpu/drm/drm_mode_object.c | 14 +++++--
 include/drm/drm_auth.h            |  6 +--
 include/drm/drm_device.h          | 15 +++++--
 include/drm/drm_file.h            | 17 +++-----
 include/drm/drm_lease.h           |  2 +-
 12 files changed, 125 insertions(+), 115 deletions(-)

-- 
2.25.1

