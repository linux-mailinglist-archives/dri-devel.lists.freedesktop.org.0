Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E214FC5FB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 22:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE9810F49A;
	Mon, 11 Apr 2022 20:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833CB10F51A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 20:47:43 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id a10so3263575qvm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8X5Akps9JUgDLuYVSi5SphL50fpuTfBeNAuB7rpcNwI=;
 b=a8nrBydXaMnzdxCvPuOVKWXwjVrWHTUF18DH6a+S4m2gtV5qxoDaI8Ka+G4p+2aJK1
 QvJ10R4x0FLNEEW3mzsch9t1u+ATt1oRzc8IIV3XFbHX345U0HO3SA7x3sjA29VGAoQq
 nPSWL4U8AkfBV21dLJorLV/J3LF7vJsbGg5XhW7w2yCAd0o56h+00xSq1gI9zoyIRtak
 7Sxw+eq661r8hnFY8hsWquYmdyH/4XbJo7Mz8Y0AhFZN03eaBO+D50Iie+7eZuu4iBs5
 wC74Sb4di1UVwpAeYogdRWjyofy3dbhVN309S+SNfGwrqq8kiQgkpWnXa5DSYui9F/yN
 5DJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8X5Akps9JUgDLuYVSi5SphL50fpuTfBeNAuB7rpcNwI=;
 b=uf3LcMyjB+Zxoe6ZIbSDd17hgoolXnBF10qmpGr3rfht8FTnKmbypcISa8nglfl2yb
 itZsbiOvpv5T0kCjpCILJrMtvCLnSZcEuv7pxauqVUCzTKcr6JnWBCg5x68p/ElSt9sF
 5jD9xjlkQU+lBraRswShVo/kWG6Nv6ugufYmLZgkOVmCLOlrcTpHsMdsjm/555U8Iliz
 VF13ZFKffKgVxX2tw/pUNz7LGvVPjU39gGIPfkkcLge+RoPqnq26x1sHX3fYN2PfewNB
 OS+NJdvB/fNQZD1TnO6DZy4/VO+kBBGZfTDVX4RFi0Q4TmFh+FNwkOqXo4Nvlh1mZowZ
 rXRw==
X-Gm-Message-State: AOAM530dmeQ1557j4neHVOYs+1dhLe8u+zVPaqKE9BZzX0OgSO9wsPZr
 zpJNx9ogHQnJbGsGNgGUmU4ttwnUVATBMA==
X-Google-Smtp-Source: ABdhPJyThfdnTfRvtn5YGvh2/aMhQtyKd6yPbpXOxlSXZGQWMgTMbGQROjdIpQDzAXNsg+Lfwdh5VQ==
X-Received: by 2002:ad4:5f4b:0:b0:441:4d40:f8d2 with SMTP id
 p11-20020ad45f4b000000b004414d40f8d2mr28615476qvg.33.1649710062254; 
 Mon, 11 Apr 2022 13:47:42 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05620a444900b00699b2ba4cd1sm20076318qkp.56.2022.04.11.13.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:47:41 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Subject: [PATCH v5 00/10] drm/hdcp: Pull HDCP auth/exchange/check into helpers
Date: Mon, 11 Apr 2022 20:47:29 +0000
Message-Id: <20220411204741.1074308-1-sean@poorly.run>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
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
Cc: markyacoub@chromium.org, swboyd@chromium.org,
 Sean Paul <seanpaul@chromium.org>, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Rebased set from November. Fixed a nit from Stephen in the msm patch and
moved hdcp registers into the trogdor dtsi file to avoid differences
with sc7180-based windows devices. The set is 4 patches lighter since
some of the changes were accepted into msm.

I'm still waiting for Intel review of the first 7 patches. Rodrigo/Jani,
would you please provide your input so we can move forward with this
set?

Thanks,

Sean

Link: https://patchwork.freedesktop.org/series/94623/ #v1
Link: https://patchwork.freedesktop.org/series/94713/ #v2
Link: https://patchwork.freedesktop.org/series/94712/ #v3
Link: https://patchwork.freedesktop.org/series/94712/ #v4

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
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |    6 +-
 drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
 .../drm/i915/display/intel_display_debugfs.c  |   11 +-
 .../drm/i915/display/intel_display_types.h    |   58 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   36 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
 drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   46 +-
 drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
 drivers/gpu/drm/msm/dp/dp_hdcp.c              |  453 +++++++
 drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |   20 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   32 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   15 +
 include/drm/drm_hdcp.h                        |  194 +++
 27 files changed, 2582 insertions(+), 1328 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
Sean Paul, Software Engineer, Google / Chromium OS

