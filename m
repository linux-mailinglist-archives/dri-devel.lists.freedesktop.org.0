Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B309A7388F5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 17:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC59C10E4B1;
	Wed, 21 Jun 2023 15:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270D910E4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 15:27:23 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b46f1256bbso50537891fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361240; x=1689953240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lxGS67E5F7LIYxIf1R7Yz2kDsTmvNbR9wS74p4KXsXM=;
 b=V9lZIK6uFE4tMf0QqO6KFt2IQ+ZgD8cBtfJ8UR3OutbVpRa1zqCoqtL/mU9YYrddSN
 Od2nLsaDxoEke4CFLNwcZYFdsomIPiKCAqgDvXpIf/6N4i18k1w0AauGS9cY+4ADzIkC
 O1rPFt3O1aOEW8PBS4Mwzotw4QgQ9x0v1LCY4Smgp6eyssjsNaQG49E3FrGsWDmAD3In
 NRUMebZ2WCmiCyPkPmHuVPiSEBkNvzUBBV4ZT3/KYY9QtbS2E15+W+871W2BxDZ4yCGD
 tcR8ONhy+zzBM0P/FW7yPH6bBa/iXSdjB/PoqwT1r0ULGtoAqAcuXLh1iF2n8OQszE6C
 Tbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361240; x=1689953240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lxGS67E5F7LIYxIf1R7Yz2kDsTmvNbR9wS74p4KXsXM=;
 b=Y7iDS4IE3YvfmMrq0XHjNRa/FuiYtfFMHBWmIPLwCx/x6BD4w9iMgotkUm1gIK/h3M
 aem8GJ2g6eIpTSjFfH/NQGUw5LsansLKgDE9RLfPKUXcbNFuUhPMrdFwt4riBqxe0z6/
 5d4AyNA2zrplHwbyQslF5dSDYoSWpSUowiWWsY3LipUgVEbRvk45MS6xBEub1O3JHEPQ
 4uDvyYsuiO27qO/fGDbExw6/yN6SQyvGG5KL97hHVcoEw2hH7QY1Fk4Ku1TjRGMCCNZi
 4T/9urVJvIXjXf/x3laEIpeWjaWPauqCHJ27lcZSE1EuHCxEc1omjGe3QMbfvsaM7M3b
 O0Qw==
X-Gm-Message-State: AC+VfDxsBt92xX4zsuM/migCUh8gt00QKVqMHei1pbWAVb6jRDakZxkt
 QSgWpXmgI3/9WB3o0P/6fmK9iQ==
X-Google-Smtp-Source: ACHHUZ6u7ScRV5sTyrJdQiLqv2QdANaIa6NTVDT6DIcDnYZFkG4YkgBkpIJRy5nhzz07EkG9CGdhPQ==
X-Received: by 2002:a2e:b5cc:0:b0:2b4:7500:3094 with SMTP id
 g12-20020a2eb5cc000000b002b475003094mr3540774ljn.3.1687361240509; 
 Wed, 21 Jun 2023 08:27:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:27:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 0/7] phy: qcom: qmp-combo: rework register access
Date: Wed, 21 Jun 2023 18:27:12 +0300
Message-Id: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch at [1], which added another function just to have v4 vs v6
register address difference prompted me to take a look at the combo PHY
driver. We already have mechanism, register layout descriptions, for
coping with register address differences, which I ignored while adding
v4 support. It looks like nowadays this has exploded somehow, resulting
inseveral almost-identicatical functions.

Forcibly use regs layout for all version-specific registers used in DP
PHY programming. As a result, this allows us to drop several very
similar functions. And also while doing this cleanup I spotted a typo,
which resulted in a patch 1, fixing bias0_en programming for sc8280 and
sm8550 PHYs.

[1] https://lore.kernel.org/linux-arm-msm/20230601-topic-sm8550-upstream-dp-phy-init-fix-v1-1-4e9da9f97991@linaro.org/

Dmitry Baryshkov (7):
  phy: qcom: qmp-combo: correct bias0_en programming
  phy: qcom: qmp-combo: reuse register layouts for more registers
  phy: qcom: qmp-combo: reuse register layouts for even more registers
  phy: qcom: qmp-combo: reuse register layouts for some more registers
  phy: qcom: qmp-combo: drop similar functions
  phy: qcom: qmp-combo: drop qmp_v6_dp_aux_init()
  phy: qcom: qmp-combo: extract common function to setup clocks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 408 +++++++-----------
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h   |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
 3 files changed, 174 insertions(+), 241 deletions(-)

-- 
2.39.2

