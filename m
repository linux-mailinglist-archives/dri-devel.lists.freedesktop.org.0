Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4C1126322
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 14:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4586E356;
	Thu, 19 Dec 2019 13:15:37 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA816E356
 for <dri-devel@freedesktop.org>; Thu, 19 Dec 2019 13:15:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576761337; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MatkvjJ++f5xYHSRzGDp53AIHwv/yYm+qCfukmt6X8c=;
 b=HovgAIzp92B5/UPzJtXIfuNOqPqboX5U5xW+PQj8/rPRjAQJxA+Peh6s5X3xn8gtjZ73SdyU
 ath9j/NUDk3DbD872tUMMOjehwA5+NvwBpw+MKInKKSGjiZFMFzI47ZNwzTHvCdPhrbSZUIm
 PCc1i178CEteFcfTZUD7Ho1n6Sk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb77f3.7f775d91f068-smtp-out-n02;
 Thu, 19 Dec 2019 13:15:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 22B5AC447AF; Thu, 19 Dec 2019 13:15:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 15F0AC447A3;
 Thu, 19 Dec 2019 13:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 15F0AC447A3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm/a6xx: System Cache Support
Date: Thu, 19 Dec 2019 18:44:41 +0530
Message-Id: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
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
Cc: saiprakash.ranjan@codeaurora.org, will@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, dri-devel@freedesktop.org,
 robin.murphy@arm.com, Sharat Masetty <smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some hardware variants contain a system level cache or the last level
cache(llc). This cache is typically a large block which is shared by multiple
clients on the SOC. GPU uses the system cache to cache both the GPU data
buffers(like textures) as well the SMMU pagetables. This helps with
improved render performance as well as lower power consumption by reducing
the bus traffic to the system memory.

The system cache architecture allows the cache to be split into slices which
then be used by multiple SOC clients. This patch series is an effort to enable
and use two of those slices perallocated for the GPU, one for the GPU data
buffers and another for the GPU SMMU hardware pagetables.

To enable the system cache driver, add [1] to your stack if not already
present. Please review.

[1] https://lore.kernel.org/patchwork/patch/1165298/

Jordan Crouse (1):
  iommu/arm-smmu: Pass io_pgtable_cfg to impl specific init_context

Sharat Masetty (3):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm: Pass mmu features to generic layers
  drm/msm/a6xx: Add support for using system cache(LLC)

Vivek Gautam (1):
  iommu/arm-smmu: Add domain attribute for QCOM system cache

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 122 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |   9 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |   4 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |   2 +-
 drivers/gpu/drm/msm/msm_drv.c           |   8 +++
 drivers/gpu/drm/msm/msm_drv.h           |   1 +
 drivers/gpu/drm/msm/msm_gpu.c           |   6 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   6 +-
 drivers/gpu/drm/msm/msm_iommu.c         |  13 ++++
 drivers/gpu/drm/msm/msm_mmu.h           |  14 ++++
 drivers/iommu/arm-smmu-impl.c           |   3 +-
 drivers/iommu/arm-smmu-qcom.c           |  10 +++
 drivers/iommu/arm-smmu.c                |  25 +++++--
 drivers/iommu/arm-smmu.h                |   4 +-
 include/linux/iommu.h                   |   1 +
 19 files changed, 216 insertions(+), 20 deletions(-)

--
1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
