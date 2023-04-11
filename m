Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C36DDC86
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAAC10E532;
	Tue, 11 Apr 2023 13:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2A910E36D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 13:45:47 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2ef67bbb136so353137f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681220745; x=1683812745;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gX5R1hN0JcwDizHpFIUU3PcOoEbyY5rXcs6PzWDeDeQ=;
 b=kSZel1iKl63iFvuMF0MXh4WBoY2PyrvD8HAbLkAlqQ9pzB9D8VtMCC0L0XxN+B/iD8
 GLXixk/uZ9Glq0uMqVtCryWgOC35knJ1JAvwmbFDX45om6wtJW9+O4IOBpSXqiAU8kcx
 EFJAhc3jr4nulresQnNlL0g5yE0sB8JVKiwaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681220745; x=1683812745;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gX5R1hN0JcwDizHpFIUU3PcOoEbyY5rXcs6PzWDeDeQ=;
 b=dFbxFO4JuD8V0cMhOYcnFLrBeRdmVs30Cc0B9p1+KNKwl6JfEDEv7tHfuozLZEsprC
 ZI04QjKr8I5o8qcJxJk/wbg00nSR/gwWWSwoFnjIX+DhEzcREUpb4FnKd7xvchiVeXv0
 MDCsXKi5PINn9KsiSG9ZCT/HkmSK9V3rAs8APWfp9lABu8aY7yQdfuo81QGARkcZC8SH
 BtXl6OCmG8AagOg1ulozj7c/9UpNjtrfcv4NhjEz+bmhydzD+hsFvcd9Iw2N19wCkjPC
 3Mfqhe6fTcCk3bfKqQrkSZYjj7AsIx5GxjUSD9JylifTlbYzM5eNkcRZESl+Mioul/aZ
 3XmQ==
X-Gm-Message-State: AAQBX9fj9yBPMtteIM5fdlAeh+szxaT1fMEIFvYcfek2QF5NhipXSi10
 KDMIXFA7dUIGL7Oy9s96KuA2mg==
X-Google-Smtp-Source: AKy350Ytdc03uUNrrtHbdb3ZTObEe+fNHpCvP4qyE2i51MuL564MBb3IWbsdn1t+S+FbvE92n9/VEw==
X-Received: by 2002:a05:6000:1050:b0:2f0:843:fc0d with SMTP id
 c16-20020a056000105000b002f00843fc0dmr4211011wrx.5.1681220745272; 
 Tue, 11 Apr 2023 06:45:45 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l1-20020adfe581000000b002f22c44e974sm4808680wrm.102.2023.04.11.06.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 06:45:44 -0700 (PDT)
Date: Tue, 11 Apr 2023 15:45:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH RESEND v3 2/3] drm/ttm: Reduce the number of used
 allocation orders for TTM pages
Message-ID: <ZDVkhtx1/uToLM5R@phenom.ffwll.local>
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
 <20230404200650.11043-3-thomas.hellstrom@linux.intel.com>
 <ZDUtqsNtXcU4W3O6@phenom.ffwll.local>
 <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33b145f1-fce5-95f1-357d-dda128e3548d@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 02:11:18PM +0200, Christian König wrote:
> Am 11.04.23 um 11:51 schrieb Daniel Vetter:
> > On Tue, Apr 04, 2023 at 10:06:49PM +0200, Thomas Hellström wrote:
> > > When swapping out, we will split multi-order pages both in order to
> > > move them to the swap-cache and to be able to return memory to the
> > > swap cache as soon as possible on a page-by-page basis.
> > > Reduce the page max order to the system PMD size, as we can then be nicer
> > > to the system and avoid splitting gigantic pages.
> > > 
> > > Looking forward to when we might be able to swap out PMD size folios
> > > without splitting, this will also be a benefit.
> > > 
> > > v2:
> > > - Include all orders up to the PMD size (Christian König)
> > > v3:
> > > - Avoid compilation errors for architectures with special PFN_SHIFTs
> > > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Apparently this fails on ppc build testing. Please supply build fix asap
> > (or I guess we need to revert). I'm kinda not clear why this only showed
> > up when I merged the drm-misc-next pr into drm-next ...
> 
> I'm really wondering this as well. It looks like PMD_SHIFT isn't a constant
> on this particular platform.
> 
> But from what I can find in the upstream 6.2 kernel PMD_SHIFT always seems
> to be a constant.
> 
> So how exactly can that here break?

