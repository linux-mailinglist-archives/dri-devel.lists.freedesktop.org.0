Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C31565BE5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D6510F84C;
	Mon,  4 Jul 2022 16:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275410E1C6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 16:11:51 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z13so16469157lfj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rvpMkL8rwQeoEo+SMzO+GF3s7pNzolh8BqnzxKkFoo4=;
 b=PRa8oeritKHlX5Cuo59DeIr0jqFFxqZ1SUAiCm7V/3n46EK/pO7XM36ROBw3DzXSXQ
 YxJhUduCoQbUeCSf4f+YyP0BecLCr5Bdx0rzFxhPwJiYWfbtX1FSwGRSAoCvzxET1Aze
 d8bQuCcF05gDIgavHgfmsknIUBq4J7Cv/dhY0Q7FDmoPhqCMKh/YwDkOgUpXAZTVm6kx
 xj6PcFZA+zxLttELoWt2i3Nsro/aZyINoJiHx3vMmZ313zFWalf6OIYMpBFqs/QB+Zh2
 facRBNtre9zuGmBE7bQfhiLwEWoNOsuccYUiGxdwwsf9Fwk8OCu0Shq5UH8A38/eTp84
 QPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rvpMkL8rwQeoEo+SMzO+GF3s7pNzolh8BqnzxKkFoo4=;
 b=xbi/bqJL2ypthN7qzk2TuL+3nRNcoexalibbaLX/BeEWLappsNf1E0Jzm27bHaTdHZ
 YCAMc2Xklyqf2QmAHmn6pCBIruz/8penFeydua1AKcOxf3ml+eZdaA2NKUI4KSn2dgQj
 WACgPoeR9Uo5yeTNHoYOOcDnwgYZFb9BvImVxIwcfNGxWUCMoJ5trLzhhUfJpc/eZiGx
 Z8r1Q7s+TQh4Cz4+XscRecae88RWzMXM3+UXMNFpNR/VXHe66UVe8IJ7PkImxyrUJNEL
 aWT12K9eTK5/xfPY+dydihru+mPlGdFRBx6l0l/PriJFafS659+MRAbqHcW/0tnJbtNo
 yS+w==
X-Gm-Message-State: AJIora/RfUiQwTqalmzWUicKyc4j3lMkQXi+Ff1dhMo9IKOAE86+ETZo
 6jTARUY5YdD8Bq0/a+tF+IgClw==
X-Google-Smtp-Source: AGRyM1tTn7DtmPOMMB8Ftu3ZrQuStfkpwldPqX63M2wVWQqfl+bhBR3Ly0in/NV3wLfdHb+lrvQP0g==
X-Received: by 2002:ac2:489c:0:b0:47f:6c54:7c56 with SMTP id
 x28-20020ac2489c000000b0047f6c547c56mr18196383lfc.529.1656951110018; 
 Mon, 04 Jul 2022 09:11:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 bj16-20020a2eaa90000000b0025d254180d7sm381273ljb.113.2022.07.04.09.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:11:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 0/3] drm/msm/hdmi: turn MSM8996 HDMI PHY into OF clock
 provider
Date: Mon,  4 Jul 2022 19:11:45 +0300
Message-Id: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MSM8996 the HDMI PHY is the QMP PHY, it provides an HDMI PLL clock
used by the MMCC. Add support for providing this clock to the OF
framework by registerding the clock provider and adding #clock-cells
property to the DT node.

The dt-bindings from this series depends on changes from [1] (part of
linux-next, but not of the msm-next yet).

[1]: https://patchwork.freedesktop.org/series/104836/

Changes since v2:
- Added minItems: 2 to clock-names property (Rob)
- Explicitly mentioned dependencies

Changes since v1:
- Also handle the xo clock (include it into the dtsi, use parent_data
  instead of parent_names). The patches were changed, so I didn't pick
  up the R-b tags.

Dmitry Baryshkov (3):
  dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells and XO clock
  drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
  arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI
    PHY node

 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       | 15 ++++++++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  8 ++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c      | 25 +++++++++++--------
 3 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.35.1

