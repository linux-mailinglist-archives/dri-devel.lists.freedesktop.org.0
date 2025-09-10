Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E5B5174A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 14:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4DF10E0E7;
	Wed, 10 Sep 2025 12:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ll8SGZQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2C110E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 12:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vHa0D6e5fm4HCttM7/wCRJl6kL0YvpXLTJm/65qzJVc=; b=Ll8SGZQ4AYXN0DJB5L0ClmVOLH
 FIFet8WD5kFiiD7TdJ+ugeeIHvtY23PzxjTYAtSQQ4JYLmWdRlk4PCnKPMPf72B7QejJYqgzveU1o
 1smsZeNU6RG3mJ5buct1aP0Go/MPRxhMLUag5t+OEXFU2ebrrHsRZHOaXvvQ87r8cgX4Geuh2CoOa
 qbN5gcxdVSkTus2y12reb3FzbzwelBP2CQ9oNrkyD8IGgaXVD0KPZKSlx51wTX831gebAYb1nXEqj
 9MEKrMaiuoZajyHYGHEOqrwrzzaOXvsvS2/Am/vcaNHlleHf74wMeeEZqiDg3Yi0crwNd4a59gAq2
 /JnjjAtg==;
Received: from 179-125-86-100-dinamico.pombonet.net.br ([179.125.86.100]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uwKJA-009OZO-Aw; Wed, 10 Sep 2025 14:52:21 +0200
Date: Wed, 10 Sep 2025 09:52:13 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] drm: ttm: do not direct reclaim when allocating high
 order pages
Message-ID: <aMF0fe7CIVD-8zVo@quatroqueijos.cascardo.eti.br>
References: <20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com>
 <e79a134b-89de-4da1-b64b-b890227fce8a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e79a134b-89de-4da1-b64b-b890227fce8a@amd.com>
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

On Wed, Sep 10, 2025 at 02:11:58PM +0200, Christian König wrote:
> On 10.09.25 13:59, Thadeu Lima de Souza Cascardo wrote:
> > When the TTM pool tries to allocate new pages, it stats with max order. If
> > there are no pages ready in the system, the page allocator will start
> > reclaim. If direct reclaim fails, the allocator will reduce the order until
> > it gets all the pages it wants with whatever order the allocator succeeds
> > to reclaim.
> > 
> > However, while the allocator is reclaiming, lower order pages might be
> > available, which would work just fine for the pool allocator. Doing direct
> > reclaim just introduces latency in allocating memory.
> > 
> > The system should still start reclaiming in the background with kswapd, but
> > the pool allocator should try to allocate a lower order page instead of
> > directly reclaiming.
> > 
> > If not even a order-1 page is available, the TTM pool allocator will
> > eventually get to start allocating order-0 pages, at which point it should
> > and will directly reclaim.
> 
> Yeah that was discussed before quite a bit but at least for AMD GPUs that is absolutely not something we should do.
> 
> The performance difference between using high and low order pages can be up to 30%. So the added extra latency is just vital for good performance.
> 
> We could of course make that depend on the HW you use if it isn't necessary for some other GPU, but at least both NVidia and Intel seem to have pretty much the same HW restrictions.
> 
> NVidia has been working on extending this to even use 1GiB pages to reduce the TLB overhead even further.
> 
> Regards,
> Christian.
> 

But if the system cannot reclaim or is working hard on reclaiming, it will
not allocate that page and the pool allocator will resort to lower order
pages anyway.

In case the system has pages available, it will use them. I think there is
a balance here and I find this one is reasonable. If the system is not
under pressure, it will allocate those higher order pages, as expected.

I can look into the behavior when the system might be fragmented, but I
still believe that the pool is offering such a protection by keeping those
higher order pages around. It is when the system is under memory presure
that we need to resort to lower order pages.

What we are seeing here is on a low memory (4GiB) single node system with
an APU, that it will have lots of latencies trying to allocate memory by
doing direct reclaim trying to allocate order-10 pages, which will fail and
down it goes until it gets to order-4 or order-3. With this change, we
don't see those latencies anymore and memory pressure goes down as well.

Cascardo.

> 
> > 
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_pool.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> > index baf27c70a4193a121fbc8b4e67cd6feb4c612b85..6124a53cd15634c833bce379093b557d2a2660fd 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -144,9 +144,11 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> >  	 * Mapping pages directly into an userspace process and calling
> >  	 * put_page() on a TTM allocated page is illegal.
> >  	 */
> > -	if (order)
> > +	if (order) {
> >  		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
> >  			__GFP_THISNODE;
> > +		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
> > +	}
> >  
> >  	if (!pool->use_dma_alloc) {
> >  		p = alloc_pages_node(pool->nid, gfp_flags, order);
> > 
> > ---
> > base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
> > change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
> > 
> > Best regards,
> 
