Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65246768326
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 03:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3A10E23E;
	Sun, 30 Jul 2023 01:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9108210E23E
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jul 2023 01:19:24 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99c0cb7285fso22809866b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 18:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690679963; x=1691284763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sAkJdVMkuvjO+L1XVtmOOMJ+1NqzdTIc/GS9/Y4UwFw=;
 b=x6TmKWUhOhH9a2mB5DTLHATx/BfAXydjKT1AZwCT19aQBQKuSSk7kWfz1/v+VDKYd4
 t4SU5aDCBFZVDSj/RtZsUH/ltRSYGfOdOGYWFfchUkD90Cw1KS/rouor5IxHlal9OPV5
 9V+w7GzkwPsnnDR1CNTgix39OD/9yZZbcNK0jFmxPAILLnCbCUc4hrGiwUYUcNjnsOuX
 bUP09HzsFPR64fYC3r2bebizx0eajAcF6nl76C0x3S8li2LXSXAbmhqYXiv+sBKViJWD
 4tx7UVtqcZPj/1ezZei7iwM7fXcrsaKO5c5lp1mdg9zWrE4Vti+NhSd6EoPVs2VI4Xry
 3iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690679963; x=1691284763;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sAkJdVMkuvjO+L1XVtmOOMJ+1NqzdTIc/GS9/Y4UwFw=;
 b=Ymkic657ChnPIvloCbfgqmvPCdLBv3aXISliMpN8t6ywF1fGGKI8KMdDWfXFvMOd7V
 xNmt1dhGD6zFlGfzI/lg5By8VmOIk6MBv1ec4UCEuGL8V+8eVYUv47gsr8Bq28BP2ZgQ
 kMPU+gV14uy9QCZn2FzdQsOrXF/RLDgYnotkffn+SKRB9iMoi/dHGfJcy8JwQIxbVIf9
 ywhgyNVvbYbojYJbys4QMUFSHbCh33OEU1gmdSVoyeolgIK7GDcOviXWcGuPOo2/JIAo
 Y6+vLQhVfR9Ror7A0hsd8Q1UZXe3CPjPcAzy7qFFKsxJqWILUehXWF+C+UsX8CDORjna
 zSQg==
X-Gm-Message-State: ABy/qLZ6N06PbT+6YyKon+hFIHF/pSRA9E2xMSr2af2AVQeJyq/dXPWr
 yC662qZndXf35vNypXVKBYf62w==
X-Google-Smtp-Source: APBJJlEbSDU3bcaRfH9XjvGTO7JWiNl9Chs0/0qUsjLCok+BK/r9q80nb3WdmOpXaclQItVLECY9Kw==
X-Received: by 2002:a17:907:7709:b0:983:cb6c:8aa3 with SMTP id
 kw9-20020a170907770900b00983cb6c8aa3mr2771114ejc.59.1690679962994; 
 Sat, 29 Jul 2023 18:19:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 rk21-20020a170907215500b00992ea405a79sm3915835ejb.166.2023.07.29.18.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:19:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 00/13] drm/msm/dpu: use managed memory allocations
Date: Sun, 30 Jul 2023 04:19:07 +0300
Message-Id: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a lots of places in DPU driver memory is allocated by using the
kzalloc and then manually freed using kfree. However thes memory chunks
have a well-defined life cycle. They are either a part of the driver's
runtime and can be devm_kzalloc'ed or are exposed to userspace via the
DRM objects and thus can be drmm_alloc'ed. Implement corresponding
runtime resource manangement for the DPU driver.

Dependencies: [1], [2].

[1] https://patchwork.freedesktop.org/series/119552/
[2] https://patchwork.freedesktop.org/series/105392/

Changes since v2:
- Added missing dependencies to the cover letter (Jessica)
- Fixed commit message for patch 4 (Jessica)

Changes since v1:
- Fix error handling for some of drmm_foo_alloc() functions, which
  return error pointer in case of an error rather than typical NULL.

Dmitry Baryshkov (13):
  drm/msm/dpu: cleanup dpu_kms_hw_init error path
  drm/msm/dpu: remove IS_ERR_OR_NULL for dpu_hw_intr_init() error
    handling
  drm/msm/dpu: use devres-managed allocation for interrupts data
  drm/msm/dpu: use devres-managed allocation for VBIF data
  drm/msm/dpu: use devres-managed allocation for MDP TOP
  drm/msm/dpu: use devres-managed allocation for HW blocks
  drm/msm/dpu: drop unused dpu_plane::lock
  drm/msm/dpu: remove QoS teardown on plane destruction
  drm/msm/dpu: use drmm-managed allocation for dpu_plane
  drm/msm/dpu: use drmm-managed allocation for dpu_crtc
  drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
  drm/msm/dpu: drop dpu_encoder_phys_ops::destroy
  drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 25 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 77 ++++------------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 10 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 15 +---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 21 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    | 19 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 12 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    | 10 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c    |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 11 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 16 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 13 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     | 12 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 13 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 14 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 13 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 17 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h   |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     | 14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     | 12 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 51 ++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 59 +++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 90 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        | 11 +--
 36 files changed, 218 insertions(+), 476 deletions(-)

-- 
2.39.2

