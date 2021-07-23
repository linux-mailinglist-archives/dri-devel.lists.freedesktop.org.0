Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3E3D30C1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 02:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2576F87C;
	Fri, 23 Jul 2021 00:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA5E6F87C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 00:22:08 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id f1so1282690plt.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ilHV4zkFYV/inpNlTjXcax19NKR7g9Dp2bd3Wi4nieU=;
 b=H5PMaoBwCj/x/6zyYxozhyvWGMrvIQXzg/TlzwMXxkPxuAO0Sobu8MZT/+xdkHdx8U
 KOOwY8KyFWw/2ShculMhRh/bi+M+p5yRTBQBIftJ/YDVi3aoASgjN4QuoUoSFqXWbmFt
 ryb2z3k6h/2m3ta2j+N25Qa/slTSq5y5E/zuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ilHV4zkFYV/inpNlTjXcax19NKR7g9Dp2bd3Wi4nieU=;
 b=DsLkVBWvUEEPGbcE2Osu5IOZK5XkTAyY+Ud7WppHSZIwp7q2oEb9TljTKtlC0mMRXw
 1kUlS8IYYTykRhtO9X99YelHaRZdwiND41wgOD9LFvfCU9wr0bHKamRoDtaA6OrWoSmc
 o3naSdiFftjMEYukVx7komt95PxfloeYqCrFXruiNPljTGPgrEefcMZ4LaikcsvnOfCC
 FMO2f/wDqwmf7w25At0YyGCERS2hgRbOVT1HtIH3vNvKKqaEvAI2ojg4txNKaKG/6Idm
 AoS1LcnUU+CoML/HtU4SmQAZq7nh2ZrSx7s6TIfUx/ShCAZqSBH+DJ1vMJFcvosR04aZ
 zBOw==
X-Gm-Message-State: AOAM531zn1yURk0yPQUhNXl4a2nmlc/eI9sCzp2CayiTrL0mnRFNax10
 EyxKm8vvtIgzKp9T9ulDF1uyHQ==
X-Google-Smtp-Source: ABdhPJy3fNIhcYUlCjPQ6rsNOgNRR30C3i3qn3hSQwAIOxUXOxQpz3bxuGzhyKhNARRvDRL91VLEsQ==
X-Received: by 2002:a05:6a00:1951:b029:333:64d3:e1f1 with SMTP id
 s17-20020a056a001951b029033364d3e1f1mr2175927pfk.43.1626999727675; 
 Thu, 22 Jul 2021 17:22:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
 by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 17:22:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 0/8] eDP: Support probing eDP panels dynamically instead
 of hardcoding
Date: Thu, 22 Jul 2021 17:21:38 -0700
Message-Id: <20210723002146.1962910-1-dianders@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


The goal of this patch series is to move away from hardcoding exact
eDP panels in device tree files. As discussed in the various patches
in this series (I'm not repeating everything here), most eDP panels
are 99% probable and we can get that last 1% by allowing two "power
up" delays to be specified in the device tree file and then using the
panel ID (found in the EDID) to look up additional power sequencing
delays for the panel.

This patch series is the logical contiunation of a previous patch
series where I proposed solving this problem by adding a
board-specific compatible string [1]. In the discussion that followed
it sounded like people were open to something like the solution
proposed in this new series.

[1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/


Douglas Anderson (8):
  dt-bindings: drm/panel-simple: Introduce generic eDP panels
  drm/edid: Break out reading block 0 of the EDID
  drm/edid: Allow the querying/working with the panel ID from the EDID
  drm/panel-simple: Don't re-read the EDID every time we power off the
    panel
  drm/panel-simple: Copy "desc" into driver data; don't store a pointer
  drm/panel-simple: Split the delay structure out of the panel
    description
  drm/panel-simple: Implement generic "edp-panel"s probed by EDID
  arm64: dts: qcom: sc7180: trogdor devices can use probable eDP panels

 .../bindings/display/panel/panel-edp.yaml     | 196 ++++++
 .../bindings/display/panel/panel-simple.yaml  | 559 +++++++++---------
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |   2 +-
 .../sc7180-trogdor-lazor-limozeen-nots.dts    |   2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen.dts    |   2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |   3 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |   2 +-
 drivers/gpu/drm/drm_edid.c                    | 113 +++-
 drivers/gpu/drm/panel/panel-simple.c          | 497 +++++++++++-----
 include/drm/drm_edid.h                        |  47 ++
 10 files changed, 965 insertions(+), 458 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml

-- 
2.32.0.432.gabb21c7263-goog

