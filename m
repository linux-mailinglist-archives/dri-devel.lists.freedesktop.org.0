Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC44A50BC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F6310E337;
	Mon, 31 Jan 2022 21:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4218610E337
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:05:17 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a28so29487957lfl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vThlvEmvp/6FBsR0reDfoEC2yRp4jMGo+thDfo0ZGZ8=;
 b=wEm14HJQFhoMXlPM74AVZSRNXm4lL1H4VaVe/aGOQKqmaDrT7c50hAMsniEWf0IEpT
 8pUKh4uIMtf9e9VTiNClQ/rU81KZvmbZYNEI2JnVY79k39uyolei7JuXYehDta/Jg8Rt
 SQTnvJLYT58wOgGtggNV1mePq9AVbYyRGWUnMKkgf0QAitc0BY89TA7ZVroPF5Qb1lnU
 C5LA4a32rJVBNN9XcQFmOSc05hbaNVzSoy7P3JPsQZ6nGTgy2DZdKooEM6DViCROr9WJ
 Svh1o/cYSB543IYdqiUOuPeY7WP3mCdVzzx6ZguNwrpaf0Ng+l6bqYrtM+IKufFZNnx5
 Yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vThlvEmvp/6FBsR0reDfoEC2yRp4jMGo+thDfo0ZGZ8=;
 b=kHLb+Ne/xndxrLl4bOx87hf09eD6vrZAOVhdAvSaykZ0b5UI/5X7TLgiMa29UAfVVR
 DyAV3R/SUgIRO1lVWsKfj+iX1a7Zjh9n/FMWON0nqbpfA/b7X0vSjmTS1IDQpAJZotN+
 0IZPY5ys2V8Zf93K/L1uwvcd1bLMb+j3Gw5CjGg7DB9SHbYCl7m6Ap4rkb1k1iq2xXrt
 Ptc+7+H/pb/l8vUh6vzfRH5NiBlp1ABzGSHuxq4Ie92OIJ8SsGxcmq2f5A5fLZ0DSdhx
 ZJBSA+AW5LmtTMWyCuVQBE6j7V+iKWnURNbjtg47FyAzCy3/ZD3L20fqR0nT+kAcGHTi
 OXjQ==
X-Gm-Message-State: AOAM531wwv46hKLzoKK2dzaEScIRoQyxN3KcvyphR10/tqldtlIoayyu
 T3R0uR5Rx3Cp0D4X7ZtTyP0ktA==
X-Google-Smtp-Source: ABdhPJz/4U5stnoc0BfXhZs50Xa6qriT84hflYtyMKASEeBwIFKW7MOD7rD3QgTmpERFwr2RngtkcQ==
X-Received: by 2002:a05:6512:3341:: with SMTP id
 y1mr16505203lfd.58.1643663115603; 
 Mon, 31 Jan 2022 13:05:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y13sm2575910lfl.263.2022.01.31.13.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:05:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 0/2] drm/msm: rework clock handling
Date: Tue,  1 Feb 2022 00:05:11 +0300
Message-Id: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org>
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

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly. This also
removes dependency of DP driver on the DPU driver internals.

Changes since v3:
 - Switched to devm_clk_bulk_get_all() per Stephen's suggestion.
 - Removed a call to of_clk_set_defaults() (per Stephen's suggestion
   again). It duplicates a call in platform_probe().
 - Split the first patch (moving helpers to msm_io_utils.c), it's unused
   now.

Changes since v2:
 - Retain conditional code/prints in DP code to ease debugging
 - Rebase on top of msm-next and [1]
 - Split helper functions to msm_io_utils.c as suggested by Jessica

Changes since v1:
 - Rebase on top of current tree to fix conflicts

Dmitry Baryshkov (2):
  drm/msm/dpu: simplify clocks handling
  drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 +-
 drivers/gpu/drm/msm/dp/dp_power.c             |  91 +++++----
 12 files changed, 131 insertions(+), 351 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h

-- 
2.34.1

