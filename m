Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F10030E51B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 22:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79456EC03;
	Wed,  3 Feb 2021 21:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B93D6E57E;
 Wed,  3 Feb 2021 21:46:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFFBE64DA3;
 Wed,  3 Feb 2021 21:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612388778;
 bh=t9q36+UozJsJ0NMC2j5rVcV+pwE4hj88IGjV6WTPNUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVRuQ5P0IfFTsuCtMSN892U6rEqrIfX9TVmgXodJDinRCg5OkM9Co88RgxyBq3rmJ
 O1HkbK7cKkulp25CDBWLst0L8JbCrIbj9RZ2I3zHtl7ISsV3+3Xpwe2YdEHmqESL8B
 n3KtHxLGn0iPYvsF4A4J7y0VYF7TycoLYNNOgb0y03Lc9skcbp8DdrHCOt1R8K6jqG
 5OJdLRid3AWksbYRNL/FyX/t09EMZzgUtuvsXVH/eAZDPQHXygnGPxNCy+yzvqANxP
 XgiZ6rgkWPPgE8bta9cwEBqe6erV6gX23odAuK6lYsgo/L1wSwUDQXgSdhT7ENA+kK
 RNVV1TErPzzyQ==
Date: Wed, 3 Feb 2021 21:46:12 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
Message-ID: <20210203214612.GB19847@willie-the-truck>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
 <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
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
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, "list@263.net:IOMMU DRIVERS ,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Kristian H Kristensen <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 02, 2021 at 11:56:27AM +0530, Sai Prakash Ranjan wrote:
> On 2021-02-01 23:50, Jordan Crouse wrote:
> > On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
> > > On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
> > > > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
> > > > > On 2021-01-29 14:35, Will Deacon wrote:
> > > > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > +#define IOMMU_LLC        (1 << 6)
> > > > > >
> > > > > > On reflection, I'm a bit worried about exposing this because I think it
> > > > > > will
> > > > > > introduce a mismatched virtual alias with the CPU (we don't even have a
> > > > > > MAIR
> > > > > > set up for this memory type). Now, we also have that issue for the PTW,
> > > > > > but
> > > > > > since we always use cache maintenance (i.e. the streaming API) for
> > > > > > publishing the page-tables to a non-coheren walker, it works out.
> > > > > > However,
> > > > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
> > > > > > allocation, then they're potentially in for a nasty surprise due to the
> > > > > > mismatched outer-cacheability attributes.
> > > > > >
> > > > >
> > > > > Can't we add the syscached memory type similar to what is done on android?
> > > >
> > > > Maybe. How does the GPU driver map these things on the CPU side?
> > > 
> > > Currently we use writecombine mappings for everything, although there
> > > are some cases that we'd like to use cached (but have not merged
> > > patches that would give userspace a way to flush/invalidate)
> > > 
> > 
> > LLC/system cache doesn't have a relationship with the CPU cache.  Its
> > just a
> > little accelerator that sits on the connection from the GPU to DDR and
> > caches
> > accesses. The hint that Sai is suggesting is used to mark the buffers as
> > 'no-write-allocate' to prevent GPU write operations from being cached in
> > the LLC
> > which a) isn't interesting and b) takes up cache space for read
> > operations.
> > 
> > Its easiest to think of the LLC as a bonus accelerator that has no cost
> > for
> > us to use outside of the unfortunate per buffer hint.
> > 
> > We do have to worry about the CPU cache w.r.t I/O coherency (which is a
> > different hint) and in that case we have all of concerns that Will
> > identified.
> > 
> 
> For mismatched outer cacheability attributes which Will mentioned, I was
> referring to [1] in android kernel.

I've lost track of the conversation here :/

When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also mapped
into the CPU and with what attributes? Rob said "writecombine for
everything" -- does that mean ioremap_wc() / MEMREMAP_WC?

Finally, we need to be careful when we use the word "hint" as "allocation
hint" has a specific meaning in the architecture, and if we only mismatch on
those then we're actually ok. But I think IOMMU_LLC is more than just a
hint, since it actually drives eviction policy (i.e. it enables writeback).

Sorry for the pedantry, but I just want to make sure we're all talking
about the same things!

Cheers,

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
