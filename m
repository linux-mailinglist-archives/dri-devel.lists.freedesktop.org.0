Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3670E41F0B0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 17:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7D76EDE9;
	Fri,  1 Oct 2021 15:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305AD6EDE9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 15:11:48 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id f130so9427008qke.6
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 08:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vO4kdfgb1Vqm16KV8C3Aqdmf3t7Gzo/RmQdEN5wFY60=;
 b=VJRrSY9iWkJWJ/5a+JVkfwODfI51U+/aWi00HW/kLhOPuKSpqa2R6LUoVWPbDD+DSh
 Fa8zFEdMfFke3Q279tW6o0ysYjUfA0gHjo5b7kY44vMe/AF8O0ysMX/XWynFWFa/wv5O
 b17QfT7V0B9GfuHAJ0eBdC50ykfRYr1xDezUC9QKCp1PjmDN2DeKtOmlPcBwE98aHaIP
 O+am3R/YcZscSTJ5BQcETa30+KhnJsU5D+Uu8jubsY9lMf7AU80/0Uo9zZpT/S130SQi
 9Mdq3tnlJJemUjN1/kVMN8Iwy6j56nJRfq0uKu7hbk7E62GgW8bLL2IFvq0C8vcm+vgL
 iYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vO4kdfgb1Vqm16KV8C3Aqdmf3t7Gzo/RmQdEN5wFY60=;
 b=piNqk+JLVxeAr19erpZeZ4EDKajq9GsXxDq2svJWF+hdlnBYWaUmjeqi53Ji35F79C
 4wJ7PZaH+2kX3HEezLMDsfWJZAD+0OV8sAQqW18IJmO5/BSdRcSymCHXGbWylx5J5Z7+
 jjPtHwAoMegBFQyZOWT7lrGpRW+m8J08tkxtgx2A+LOhXyL3ErsfmUQYoc6oaNZRGhVs
 0G/sHbDWplBKLX/1lQFDT/g3JNISyGKblusGvmpkyy0gmzwVHPVExWGreGuTjHb3nfHP
 FyEsgbBv0GbErW2NCCJLcBDg+2Wj/PVZSp636ByzsAaMcSMX7wV3NcfFuFRlHzwXsEkS
 pOGg==
X-Gm-Message-State: AOAM532hCjIX6Ooz3oy17iGqwwjPWV4nj0zldV3t9g2oD62Bb28o1lOB
 I02fflrRTkNSUfGolu/kDIMfQENqdiywsA==
X-Google-Smtp-Source: ABdhPJyQShcqCbAPqx87hf2IYX8GhsB4C9aqH9k6ABojR8BqxynALNIn8HAyqsKuzAU4+7Q+fXH9aQ==
X-Received: by 2002:a37:a2c5:: with SMTP id l188mr9594572qke.268.1633101107068; 
 Fri, 01 Oct 2021 08:11:47 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id p12sm3169783qkj.54.2021.10.01.08.11.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Oct 2021 08:11:46 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, jani.nikula@linux.intel.com,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v3 00/14] drm/hdcp: Pull HDCP auth/exchange/check into helpers
Date: Fri,  1 Oct 2021 11:11:29 -0400
Message-Id: <20211001151145.55916-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Hello again,
Here is v3 of the patch series. Notable changes include incorporating
review feedback involving:
 - Changed dt-bindings to introduce new compatible string
 - Code changes in msm driver as suggested by Stephen & Abhinav
 - Fixed issues found by 0-day

Thank you to the reviewers for their feedback thus far!

Please take a look,

Sean

Link: https://patchwork.freedesktop.org/series/94623/ #v1
Link: https://patchwork.freedesktop.org/series/94713/ #v2

Sean Paul (14):
  drm/hdcp: Add drm_hdcp_atomic_check()
  drm/hdcp: Avoid changing crtc state in hdcp atomic check
  drm/hdcp: Update property value on content type and user changes
  drm/hdcp: Expand HDCP helper library for enable/disable/check
  drm/i915/hdcp: Consolidate HDCP setup/state cache
  drm/i915/hdcp: Retain hdcp_capable return codes
  drm/i915/hdcp: Use HDCP helpers for i915
  drm/msm/dpu_kms: Re-order dpu includes
  drm/msm/dpu: Remove useless checks in dpu_encoder
  drm/msm/dpu: Remove encoder->enable() hack
  drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
  dt-bindings: msm/dp: Add bindings for HDCP registers
  arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
  drm/msm: Implement HDCP 1.x using the new drm HDCP helpers

 .../bindings/display/msm/dp-controller.yaml   |   34 +-
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |    4 -
 drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
 drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   49 +-
 drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
 drivers/gpu/drm/msm/dp/dp_hdcp.c              |  445 ++++++
 drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |   23 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   44 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   15 +
 include/drm/drm_hdcp.h                        |  194 +++
 30 files changed, 2600 insertions(+), 1392 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
Sean Paul, Software Engineer, Google / Chromium OS

