Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4470FB1C
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEEFD10E67F;
	Wed, 24 May 2023 16:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEC510E4BD;
 Wed, 24 May 2023 16:00:10 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5208be24dcbso372181a12.1; 
 Wed, 24 May 2023 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684944009; x=1687536009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B9cfnkHSvu3f3znujma+mgkhmHw3+ATd1xiyn5rWq0o=;
 b=I5y87xsIqIVtUw8NgQ8OzPnVVGKTBzR2XyPln4kjDcANDchFlG1CpGRW66ZRtFPNud
 gzeNokAw24CRm2J0jQ6I8jlG2FaYli9xZVT3Q3GzbnSvGVuPIf/NvQvBrFrbMDQEUAKg
 GV7UpSEiGg7fODuQMj7B6LXb0+SAmBCTsNMeXZGEBZu6up//eHEaHRZMFhbPt0psAweQ
 Vk4M0fggq5SAxZ3k3KIHlUQOYYXrEB5fJweYPEJwyDwn6PvEjH89Aucqbe4ZLBKovTKh
 sosgavmsbc82w+Y9U3Mw/jVLqiyeUqeMZ7DtP7atQx3IY1WYwmdN7cH7AS+3gV8WMkG0
 H15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684944009; x=1687536009;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B9cfnkHSvu3f3znujma+mgkhmHw3+ATd1xiyn5rWq0o=;
 b=Oz3ft1rT1hCkvirQ/Vl3eZ5irdpl7UXRljx8zp1AKXXGb6cmK9Hqn2FJK31KgVRJmz
 Aob3QlWa+6zqQeQD0sn34kBrMtz36/5G0WMVzQsS0Zb42clmzLg5Jo+IVn8+iMLBSkLA
 KCDho6d7bPlTfXWZCGtd8WvSZnYrO8Ij43hs06B6tMBmBE1k/RN5nhNdaIfi6nUBwQNF
 dYk3Y4KcxeZI+HlXAun7a3RwTjOjgDu+J5W+y2J0BQHTzubSgiB0axZm9soxHQT6Ep7Q
 u8k1wsrtBWDYI4UVNqEHa2pXNBPqbRDivXT6vbzbMa13CFfh0Qon06153ySO4OKBLV9s
 YAKw==
X-Gm-Message-State: AC+VfDzbTk//Zmd9O0EyK2Fg8B9bsQt8ZF13XF0NCYY9mXW3ThA8QA8b
 1Iy8BgIYX868/gbjuW9yKGYQzqhrXxI=
X-Google-Smtp-Source: ACHHUZ4yDiUIV+Y7x/9WTGapmKYECnfSMNNF8AnZWdTT01U+ku9Z92d6dTBweuROpFldZkLALHJ09Q==
X-Received: by 2002:a17:903:244a:b0:1ac:63b6:f1ca with SMTP id
 l10-20020a170903244a00b001ac63b6f1camr23696631pls.0.1684944009268; 
 Wed, 24 May 2023 09:00:09 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a170902869700b001a98f844e60sm8930176plo.263.2023.05.24.09.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:00:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/7] drm: fdinfo memory stats
Date: Wed, 24 May 2023 08:59:30 -0700
Message-Id: <20230524155956.382440-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Lijo Lazar <lijo.lazar@amd.com>, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar motivation to other similar recent attempt[1].  But with an
attempt to have some shared code for this.  As well as documentation.

It is probably a bit UMA-centric, I guess devices with VRAM might want
some placement stats as well.  But this seems like a reasonable start.

Basic gputop support: https://patchwork.freedesktop.org/series/116236/
And already nvtop support: https://github.com/Syllo/nvtop/pull/204

I've combined the separate series to add comm/cmdline override onto
the end of this, simply out of convenience (they would otherwise
conflict in a bunch of places).

v2: Extend things to allow for multiple regions other than just system
    "memory", make drm_show_memory_stats() a helper so that, drivers
    can use it or not based on their needs (but in either case, re-
    use drm_print_memory_stats()
v3: Docs fixes
v4: use u64 for drm_memory_stats, small docs update and collected
    Tvrtko's a-b
v5: Rebase on drm-misc-next, drop comm/cmdline override patches

[1] https://patchwork.freedesktop.org/series/112397/

Rob Clark (7):
  drm/docs: Fix usage stats typos
  drm: Add common fdinfo helper
  drm/msm: Switch to fdinfo helper
  drm/amdgpu: Switch to fdinfo helper
  drm: Add fdinfo memory stats
  drm/msm: Add memory stats to fdinfo
  drm/doc: Relax fdinfo string constraints

 Documentation/gpu/drm-usage-stats.rst      |  91 ++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  32 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |   2 +-
 drivers/gpu/drm/drm_file.c                 | 132 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c              |  13 +-
 drivers/gpu/drm/msm/msm_gem.c              |  15 +++
 drivers/gpu/drm/msm/msm_gpu.c              |   2 -
 include/drm/drm_drv.h                      |   7 ++
 include/drm/drm_file.h                     |  32 +++++
 include/drm/drm_gem.h                      |  32 +++++
 11 files changed, 308 insertions(+), 53 deletions(-)

-- 
2.40.1

