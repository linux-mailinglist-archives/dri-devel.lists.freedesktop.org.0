Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 110187BE89C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 19:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D373A10E0BA;
	Mon,  9 Oct 2023 17:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A3510E0BA
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 17:48:43 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-503f39d3236so5709942e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696873721; x=1697478521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=whR2x5YTc5W5ULa/RDQrnsqcM0SLXmEDPcz8d+26mOg=;
 b=t7PNmEWHwn7rjuTpJJuB9LXOXBpdHjx7LwFcyD8l6KcHjRWTCKifN+hDrVY0wVSnUg
 X01eXEQ/swtiRNX3scJlHMfMJa8hyZaY+JEve20l69b7BLxUBOptGwL+6C/mq+Tptv95
 YY5qdpmYWDfWDcARDWNr12S1DGq0hjUSGJQYZf8BnfyGIRNFa57Blo4dtwcRQaIWP5jn
 hEHhBbbj6Mhzpd2r+DUIiUkWmnhJFQaAPOKYhFN5jMoD+MagOIdUOraovtBxi7DEHAIS
 tvuD3BmODN59RvLe3/lGeq4cV21XPeW9AL2MxvydzPR1M8aiydDL6+pO+P3P3BRGhrQV
 Dczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696873721; x=1697478521;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=whR2x5YTc5W5ULa/RDQrnsqcM0SLXmEDPcz8d+26mOg=;
 b=BnlLeuOiYze1RAthwDRc1WiB1gbjr8tG5LztxGCdxu6JJFiZxLcHF2d6bIq/KOW44b
 kx5CtJ3Fywxc6eBCficOKInNHA8eWfVQ6lRYpNM1CMwtOKnPfdWwS+VSSBuoZMceBkvS
 hKCcWMBAR/q2KxINnRyAlcX7sblmBMHymeJnDIDiPUeKhWJi2GysmhEXUzCKb0X5EPgw
 vIG9oTAAb/ZLqA8YV5CmnTQqK9YPDLj6iav6pdiGdIMTqbHSBKsLhalFNM8OGNkMxfBI
 qvn0knS16rKJ0SW7IeH+b7opi9T/cT+e7A2SYjIuyr+sJCHziDjTGC7mLyBExBHJf7oY
 GDYQ==
X-Gm-Message-State: AOJu0Yy3Y4+J+I7+5X17J2p9IDai49nPnAAWRacDSGv7k+WbfaPoR7yT
 fla93wRog4L7NT0pZgakGD7gvg==
X-Google-Smtp-Source: AGHT+IGJRYzL4TFWAFMcnCUoJCkAVzT4yFW+6pQnDo33c0W418pDuB3BkkVOKKQC1S5ZvPD3jV8Xqg==
X-Received: by 2002:a19:380b:0:b0:503:2681:77e3 with SMTP id
 f11-20020a19380b000000b00503268177e3mr12203622lfa.24.1696873721162; 
 Mon, 09 Oct 2023 10:48:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 m23-20020ac24257000000b0050420eff124sm1495927lfl.152.2023.10.09.10.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 10:48:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v5 0/4] drm/msm: move resource allocation to the _probe
 function
Date: Mon,  9 Oct 2023 20:48:36 +0300
Message-Id: <20231009174840.2726861-1-dmitry.baryshkov@linaro.org>
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

This patchset was left untouched for almost a year. Let's reiterate it
in attempt to solve the long-standing issue.

As discussed several times on IRC, move display subdriver resource
allocation from kms_init to probe time to let it bail early.

Changes since v4:
- Rebased on top of linux-next

Changes since v3:
- Fixed MMIO unmaping in the DPU case.

Changes since v2:
- Move even more resource allocation in the DPU init path.

Changes since v1:
- Dropped the applied patch
- Picked in the patch to pass msm_kms pointer via msm_drv_probe()

Dmitry Baryshkov (4):
  drm/msm: allow passing struct msm_kms to msm_drv_probe()
  drm/msm/dpu: move resource allocation to the _probe function
  drm/msm/mdp4: move resource allocation to the _probe function
  drm/msm/mdp5: move resource allocation to the _probe function

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 133 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 106 +++++++++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 100 ++++++++---------
 drivers/gpu/drm/msm/msm_drv.c            |   6 +-
 drivers/gpu/drm/msm/msm_drv.h            |   3 +-
 5 files changed, 162 insertions(+), 186 deletions(-)

-- 
2.39.2

