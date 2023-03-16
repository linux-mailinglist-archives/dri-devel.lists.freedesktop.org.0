Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A80F6BD4F1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7870810E227;
	Thu, 16 Mar 2023 16:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862D610E109
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:16:56 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id z42so2235476ljq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xXlc9vF6G3sZvPycBNuHzEsPEO/wmF2TIiB45AnhQ7I=;
 b=NFRrTifQ6ceg0YH5Z5Z/UwLCllx67e28nLQ/UX2mo8tszVmaEqqVjUo09+PZ8LV/3V
 VdAAyINaIrKs2KjFQGLOrzI7ot1HR/oLdIRXyT0tinVu28mAzqPVbi+4R+msFqrP9ko/
 G/D7oJOUrtCEyRX1exYXnTx6JghujmbYPYuaW1gVoErUygbNMN0IELVY6cSDCMmS8weZ
 D70gYo3yfk0OAFVXcWB5P/Bp7OiBhsjiAQdnjagZvof+eNYbnXgAint7/3j2i3VHvbeh
 j3KS32pDjhp+uCeVqay76WlHwycEd+rRr5zdqO00JaFDwYsQnZNnr2EZG9QSTPBObmsl
 kDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xXlc9vF6G3sZvPycBNuHzEsPEO/wmF2TIiB45AnhQ7I=;
 b=AakWJ927fFbuIWdryrqkrwNsJW/lp3GNrvHcvRBBnmAupWbwMt6b3+QSi/y0YtIwOK
 ldv26rpAhFqqGYj0iFS9MxZHtmMz2zaxSNdWXH7nn5xQPKMK0EAuwRpaqxCc//luRedq
 LE7pgAfa/xEYEiFRNxCF/mDgrS8ZO1iZ9AhoRXxNP8uER53w3/tKtS7dKXV5YEogiZ0x
 nj7K6M/wqACWVD0HjkJUpw05Z+yjoseLALr8IZCfBqZdrj5deDEzbv8Ja+icrF7G9ePB
 Ykc8fwWFMYcJXW+OWS7MGAoPmFDJI22qdgzmVWABYW4loygItO1mOu034O9+iyL5TYwa
 eq8g==
X-Gm-Message-State: AO0yUKVDypW6agwv0gZ30kLyw8x96mJl80v+ETMgAV+z1NPvTu2AhK5H
 0D6x6f2t14HMj+yG7cR1uTt12Q==
X-Google-Smtp-Source: AK7set8EFYL/OLctfZeOUfSeOKL94QIqpid3LrZLQU9RjtnGvmMFQCsC+Spqj6IVQ3VUL+0aVdd6Fw==
X-Received: by 2002:a2e:a54e:0:b0:28e:b911:9060 with SMTP id
 e14-20020a2ea54e000000b0028eb9119060mr2533338ljn.8.1678983414727; 
 Thu, 16 Mar 2023 09:16:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:16:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v7 00/32] drm/msm/dpu: wide planes support
Date: Thu, 16 Mar 2023 19:16:21 +0300
Message-Id: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
from this pull request, it will come later (I'm at the final stages of
polishing and testing, will be posted today).

Changes since v6:
- Really fixed line width check for UBWC formats (Abhinav)
- Also dropped R0/R1/R_MAX previously used by
  dpu_plane_validate_multirect_v2()
- Explicitly enabled SmartDMA for SC7280 following Abhinav's testing
- Reapplied Abhinav's Tested-by tags with the # sc7280 comment

Changes since v5:
- Rephrased wide planes commit message
- Fixed line width check for UBWC formats (Abhinav)
- Also drop struct dpu_multirect_plane_states, unused now

Changes since v4:
- Incorporate two fixes and two cleanup patches from Abhinav

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

Abhinav Kumar (2):
  drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe
  drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function

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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 290 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  20 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 169 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 111 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 866 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
 12 files changed, 718 insertions(+), 861 deletions(-)

-- 
2.30.2

