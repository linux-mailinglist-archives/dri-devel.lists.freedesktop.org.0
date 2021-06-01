Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE56397C87
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 00:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39E989E43;
	Tue,  1 Jun 2021 22:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A154C89E43;
 Tue,  1 Jun 2021 22:43:57 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so2301347pjz.3; 
 Tue, 01 Jun 2021 15:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7E0ztSWBZtOlaDKHfsCxqv376BZVJpQCMWAAU6G5G88=;
 b=DleniQqk4mS2+2kein8dLcGyoPKrBjH9m0Z5PpLGC2bNJDuxywHlzSBlE1QndfWK7n
 dStP3Ah4dc9a1FKmip239Zu3EU8Z2XNLiHuU31qMPQ2b4OpkhwhGN2KP/LXtXBwcrVgc
 mS9nB5NKDYxiRDXCrkKoXsn0cBNthDtoDwVj0QuXSwQCXNF6OroW73BSC9zA+5dlu3hg
 MFKz4eC7Xb0mzUHbB4Ko39uPuk89yI96k8l1/uApgi0plUFcCVOBAllpFPLX6dnbPpGE
 EBvhdE32Xlt4O6nPpjbX/Nd4qMi7xTSa4zz86NoC/24K1CZrJvjX8Gg+vTM/V2zQA9db
 G+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7E0ztSWBZtOlaDKHfsCxqv376BZVJpQCMWAAU6G5G88=;
 b=Gl2fKjitw620jqV2yWo7kBDdB/mwT9+Q7zYmjt92K3dCFiTc2NkWb8zgih3Gt8WU69
 AoWq2utgqPmXdHsi5XQFWAZJylKQy0oSrhUmcnJGsV4PSkOdzwe8BXHp0hhigZ1XbZld
 kp9wBLYqZv4op7uAkt77PNSHaSNCgSfb70kj3hjIYiNn+hwwQqNNsMscNNdDrmasFpag
 maXv55YjUHu/EjI77nUcy7/ADtrsDZxZN4dDU8fMWpw6ZQ3TmSKtylbIcBp09dP2u4TJ
 1yYTJhG266R8/+xpB69wrywXu56B3ga4gePt9QDY8T+iKgFeIMlkjrN/inj96qqUDonb
 NXdg==
X-Gm-Message-State: AOAM531bCwrMyXGwuK7i/quQr8wZkJtNMnOBwDYEY2zMM8cjotsVOyJ8
 SSeQNSTgFgwwSzcpmttCTLVJ9Rzm4aLeA1eB
X-Google-Smtp-Source: ABdhPJx+MXlJVAK3VU9sUj3Q8wM8rPRlRXKTA4bATZVDKq9RVk6Y1mVomVLJn7SS3hiZvw7QTuhVmw==
X-Received: by 2002:a17:90b:252:: with SMTP id
 fz18mr2232979pjb.52.1622587436763; 
 Tue, 01 Jun 2021 15:43:56 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 fs24sm9228104pjb.6.2021.06.01.15.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 15:43:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/6] iommu/arm-smmu: adreno-smmu page fault handling
Date: Tue,  1 Jun 2021 15:47:18 -0700
Message-Id: <20210601224750.513996-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Dave Airlie <airlied@redhat.com>,
 Joerg Roedel <jroedel@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Krishna Reddy <vdumpa@nvidia.com>, Maxime Ripard <maxime@cerno.tech>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This picks up an earlier series[1] from Jordan, and adds additional
support needed to generate GPU devcore dumps on iova faults.  Original
description:

This is a stack to add an Adreno GPU specific handler for pagefaults. The first
patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
a adreno-smmu-priv function hook to capture a handful of important debugging
registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
third patch to print more detailed information on page fault such as the TTBR0
for the pagetable that caused the fault and the source of the fault as
determined by a combination of the FSYNR1 register and an internal GPU
register.

This code provides a solid base that we can expand on later for even more
extensive GPU side page fault debugging capabilities.

v4: [Rob] Add support to stall SMMU on fault, and let the GPU driver
    resume translation after it has had a chance to snapshot the GPUs
    state
v3: Always clear FSR even if the target driver is going to handle resume
v2: Fix comment wording and function pointer check per Rob Clark

[1] https://lore.kernel.org/dri-devel/20210225175135.91922-1-jcrouse@codeaurora.org/

Jordan Crouse (3):
  iommu/arm-smmu: Add support for driver IOMMU fault handlers
  iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault
    info
  drm/msm: Improve the a6xx page fault handler

Rob Clark (3):
  iommu/arm-smmu-qcom: Add stall support
  drm/msm: Add crashdump support for stalled SMMU
  drm/msm: devcoredump iommu fault support

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 101 +++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  43 +++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  15 +++
 drivers/gpu/drm/msm/msm_debugfs.c           |   2 +-
 drivers/gpu/drm/msm/msm_gem.h               |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c        |   1 +
 drivers/gpu/drm/msm/msm_gpu.c               |  55 ++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h               |  19 +++-
 drivers/gpu/drm/msm/msm_gpummu.c            |   5 +
 drivers/gpu/drm/msm/msm_iommu.c             |  22 ++++-
 drivers/gpu/drm/msm/msm_mmu.h               |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  50 ++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |   9 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h       |   2 +
 include/linux/adreno-smmu-priv.h            |  38 +++++++-
 20 files changed, 354 insertions(+), 31 deletions(-)

-- 
2.31.1

