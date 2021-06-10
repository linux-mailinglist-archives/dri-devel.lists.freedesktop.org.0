Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E233A3629
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921406E169;
	Thu, 10 Jun 2021 21:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCBC6E169;
 Thu, 10 Jun 2021 21:44:01 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id e1so1746837plh.8;
 Thu, 10 Jun 2021 14:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YXpzcgNJpQHDdAAXuY/oQ+b/W0CaqN4oZOi6cgulc3w=;
 b=E2rbXL6CzPIKl7GWbqD7FCanhZAzWtfGCuqJrFoaEQgsw5urIjzABVakFeezgw+MF9
 dPS1G7lhP/5pp/WE5+VtaBnHKjR/0QzthCWTcHRwkPDCAvNwJ6mn6Kbh1Tho8cDO0wrb
 R5YhgKOtFkV8qrAPER3NbSwhY/JPpabWfzpYzd1AvK9MthQJD50skgQ/v93OLH0fU2T/
 l1Z4dfXrQoxVTMMJOrkwKLmi6+hghrguF987nlMO+Kd+QlIfzXFR3nfoAMdEFti6YXAL
 Agwug7Eiwl+gQ36hHVAnaJXxQ//VEBvG71kovgdzds+Kn85Lyb3UhS1DqIYWyIbT7vSf
 X4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YXpzcgNJpQHDdAAXuY/oQ+b/W0CaqN4oZOi6cgulc3w=;
 b=Iu53aamYAVc9CFzvZnJ8mn6a3Ab2OJQu306yVx7UBZ87KMeTBaMFwR2JFi7ULwUU2Z
 c14wgGMvbrIykreM1myq6Q+ETicG3auJKiStsvuavQCi3Mzu4SdESFJPfhsRj+MyCJdM
 ZbivNVEt4CGTYPhrREhFQiQ7XJDEpJtQCbFLRl+/UYTfKUXmtvofzxkDf0D4MS2dO/d/
 DJSZUhcRAl66v3QhkSdMS9fAWhU9qQ1+almBeCItOft/2z6mwAcH+CQZbK97maPUpnfe
 xZyhBNUp4NGg6JGIFxHjI8KJ4q/HiIGf+wpsgghSEw/SiSWB3tmRkpfP0yUX2bWR8IPo
 iseQ==
X-Gm-Message-State: AOAM530pR0ALU9cwrsiQGPfDW5OD2v+LRRUTNw/ZjXuSKc+kq/L/3Axj
 rvVoUPaGFhHl5AmgOU12U0i1IJbxjEzLvQ==
X-Google-Smtp-Source: ABdhPJxJD11XqOOGjIiTUfiFNQ5RyIt0F4HMLtsf3nUmUETo7UraoM7d4RGl+EHgGk/z8yVGSa0MWA==
X-Received: by 2002:a17:902:f54d:b029:107:b14c:423d with SMTP id
 h13-20020a170902f54db0290107b14c423dmr746664plf.77.1623361440568; 
 Thu, 10 Jun 2021 14:44:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id d15sm3173040pfd.35.2021.06.10.14.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:43:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
Date: Thu, 10 Jun 2021 14:44:08 -0700
Message-Id: <20210610214431.539029-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Krishna Reddy <vdumpa@nvidia.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Douglas Anderson <dianders@chromium.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org
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

v5: [Rob] Use RBBM_STATUS3.SMMU_STALLED_ON_FAULT to detect case where
    GPU snapshotting needs to avoid crashdumper, and check the
    RBBM_STATUS3.SMMU_STALLED_ON_FAULT in GPU hang irq paths
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

Rob Clark (2):
  iommu/arm-smmu-qcom: Add stall support
  drm/msm: devcoredump iommu fault support

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  23 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 110 +++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  42 ++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  15 +++
 drivers/gpu/drm/msm/msm_gem.h               |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c        |   1 +
 drivers/gpu/drm/msm/msm_gpu.c               |  48 +++++++++
 drivers/gpu/drm/msm/msm_gpu.h               |  17 +++
 drivers/gpu/drm/msm/msm_gpummu.c            |   5 +
 drivers/gpu/drm/msm/msm_iommu.c             |  22 +++-
 drivers/gpu/drm/msm/msm_mmu.h               |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  50 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |   9 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h       |   2 +
 include/linux/adreno-smmu-priv.h            |  38 ++++++-
 15 files changed, 367 insertions(+), 21 deletions(-)

-- 
2.31.1

