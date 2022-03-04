Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716624CCAFF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061A010E3FD;
	Fri,  4 Mar 2022 00:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5210E20B;
 Fri,  4 Mar 2022 00:57:49 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso9313128pjk.1; 
 Thu, 03 Mar 2022 16:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4tlmCcwAixPksfOsjMXDq+jBjJUcS5OahrZLoaQMVA=;
 b=aIgK3V3Sn4DCfSrd6Vsq6VLfkuLIib+PrqFutN0KagVCNrWsFkzx9vBOMTPSOzvD9z
 kjhQIAMQG43ILtQDw/6gq2za9hRBxkrR5BeYlHVSJbG/dYgSRokglOMg7WkyuM3yBywk
 Fx6WOda2IxdRLKscmhM9wjtH0C16G2rwUcQq9y8wMuNEx9fNYc2zvI1IDNx9iZDqzdFC
 MKmJZx7OiNBtSktf4Z+Kn+bs2nJOnx33cKB0GMxtKhXwRBQ3cBQY/QonI3eDPK7y9hJz
 3PTg0R7kOOfwHE30ceFZpN55zv8wgR0+ZS8dWHsIeXtK2rMYavy2/AhgcS5fiw+WcNvI
 EBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r4tlmCcwAixPksfOsjMXDq+jBjJUcS5OahrZLoaQMVA=;
 b=NJN+zyy2vPWvX1u/v/3kEFMuLp3QRO3pTe8J8JS4Kw94kbxcDqsbO3zslw8rf87+lG
 Iu1LnpRe4NWmZuKQWYnu0pEaMlTG6EnYfXIMrQxayNEFbluw7HXZPNZrWbPK05dJQvDh
 YgFTz06DMaQiHr/9DBJ/0hFm7A9t0I/NbiNB37AH8NeyqmtsXcSbfE/GWl3YKsvV8eTW
 Ne6Wiuw5qXL7jZ5wwGtb65B/0or6fCOxU3wjAdIznEUCNUcpXHDJU94Z7G+5aabwFL53
 KSwXBQFZFmIek6+0Yv6/7b3Fn5kQGsJxs+QNxF0Tzn5wFGxgZ7WW2I/so3z/PxXcXaUH
 n3xQ==
X-Gm-Message-State: AOAM532X0ZwdI07ke+MkFHwHKPAXWtW4uYd9SIvSmcX2tWrDEZU1T46e
 RtziDffEumMtuqBb6unboWWKiCjifwU=
X-Google-Smtp-Source: ABdhPJzwVE1XKUhdVUGEANSFBPXuSZQXuj10njpmVxfknb74qZ0yevEQy/5bhs19DMZt5AdhE8JMpg==
X-Received: by 2002:a17:90a:7d10:b0:1be:ef04:43ce with SMTP id
 g16-20020a17090a7d1000b001beef0443cemr8012360pjl.225.1646355467918; 
 Thu, 03 Mar 2022 16:57:47 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 c30-20020a63725e000000b0037c8bf5b630sm704252pgn.12.2022.03.03.16.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 16:57:46 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/msm: Clear perf counters across context switch
Date: Thu,  3 Mar 2022 16:52:13 -0800
Message-Id: <20220304005317.776110-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Yangtao Li <tiny.windzz@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Some clever folks figured out a way to use performance counters as a
side-channel[1].  But, other than the special case of using the perf
counters for system profiling, we can reset the counters across context
switches to protect against this.

This series introduces a SYSPROF param which a sufficiently privilaged
userspace (like Mesa's pps-producer, which already must run as root) to
opt-out, and makes the default behavior to reset counters on context
switches.

[1] https://dl.acm.org/doi/pdf/10.1145/3503222.3507757

Rob Clark (4):
  drm/msm: Update generated headers
  drm/msm: Add SET_PARAM ioctl
  drm/msm: Add SYSPROF param (v2)
  drm/msm/a6xx: Zap counters across context switch

 drivers/gpu/drm/msm/adreno/a2xx.xml.h         |  26 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   1 +
 drivers/gpu/drm/msm/adreno/a3xx.xml.h         |  30 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   1 +
 drivers/gpu/drm/msm/adreno/a4xx.xml.h         | 112 ++-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   1 +
 drivers/gpu/drm/msm/adreno/a5xx.xml.h         |  63 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h         | 674 +++++++++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h     |  26 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  30 +
 .../gpu/drm/msm/adreno/adreno_common.xml.h    |  31 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  14 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   2 +
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h   |  46 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h      |  37 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h      |  37 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h     |  37 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_10nm.xml.h    |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_14nm.xml.h    |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_20nm.xml.h    |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_28nm.xml.h    |  37 +-
 .../gpu/drm/msm/dsi/dsi_phy_28nm_8960.xml.h   |  37 +-
 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h     | 480 -------------
 drivers/gpu/drm/msm/dsi/dsi_phy_7nm.xml.h     |  43 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h         |  37 +-
 drivers/gpu/drm/msm/dsi/sfpb.xml.h            |  37 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h           |  37 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h         |  37 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  28 +
 drivers/gpu/drm/msm/msm_gpu.c                 |   2 +
 drivers/gpu/drm/msm/msm_gpu.h                 |  29 +
 drivers/gpu/drm/msm/msm_submitqueue.c         |  39 +
 include/uapi/drm/msm_drm.h                    |  28 +-
 35 files changed, 1058 insertions(+), 1130 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/dsi_phy_5nm.xml.h

-- 
2.35.1

