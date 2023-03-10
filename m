Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189FC6B32FC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:57:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFC810E1EA;
	Fri, 10 Mar 2023 00:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D0810E2D9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 00:57:07 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m6so4619677lfq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 16:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678409826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CXNBgv/8op414iizCH0rh4TOGJ7vEdMfvzdSc2r1T1c=;
 b=nx/ycAonEUAVdYOGPd8u6RnMS3v3ENtNCLCSwY8ytdVWHTXDZ5owbUqSz6T9mq7YCH
 9SW3Zfn2x8RjBte20OOLHld++6vGh4E/LE2niLhoiVHjHTjvuSFpMn8FQ2U1xMwgbSjM
 VbXb6Uvb20c3tI0VNDQpX+Q8bJXHfg0DQ3CJBvwAh7Z3Y4eL8/19wG5l6q3GMVgLjO7j
 Gs13gRJcb890shvqHWKThNhA/6U40ZmdLm8p1fDTbrkst2Xj990KtBU0ASzbUdBaFig4
 ML5GDK6rn9KVlbiymqpWGgIVjozjNHpyquixSw6iMzQgvyYTAUG4tVYiC6bEhnNyiRxn
 3Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678409826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CXNBgv/8op414iizCH0rh4TOGJ7vEdMfvzdSc2r1T1c=;
 b=dL6ZJFiqWi7e4eIHqjtIYTG/fEI4oMK/aTnU/chlrKZPil5PRsYq4hG59p94JWbn9G
 e8lSWNDMjcDsV6VZusRgJ8haYBBOInHmD5YPJm6mFGb9SHMguJobi4c6DJXMqr5eBonU
 h47Q/H0LMaGeQuODBqYxvtsqdzQAm3KuO4zNH0GoAph744syPnKXn/da97UUpuNKvYq2
 SZjvgbTNgI7WSqtecmw52NI9FZF+0F4k5yRh19p589BfC/oT3Hshlzcj38ulGeoOEJzh
 uersU+2/5aL61bprSMoLQYcQ+Zu/0WWF4T+7/ge/Lkrpa6QE7PKnL1HwxmdQHJT56sQW
 9r2Q==
X-Gm-Message-State: AO0yUKUQbQkyTIdM931FfixOWSne4IsavOFiBYnNkBhDOovs9ieE4J+V
 hSdgil0pAYF/d5hRXUfVpCGj2Q==
X-Google-Smtp-Source: AK7set8BHBG4JGAhw+8FCyzCZSSM8JyIhuJefCX4JI45/CKh/fCvvn+/3WqOAj3kllZ8TvhlexKjyw==
X-Received: by 2002:ac2:5283:0:b0:4de:21c9:8a37 with SMTP id
 q3-20020ac25283000000b004de21c98a37mr7541874lfm.1.1678409825915; 
 Thu, 09 Mar 2023 16:57:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 16:57:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 00/32] drm/msm/dpu: wide planes support
Date: Fri, 10 Mar 2023 02:56:32 +0200
Message-Id: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  23 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 169 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 111 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 849 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
 12 files changed, 711 insertions(+), 844 deletions(-)

-- 
2.39.2