There's some in-flight patches to rework MAX_ORDER and other things in
linux-next, maybe it's recent? If you check out linux-next then you need
to reapply the patch (since sfr reverted it).
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_pool.c | 30 +++++++++++++++++++-----------
> > >   1 file changed, 19 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index dfce896c4bae..18c342a919a2 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -47,6 +47,11 @@
> > >   #include "ttm_module.h"
> > > +#define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
> > > +#define __TTM_DIM_ORDER (TTM_MAX_ORDER + 1)
> > > +/* Some architectures have a weird PMD_SHIFT */
> > > +#define TTM_DIM_ORDER (__TTM_DIM_ORDER <= MAX_ORDER ? __TTM_DIM_ORDER : MAX_ORDER)
> > > +
> > >   /**
> > >    * struct ttm_pool_dma - Helper object for coherent DMA mappings
> > >    *
> > > @@ -65,11 +70,11 @@ module_param(page_pool_size, ulong, 0644);
> > >   static atomic_long_t allocated_pages;
> > > -static struct ttm_pool_type global_write_combined[MAX_ORDER];
> > > -static struct ttm_pool_type global_uncached[MAX_ORDER];
> > > +static struct ttm_pool_type global_write_combined[TTM_DIM_ORDER];
> > > +static struct ttm_pool_type global_uncached[TTM_DIM_ORDER];
> > > -static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
> > > -static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
> > > +static struct ttm_pool_type global_dma32_write_combined[TTM_DIM_ORDER];
> > > +static struct ttm_pool_type global_dma32_uncached[TTM_DIM_ORDER];
> > >   static spinlock_t shrinker_lock;
> > >   static struct list_head shrinker_list;
> > > @@ -444,7 +449,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> > >   	else
> > >   		gfp_flags |= GFP_HIGHUSER;
> > > -	for (order = min_t(unsigned int, MAX_ORDER - 1, __fls(num_pages));
> > > +	for (order = min_t(unsigned int, TTM_MAX_ORDER, __fls(num_pages));
> > >   	     num_pages;
> > >   	     order = min_t(unsigned int, order, __fls(num_pages))) {
> > >   		struct ttm_pool_type *pt;
> > > @@ -563,7 +568,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> > >   	if (use_dma_alloc) {
> > >   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > -			for (j = 0; j < MAX_ORDER; ++j)
> > > +			for (j = 0; j < TTM_DIM_ORDER; ++j)
> > >   				ttm_pool_type_init(&pool->caching[i].orders[j],
> > >   						   pool, i, j);
> > >   	}
> > > @@ -583,7 +588,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
> > >   	if (pool->use_dma_alloc) {
> > >   		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
> > > -			for (j = 0; j < MAX_ORDER; ++j)
> > > +			for (j = 0; j < TTM_DIM_ORDER; ++j)
> > >   				ttm_pool_type_fini(&pool->caching[i].orders[j]);
> > >   	}
> > > @@ -637,7 +642,7 @@ static void ttm_pool_debugfs_header(struct seq_file *m)
> > >   	unsigned int i;
> > >   	seq_puts(m, "\t ");
> > > -	for (i = 0; i < MAX_ORDER; ++i)
> > > +	for (i = 0; i < TTM_DIM_ORDER; ++i)
> > >   		seq_printf(m, " ---%2u---", i);
> > >   	seq_puts(m, "\n");
> > >   }
> > > @@ -648,7 +653,7 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
> > >   {
> > >   	unsigned int i;
> > > -	for (i = 0; i < MAX_ORDER; ++i)
> > > +	for (i = 0; i < TTM_DIM_ORDER; ++i)
> > >   		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
> > >   	seq_puts(m, "\n");
> > >   }
> > > @@ -751,13 +756,16 @@ int ttm_pool_mgr_init(unsigned long num_pages)
> > >   {
> > >   	unsigned int i;
> > > +	BUILD_BUG_ON(TTM_DIM_ORDER > MAX_ORDER);
> > > +	BUILD_BUG_ON(TTM_DIM_ORDER < 1);
> > > +
> > >   	if (!page_pool_size)
> > >   		page_pool_size = num_pages;
> > >   	spin_lock_init(&shrinker_lock);
> > >   	INIT_LIST_HEAD(&shrinker_list);
> > > -	for (i = 0; i < MAX_ORDER; ++i) {
> > > +	for (i = 0; i < TTM_DIM_ORDER; ++i) {
> > >   		ttm_pool_type_init(&global_write_combined[i], NULL,
> > >   				   ttm_write_combined, i);
> > >   		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
> > > @@ -790,7 +798,7 @@ void ttm_pool_mgr_fini(void)
> > >   {
> > >   	unsigned int i;
> > > -	for (i = 0; i < MAX_ORDER; ++i) {
> > > +	for (i = 0; i < TTM_DIM_ORDER; ++i) {
> > >   		ttm_pool_type_fini(&global_write_combined[i]);
> > >   		ttm_pool_type_fini(&global_uncached[i]);
> > > -- 
> > > 2.39.2
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
