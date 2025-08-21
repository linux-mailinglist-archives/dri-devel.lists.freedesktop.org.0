Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41907B2F7F9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1135A10E96A;
	Thu, 21 Aug 2025 12:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bvIsxVXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C25010E962;
 Thu, 21 Aug 2025 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755779392;
 bh=ijlb5esqaLBXf0mALq1QvcDz562IVmpFjpHLeOxS04A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bvIsxVXDCBsn2Z1qyYYvRXjkxTtpvHYKqzHyZZPnWRZX9coT5rj1CjMzo6balyWZH
 OM4rM/Xj0uDrHauJIhlsnMAuWivpuSA5ShIa3k9DXdsaZaDVf2x+feMIYF8rqMiMy1
 ePhXELqiWF0VNnpOUTmRSPVbNIuu/LvOTsaS4KGSgYMAcOS2sE8FdwJZm1HvKufRce
 kg8SUX2Zz5LAX1QDoX5aLyOjeVCGwOXLoX0TirgdkzFV6CPBDFlxOiVw4MccVMeYKI
 8d2uwFTx9pJkSWQ8jxOLS3k3urwNq82wUQxzGwWajNQvs8clBOZ5wAQSIEkDjm83hM
 lbmnFqHmBiFrg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D298417E0154;
 Thu, 21 Aug 2025 14:29:51 +0200 (CEST)
Date: Thu, 21 Aug 2025 14:29:46 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Caterina Shablia" <caterina.shablia@collabora.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Binns"
 <frank.binns@imgtec.com>, "Matt Coster" <matt.coster@imgtec.com>, "Karol
 Herbst" <kherbst@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Steven
 Price" <steven.price@arm.com>, "Liviu Dudau" <liviu.dudau@arm.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <asahi@lists.linux.dev>, "Asahi Lina"
 <lina@asahilina.net>, "Asahi Lina" <lina+kernel@asahilina.net>
Subject: Re: [PATCH v4 6/7] drm/gpuvm: Add DRM_GPUVA_REPEAT flag and logic
Message-ID: <20250821142946.00110c49@fedora>
In-Reply-To: <DB62O8GQ2Y1C.11UY1XZV8OE3Q@kernel.org>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-7-caterina.shablia@collabora.com>
 <DB62O8GQ2Y1C.11UY1XZV8OE3Q@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 07 Jul 2025 21:33:13 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Jul 7, 2025 at 7:04 PM CEST, Caterina Shablia wrote:
> > From: Asahi Lina <lina+kernel@asahilina.net>
> >
> > To be able to support "fake sparse" mappings without relying on GPU page
> > fault handling, drivers may need to create large (e.g. 4GiB) mappings of
> > the same page repeatedly (or same range of pages). Doing this through
> > individual mappings would be very wasteful. This can be handled better
> > by using a flag on map creation, but to do it safely, drm_gpuvm needs to
> > be aware of this special case.
> >
> > Add a flag that signals that a given mapping is a page mapping, which is
> > repeated all over the entire requested VA range. This tweaks the
> > sm_map() logic to treat the GEM offsets differently when mappings are
> > a repeated ones so they are not incremented as they would be with regular
> > mappings.
> >
> > The size of the GEM portion to repeat is passed through
> > drm_gpuva::gem::range. Most of the time it will be a page size, but
> > it can be bigger as long as it's less that drm_gpuva::va::range, and
> > drm_gpuva::gem::range is a multiple of drm_gpuva::va::range.  
> 
> Should be "as long as it's less that drm_gpuva::va::range, and
> drm_gpuva::va::range is a multiple of  drm_gpuva::gem::range".
> 
> I also think this feature deserves its own section in the global GPUVM
> documentation -- please add a corresponding paragraph.

Sure.

