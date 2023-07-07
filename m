Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 561BC74B9D8
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C1510E60F;
	Fri,  7 Jul 2023 23:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D145B10E60F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 23:12:54 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so3966579e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jul 2023 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688771573; x=1691363573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2n/H2No59Vs8LK9WsAaarYGCaij4epyQSN1PdTEfblI=;
 b=Dla03EkKNz919pj9om1kw3yNUe83gMpfMMk7prnS2fq6OxdIOi0pnAfT8Tw/SoS0vc
 mHOagzXXHLE6k6Z2hFCGwmhbOGPnSuZf/82RkP3L1qe9h7VqhbDAVbRypCk4YU4vAXlI
 B7nMDeQ+xjdnZ1oUeR/hUG7NKr3aR8yt3GSo//FKcVdF8L5vJA1JuU8C4gFt4vS8xfmt
 6v36kZSoZw/PNEPIE+9sLH9ZS8d/aN1gwyrkVW0H59xIQeEL7dO9VRsOObleauXa3rYa
 ymRioYk5GIyRVwcSPelmy9+upuwVZRNwsvf7E/OdMj3a5Lg8yZkKHFKF5pMb+2aWRKYG
 afVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688771573; x=1691363573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2n/H2No59Vs8LK9WsAaarYGCaij4epyQSN1PdTEfblI=;
 b=WkdbYnp5k9P3eHiF4b6yJDgWbe5EMSq14DippGOTs61ZqSMTg1g9w57TrpPgtdETXJ
 SZSwoBMp1ZMVek0Ck+YN7+RwxjCRNNeezRW0zbGf0Tc8+cHQz6AYS7nHr2prXb56BptO
 eyqnXtbqEBv7w6JwHVmi4X6v5UzME6HrA0RfyKh0Uahf2u8Z8wVFrfejo82l3O/8S3pp
 dvnpNy3PVkzOboLiJvZ3ETqYSlThiDqq1Z/phSobuQFxwlKtbUwRdfIagCxO4XNLxSLa
 I1UUgXnyOoXtaPyWUdBHe4ol0Zk/FKhDIE5QzbTfGjU0L9xaIjAK5E5zNCHPX4TQUSNU
 TRRA==
X-Gm-Message-State: ABy/qLaUnm0HP30usC050Kpj5X//hd7a7geogMM6IBdLND5KZ7IH2xVD
 jXR91sL9IZTc893LMtef5K18DQ==
X-Google-Smtp-Source: APBJJlHaSNkPJSckPK3AAkcQy9zW4vvooecLgJWL8z8f9yFYqF9oVcu6N208L/2isuZAq1kMddZLaQ==
X-Received: by 2002:ac2:5b9b:0:b0:4fb:79b5:5512 with SMTP id
 o27-20020ac25b9b000000b004fb79b55512mr4309889lfn.66.1688771572596; 
 Fri, 07 Jul 2023 16:12:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d1-20020ac25441000000b004fb7388360esm841643lfn.188.2023.07.07.16.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 16:12:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 00/13] drm/msm/dpu: use managed memory allocations
Date: Sat,  8 Jul 2023 02:12:38 +0300
Message-Id: <20230707231251.3849701-1-dmitry.baryshkov@linaro.org>
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

Please excuse me for sending v2 on the same day, it fixes erorr paths
for drmm allocation code.

In a lots of places in DPU driver memory is allocated by using the
kzalloc and then manually freed using kfree. However thes memory chunks
have a well-defined life cycle. They are either a part of the driver's
runtime and can be devm_kzalloc'ed or are exposed to userspace via the
DRM objects and thus can be drmm_alloc'ed. Implement corresponding
runtime resource manangement for the DPU driver.

Dependencies: [1].

[1] https://patchwork.freedesktop.org/series/118839/

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 15 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 12 +--
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
 36 files changed, 216 insertions(+), 476 deletions(-)

-- 
2.39.2

