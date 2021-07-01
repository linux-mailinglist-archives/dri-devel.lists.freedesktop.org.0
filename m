Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380953B94E5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 18:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A366EADD;
	Thu,  1 Jul 2021 16:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2206EADD;
 Thu,  1 Jul 2021 16:54:22 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id z4so3987960plg.8;
 Thu, 01 Jul 2021 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KSrQtrkS57Wd8RUtiIlSXmn1PXYteCewAUlvuTiLz9k=;
 b=CeJdWLaXxP5TiRpTjobL5+89BvtG4a0XGRdyggpWjHRV1RqlTP3SvbmU+Uz39rS2vO
 +P9x3/NK4yus1l9oFzWeWDo9UptZnVNR5VASEkowxSTJpJPuQvyFDb2sD+52sPPMrO0d
 9ZB1fq0anCWrgtg0rjdSFT+fy3AdoogP20fbZK+VjRIdmaOhVpvhdaLuk6Jwzf8q7X6b
 S93/NauMkuTXZHHKmSrxD9559sM5GzLHYKcXiMD0pi5LP0XRoLk6H52iQLGEvS4utWQq
 uQ1dQnJPzligC9/d2sNaB4/pF1fY+gwEprhiizwozhOrGefBj3cKYo2UW3ukSglbszUG
 WgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KSrQtrkS57Wd8RUtiIlSXmn1PXYteCewAUlvuTiLz9k=;
 b=OiGh/X8HVa9KBvvH5Jb1U2on6/BRlk5VB91LtFlWANKYq3LU65S65LW2BifkXtEkuQ
 rexh+5F0WoY9YXqILrDtZPstYdqI1VIRa6VcslXt2vJujlbPGIPLmZB51H9SL2TmhEHH
 XV2J1Y0cmoHEn2KIdXlFq0Ey92iUdJZqI71o8ETAl2xhCsEwmim3Zn8RuosQALglYPi1
 zGe7SAHnQkHx3zsKeSkWZQbOIsLtA1z61Pjmcqe3DL5//hLTbOAZ+7ep5yVH4mvBnh8W
 3AS1u13tdph7HB2YU+Yfg370W+mnPBrbLiWOJGukAVkMHzwrogaepcEJlxe8oeIvw5PM
 jseA==
X-Gm-Message-State: AOAM531ddJxOMwfHlxzRhlGiioEfaWEkiKjP8AV5Yv5U9IISAaGnhXva
 X0ppWhQEZWrcPyi2CnbIzdY=
X-Google-Smtp-Source: ABdhPJz45rBGKDpouGSS1yrk5efAnEw697BBt+81Exjeub/g9QFgrl7iQu4qWRNxbgHX9POqP3DxJA==
X-Received: by 2002:a17:902:fe0a:b029:11d:81c9:3adf with SMTP id
 g10-20020a170902fe0ab029011d81c93adfmr741720plj.0.1625158462323; 
 Thu, 01 Jul 2021 09:54:22 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id s20sm398738pgv.1.2021.07.01.09.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 09:54:21 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v7 0/5] drm: address potential UAF bugs with drm_master ptrs
Date: Fri,  2 Jul 2021 00:53:53 +0800
Message-Id: <20210701165358.19053-1-desmondcheongzx@gmail.com>
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

The series is broken up into five patches:

1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.

2. Move a call to _drm_lease_held() out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find().

3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

4. Serialize drm_file.master by introducing a new lock that's held whenever the value of drm_file.master changes.

5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

Changes in v6 -> v7:
- Patch 2:
Modify code alignment as suggested by the intel-gfx CI.

Update commit message based on the changes to patch 5.

- Patch 4:
Add patch 4 to the series. This patch adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.

- Patch 5:
Move kerneldoc comment about protecting drm_file.master with drm_device.master_mutex into patch 4.

Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.

Changes in v5 -> v6:
- Patch 2:
Add patch 2 to the series. This patch moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.

- Patch 5:
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

- Patch 5:
Modify kerneldoc formatting.

Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

Changes in v2 -> v3:
- Patch 3:
Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 5:
Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 5:
Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (5):
  drm: avoid circular locks in drm_mode_getconnector
  drm: separate locks in __drm_mode_object_find
  drm: add a locked version of drm_is_current_master
  drm: serialize drm_file.master with a master lock
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c        | 86 +++++++++++++++++++++++--------
 drivers/gpu/drm/drm_connector.c   |  5 +-
 drivers/gpu/drm/drm_file.c        |  1 +
 drivers/gpu/drm/drm_lease.c       | 81 ++++++++++++++++++++++-------
 drivers/gpu/drm/drm_mode_object.c | 10 ++--
 include/drm/drm_auth.h            |  1 +
 include/drm/drm_file.h            | 18 +++++--
 7 files changed, 153 insertions(+), 49 deletions(-)

-- 
2.25.1

