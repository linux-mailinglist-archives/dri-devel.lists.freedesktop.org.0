Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBB5120FA5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC936E81B;
	Mon, 16 Dec 2019 16:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227B16E81B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:38:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576514287; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Vr7DeB6UN1uAvIEGB/iA7hx6Y0Q4rdMGj2xmO945Nsw=;
 b=Ui6I3XWykzrFhL+sjpXa+/sFWi/6DM4mxkrC359C1d6dtEWqNKPWGzXYh6f3HAf2SkPf1Uxr
 /7dYFq56eV5g6nZdrPTlLOzOwxBpg5/ojT/+VlNfOwMA1MU1FM6mYp+uhaco+ovL9ldeMJq9
 9ehqiQKlv6Cg+At3I05CtZsxvc8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7b2ea.7f1f598aff48-smtp-out-n01;
 Mon, 16 Dec 2019 16:38:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 45FC9C447B7; Mon, 16 Dec 2019 16:38:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DE5A9C433CB;
 Mon, 16 Dec 2019 16:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE5A9C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v3 0/5] iommu/arm-smmu: Split pagetable support for arm-smmu-v2
Date: Mon, 16 Dec 2019 09:37:46 -0700
Message-Id: <1576514271-15687-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Gleixner <tglx@linutronix.de>,
 will@kernel.org, Wen Yang <wen.yang99@zte.com.cn>,
 Ben Dooks <ben.dooks@codethink.co.uk>, linux-arm-kernel@lists.infradead.org,
 Brian Masney <masneyb@onstation.org>, freedreno@lists.freedesktop.org,
 Fritz Koenig <frkoenig@google.com>, linux-arm-msm@vger.kernel.org,
 Alexios Zavras <alexios.zavras@intel.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Drew Davenport <ddavenport@chromium.org>,
 robin.murphy@arm.com, Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Another refresh to support split pagetables for Adreno GPUs as part of an
incremental process to enable per-context pagetables.

In order to support per-context pagetables the GPU needs to enable split tables
so that we can store global buffers in the TTBR1 space leaving the GPU free to
program the TTBR0 register with the address of a context specific pagetable.

This patchset adds split pagetable support if requested by the domain owner
via the DOMAIN_ATTR_SPLIT_TABLES attribute. If the attribute is non zero at
attach time, the implementation will set up the TTBR0 and TTBR1 spaces with
identical configurations and program the domain pagetable into the TTBR1
register. The TTBR0 register will be unused.

The driver can determine if split pagetables were programmed by querying
DOMAIN_ATTR_SPLIT_TABLES after attaching. The domain geometry will also be
updated to reflect the virtual address space for the TTBR1 range.

These patches are on based on top of linux-next-20191216 with [1], [2], and [3]
from Robin on the iommu list.

Change log:

v3: Remove the implementation specific and make split pagetable support
part of the generic configuration

[1] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039718.html
[2] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039719.html
[3] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039720.html


Jordan Crouse (5):
  iommu: Add DOMAIN_ATTR_SPLIT_TABLES
  iommu/arm-smmu: Add support for split pagetables
  drm/msm: Attach the IOMMU device during initialization
  drm/msm: Refactor address space initialization
  drm/msm/a6xx: Support split pagetables

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 16 ++++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 51 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 23 ++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  8 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 18 ++++-------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 18 +++++------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 18 +++++------
 drivers/gpu/drm/msm/msm_drv.h            |  8 ++---
 drivers/gpu/drm/msm/msm_gem_vma.c        | 37 +++++------------------
 drivers/gpu/drm/msm/msm_gpu.c            | 49 ++----------------------------
 drivers/gpu/drm/msm/msm_gpu.h            |  4 +--
 drivers/gpu/drm/msm/msm_gpummu.c         |  6 ----
 drivers/gpu/drm/msm/msm_iommu.c          | 18 ++++++-----
 drivers/gpu/drm/msm/msm_mmu.h            |  1 -
 drivers/iommu/arm-smmu.c                 | 40 +++++++++++++++++++++----
 drivers/iommu/arm-smmu.h                 | 45 ++++++++++++++++++++++++----
 include/linux/iommu.h                    |  1 +
 21 files changed, 215 insertions(+), 153 deletions(-)

-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
