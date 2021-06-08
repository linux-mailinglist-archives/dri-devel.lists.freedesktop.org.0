Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969213A0438
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 21:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFE96E5B6;
	Tue,  8 Jun 2021 19:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74016E5B6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 19:55:32 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id i68so17874789qke.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 12:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HN/dADQ65ljJkOdLNlsYJNf64TdCy5snXLeJXI/fSws=;
 b=tl6qBfeR1ctMdKOjD5T7yqHao2tzBYPwBZ6V7bhuPFKO/eH0NCRXEHAZNCBXm21vh6
 y+Jo6Lh2RnmrDGBcqsjKAkzFJkxr7aCjm19n/+UXJWae4U8zd3GMNLBODNvdGNIICjan
 Wk01zjyEh80E5jQGbtt4eSMWfBMj5BCcLPr4/vsqVc0SFWUjvYYTR9eqwatQ4qyUsDYL
 sxqIeBRVaLxnIVC4Ae/NGANFJ25uT7q1kEcFs/0s6XMesfA4z/g4NGVZz7hBQ3g+TxFz
 vHekfmbcapwt4zasp8IASP5xmqq0xOkziXoyPB9saT/TMxZVUKM94a6nnAJqepFv06za
 AT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HN/dADQ65ljJkOdLNlsYJNf64TdCy5snXLeJXI/fSws=;
 b=pkIMH0kJqYheEWZAmQRtMlDUvaEswnsl1wNbB+RzJweLYjyd3iOWMGU1324+REWEY9
 vyc7XsasCRCRade1TV9fmtilp9zH4K3pUolsWKPqREzxFrkOBaDbP1XQB0fix4cdq6r9
 cewb8d1WXU+NoaQvYONNAG0/TvhXh1Ya1E9ewkleRANMCBiWQgW4E4RxqzKyDUW35WXB
 dcIs/toAj0wvZenDTehTNFFZUo3fu0ykzIwxkdgXPgAmHKQEA+E/pt24HyHliIfs/XBA
 3IYofIu/FWyg1rErCtPsMz3e91W2X7lt1ifQmthVxaTk9HE6TROhnCJ11rN1nMpjhZXe
 X3YQ==
X-Gm-Message-State: AOAM530A5ZOQ72CaM5Vknvppbv+1MQB13GPgID//mpI0ztt2rG+sl752
 zfCXeJgCh9d7PJlnIaEgGiD1Ig==
X-Google-Smtp-Source: ABdhPJxCiMcEk4rEfSFxoc9MLYPAFpeFQHE1XQnjKYvFYU9dDovhkcdD8gGzWd5X3y+DjjX9qqPZtw==
X-Received: by 2002:a37:d58:: with SMTP id 85mr20317382qkn.414.1623182131919; 
 Tue, 08 Jun 2021 12:55:31 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id l141sm643687qke.48.2021.06.08.12.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 12:55:31 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/msm/dsi: support CPHY mode for 7nm pll/phy
Date: Tue,  8 Jun 2021 15:53:26 -0400
Message-Id: <20210608195342.18269-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
 Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Swapnil Jakhade <sjakhade@cadence.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the required changes to support 7nm pll/phy in CPHY mode.

This adds a "qcom,dsi-phy-cphy-mode" property for the PHY node to enable
the CPHY mode.

v2:
 - rebased on DSI PHY reworks
 - reworked getting cphy_mode in dsi_host.c
 - documentation change in separate patch

v3:
 - yaml bindings
 - changed binding to "phy-mode = <PHY_TYPE_DSI_CPHY>;"

Jonathan Marek (3):
  dt-bindings: msm: dsi: add missing 7nm bindings
  dt-bindings: msm: dsi: document phy-type property for 7nm dsi phy
  drm/msm/dsi: support CPHY mode for 7nm pll/phy

 .../bindings/display/msm/dsi-phy-7nm.yaml     |  70 +++++++++
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  34 +++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  49 ++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   3 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 145 ++++++++++++------
 include/dt-bindings/phy/phy.h                 |   2 +
 7 files changed, 258 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

-- 
2.26.1

