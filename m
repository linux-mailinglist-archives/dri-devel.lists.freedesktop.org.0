Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4EE41F325
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F636EE6B;
	Fri,  1 Oct 2021 17:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DFA6EE6B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:30:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id D13E61F4579C
Date: Fri, 1 Oct 2021 13:30:43 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/5] drm/panfrost: Add a PANFROST_BO_GPUONLY flag
Message-ID: <YVdFw9FivIyUCgU4@maud>
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
 <20211001143427.1564786-5-boris.brezillon@collabora.com>
 <02cb188d-e77d-3dd6-ad62-fe56d42724ae@arm.com>
 <20211001182206.78eb87ab@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001182206.78eb87ab@collabora.com>
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

> > This seems reasonable to me - it matches the kbase
> > BASE_MEM_COHERENT_SYSTEM (only backwards obviously) and it worked
> > reasonably well for the blob.

Oh, is that what that was for? I remember seeing it set on Midgard for
varyings. Good to go full circle now.

> > But I'm wondering if we need to do anything special to deal with the
> > fact we will now have some non-coherent mappings on an otherwise
> > coherent device.
> > 
> > There are certainly some oddities around how these buffers will be
> > mapped into user space if requested, e.g. panfrost_gem_create_object()
> > sets 'map_wc' based on pfdev->coherent which is arguably wrong for
> > GPUONLY. So there are two things we could consider:
> > 
> > a) Actually prevent user space mapping GPUONLY flagged buffers. Which
> > matches the intention of the name.
> 
> I intended to do that, just forgot to add wrappers around
> drm_gem_shmem_{mmap,vmap}() to forbid CPU-mappings on gpuonly buffers.

This feels like the cleaner solution to me.

> > b) Attempt to provide user space with the tools to safely interact with
> > the buffers (this is the kbase approach). This does have the benefit of
> > allowing *mostly* GPU access. An example here is the tiler heap where
> > the CPU could zero out as necessary but mostly the GPU has ownership and
> > the CPU never reads the contents. GPUONLY/DEVONLY might not be the best
> > name in that case.
> 
> Uh, right, I forgot we had to zero the tiler heap on Midgard (most of
> the time done with a WRITE_VALUE job, but there's an exception on some
> old Midgard GPUs IIRC).

"Attempt" is the key word here :|

We indeed only touch the tiler heap from the CPU on v4, and life's too
short to care about new optimizations for v4. Unless the patch is
trivial, my vote is for a) preventing the mappings and only setting
GPUONLY on the tiler_heap starting with v5.
