Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000AF27FB50
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E4E6E86F;
	Thu,  1 Oct 2020 08:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40576E83A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 00:28:48 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id o5so3569876qke.12
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 17:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KfbeZ1InQAwZth4mJ7971yKIR8SQx6BQ7+DGpeWilgg=;
 b=X2OaIXnpxWi1p8YsjA3OZDjXABig1sqic6dMuCMEdOXQinJRdlMgH5OIsMXjc7k4GF
 6XzFdIZSUOvzN40OsADAZKOHsev3QLew1RHkhw3EjdGyefyecLaXTtmHgeIIZ15XZ593
 YmNIHkyK2hF683R11QO0PLgqIXWZ7UbPZuoru916rGemu5wboNogkzooFKN5wnInPWzL
 3Wb008S1DiaEFNcTpPKTL+STdrTbka9M49qPFxH334BbmoU7wdSpBvOhqPQ4mz/SkkCC
 1hU3XT8nI+FT8A/3xhCq7yCjLoqRoItLMCKwc/f/tBcmJpaA2bpnKdh+497yWohkJgvN
 HjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KfbeZ1InQAwZth4mJ7971yKIR8SQx6BQ7+DGpeWilgg=;
 b=EknlgFQYC6p19YPe+zG/ZS/YuaI1Kn3DhYM+P+jMWTcQLiLCJDVH6wAXQtRYLGPQyd
 ey9TkAQ+lyZU+FhHpu1ojr5l0hzrQPp12XquX4Z/5lD/IvVL+agSQrMO1nkwZFl3yBNV
 51d3mn4+0X69svdBdLiDSQ4Q25fzssRFaLkF7OAMZpof/pmWG8hZjz/xQZQUBvxwFInh
 ptN/RuxMP3NWgm7hTfe42TuX9ke5yv9HdZGrdUHRmqKxBX1y04Bf0DqsKyYykuqOLyal
 rfUQad0969T6wo6E09cjATDO8eF+0BRRtnPlIWAg1wLymEgJLStH5nUKvicQdxxzYIkH
 y73g==
X-Gm-Message-State: AOAM532Jz5RrG5osrpC/cXrEO7qiltWqI2dmPUyajuIGpMhi7QV4DrWz
 +YibITupue2k7fa0WgM1S0ktkA==
X-Google-Smtp-Source: ABdhPJwINBo5uh42Mio6f1rg+sxf+yJ7Ja4lfnT3Lsq25qym0EpvD2ez7RBLEDNX7+D+OdzeZGP8Cw==
X-Received: by 2002:a05:620a:90c:: with SMTP id
 v12mr5187417qkv.16.1601512127320; 
 Wed, 30 Sep 2020 17:28:47 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 205sm3850908qki.118.2020.09.30.17.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 17:28:46 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: support for host-cached BOs
Date: Wed, 30 Sep 2020 20:27:03 -0400
Message-Id: <20201001002709.21361-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is to support cached and cached-coherent memory types in vulkan.

I made a corresponding WIP merge request [1] which shows usage of this.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6949

Jonathan Marek (3):
  drm/msm: add MSM_BO_CACHED_COHERENT
  drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
  drm/msm: bump up the uapi version

 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/msm_drv.c              | 24 ++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h              |  3 +++
 drivers/gpu/drm/msm/msm_gem.c              | 23 ++++++++++++++++++++
 include/uapi/drm/msm_drm.h                 | 25 +++++++++++++++++++---
 5 files changed, 72 insertions(+), 4 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
