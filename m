Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD346E0201
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 00:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B51710E9D2;
	Wed, 12 Apr 2023 22:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99F210E9D2;
 Wed, 12 Apr 2023 22:43:21 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a67bcde3a7so1640035ad.3; 
 Wed, 12 Apr 2023 15:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681339401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jsDArGzo8UwzIHTKg4ZFesLzSfYls6QtUAhhPvCnIR8=;
 b=BR7mEMT/8rYu6AtMVIBgw3z4X+v7bZLyzLyaHfSGsNcVlWEC6X4Pt3CU+Q5aDWjSBw
 OyPlCcyByobDFutdLcF7xCxDH0ZYocP9rSZ51lIsNTDU9Qvxb4SHi2qYp50yzATwVHHf
 m6NWG7CkvHHOoxAEZP8+DA/PvRLnB1coRYRUltLjvi3dtAKFkazlEERm3+tq76mqhzQG
 m6Y8ViwGmo1trvUjzF4A/ldXuMGdnSNzOOAW3OufH6/DY2rFl5erI6NjC80JdIIoNN9Z
 pT/ufkyWe9KaWHs8kkT412BydAyrcC02JeTtesN13O8O0BCBvOe66XwMD90rPv1gK+aW
 mzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681339401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jsDArGzo8UwzIHTKg4ZFesLzSfYls6QtUAhhPvCnIR8=;
 b=U0zHRIohhFCZFHDSTNgvU3GaO8XQNwy4vm3Lrc6dd8OV0ta9P4/KYwQZtF+iSyG/z6
 39G8a5lB3qQ20xAxeB9j5MLNt5jJg6nl7mKnLkPFVyyrALaVFLXWKmZ4MrdpFqy4yZup
 z7u/nayTzJFmMVxVfjlfpO7LXG77ioJHyPNdagf8BBfFOs4jLLminytwIyNuqJuPccwu
 Ux7dnCYR+B68F7VoXF8rqzaUbk5I6vHCwuSxA3XFOH7fhaj6Bua9dz7gGKT7i3QuRVfy
 K//RPc2pY0IydgQsEtFO4Y7VcuXgYnsui8sMfrIFuMpvh2Y51S3hUWFHU3R/cFOdJdV0
 hJng==
X-Gm-Message-State: AAQBX9dzbUY8Qu2nvoFByke59MX/UcfXPHlJHsZWLY7Bm2Twc1xykiSj
 npdCUopc4YpKtiXLQ6o46VXy4V/676Y=
X-Google-Smtp-Source: AKy350ZlpBPdTHWwnoS3DWIIAHEnWpX3sJfsQunpB1ugPu/RcyTRvjmYquL2lY552tk9dZGjs5kFvw==
X-Received: by 2002:a05:6a00:1508:b0:639:66e6:42d8 with SMTP id
 q8-20020a056a00150800b0063966e642d8mr667554pfu.19.1681339400671; 
 Wed, 12 Apr 2023 15:43:20 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 s21-20020aa78295000000b00627ed4e23e0sm12253844pfm.101.2023.04.12.15.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 15:43:20 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/6] drm: fdinfo memory stats
Date: Wed, 12 Apr 2023 15:42:52 -0700
Message-Id: <20230412224311.23511-1-robdclark@gmail.com>
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
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
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

Rob Clark (6):
  drm: Add common fdinfo helper
  drm/msm: Switch to fdinfo helper
  drm/amdgpu: Switch to fdinfo helper
  drm/i915: Switch to fdinfo helper
  drm: Add fdinfo memory stats
  drm/msm: Add memory stats to fdinfo

 Documentation/gpu/drm-usage-stats.rst      |  31 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  16 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |   2 +-
 drivers/gpu/drm/drm_file.c                 | 111 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_driver.c         |   3 +-
 drivers/gpu/drm/i915/i915_drm_client.c     |  18 +---
 drivers/gpu/drm/i915/i915_drm_client.h     |   2 +-
 drivers/gpu/drm/msm/msm_drv.c              |  11 +-
 drivers/gpu/drm/msm/msm_gem.c              |  15 +++
 drivers/gpu/drm/msm/msm_gpu.c              |   2 -
 include/drm/drm_drv.h                      |   7 ++
 include/drm/drm_file.h                     |   5 +
 include/drm/drm_gem.h                      |  30 ++++++
 14 files changed, 220 insertions(+), 36 deletions(-)

-- 
2.39.2

