Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D621FABD6D5
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 13:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DD210E534;
	Tue, 20 May 2025 11:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ofdYLbVw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D3510E4E5;
 Tue, 20 May 2025 11:31:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 483AF5C4A0E;
 Tue, 20 May 2025 11:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9268CC4CEEB;
 Tue, 20 May 2025 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747740713;
 bh=CvDybhlQLGgsaauWyvnvy0fUfy35kQUTWzKrr9rQm+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofdYLbVw9naWOMB+EzGo9kBZvwW4kLEAFulhRj7U1+SNOP7XzubmjaDjq3xXD81HE
 asVMbkGWrhZ02beHdrEgtHSSE9HSvsdrEJbtnnivmJKg77MuwnIMOFtxW0CgeSVNmf
 EqKNtxziB0IwrCIK/8elCyKsALdB9DCl+ciWml5O6Uh2Dm1ucCGNJVn2++eMOpAQLr
 yJeOi8layAs/ZP0wKWsmnlJiJS9PTXienZtRWaYPw2Whbu1eOKsSbLKLE69kPDiTZi
 DBZexSPA57nr7OzlVuH3WE/qc0XzVc3H6bg35HEBDqxL3dGvQ+qZhssW/A47l2JlYh
 DhtXNITYVLfkw==
Date: Tue, 20 May 2025 12:31:47 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/40] iommu/io-pgtable-arm: Add quirk to quiet
 WARN_ON()
Message-ID: <20250520113146.GA18435@willie-the-truck>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-6-robdclark@gmail.com>
 <20250515143309.GA12165@willie-the-truck>
 <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsnOD8fZmTXAEZZNrdK-NXdUJF51s51EhYQ6Ed7dCFM0A@mail.gmail.com>
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

On Thu, May 15, 2025 at 07:48:39AM -0700, Rob Clark wrote:
> On Thu, May 15, 2025 at 7:33 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, May 14, 2025 at 10:53:19AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > In situations where mapping/unmapping sequence can be controlled by
> > > userspace, attempting to map over a region that has not yet been
> > > unmapped is an error.  But not something that should spam dmesg.
> > >
> > > Now that there is a quirk, we can also drop the selftest_running
> > > flag, and use the quirk instead for selftests.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Acked-by: Robin Murphy <robin.murphy@arm.com>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/iommu/io-pgtable-arm.c | 27 ++++++++++++++-------------
> > >  include/linux/io-pgtable.h     |  8 ++++++++
> > >  2 files changed, 22 insertions(+), 13 deletions(-)
> >
> > [...]
> >
> > > diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> > > index bba2a51c87d2..639b8f4fb87d 100644
> > > --- a/include/linux/io-pgtable.h
> > > +++ b/include/linux/io-pgtable.h
> > > @@ -88,6 +88,13 @@ struct io_pgtable_cfg {
> > >        *
> > >        * IO_PGTABLE_QUIRK_ARM_HD: Enables dirty tracking in stage 1 pagetable.
> > >        * IO_PGTABLE_QUIRK_ARM_S2FWB: Use the FWB format for the MemAttrs bits
> > > +      *
> > > +      * IO_PGTABLE_QUIRK_NO_WARN_ON: Do not WARN_ON() on conflicting
> > > +      *      mappings, but silently return -EEXISTS.  Normally an attempt
> > > +      *      to map over an existing mapping would indicate some sort of
> > > +      *      kernel bug, which would justify the WARN_ON().  But for GPU
> > > +      *      drivers, this could be under control of userspace.  Which
> > > +      *      deserves an error return, but not to spam dmesg.
> > >        */
> > >       #define IO_PGTABLE_QUIRK_ARM_NS                 BIT(0)
> > >       #define IO_PGTABLE_QUIRK_NO_PERMS               BIT(1)
> > > @@ -97,6 +104,7 @@ struct io_pgtable_cfg {
> > >       #define IO_PGTABLE_QUIRK_ARM_OUTER_WBWA         BIT(6)
> > >       #define IO_PGTABLE_QUIRK_ARM_HD                 BIT(7)
> > >       #define IO_PGTABLE_QUIRK_ARM_S2FWB              BIT(8)
> > > +     #define IO_PGTABLE_QUIRK_NO_WARN_ON             BIT(9)
> >
> > This feels a bit fragile to me:
> >   * IOMMU-API users of io-pgtable shouldn't be passing this quirk
> >     but might end up doing so to paper over driver bugs.
> >
> >   * Low-level users of io-pgtable who expose page-table operations to
> >     userspace need to pass the quirk, but might well not bother because
> >     well-behaved userspace doesn't trigger the warning.
> >
> > So overall, it's all a bit unsatisfactory. Is there a way we could have
> > the warnings only when invoked via the IOMMU API?
> 
> iommu drivers _not_ setting this flag seems like a good way to achieve that ;-)
> 
> The alternative is to move the warns to the iommu driver... but they
> could just as easily remove the WARN_ON()s as they could set the
> NO_WARN_ON quirk, so :shrug:?

Bah, I also don't have a good idea to improve this, so I guess I'll take
what you have for now.

Will
