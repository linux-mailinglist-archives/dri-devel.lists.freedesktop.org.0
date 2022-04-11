Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62254FC380
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 19:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340FF10E04A;
	Mon, 11 Apr 2022 17:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E377810E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 17:34:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 441201570
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 10:34:38 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CF233F73B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 10:34:37 -0700 (PDT)
Date: Mon, 11 Apr 2022 18:34:34 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH] drm/arm/malidp: Stop using iommu_present()
Message-ID: <YlRmqhX7WKv8XQgC@e110455-lin.cambridge.arm.com>
References: <5049994e6c2ba92c2f30d51850c8929136d0f8ca.1649167878.git.robin.murphy@arm.com>
 <20220406092700.t7o7ujk4eqn7ckgr@000377403353>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406092700.t7o7ujk4eqn7ckgr@000377403353>
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
Cc: iommu@lists.linux-foundation.org, nd@arm.com,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 10:27:00AM +0100, Brian Starkey wrote:
> Hi Robin,
> 
> On Tue, Apr 05, 2022 at 03:11:18PM +0100, Robin Murphy wrote:
> > iommu_get_domain_for_dev() is already perfectly happy to return NULL
> > if the given device has no IOMMU. Drop the unnecessary check.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> LGTM, Acked-by: Brian Starkey <brian.starkey@arm.com>
> 
> I'll have to leave it to Liviu to push though.

I have now pushed the patch together with other 3 that have been lingering in my tree.

Best regards,
Liviu

> 
> Thanks,
> -Brian
> 
> > ---
> >  drivers/gpu/drm/arm/malidp_planes.c | 14 +++++---------
> >  1 file changed, 5 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> > index 0562bdaac00c..81d9f5004025 100644
> > --- a/drivers/gpu/drm/arm/malidp_planes.c
> > +++ b/drivers/gpu/drm/arm/malidp_planes.c
> > @@ -310,17 +310,13 @@ static int malidp_se_check_scaling(struct malidp_plane *mp,
> >  
> >  static u32 malidp_get_pgsize_bitmap(struct malidp_plane *mp)
> >  {
> > -	u32 pgsize_bitmap = 0;
> > +	struct iommu_domain *mmu_dom;
> >  
> > -	if (iommu_present(&platform_bus_type)) {
> > -		struct iommu_domain *mmu_dom =
> > -			iommu_get_domain_for_dev(mp->base.dev->dev);
> > +	mmu_dom = iommu_get_domain_for_dev(mp->base.dev->dev);
> > +	if (mmu_dom)
> > +		return mmu_dom->pgsize_bitmap;
> >  
> > -		if (mmu_dom)
> > -			pgsize_bitmap = mmu_dom->pgsize_bitmap;
> > -	}
> > -
> > -	return pgsize_bitmap;
> > +	return 0;
> >  }
> >  
> >  /*
> > -- 
> > 2.28.0.dirty
> > 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
