Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2731551164
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2944C10F23D;
	Mon, 20 Jun 2022 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A904310F178;
 Mon, 20 Jun 2022 07:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655709766; x=1687245766;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mpt0zhbUFqLJf8WVjMU5fjm59+8A5EgE2gCWbz7VT4o=;
 b=Y6qqRs8Rziu7JwXWo2pV/5cRi68k+Wb3NKe/upJv6wZ69emIo4Knd4oU
 j3mPyCqa2NH1X9MNb1sjFx4OlHTDUqP8jT4/duZdf1LWF31iY2nYLvZcr
 OJk1XP0rm/edXd34AeGHqPUqmqxlK8b2KSqdkjnBJQ3nQSgwubyNINsct
 VhLztko51g699LIkpjVSnBFkGiVMSJFtyvec8FBzpPqR1CoQYyxNzLr3Q
 hESiQQqXPowaOHuW/mEgF1PtCQF6WtX/xHjYXdRHVtM2hnHTY+XMQyRvw
 nMEYiWYSUu6h9rFNHawhpCktsig2Gv8FwvyhVkJNoRq9tig4j5wV8RZTh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280882984"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280882984"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:22:46 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="619997168"
Received: from ahashmi-mobl.ger.corp.intel.com (HELO [10.249.254.225])
 ([10.249.254.225])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 00:22:44 -0700
Message-ID: <69097036fb05d93b0f4cbf96e49df55aad26df79.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 1/1] i915/gem: drop wbinvd_on_all_cpus usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Michael Cheng
 <michael.cheng@intel.com>
Date: Mon, 20 Jun 2022 09:22:41 +0200
In-Reply-To: <20220617233023.6y4itjzycqjcoqfa@ldmartin-desk2>
References: <20220414181923.25631-1-michael.cheng@intel.com>
 <20220414181923.25631-2-michael.cheng@intel.com>
 <20220617233023.6y4itjzycqjcoqfa@ldmartin-desk2>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 2022-06-17 at 16:30 -0700, Lucas De Marchi wrote:
> On Thu, Apr 14, 2022 at 11:19:23AM -0700, Michael Cheng wrote:
> > Previous concern with using drm_clflush_sg was that we don't know
> > what the
> > sg_table is pointing to, thus the usage of wbinvd_on_all_cpus to
> > flush
> > everything at once to avoid paranoia.
> 
> humn... and now we know it is backed by struct pages? I'm not sure I
> follow what we didn't know before and now we do.
> 
> Thomas / Matthew, could you take another look herer if it seems
> correct
> to you.
> 
> 
No, this isn't correct. A dma-buf sg-table may not be backed by struct
pages, and AFAIK, there is no way for the importer to tell, whether
that's the case or not.

If we need to get rid of the wbinvd_on_all_cpus here, we need to use
the dma_buf_vmap() function to obtain a virtual address and then use
drm_clflush_virt_range() on that address. After that clflush, we can
call dma_buf_vunmap(). This should work since x86 uses PIPT caches and
a flush to a virtual range should flush all other virtual ranges
pointing to the same pages as well.

/Thomas


> thanks
> Lucas De Marchi
> 
> 
> > To make i915 more architecture-neutral and be less paranoid, lets
> > attempt to
> > use drm_clflush_sg to flush the pages for when the GPU wants to
> > read
> > from main memory.
> > 
> > Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> > ---
> > drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 9 ++-------
> > 1 file changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > index f5062d0c6333..b0a5baaebc43 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > @@ -8,6 +8,7 @@
> > #include <linux/highmem.h>
> > #include <linux/dma-resv.h>
> > #include <linux/module.h>
> > +#include <drm/drm_cache.h>
> > 
> > #include <asm/smp.h>
> > 
> > @@ -250,16 +251,10 @@ static int
> > i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
> >          * DG1 is special here since it still snoops transactions
> > even with
> >          * CACHE_NONE. This is not the case with other HAS_SNOOP
> > platforms. We
> >          * might need to revisit this as we add new discrete
> > platforms.
> > -        *
> > -        * XXX: Consider doing a vmap flush or something, where
> > possible.
> > -        * Currently we just do a heavy handed wbinvd_on_all_cpus()
> > here since
> > -        * the underlying sg_table might not even point to struct
> > pages, so we
> > -        * can't just call drm_clflush_sg or similar, like we do
> > elsewhere in
> > -        * the driver.
> >          */
> >         if (i915_gem_object_can_bypass_llc(obj) ||
> >             (!HAS_LLC(i915) && !IS_DG1(i915)))
> > -               wbinvd_on_all_cpus();
> > +               drm_clflush_sg(pages);
> > 
> >         sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
> >         __i915_gem_object_set_pages(obj, pages, sg_page_sizes);
> > -- 
> > 2.25.1
> > 


