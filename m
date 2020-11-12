Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ACA2B022F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 10:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782E16E1C0;
	Thu, 12 Nov 2020 09:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10B76E1C0;
 Thu, 12 Nov 2020 09:43:59 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 131DA221FC;
 Thu, 12 Nov 2020 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605174239;
 bh=PX0Rx6DcDiPgOuXIk7NQwtEU8lgYXlKPndWTh8AkZDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NJxlZKiQ5RXRwLtdPQ973uyiOTFXEykVI1DX9HmOJRvYKPh3u0K8Cszg6f/NljKSF
 diotEEHr2Um5xjKVUnh/nL6p3VIaEvbDAD+193gZDC62PiTc8QjnvFILYIx2E6JRCJ
 4k4dUTiNPZZmeB5XqjVkNNvPYbl6OpWNP6NBWtzY=
Date: Thu, 12 Nov 2020 09:43:53 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv7 1/7] iommu/io-pgtable-arm: Add support to use system
 cache
Message-ID: <20201112094353.GB19049@willie-the-truck>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <1d4979c0dcf649c5717605c598067b4b225ab9de.1604048969.git.saiprakash.ranjan@codeaurora.org>
 <20201110121855.GD16239@willie-the-truck>
 <329542c0c09054a46fa8d6d8f92ad739@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <329542c0c09054a46fa8d6d8f92ad739@codeaurora.org>
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

On Wed, Nov 11, 2020 at 11:32:42AM +0530, Sai Prakash Ranjan wrote:
> On 2020-11-10 17:48, Will Deacon wrote:
> > On Fri, Oct 30, 2020 at 02:53:08PM +0530, Sai Prakash Ranjan wrote:
> > > Add a quirk IO_PGTABLE_QUIRK_SYS_CACHE to override the
> > > attributes set in TCR for the page table walker when
> > > using system cache.
> > > 
> > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > > ---
> > >  drivers/iommu/io-pgtable-arm.c | 7 ++++++-
> > >  include/linux/io-pgtable.h     | 4 ++++
> > >  2 files changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/iommu/io-pgtable-arm.c
> > > b/drivers/iommu/io-pgtable-arm.c
> > > index a7a9bc08dcd1..a356caf1683a 100644
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -761,7 +761,8 @@ arm_64_lpae_alloc_pgtable_s1(struct
> > > io_pgtable_cfg *cfg, void *cookie)
> > > 
> > >  	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
> > >  			    IO_PGTABLE_QUIRK_NON_STRICT |
> > > -			    IO_PGTABLE_QUIRK_ARM_TTBR1))
> > > +			    IO_PGTABLE_QUIRK_ARM_TTBR1 |
> > > +			    IO_PGTABLE_QUIRK_SYS_CACHE))
> > >  		return NULL;
> > > 
> > >  	data = arm_lpae_alloc_pgtable(cfg);
> > > @@ -773,6 +774,10 @@ arm_64_lpae_alloc_pgtable_s1(struct
> > > io_pgtable_cfg *cfg, void *cookie)
> > >  		tcr->sh = ARM_LPAE_TCR_SH_IS;
> > >  		tcr->irgn = ARM_LPAE_TCR_RGN_WBWA;
> > >  		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
> > > +	} else if (cfg->quirks & IO_PGTABLE_QUIRK_SYS_CACHE) {
> > > +		tcr->sh = ARM_LPAE_TCR_SH_OS;
> > > +		tcr->irgn = ARM_LPAE_TCR_RGN_NC;
> > > +		tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;
> > 
> > Given that this only applies in the case where then page-table walker is
> > non-coherent, I think we'd be better off renaming the quirk to something
> > like IO_PGTABLE_QUIRK_ARM_OUTER_WBWA and then rejecting it in the
> > non-coherent case.
> > 
> 
> Do you mean like below?
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index a7a9bc08dcd1..94de1f71db42 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -776,7 +776,10 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg
> *cfg, void *cookie)
>         } else {
>                 tcr->sh = ARM_LPAE_TCR_SH_OS;
>                 tcr->irgn = ARM_LPAE_TCR_RGN_NC;
> -               tcr->orgn = ARM_LPAE_TCR_RGN_NC;
> +               if (!(cfg->quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA))
> +                       tcr->orgn = ARM_LPAE_TCR_RGN_NC;
> +               else
> +                       tcr->orgn = ARM_LPAE_TCR_RGN_WBWA;

Yes, but rejecting the quirk if the walker is coherent (I accidentally said
"non-coherent" earlier on).

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
