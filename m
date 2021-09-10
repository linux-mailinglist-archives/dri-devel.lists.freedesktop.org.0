Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED8406E30
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 17:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2254B6EA1C;
	Fri, 10 Sep 2021 15:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C826EA1A;
 Fri, 10 Sep 2021 15:30:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="243422129"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="243422129"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 08:30:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="432290426"
Received: from gjanssen-mobl5.ger.corp.intel.com (HELO [10.249.254.69])
 ([10.249.254.69])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 08:30:51 -0700
Message-ID: <a1a8fd3f1ca13b84192bd3c8719f510e5b655b2c.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Add a private member to the struct
 ttm_resource
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com, Matthew Auld
 <matthew.william.auld@gmail.com>
Date: Fri, 10 Sep 2021 17:30:49 +0200
In-Reply-To: <d7570cab-d402-761d-40e0-3d08d9b9d3c9@amd.com>
References: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
 <d7570cab-d402-761d-40e0-3d08d9b9d3c9@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2021-09-10 at 16:40 +0200, Christian König wrote:
> 
> 
> Am 10.09.21 um 15:15 schrieb Thomas Hellström:
> > Both the provider (resource manager) and the consumer (the TTM
> > driver)
> > want to subclass struct ttm_resource. Since this is left for the
> > resource
> > manager, we need to provide a private pointer for the TTM driver.
> > 
> > Provide a struct ttm_resource_private for the driver to subclass
> > for
> > data with the same lifetime as the struct ttm_resource: In the i915
> > case
> > it will, for example, be an sg-table and radix tree into the LMEM
> > /VRAM pages that currently are awkwardly attached to the GEM
> > object.
> > 
> > Provide an ops structure for associated ops (Which is only
> > destroy() ATM)
> > It might seem pointless to provide a separate ops structure, but
> > Linus
> > has previously made it clear that that's the norm.
> > 
> > After careful audit one could perhaps also on a per-driver basis
> > replace the delete_mem_notify() TTM driver callback with the above
> > destroy function.
> 
> Well this is a really big NAK to this approach.
> 
> If you need to attach some additional information to the resource
> then 
> implement your own resource manager like everybody else does.

Well this was the long discussion we had back then when the resource
mangagers started to derive from struct resource and I was under the
impression that we had come to an agreement about the different use-
cases here, and this was my main concern.

I mean, it's a pretty big layer violation to do that for this use-case.
The TTM resource manager doesn't want to know about this data at all,
it's private to the ttm resource user layer and the resource manager
works perfectly well without it. (I assume the other drivers that
implement their own resource managers need the data that the
subclassing provides?)

The fundamental problem here is that there are two layers wanting to
subclass struct ttm_resource. That means one layer gets to do that, the
second gets to use a private pointer, (which in turn can provide yet
another private pointer to a potential third layer). With your
suggestion, the second layer instead is forced to subclass each
subclassed instance it uses from  the first layer provides?

Ofc we can do that, but it does indeed feel pretty awkward.

In any case, if you still think that's the approach we should go for,
I'd need to add init() and fini() members to the ttm_range_manager_func
struct to allow subclassing without having to unnecessarily copy the
full code? 

Thanks,
Thomas










> 
> Regards,
> Christian.
> 
> > 
> > Cc: Matthew Auld <matthew.william.auld@gmail.com>
> > Cc: König Christian <Christian.Koenig@amd.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_resource.c | 10 +++++++---
> >   include/drm/ttm/ttm_resource.h     | 28
> > ++++++++++++++++++++++++++++
> >   2 files changed, 35 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > b/drivers/gpu/drm/ttm/ttm_resource.c
> > index 2431717376e7..973e7c50bfed 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -57,13 +57,17 @@ int ttm_resource_alloc(struct ttm_buffer_object
> > *bo,
> >   void ttm_resource_free(struct ttm_buffer_object *bo, struct
> > ttm_resource **res)
> >   {
> >         struct ttm_resource_manager *man;
> > +       struct ttm_resource *resource = *res;
> >   
> > -       if (!*res)
> > +       if (!resource)
> >                 return;
> >   
> > -       man = ttm_manager_type(bo->bdev, (*res)->mem_type);
> > -       man->func->free(man, *res);
> >         *res = NULL;
> > +       if (resource->priv)
> > +               resource->priv->ops.destroy(resource->priv);
> > +
> > +       man = ttm_manager_type(bo->bdev, resource->mem_type);
> > +       man->func->free(man, resource);
> >   }
> >   EXPORT_SYMBOL(ttm_resource_free);
> >   
> > diff --git a/include/drm/ttm/ttm_resource.h
> > b/include/drm/ttm/ttm_resource.h
> > index 140b6b9a8bbe..5a22c9a29c05 100644
> > --- a/include/drm/ttm/ttm_resource.h
> > +++ b/include/drm/ttm/ttm_resource.h
> > @@ -44,6 +44,7 @@ struct dma_buf_map;
> >   struct io_mapping;
> >   struct sg_table;
> >   struct scatterlist;
> > +struct ttm_resource_private;
> >   
> >   struct ttm_resource_manager_func {
> >         /**
> > @@ -153,6 +154,32 @@ struct ttm_bus_placement {
> >         enum ttm_caching        caching;
> >   };
> >   
> > +/**
> > + * struct ttm_resource_private_ops - Operations for a struct
> > + * ttm_resource_private
> > + *
> > + * Not much benefit to keep this as a separate struct with only a
> > single member,
> > + * but keeping a separate ops struct is the norm.
> > + */
> > +struct ttm_resource_private_ops {
> > +       /**
> > +        * destroy() - Callback to destroy the private data
> > +        * @priv - The private data to destroy
> > +        */
> > +       void (*destroy) (struct ttm_resource_private *priv);
> > +};
> > +
> > +/**
> > + * struct ttm_resource_private - TTM driver private data
> > + * @ops: Pointer to struct ttm_resource_private_ops with
> > associated operations
> > + *
> > + * Intended to be subclassed to hold, for example cached data
> > sharing the
> > + * lifetime with a struct ttm_resource.
> > + */
> > +struct ttm_resource_private {
> > +       const struct ttm_resource_private_ops ops;
> > +};
> > +
> >   /**
> >    * struct ttm_resource
> >    *
> > @@ -171,6 +198,7 @@ struct ttm_resource {
> >         uint32_t mem_type;
> >         uint32_t placement;
> >         struct ttm_bus_placement bus;
> > +       struct ttm_resource_private *priv;
> >   };
> >   
> >   /**
> 


