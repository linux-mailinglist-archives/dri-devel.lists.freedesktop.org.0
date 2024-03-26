Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CEB88C04E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E1E10E6A3;
	Tue, 26 Mar 2024 11:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sq6EnA89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C3B10E5C3;
 Tue, 26 Mar 2024 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711451584; x=1742987584;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ztdD8hxV7A8w331pYP1sRssLHFjECtUWZdXEhlZZxWk=;
 b=Sq6EnA895ETWTWFGv8Bw7Sk9QLvEEef9kMsQy7TRFQHvHMwr10rzzfsN
 OoGaa8S9cVP0w2Nmn7MiVD8aaPAyp1RXphcCOJk9Qf8FO4IPJON6QitnR
 Uf0PPf9xYIkzPeLN3B7d1VssCmk79IZK9o+tBMT+6AdBdDSQf5eIPCviv
 jRkgCHn1lDI1v9UBYpZOUWUAk4ZfHKgoMGfkijHPpVmwGY0iTOqbHyjyf
 FNcw3KUnKXEUAjgplIKm9UF8Y220Ck9IJhT5nSwXh0ekDyZMypnI0cEyk
 yzBeoQeNXh5PlhrGcB9iIforLArs0A/3c8h7w3urmKKM+hWaXoXXSeQf8 A==;
X-CSE-ConnectionGUID: xbqrUE/8RaaI1hPtZVUJMA==
X-CSE-MsgGUID: 8nv7QvL3TrGKFc76p41C3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10291536"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="10291536"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16005558"
Received: from unknown (HELO intel.com) ([10.247.118.204])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:12:58 -0700
Date: Tue, 26 Mar 2024 12:12:53 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Calculate object page offset for partial
 memory mapping
Message-ID: <ZgKttR-loIoAZoOE@ashyti-mobl2.lan>
References: <20240325134033.287913-1-andi.shyti@linux.intel.com>
 <db2627fa-b1da-4a27-8c87-bebe0407d8a7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db2627fa-b1da-4a27-8c87-bebe0407d8a7@linux.intel.com>
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

Hi Nirmoy,

...

> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > index a2195e28b625..57a2dda2c3cc 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > @@ -276,7 +276,7 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
> >   	/* PTEs are revoked in obj->ops->put_pages() */
> >   	err = remap_io_sg(area,
> >   			  area->vm_start, area->vm_end - area->vm_start,
> > -			  obj->mm.pages->sgl, iomap);
> > +			  obj->mm.pages->sgl, 0, iomap);
> 
> Why don't we need partial mmap for CPU but only for GTT ?

As far as I understood we don't. I have a version with the CPU
offset as well in trybot[*]

But without support for segmented buffer objects, I don't know
how much this has any effect.

> Sounds like this also need to be cover by a IGT tests.

Yes, I it does need some igt work, working on it.

> Don't we need "Fixes" tag for this?

Why should we? I'm not fixing anything here, I'm just
recalculating the mapping not starting from the beginning of the
scatter page.

Andi

[*] https://patchwork.freedesktop.org/patch/584474/?series=131539&rev=2
