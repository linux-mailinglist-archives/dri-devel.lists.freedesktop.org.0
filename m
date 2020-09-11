Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9240C268565
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 09:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B3A6E1F3;
	Mon, 14 Sep 2020 07:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1104 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2020 14:46:01 UTC
Received: from a27-187.smtp-out.us-west-2.amazonses.com
 (a27-187.smtp-out.us-west-2.amazonses.com [54.240.27.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C916E053;
 Fri, 11 Sep 2020 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599834456;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=5tZsB/wJn1cwAYaUlKplKeAwB+VSLVJQXUcWnRzqmpA=;
 b=ZzDG/CcM6b+GZIQ0YPbT4I6S+zRm/8NNS/no/u4PIpGehfDTP52wFnq9JBlHS1Tu
 1/oDgDqYYq4W01gWNwvkUKQYpOMsE24T6+TTfk0yOu3zlKP/vd/Mtw6uW+3rBUmzH6H
 aUC5U++PREk2ZLZs8rbvlY0wwSAO31S8lFme3Zg0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599834456;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
 bh=5tZsB/wJn1cwAYaUlKplKeAwB+VSLVJQXUcWnRzqmpA=;
 b=AovZDGfARtOkSNDW55Lz7DLrUajaWxER4GlGePKEyiuWmJnfU5UJ9O0RVU7WTIE2
 jmkwTWqVFjtqApmX3kD7oJch98nf1L3QrHzTB1Y4mduI2xm2eyKv2VD4k0HjV8h6EWz
 pSE04F2s5Uk76lWFaPvoTjWywHN2OPk5b/fYQfYI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1A1F0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv4 0/6] System Cache support for GPU and required SMMU support
Date: Fri, 11 Sep 2020 14:27:36 +0000
Message-ID: <010101747d9082bd-3c449b80-876f-433f-b6ef-ec6978fa97d1-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-SES-Outgoing: 2020.09.11-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-Mailman-Approved-At: Mon, 14 Sep 2020 07:03:05 +0000
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
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
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
effort to enable and use two of those slices perallocated for the GPU,
one for the GPU data buffers and another for the GPU SMMU hardware
pagetables.

Patch 1 - Patch 4 adds system cache support in SMMU and GPU driver.
Patch 5 and 6 are minor cleanups for arm-smmu impl.

The series is based on top of https://gitlab.freedesktop.org/drm/msm/-/tree/msm-next-pgtables

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

Sai Prakash Ranjan (4):
  iommu/io-pgtable-arm: Add support to use system cache
  iommu/arm-smmu: Add domain attribute for system cache
  iommu: arm-smmu-impl: Use table to list QCOM implementations
  iommu: arm-smmu-impl: Remove unwanted extra blank lines

Sharat Masetty (2):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 83 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 21 +++++-
 drivers/gpu/drm/msm/msm_drv.c              |  8 +++
 drivers/gpu/drm/msm/msm_drv.h              |  1 +
 drivers/gpu/drm/msm/msm_gpu.h              |  5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 17 ++---
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 17 +++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  1 +
 drivers/iommu/io-pgtable-arm.c             |  7 +-
 include/linux/io-pgtable.h                 |  4 ++
 include/linux/iommu.h                      |  1 +
 12 files changed, 155 insertions(+), 14 deletions(-)


base-commit: 11e579ab6a3c2003efa2cfd1f0b3b4395f041618
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
