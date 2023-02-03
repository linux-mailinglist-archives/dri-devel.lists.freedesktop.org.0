Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B318D68A18A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5738410E84F;
	Fri,  3 Feb 2023 18:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2DD10E84D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:35 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id f7so6020878edw.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WGKE13ayREA4KV+L46TJJMJbDC7nd328BU5Zt24LcKc=;
 b=ohhqCzMssyMZXUTrNFtbgp36X68VKAkcwae+aLZJSMqLDTZoJ7xBrP636bMX4E8z0x
 Oc1aRjPmNMOgaZjJM4RKvBTit2Ur6Ey7xBRSNVHW5lGdQxhyQHGICXgcYn/WkgfRaJib
 fYHY8hVGnptT3lxOWSy+k8WwJYP/ontzbKYJgpjhx8hJQxDDGx9dXJvYuJ+KqUf1F3Vd
 nLvDjV/Rb9z+b5V743Io2f8QrTy/TYvQGr82d+XVpuNGhWGXYGymFSL8dvQWO3J0jA9h
 0O7Sb03oB3RsillTO0L1aR9D+XE9ABPgwIz69lou8h54/Tt2Bi4P89xeyj/KWp1iRbrU
 VRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGKE13ayREA4KV+L46TJJMJbDC7nd328BU5Zt24LcKc=;
 b=Ze52n5Bv6TQRjcs+oqM0A49Ur6M/OuLL5V+lf01BJCiXJkDzebgtXLpy/U14auOowz
 xl+3SKq33lHFOtTXufyJUz3Bmm9EbOPsT+ixpDQKCuQM7vwmS1OydjtI5yHNb0IhsQK8
 zWIQCl4TqKmW/Kaoz8TZULvIuQPJbVywFSx3e96OVJgu8cW/UJ2z7msUWtHdOOtNCOOw
 I0ByIkPjov9t2IQ1aJyOIuZA+3iHAICBxo2pZDMBm5K6SCKdTA3g0yxrxBNpfstpmPFE
 1K3kN0ggfHy+9+llxvkb3QfFlX6Kcuot0orUoDPt3DGMSedq70gkfVCnLfrGhkAwuECy
 9DIA==
X-Gm-Message-State: AO0yUKXI3YghgHN4KDOVLhLNudiWgJk8KzhSQvP3Na1POZ04bV3mxMrg
 EL7t/H5aKTp27f6LaiHgjJIlerXxf8pChV0v
X-Google-Smtp-Source: AK7set8ZgYcNscYoblwstBhus5m0eJK9ttlcrjfP1UiARr40MJVBgTPYpEIrJ7B/p8Ed3EyUrLQpEg==
X-Received: by 2002:a05:6402:50c7:b0:49e:2109:6f57 with SMTP id
 h7-20020a05640250c700b0049e21096f57mr14717077edb.19.1675448493730; 
 Fri, 03 Feb 2023 10:21:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 00/27] drm/msm/dpu: wide planes support
Date: Fri,  3 Feb 2023 20:21:05 +0200
Message-Id: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
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

The review of the first half of v2 took more than a month. Let's update
the reviewed patches in attempt to get the first half of the series into
the acked and mergeable state. This would allow us to lower the impact
(and the patch count). At 27 patches this series is approaching the
limits of manageability.

This patchset brings in multirect usage to support using two SSPP
rectangles for a single plane. Full virtual planes support is omitted
from this pull request, it will come later.

Changes since v1 (which was ages ago):
- Rebased on top of 6.2-rc1
- Dropped the controversial _dpu_crtc_blend_setup() split patch
- Renamed dpu_hw_pipe to dpu_hw_sspp
- Other misc changes

Dmitry Baryshkov (27):
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
  drm/msm/dpu: drop src_split and multirect check from
    dpu_crtc_atomic_check
  drm/msm/dpu: don't use unsupported blend stages
  drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
  drm/msm/dpu: drop redundant plane dst check from
    dpu_crtc_atomic_check()
  drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
    and dpu_format
  drm/msm/dpu: populate SmartDMA features in hw catalog
  drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
  drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
  drm/msm/dpu: simplify dpu_plane_validate_src()
  drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
  drm/msm/dpu: rework dpu_plane_atomic_check()
  drm/msm/dpu: rework plane CSC setting
  drm/msm/dpu: rework static color fill code
  drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
  drm/msm/dpu: add support for wide planes

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 285 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 168 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 110 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 745 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  25 +-
 11 files changed, 707 insertions(+), 721 deletions(-)

-- 
2.39.1

