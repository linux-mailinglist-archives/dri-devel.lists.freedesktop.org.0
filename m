Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD794AF80B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 18:25:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F3B89CE1;
	Wed,  9 Feb 2022 17:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413FB89A34
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 17:25:24 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id 13so5538444lfp.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6QoNkw201jmWYI2ZvFOwA35KwNfMMnBn8u5YRCFPRuo=;
 b=lekhbXiwBQhRlgUOFnQGhFF2kovB0evdrZ1prOnNfCG93Uplho9arDXFUwEwD8QK5+
 CL8ASVgUHtY7q97MaI/im2nZiNIIdSs1J8RS2gFLTmdrbAVOqthhla0K74B3FZ5+xPZ+
 4LjBDtIfK90r2gjzi6qpi5fKnft2Lxn6pPRkJsibAFxZ+xv4Y+sLsJeM9ubKSAU8WChw
 DkhfNOXtnG1G0N1EJjRBhT9BCD4L1EQg/IUjhqqjwyWmH7QQgaQKVk9UIsO58pKBIfaX
 JCwwZ/y88m+VRoWn589Zpm3A94Ad91AzgkQ9a/JPD/wO+TFTCDqTQfj8Gj5fkW2eZRDh
 67cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6QoNkw201jmWYI2ZvFOwA35KwNfMMnBn8u5YRCFPRuo=;
 b=Bc7voMS5Ig8QaAAuxgDZXwbsXVNI7TdHpfXxXHmAPTjH2o6JCUJfiKECY5xUknpArk
 xkC6S/5rhiVvWo6gz1+gJd8ziZiqDT/K83eIe30mfhSDhxYzQzWg6OYLWquNRYzlPFgp
 lbjM0jPyCJnQlBxccAxRbJsKRgmOoUck2SIhAsGhg1lh+a+2visi1R0H2a6ZGSoeJJus
 WgdoYHxQyUEPZfCphXR1z40NiaL+OT7StzWLtAgcqWGQNwyn+huQHejybvVlWoVZADxX
 YtkUmtPqlMRCqPbzuEmm98syE/tgblyCgn/KY5w3NztLPMaFFvwjoL1R8YwT3fDryytc
 9Gew==
X-Gm-Message-State: AOAM533gfCPDtp8H82H663kKm3zzXedJlN+LkZMiEE7YAXF3lxpjNAVz
 2FzpUw8HlR0BIi412sOvtiO63Q==
X-Google-Smtp-Source: ABdhPJzspwOL8tBkHWxdZzBiE7r2qRpMZRD1XKC34zQnA/D9jM2b8gDJpfLQEj5hRBo5pZZdjjXNFw==
X-Received: by 2002:a05:6512:3d17:: with SMTP id
 d23mr2261513lfv.76.1644427522431; 
 Wed, 09 Feb 2022 09:25:22 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 09:25:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 00/25] drm/msm/dpu: wide planes support
Date: Wed,  9 Feb 2022 20:24:55 +0300
Message-Id: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It took me a way longer to finish than I expected. And more patches that
I initially hoped. This patchset brings in multirect usage to support
using two SSPP rectangles for a single plane. Virtual planes support is
omitted from this pull request, it will come later.

Dmitry Baryshkov (25):
  drm/msm/dpu: rip out master planes support
  drm/msm/dpu: do not limit the zpos property
  drm/msm/dpu: add support for SSPP allocation to RM
  drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
  drm/msm/dpu: move pipe_hw to dpu_plane_state
  drm/msm/dpu: inline dpu_plane_get_ctl_flush
  drm/msm/dpu: drop dpu_plane_pipe function
  drm/msm/dpu: get rid of cached flush_mask
  drm/msm/dpu: dpu_crtc_blend_setup: split mixer and ctl logic
  drm/msm/dpu: introduce struct dpu_sw_pipe
  drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
  drm/msm/dpu: inline _dpu_plane_set_scanout
  drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
  drm/msm/dpu: move stride programming to
    dpu_hw_sspp_setup_sourceaddress
  drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_pipe_cfg
  drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
  drm/msm/dpu: drop src_split and multirect check from
    dpu_crtc_atomic_check
  drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
  drm/msm/dpu: don't use unsupported blend stages
  drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
  drm/msm/dpu: simplify dpu_plane_validate_src()
  drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
    and dpu_format
  drm/msm/dpu: rework dpu_plane_atomic_check() and
    dpu_plane_sspp_atomic_update()
  drm/msm/dpu: populate SmartDMA features in hw catalog
  drm/msm/dpu: add support for wide planes

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 355 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   4 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  78 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 136 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  88 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 813 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  81 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
 15 files changed, 827 insertions(+), 863 deletions(-)

-- 
2.34.1

