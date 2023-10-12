Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7653E7C6238
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 03:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C2410E20F;
	Thu, 12 Oct 2023 01:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22B710E3BA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 01:29:12 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5043a01ee20so630444e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 18:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697074151; x=1697678951; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1LZ/fmrZeDBE6BtfmuHqkriwEyl/J2HH4t6ZgQ8OUD4=;
 b=QhONWUs42N213lP42JA1mz8DhQg7RYZByAKmMe92pugKmrPsyL4UIngL+YI8Eh2MW4
 lVkfzLqIQTrCxw8QpYGL4p45rkzq2Q1e1+s+R6tNnoKT4yDcMQRgG+dIVqYTSFcAWqQe
 exPynZHTf5rHK44gXglez17m1tLWVeIP2IVlHQ4ggGXTOun5Bdzog1rk6SUmh8KFtXFO
 ZFiH53SJy4nkA50jrRVuuHxmStMaujs7LCi8lHMwy6q571rHflifLqcYtG8c2SYURKsQ
 oPAqU6j5zamGedM1hiFlBsfuJQwR9qCBT7K4Nih6IjMMwuM8i1rwQ9BE/slVuhu5g70b
 BLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697074151; x=1697678951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1LZ/fmrZeDBE6BtfmuHqkriwEyl/J2HH4t6ZgQ8OUD4=;
 b=JjPkEwEBTDLB1gXJHHKiNybsOPWyU2/loDwcbD3bx6JJEIrt9PfMChcTAPLgajFMaE
 axaixt5talpZfrpNdv4iumdaSwy4YGoaLeZONbujS3voDLiUB3wYD05QJI7LcucOD4IN
 aGAxksrqFn+kVeXsvwk0cYns+vpq65VqQMBeYR8kbwBolTDuuxReH50wZy19XkIqDHz+
 0bPm98/MX32MzOHJrfJyEK43hg0801c6OaJl4d92qG3C46QJwmEzN6K4ow5DQ5zsixcl
 7nX9o5FZsgnObSrP9OLiMC46rLfyj4TTeXutdooQQ6S+0QjMbQ1FmvKcqCbqiFTmxoWa
 WisA==
X-Gm-Message-State: AOJu0Yz7zAhfdWJLlltR6D1uenNJM2sXpMOwjo8LcGZawUHkiW17npKn
 v6l7A+0iZE/Kt7JfO6ATIjAYag==
X-Google-Smtp-Source: AGHT+IGIhydsigk/7G8XsFp+TM/XUj2EU2zE5Yu3YD+5mM3M3/pAT5rjdqpKvpH16nV+s3xX+P+7Gw==
X-Received: by 2002:a05:6512:220b:b0:500:a66b:b189 with SMTP id
 h11-20020a056512220b00b00500a66bb189mr23826766lfu.51.1697074150778; 
 Wed, 11 Oct 2023 18:29:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k10-20020ac2456a000000b004fe3a8a9a0bsm2526588lfm.202.2023.10.11.18.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 18:29:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/2] drm/msm/dsi: fix handling of TX DMA buffer
Date: Thu, 12 Oct 2023 04:29:07 +0300
Message-Id: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two issues in how the MSM DSI driver handles the GEM-allocated TX
DMA buffer object.

Changes since v1:
- Dropped the unused 'priv' variable from msm_dsi_tx_buf_free()

Dmitry Baryshkov (2):
  drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
  drm/msm/dsi: free TX buffer in unbind

 drivers/gpu/drm/msm/dsi/dsi.c      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 16 +++++++++-------
 3 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.39.2

