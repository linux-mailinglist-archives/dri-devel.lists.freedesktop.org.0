Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6B3C4320
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 06:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49ECA8933C;
	Mon, 12 Jul 2021 04:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBB88933C;
 Mon, 12 Jul 2021 04:35:49 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id g24so9384686pji.4;
 Sun, 11 Jul 2021 21:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4rLWxgvTxRO6/WnLGuPe5bx1yA3ZPfoXkYG4O0mj5Ag=;
 b=Geoi+0MWpfFz4FPkrYi/nx4PnAtxpDewQhIbIJJEpdvLJd+zqBYat7d/uOq4bOLVmd
 crQ/FoTUO9henHk0k11fQML6QMzkjWON0Bt18h+gJv2G/u9O9SDKTBmGaHB5IW53VE4S
 dROuzbLroxbfZ+hAfVRA1sBJwY8qb8JowpBI+TITbGDJyvK+HYjHCaIUdC1xAyu7xKp5
 IPR01Sq4YwLldIdNar4XcUj524b6nWeJauuyT1o61vKbGdw75fpaUfireHd2P6nG5SoU
 h4Fpq9tBo8yTM42PgkUERGI5dzs6z4lPbvLONb4iO7jVKoeo3VkpxgjE/ca8jJ+PZKkL
 41/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4rLWxgvTxRO6/WnLGuPe5bx1yA3ZPfoXkYG4O0mj5Ag=;
 b=d+Qik32wMd/29E3XXEtu48CJWNFsmSIOQa8rdw28FHp15oDNGNs7GICFJ13BCT/Zvm
 Li/FKdr88f7f0N+yO6BrLrWZa2MywI3Zn3vLV1+szdfNTd8kMUiTdDistwVXMzwDmbn7
 ukQ+s3Qgv5wTxTlRMf++wKV2i1B5zxpr4rB/bklBVO9Y9mqq14RXTFPcIaVfR4qszJf/
 e3qq7q/Kh/GrppcP2yEabQEV9tl8t4YQ2xdOC4j3XxGWuI2B1M1y12MH1x1urrImNtn7
 UxwzGymA97yBdFzp0aWxS/dG0erCBYiP+X3H7f6bcaXzrz0d0YORGLP0b1qW9HBoinrQ
 2JiQ==
X-Gm-Message-State: AOAM530hTo57rsrFXf0obLNH7R4KPcqeyfTQMsXfT9w1r28Kk8JH8PFa
 5hMfndEA5EuOERi83N10qNo=
X-Google-Smtp-Source: ABdhPJwl+CRq9QTeLobKLyJ6aOiBlK052/w9C9BYiZxarzwfe1F9ZnaLlpMcaNfVay5lzr4CjUJ4tQ==
X-Received: by 2002:a17:90a:c484:: with SMTP id
 j4mr48282588pjt.218.1626064548647; 
 Sun, 11 Jul 2021 21:35:48 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n3sm14242764pfn.216.2021.07.11.21.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 21:35:48 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v8 0/5] drm: address potential UAF bugs with drm_master ptrs
Date: Mon, 12 Jul 2021 12:35:03 +0800
Message-Id: <20210712043508.11584-1-desmondcheongzx@gmail.com>
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

Hi,

In the previous thread on this series we decided to remove a patch that was violating a lockdep requirement in drm_lease. In addition to this change, I took a closer look at the CI logs for the Basic Acceptance Tests and noticed that another regression was introduced. The new patch 2 is a response to this.

Overall, this series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into five patches:

1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.

2. Move a call to drm_is_current_master() out from the RCU read-side critical section in drm_clients_info().

3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

4. Serialize drm_file.master by introducing a new spinlock that's held whenever the value of drm_file.master changes.

5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

v7 -> v8:
- Remove the patch that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find. This patch violated an existing lockdep requirement as reported by the intel-gfx CI.
- Added a new patch that moves a call to drm_is_current_master out from the RCU critical section in drm_clients_info. This was reported by the intel-gfx CI.

v6 -> v7:
- Modify code alignment as suggested by the intel-gfx CI.
- Add a new patch to the series that adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.
- Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.

v5 -> v6:
- Add a new patch to the series that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.
- Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.
- Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.
- Modify comparisons to NULL into "!master", as suggested by the intel-gfx CI.

v4 -> v5:
- Add a new patch to the series that moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.
- Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.

v3 -> v4:
- Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/
- Inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.
- Modify kerneldoc formatting for drm_file.master, as suggested by Daniel Vetter.
- Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

v2 -> v3:
- Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.
- Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

v1 -> v2:
- Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (5):
  drm: avoid circular locks in drm_mode_getconnector
  drm: avoid blocking in drm_clients_info's rcu section
  drm: add a locked version of drm_is_current_master
  drm: serialize drm_file.master with a new spinlock
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c      | 93 ++++++++++++++++++++++++---------
 drivers/gpu/drm/drm_connector.c |  5 +-
 drivers/gpu/drm/drm_debugfs.c   |  3 +-
 drivers/gpu/drm/drm_file.c      |  1 +
 drivers/gpu/drm/drm_lease.c     | 81 +++++++++++++++++++++-------
 include/drm/drm_auth.h          |  1 +
 include/drm/drm_file.h          | 18 +++++--
 7 files changed, 152 insertions(+), 50 deletions(-)

-- 
2.25.1

