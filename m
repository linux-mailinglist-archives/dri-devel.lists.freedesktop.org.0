Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D354DC83
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A6810F528;
	Thu, 16 Jun 2022 08:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABF810F528
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:11:10 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c30so656970ljr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qbg9qXXSR6emdLRiopLdhShbC9ThAqArdO/gs7MONo=;
 b=FbDsXdOqnQj4yXB+zfSFUDL1JHL4n+irvfikBSA02l59GZ2mwhIXKeiNQjZQn+nIYw
 xL0BbA+mbR0GqZ4gAzC0aRtlsINd+7ZyC7BYeCoG4UdpbTB/KPTu8oSYueFg//1/nNlh
 Y4So0huPo9qi64qABkcZsIDTCdaPN7xx4eViZA9p0mV9ukYvmHrrtXdpWcC550531OmS
 666q6yd7z2WMon2YjT662RcJQsKo9QPtR4OLjDhr6VGTc6b9tFfBHzQTvUcl7tQ8nOx4
 8GRJbwObBw0CveTPqBSWVozk4vZbZWKVf7j0oyZTU8yGvxPEoB4bxzzfX0xibnD4LKyH
 AHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qbg9qXXSR6emdLRiopLdhShbC9ThAqArdO/gs7MONo=;
 b=LD6KidfZg5L/ZSGjaOu1kl//CuUWCAG9dxYWjBFDFRNG+LXYKjoKwzU0MAybRGc2xe
 BInwtWNBx0EEjxwlDWs0nkdG66uK4uUuDQjuc4hpQR460Xh1/o0srIKzNhl2AVFVtSpP
 KICwSRVfddSmF5EG4WwNqyzVY6968QtGV+DSMtirfn3G4JrfmU/0/foMJ4XNl25mofnG
 5Y9IVSvlbcbvFWPKGvUxRW9hZ2Da2jqJI8mYDCUCzyyYOk7sb8ULd/yFvxp9IqM/q+HO
 9a7rlxa5T4ai8usVx9o1h6WDglfGCherKyNe2ptWtbsJOBIiQUkSG1yC2Q9CFrc0fXYz
 XqnQ==
X-Gm-Message-State: AJIora9SQTbrvYSZD1yrj9XvLknEQFm+aREhaoT7HOUi+vEcYELxIJrm
 3JZyV9YV3HfUDPw8oG64D8Q7Pw==
X-Google-Smtp-Source: AGRyM1vc1pJmylzW5eHRWv3Nd6IuZfh47MF5zJutwFg1Sir9CSqf8ArnpGkS7cxI7nAwIrRYgix7Nw==
X-Received: by 2002:a05:651c:b09:b0:25a:44fd:41f with SMTP id
 b9-20020a05651c0b0900b0025a44fd041fmr1869162ljr.366.1655367067892; 
 Thu, 16 Jun 2022 01:11:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:11:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 0/5] drm/msm: fixes for KMS iommu handling
Date: Thu, 16 Jun 2022 11:11:01 +0300
Message-Id: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series started from the applied and then reverted [2] patch by
Robin Murphy [1]. After the MDSS rework [3] has landed it is now
possible to reapply the extended version of the original patch. While we
are at it, also rework the IOMMU init code for DPU and MDP5 drivers.

For MDP5 this moves iommu_domain_alloc() call and removes struct
mdp5_cfg_platform remains.

For DPU this allows specifying the iommus = <...> either in the DPU
device (like all DPU devices do) or in the MDSS device (like MDP5
devices do).

Changes since v2:
 - Merge two return statements in msm_kms_init_aspace() (requested by
   Stephen)

Changes since v1:
 - Move aspace init to common helper
 - Use device_iommu_mapped() rather than semi-internal
   dev_iommu_fwspec_get() (suggested by Robin Murphy)

[1] https://patchwork.freedesktop.org/patch/480707/
[2] https://patchwork.freedesktop.org/patch/482453/
[3] https://patchwork.freedesktop.org/series/98525/

Dmitry Baryshkov (5):
  drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
  drm/msm/mdp5: move iommu_domain_alloc() call close to its usage
  drm/msm: Stop using iommu_present()
  drm/msm: move KMS aspace init to the separate helper
  drm/msm: switch msm_kms_init_aspace() to use device_iommu_mapped()

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 24 ++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 --------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 +++------------
 drivers/gpu/drm/msm/msm_drv.c            | 49 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 6 files changed, 57 insertions(+), 70 deletions(-)

-- 
2.35.1

