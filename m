Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73EC6F0B77
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C726710E0C2;
	Thu, 27 Apr 2023 17:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C21F10E03D;
 Thu, 27 Apr 2023 17:53:54 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1a6ebc66ca4so65434515ad.3; 
 Thu, 27 Apr 2023 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682618033; x=1685210033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r7JtrQ77CpqZ0uEy+tIG0NqsG9JuxMjN6QjQNJWIquU=;
 b=L2bWeqrCC2L70jQ2hEirudGn7k+FZL2/87Mjs90rkz/kPRRuHWp6OiKbwdmlBlX/lI
 rkJPrrzgxTF9LmSz7fRYLdTbO+rw1Itx49QaPkeH1pcM8AGz8Mbl/TYzqrMjSv+PP9Yr
 juW+tM4VrneECMDFdvPAiowOHNsTnWWzSaBiUd4dk9h1+gpxpCEgFqcGd4S2Qp9y5D7G
 E8nKq2Pms1ySTlONLegg6nDtIYKDbri6qtn89WuFB18GyL525Sh8tMpvU2NFnKevpObc
 pmmeeirnLl8gT35Xg3qMCAok75nL8tV69ANpVarFaES/aSTLsQb32vaxf+LpVPu5JiA3
 83OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682618033; x=1685210033;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7JtrQ77CpqZ0uEy+tIG0NqsG9JuxMjN6QjQNJWIquU=;
 b=GKTLCz9bdpSOaGSMTJB0iYLu9uHQHFMFSbErSrJ4PixX7NsCos7aR7UQpzUYM+jNDa
 P+iWVFYh3b9w8j+0Enc8/u9CKUBjhV3wY3eCv7QyzofQw8GdKv0Mpy08zDAaOncoQrvN
 djpYrkw356h0H+NL5R+MN91Oafz6m+Zcs2ZdM2F5QvcDyEAMzoPWqoHgmyGV5YS07mW0
 AaLycI23JnD9dYxhXzaFmYK6PP515trh77StjjnCvzd/9SbPaurBpbAfYbOUG9E9QmKY
 u0ubJFH5OaChMhRpbITGjph844UTbo7fB90/EB9PyQErIzVbtJMKIIUClB5DwYt6NcJ2
 pCcA==
X-Gm-Message-State: AC+VfDyPRJAGmz2RAozohrJmy7m/VokdRH22o0TKjSdj92/P2lvrrtSJ
 a4IzLBnRk2H5/viMqyfDV2Vey7CTwOc=
X-Google-Smtp-Source: ACHHUZ4LVPkiCnSflLuvp4CIOCxMflamTbbG8UY5vbds8WnhLBlUH54sQOFejjE+V3wGmE+MZojirg==
X-Received: by 2002:a17:902:f689:b0:1a6:6d1d:bbf4 with SMTP id
 l9-20020a170902f68900b001a66d1dbbf4mr3149993plg.11.1682618032836; 
 Thu, 27 Apr 2023 10:53:52 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 az1-20020a170902a58100b0019cbe436b87sm11971018plb.81.2023.04.27.10.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:53:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm: fdinfo memory stats
Date: Thu, 27 Apr 2023 10:53:24 -0700
Message-Id: <20230427175340.1280952-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Luca Weiss <luca@z3ntu.xyz>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
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

I've combined the separate series to add comm/cmdline override onto
the end of this, simply out of convenience (they would otherwise
conflict in a bunch of places).

v2: Extend things to allow for multiple regions other than just system
    "memory", make drm_show_memory_stats() a helper so that, drivers
    can use it or not based on their needs (but in either case, re-
    use drm_print_memory_stats()

[1] https://patchwork.freedesktop.org/series/112397/


Rob Clark (9):
  drm/docs: Fix usage stats typos
  drm: Add common fdinfo helper
  drm/msm: Switch to fdinfo helper
  drm/amdgpu: Switch to fdinfo helper
  drm: Add fdinfo memory stats
  drm/msm: Add memory stats to fdinfo
  drm/doc: Relax fdinfo string constraints
  drm/fdinfo: Add comm/cmdline override fields
  drm/msm: Wire up comm/cmdline override for fdinfo

 Documentation/gpu/drm-usage-stats.rst      | 109 +++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  16 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.h |   2 +-
 drivers/gpu/drm/drm_file.c                 | 147 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  24 +++-
 drivers/gpu/drm/msm/msm_drv.c              |  15 ++-
 drivers/gpu/drm/msm/msm_gem.c              |  15 +++
 drivers/gpu/drm/msm/msm_gpu.c              |   2 -
 drivers/gpu/drm/msm/msm_gpu.h              |  10 ++
 include/drm/drm_drv.h                      |   7 +
 include/drm/drm_file.h                     |  42 ++++++
 include/drm/drm_gem.h                      |  30 +++++
 13 files changed, 375 insertions(+), 47 deletions(-)

-- 
2.39.2

