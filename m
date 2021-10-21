Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE1435B4C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4444D6EB7A;
	Thu, 21 Oct 2021 07:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBC46EB7A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:05:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="252459091"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="252459091"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 00:05:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="575721919"
Received: from mstribae-mobl1.ger.corp.intel.com (HELO [10.249.254.146])
 ([10.249.254.146])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 00:05:48 -0700
Message-ID: <a5479edac6b4341fb4275ffa62a00c26c68dbbcf.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Jason
 Gunthorpe <jgg@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>, Dan
 Williams <dan.j.williams@intel.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Date: Thu, 21 Oct 2021 09:05:45 +0200
In-Reply-To: <d6dfc7d5-7c02-aea9-fc71-e0d93033c3fb@amd.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
 <20211020193702.GJ2744544@nvidia.com>
 <d6dfc7d5-7c02-aea9-fc71-e0d93033c3fb@amd.com>
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

On Thu, 2021-10-21 at 09:04 +0200, Christian König wrote:
> Works for me.

+1
/Thomas


> 
> Am 20.10.21 um 21:37 schrieb Jason Gunthorpe:
> > On Wed, Oct 20, 2021 at 08:41:24AM +0200, Christian König wrote:
> > 
> > > > I think the patch subject needs updating to reflect that we're
> > > > disabling
> > > > PUD/PMDs completely.
> > > > With that fixed,
> > Everyone is OK with this?
> > 
> > drm/ttm: remove ttm_bo_vm_insert_huge()
> > 
> > The huge page functionality in TTM does not work safely because PUD
> > and
> > PMD entries do not have a special bit.
> > 
> > get_user_pages_fast() considers any page that passed pmd_huge() as
> > usable:
> > 
> >         if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> >                      pmd_devmap(pmd))) {
> > 
> > And vmf_insert_pfn_pmd_prot() unconditionally sets
> > 
> >         entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
> > 
> > eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
> > 
> > As such gup_huge_pmd() will try to deref a struct page:
> > 
> >         head = try_grab_compound_head(pmd_page(orig), refs, flags);
> > 
> > and thus crash.
> > 
> > So, iomem cannot be installed using vmf_insert_pfn_pud/pmd_prot().
> > 
> > Thomas further notices that the drivers are not expecting the
> > struct page
> > to be used by anything - in particular the refcount incr above will
> > cause
> > them to malfunction. This means even the struct page memory cannot
> > be
> > used.
> > 
> > Therefore everything about this is not able to fully work correctly
> > considering GUP_fast. Delete it entirely. It can return someday
> > along with
> > a proper PMD/PUD_SPECIAL bit in the page table itself to gate
> > GUP_fast.
> > 
> > Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM
> > pagefaults")
> > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 


