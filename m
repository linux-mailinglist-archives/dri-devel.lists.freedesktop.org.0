Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1C39158F
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 12:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D796EC74;
	Wed, 26 May 2021 10:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5EE6EC74;
 Wed, 26 May 2021 10:57:17 +0000 (UTC)
IronPort-SDR: rpFbnuQrTmyA0CbeiKXcmvBTFRK91pj4LeOWxVF4N5xsU0dkk/XKEjgAYMx5WKUeXwNywnvzVg
 Opr/OMbE6TLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189813344"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="189813344"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:57:15 -0700
IronPort-SDR: pJ2gHag870nSMGLrLCdBNtvISN9zcIzJaTI44KClBYjvaHNLyPZpx440WSZt9Gusrfc/dvwuUa
 kLxydEt9P/ig==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="630675958"
Received: from pegilssx-mobl.ger.corp.intel.com ([10.249.254.205])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:57:12 -0700
Message-ID: <fbbb896e7e886e4d41b3a319c6aa7c5bb2e8ad4e.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 06/12] drm/ttm: Add a generic TTM memcpy
 move for page-based iomem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.william.auld@gmail.com>
Date: Wed, 26 May 2021 12:57:10 +0200
In-Reply-To: <9f8fe3af-6d49-f652-70bc-36a27007d821@amd.com>
References: <20210521153253.518037-1-thomas.hellstrom@linux.intel.com>
 <20210521153253.518037-7-thomas.hellstrom@linux.intel.com>
 <CAM0jSHM9SOPKkvbzUgFacqURXY_QbKcJ=3K_8Tdh4jjxm0nA3Q@mail.gmail.com>
 <2cc9a60c-4360-40b6-8712-1e50b7bbfd03@linux.intel.com>
 <CAM0jSHNYJd0LQhy3J3LbXezGQ-=eTh5qZJbZJRkw28eNAC9dsQ@mail.gmail.com>
 <e355705ead458e2f7385752a601befe5956eddd6.camel@linux.intel.com>
 <e6ae9ee8-401c-8ebb-33a0-0cd630e4d174@amd.com>
 <bd385b56-7342-ba5d-38cd-2758cbdb1cf3@linux.intel.com>
 <9f8fe3af-6d49-f652-70bc-36a27007d821@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-05-26 at 12:45 +0200, Christian König wrote:
> Am 26.05.21 um 09:39 schrieb Thomas Hellström:
> > [SNIP]
> > > > I think the long term goal is to use memremap all over the
> > > > place, to
> > > > just not have to bother with the __iomem annotation. But to do
> > > > that io-
> > > > mapping.h needs to support memremap. But for now we need to be
> > > > strict
> > > > about __iomem unless we're in arch specific code. That's why
> > > > that
> > > > dma_buf_map thing was created, but TTM memcpy was never fully
> > > > adapted.
> > > 
> > > I don't think that this will work. __iomem annotation is there 
> > > because we have architectures where you need to use special CPU 
> > > instructions for iomem access.
> > > 
> > > That won't go away just because we use memremap().
> > 
> > That's true, but can we ever support those with TTM, given that we 
> > allow user-space mmaping that transparently may change to an iomap?
> > Given that, and what's written here
> > 
> >  
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F653585%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C1cdcfe9d20e740308c9e08d92019785b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637576116034492654%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=e2BFGQJcElwVxrvHcnALDWscHN7ernLekGvXHqWBcwY%3D&amp;reserved=0
> >  
> > 
> > 
> > To me it sounds like if an architecture can't support memremap, we 
> > can't support it with TTM either.
> 
> That was also my argument, but this is unfortunately not true.
> 
> We already have architectures where the __iomem approach is mandatory
> for kernel mappings, but work fine for userspace (don't ask me how
> that 
> works, idk).

Ugh. :/

> 
> That's the reason why we had to fix the UVD firmware upload in the
> kernel:
> 
> commit ba0b2275a6781b2f3919d931d63329b5548f6d5f
> Author: Christian König <christian.koenig@amd.com>
> Date:   Tue Aug 23 11:00:17 2016 +0200
> 
>      drm/amdgpu: use memcpy_to/fromio for UVD fw upload
> 
> > 
> > In any case for this particular patch, to avoid potential
> > regressions, 
> > OK if I just add an ioremap() in case the memremap fails?
> 
> Well because of the issues outlined above I would actually prefer if
> we 
> can keep the __iomem annotation around.

Well, we'd do that. Since we use the dma_buf_map unconditionally.

So what would happen in the above case, would be:

- memremap would fail. (Otherwise I'd be terribly confused)
- we retry with ioremap and the dma-buf-map member is_iomem would thus
be set
- memcpy would do the right thing, based on is_iomem.

/Thomas

> 
> Christian.
> 
> > 
> > /Thomas
> > 
> > 
> > > 
> > > Christian.
> > > 
> > > > 
> > > > As for limited arch support for memremap cached, It looks like
> > > > we only
> > > > need to or in "backup" mapping modes in the memremap flags, and
> > > > we'd
> > > > mimic the previous behaviour.
> > > > 
> > > > /Thomas
> > > > 
> > > > 
> > > > > > /Thomas
> > > > > > 
> > > > > > 
> > > > 
> > > 
> 


