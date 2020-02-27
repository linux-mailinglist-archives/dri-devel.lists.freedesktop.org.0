Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D242B1727DD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA0D6ED01;
	Thu, 27 Feb 2020 18:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FEC6ECE9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:45:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582829145; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=U/EDQ0pr75hfPnWX/OCbb8FxwwnZ09FdliYUIRis9EI=;
 b=Ohq2uaYBNAbZEQptPXBQQ+qzqPjzkH+0YYuxpdFx+DyALuh00wew8k2uA+YhgrseIm3SzhIJ
 OtwzdRAaySVr3nO2ZzxL4caRK1Eat50T/Ts0FamAhwd+qcQ9m0vwYu8y/Wnw871bWt49q9WQ
 LPB4/Usgp2E7GmTIQbCb5Iz7Sro=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e580e55.7f0e10e580d8-smtp-out-n03;
 Thu, 27 Feb 2020 18:45:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7605FC447A2; Thu, 27 Feb 2020 18:45:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 83C15C433A2;
 Thu, 27 Feb 2020 18:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 83C15C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 27 Feb 2020 11:45:34 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: iommu@lists.linux-foundation.org
Subject: Re: [Freedreno] [PATCH v5 0/5] iommu/arm-smmu: Split pagetable
 support for arm-smmu-v2
Message-ID: <20200227184534.GA25772@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: iommu@lists.linux-foundation.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Wen Yang <wen.yang99@zte.com.cn>,
 will@kernel.org, Joerg Roedel <joro@8bytes.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-arm-kernel@lists.infradead.org,
 Wambui Karuga <wambui.karugax@gmail.com>,
 freedreno@lists.freedesktop.org, Fritz Koenig <frkoenig@google.com>,
 linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>,
 Enrico Weigelt <info@metux.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, zhengbin <zhengbin13@huawei.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>,
 Brian Masney <masneyb@onstation.org>, robin.murphy@arm.com,
 Georgi Djakov <georgi.djakov@linaro.org>
References: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, will@kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Joerg Roedel <joro@8bytes.org>,
 Wen Yang <wen.yang99@zte.com.cn>, Ben Dooks <ben.dooks@codethink.co.uk>,
 linux-arm-kernel@lists.infradead.org, Wambui Karuga <wambui.karugax@gmail.com>,
 Fritz Koenig <frkoenig@google.com>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, robin.murphy@arm.com,
 Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Drew Davenport <ddavenport@chromium.org>, Brian Masney <masneyb@onstation.org>,
 freedreno@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 03:00:14PM -0700, Jordan Crouse wrote:
> This is another iteration for the split pagetable support based on the
> suggestions from Robin and Will [1].
> 
> Background: In order to support per-context pagetables the GPU needs to enable
> split tables so that we can store global buffers in the TTBR1 space leaving the
> GPU free to program the TTBR0 register with the address of a context specific
> pagetable.
> 
> If the DOMAIN_ATTR_SPLIT_TABLES attribute is set on the domain before attaching,
> the context bank assigned to the domain will be programmed to allow translations
> in the TTBR1 space. Translations in the TTBR0 region will be disallowed because,
> as Robin pointe out, having a un-programmed TTBR0 register is dangerous.
> 
> The driver can determine if TTBR1 was successfully programmed by querying
> DOMAIN_ATTR_SPLIT_TABLES after attaching. The domain geometry will also be
> updated to reflect the virtual address space for the TTBR1 range.
> 
> Upcoming changes will allow auxiliary domains to be attached to the device which
> will enable and program TTBR0.
> 
> This patchset is based on top of linux-next-20200127.

Quick ping for feedback so I can respin for (maybe?) 5.6.

Thanks,
Jordan

> Change log:
> 
> v4: Only program TTBR1 when split pagetables are requested. TTBR0 will be
> enabled later when an auxiliary domain is attached
> v3: Remove the implementation specific and make split pagetable support
> part of the generic configuration
> 
> [1] https://lists.linuxfoundation.org/pipermail/iommu/2020-January/041373.html
> 
> Jordan Crouse (5):
>   iommu: Add DOMAIN_ATTR_SPLIT_TABLES
>   iommu/arm-smmu: Add support for TTBR1
>   drm/msm: Attach the IOMMU device during initialization
>   drm/msm: Refactor address space initialization
>   drm/msm/a6xx: Support split pagetables
> 
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 16 ++++++++++
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 51 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 23 ++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  8 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 18 ++++-------
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 18 +++++------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 18 +++++------
>  drivers/gpu/drm/msm/msm_drv.h            |  8 ++---
>  drivers/gpu/drm/msm/msm_gem_vma.c        | 36 ++++------------------
>  drivers/gpu/drm/msm/msm_gpu.c            | 49 ++----------------------------
>  drivers/gpu/drm/msm/msm_gpu.h            |  4 +--
>  drivers/gpu/drm/msm/msm_gpummu.c         |  6 ----
>  drivers/gpu/drm/msm/msm_iommu.c          | 18 ++++++-----
>  drivers/gpu/drm/msm/msm_mmu.h            |  1 -
>  drivers/iommu/arm-smmu.c                 | 48 +++++++++++++++++++++++++-----
>  drivers/iommu/arm-smmu.h                 | 22 ++++++++++----
>  include/linux/iommu.h                    |  2 ++
>  21 files changed, 198 insertions(+), 155 deletions(-)
> 
> -- 
> 2.7.4
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
