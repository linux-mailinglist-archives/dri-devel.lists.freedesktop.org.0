Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25295947890
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 11:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177E410E17F;
	Mon,  5 Aug 2024 09:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiBcP8Ew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF06C10E17A;
 Mon,  5 Aug 2024 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722850804; x=1754386804;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=55v2HyWOHKu34T7HvxaRjNnUQfmhmPEFy3bNO/nw+Fw=;
 b=SiBcP8EwaBKOBM0Q+M3tyHzl4i5QLE4dqa3aJBTldAcwG6czqFUNo+bz
 NqbwPVQ9cTlvzVuSSFkfKi2v0ADeevk1q4FsD0hPdxUTQhsHk0qWiZDSc
 fEhsEGk24oSlis+A60KeQvpSThCtU1FKLdbBlAhFioSOk8G1ZD13E4mrG
 I4FG31i+hpSNXNk2ZZbvbHa35DJbrYPRIiOfo7NsyoxkjUTt7xMRZqVbC
 DX+BDlqk/RLrpRYrnNUF/FL+ILvQk2gD582xEBzkZtDdxdPzp4wh4yy0B
 6JTRl4fCL95hdnVkSibeNklEov7gxVvG7VuNacHi4NnFc4GsBdDCnc8r1 g==;
X-CSE-ConnectionGUID: zl55rFdnQHSapgP0vXLiPA==
X-CSE-MsgGUID: jxI12BqlQvqljH0B+64RUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31381243"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="31381243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 02:40:04 -0700
X-CSE-ConnectionGUID: Vs6CzNIvSZOo1h+r/w0D3A==
X-CSE-MsgGUID: 5F1TckUmTFWHkVmHpSWqjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="79388279"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.249])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 02:39:59 -0700
Date: Mon, 5 Aug 2024 11:39:55 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jann Horn <jannh@chromium.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Jann Horn <jannh@google.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gem: Fix Virtual Memory mapping boundaries
 calculation
Message-ID: <ZrCd64EG4Ez83xZP@ashyti-mobl2.lan>
References: <20240802083850.103694-1-andi.shyti@linux.intel.com>
 <20240802083850.103694-3-andi.shyti@linux.intel.com>
 <CH0PR11MB54442106B9FB0353403DC109E5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54442106B9FB0353403DC109E5B32@CH0PR11MB5444.namprd11.prod.outlook.com>
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

Hi Jonathan,

...

> > +	set_address_limits(area, vma, obj_offset, &start, &end);
> > +
> > +	pfn = (ggtt->gmadr.start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
> > +	pfn += (start - area->vm_start) >> PAGE_SHIFT;
> > +	pfn += obj_offset - vma->gtt_view.partial.offset;
> 
> I don't know how viable it would be, but maybe we could
> calculate pfn as a part of set_address_limits?

I was a bit afraid of dumping a massive parameter list...

> Just a suggestion, not blocking

... but now that I'm looking at it more carefully, it would be
just two parameters more (&pfn and ggtt->gmadr.start) and would
be cleaner. Will send a v2.

> Reviewed-by: Jonathan Cavitt <Jonathan.cavitt@intel.com>
> -Jonathan Cavitt

Thanks!

Andi
