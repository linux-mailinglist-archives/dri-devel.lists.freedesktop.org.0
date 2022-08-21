Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CF859B5F1
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 20:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FCD8FAAE;
	Sun, 21 Aug 2022 18:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487458FAA6;
 Sun, 21 Aug 2022 18:18:46 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso9247651pjr.3; 
 Sun, 21 Aug 2022 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=c7bGOCwCut3qJRTlJSLX/tQ+GZfNMJd7MaxTPLedcU4=;
 b=P3dwVwj3ElFzcjZaUJDdt6flBmuan50tBUY6b7hDWZFmqDSN9OLs2alfaT6XMsOYo3
 FDeIDa7PRo/TtuGvXJKZ4NVPSkCSL474me2baWzTNoG357uWKrB7Q4EgSSs4nfKSXQvz
 XJXmoQzgm937dSG/jaMw2T5DcO9bkCUFOVfSDbBhMU8vbYIxJQCv5dIw5RFfora9fEYI
 99bzHsi1qj6q6qYPa7IXMLHGy7PW/Ru61aTfqSe/xvbDlTiC6eNjy2N9F312nnmsaKN+
 urYPskRD8xI5V/iv8VRKsKUgP08hQwaJU+7b0yjDnyi3EF73NNjEDnGnCbdq6/+Gsrns
 Vlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=c7bGOCwCut3qJRTlJSLX/tQ+GZfNMJd7MaxTPLedcU4=;
 b=5A0a2wy8SWUMvMp1DNm0IRj1HfeFCRDUhR956v/hjqlicZT0yAxCgddGTziHlrpnx1
 Yqdi+XXMwvabDnHTtwCB4iIQefrtXlLcjHIqZ2GJVtgmqUATIa6zKtjgv5xXPYFJn3Qe
 hyIbbEI1dN71lrjbU1V/1ZShPSipbmrwLeBrVwXzIRyCqj/DUS+lxNgw8z33l2bzcgjn
 AXtGyH3oh7zhQBoRdXH86BTM/hT+q5dnlCMIyBRo3Rpmv6LKxDXiD8eAnLPFDaeh5VIY
 1sijLjAoPgywgqnNevDzk8nijpnDpEjEbDu8LHU2rvslmti8EViZnRIZ5fCA6GdlMAg9
 8GWg==
X-Gm-Message-State: ACgBeo2EFbgxvlrXmyFaC9h4GvHVe3Th8JjLKx394Ljo5UbMmTfWUZ5n
 tWcvV1wHggVV+w8DYjCpSZIJ1ll3CmY=
X-Google-Smtp-Source: AA6agR57mA7zNviZGDBPe/nd5LlRYobJ2Lt2nZD/kVP6bCUNXwMGM4G4e4fsuQBTH/AKetIff6wKKA==
X-Received: by 2002:a17:90b:514:b0:1f5:59b2:fceb with SMTP id
 r20-20020a17090b051400b001f559b2fcebmr19459511pjz.82.1661105925043; 
 Sun, 21 Aug 2022 11:18:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 z10-20020aa7990a000000b005364e0ec330sm3098307pff.59.2022.08.21.11.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 11:18:43 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm+iommu/arm-smmu-qcom: tlbinv optimizations
Date: Sun, 21 Aug 2022 11:19:01 -0700
Message-Id: <20220821181917.1188021-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Rob Clark <robdclark@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux.dev>,
 Sibi Sankar <sibis@codeaurora.org>, Yang Yingliang <yangyingliang@huawei.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Two additions to adreno_smmu_priv to allow for a couple of
optimizations:

 + Use a separate ASID for each set of pgtables to avoid
   over-invalidation.
 + Detect the case of unmapping from non-current pgtables
   where we can skip the redundant tlbinv

Rob Clark (5):
  iommu/arm-smmu-qcom: Fix indentation
  iommu/arm-smmu-qcom: Provide way to access current TTBR0
  iommu/arm-smmu-qcom: Add private interface to tlbinv by ASID
  drm/msm: Use separate ASID for each set of pgtables
  drm/msm: Skip tlbinv on unmap from non-current pgtables

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 +++
 drivers/gpu/drm/msm/msm_iommu.c            | 44 +++++++++++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 +++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 43 +++++++++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 +
 include/linux/adreno-smmu-priv.h           | 18 +++++----
 6 files changed, 106 insertions(+), 16 deletions(-)

-- 
2.37.2

