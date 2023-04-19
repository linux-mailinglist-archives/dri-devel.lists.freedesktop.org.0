Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 711126E7E96
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 17:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5CC10E9FF;
	Wed, 19 Apr 2023 15:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0A610EA02
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 15:43:26 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-552ae3e2cbeso3695587b3.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681919005; x=1684511005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WYP/FiV4NZRa6cuRzACHXEBSXpiH2T5moAJ/fvYk8fQ=;
 b=Bg3ej8Mx817Cb/4huu7B23u41PzGHpDtW0vXlB7s/sx0aAPo9GEozdq7daMoHJm9Nw
 dJcTqIgpwSLn8EGoB0W0O0w4kQ03MKeluC/p2EUWmkeLjBMGHWJdijnfLaBZz3uTp7Ns
 rVcku7g6+tmnt9iK+3Op1LYMOUGuqT54bNvz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681919005; x=1684511005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WYP/FiV4NZRa6cuRzACHXEBSXpiH2T5moAJ/fvYk8fQ=;
 b=X2UwsHjff1muNAu9el0ShA4geWAXN6AURdCK/1SaByHJfXaD4fkBirqu1xdMgcGPHS
 Banev1syAxPQIy35DsyPEsVQLfKaENEnjQM9jOA9lBGi250vA1TGIUGbKkxubNVvaF2b
 miqYoJY+1KYqDiz9fRFwvujO6M5HAXAO0vcjg4rgmSgorHkfVPLnYlen0uPLW6UqocOA
 iarD+Vt+taBljsLUdtFcYSll62E20DiHyvR8em8QAg4X0GOg0FRQn0Yu45/VDwPMLIF7
 0Qpa5pzWJyrTyMYuliC0meQNBDEH6TBs+UZP2HRuvC1lmTzwOxbclyydbSNWaomSOM/Q
 G0iQ==
X-Gm-Message-State: AAQBX9eIo2LCUki9J4D0b3m9Dr6Abe/lHDgBKovuRgW0AM3ytIPdEKt7
 m9K2H55e28Onj86s8Lrk8zZ6aQ==
X-Google-Smtp-Source: AKy350YUz4CgwWDe2UhIdSf3hlN0krIz+k7Rr1p3S6Lmy8YFNkmDRPImpAnYFzPWA5Byud316pAxYQ==
X-Received: by 2002:a0d:d487:0:b0:54f:9b01:b353 with SMTP id
 w129-20020a0dd487000000b0054f9b01b353mr3644144ywd.9.1681919005407; 
 Wed, 19 Apr 2023 08:43:25 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:55c6:7cf1:a68:79b0])
 by smtp.gmail.com with UTF8SMTPSA id
 bf21-20020a05690c029500b0054f8a3624dbsm4477345ywb.145.2023.04.19.08.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 08:43:25 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: 
Subject: [PATCH v10 00/10] drm/hdcp: Pull HDCP auth/exchange/check into helpers
Date: Wed, 19 Apr 2023 11:43:10 -0400
Message-ID: <20230419154321.1993419-1-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
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
Cc: suraj.kandpal@intel.com, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,
This is v10 of the HDCP patches. The patches are authored by Sean Paul. 
I rebased and addressed the review comments in v6-v10.

Main change in v10 is handling the kernel test bot warnings.

Patches 1-4 focus on moving the common HDCP helpers to common DRM. 
This introduces a slight change in the original intel flow
as it splits the unique driver protocol from the generic implementation.

Patches 5-7 split the HDCP flow on the i915 driver to make use of the common DRM helpers.

Patches 8-10 implement HDCP on MSM driver.

Thanks,
-Mark Yacoub

Sean Paul (10):
  drm/hdcp: Add drm_hdcp_atomic_check()
  drm/hdcp: Avoid changing crtc state in hdcp atomic check
  drm/hdcp: Update property value on content type and user changes
  drm/hdcp: Expand HDCP helper library for enable/disable/check
  drm/i915/hdcp: Consolidate HDCP setup/state cache
  drm/i915/hdcp: Retain hdcp_capable return codes
  drm/i915/hdcp: Use HDCP helpers for i915
  dt-bindings: msm/dp: Add bindings for HDCP registers
  arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
  drm/msm: Implement HDCP 1.x using the new drm HDCP helpers

 .../bindings/display/msm/dp-controller.yaml   |    7 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
 drivers/gpu/drm/display/drm_hdcp_helper.c     | 1224 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_atomic.c   |    8 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   32 +-
 .../drm/i915/display/intel_display_debugfs.c  |   12 +-
 .../drm/i915/display/intel_display_types.h    |   51 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  352 ++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   16 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 1060 +++-----------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   48 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  267 ++--
 drivers/gpu/drm/msm/Kconfig                   |    1 +
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  156 +++
 drivers/gpu/drm/msm/dp/dp_catalog.h           |   18 +
 drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
 drivers/gpu/drm/msm/dp/dp_debug.h             |   11 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   39 +-
 drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |   39 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |    7 +
 drivers/gpu/drm/msm/dp/dp_hdcp.c              |  389 ++++++
 drivers/gpu/drm/msm/dp/dp_hdcp.h              |   33 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |   14 +
 drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   30 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   19 +
 include/drm/display/drm_hdcp.h                |  296 ++++
 include/drm/display/drm_hdcp_helper.h         |   23 +
 30 files changed, 2867 insertions(+), 1349 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
2.40.0.634.g4ca3ef3211-goog

