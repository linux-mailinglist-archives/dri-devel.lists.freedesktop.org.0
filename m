Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6597688FD73
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF0910E24B;
	Thu, 28 Mar 2024 10:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IB0J1XKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C510E3F1;
 Thu, 28 Mar 2024 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711623235; x=1743159235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hWf532IYORmN7k5sJhQ2HCmw8aNgqHlZTGvk1zPpmMs=;
 b=IB0J1XKMKO8oIpW+To5OY+x4CFkfMK6ZeDbF46zGKmGG0efNiF+TeB7p
 c38NtjFb1ey5q9+tvi/l18adKf0iz7IGYooNrMm+dz/RvIjtiuIR3dWRH
 jgnjiqMjdOM8SXeusxPATtDjnkIyYIdZm1U3z3qKBz5OX8xc+h0bg/M0h
 xjJlsfUFlHUmeb6WLGI9WfODasp62/tvHeu2GTz5tS9Y/VWEy6oF5ihxi
 jJgOAVcJ5nc6NVvEcOp+8oUk7S2n4bXLjBUXr5NKrI0Tb4QvMGsS388Tn
 XncTiWkBBbCoI4knZT7rDXSc4+gmcNbiOn5EZxD3Iqgrdq7/3VzwfwTiz A==;
X-CSE-ConnectionGUID: pLEa+VnIRJGOXtsxLwXyrg==
X-CSE-MsgGUID: c4cZHRuaQqOZ9bIG8j+PNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6623949"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6623949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21081982"
Received: from unknown (HELO intel.com) ([10.247.118.221])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 03:53:50 -0700
Date: Thu, 28 Mar 2024 11:53:43 +0100
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
Message-ID: <ZgVMN4P8NQq0iZTK@ashyti-mobl2.lan>
References: <20240325134033.287913-1-andi.shyti@linux.intel.com>
 <db2627fa-b1da-4a27-8c87-bebe0407d8a7@linux.intel.com>
 <ZgKttR-loIoAZoOE@ashyti-mobl2.lan>
 <49e4ab49-e928-475a-bbaf-19c9009fdd1f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49e4ab49-e928-475a-bbaf-19c9009fdd1f@linux.intel.com>
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

On Tue, Mar 26, 2024 at 01:05:37PM +0100, Nirmoy Das wrote:
> On 3/26/2024 12:12 PM, Andi Shyti wrote:

> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > > index a2195e28b625..57a2dda2c3cc 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > > @@ -276,7 +276,7 @@ static vm_fault_t vm_fault_cpu(struct vm_fault *vmf)
> > > >    	/* PTEs are revoked in obj->ops->put_pages() */
> > > >    	err = remap_io_sg(area,
> > > >    			  area->vm_start, area->vm_end - area->vm_start,
> > > > -			  obj->mm.pages->sgl, iomap);
> > > > +			  obj->mm.pages->sgl, 0, iomap);
> > > Why don't we need partial mmap for CPU but only for GTT ?
> > As far as I understood we don't. I have a version with the CPU
> > offset as well in trybot[*]
> > 
> > But without support for segmented buffer objects, I don't know
> > how much this has any effect.
> 
> You confused me more :) Why segmented buffer object is needed for partial
> CPU mmap but not for GTT  ?

atually segmented bo's were introduced to support single dma
buffers instead of fragmented buffers. But this goes beyond the
scope of this patch.

> From high level,  GTT and CPU both should support partial mmap unless I
> missing something here.

But yes, we could take the patch I linked which adds some offset
to the cpu memory. I will add it in V2.

> > 
> > > Sounds like this also need to be cover by a IGT tests.
> > Yes, I it does need some igt work, working on it.
> > 
> > > Don't we need "Fixes" tag for this?
> > Why should we? I'm not fixing anything here,
> 
> If userspace  expects partial mmap to work then this is a bug/gap in i915 so
> we need to
> 
> backport this as far as possible. Need some information about the
> requirement about  why we need this patch suddenly?

But a gap is not a bug. Theoretically we are adding a feature.

On the other hand it would be a bug if the API promises to add
the offset but in reality it doesn't. I will check if this is the
case and it needs to be well described in the commit message.

Thanks,
Andi
