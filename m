Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D4E9BF31D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 17:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F4310E15F;
	Wed,  6 Nov 2024 16:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vNCduIyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA9510E15F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 16:22:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 002EFA43FF3;
 Wed,  6 Nov 2024 16:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E12EC4CED5;
 Wed,  6 Nov 2024 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730910175;
 bh=fko2d8Xv/YYA+GV+21EM8ZaKw6eqvgyyyHl4/3gL/Gc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vNCduIyLgJ/+J00/AAxsHgY8tBhMN97vlbiNC2skrfGXhUHojPNpgznfYgpVGiCGv
 8LM72hveI+/iUDqpsvHhCLWX8KT2YyUC0wiNlGIWe69Mb5+PJA4dKZqxkiPsL7L5ic
 rmQVgoluQYSC1H++FEXNMXdjQNdI/xbEAec21SeHwkK448/T/fMptFOdAn0PRUV6qq
 8WTKpjAqoARgTcPhp6m6eTgv1Hgn1h93WEReHGmvOU7O/w8PM2d5IKtqyP37KCFeDV
 3aiqC55DjPNRJ2l3PFjCOPbfkpT1WgFohFWAqwaZS2LJUtxqDRTKrtk1o5Yh3ntO9V
 Jx2Ohi2F0fPrw==
Date: Wed, 6 Nov 2024 16:22:50 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, catalin.marinas@arm.com,
 kernel-team@android.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 0/3] Remove split on unmap behavior
Message-ID: <20241106162249.GA14615@willie-the-truck>
References: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
 <173090505900.4167208.10850898110820689849.b4-ty@kernel.org>
 <20241106161520.GJ35848@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106161520.GJ35848@ziepe.ca>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 06, 2024 at 12:15:20PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 06, 2024 at 03:53:23PM +0000, Will Deacon wrote:
> > On Tue, 05 Nov 2024 14:14:23 -0400, Jason Gunthorpe wrote:
> > > This is the result of the discussion on removing split. We agreed that
> > > split is not required, and no application should ask for anything that
> > > would not unmap a full large IOPTE.
> > > 
> > > Instead of split the two ARM drivers will now WARN_ON and return 0. This
> > > is in contrast to what several other drivers do of removing the whole
> > > IOPTE and returning 0.
> > > 
> > > [...]
> > 
> > Applied to iommu (arm/smmu), thanks!
> > 
> > [1/3] iommu/io-pgtable-arm: Remove split on unmap behavior
> >       https://git.kernel.org/iommu/c/33729a5fc0ca
> > [2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap behavior
> >       https://git.kernel.org/iommu/c/fd50651636fb
> > [3/3] iommu: Add a kdoc to iommu_unmap()
> >       https://git.kernel.org/iommu/c/6ac7dffe7cca
> 
> Thanks, can you add this hunk to fix the W=1 warning?
> 
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -820,7 +820,7 @@ static int __init arm_v7s_do_selftests(void)
>                 .pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
>         };
>         unsigned int iova, size;
> -       unsigned int i, loopnr = 0;
> +       unsigned int i;
>         size_t mapped;
>  
>         selftest_running = true;
> @@ -868,7 +868,6 @@ static int __init arm_v7s_do_selftests(void)
>                         return __FAIL(ops);
>  
>                 iova += SZ_16M;
> -               loopnr++;
>         }
>  
>         /* Full unmap */

I think I'd already folded that in, but please check!

Will
