Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E5C6EFC8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590CA10E107;
	Wed, 19 Nov 2025 13:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t75TnyXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F84E10E107
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:45:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EACF7439C7;
 Wed, 19 Nov 2025 13:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7BBC16AAE;
 Wed, 19 Nov 2025 13:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763559931;
 bh=P3o8RHvDAEnUuERCe1BMnR1YwR+dMea/ZoAi5ZBXv90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t75TnyXaIaLVKA8TVdFOIbUfmeHo4/btOI2oLFyTwx1lCjsveSchI1EBPOOc8OfEU
 7QixraT3KFGSPUvnTVnRthbFaGMDxNTZWUo5Tcxjf6aH53rpaqGFLVSFMNLDizUd3A
 QwSiZmvD//HgnssiilLrKxRM4vZ6cmc99aE4Coipe6CFlk1vQCZdASthF5vaDcQnkL
 MZ/cNswguYwRmgNRRMqMXz+l4ErdZVCb5X7Kve7bjXyjaAi9nArERygQ5n0D8BaTA5
 3+fmL+QNcnPUcs4ADrhIjk+gdWlLU2nzJQQ5TGivxfxYWknTlcOCS90Tp/YEkddNL6
 Jp9XI6WLvWISQ==
Date: Wed, 19 Nov 2025 15:45:26 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v8 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <20251119134526.GE18335@unreal>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <BN9PR11MB5276BC3C0BDA85F0259A35058CD7A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20251119133000.GB18335@unreal> <20251119133708.GM17968@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119133708.GM17968@ziepe.ca>
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

On Wed, Nov 19, 2025 at 09:37:08AM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 19, 2025 at 03:30:00PM +0200, Leon Romanovsky wrote:
> > On Wed, Nov 19, 2025 at 05:54:55AM +0000, Tian, Kevin wrote:
> > > > From: Leon Romanovsky <leon@kernel.org>
> > > > Sent: Tuesday, November 11, 2025 5:58 PM
> > > > +
> > > > +	if (dma->state && dma_use_iova(dma->state)) {
> > > > +		WARN_ON_ONCE(mapped_len != size);
> > > 
> > > then "goto err_unmap_dma".
> > 
> > It never should happen, there is no need to provide error unwind to
> > something that you won't get.
> 
> It is expected that WARN_ON has recovery code, if it is possible and
> not burdensome.

It’s not necessary, but since I’m calculating mapped_len again, it’s natural—and completely
harmless—to double-check the arithmetic.

Thanks

> 
> Jason
