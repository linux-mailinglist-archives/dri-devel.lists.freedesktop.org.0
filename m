Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F99567282F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 20:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF36810E80F;
	Wed, 18 Jan 2023 19:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F48E10E80F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 19:30:20 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id s4so1742827qtx.6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 11:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g7xDPjbRpbW/1Y146BUFy3rG1PlEHIGh3rZX85WmAFk=;
 b=YCT7NhsFTBwdjtcySMujXsQ9iT8sSkX9P2rJSOEi7MIf/vUZgLKWPIvYhDDJ5KX0h2
 04Y3Gb4+aqh+eqPj9AsvYA5GWlhSgRiEEgTn4XOEJ1fZkP+7FFANL24g7AWuZkMKqdRP
 aw1/btRMyKOiceej5xV2eo4/2E6hYFfTepV+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g7xDPjbRpbW/1Y146BUFy3rG1PlEHIGh3rZX85WmAFk=;
 b=tTv6oa6rmsCUuXNrVW3bsSU6ji/9A/vh6sw8wm4CqLtjYo9MpsNYsLmbZAHgQC2Ep+
 R+uv4V4ohe62jDO2Bsfw/J7lGcc8G1AwG0Nw8dnaEDniCSkSY+r2eLC2FeEAMWa26mzW
 ooDg0MGm7qvNXgbkUsZK9J9NZD0c/Mjn7YUFxjLc06W2jhIx1bMXIXyYd00Rk32IWGJ+
 7M0coL0ezSZ7Ias/5lBwPCaPZNHjPGrIdDAWcNDoH2TI35FbRDxCNs8CiYRqQ/90LWgT
 1Z3jHLgV2TIMjgg+JdMidD6CaJA845sokHMbX9eVOaw0FKO3ppt8gxCIH55a85ic0jb2
 FRWQ==
X-Gm-Message-State: AFqh2kq5i5Zgujm8s3qceJ3El0XLYzTMPHoqarE0tKl7u21t2qoq7ZfE
 MDgXJxKsF7VhvI6EXWXtcVr4jA==
X-Google-Smtp-Source: AMrXdXuZJIDRMFdvUl35vOCmEkGVlA3bW2dOxpF8adOcUqZuFBuN3qGMHLxiai/uwwErQRkgA/dCow==
X-Received: by 2002:ac8:6b88:0:b0:3b0:4084:d6ad with SMTP id
 z8-20020ac86b88000000b003b04084d6admr11101265qts.58.1674070219105; 
 Wed, 18 Jan 2023 11:30:19 -0800 (PST)
Received: from localhost (29.46.245.35.bc.googleusercontent.com.
 [35.245.46.29]) by smtp.gmail.com with UTF8SMTPSA id
 y2-20020a05620a44c200b006e42a8e9f9bsm8957331qkp.121.2023.01.18.11.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 11:30:18 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: quic_khsieh@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 00/10] drm/hdcp: Pull HDCP auth/exchange/check into helpers
Date: Wed, 18 Jan 2023 19:30:05 +0000
Message-Id: <20230118193015.911074-1-markyacoub@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
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
Cc: quic_sbillaka@quicinc.com, konrad.dybcio@somainline.org,
 jose.souza@intel.com, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, hbh25y@gmail.com, marex@denx.de,
 ashutosh.dixit@intel.com, sean@poorly.run, abhinavk@codeaurora.org,
 javierm@redhat.com, arun.r.murthy@intel.com, stanislav.lisovskiy@intel.com,
 agross@kernel.org, quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 lucas.demarchi@intel.com, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 robh+dt@kernel.org, christophe.jaillet@wanadoo.fr, maxime@cerno.tech,
 rodrigo.vivi@intel.com, johan+linaro@kernel.org,
 tvrtko.ursulin@linux.intel.com, markyacoub@chromium.org, andersson@kernel.org,
 dianders@chromium.org, swati2.sharma@intel.com, manasi.d.navare@intel.com,
 tzimmermann@suse.de, bhanuprakash.modem@intel.com, dmitry.baryshkov@linaro.org,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

Hello,

I rebased this series which is authored by Sean Paul.

A major rebase conflict was that drm/drm_hdcp was split to drm/display/drm_hdcp & drm/display/drm_hdcp_helper.

Another major one was in msm dp where drm_connector was no longer tracked, but it's replaced by msm_dp_bridge to carry over its functionalities.

The first 4 patches modify DRM. They've been reviewed.
Patches 5-7 are intel-only. Only patch 7 hasn't been reviewed.
Patches 8-10 are msm-only. Only patch 9 hasn't been reviewed.

Thanks,
Mark

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

 .../bindings/display/msm/dp-controller.yaml   |    8 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
 drivers/gpu/drm/display/drm_hdcp_helper.c     | 1202 +++++++++++++++++
 drivers/gpu/drm/i915/display/intel_atomic.c   |    8 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   32 +-
 .../drm/i915/display/intel_display_debugfs.c  |   11 +-
 .../drm/i915/display/intel_display_types.h    |   60 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  348 ++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   16 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 1028 +++-----------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   36 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  270 ++--
 drivers/gpu/drm/msm/Kconfig                   |    1 +
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/dp/dp_debug.c             |   48 +-
 drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   52 +-
 drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |  108 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |   16 +-
 drivers/gpu/drm/msm/dp/dp_hdcp.c              |  456 +++++++
 drivers/gpu/drm/msm/dp/dp_hdcp.h              |   29 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |   20 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   32 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   15 +
 include/drm/display/drm_hdcp.h                |  168 ++-
 include/drm/display/drm_hdcp_helper.h         |   33 +-
 28 files changed, 2667 insertions(+), 1354 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
2.39.0.246.g2a6d74b583-goog

