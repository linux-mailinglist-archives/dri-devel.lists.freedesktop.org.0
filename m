Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D691A550E41
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 03:03:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3858E11308C;
	Mon, 20 Jun 2022 01:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3775411308C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 01:03:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i18so1206467lfu.8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 18:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LYx02C+EGoQu6KMZwxBVohOCqcqGTmt/TOzhzyy1LWE=;
 b=m3sa52vAAbFrpDwICO52CQsJYLvI4DPQ04un6oUG38P7j4Q+ZThELmIAd3gmRaRFAq
 6pDh3TdB+B1NEgQsF/FJLuH6ZDCupihbcEG2ive+X5rT8oUOAqL0BXVOqNlnSrTCMGHe
 PuWZE1pedoKE4aSLbr6jrcuR8AGE3QKbNl8ADEKMmYJ97gwwIdnuuDB+HJfG0o7iqZrc
 289OTNHwAtpeeg9pBqDdGeT7eVGQOJGlqTNPh2+Rhkuk4rtQgfiYSMjVyfodxJHFNwqR
 58Cxyj0YS0rSfMc66y/HkYsrIXGPAJG7rQX1vtrgY+0v6x9FOMib6Nj4QcrQufltmpwI
 HxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LYx02C+EGoQu6KMZwxBVohOCqcqGTmt/TOzhzyy1LWE=;
 b=phlsC6h4D6x9bQnuYNKP4RMHOcp0CKNm3eYiiq2OpjxvgBSoq+zReQRLtHJH7TLW8e
 qZzJGFhZmgxwxxixiVnBcE+a+/CpciOA5J6SkJFvIlC0lT3Ykoda/9+6gUJRWLQ0urlo
 h8naNHVYR8uvgAEq6n/TEKArBLqE+kOCYC9w7qWfmBTUPGIhhjQYPztOeq6/0qdfONVV
 NMUHlnCvg9yjwFEqfTxi1hq0g4FCD0wXvGNCufCp55lWKIW1yHzJ8avEMTctJRO2ha5k
 rIVmbkdZLr6M+Z4LL5jZu0q1xqNb67p2bq8s2zTh2X0+YpHMDHZmcuVkdKXoNAsavdRf
 36tA==
X-Gm-Message-State: AJIora80l81T+XkCq/QtfGCmSC3a5en7EDTIXjgdlPpVWeLXEFMWBm9t
 tJPrYgp7hLzefvIYoSlErIoCQN0lk3htst12
X-Google-Smtp-Source: AGRyM1sMWLywf7r4SVgZehvoyw4bAZ3HVrwRR/gdH4/29NKbQUy4lNRoKx8COczxk47Uko6qNZvqoQ==
X-Received: by 2002:a05:6512:2828:b0:47f:68dc:9feb with SMTP id
 cf40-20020a056512282800b0047f68dc9febmr3098074lfb.475.1655686982374; 
 Sun, 19 Jun 2022 18:03:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 a1-20020a19e301000000b00477a6c86f17sm1550334lfh.8.2022.06.19.18.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 18:03:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/3] drm/msm/hdmi: turn MSM8996 HDMI PHY into OF clock
 provider
Date: Mon, 20 Jun 2022 04:02:57 +0300
Message-Id: <20220620010300.1532713-1-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MSM8996 the HDMI PHY is the QMP PHY, it provides an HDMI PLL clock
used by the MMCC. Add support for providing this clock to the OF
framework by registerding the clock provider and adding #clock-cells
property to the DT node.

Changes since v1:
- Also handle the xo clock (include it into the dtsi, use parent_data
  instead of parent_names). The patches were changed, so I didn't pick
  up the R-b tags.

Dmitry Baryshkov (3):
  dt-bindings: phy: qcom,hdmi-phy-qmp: add clock-cells and XO clock
  drm/msm/hdmi: make hdmi_phy_8996 OF clk provider
  arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI
    PHY node

 .../bindings/phy/qcom,hdmi-phy-qmp.yaml       | 14 ++++++++---
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  8 ++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c      | 25 +++++++++++--------
 3 files changed, 31 insertions(+), 16 deletions(-)

-- 
2.35.1

