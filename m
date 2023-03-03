Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BB96A97B5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5104110E5DC;
	Fri,  3 Mar 2023 12:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E290E10E045
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:27 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id r27so3429463lfe.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xWJyIkCGI7cLLUbMwr7dz14LNqDGFBltpb6Q1FaYhLc=;
 b=VXDTBKZO8F6GUqg0iC1EFFJRaT6RmMzE07u5ioLCUR7xGiYsGlYr0edcFLR6TZsUq5
 2bSkfK32G13HgHVF3tdRfmlZuiuOoWgxatm3uxXqFZBLXFgy55bIeiPCEKu5vZU9X1Zw
 /YWv1NfJHhew/VFBoo231frb3vk/dkAFOFLzUyq/my2NWqdQccrTys7OzXYCy1AntSWT
 QG+JmlglKMUM9kWkpKLBMb3+QfsCWUK/BqBgpfHpTkfEWW+il86tGbgdENEUvrmSKOdw
 oO3kLiEAhKaSIPxpNzQfSLF6EC3mBLcCvbYyo5m7/1i28jwjnokNsSbk0FPMpY3aBSUE
 979A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xWJyIkCGI7cLLUbMwr7dz14LNqDGFBltpb6Q1FaYhLc=;
 b=qDhuY1nP0f9TUdwOPT56H9py3sDmxhI+pq+N970P+y4SGdQHDmcRJDNRc4S1+augEP
 b6WgesiCpNEHEKZPbCEqq8S2ZvxN3y9kllTajn9+E2FZxwrGmzQFYiXyhCH1iHe7Apdo
 N4gwLPbgeuZPfDL68ad8SDK9Sv9r8g+y5SX/Mdh86voIyI0/hbTV1xNWJdp506ZCCy4Q
 aA8GK6pyMWwgj+ggX34RGnQvR0xtbWCH0Z/PXhg0tqpVJtIUVw3AmKZLd0tqTWeoAwpO
 g0kRDjIUNA0vgn1NZIDbtPYy920tpQjW7OfIPdvqHZsDDjEjyc1A1sxTwKhnBaMItSwO
 8EqQ==
X-Gm-Message-State: AO0yUKV7PmVj98WLUiE/NTR2odDxo6s0BukKS2Szp3QNW1at6mCd+8TJ
 YWo3lIiauSlqedmeagFNX6FvsA==
X-Google-Smtp-Source: AK7set8Fw6i0vFicIG3YIQnRVDRQvXqZ11dHyDrE9Grt4/wq+U4NNPbvAzsG8DFrbXFQ1o0vnSwxfg==
X-Received: by 2002:a05:6512:242:b0:4a4:7be4:9baf with SMTP id
 b2-20020a056512024200b004a47be49bafmr600068lfo.59.1677848246174; 
 Fri, 03 Mar 2023 04:57:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 00/30] drm/msm/dpu: wide planes support
Date: Fri,  3 Mar 2023 14:56:55 +0200
Message-Id: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

This patchset brings in multirect usage to support using two SSPP
rectangles for a single plane. Full virtual planes support is omitted
from this pull request, it will come later.

Changes since v3:

- moved if (!pipe->sspp) checks back to the calling site, the caller
  should know if there is a backing SSPP or not.
- Restored state_idx argument of trace_dpu_crtc_setup_mixer trace point
- Removed .smart_dma_rev from dpu_caps
- Added cleaning of multirect to _dpu_plane_atomic_disable()
- Per Abhinavs request split the SmartDMA enablement patch into the
  "verified by me" and "the rest of the platforms" patches, which is not
  supposed to be merged in. Users of other platforms are supposed to
  verify multirect support on their platforms and then send patches
  enabling SmartDMA for their SoC.
- Expanded several commit messages

Changes since v2:

- Renamed dpu_hw_pipe_cfg to dpu_hw_sspp_cfg
- Added a patch to clean up src add / layout for the solid fill planes
- Fixed several comments and commit messages which caused confusion
- Added documentation for new dpu_plane_state members
- Slightly reworked dpu_plane_atomic_check() to make it more logical and obvious.

Changes since v1 (which was ages ago):
- Rebased on top of 6.2-rc1
- Dropped the controversial _dpu_crtc_blend_setup() split patch
- Renamed dpu_hw_pipe to dpu_hw_sspp
- Other misc changes

Dmitry Baryshkov (30):
  drm/msm/dpu: rename struct dpu_hw_pipe(_cfg) to dpu_hw_sspp(_cfg)
  drm/msm/dpu: move SSPP allocation to the RM
  drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
  drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
  drm/msm/dpu: move pipe_hw to dpu_plane_state
  drm/msm/dpu: drop dpu_plane_pipe function
  drm/msm/dpu: introduce struct dpu_sw_pipe
  drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
  drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
  drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid
    fill
  drm/msm/dpu: move stride programming to
    dpu_hw_sspp_setup_sourceaddress
  drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_sspp_cfg
  drm/msm/dpu: rename dpu_hw_sspp_cfg to dpu_sw_pipe_cfg
  drm/msm/dpu: drop src_split and multirect check from
    dpu_crtc_atomic_check
  drm/msm/dpu: don't use unsupported blend stages
  drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
  drm/msm/dpu: drop redundant plane dst check from
    dpu_crtc_atomic_check()
  drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
    and dpu_format
  drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
  drm/msm/dpu: add dpu_hw_sspp_cfg to dpu_plane_state
  drm/msm/dpu: simplify dpu_plane_validate_src()
  drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
  drm/msm/dpu: rework dpu_plane_atomic_check()
  drm/msm/dpu: rework plane CSC setting
  drm/msm/dpu: rework static color fill code
  drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
  drm/msm/dpu: add support for wide planes
  drm/msm/dpu: populate SmartDMA features in hw catalog
  drm/msm/dpu: enable SmartDMA for the rest of the platforms
  drm/msm/dpu: drop smart_dma_rev from dpu_caps

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 289 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  23 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 169 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 111 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 756 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
 12 files changed, 719 insertions(+), 735 deletions(-)

-- 
2.39.2

