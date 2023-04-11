Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B880D6DE4BA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 21:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97ED110E618;
	Tue, 11 Apr 2023 19:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA8C10E23B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 19:21:39 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-54c061acbc9so316836557b3.11
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 12:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681240897; x=1683832897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b0pWNUner6HZpj2mgz7mwe38cCf4K3c4XkTiPKpjEJc=;
 b=RRh3QoutRS+2+cQHp2e701Gtn2U1A1+atWoa1dPicm57v0QtgikJXIANmTd+LDHttA
 29B7KSSb3kXzXikbZMccI/OL9X85TF8oopYzbYf4yElnaqgzr33gXiQykEfRV9rJofXi
 ltdISIEULFKTJThPiF4N+NbbT0ytWzCJAK/2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681240897; x=1683832897;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b0pWNUner6HZpj2mgz7mwe38cCf4K3c4XkTiPKpjEJc=;
 b=oqIHmtoaC4v9V8vpd26qwY7KuQXa5/BLKJEBZ1Hi/n/Y8C/R9MBZJE0inXFVnsUUpt
 V+pDXWMYzNvE43d2ZKyfB0dHKfaKik1X+swgueVVx+4TZEedNCeLWGMlUjIvDKuiEj6e
 YVhTL+c9Q4wKxGz1joe4I+9JKgnk7sEJDqQ1Pj1Ga01Fx0yCnzsm9MRPK1OQCtp7p34P
 xswcmdP20mE0yMF7O7IXIP4KpEDDhrBkDBOGkuOXMLIdtlrt9YHSJfNwEhGljGxyBP4U
 4faqvY9AusuUdUwY7uUkj/wRTO1r+V8enVStFBckQFaZHKpGqkhlCHEsCg5YrcmCKvIK
 PKbA==
X-Gm-Message-State: AAQBX9eVyFXdIs3M1lzVaMMlJyu5xk62DRQxVKyK9GyMVKgrfle1UiNq
 a+yYSmV/qneA0vCagzD0U+P2LUVhDI/o6ShuMM8=
X-Google-Smtp-Source: AKy350Y+xX7nfv8OmHrlOQoBibFhg/Nd9ia2dRuk69P1P5YDXyCjDvXxb+QyK3HTWQobTbQ/p6i3Qg==
X-Received: by 2002:a81:92c9:0:b0:54f:8af6:bb13 with SMTP id
 j192-20020a8192c9000000b0054f8af6bb13mr216212ywg.3.1681240897739; 
 Tue, 11 Apr 2023 12:21:37 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:2991:9b76:4e62:65bf])
 by smtp.gmail.com with UTF8SMTPSA id
 n124-20020a0dcb82000000b00545a0818493sm3689913ywd.35.2023.04.11.12.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 12:21:37 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: 
Subject: [PATCH v9 00/10] drm/hdcp: Pull HDCP auth/exchange/check into helpers
Date: Tue, 11 Apr 2023 15:21:24 -0400
Message-Id: <20230411192134.508113-1-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
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
This is v7 of the HDCP patches. The patches are authored by Sean Paul. 
I rebased and addressed the review comments in v6-v9.

Main change in v9 is renaming i915 priv data and moving the display type specific init to the drm helper instead of the driver.

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
2.40.0.577.gac1e443424-goog

