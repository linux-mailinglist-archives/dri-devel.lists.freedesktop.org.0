Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC76DE79E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC29C10E0FF;
	Tue, 11 Apr 2023 22:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F47E10E00C;
 Tue, 11 Apr 2023 22:57:42 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id la3so9234909plb.11;
 Tue, 11 Apr 2023 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681253861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nII3QwEycAnovqWQfjWZu+6YGPxxA4KRFjzFYjJblIQ=;
 b=ZAC+uXDhUxji26Ze6K9nnsc/qkqNfO/BNR+cWRfv0hEqJWuCAoTGY1LTVUBy4ONBTf
 d5T8GAeHi8KkynlfafbWzNvIw8wZ0uFodWqaCNwNH0rH6wqDKr5SayKPsyT7ylkMtLcC
 pZX//qJfNqMpJOx/Ig3MPM377p5o6FHoboEBNshuT+8sJ4dqh9QgsSyozzxjDaXnSTQv
 YF+g/WDxpn77tLAABR4mVDSCUoE4ya4pOQ7XFK62nfOirsVqbS5WMoPIH30lmx+68HyH
 YWchXD690VQkVdW5neJpK+KTaD9WQ6vzmlCtQISpk7MCZ4jnFlY4JIi4AKUB6bxeUnAD
 XuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681253861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nII3QwEycAnovqWQfjWZu+6YGPxxA4KRFjzFYjJblIQ=;
 b=v4bWjPalvB5VsAEQPwWspZZWziNcHZW1tDc/yKPeQ2aU/oV7RY6h5hQUDD5V6Igvft
 VY5sXLXLc7xMqoqJsojkqatLUGXqk1+BCCZiEkctbepBWzSSepcXQmL+p+Ut1piYSq/F
 L2Iynvq5fXzT/zrU72s1ezDl/Y3Mnqu3KzvAnQ7bz6U073maUU6y8M6/AnG9Y6ppHnZT
 Kc+qwfDkklHcsdempU1RxIMtzZD/q/trQg8SfGhdWPjadA6Cppc0qHzHmYOvBZnR8Ifx
 MjJOysS8HQJzCcE83Rl6PtaEtVjyeCOGRMmzMlUWncaAuTK8zIffcYpGvpB1LE0twRas
 Q0jQ==
X-Gm-Message-State: AAQBX9cu1qnze7pgOTngDLaDBmNQoY//9Fei1VO5Gq+3r5oqYMVoA4sF
 UqzqGNjH0buDs1w453HXU3zsBtkFf+M=
X-Google-Smtp-Source: AKy350b3kN3Vv7Rn1Xudjo2ScWIpD4ohPF62kNG35kDDgi5zG4c7QyA4AJOOZxCvGcg2yWirfkC2pA==
X-Received: by 2002:a05:6a20:1b11:b0:db:4fae:ad15 with SMTP id
 ch17-20020a056a201b1100b000db4faead15mr15979423pzb.42.1681253861084; 
 Tue, 11 Apr 2023 15:57:41 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 n4-20020aa78a44000000b006338e0a9728sm6657912pfa.109.2023.04.11.15.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 15:57:40 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm: fdinfo memory stats
Date: Tue, 11 Apr 2023 15:56:05 -0700
Message-Id: <20230411225725.2032862-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Evan Quan <evan.quan@amd.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Similar motivation to other similar recent attempt[1].  But with an
attempt to have some shared code for this.  As well as documentation.

It is probably a bit UMA-centric, I guess devices with VRAM might want
some placement stats as well.  But this seems like a reasonable start.

Basic gputop support: https://patchwork.freedesktop.org/series/116236/
And already nvtop support: https://github.com/Syllo/nvtop/pull/204

[1] https://patchwork.freedesktop.org/series/112397/

Rob Clark (7):
  drm: Add common fdinfo helper
  drm/msm: Switch to fdinfo helper
  drm/amdgpu: Switch to fdinfo helper
  drm/i915: Switch to fdinfo helper
  drm/etnaviv: Switch to fdinfo helper
  drm: Add fdinfo memory stats
  drm/msm: Add memory stats to fdinfo

 Documentation/gpu/drm-usage-stats.rst      |  21 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  16 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |   2 +-
 drivers/gpu/drm/drm_file.c                 | 115 +++++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c      |  10 +-
 drivers/gpu/drm/i915/i915_driver.c         |   3 +-
 drivers/gpu/drm/i915/i915_drm_client.c     |  18 +---
 drivers/gpu/drm/i915/i915_drm_client.h     |   2 +-
 drivers/gpu/drm/msm/msm_drv.c              |  11 +-
 drivers/gpu/drm/msm/msm_gem.c              |  15 +++
 drivers/gpu/drm/msm/msm_gpu.c              |   2 -
 include/drm/drm_drv.h                      |   7 ++
 include/drm/drm_file.h                     |   5 +
 include/drm/drm_gem.h                      |  19 ++++
 15 files changed, 208 insertions(+), 41 deletions(-)

-- 
2.39.2

