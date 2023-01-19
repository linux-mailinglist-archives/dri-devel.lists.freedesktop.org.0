Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9886739EC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306DD10E929;
	Thu, 19 Jan 2023 13:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B0710E929
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:22 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v13so2795409eda.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9MPkKmj4G/dBz6sPcffR9tX5uU/lwQX0T1nVnP9nz44=;
 b=FTCVsOvKrMJzB7s2HyfaaX0VK0I4lqjddNgbgaeRdIaEeBYpc0zC9L96+kTMzE2PWF
 ELasBp8eHVFjaffdh2Rsh3uF/4xpsUTXTqr/o6jmPD9Ccr6lIncU6f7B9bM5cQcRq6Is
 gqPjfccgdjpEB/PHMplYqOGd21xht/eF6IoCmYCZhk1l/v6fCiE4qqYTlh9EcQiirHzZ
 JBbGvo7RPP2KcvfgJE+9JyJd2wGemrI+5ETHY+mBkeDoBVJw036xpxJv6SlnkjxJF/rW
 rMD4xknymB8h6iSCJBuirB8rNkCW4nW1Abir7DnpNQdGUdHtoSDGPlp3Uh/xJ1limrxr
 ljdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9MPkKmj4G/dBz6sPcffR9tX5uU/lwQX0T1nVnP9nz44=;
 b=yxKsf1Iov2iyvDqBkGsHnQKKNs0TAZ43gVu/rDtSJl18FaPxQGFr1CvKEp50qvYgHl
 gX6picZyEhIn3qfU6MKCRHKmePN5/4h7UyNQtscrlDFBOivepn/47WQ7OJ4PXKj1rY58
 YYIXkCOiyW5Ctp0HcRaDSKdjaFqp1RGgjgrM9hB2oa5XA1KFLptitjacuWNhIR9L0bhF
 nWl6/Pw5dE+xbrhNpPr1l+XDveKThWqO9MzdOQUD0FKAhICHZ9UVTnDCINES3q4k24mA
 EL9ZPf5COGPHNlnuH5oRgls+ecS3FOqp9letuNLRhwrdIf0zhwVXgxFza75VO6VlX01T
 0NTQ==
X-Gm-Message-State: AFqh2kpr8aZ9ina21Gg0ib2Jhpzg0MUdB1QkGFN5398GQJueJNNRWHyL
 MVhRVFU1LpCPouFBp1Dw1vkVHw==
X-Google-Smtp-Source: AMrXdXtxFXcYL86Q+ICy0lk69FgCFVTS6nVq4OzYff6WuL9NPpU43VaFJccJnYaa8jaxEVj0W2IjVA==
X-Received: by 2002:a05:6402:4d5:b0:49d:a60f:7827 with SMTP id
 n21-20020a05640204d500b0049da60f7827mr10775320edw.6.1674134541040; 
 Thu, 19 Jan 2023 05:22:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/6] drm/msm/hdmi: integrate msm8960 HDMI PHY with DT clocks
 infrastructure
Date: Thu, 19 Jan 2023 15:22:13 +0200
Message-Id: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make msm8960's HDMI PHY accept clocks from DT and also register it as a
DT clock provider.

Dmitry Baryshkov (6):
  dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
  dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
  drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
  drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
  ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
  ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock

 .../bindings/phy/qcom,hdmi-phy-other.yaml     | 27 ++++++++++++++++---
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 21 +++++++++------
 3 files changed, 39 insertions(+), 12 deletions(-)

-- 
2.39.0