> 
> > +static int check_map_req(struct drm_gpuvm *gpuvm,  
> 
> Let's call this validate_map_request().

I can do that, sure.

> 
> > +			 const struct drm_gpuvm_map_req *req)
> > +{
> > +	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
> > +		return -EINVAL;
> > +
> > +	if (req->flags & DRM_GPUVA_REPEAT) {
> > +		u64 va_range = req->va.range;
> > +
> > +		/* For a repeated mapping, GEM range must be > 0
> > +		 * and a multiple of the VA range.
> > +		 */
> > +		if (unlikely(!req->gem.range ||
> > +			     va_range < req->gem.range ||
> > +			     do_div(va_range, req->gem.range)))
> > +			return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int
> >  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  		   const struct drm_gpuvm_ops *ops, void *priv,
> > @@ -2137,6 +2179,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  	struct drm_gpuva reqva = {
> >  		.va.addr = req->va.addr,
> >  		.va.range = req->va.range,
> > +		.gem.range = req->gem.range,
> >  		.gem.offset = req->gem.offset,
> >  		.gem.obj = req->gem.obj,
> >  		.flags = req->flags,
> > @@ -2144,7 +2187,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  	u64 req_end = req->va.addr + req->va.range;
> >  	int ret;
> >  
> > -	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req->va.addr, req->va.range)))
> > +	ret = check_map_req(gpuvm, req);
> > +	if (unlikely(ret))
> >  		return -EINVAL;
> >  
> >  	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req->va.addr, req_end) {
> > @@ -2175,7 +2219,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  					.va.addr = req_end,
> >  					.va.range = range - req->va.range,
> >  					.gem.obj = obj,
> > -					.gem.offset = offset + req->va.range,
> > +					.gem.range = va->gem.range,
> > +					.gem.offset = offset,  
> 
> Why change this from offset + req->va.range to just offset?

This is conditionally updated if DRM_GPUVA_REPEAT is not set further
down, because we don't want to move the GEM offset if the mapped portion
is repeated.

> 
> Same for similar other changes below.
> 
> Also it seems that we need to update the documentation which shows all potential
> cases when calling __drm_gpuvm_sm_map() [1].

Yep, will do.

> 
> [1] https://docs.kernel.org/gpu/drm-mm.html#split-and-merge
> 
> >  					.flags = va->flags,
> >  				};
> >  				struct drm_gpuva_op_unmap u = {
> > @@ -2183,6 +2228,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  					.keep = merge,
> >  				};
> >  
> > +				if (!(va->flags & DRM_GPUVA_REPEAT))
> > +					n.gem.offset += req->va.range;
> > +
> >  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
> >  				if (ret)
> >  					return ret;
> > @@ -2194,6 +2242,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  				.va.addr = addr,
> >  				.va.range = ls_range,
> >  				.gem.obj = obj,
> > +				.gem.range = va->gem.range,
> >  				.gem.offset = offset,
> >  				.flags = va->flags,
> >  			};
> > @@ -2220,11 +2269,14 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  					.va.addr = req_end,
> >  					.va.range = end - req_end,
> >  					.gem.obj = obj,
> > -					.gem.offset = offset + ls_range +
> > -						      req->va.range,
> > +					.gem.range = va->gem.range,
> > +					.gem.offset = offset,
> >  					.flags = va->flags,
> >  				};
> >  
> > +				if (!(va->flags & DRM_GPUVA_REPEAT))
> > +					n.gem.offset += ls_range + req->va.range;
> > +
> >  				ret = op_remap_cb(ops, priv, &p, &n, &u);
> >  				if (ret)
> >  					return ret;
> > @@ -2250,7 +2302,8 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  					.va.addr = req_end,
> >  					.va.range = end - req_end,
> >  					.gem.obj = obj,
> > -					.gem.offset = offset + req_end - addr,
> > +					.gem.range = va->gem.range,
> > +					.gem.offset = offset,
> >  					.flags = va->flags,
> >  				};
> >  				struct drm_gpuva_op_unmap u = {
> > @@ -2258,6 +2311,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  					.keep = merge,
> >  				};
> >  
> > +				if (!(va->flags & DRM_GPUVA_REPEAT))
> > +					n.gem.offset += req_end - addr;
> > +
> >  				ret = op_remap_cb(ops, priv, NULL, &n, &u);
> >  				if (ret)
> >  					return ret;
> > @@ -2294,6 +2350,7 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
> >  			prev.va.addr = addr;
> >  			prev.va.range = req_addr - addr;
> >  			prev.gem.obj = obj;
> > +			prev.gem.range = va->gem.range;
> >  			prev.gem.offset = offset;
> >  			prev.flags = va->flags;
> >  
> > @@ -2304,7 +2361,10 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
> >  			next.va.addr = req_end;
> >  			next.va.range = end - req_end;
> >  			next.gem.obj = obj;
> > -			next.gem.offset = offset + (req_end - addr);
> > +			prev.gem.range = va->gem.range;
> > +			next.gem.offset = offset;
> > +			if (!(va->flags & DRM_GPUVA_REPEAT))
> > +				next.gem.offset += req_end - addr;
> >  			next.flags = va->flags;
> >  
> >  			next_split = true;
> > diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> > index f77a89e791f1..629e8508f99f 100644
> > --- a/include/drm/drm_gpuvm.h
> > +++ b/include/drm/drm_gpuvm.h
> > @@ -56,10 +56,19 @@ enum drm_gpuva_flags {
> >  	 */
> >  	DRM_GPUVA_SPARSE = (1 << 1),
> >  
> > +	/**
> > +	 * @DRM_GPUVA_REPEAT:
> > +	 *
> > +	 * Flag indicating that the &drm_gpuva is a mapping of a GEM
> > +	 * portion repeated multiple times to fill the virtual address  
> 
> "of a GEM object with a certain range that is repeated multiple times to ..."

