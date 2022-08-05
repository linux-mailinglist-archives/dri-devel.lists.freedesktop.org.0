Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4025658A9A9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 12:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620A8B3B59;
	Fri,  5 Aug 2022 10:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B3AB4873;
 Fri,  5 Aug 2022 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659695427; x=1691231427;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Wl1d0jKvHZGC5Yd449Qnm7zhaueS05JbKcyoWYVXVmY=;
 b=HMM4ps661GFlURSPFgKMcn2LjgOIkLHQS2PrxrDEXH6QgsYkDqq9z2Lt
 azPit5PFP3xWXnjRtC+U58N2MXlasIbVDexmjxNfL1KcTiop85soGWlNE
 m4AdzMOXb2ACqLHGc3wZSCnvbkfyWcBG/j94tGDI0L7k/2RAUXV8EBLrK
 8tof7D8ZWYAzXcZ/GQDsUaw0SMjWudTOH7enYZ/ZOjG6kPmrSnejJ27EO
 8GgrGcPiJCgZa52ITffMq6ZTaCveIFsBOx7UYwkes8hJw6R9sKxWtanBv
 /sMaxzXQQbj/2tNwK1mUQq549a3snOEF+wFMBH++VXAM3amozHJeFlO21 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="351883941"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="351883941"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 03:30:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="631968756"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 03:30:22 -0700
Date: Fri, 5 Aug 2022 12:30:18 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 3/3] drm/i915/gt: document TLB cache
 invalidation functions
Message-ID: <20220805123018.1143f2c3@maurocar-mobl2>
In-Reply-To: <7156b3bd-69d7-de53-dd2b-96e82a8cf0f7@linux.intel.com>
References: <cover.1659598090.git.mchehab@kernel.org>
 <cc68d62a1979ea859b447b94413e100472331f57.1659598090.git.mchehab@kernel.org>
 <0698c5a5-3bf2-daa4-e10e-2715f9b0d080@infradead.org>
 <Yuzd9Ysc3BDQHuSW@alfio.lan>
 <7156b3bd-69d7-de53-dd2b-96e82a8cf0f7@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
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
Cc: Chris Wilson <chris.p.wilson@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Aug 2022 10:24:25 +0100
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 05/08/2022 10:08, Andi Shyti wrote:
> > Hi Randy,
> >   
> >>> +/**
> >>> + * intel_gt_invalidate_tlb_full - do full TLB cache invalidation
> >>> + * @gt: GT structure  
> >>
> >> In multiple places (here and below) it would be nice to know what a
> >> GT structure is. I looked thru multiple C and header files yesterday
> >> and didn't find any comments about it.
> >>
> >> Just saying that @gt is a GT structure isn't very helpful, other
> >> than making kernel-doc shut up.  
> > 
> > the 'gt' belongs to the drivers/gpu/drm/i915/gt/ subsystem and
> > it's widely used a throughout i915.
> > 
> > I think it's inappropriate to describe it just here. On the other
> > hand I agree that a better documentation is required for the GT
> > itself where other parts can point to.  

GT is actually a well-understood term for GPU developers. It is an alias
for:

	https://en.wikipedia.org/wiki/Intel_Graphics_Technology

It is basically the "core" of the GPU, where the engine units sit.

I agree with Andi: terms like this should likely be defined on a glossary
at i915.rst file.

> Yeah agreed there is no point of copy pasting some explanation all over 
> the place. Could we just do s/GT structure/struct intel_gt/, or "pointer 
> to struct intel_gt to operate on", would that be good enough?

IMO, it won't make any difference. kerneldoc already says that the
parameter has struct intel_gt type on its output:

	.. c:function:: void intel_gt_fini_tlb (struct intel_gt *gt)

	   free TLB-specific vars

	**Parameters**

	``struct intel_gt *gt``
	  GT structure
	
	**Description**

	Frees any resources needed by TLB cache invalidation logic.

This struct somewhat is similar to struct device. This is a container
struct that has the common data needed to control the GT hardware.

Almost all functions that work with GT needs it. There's not much sense
to describe it everywhere. What makes sense is to have struct intel_gt
documented at intel_gt_types.h, letting the build system to generate 
hiperlinks to it.

This is easier said than done...

Regards,
Mauro
