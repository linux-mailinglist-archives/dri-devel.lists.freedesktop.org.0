Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AC8B2F77E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA9A10E957;
	Thu, 21 Aug 2025 12:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kCj1XYaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFABF10E957;
 Thu, 21 Aug 2025 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755777991;
 bh=azA9B3z3wNJhuYfDiL6hn0MK71QZlZtvPMK9aLiNlzM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kCj1XYaS83k8mGgwFVzOGw/7T9Jyrr/FSA3T60nkcpG+AsxqHXoDD8gY5Mw1+ETQ1
 HG5gD0g1ImsJwJduMuS6Sone9bNLFwhHUy41nA4Tv0qMZ7nx09B0Aaw7GAdZWWUj7R
 vZvf+65iVW+iYtRzK6VIT5FJkRI2g8oGOWGC8qG9gF28tn8gPyFiGEoCCIe2//FzOD
 pnvTv82D0U84uBclgLWP4iQaQSsEsa640xay1bwo+A4N6xfu7BIO7QVTIYvaykeRVT
 37Gx5/FY2u3bfXDToAPNU3/2IVr2COWOtpObFzYMXgqer+GxcsijlEwHczC0WwQCIS
 4xejSDYWju5Mw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BD2E217E0071;
 Thu, 21 Aug 2025 14:06:30 +0200 (CEST)
Date: Thu, 21 Aug 2025 14:06:25 +0200
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
 <lina@asahilina.net>
Subject: Re: [PATCH v4 4/7] drm/gpuvm: Add a helper to check if two VA can
 be merged
Message-ID: <20250821140625.6c33daba@fedora>
In-Reply-To: <DB61ZHDINPNE.1VFXNF2XXSJPA@kernel.org>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-5-caterina.shablia@collabora.com>
 <DB61ZHDINPNE.1VFXNF2XXSJPA@kernel.org>
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

On Mon, 07 Jul 2025 21:00:54 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Mon Jul 7, 2025 at 7:04 PM CEST, Caterina Shablia wrote:
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index 05978c5c38b1..dc3c2f906400 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2098,12 +2098,48 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
> >  	return fn->sm_step_unmap(&op, priv);
> >  }
> >  
> > +static bool can_merge(struct drm_gpuvm *gpuvm, const struct drm_gpuva *a,
> > +		      const struct drm_gpuva *b)
> > +{
> > +	/* Only GEM-based mappings can be merged, and they must point to
> > +	 * the same GEM object.
> > +	 */
> > +	if (a->gem.obj != b->gem.obj || !a->gem.obj)
> > +		return false;
> > +
> > +	/* Let's keep things simple for now and force all flags to match. */
> > +	if (a->flags != b->flags)
> > +		return false;
> > +
> > +	/* Order VAs for the rest of the checks. */
> > +	if (a->va.addr > b->va.addr)
> > +		swap(a, b);
> > +
> > +	/* We assume the caller already checked that VAs overlap or are
> > +	 * contiguous.
> > +	 */
> > +	if (drm_WARN_ON(gpuvm->drm, b->va.addr > a->va.addr + a->va.range))
> > +		return false;
> > +
> > +	/* We intentionally ignore u64 underflows because all we care about
> > +	 * here is whether the VA diff matches the GEM offset diff.
> > +	 */
> > +	return b->va.addr - a->va.addr == b->gem.offset - a->gem.offset;
> > +}
> > +
> >  static int
> >  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  		   const struct drm_gpuvm_ops *ops, void *priv,
> >  		   const struct drm_gpuvm_map_req *req)
> >  {
> >  	struct drm_gpuva *va, *next;
> > +	struct drm_gpuva reqva = {
> > +		.va.addr = req->va.addr,
> > +		.va.range = req->va.range,
> > +		.gem.offset = req->gem.offset,
> > +		.gem.obj = req->gem.obj,
> > +		.flags = req->flags,  
> 
> Huh? Where does req->flags come from? I don't remember that this flag exists in
> struct drm_gpuvm_map_req in the preceding patch?

Oops, I re-ordered commits, and forgot to verify that the series was
bisectable. This should be part of patch 4 actually.

> 
> > +	};
> >  	u64 req_end = req->va.addr + req->va.range;
> >  	int ret;
> >  
> > @@ -2116,12 +2152,9 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >  		u64 addr = va->va.addr;
> >  		u64 range = va->va.range;
> >  		u64 end = addr + range;
> > -		bool merge = !!va->gem.obj;
> > +		bool merge = can_merge(gpuvm, va, &reqva);  
> 
> I know you want to do the swap() trick above, but I don't like creating a
> temporary struct drm_gpuva with all the other uninitialized fields.

I mean, I could do it the other way around (gpuva -> op_map), but it
means doing it on each va with cross.

> 
> If you really want this, can we please limit the scope? Maybe the following
> helper:
> 
> 	static bool can_merge(struct drm_gpuvm *gpuvm,
> 			      const struct drm_gpuva *va,
> 			      struct drm_gpuvm_map_req *req)
> 	{
> 		struct drm_gpuva reqva = { ... };
> 		return __can_merge(gpuvm, va, reqva);

It's a bit of a shame though, because then this reqva is
initialized every time can_merge() is called, instead of once at the
beginning of an sm_map() operation. But maybe the compiler is smart
enough to see through it when inlining (assuming it actually inlines
the check).

> 	}

