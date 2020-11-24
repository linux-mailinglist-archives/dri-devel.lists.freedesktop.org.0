Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3892C23E1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 12:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685706E22C;
	Tue, 24 Nov 2020 11:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A126E226;
 Tue, 24 Nov 2020 11:10:34 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E99E52073C;
 Tue, 24 Nov 2020 11:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606216234;
 bh=2uK6gknCKN4AYaBsRSYNpCUpw9VdB72lt/njxbxA6GA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2t4y8oN8c0g38vhBQq66MuAcmgMMFWcHRYuxyuRtuX8qaVsF+C1CKqA9RJfInMj1
 qZff1xDjS64XFMDr0/sXiHg0S+ie8s1dELjmSWS9eDscf4ptO9IGUHDT3JkTNVJlbk
 uKw/lXPS1M5h4yLJHyV+JPEHYysKkMbXjwvEYBvU=
Date: Tue, 24 Nov 2020 11:10:28 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
Message-ID: <20201124111027.GA13151@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
 <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
 <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
 <1c665e33d1d27263fb5056c16d30b827@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c665e33d1d27263fb5056c16d30b827@codeaurora.org>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, "list@263.net:IOMMU DRIVERS ,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 09:32:54AM +0530, Sai Prakash Ranjan wrote:
> On 2020-11-24 00:52, Rob Clark wrote:
> > On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> > > 
> > > On 2020-11-23 20:51, Will Deacon wrote:
> > > > On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
> > > >> Some hardware variants contain a system cache or the last level
> > > >> cache(llc). This cache is typically a large block which is shared
> > > >> by multiple clients on the SOC. GPU uses the system cache to cache
> > > >> both the GPU data buffers(like textures) as well the SMMU pagetables.
> > > >> This helps with improved render performance as well as lower power
> > > >> consumption by reducing the bus traffic to the system memory.
> > > >>
> > > >> The system cache architecture allows the cache to be split into slices
> > > >> which then be used by multiple SOC clients. This patch series is an
> > > >> effort to enable and use two of those slices preallocated for the GPU,
> > > >> one for the GPU data buffers and another for the GPU SMMU hardware
> > > >> pagetables.
> > > >>
> > > >> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
> > > >> Patch 7 and 8 are minor cleanups for arm-smmu impl.
> > > >>
> > > >> Changes in v8:
> > > >>  * Introduce a generic domain attribute for pagetable config (Will)
> > > >>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
> > > >>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config
> > > >> (Will)
> > > >
> > > > Modulo some minor comments I've made, this looks good to me. What is
> > > > the
> > > > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
> > > > the
> > > > MSM GPU driver and I'd like to avoid conflicts with that.
> > > >
> > > 
> > > SMMU bits are pretty much independent and GPU relies on the domain
> > > attribute
> > > and the quirk exposed, so as long as SMMU changes go in first it
> > > should
> > > be good.
> > > Rob?
> > 
> > I suppose one option would be to split out the patch that adds the
> > attribute into it's own patch, and merge that both thru drm and iommu?
> > 
> 
> Ok I can split out domain attr and quirk into its own patch if Will is
> fine with that approach.

Why don't I just queue the first two patches on their own branch and we
both pull that?

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
