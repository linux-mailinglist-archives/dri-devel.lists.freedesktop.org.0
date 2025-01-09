Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A122A07172
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 10:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA7010E0D3;
	Thu,  9 Jan 2025 09:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XxSyn6Ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B2510E0D3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 09:28:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E243BA41301;
 Thu,  9 Jan 2025 09:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807A9C4CED2;
 Thu,  9 Jan 2025 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736414908;
 bh=cm/GOqwwiMkALA/fEFsX5hEEy5V6SjOqxswcdV/STbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XxSyn6OkLmGCUGT46Xejk0oVc9wYD6k8fTUvHOcwReKi7cu6apM1Vv1rk43TPDSbX
 7sksEqWG8naX3qZ+x3+Ac6FeG0lmDUVJPikfxBnc5gug7Hx8qjQxIgvULeiBnFWXuj
 SM8vT7SquKvEx0eHIPKAsmANxGan3rbJGW9vVoaVZqc3tkai/PWNcix/6rQRChz9Nb
 2KoIvEiL7LeXPhq2jWy/Yhkp7s+tJ3Ly3EX1EZxh9Cs3SAjKPyzxFcQ05qLBYB3Y2W
 yr50Zso/lxP8NEHsbimRm8FzQti0ZSbgPIyYUmWNhduiWnACP6D+kuhmH+FRBFL4ZS
 onQxs8GNPbFsw==
Date: Thu, 9 Jan 2025 11:28:23 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250109092823.GI87447@unreal>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <0e7f92bd-7da3-4328-9081-0957b3d155ca@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e7f92bd-7da3-4328-9081-0957b3d155ca@amd.com>
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

On Thu, Jan 09, 2025 at 10:10:01AM +0100, Christian König wrote:
> Am 08.01.25 um 17:22 schrieb Jason Gunthorpe:
> > [SNIP]
> > > > For P2P cases we are going toward (PFN + P2P source information) as
> > > > input to the DMA API. The additional "P2P source information" provides
> > > > a good way for co-operating drivers to represent private address
> > > > spaces as well. Both importer and exporter can have full understanding
> > > > what is being mapped and do the correct things, safely.
> > > I can say from experience that this is clearly not going to work for all use
> > > cases.
> > > 
> > > It would mean that we have to pull a massive amount of driver specific
> > > functionality into the DMA API.
> > That isn't what I mean. There are two distinct parts, the means to
> > describe the source (PFN + P2P source information) that is compatible
> > with the DMA API, and the DMA API itself that works with a few general
> > P2P source information types.
> > 
> > Private source information would be detected by co-operating drivers
> > and go down driver private paths. It would be rejected by other
> > drivers. This broadly follows how the new API is working.
> > 
> > So here I mean you can use the same PFN + Source API between importer
> > and exporter and the importer can simply detect the special source and
> > do the private stuff. It is not shifting things under the DMA API, it
> > is building along side it using compatible design approaches. You
> > would match the source information, cast it to a driver structure, do
> > whatever driver math is needed to compute the local DMA address and
> > then write it to the device. Nothing is hard or "not going to work"
> > here.
> 
> Well to be honest that sounds like an absolutely horrible design.
> 
> You are moving all responsibilities for inter driver handling into the
> drivers themselves without any supervision by the core OS.
> 
> Drivers are notoriously buggy and should absolutely not do things like that
> on their own.

IMHO, you and Jason give different meaning to word "driver" in this
discussion. It is upto to the subsystems to decide how to provide new
API to the end drivers. Worth to read this LWN article first.

Dancing the DMA two-step - https://lwn.net/Articles/997563/

> 
> Do you have pointers to this new API?

Latest version is here - https://lore.kernel.org/all/cover.1734436840.git.leon@kernel.org/
Unfortunately, I forgot to copy/paste cover letter but it can be seen in
previous version https://lore.kernel.org/all/cover.1733398913.git.leon@kernel.org/.

The most complex example is block layer implementation which hides DMA API from
block drivers. https://lore.kernel.org/all/cover.1730037261.git.leon@kernel.org/

Thanks
