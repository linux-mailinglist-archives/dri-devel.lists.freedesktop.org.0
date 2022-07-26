Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0D58188C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC21A95F0D;
	Tue, 26 Jul 2022 17:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6412F95EF1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:38:41 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so13962947pjl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 10:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JCn9/IjaeLQGVh694onzThTpnzvbXceLIXHLyYRvYVY=;
 b=XNrZs8tWp8PRd21901P8ntMu55q2yctWNlQA1QfQ7KQJbecWjcvUbFuZkRuQq3CZ2h
 3QBdPPbVnF85OM3V1/QmY633wB99DZSO6VZOR5dFdUXpySbrXxHnud+iPJB+t0n4thbI
 GFIi2UlTfJ+/Cf7Jl9TYFdopqnbFRa1MNXlBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JCn9/IjaeLQGVh694onzThTpnzvbXceLIXHLyYRvYVY=;
 b=ioBil6nxCeWhszYhZ85+mxh1jTJ6aL520K29nlNJW0XEiLAzlMMHUM5W/gNTpK+v3Y
 rlsz0JgLouj7EtMnYuNR4Ah/0Amuznzlt7G7PhniydWuIr8J/fE+I1CyMjgjZB4fkJt9
 So4lOuq0nJbFs5C/0CyNfVLyvnbPHQOPaAigs950yvBOxPoHLCQbzXPuB7+zVArDXjM5
 M8ofBFfhw7egvmpY4G3fL/uZlqdlg1OCo51V9DEnaqz/O5FTez4qd7JmG6d6MR/MODSe
 H8KaXF5m9u829oxcXY9UXlKK3NzGnls6cu4Jn7ktOQpKwQWtpVjyHYS0dICia6n0qoKK
 uAjA==
X-Gm-Message-State: AJIora/hDbPPrGf/rcWP9omUyjhFvDELFSASEYp+cbv2aXN7IX2L8Fij
 GRh/8sXsqmhh48tpe6e3HfSIQw==
X-Google-Smtp-Source: AGRyM1vgwZMiQM2WzJWkrdxjc5FVSLy91CuCpFSR+fEUatViRg+5GVgh6OGv5sqlFxiqNmaDne/52A==
X-Received: by 2002:a17:903:248:b0:168:ce2f:cbd2 with SMTP id
 j8-20020a170903024800b00168ce2fcbd2mr17627450plh.63.1658857120803; 
 Tue, 26 Jul 2022 10:38:40 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8693:e9aa:75c0:5134])
 by smtp.gmail.com with ESMTPSA id
 ik29-20020a170902ab1d00b0016d9ecd71f4sm245884plb.77.2022.07.26.10.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:38:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/7] drm/msm/dsi regulator improvements
Date: Tue, 26 Jul 2022 10:38:17 -0700
Message-Id: <20220726173824.1166873-1-dianders@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
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
Cc: Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Archit Taneja <architt@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main goal of this series is to make a small dent in cleaning up
the way we deal with regulator loads. The idea is to add some extra
functionality to the regulator "bulk" API so that consumers can
specify the load using that. Though I didn't convert everyone over, I
include patches in this series that show how the Qualcomm DSI driver
is improved by this.

I'd expect:
* The first two patches are bugfixes found while converting the DSI
  driver over. Those could land any time.
* The third patch ("drm/msm/dsi: Don't set a load before disabling a
  regulator") is a patch a sent the other day verbatim, included in
  this series because it's highly related. It could land any
  time. That's why I called this series "v2".
* After that I have patches that add to the regulator API and then
  show a usage of those in the DSI driver. I'd expect that the two
  regulator patches could land in the regulator tree. The DSI patches
  would need to wait until the new regulator changes are available.

Changes in v2:
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.
- ("Fix number of regulators for SDM660") new for v2.
- ("Allow specifying an initial load w/ the bulk API") new for v2.
- ("Use the new regulator bulk feature to specify the load") new for v2.
- ("Allow drivers to define their init data as const") new for v2.
- ("Take advantage of devm_regulator_bulk_get_const") new for v2.

Douglas Anderson (7):
  drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
  drm/msm/dsi: Fix number of regulators for SDM660
  drm/msm/dsi: Don't set a load before disabling a regulator
  regulator: core: Allow specifying an initial load w/ the bulk API
  drm/msm/dsi: Use the new regulator bulk feature to specify the load
  regulator: core: Allow drivers to define their init data as const
  drm/msm/dsi: Take advantage of devm_regulator_bulk_get_const()

 drivers/gpu/drm/msm/dsi/dsi.h                 |   1 -
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             | 172 +++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |  61 +------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  41 +----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c    |   4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    |   6 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c    |   4 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c    |   6 +-
 .../gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c   |   2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |   6 +-
 drivers/regulator/core.c                      |  20 +-
 drivers/regulator/devres.c                    |  28 +++
 include/linux/regulator/consumer.h            |  16 +-
 14 files changed, 165 insertions(+), 205 deletions(-)

-- 
2.37.1.359.gd136c6c3e2-goog

