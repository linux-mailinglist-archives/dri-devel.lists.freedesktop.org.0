Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AF76717F2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 10:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C5010E20B;
	Wed, 18 Jan 2023 09:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05BC10E1E4;
 Wed, 18 Jan 2023 09:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674034828; x=1705570828;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6qSUBZtK7ZAjqJEBSh4NSpPzIBl1mSJVjkG+5CX2W5w=;
 b=XDfSmkRdQUwoToLQTay58L5HjCg/Po95nw+3FG7yP71s+OfMantdB7Id
 ReEckW1NMUs7lxzdEQmIRg85FSSB95+Fvm0ZFWfDpxyjXHfb8aXWNFrBp
 LJPPQz7aEHOox5dFXA11Iu7190s7P1QMwduQnvPGTtuKHRnWB/pXpsM11
 9z/7vxN4xB3JZy4RHWubvMyUpyYvAKiiPSq/9gHxaF2YCkhyh5pbYOzzX
 4sKaWDyy3Tv2CdEaXp33YYuOj3PhAzT6BUdKJXJcA6GRjTW/V0e/O9fDk
 88fvis9Y0rClj8XkUKg7xKLH1CL0jGlhDhvGApu5q2nvtNFZn18JHCuCy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="308505424"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="308505424"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:40:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="783604765"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="783604765"
Received: from tpalli-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.209])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 01:40:26 -0800
Date: Wed, 18 Jan 2023 10:40:22 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915: Fix a memory leak with reused mmap_offset
Message-ID: <Y8e+htftWWTz9NaX@ashyti-mobl2.lan>
References: <20230117175236.22317-1-nirmoy.das@intel.com>
 <20230117175236.22317-2-nirmoy.das@intel.com>
 <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e517b87-b626-b488-0daa-88897c9ed90a@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 18, 2023 at 09:19:40AM +0000, Tvrtko Ursulin wrote:
> 
> 
> Hi,
> 
> Thanks for working on this, it looks good to me and it aligns with how i915 uses the facility.
> 
> Copying Mirsad who reported the issue in case he is still happy to give it a quick test. Mirsad, I don't know if you are subscribed to one of the two mailing lists where series was posted. In case not, you can grab both patches from https://patchwork.freedesktop.org/series/112952/.
> 
> Nirmoy - we also have an IGT written by Chuansheng - https://patchwork.freedesktop.org/patch/515720/?series=101035&rev=4. A more generic one could be placed in gem_mmap_offset test but this one works too in my testing and is IMO better than nothing.
> 
> Finally, let me add some tags below:
> 
> On 17/01/2023 17:52, Nirmoy Das wrote:
> > drm_vma_node_allow() and drm_vma_node_revoke() should be called in
> > balanced pairs. We call drm_vma_node_allow() once per-file everytime a
> > user calls mmap_offset, but only call drm_vma_node_revoke once per-file
> > on each mmap_offset. As the mmap_offset is reused by the client, the
> > per-file vm_count may remain non-zero and the rbtree leaked.
> > 
> > Call drm_vma_node_allow_once() instead to prevent that memory leak.
> > 
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Fixes: 786555987207 ("drm/i915/gem: Store mmap_offsets in an rbtree rather than a plain list")
> Reported-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Reported-by: Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
> Cc: <stable@vger.kernel.org> # v5.7+
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Nirmoy, you can also add:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Will this go through the drm branch?

Andi

> Regards,
> 
> Tvrtko
> 
> > 
> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_mman.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > index 4f69bff63068..2aac6bf78740 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > @@ -697,7 +697,7 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
> >   	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
> >   out:
> >   	if (file)
> > -		drm_vma_node_allow(&mmo->vma_node, file);
> > +		drm_vma_node_allow_once(&mmo->vma_node, file);
> >   	return mmo;
> >   err:
