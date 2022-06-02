Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D253B9AA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 15:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB3010FE2D;
	Thu,  2 Jun 2022 13:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71A10FDFB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 13:30:42 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j10so7787113lfe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3whyehpi0aZCL0iJ2vFWoTKNdbN9RZd/7JoMAO4pSc=;
 b=w0WrhdGE6Xjz/JLc7g9BFS2Yxgn4ta8BjzEhys1Q09fliDtkgxhIZTu5Z3A3fTueO9
 8fqIdvpV6L80t6WIeGUQPWmfqPbL3DhbTELR2bL6DCzkFivhotsgkrJggun0OoJplkzm
 XqyJ7q7IKAod117wVmUZlG7OOnqnwwpeC9VVykFpPgDt4qDC+62A+USnA3V/9iB+fSDI
 Aa4ctRn0nA332JPPVy/0oil3RrjgSOgm+i+Oc+8niuXlELV54c1UC8+EZTpZKCLopcXL
 qIk7li5O+SqwjAdBGwsaXcbnL6CrmhbiYKroh/RPhVyhx1fK5ftyiU5E24Dcm1WUeNhU
 pYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3whyehpi0aZCL0iJ2vFWoTKNdbN9RZd/7JoMAO4pSc=;
 b=rK7qgHd1bWJfYrNkahGAO3JBs0lJEdf50643LA6wwO0ASVvhtTAeTmrfxqLeEfa4Ir
 YHAVlFm7J2sqIM6tMxvnIRuCGy6zhvuE/tS4VmhkJ7t74oDO+THMdeuIwhMPAxWTwmNm
 N5N+jFqpqPtsMjamdoYScCH6QQAe+QWdAdH+a19NvWdNtip8NCB6WaIHYHSQA50HLBxD
 RrrK90OiAqoDyn73PxczGKdxJXicmL5RPh8DguY6RROm8KBMkZNnXDfl2+RB/mCx9rb2
 7ocZDluqy3ZBYsH5m3Lie0VoWFsmstiDmS6UoWPX6S2adpnyhVOHXI4mmhbWgbPp+1va
 hm7g==
X-Gm-Message-State: AOAM530pUHeI0YhQ8ScsdAyNl5RdfjyYHAn3NjuSsCI4p9MtYpiwJ593
 5w10mxDxPLtGKsqOcKh66PkyrQ==
X-Google-Smtp-Source: ABdhPJwFnfXhKy3OI3IhgNTaU8saaxeVINMCI7Yz4/mhqO9i/NQxz2ls+H55yXTyM6K+JhIF1o80KQ==
X-Received: by 2002:a05:6512:31d3:b0:478:6a68:e24 with SMTP id
 j19-20020a05651231d300b004786a680e24mr3764732lfe.364.1654176640376; 
 Thu, 02 Jun 2022 06:30:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:30:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/7] drm/msm: clean up the hw catalog init
Date: Thu,  2 Jun 2022 16:30:32 +0300
Message-Id: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace superfluous cfg_init functions, which just assign a static
config to the struct dpu_mdss_cfg, with static instances of struct
dpu_mdss_cfg.

Changes since v1:
 - Turn catalog->perf and catalog->dma_cfg to be pointers, otherwise
   clang complains that they are not constant.

Dmitry Baryshkov (7):
  drm/msm/dpu: use feature bit for LM combined alpha check
  drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
  drm/msm/dpu: remove hwversion field from data structures
  drm/msm/dpu: change catalog->perf to be a const pointer
  drm/msm/dpu: change catalog->dma_cfg to be a const pointer
  drm/msm/dpu: constify struct dpu_mdss_cfg
  drm/msm/dpu: make dpu hardware catalog static const

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  12 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 500 ++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
 27 files changed, 282 insertions(+), 358 deletions(-)

-- 
2.35.1

