Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED01F6FD2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 00:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B29C6E20E;
	Thu, 11 Jun 2020 22:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A746E20E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 22:21:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591914098; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=azP0xyXtEHTp8mBXwAsg9VzPRF+3AmYFbKzkZJrajpk=;
 b=iivZfV1dbRb8cR9EoykwKKPUXgSubzhtJscIIFiE8tA9FIrTBdtDeBtJjYAd6OxNk3yIVu8D
 PV5bMr/p7oWHsQsXK690LQ+q7g8eKK/AC6MTeTxWsppunC5gNOsLNgMvbeJYxwOw3ZyVDlqb
 hzEvH38bQrAAKiw2yKDAwAMxMEk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ee2ae71567385e8e7ca4b51 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 22:21:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8178DC433CB; Thu, 11 Jun 2020 22:21:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C4D9CC433CA;
 Thu, 11 Jun 2020 22:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4D9CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v8 0/7] iommu/arm-smmu: Enable split pagetable support
Date: Thu, 11 Jun 2020 16:21:21 -0600
Message-Id: <20200611222128.28826-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, Brian Masney <masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Another iteration of the split-pagetable support for arm-smmu and the Adreno GPU
SMMU. After email discussions [1] we opted to make a arm-smmu implementation for
specifically for the Adreno GPU and use that to enable split pagetable support
and later other implementation specific bits that we need.

On the hardware side this is very close to the same code from before [2] only
the TTBR1 quirk is turned on by the implementation and not a domain attribute.
In drm/msm we use the returned size of the aperture as a clue to let us know
which virtual address space we should use for global memory objects.

There are two open items that you should be aware of. First, in the
implementation specific code we have to check the compatible string of the
device so that we only enable TTBR1 for the GPU (SID 0) and not the GMU (SID 4).
I went back and forth trying to decide if I wanted to use the compatbile string
or the SID as the filter and settled on the compatible string but I could be
talked out of it.

The other open item is that in drm/msm the hardware only uses 49 bits of the
address space but arm-smmu expects the address to be sign extended all the way
to 64 bits. This isn't a problem normally unless you look at the hardware
registers that contain a IOVA and then the upper bits will be zero. I opted to
restrict the internal drm/msm IOVA range to only 49 bits and then sign extend
right before calling iommu_map / iommu_unmap. This is a bit wonky but I thought
that matching the hardware would be less confusing when debugging a hang.

v8: Pass the attached device in the smmu_domain to the implementation
specific functions

[1] https://lists.linuxfoundation.org/pipermail/iommu/2020-May/044537.html
[2] https://patchwork.kernel.org/patch/11482591/


Jordan Crouse (7):
  iommu/arm-smmu: Pass io-pgtable config to implementation specific
    function
  iommu/arm-smmu: Add support for split pagetables
  dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
  iommu/arm-smmu: Add a pointer to the attached device to smmu_domain
  iommu/arm-smmu: Add implementation for the adreno GPU SMMU
  drm/msm: Set the global virtual address range from the IOMMU domain
  arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  4 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       | 13 +++++-
 drivers/gpu/drm/msm/msm_iommu.c               |  7 +++
 drivers/iommu/arm-smmu-impl.c                 |  6 ++-
 drivers/iommu/arm-smmu-qcom.c                 | 45 ++++++++++++++++++-
 drivers/iommu/arm-smmu.c                      | 33 +++++++++-----
 drivers/iommu/arm-smmu.h                      | 30 ++++++++++---
 8 files changed, 117 insertions(+), 23 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
