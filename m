Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D303ADE01
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jun 2021 13:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4616E0FB;
	Sun, 20 Jun 2021 11:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898F16E0FB
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 11:04:45 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id 69so6990030plc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 04:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hm+xu31YRuYg61DzdJ+EG1Au10NDFoDqRdnK9sTUPfw=;
 b=gu5JKG5yi/doY7lZWTE2Go+m3li0+jak/AiaAanXeKdr9PsGmqWvJzTUW6eEuSdAXt
 4e8xbUF6d8v0PAXVd8XZMotbhNJtQ+usKw1KhNpiIKxy+JDHULy5I9lXi2PeQWutaNHq
 4M3giA+mCO4tUwh9UvxdoSaMEPLy/Z5ftv/7G1oOb7hD2Q+JxZDW8YFVFozDs1MXrIVs
 RUpHOm1akIpKZToSJizcvQDV4iZg1iDX3qFyrvwiMgD6LicLJA3pxiBM5v+WD2DRtifW
 KuHSBhCzYCcAm9u0pLHyfFCB0EREsqriqYWezsXySejtSZ7Ziv0zx0HmeUjkASVTKTDW
 ZKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hm+xu31YRuYg61DzdJ+EG1Au10NDFoDqRdnK9sTUPfw=;
 b=JqnqtHFfX2etWC0Z3vVvZXiGF1kQIZnEP/fxylXATj+yccE3O5N4WeD91vYklJcRGr
 YZtu/HtKJlBt1/cNzGEgn9+aZm8VhLgKWPvpj+/3oRKGZJAlWYnm4aiZI64U51r90p0j
 ceGCnLREk7GUFvkdXl+qszXnb505mu5K77g0bEsBTEdvBNN8Tt7FdA7eSb6XrSkpGxer
 bVNdxxNDoToQZjlrpXXSJvfDeNviW3gTd/Goq2S4q7+24gg/s29SV1AW0fL+gGYtj96y
 ZrCKdcdwu2QWzUnr6w3vyUcA3Avdkovlomx8KzN5n3ji19KFK4RlM+VPbU5J9/mWaw2s
 3CfA==
X-Gm-Message-State: AOAM532OQ3G92PSnGSEqZojzgs6buO40vHbp2RWVjIKVuzAp9BE4xUYc
 uIR6/AOtdutaT1CrF9/jCRI=
X-Google-Smtp-Source: ABdhPJyq3fgBPGP6rV2rxyDZ2CNUL6a6yAbLjE1a5ZFjAfpqVganmSwJGWtMN3CWWaPUKN0nG+j2qg==
X-Received: by 2002:a17:902:720c:b029:11e:787d:407e with SMTP id
 ba12-20020a170902720cb029011e787d407emr13272957plb.31.1624187085036; 
 Sun, 20 Jun 2021 04:04:45 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id h22sm2644876pfc.21.2021.06.20.04.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 04:04:44 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v3 0/2] drm: address potential UAF bugs with drm_master ptrs
Date: Sun, 20 Jun 2021 19:03:25 +0800
Message-Id: <20210620110327.4964-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into two patches:

1. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.

2. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.

Changes in v2 -> v3:
- Patch 1: Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.

- Patch 2: Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.

Changes in v1 -> v2:
- Patch 2: Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.

Desmond Cheong Zhi Xi (2):
  drm: add a locked version of drm_is_current_master
  drm: protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c  | 73 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/drm_lease.c | 57 ++++++++++++++++++++---------
 include/drm/drm_auth.h      |  1 +
 include/drm/drm_file.h      | 15 ++++++--
 4 files changed, 107 insertions(+), 39 deletions(-)

-- 
2.25.1

