Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5574132AF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831616E950;
	Tue, 21 Sep 2021 11:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F90D6E92E;
 Tue, 21 Sep 2021 11:37:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="220140876"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="220140876"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:37:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="652898568"
Received: from rogerc2x-mobl.ger.corp.intel.com (HELO [10.249.254.52])
 ([10.249.254.52])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 04:37:37 -0700
Message-ID: <bc9ca2021c05d4d0d1072f95d7bda42fa7f174d1.camel@linux.intel.com>
Subject: Re: [PATCH v4 01/14] drm/ttm: stop calling tt_swapin in vm_access
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Tue, 21 Sep 2021 13:37:35 +0200
In-Reply-To: <e358c620-fd78-f3c6-2558-7376a86701b9@amd.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
 <e358c620-fd78-f3c6-2558-7376a86701b9@amd.com>
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

HI, Christian,
On Tue, 2021-09-21 at 13:28 +0200, Christian König wrote:
> Am 21.09.21 um 13:01 schrieb Matthew Auld:
> > In commit:
> > 
> > commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
> > Author: Felix Kuehling <Felix.Kuehling@amd.com>
> > Date:   Thu Jul 13 17:01:16 2017 -0400
> > 
> >      drm/ttm: Implement vm_operations_struct.access v2
> > 
> > we added the vm_access hook, where we also directly call tt_swapin
> > for
> > some reason. If something is swapped-out then the ttm_tt must also
> > be
> > unpopulated, and since access_kmap should also call tt_populate, if
> > needed, then swapping-in will already be handled there.
> 
> Sounds like you completely misunderstand what that is good for.
> 
> This is for debugger attaching to a process and peek/poke into the
> VMA 
> and completely unrelated to kmap.

I think what Matthew is saying is that there is a fallthrough to
TTM_PL_TT which calls

ttm_bo_vm_access_kmap

which calls

ttm_tt_populate().

So from my pow, unless there are other concerns, this is

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> 
> > 
> > If anything, calling tt_swapin directly here would likely always
> > fail
> > since the tt->pages won't yet be populated, or worse since the tt-
> > >pages
> > array is never actually cleared in unpopulate this might lead to a
> > nasty
> > uaf.
> 
> That's indeed true, but we just need to unconditionally call 
> ttm_tt_populate() here instead.
> 
> Regards,
> Christian.
> 
> > 
> > Fixes: 09ac4fcb3f25 ("drm/ttm: Implement
> > vm_operations_struct.access v2")
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
> >   1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > index f56be5bc0861..5b9b7fd01a69 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct
> > *vma, unsigned long addr,
> >   
> >         switch (bo->resource->mem_type) {
> >         case TTM_PL_SYSTEM:
> > -               if (unlikely(bo->ttm->page_flags &
> > TTM_PAGE_FLAG_SWAPPED)) {
> > -                       ret = ttm_tt_swapin(bo->ttm);
> > -                       if (unlikely(ret != 0))
> > -                               return ret;
> > -               }
> >                 fallthrough;
> >         case TTM_PL_TT:
> >                 ret = ttm_bo_vm_access_kmap(bo, offset, buf, len,
> > write);
> 


