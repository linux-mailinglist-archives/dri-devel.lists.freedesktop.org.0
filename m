Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEC22558AB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1009B6E486;
	Fri, 28 Aug 2020 10:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16676E480;
 Fri, 28 Aug 2020 10:40:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id q4so731101eds.3;
 Fri, 28 Aug 2020 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENswYkyFplqCehinq7Y2z75sVgQXnYT6puOqN0R0Y7o=;
 b=g2KKVl0TPaZILqlIjvuIjbTQL7Ogvm1tljg268Wh/Uu9MvL0/rpY3KSRLPNUtmeEBJ
 w5XdKoUUOgI/EG83DvcV54PTgfPD7InvOdziuKNbHtx2G5LB5frcduaoH68PkS6kw/pI
 4hEvBDJa8Cyx5V+rVIDqJ1odeSq2T96yLLGBYgfD812SY8kcT570gknfOTtHCEnZBE2r
 y7Xw1yf5aZMV+K38yiOov70ElMxF+09rIILuPBCw7NxTsziPMNaohnRXR0pnxjdhf59D
 vQIn7CKk20Z77MhKtlvfqLBBFeJoZcn0jXeB81iI8WcgvLxd2DjWaxxkcV4b39FKVHZK
 eaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENswYkyFplqCehinq7Y2z75sVgQXnYT6puOqN0R0Y7o=;
 b=gNpk3QsMcg3mcTowUKmSQFkzYuYcuci9OEEHclx5GzRgwttFOe1+ERKih36CgUWCk+
 nEREM3hcuytMm2w6r66grdNO0+BxzZt7239kOuUpxld0KzPlwdeTp65z7lMPxbSrf16/
 IucEGC9Gg0Y70KplYu74PLmhbmj6W4rU1cX+Br4f8NN6awPCQc8XQvPXTIOs8yMVDDeh
 MH5owV+tvKKbVr+RB9OeFYsgBwIkVQUz0XeFwKSEEWQ1bKobQQ8hHacnRPmBtbW+S8z7
 ZKDW47LxTkidyOWrsTw92GR/miczFVvs4Z451vi6uqxuFjo2sQyvlwCLzcp7SOVQy3kL
 vdtg==
X-Gm-Message-State: AOAM532WskMG+4X96AgYgl0No9XcvT4jD2S8xpB40Prc+7Yij9oDIyrU
 kte1fW35km+s6RSO7V8XhmI=
X-Google-Smtp-Source: ABdhPJw97mbjTAqty7lLF+w0rgNlxRnQMEc3LaIjzKeZFXqWT8sUnxBFz/NWYLVP98tFNt3rdxl/Iw==
X-Received: by 2002:a05:6402:1f6:: with SMTP id
 i22mr1115268edy.374.1598611222246; 
 Fri, 28 Aug 2020 03:40:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id d5sm649722edk.25.2020.08.28.03.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:40:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 0/6] drm/nouveau: Support sync FDs and sync objects
Date: Fri, 28 Aug 2020 12:40:10 +0200
Message-Id: <20200828104016.1672195-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi,

This series implements a new IOCTL to submit push buffers that can
optionally return a sync FD or sync object to userspace. This is useful
in cases where userspace wants to synchronize operations between the GPU
and another driver (such as KMS for display). Among other things this
allows extensions such as eglDupNativeFenceFDANDROID to be implemented.

Note that patch 4 modifies the ABI introduced in patch 3 by allowing DRM
sync objects to be passed rather than only sync FDs. It also allows any
number of sync FDs/objects to be passed in or emitted. I think those are
useful features, but I left them in a separate patch in case everybody
else thinks that this won't be needed. If we decide to merge the new ABI
then patch 4 should be squashed into patch 3.

The corresponding userspace changes can be found here:

  libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-sync-fd-v2/
  mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sync-fd/

I've verified that this works with kmscube's --atomic mode and Weston.

Thierry

Thierry Reding (6):
  drm/nouveau: Split nouveau_fence_sync()
  drm/nouveau: Add nouveau_fence_ref()
  drm/nouveau: Support fence FDs at kickoff
  drm/nouveau: Support sync FDs and syncobjs
  drm/nouveau: Support DMA fence arrays
  drm/nouveau: Allow zero pushbuffer submits

 drivers/gpu/drm/nouveau/dispnv04/crtc.c |   4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  38 ++-
 drivers/gpu/drm/nouveau/nouveau_bo.h    |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c   |   1 +
 drivers/gpu/drm/nouveau/nouveau_fence.c |  90 +++---
 drivers/gpu/drm/nouveau/nouveau_fence.h |   3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c   | 402 ++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_gem.h   |   2 +
 include/uapi/drm/nouveau_drm.h          |  23 ++
 9 files changed, 410 insertions(+), 155 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
