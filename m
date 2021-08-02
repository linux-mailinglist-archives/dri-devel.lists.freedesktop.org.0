Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EAD3DDC15
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 17:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5986E2B6;
	Mon,  2 Aug 2021 15:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24606E090;
 Mon,  2 Aug 2021 15:14:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C9C160FF2;
 Mon,  2 Aug 2021 15:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627917255;
 bh=UYOjm0eFhgR8EvFjQmM1ln8mHCxXRZCUDUqH/Bvbfyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I+L+PP6a5jTfzy3P7sMw1ozlawfViMsG4K1XbMXEN7FNMylVLZukn49Or+IvXjCFf
 vMw+jdh/BQgBnP9wNdZTsPb45W6h9jdnesphww0jMhHlT2zxHkQuOmRbK2W6OcpnrV
 XFbMBWrApX6RisQX8Meh9WBAddgraG1S8IK5FEufYZw6Sm9zaF68fW176PXqIj266L
 yG8Mc8wLP/Xmk2gtV9MIgbmfbXoe8E5XdKdDFIsApjuPza4bI/jK1KJXyIDyS44XJN
 mi0nYqjnKPxx44IFD3m4coN8gQDZOhB9FLfNIfPMHSgXy3CZUFvmibAwxdcGxAAq/p
 cLmIeXXFw8p3Q==
Date: Mon, 2 Aug 2021 16:14:09 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Georgi Djakov <djakov@kernel.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Akhil P Oommen <akhilpo@codeaurora.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Kristian H Kristensen <hoegsberg@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent
 masters to use system cache
Message-ID: <20210802151409.GE28735@willie-the-truck>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
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

On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > the memory type setting required for the non-coherent masters to use
> > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > Without this, the system cache lines are not allocated for GPU.
> > > > >
> > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > and makes GPU the user of this protection flag.
> > > >
> > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > not apply anymore?
> > > >
> > >
> > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > I can repost the patch.
> >
> > I still think you need to handle the mismatched alias, no? You're adding
> > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > can't be right.
> >
> 
> Just curious, and maybe this is a dumb question, but what is your
> concern about mismatched aliases?  I mean the cache hierarchy on the
> GPU device side (anything beyond the LLC) is pretty different and
> doesn't really care about the smmu pgtable attributes..

If the CPU accesses a shared buffer with different attributes to those which
the device is using then you fall into the "mismatched memory attributes"
part of the Arm architecture. It's reasonably unforgiving (you should go and
read it) and in some cases can apply to speculative accesses as well, but
the end result is typically loss of coherency.

Will
