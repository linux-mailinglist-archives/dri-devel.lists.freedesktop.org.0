Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FB42C3A91
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251646E849;
	Wed, 25 Nov 2020 08:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DC96E83A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 07:01:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606287693; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=xdFWt8SW+lBVcOVDV7RfrFuOTXrgStdWcZ71nFKgFVc=;
 b=ftVb7jCVM3bdioCCnErqYeBsC3deYgMcvmC+pqGbE8IisBaqhXPWGoBByvvqbav1i7lQp+Oy
 VIbzd9P+0Ailea8rauFNm78snMp0fufHXoLUP0745SppPh0mmQNsPcGA1XX8yQu7EtXQkRgn
 jJIZIPtjtvpc2BunPuWkvYpyEXQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fbe01100c9500dc7b63b531 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 07:00:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29F0BC43464; Wed, 25 Nov 2020 07:00:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DAFFEC433ED;
 Wed, 25 Nov 2020 07:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DAFFEC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv10 0/9] System Cache support for GPU and required SMMU support
Date: Wed, 25 Nov 2020 12:30:09 +0530
Message-Id: <cover.1606287059.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Kristian H Kristensen <hoegsberg@google.com>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some hardware variants contain a system cache or the last level
cache(llc). This cache is typically a large block which is shared
by multiple clients on the SOC. GPU uses the system cache to cache
both the GPU data buffers(like textures) as well the SMMU pagetables.
This helps with improved render performance as well as lower power
consumption by reducing the bus traffic to the system memory.

The system cache architecture allows the cache to be split into slices
which then be used by multiple SOC clients. This patch series is an
effort to enable and use two of those slices preallocated for the GPU,
one for the GPU data buffers and another for the GPU SMMU hardware
pagetables.

Patch 1 - Patch 7 adds system cache support in SMMU and GPU driver.
Patch 8 and 9 are minor cleanups for arm-smmu impl.

Changes in v10:
 * Fix non-strict mode domain attr handling (Will)
 * Split the domain attribute patch into two (Will)

Changes in v9:
 * Change name from domain_attr_io_pgtbl_cfg to io_pgtable_domain_attr (Will)
 * Modify comment for the quirk as suggested (Will)
 * Compare with IO_PGTABLE_QUIRK_NON_STRICT for non-strict mode (Will)

Changes in v8:
 * Introduce a generic domain attribute for pagetable config (Will)
 * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
 * Move non-strict mode to use new struct domain_attr_io_pgtbl_config (Will)

Changes in v7:
 * Squash Jordan's patch to support MMU500 targets
 * Rebase on top of for-joerg/arm-smmu/updates and Jordan's short series for adreno-smmu impl

Changes in v6:
 * Move table to arm-smmu-qcom (Robin)

Changes in v5:
 * Drop cleanup of blank lines since it was intentional (Robin)
 * Rebase again on top of msm-next-pgtables as it moves pretty fast

Changes in v4:
 * Drop IOMMU_SYS_CACHE prot flag
 * Rebase on top of https://gitlab.freedesktop.org/drm/msm/-/tree/msm-next-pgtables

Changes in v3:
 * Fix domain attribute setting to before iommu_attach_device()
 * Fix few code style and checkpatch warnings
 * Rebase on top of Jordan's latest split pagetables and per-instance
   pagetables support

Changes in v2:
 * Addressed review comments and rebased on top of Jordan's split
   pagetables series

Jordan Crouse (1):
  drm/msm/a6xx: Add support for using system cache on MMU500 based
    targets

Sai Prakash Ranjan (6):
  iommu/io-pgtable: Add a domain attribute for pagetable configuration
  iommu/io-pgtable-arm: Add support to use system cache
  iommu/arm-smmu: Add support for pagetable config domain attribute
  iommu/arm-smmu: Move non-strict mode to use io_pgtable_domain_attr
  iommu: arm-smmu-impl: Use table to list QCOM implementations
  iommu: arm-smmu-impl: Add a space before open parenthesis

Sharat Masetty (2):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 109 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   5 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  17 ++++
 drivers/gpu/drm/msm/msm_drv.c              |   8 ++
 drivers/gpu/drm/msm/msm_drv.h              |   1 +
 drivers/gpu/drm/msm/msm_gpu.h              |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  11 +--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  21 +++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |  33 ++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |   3 +-
 drivers/iommu/io-pgtable-arm.c             |  10 +-
 include/linux/io-pgtable.h                 |   8 ++
 include/linux/iommu.h                      |   1 +
 13 files changed, 205 insertions(+), 27 deletions(-)


base-commit: a29bbb0861f487a5e144dc997a9f71a36c7a2404
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
