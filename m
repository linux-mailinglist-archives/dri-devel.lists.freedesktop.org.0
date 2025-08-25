Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A73CB343D3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A0B10E4CA;
	Mon, 25 Aug 2025 14:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doX/62m5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D75110E4BE;
 Mon, 25 Aug 2025 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756132288; x=1787668288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yKLeqcLmpWifCCUCk/233TIF7HTkixzrus8gFmqf/ew=;
 b=doX/62m5l1YLtm1EOBG1jftTVOkF7LoHsMs61JR9KYCJU9w8aTTV1PZ4
 GhAO+WmI8mRQ+0ebrC0i5TullSOUp9LDXXZDx+SGr9H0C4GxJSthwRL1F
 KGFTvG3iyjgg/arWtxdkJYKVfZGUM8tBBQB3AXd2oY4wkfti7tdGy7SCa
 C8i5wScdpOubj6y6gUwmYHAWj8PcOLX+XU8bFzRFYE2JMV69Nj2ExYpCl
 PEfgWwrA/gy1MhRuqZUJhZNPaUz9vWydgzIbWDXONmHAw1Wom0Tg8D5Gm
 mIuLgD79V/71tIj/5fHA3xZZ1U992h5HAmiQZPt0//2alBiNR+41MrryR w==;
X-CSE-ConnectionGUID: Pga5zfSCQm2Ox3gsa6koDg==
X-CSE-MsgGUID: NhSciktpS6ijxgKCxMi+Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="57547253"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="57547253"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:31:28 -0700
X-CSE-ConnectionGUID: lzCxz89BSUW7LloHu2bg3Q==
X-CSE-MsgGUID: Fz8C7YPxTUuuQZ9BugTJBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="169209077"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.119])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:31:26 -0700
Date: Mon, 25 Aug 2025 16:31:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Raag Jadav <raag.jadav@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Skip creation of pcode sysfs files when pcode is
 disabled
Message-ID: <aKxzu8njh9Xc0wyU@ashyti-mobl2.lan>
References: <20250819175529.3722716-1-andi.shyti@kernel.org>
 <aKibCnAxTuYcKtWx@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKibCnAxTuYcKtWx@intel.com>
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

Hi Rodrigo,

On Fri, Aug 22, 2025 at 12:30:02PM -0400, Rodrigo Vivi wrote:
> On Tue, Aug 19, 2025 at 04:55:29PM -0100, Andi Shyti wrote:
> > From: Andi Shyti <andi.shyti@linux.intel.com>
> > 
> > Coverity warns that 'cap' may be used uninitialised. If pcode
> > is disabled there is no need to go through the hassle of a
> > pcode read or taking a PM reference.
> 
> Please mark it as false positive!

this patch is not for fixing the Coverity warning, but I saw it
useless to step any further if there is skip pcode.

The same check is done later in the function, but in the meantime
we have done a few things that we could have spared.

Andi

> We will only get here for BMG which has pcode for sure.
> 
> > 
> > Check skip_pcode early in the function and return if it is set.
> > 
> > No change for platforms where pcode is enabled.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_sysfs.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > index bd9015761aa0..3a083c215891 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > @@ -156,6 +156,9 @@ static int late_bind_create_files(struct device *dev)
> >  	u32 cap;
> >  	int ret;
> >  
> > +	if (xe->info.skip_pcode)
> > +		return 0;
> > +
> >  	xe_pm_runtime_get(xe);
> >  
> >  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
> > -- 
> > 2.50.0
> > 
