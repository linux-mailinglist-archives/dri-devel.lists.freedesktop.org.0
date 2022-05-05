Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DC751B47F
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 02:16:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327DB10F915;
	Thu,  5 May 2022 00:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D5D10F913
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 00:16:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id w1so4989560lfa.4
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 17:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u1oDjcUyt+XUVjgyrGdMzbLDFCsXlZDQVUok8w5uQW0=;
 b=CQHMq/8CJlJKPUyQiDirAGtcF7+a+yuxuXiVjjHRQt2RNB20u+FGulytwVJDIvTC59
 GQXorniYjsNwFo44ZQmuYrBwWQzVUEQR9gMLr2bbkFwajZzXLt1tShVpzvMnnZC0tDfB
 zmMJdTlL8z/gcp4YUHsqOnVp+2igTvkpZk6dnQMWKNdAdrFsAD7D679GHXtk9XhKa4uI
 U2nvRnX1Di2ZcwPwAFTacp8ojuASJQLXAoNXcebEWPSKy5AlQYnY5zTo/VVnu/1aOmOU
 Py0pLZsUqHkoc06iMLw0oR9bbPfVkOxhINndThGZkgcQ5ZBGvv8tqPFAoMsiAgGlh7yd
 L0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u1oDjcUyt+XUVjgyrGdMzbLDFCsXlZDQVUok8w5uQW0=;
 b=ZXrUG9pQl8HATxYbHlNOYjRB/zJiqDHORE+3cT2/BxEa0KWNqTUgDBLgjMMKKJarB3
 2iHafAQ9p8DiHRCB7+OrCWmvGp+5ioTuspyKZbizwqgh8VMzazG3E808h/d54fgCeIzb
 ose02jNiWhLiNB3UMnOD3PP4drri3+Cc06jZ39JqUo2wafN35YNzJC0bzkZWym1ZEjhc
 CE8FRgXB8w1L8+/uMEC4yjdHthNg2ZHJ8UzikV71TN9X8PUFts9eH50kNd6VLeIneweI
 foIBR6LKqO2EpFI2PVKZT+q84AjCLvmeucw/e9l0auRXuh7zOjJZ6YRRGAoQEXqlsL12
 7VnA==
X-Gm-Message-State: AOAM532oxrnLgmb5rEXEDkswbTyS56rhPR6Ohc1iuf0JW21eDGUbyMT6
 Zq58BE406cMcA3Z7CzXTLtZJqw==
X-Google-Smtp-Source: ABdhPJyOFcMiCTxFiESBlHbtybCGQflPnHtvNynjnT2Q8APsdSngeAVyRhsSyiUanGlZdzyOpSVD8w==
X-Received: by 2002:a05:6512:b0b:b0:44a:f4a5:b519 with SMTP id
 w11-20020a0565120b0b00b0044af4a5b519mr16033374lfu.287.1651709766535; 
 Wed, 04 May 2022 17:16:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 17:16:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/5] drm/msm: fixes for KMS iommu handling
Date: Thu,  5 May 2022 03:16:00 +0300
Message-Id: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
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
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
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

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 24 ++---------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 --------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 +++-----------
 drivers/gpu/drm/msm/msm_drv.c            | 51 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 6 files changed, 59 insertions(+), 70 deletions(-)

-- 
2.35.1

