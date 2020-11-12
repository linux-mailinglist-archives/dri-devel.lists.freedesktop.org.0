Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7192B0206
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 10:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5BF6E192;
	Thu, 12 Nov 2020 09:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B686E192;
 Thu, 12 Nov 2020 09:35:54 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C586621D40;
 Thu, 12 Nov 2020 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605173754;
 bh=jZvtOR3PtNvquvOxsY83AMLM9eQ6NrPnFVAxESmIl28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cnKe4HJzQy1Z4Fa3OHn1PJ7Uh7RHRVdjgfXmxYJYHH7lF7Zi06HIbOiwghgMPlOHY
 SyVnBkxOeiSY1fd2ZB7tBZAKbJWxOpB8nqD6afena+H2UTTmaZf6YJipCEisreDZso
 YcX9r7FjcfOuOxk8SMu0snM+yi0uuhmEazJHAGdw=
Date: Thu, 12 Nov 2020 09:35:48 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv7 2/7] iommu/arm-smmu: Add domain attribute for system
 cache
Message-ID: <20201112093547.GA19049@willie-the-truck>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <a4e454630e57aedd9da6a4ba40c8e1c415bb6836.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <20201110121835.GC16239@willie-the-truck>
 <b12284cce40225274c3b2d9aff7eed3a@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b12284cce40225274c3b2d9aff7eed3a@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel@lists.freedesktop.org,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 12:10:50PM +0530, Sai Prakash Ranjan wrote:
> On 2020-11-10 17:48, Will Deacon wrote:
> > On Fri, Oct 30, 2020 at 02:53:09PM +0530, Sai Prakash Ranjan wrote:
> > > Add iommu domain attribute for using system cache aka last level
> > > cache by client drivers like GPU to set right attributes for caching
> > > the hardware pagetables into the system cache.
> > > 
> > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.c | 17 +++++++++++++++++
> > >  drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
> > >  include/linux/iommu.h                 |  1 +
> > >  3 files changed, 19 insertions(+)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index b1cf8f0abc29..070d13f80c7e 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -789,6 +789,9 @@ static int arm_smmu_init_domain_context(struct
> > > iommu_domain *domain,
> > >  	if (smmu_domain->non_strict)
> > >  		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
> > > 
> > > +	if (smmu_domain->sys_cache)
> > > +		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_SYS_CACHE;
> > > +
> > >  	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
> > >  	if (!pgtbl_ops) {
> > >  		ret = -ENOMEM;
> > > @@ -1520,6 +1523,9 @@ static int arm_smmu_domain_get_attr(struct
> > > iommu_domain *domain,
> > >  		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
> > >  			*(int *)data = smmu_domain->non_strict;
> > >  			return 0;
> > > +		case DOMAIN_ATTR_SYS_CACHE:
> > > +			*((int *)data) = smmu_domain->sys_cache;
> > > +			return 0;
> > >  		default:
> > >  			return -ENODEV;
> > >  		}
> > > @@ -1551,6 +1557,17 @@ static int arm_smmu_domain_set_attr(struct
> > > iommu_domain *domain,
> > >  			else
> > >  				smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> > >  			break;
> > > +		case DOMAIN_ATTR_SYS_CACHE:
> > > +			if (smmu_domain->smmu) {
> > > +				ret = -EPERM;
> > > +				goto out_unlock;
> > > +			}
> > > +
> > > +			if (*((int *)data))
> > > +				smmu_domain->sys_cache = true;
> > > +			else
> > > +				smmu_domain->sys_cache = false;
> > > +			break;
> > >  		default:
> > >  			ret = -ENODEV;
> > >  		}
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > index 885840f3bec8..dfc44d806671 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > > @@ -373,6 +373,7 @@ struct arm_smmu_domain {
> > >  	struct mutex			init_mutex; /* Protects smmu pointer */
> > >  	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
> > >  	struct iommu_domain		domain;
> > > +	bool				sys_cache;
> > >  };
> > > 
> > >  struct arm_smmu_master_cfg {
> > > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > > index b95a6f8db6ff..4f4bb9c6f8f6 100644
> > > --- a/include/linux/iommu.h
> > > +++ b/include/linux/iommu.h
> > > @@ -118,6 +118,7 @@ enum iommu_attr {
> > >  	DOMAIN_ATTR_FSL_PAMUV1,
> > >  	DOMAIN_ATTR_NESTING,	/* two stages of translation */
> > >  	DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> > > +	DOMAIN_ATTR_SYS_CACHE,
> > 
> > I think you're trying to make this look generic, but it's really not.
> > If we need to funnel io-pgtable quirks through domain attributes, then I
> > think we should be open about that and add something like
> > DOMAIN_ATTR_IO_PGTABLE_CFG which could take a struct of page-table
> > configuration data for the domain (this could just be quirks initially,
> > but maybe it's worth extending to take ias, oas and page size)
> > 
> 
> Actually the initial versions used DOMAIN_ATTR_QCOM_SYS_CACHE
> to make it QCOM specific and not generic, I don't see anyone else
> using this attribute, would that work?

No -- I'd prefer to have _one_ domain attribute for funneling all the
IP_PGTABLE_CFG data. Otherwise, we'll just end up with things like
DOMAIN_ATTR_QCOM_SYS_CACHE_EXT or DOMAIN_ATTR_QCOM_QUIRKS later on.

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
