Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063E2994B6
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 19:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C891589F5B;
	Mon, 26 Oct 2020 18:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D155A89A5E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 11:54:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603713272; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=szGp3b/hhWRxwpJshGTpSP+kxFDoTXvVtB0VW0Yh+A4=;
 b=luqWrE/vx3I09V0CX1fQSwwNNl8BizOLZKOMGQfJL56K8KbG06ah6AJBeEPShEfaQ/R+UYWG
 rvepeoh+AwmjFcVhxuHB16Khmf9/toYiddyXwA0zVf9T1nu/BxysdUg45BdeDkgfUiEj+YoR
 Jo4QS7aCAq4qsiNhMsz5iRPhAJI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f96b8e8856acb9b099380c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 11:54:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1CDECC433FF; Mon, 26 Oct 2020 11:54:16 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FA89C433C9;
 Mon, 26 Oct 2020 11:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3FA89C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail
 smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCHv6 0/6] System Cache support for GPU and required SMMU support
Date: Mon, 26 Oct 2020 17:23:59 +0530
Message-Id: <cover.1603448364.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 18:01:45 +0000
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
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
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
effort to enable and use two of those slices perallocated for the GPU,
one for the GPU data buffers and another for the GPU SMMU hardware
pagetables.

Patch 1 - Patch 4 adds system cache support in SMMU and GPU driver.
Patch 5 and 6 are minor cleanups for arm-smmu impl.

The series is based on top of https://gitlab.freedesktop.org/drm/msm/-/tree/msm-next-pgtables

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

Sai Prakash Ranjan (4):
  iommu/io-pgtable-arm: Add support to use system cache
  iommu/arm-smmu: Add domain attribute for system cache
  iommu: arm-smmu-impl: Use table to list QCOM implementations
  iommu: arm-smmu-impl: Add a space before open parenthesis

Sharat Masetty (2):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 83 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 17 +++++
 drivers/gpu/drm/msm/msm_drv.c              |  8 +++
 drivers/gpu/drm/msm/msm_drv.h              |  1 +
 drivers/gpu/drm/msm/msm_gpu.h              |  5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 11 +--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 21 ++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 17 +++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +-
 drivers/iommu/io-pgtable-arm.c             |  7 +-
 include/linux/io-pgtable.h                 |  4 ++
 include/linux/iommu.h                      |  1 +
 13 files changed, 161 insertions(+), 20 deletions(-)


base-commit: ea95e543fd6201aceff96a0dd95530b2085874c4
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
