Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA430AEFC
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 19:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D196E857;
	Mon,  1 Feb 2021 18:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so15.mailgun.net (so15.mailgun.net [198.61.254.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228116E85A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 18:20:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612203632; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=KCP5gKkHPVjwLZx5nyh5N3OYo5vrT4dmcu2MEeNyjnI=;
 b=tO6TXJT2YyzzyoJDg2SYBACk5pPhax60yXG9jRgpoB0JMnPKp0BjCNeQQOHq9OPeyzSKRBtH
 4uyZ4jn0Wp2tQ8R3NUq43jGsbewJcRtq587+pBuOEdAHMH8Ruk0Vn7cqk+3qD1ROzpC1ERHF
 5UvJ+LoBIddtrmjGwAJvtmYp6ZU=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 601846672d8ee3f99f014c65 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Feb 2021 18:20:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5EB47C43463; Mon,  1 Feb 2021 18:20:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F93FC433C6;
 Mon,  1 Feb 2021 18:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F93FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 1 Feb 2021 11:20:16 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
Message-ID: <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Will Deacon <will@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Kristian H Kristensen <hoegsberg@google.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kristian H Kristensen <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
> On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
> > > On 2021-01-29 14:35, Will Deacon wrote:
> > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
> > > > > Add a new page protection flag IOMMU_LLC which can be used
> > > > > by non-coherent masters to set cacheable memory attributes
> > > > > for an outer level of cache called as last-level cache or
> > > > > system cache. Initial user of this page protection flag is
> > > > > the adreno gpu and then can later be used by other clients
> > > > > such as video where this can be used for per-buffer based
> > > > > mapping.
> > > > >
> > > > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > > > > ---
> > > > >  drivers/iommu/io-pgtable-arm.c | 3 +++
> > > > >  include/linux/iommu.h          | 6 ++++++
> > > > >  2 files changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/drivers/iommu/io-pgtable-arm.c
> > > > > b/drivers/iommu/io-pgtable-arm.c
> > > > > index 7439ee7fdcdb..ebe653ef601b 100644
> > > > > --- a/drivers/iommu/io-pgtable-arm.c
> > > > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > > > @@ -415,6 +415,9 @@ static arm_lpae_iopte
> > > > > arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
> > > > >           else if (prot & IOMMU_CACHE)
> > > > >                   pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
> > > > >                           << ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > > > > +         else if (prot & IOMMU_LLC)
> > > > > +                 pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
> > > > > +                         << ARM_LPAE_PTE_ATTRINDX_SHIFT);
> > > > >   }
> > > > >
> > > > >   if (prot & IOMMU_CACHE)
> > > > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > > > index ffaa389ea128..1f82057df531 100644
> > > > > --- a/include/linux/iommu.h
> > > > > +++ b/include/linux/iommu.h
> > > > > @@ -31,6 +31,12 @@
> > > > >   * if the IOMMU page table format is equivalent.
> > > > >   */
> > > > >  #define IOMMU_PRIV       (1 << 5)
> > > > > +/*
> > > > > + * Non-coherent masters can use this page protection flag to set
> > > > > cacheable
> > > > > + * memory attributes for only a transparent outer level of cache,
> > > > > also known as
> > > > > + * the last-level or system cache.
> > > > > + */
> > > > > +#define IOMMU_LLC        (1 << 6)
> > > >
> > > > On reflection, I'm a bit worried about exposing this because I think it
> > > > will
> > > > introduce a mismatched virtual alias with the CPU (we don't even have a
> > > > MAIR
> > > > set up for this memory type). Now, we also have that issue for the PTW,
> > > > but
> > > > since we always use cache maintenance (i.e. the streaming API) for
> > > > publishing the page-tables to a non-coheren walker, it works out.
> > > > However,
> > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
> > > > allocation, then they're potentially in for a nasty surprise due to the
> > > > mismatched outer-cacheability attributes.
> > > >
> > >
> > > Can't we add the syscached memory type similar to what is done on android?
> >
> > Maybe. How does the GPU driver map these things on the CPU side?
> 
> Currently we use writecombine mappings for everything, although there
> are some cases that we'd like to use cached (but have not merged
> patches that would give userspace a way to flush/invalidate)
> 
> BR,
> -R

LLC/system cache doesn't have a relationship with the CPU cache.  Its just a
little accelerator that sits on the connection from the GPU to DDR and caches
accesses. The hint that Sai is suggesting is used to mark the buffers as
'no-write-allocate' to prevent GPU write operations from being cached in the LLC
which a) isn't interesting and b) takes up cache space for read operations.

Its easiest to think of the LLC as a bonus accelerator that has no cost for
us to use outside of the unfortunate per buffer hint.

We do have to worry about the CPU cache w.r.t I/O coherency (which is a
different hint) and in that case we have all of concerns that Will identified.

Jordan
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
