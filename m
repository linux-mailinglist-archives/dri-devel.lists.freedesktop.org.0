Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5032212E54E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 12:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651606E0A5;
	Thu,  2 Jan 2020 11:02:29 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99D66E0A5
 for <dri-devel@freedesktop.org>; Thu,  2 Jan 2020 11:02:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1577962947; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tkKCPLe79npIk6waelmBeTcR6XDop2zkLNOKqt/0Dq0=;
 b=vqtR9tmy8Bzb2zM8BZPnIcLzZgo8YCHm5IFn1xDUdajTkmkRfqeZ6zlgTBBjoeY/cFHhV6lZ
 t5xOSzcjxXfhQswauhJWgrLmgUT1jvt6MRdTRezQ1fHuwM5aQ9J+3mBp/l0tZvgpGUc7+7YU
 f45RTAI+nRRmXKz6mKPVkxeeq3Q=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0dcdc2.7faef0573d50-smtp-out-n02;
 Thu, 02 Jan 2020 11:02:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4AC53C447A3; Thu,  2 Jan 2020 11:02:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from smasetty-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C9813C43383;
 Thu,  2 Jan 2020 11:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9813C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=smasetty@codeaurora.org
From: Sharat Masetty <smasetty@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/msm/a6xx: System Cache Support
Date: Thu,  2 Jan 2020 16:32:06 +0530
Message-Id: <1577962933-13577-1-git-send-email-smasetty@codeaurora.org>
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

v2: Code reviews and rebased code on top of Jordan's split pagetables series

To enable the system cache driver, add [1] to your stack if not already
present. Please review.

[1] https://lore.kernel.org/patchwork/patch/1165298/

Jordan Crouse (3):
  iommu/arm-smmu: Pass io_pgtable_cfg to impl specific init_context
  drm/msm: Attach the IOMMU device during initialization
  drm/msm: Refactor address space initialization

Sharat Masetty (3):
  drm: msm: a6xx: Properly free up the iommu objects
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

Vivek Gautam (1):
  iommu/arm-smmu: Add domain attribute for QCOM system cache

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    |  16 ++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 124 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h    |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  |  23 ++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |   8 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  19 ++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  19 ++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |   4 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  19 +++--
 drivers/gpu/drm/msm/msm_drv.c            |   8 ++
 drivers/gpu/drm/msm/msm_drv.h            |   9 +--
 drivers/gpu/drm/msm/msm_gem_vma.c        |  37 ++-------
 drivers/gpu/drm/msm/msm_gpu.c            |  49 +-----------
 drivers/gpu/drm/msm/msm_gpu.h            |   9 +--
 drivers/gpu/drm/msm/msm_gpummu.c         |   7 --
 drivers/gpu/drm/msm/msm_iommu.c          |  22 +++---
 drivers/gpu/drm/msm/msm_mmu.h            |   5 +-
 drivers/iommu/arm-smmu-impl.c            |   3 +-
 drivers/iommu/arm-smmu-qcom.c            |  10 +++
 drivers/iommu/arm-smmu.c                 |  25 +++++--
 drivers/iommu/arm-smmu.h                 |   4 +-
 include/linux/iommu.h                    |   1 +
 25 files changed, 269 insertions(+), 158 deletions(-)

--
1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
