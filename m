Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA19702FBC
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3EA10E1EB;
	Mon, 15 May 2023 14:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED20D10E1EB;
 Mon, 15 May 2023 14:30:45 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-52867360efcso9076126a12.2; 
 Mon, 15 May 2023 07:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684161045; x=1686753045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wnZ9D21xzUPORZdBoaAd712UMhIWRfvjN7BdaMIkqdk=;
 b=jsjrWitfOWbVsXPs6B5Lia8wkg2dLmz6o1d406QcFVfo+pyvuvyJUDtrVrDpo/x51a
 iUa7DRKHwe+Y2TYOh6H7L7rJBd8pZRgLa3kotBIFD06zze2ApQWxZrM2yzbSsnqGdws3
 hB1E9KHVnknZjM8apmNiuBCAODD+L13Fcr5+7UOnasTmc5gVCqNDJJok5hG9lTQFzSsI
 47Y0FVm+ddZICgDFbREMkvMQ/ZcCD3jE5hkRDfNFpaYibHWTOrI7kTQRxbZCp4MVl3Uh
 vapTVORVVlzm24Z4RNvraER4YgtSeUjYDoCIpROMsN47KKOZBGd7rtydXTkojkexyeLA
 DKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161045; x=1686753045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wnZ9D21xzUPORZdBoaAd712UMhIWRfvjN7BdaMIkqdk=;
 b=P+/T/R97faCVM/G8/i+ZMxwSPX0lHlE6/skxVVfFXYSlgYShV9y5oaLRYpNWOt2ELg
 0/2PMzG1YQfFDbQS2AqNDhCzQMzBdRy8KzwC5h/lGs02mZkg8SceAbgJQVDRjV88HSBV
 OIhox70C0tPsfWz7x+KQ772nbjgVmWVAV6Gf980P1Oc6naSnv4ciougcDIkVyQYXYE1T
 o5RuUJTHUDb6yj952QFOUF6UZk56QIYC9yj/BLVJ6OlzGjx7Jk6lqpG5KcCjFwKwjtCW
 +scPyWlbNREf+v2paXvNEY1iVyksaLYCRNGGC9p9ro68ZpCnYdhQ4G4lQYpYvCsul04S
 LwVw==
X-Gm-Message-State: AC+VfDyc3D0kbGikN3RHb/LLiRt9cD4lirSaf+M6jDVgAjDN1cP6/ftB
 4Fgm4AVODQQboMMDhNvvoW+4jDAcIFQ=
X-Google-Smtp-Source: ACHHUZ4nzYaFbPRfq7KOx4sRIQWnNBXWBHnP0pDxZJRMeUoSpyIWQjFgCTyi+zlwTFFGBymq4HyWYw==
X-Received: by 2002:a05:6a20:7fa3:b0:ef:f558:b76 with SMTP id
 d35-20020a056a207fa300b000eff5580b76mr42340931pzj.5.1684161044688; 
 Mon, 15 May 2023 07:30:44 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 e4-20020aa78244000000b0064928cb5f03sm2590440pfn.69.2023.05.15.07.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:30:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/9] drm: fdinfo memory stats
Date: Mon, 15 May 2023 07:30:07 -0700
Message-Id: <20230515143023.801167-1-robdclark@gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Lijo Lazar <lijo.lazar@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rob Clark <robdclark@chromium.org>, Guchun Chen <guchun.chen@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Peter Maucher <bellosilicio@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
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

 Documentation/gpu/drm-usage-stats.rst      | 101 ++++++++++----
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
 include/drm/drm_file.h                     |  51 +++++++
 include/drm/drm_gem.h                      |  32 +++++
 13 files changed, 378 insertions(+), 47 deletions(-)

-- 
2.40.1

