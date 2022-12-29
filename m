Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58826590D5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 20:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C2910E201;
	Thu, 29 Dec 2022 19:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EB910E205
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p36so28725750lfa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 11:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LfRSiUU7kUVFfBn/yyitjedlmqXmIZK52okMfhN2BfA=;
 b=gT3lhM3Bifi9riXVEu3gooBn7WCtYn8k9KbVM/T0J7jp3KGU0DOR4AOiRdjCuHeXCU
 pHGZSgWNeTxwK/4GXvNT664HF4TrC9XcVPq14oW7p4D85lHY1jF4zP+zwWeLANweS8Bk
 WtFNbglASnv29sRMRa9wJDYBbpNXdtdmH46AXoYo95SU6/YxsZGmYMPErzWntI51Eejm
 EB/sPma7uQEkg3LOjIUwJMxLI6OXchbgpNGEZdIFA/C9VZsLp4XF8Jp+5CEYS70d+zNB
 UnjXcUdhivoNjnX39KUekI1ktK1IyQebKrFjP7M/EywQeaTd0PvWvXMVKSQ1feSzdMBL
 PLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LfRSiUU7kUVFfBn/yyitjedlmqXmIZK52okMfhN2BfA=;
 b=oMkgdaZbXWDyKLdhu/Z5zERVFS6r+O+nSCUk4UNhtVi5n1AdYxzZWAPRgyQQ3lIBKF
 oEn2BwE30cc1x9kCYuc4Ox91PD5evBKgOkrnKBCqfF0a9+WteENuBQbFOhk3Gw03r81f
 efIAkQH4TKKEcLQtoac3NZLnbeQy+c3yvHL00aeHmdyUcDlddGPvw/76/vXVYIbj9j+b
 W31siH7UYiE54daUELiS0Z1mxu3q+T1qCen4QVWNTZqgImP7SNCuXCKrzA9xh65Obkls
 66dmDLKsyjlxbvkwdSg8UbeCh4aBWahVyZ+BVEfafTfIet06Z5xc4R50VCZrm2MsBKON
 UN1g==
X-Gm-Message-State: AFqh2ko+FWc5jLl529oI5ZtUvkiTg/7unEn/1QtIK+bRCr8rbl/JX//u
 Rf1SLEsEEVviJmSAh/wX9nBtBA==
X-Google-Smtp-Source: AMrXdXuFpQZs/jqCwM1uA9TwqxOCSHCJeyd7H1H3TzDgTmB5TUUlm/iJ2NhqHBFltsUEFwhJhqGz+w==
X-Received: by 2002:a05:6512:1515:b0:4a4:8a04:4b37 with SMTP id
 bq21-20020a056512151500b004a48a044b37mr9700717lfb.32.1672341538090; 
 Thu, 29 Dec 2022 11:18:58 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:18:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 00/27] drm/msm/dpu: wide planes support
Date: Thu, 29 Dec 2022 21:18:29 +0200
Message-Id: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

It took me a way longer to finish than I expected. And more patches that
I previously hoped (despite having several patches already being merged
from v1).

This patchset brings in multirect usage to support using two SSPP
rectangles for a single plane. Full virtual planes support is omitted
from this pull request, it will come later.

Abhinav, could you please pick up patch 1 for the -fixes? Otherwise QoS
is not programmed correcly.

Changes since v1 (which was ages ago):
- Rebased on top of 6.2-rc1
- Dropped the controversial _dpu_crtc_blend_setup() split patch
- Renamed dpu_hw_pipe to dpu_hw_sspp
- Other misc changes

Dmitry Baryshkov (27):
  drm/msm/dpu: set pdpu->is_rt_pipe early in
    dpu_plane_sspp_atomic_update()
  drm/msm/dpu: rename struct dpu_hw_pipe to dpu_hw_sspp
  drm/msm/dpu: move SSPP allocation to the RM
  drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
  drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
  drm/msm/dpu: move pipe_hw to dpu_plane_state
  drm/msm/dpu: drop dpu_plane_pipe function
  drm/msm/dpu: introduce struct dpu_sw_pipe
  drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
  drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
  drm/msm/dpu: move stride programming to
    dpu_hw_sspp_setup_sourceaddress
  drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_pipe_cfg
  drm/msm/dpu: drop src_split and multirect check from
    dpu_crtc_atomic_check
  drm/msm/dpu: don't use unsupported blend stages
  drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
  drm/msm/dpu: drop redundant plane dst check from
    dpu_crtc_atomic_check()
  drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
  drm/msm/dpu: simplify dpu_plane_validate_src()
  drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
    and dpu_format
  drm/msm/dpu: populate SmartDMA features in hw catalog
  drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
  drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
  drm/msm/dpu: rework dpu_plane_atomic_check()
  drm/msm/dpu: rework plane CSC setting
  drm/msm/dpu: rework static color fill code
  drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
  drm/msm/dpu: add support for wide planes

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 283 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 163 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 104 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 735 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  25 +-
 11 files changed, 685 insertions(+), 717 deletions(-)

-- 
2.39.0

