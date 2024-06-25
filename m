Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36C916629
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 13:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107CD10E626;
	Tue, 25 Jun 2024 11:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vLSaoF5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5457310E62C;
 Tue, 25 Jun 2024 11:27:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B421ECE175D;
 Tue, 25 Jun 2024 11:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8153FC32781;
 Tue, 25 Jun 2024 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719314830;
 bh=zzrLgFHfkFUFx4FQA7l293B59+LWvaKIkSGrLRG/HoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vLSaoF5j3kRrpHLLGQOBjKAy8fabqTMjHscooWo+Cf0qVlm97HWZ4lcUHD2ltKPKr
 kVuMSIOGw7aaRJiXZG4t++d6Lz5tkAkMhuwK1MvbhK5yryIewBLyc2YJiwGWNnMol+
 K0cnvR7u7zNUhuTLY8P7SLGHuq13WRfUCGJyymzVdHfN+0s9MllWZ2HDBmYI/ARd2n
 AV2qttBwbzZGzK5Pl39knyr0JpHaASLq9cOF1NuSWNGwwzNQQWdeowXbIEE7cc0ENz
 q0Jh+K1YcITaJ5Yg3cfKWHqbKIlM+CZ0Yacw8HhAz0aTucwFaE8AoF5RMLSCOUMlHf
 OaNOFFDWlcy5g==
Date: Tue, 25 Jun 2024 12:27:04 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] iommu/io-pgtable-arm: Add way to debug pgtable walk
Message-ID: <20240625112703.GA10175@willie-the-truck>
References: <20240523175227.117984-1-robdclark@gmail.com>
 <20240523175227.117984-2-robdclark@gmail.com>
 <20240624151401.GB8706@willie-the-truck>
 <CAF6AEGttkHPOsO+NSHZeRXiZBxU_26HZyGMjOZ3-Y8NZUgz0gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGttkHPOsO+NSHZeRXiZBxU_26HZyGMjOZ3-Y8NZUgz0gA@mail.gmail.com>
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

On Mon, Jun 24, 2024 at 08:37:26AM -0700, Rob Clark wrote:
> On Mon, Jun 24, 2024 at 8:14 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, May 23, 2024 at 10:52:21AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> > > would be traversed for a given iova access.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/iommu/io-pgtable-arm.c | 51 ++++++++++++++++++++++++++++------
> > >  include/linux/io-pgtable.h     |  4 +++
> > >  2 files changed, 46 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > > index f7828a7aad41..f47a0e64bb35 100644
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -693,17 +693,19 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
> > >                               data->start_level, ptep);
> > >  }
> > >
> > > -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > > -                                      unsigned long iova)
> > > +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
> > > +                     int (*cb)(void *cb_data, void *pte, int level),
> > > +                     void *cb_data)
> > >  {
> > >       struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> > >       arm_lpae_iopte pte, *ptep = data->pgd;
> > >       int lvl = data->start_level;
> > > +     int ret;
> > >
> > >       do {
> > >               /* Valid IOPTE pointer? */
> > >               if (!ptep)
> > > -                     return 0;
> > > +                     return -EFAULT;
> >
> > nit: -ENOENT might be a little better, as we're only checking against a
> > NULL entry rather than strictly any faulting entry.
> >
> > >               /* Grab the IOPTE we're interested in */
> > >               ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> > > @@ -711,22 +713,52 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> > >
> > >               /* Valid entry? */
> > >               if (!pte)
> > > -                     return 0;
> > > +                     return -EFAULT;
> >
> > Same here (and at the end of the function).
> >
> > > +
> > > +             ret = cb(cb_data, &pte, lvl);
> >
> > Since pte is on the stack, rather than pointing into the actual pgtable,
> > I think it would be clearer to pass it by value to the callback.
> 
> fwiw, I passed it as a void* to avoid the pte size.. although I guess
> it could be a union of all the possible pte types

Can you just get away with a u64?

Will
