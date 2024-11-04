Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897E9BB368
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 12:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A3710E3D8;
	Mon,  4 Nov 2024 11:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eMIpvvSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973B010E3D8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 11:32:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E32215C5535;
 Mon,  4 Nov 2024 11:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891D9C4CED1;
 Mon,  4 Nov 2024 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730719964;
 bh=8ZO8QMi8eDQyeTvFBdXQdNHTOJOfrtdUJdubuiwZ26E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eMIpvvSlZ8E4uxwZ7RDJG/WK491fOg5D1/i7OF8DAZMparvrwh25tgA94GY1Kvi0a
 t8TVXxZfxukkgbQszt9zut5dFN6DkJA3yGO0A9NYJIVCH7nogxxgEpEyMNHGhFY3VR
 0co6qii2nN7EhEGZcSGisc+1zvNrlLGAnoTr+SVonFeO7N5Uo5g885gGZg6wy+ezQg
 BLsGOKpWXVSR8wS2wTG6Sdh4Js7Hrh3eDOF/51e3083RdUBcZQPbTHhgoHrum0M1wW
 g+V+XsUY+35ZgGm6tZvBFewKdmu/BspsFIy9/BTHHEUxATypIUSYqmu3VZc8R8jpRc
 lSRPC1aMRuYnQ==
Date: Mon, 4 Nov 2024 11:32:39 +0000
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
Message-ID: <20241104113237.GA11481@willie-the-truck>
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241101134005.GA109739@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101134005.GA109739@nvidia.com>
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

On Fri, Nov 01, 2024 at 10:40:05AM -0300, Jason Gunthorpe wrote:
> On Fri, Oct 18, 2024 at 02:19:26PM -0300, Jason Gunthorpe wrote:
> > Of the page table implementations (AMD v1/2, VT-D SS, ARM32, DART)
> > arm_lpae is unique in how it handles partial unmap of large IOPTEs.
> > 
> > All other drivers will unmap the large IOPTE and return it's length.  For
> > example if a 2M IOPTE is present and the first 4K is requested to be
> > unmapped then unmap will remove the whole 2M and report 2M as the result.
> > 
> > arm_lpae instead replaces the IOPTE with a table of smaller IOPTEs, unmaps
> > the 4K and returns 4k. This is actually an illegal/non-hitless operation
> > on at least SMMUv3 because of the BBM level 0 rules.
> > 
> > Long ago VFIO could trigger a path like this, today I know of no user of
> > this functionality.
> > 
> > Given it doesn't work fully correctly on SMMUv3 and would create
> > portability problems if any user depends on it, remove the unique support
> > in arm_lpae and align with the expected iommu interface.
> > 
> > Outside the iommu users, this will potentially effect io_pgtable users of
> > ARM_32_LPAE_S1, ARM_32_LPAE_S2, ARM_64_LPAE_S1, ARM_64_LPAE_S2, and
> > ARM_MALI_LPAE formats.
> > 
> > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > Cc: Steven Price <steven.price@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/iommu/io-pgtable-arm.c | 72 +++-------------------------------
> >  1 file changed, 6 insertions(+), 66 deletions(-)
> 
> Updated commit message - Will let me know if you want me to resend
> with this, or any changes:

Thanks! Please send a new version with this text, the WARN we discussed
in the other part of the thread and also attacking the v7s code.

Cheers,

Will
