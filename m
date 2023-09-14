Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCD779F9E5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8E810E512;
	Thu, 14 Sep 2023 05:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515910E50B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-52f33659d09so543315a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668049; x=1695272849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/FDKM0kqt8x0UbxVfV3bjcjIyAdF1y2yMeGqfjlTgnI=;
 b=ZhssrpKmM39ELgey1AmakZ/rkTuglUDl57eTLzV1l3p0AMPkN0eT3yLXFQlgtGDd8e
 fu9Wm60LABUC3mwgNIHBLAt+7sNFjbjuuGtNopbAhF7jtudvWm44WLRrMGFXk10AU64Y
 Mc7FaNitkbJ49SeCTzxMnLCsbHh0Rz9hHmHH+oYCbc54H3AyQrZpe9Nw+9vVe3FQq/96
 Rxb9Au68haXgMKaG/wUdMgjGdr/k8k3NyujYKeqP9D+nvhRBcSCu8/xf8Z3Tv33o8uHe
 GvgC0ZA6mPhcM1wHorkaadGT6xE7vLhghfOzvTdesTLiy+5DAiS4z8Roy8B0Gqg0yU6s
 Xsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668049; x=1695272849;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/FDKM0kqt8x0UbxVfV3bjcjIyAdF1y2yMeGqfjlTgnI=;
 b=RDQhRtp35IWSlIWVnRApli7RHvExc+lUiKMMw1SzjXuwArUoAxP3Rr8R12mYTpPHM+
 akKOxLX+NfJyYM2w8sq2521aSm5TSQKuoXGwb8J0XqgtdPtYBuEGb+MAYarDBmh62wuD
 SjPAcmoh9GNQK5lFmqjxpIXcvQImSEpfyPJynQz+bHemJZp/Pky/g6zJekcg685cxHmM
 oj/U9uzS+ZSIl2Txh03AOWDRv+I8dUSM+J29YMaLZeNnTPMpz+TCCve/O2HLDlUTcPnk
 QfhP5Pww1oDd/2ajf4aCbZa+krnWc6q2uAFSbv+7h+2/EZI+17idDmZKkvpnSAasrel7
 LsEQ==
X-Gm-Message-State: AOJu0Ywgj5XpboaXpwHfCP1QFMC0l3gZzibowuHVf7TMNKwH+gat0vAC
 LcjM/sX3KfsHOY1js1hBd69ZVc8/tHCVxEx2XRQ=
X-Google-Smtp-Source: AGHT+IHtMHUUYGm+veS7ba1V0nWBgHsVD++J4m55U2tdtgdIV/FDoAJGB8Y/p4NrroeH4BC5sdNsBw==
X-Received: by 2002:a2e:9791:0:b0:2bc:c557:848a with SMTP id
 y17-20020a2e9791000000b002bcc557848amr3834635lji.50.1694668027841; 
 Wed, 13 Sep 2023 22:07:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 00/12] drm/msm/dpu: support virtual wide planes
Date: Thu, 14 Sep 2023 08:06:54 +0300
Message-Id: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Unlike v1 and v2 this series finally includes support for
additional planes - having more planes than the number of SSPP blocks.

Note: this iteration features handling of rotation and reflection of the
wide plane. However rot90 is still not tested: it is enabled on sc7280
and it only supports UBWC (tiled) framebuffers, it was quite low on my
priority list.

[1] https://patchwork.freedesktop.org/series/99909/

Changes since v2:
- Dropped the encoder-related parts, leave all resource allocation as is
  (Abhinav)
- Significantly reworked the SSPP allocation code
- Added debugging code to dump RM state in dri/N/state

Changes since v1:
- Fixed build error due to me missing one of fixups, it was left
  uncommitted.
- Implementated proper handling of wide plane rotation & reflection.

Dmitry Baryshkov (12):
  drm/atomic-helper: split not-scaling part of
    drm_atomic_helper_check_plane_state
  drm/msm/dpu: add current resource allocation to dumped state
  drm/msm/dpu: take plane rotation into account for wide planes
  drm/msm/dpu: move pstate->pipe initialization to
    dpu_plane_atomic_check
  drm/msm/dpu: split dpu_plane_atomic_check()
  drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_pipe()
  drm/msm/dpu: add support for virtual planes
  drm/msm/dpu: allow using two SSPP blocks for a single plane
  drm/msm/dpu: allow sharing SSPP between planes
  drm/msm/dpu: create additional virtual planes
  drm/msm/dpu: allow sharing of blending stages
  drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/drm_atomic_helper.c         | 110 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  59 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  26 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 671 ++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 130 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  36 ++
 include/drm/drm_atomic_helper.h             |   7 +
 10 files changed, 924 insertions(+), 152 deletions(-)

-- 
2.39.2

