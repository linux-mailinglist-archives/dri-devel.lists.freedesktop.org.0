Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C2D53AAD0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 18:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2557D10EE6C;
	Wed,  1 Jun 2022 16:13:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8765710EECC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 16:13:53 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id y29so2533840ljd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9xbAye+km4e1PFapdp7FfBArJEJLR0pC6Qj/2+Uu54=;
 b=P7c8bft7rzjQmuIK3eBPro9p+e63zwRCElPjHnhF9iB7WH41V0omjYi3+HJMoY3xoR
 MOrT3j2gYj2ueX/pl397yjMwen+IKdat+8lI3MMBAp+bJPvuxVorswttzrWQQpnd5Y1F
 X3E/jdWGJyTvQNwYgrncj38RZ/Qa90YlnpQGVedR70DXYU3OiSRDyOEywl1gLf27NDuM
 8W7b5S9JHUhnZOdpP8rd4tdMyXJzawK6DrUVP5wQgSJT4YX/q4fRsxMJznhS7wUxtzho
 N4WTuu8/6hBS/AdEXefMcSm23fML1u8BAVKT6Jqdw3vPc0L1UyYVsWiwrH62TpSa+OCt
 /B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j9xbAye+km4e1PFapdp7FfBArJEJLR0pC6Qj/2+Uu54=;
 b=B5MO4NPyVC6Oc1W8g9tKrLLaAgsiPRv9Cr6mWiPCOp2V5D/Rp1D6UDlKYlzh+GoqGv
 R09DLPsqr1xSPzDzRSpx8PUfyayIjW3ERDpRHQZ42IwHUN2yT/7HJx10U354xVXKys6I
 grBRtd2R8Afrj8l7gGFBuAZT90wn3cGfTKPXRRxNrGD/1oKUBMcJwkYW2X5cdGmS9JYf
 oDl6clLA71ZZnJFsRSFRMiyAYhzAlPsAYwc6mAY8fvUP3HAeY7FGgD4l1hE1xufAJZ+y
 nkaf13JGMG0Ev4gTKlDNbb921dtbVHeMOaIMMnGO1CyScpgIIgPX5kOt5VlteoUCmMKs
 4JOA==
X-Gm-Message-State: AOAM533K2x0l9m6We22O8oJBRhva/v1RiyOAnOlhrv/+7IZtJZQD4HES
 Ii7hm34kOViGceYlYPgrgfh0zyZJcchHBA==
X-Google-Smtp-Source: ABdhPJxS0sYSzLqJcAZ0oz42b/ywmKG4qFCHR1ER0yMVDC7xpxE4M2h2VUeS01TFjENuq/NLzDiuoA==
X-Received: by 2002:a2e:b812:0:b0:253:e6c7:259 with SMTP id
 u18-20020a2eb812000000b00253e6c70259mr31169131ljo.487.1654100030380; 
 Wed, 01 Jun 2022 09:13:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 09:13:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 0/4] drm/msm/dpu: cleanup struct dpu_hw_blk_reg_map
Date: Wed,  1 Jun 2022 19:13:45 +0300
Message-Id: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
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

Cleanup the fields of struct dpu_hw_blk_reg_map, remove unused fields,
merge base_off with blk_off into blk_addr. This patch series depends on
the patch [1].

[1] https://patchwork.freedesktop.org/patch/488001/?series=104613&rev=1

Dmitry Baryshkov (4):
  drm/msm/dpu: drop xin_id from struct dpu_hw_blk_reg_map
  drm/msm/dpu: drop length from struct dpu_hw_blk_reg_map
  drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map
  drm/msm/dpu: move struct dpu_hw_blk definition to dpu_hw_utils.h

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |  1 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    | 25 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   |  2 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |  4 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  6 ++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 18 +++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +--
 26 files changed, 28 insertions(+), 85 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h

-- 
2.35.1

