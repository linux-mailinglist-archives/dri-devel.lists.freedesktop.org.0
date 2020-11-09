Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61B2AC83B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 23:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B12389650;
	Mon,  9 Nov 2020 22:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C4189650
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 22:23:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604960611; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=h4kLvDOrgWdJbJRz3YUB6R5KJh03EMAS6v5CqdFVeFw=;
 b=Z8onWPaTJSZ9ll6Z6U1rNBeY/6btpQ30u9w6hgxzbwj4P0RKSWl0gQ7/DsxEsAjsGqJI7jUk
 2sZ/sYfxEx9WclNedrQGKYX0YlQa8ituxKFjw2jvEMHWOFHcaXl/e10bMV9rXf7RsWqKgJPE
 mLhLKzrCg8fo2aVdb6dpptpQ5tQ=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fa9c16061a7f890a6749025 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 22:23:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2AA23C43385; Mon,  9 Nov 2020 22:23:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 255EBC433C6;
 Mon,  9 Nov 2020 22:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 255EBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v1 0/3] iommu/arm-smmu: adreno-smmu page fault handling
Date: Mon,  9 Nov 2020 15:23:16 -0700
Message-Id: <20201109222319.2630557-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 freedreno@lists.freedesktop.org, Sharat Masetty <smasetty@codeaurora.org>,
 Krishna Reddy <vdumpa@nvidia.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an RFC to add an Adreno GPU specific handler for pagefaults. The first
patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
a adreno-smmu-priv function hook to capture a handful of important debugging
registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
third patch to print more detailed information on page fault such as the TTBR0
for the pagetable that caused the fault and the source of the fault as
determined by a combination of the FSYNR1 register and an internal GPU
register.

This code provides a solid base that we can expand on later for even more
extensive GPU side page fault debugging capabilities.

Jordan Crouse (3):
  iommu/arm-smmu: Add support for driver IOMMU fault handlers
  drm/msm: Add an adreno-smmu-priv callback to get pagefault info
  drm/msm: Improve the a6xx page fault handler

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 76 +++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_iommu.c            | 11 +++-
 drivers/gpu/drm/msm/msm_mmu.h              |  4 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 16 ++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +
 include/linux/adreno-smmu-priv.h           | 31 ++++++++-
 8 files changed, 151 insertions(+), 12 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
