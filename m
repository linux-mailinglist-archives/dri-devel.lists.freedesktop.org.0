Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE3641F213
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 18:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D6B6EE5C;
	Fri,  1 Oct 2021 16:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC23A6EE5C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 16:22:11 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1A4C51F45289;
 Fri,  1 Oct 2021 17:22:10 +0100 (BST)
Date: Fri, 1 Oct 2021 18:22:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, Rob
 Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/5] drm/panfrost: Add a PANFROST_BO_GPUONLY flag
Message-ID: <20211001182206.78eb87ab@collabora.com>
In-Reply-To: <02cb188d-e77d-3dd6-ad62-fe56d42724ae@arm.com>
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
 <20211001143427.1564786-5-boris.brezillon@collabora.com>
 <02cb188d-e77d-3dd6-ad62-fe56d42724ae@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 1 Oct 2021 16:13:42 +0100
Steven Price <steven.price@arm.com> wrote:

> On 01/10/2021 15:34, Boris Brezillon wrote:
> > This lets the driver reduce shareability domain of the MMU mapping,
> > which can in turn reduce access time and save power on cache-coherent
> > systems.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> This seems reasonable to me - it matches the kbase
> BASE_MEM_COHERENT_SYSTEM (only backwards obviously) and it worked
> reasonably well for the blob.
> 
> But I'm wondering if we need to do anything special to deal with the
> fact we will now have some non-coherent mappings on an otherwise
> coherent device.
> 
> There are certainly some oddities around how these buffers will be
> mapped into user space if requested, e.g. panfrost_gem_create_object()
> sets 'map_wc' based on pfdev->coherent which is arguably wrong for
> GPUONLY. So there are two things we could consider:
> 
> a) Actually prevent user space mapping GPUONLY flagged buffers. Which
> matches the intention of the name.

I intended to do that, just forgot to add wrappers around
drm_gem_shmem_{mmap,vmap}() to forbid CPU-mappings on gpuonly buffers.

> 
> b) Attempt to provide user space with the tools to safely interact with
> the buffers (this is the kbase approach). This does have the benefit of
> allowing *mostly* GPU access. An example here is the tiler heap where
> the CPU could zero out as necessary but mostly the GPU has ownership and
> the CPU never reads the contents. GPUONLY/DEVONLY might not be the best
> name in that case.

Uh, right, I forgot we had to zero the tiler heap on Midgard (most of
the time done with a WRITE_VALUE job, but there's an exception on some
old Midgard GPUs IIRC).
