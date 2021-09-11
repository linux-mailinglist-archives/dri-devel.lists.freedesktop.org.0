Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE240754A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 08:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E4F6EB51;
	Sat, 11 Sep 2021 06:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCBA6EB4F;
 Sat, 11 Sep 2021 06:07:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="218074509"
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="218074509"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 23:07:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,284,1624345200"; d="scan'208";a="549965074"
Received: from dmescala-mobl3.amr.corp.intel.com (HELO [10.249.254.79])
 ([10.249.254.79])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 23:07:10 -0700
Message-ID: <5ea3f498cc5ae84fa6aeba97a64e4eb8ab32e02b.camel@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Add a private member to the struct
 ttm_resource
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com, Matthew Auld
 <matthew.william.auld@gmail.com>
Date: Sat, 11 Sep 2021 08:07:08 +0200
In-Reply-To: <c8484b51-4365-bedd-be73-4c0898ac70b1@amd.com>
References: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
 <d7570cab-d402-761d-40e0-3d08d9b9d3c9@amd.com>
 <a1a8fd3f1ca13b84192bd3c8719f510e5b655b2c.camel@linux.intel.com>
 <c8484b51-4365-bedd-be73-4c0898ac70b1@amd.com>
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

On Fri, 2021-09-10 at 19:03 +0200, Christian König wrote:
> Am 10.09.21 um 17:30 schrieb Thomas Hellström:
> > On Fri, 2021-09-10 at 16:40 +0200, Christian König wrote:
> > > 
> > > Am 10.09.21 um 15:15 schrieb Thomas Hellström:
> > > > Both the provider (resource manager) and the consumer (the TTM
> > > > driver)
> > > > want to subclass struct ttm_resource. Since this is left for
> > > > the
> > > > resource
> > > > manager, we need to provide a private pointer for the TTM
> > > > driver.
> > > > 
> > > > Provide a struct ttm_resource_private for the driver to
> > > > subclass
> > > > for
> > > > data with the same lifetime as the struct ttm_resource: In the
> > > > i915
> > > > case
> > > > it will, for example, be an sg-table and radix tree into the
> > > > LMEM
> > > > /VRAM pages that currently are awkwardly attached to the GEM
> > > > object.
> > > > 
> > > > Provide an ops structure for associated ops (Which is only
> > > > destroy() ATM)
> > > > It might seem pointless to provide a separate ops structure,
> > > > but
> > > > Linus
> > > > has previously made it clear that that's the norm.
> > > > 
> > > > After careful audit one could perhaps also on a per-driver
> > > > basis
> > > > replace the delete_mem_notify() TTM driver callback with the
> > > > above
> > > > destroy function.
> > > Well this is a really big NAK to this approach.
> > > 
> > > If you need to attach some additional information to the resource
> > > then
> > > implement your own resource manager like everybody else does.
> > Well this was the long discussion we had back then when the
> > resource
> > mangagers started to derive from struct resource and I was under
> > the
> > impression that we had come to an agreement about the different
> > use-
> > cases here, and this was my main concern.
> 
> Ok, then we somehow didn't understood each other.
> 
> > I mean, it's a pretty big layer violation to do that for this use-
> > case.
> 
> Well exactly that's the point. TTM should not have a layer design in
> the 
> first place.
> 
> Devices, BOs, resources etc.. are base classes which should implement
> a 
> base functionality which is then extended by the drivers to implement
> the driver specific functionality.
> 
> That is a component based approach, and not layered at all.
> 
> > The TTM resource manager doesn't want to know about this data at
> > all,
> > it's private to the ttm resource user layer and the resource
> > manager
> > works perfectly well without it. (I assume the other drivers that
> > implement their own resource managers need the data that the
> > subclassing provides?)
> 
> Yes, that's exactly why we have the subclassing.
> 
> > The fundamental problem here is that there are two layers wanting
> > to
> > subclass struct ttm_resource. That means one layer gets to do that,
> > the
> > second gets to use a private pointer, (which in turn can provide
> > yet
> > another private pointer to a potential third layer). With your
> > suggestion, the second layer instead is forced to subclass each
> > subclassed instance it uses from  the first layer provides?
> 
> Well completely drop the layer approach/thinking here.
> 
> The resource is an object with a base class. The base class
> implements 
> the interface TTM needs to handle the object, e.g.
> create/destroy/debug 
> etc...
> 
> Then we need to subclass this object because without any additional 
> information the object is pretty pointless.
> 
> One possibility for this is to use the range manager to implement 
> something drm_mm based. BTW: We should probably rename that to
> something 
> like ttm_res_drm_mm or similar.

Sure I'm all in on that, but my point is this becomes pretty awkward
because the reusable code already subclasses struct ttm_resource. Let
me give you an example:

Prereqs:
1) We want to be able to re-use resource manager implementations among
drivers.
2) A driver might want to re-use multiple implementations and have
identical data "struct i915_data" attached to both

With your suggestion that combination of prereqs would look like:

struct i915_resource {
	/* Reason why we subclass */
	struct i915_data my_data;

	/* 
         * Uh this is awkward. We need to do this because these       
         * already subclassed struct ttm_resource.
         */
	struct ttm_resource *resource;
	union {
		struct ttm_range_mgr_node range;
		struct i915_ttm_buddy_resource buddy;
        };
};

And I can't make it look like

struct i915_resource {
	struct i915_data my_data;
	struct ttm_resource *resource;
}

Without that private back pointer.
 
But what I'd *really* would want is.

struct i915_resource {
	struct i915_data my_data;
	struct ttm_resource resource;
};

This would be identical to how we subclass a struct ttm_buffer_object
or a struct ttm_tt. But It can't look like this because then we can't
reuse exising implementations that *already subclass* struct
ttm_resource.

What we have currently ttm_resource-wise is like having a struct
tt_bo_vram, a struct ttm_bo_system, a struct ttm_bo_gtt and trying to
subclass them all combined into a struct i915_bo. It would become
awkward without a dynamic backend that facilitates subclassing a single
struct ttm_buffer_object? 

So basically the question boils down to: Why do we do struct
ttm_resources differently?


> 
> What we should avoid is to abuse TTM resource interfaces in the
> driver, 
> e.g. what i915 is currently doing. This is a TTM->resource mgr
> interface 
> and should not be used by drivers at all.

Yes I guess that can be easily fixed when whatever we end up with above
lands.

> 
> > Ofc we can do that, but it does indeed feel pretty awkward.
> > 
> > In any case, if you still think that's the approach we should go
> > for,
> > I'd need to add init() and fini() members to the
> > ttm_range_manager_func
> > struct to allow subclassing without having to unnecessarily copy
> > the
> > full code?
> 
> Yes, exporting the ttm_range_manager functions as needed is one thing
> I 
> wanted to do for the amdgpu_gtt_mgr.c code as well.
> 
> Just don't extend the function table but rather directly export the 
> necessary functions.

Sure.
/Thomas


