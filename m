Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09E23B6D0F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 05:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40626E5C8;
	Tue, 29 Jun 2021 03:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A406E5CA;
 Tue, 29 Jun 2021 03:37:45 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id w15so12715660pgk.13;
 Mon, 28 Jun 2021 20:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SoUId37plhKw69YuEI1Cyszujv1NEWznJi6ghGYjFbs=;
 b=Q4pwMkmBbBzJVT1b3P8AnBDL/42B3X9A/D7gU1OejM4J42zknwsi8d8eqBPCMkZmKy
 sJaYrk0JWaxJuyUnUgSgD190Jw32kUbkkVU2NQAn5RJqcrnAtofREJnjkc93GG+YyUwi
 7anbK5WCVBIta0VcFWtpDL9c8Q1rG8Zwv4aPYbSEPC7RzRrKFnYzmRirgaGRkAO9YCMV
 eATVF1Q4VbR1RJCaYPy245+oFDC8vCwtf5TEn08HcMWcnLSve1xWUu1ayvY1mgTj7uft
 TWMlDWWIFY04yug8VS0tJfiIpjWCUMIqBpMuvrnPvYkmkPHjG2li2tt3mWyPwf+ikgov
 TFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SoUId37plhKw69YuEI1Cyszujv1NEWznJi6ghGYjFbs=;
 b=dpXHDJZ5bgmJui0B6Yj8sKsBjQdRdFMDNI1oaEettHrzgBHlK4vue5Bod6iKjAtn30
 dPVeNp7lyQ9TfVW0LAuU6zaErdelP/CHKTqrg6aCu3vcvuSyGU2Wimjp9cGs+MqphFbc
 fcq+7w7np+8ydEYiGOEhGaZ1YJxkUjFlE0aQgP5Uyyk5unNJxz1LmSB1U4dHYWeqyWv2
 YBaoUMomp5Ih24QPHpGLAiDJ4N1NXb7G1pf2Ae4pqws/Iqy3aw3tgR2Iv3oviLslK+fE
 JA6QyDdSVWU0QNhEZXgH01VGEsFlWFI7L2moKBshhFtsRoit8dOfzf3s749UtFZpuoV+
 bc1w==
X-Gm-Message-State: AOAM532esHB3hLXbJehrsd/e6FkBu+j6CZMpgJ7uOgpvYxhTI/wf1XsI
 vJ8HUUrrJZoc4tX8aCx50X8=
X-Google-Smtp-Source: ABdhPJwFJhheFSuURJB5kAmryl0dhXEgyKu/by0XqicUBch09iWKXxKKvew71OSVBC4SmALzEjppVg==
X-Received: by 2002:a63:e841:: with SMTP id a1mr26038010pgk.197.1624937864620; 
 Mon, 28 Jun 2021 20:37:44 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d129sm14769076pfd.218.2021.06.28.20.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 20:37:44 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v5 0/3] drm: address potential UAF bugs with drm_master ptrs
Date: Tue, 29 Jun 2021 11:37:03 +0800
Message-Id: <20210629033706.20537-1-desmondcheongzx@gmail.com>
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

The series is broken up into three patches:

1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.

2. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

3. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

Changes in v4 -> v5:
- Patch 1:
Add patch 1 to the series. The changes in patch 1 do not apply to stable because they apply to new changes in the drm-misc-next branch. This patch moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.

Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.

- Patch 2:
Move changes to drm_connector.c into patch 1.

Changes in v3 -> v4:
- Patch 2:
Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/

Additionally, inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.

- Patch 3:
Modify kerneldoc formatting.

Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.

Changes in v2 -> v3:
- Patch 2:
Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 3:
Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 3:
Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (3):
  drm: avoid circular locks in drm_mode_getconnector
  drm: add a locked version of drm_is_current_master
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c      | 76 ++++++++++++++++++++++++--------
 drivers/gpu/drm/drm_connector.c |  5 ++-
 drivers/gpu/drm/drm_lease.c     | 77 ++++++++++++++++++++++++---------
 include/drm/drm_auth.h          |  1 +
 include/drm/drm_file.h          | 15 +++++--
 5 files changed, 131 insertions(+), 43 deletions(-)

-- 
2.25.1

