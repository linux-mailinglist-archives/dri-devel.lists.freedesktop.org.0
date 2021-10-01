Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD041F351
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AA46EE78;
	Fri,  1 Oct 2021 17:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4EB6EE79
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:42:15 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so12471459otx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4Pk/SKGcDml8g9kQfIFxWSgB1QkZnzEqcqoMDRtiFU=;
 b=VRR2kMxgmb9zJjO0qYX8lZqyUNeV+qdczrK/Y59b/4E3QvXYlZ0QNQ5xWsfIh6rK4H
 nD4pIRu9YpKAIAdKd4oIkEF5ff3HecWkEyDSfCgCzmipUezsGOpwt1SxEu3gQbyT0ESX
 nKFje9Tgi0BiW6/BVW4wLn1l4GLuvW2UMx7naANaAnWjU+st9NQKlnGP+yeh/ZWdSEG2
 kfk6c3KYIkOzZN4LkqhYvnfEu+uBHf/g74EKVcCHmv5Ghd/hqILcluFBIBM/RO8lFyFx
 ZMNd1UynGsc3QBwsehEFGtmj3RGwdff8DeSzbHhGQAV1ziSq/XR+ACZlKODvoO079f5N
 yg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4Pk/SKGcDml8g9kQfIFxWSgB1QkZnzEqcqoMDRtiFU=;
 b=DL715jX6Fg0gWqxwomaxKpd+hDf9icnWshGWnuK/apmPLCL1mjeVamiqhrj3Mpf0zU
 RBZFUsQaj83sIEPjpOFDeFj69clI0DdMMu/qMo/r9Y8C0Lgk3e/dAXujTwIpKuEn0wrD
 p1nXW31rjlcrLruDzufFtV4XZeg34YPV/nzkvpQJJbEqdMucAoj8gxcZpsK+RxDQegu2
 nNtgaw05UKoGII7FJ2gKXhZZZhuLPN2n2IjOUYWUemxUq5EnfoGHn3sxqeYUA9wnrbmE
 eWmoV4jrMfLJxOcvReGyYzWbadbux3sayAvYxxRsUxRKtgdptps9PdDm8O8QArgeocoV
 lhsQ==
X-Gm-Message-State: AOAM530idnjj3rvU4D0guAx9PId/iRrlHbeSVbrd9wGF0EbEcfrXZbzC
 9Tjji1pfEtgiTGdi1aIWU80OpitcQy9OKg==
X-Google-Smtp-Source: ABdhPJwsyNL/kZct1ui5XlNR0vlk5yVHdKEYNUXX7kt5RL34oCziPyKWeZrHRi9vLGJtc5+BkxMkzg==
X-Received: by 2002:a9d:6399:: with SMTP id w25mr11409273otk.53.1633110134535; 
 Fri, 01 Oct 2021 10:42:14 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 u15sm1369264oon.35.2021.10.01.10.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:42:14 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] drm/msm/dp: Allow variation in register regions
Date: Fri,  1 Oct 2021 10:43:55 -0700
Message-Id: <20211001174400.981707-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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

It turns out that sc8180x (among others) doesn't have the same internal
layout of the 4 subblocks. This series therefor modifies the binding to
require all four regions to be described individually and then extends
the driver to read these four regions. The driver will fall back to read
the old single-reg format and apply the original offsets and sizes.

Bjorn Andersson (5):
  dt-bindings: msm/dp: Change reg definition
  drm/msm/dp: Use devres for ioremap()
  drm/msm/dp: Refactor ioremap wrapper
  drm/msm/dp: Store each subblock in the io region
  drm/msm/dp: Allow sub-regions to be specified in DT

 .../bindings/display/msm/dp-controller.yaml   |  13 ++-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  64 ++++-------
 drivers/gpu/drm/msm/dp/dp_parser.c            | 102 ++++++++++--------
 drivers/gpu/drm/msm/dp/dp_parser.h            |  11 +-
 4 files changed, 100 insertions(+), 90 deletions(-)

-- 
2.29.2

