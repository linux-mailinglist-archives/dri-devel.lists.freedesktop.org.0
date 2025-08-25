Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC863B3447C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1B010E4E0;
	Mon, 25 Aug 2025 14:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BuOAR6Fk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C6B10E4DB;
 Mon, 25 Aug 2025 14:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756133318; x=1787669318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=igLgfQf8niMslP9gUWwii0eKXSnbu7+LbSOO9i299Vg=;
 b=BuOAR6FkT79adaOxbc9pjrIMht91N9Vjv+F3z1QqIItgfaPCJwOsbMrM
 jxcBqYM8P+VYfL+3RYsBz8RDu/MC5M0qKur9XRICx+QGUrxax2BemrM6x
 bXVcVJL3j8F8TTFzMVztxuE7BiFWlRHFPSRm3SYCVdzCm6WulI9BbZDE9
 w0kz0hfdqZ7LYALXvjBhAqqo2zYQu4IU8PrgC5T/n658vLUze7TprMF+9
 VJgwpFnrMeZ8T9930vRVBtirmkHjpukGs/TsuCUf1YxLrODuRXazW1gqn
 cF29Ncso7i1uwKt1qL/4H+UwrEMoR7iGOiZ+jZfENfQNcoSyDU0qciMUk A==;
X-CSE-ConnectionGUID: mHe30Yy+SESnb5net7LsBA==
X-CSE-MsgGUID: Ttc05zbBRIqG/pjfKxi6kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="57549243"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="57549243"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:48:33 -0700
X-CSE-ConnectionGUID: fqJSsQ8qRUWETVbsA121PQ==
X-CSE-MsgGUID: o0FhxdbCQ86eVFHeCbzmAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168915616"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:48:31 -0700
Date: Mon, 25 Aug 2025 16:48:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Skip creation of pcode sysfs files when pcode is
 disabled
Message-ID: <aKx3vHwxnzf4cExx@black.igk.intel.com>
References: <20250819175529.3722716-1-andi.shyti@kernel.org>
 <aKibCnAxTuYcKtWx@intel.com> <aKxzu8njh9Xc0wyU@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKxzu8njh9Xc0wyU@ashyti-mobl2.lan>
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

On Mon, Aug 25, 2025 at 04:31:23PM +0200, Andi Shyti wrote:
> Hi Rodrigo,
> 
> On Fri, Aug 22, 2025 at 12:30:02PM -0400, Rodrigo Vivi wrote:
> > On Tue, Aug 19, 2025 at 04:55:29PM -0100, Andi Shyti wrote:
> > > From: Andi Shyti <andi.shyti@linux.intel.com>
> > > 
> > > Coverity warns that 'cap' may be used uninitialised. If pcode
> > > is disabled there is no need to go through the hassle of a
> > > pcode read or taking a PM reference.
> > 
> > Please mark it as false positive!
> 
> this patch is not for fixing the Coverity warning, but I saw it
> useless to step any further if there is skip pcode.
> 
> The same check is done later in the function, but in the meantime
> we have done a few things that we could have spared.

I tried something similar a few days ago, but perhaps not very convincingly
I presume.

[1] https://lore.kernel.org/intel-xe/20250806152256.748057-1-raag.jadav@intel.com/

Raag

> > We will only get here for BMG which has pcode for sure.
> > 
> > > 
> > > Check skip_pcode early in the function and return if it is set.
> > > 
> > > No change for platforms where pcode is enabled.
> > > 
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device_sysfs.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > index bd9015761aa0..3a083c215891 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > @@ -156,6 +156,9 @@ static int late_bind_create_files(struct device *dev)
> > >  	u32 cap;
> > >  	int ret;
> > >  
> > > +	if (xe->info.skip_pcode)
> > > +		return 0;
> > > +
> > >  	xe_pm_runtime_get(xe);
> > >  
> > >  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> > > -- 
> > > 2.50.0
> > > 
