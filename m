Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709813F3188
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 18:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7950B6EACE;
	Fri, 20 Aug 2021 16:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4AB6EACB;
 Fri, 20 Aug 2021 16:34:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="280532456"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="280532456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 09:34:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="523768760"
Received: from rsriniv2-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.34.126])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 09:34:03 -0700
Date: Fri, 20 Aug 2021 12:34:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Potential error pointer dereference in
 pinned_context()
Message-ID: <YR/ZeRfyltL9ACSr@intel.com>
References: <20210813113600.GC30697@kili>
 <866cce10-f983-23d5-06db-b0effc11e50f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <866cce10-f983-23d5-06db-b0effc11e50f@linux.intel.com>
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

On Fri, Aug 13, 2021 at 04:01:06PM +0200, Thomas Hellström wrote:
> 
> On 8/13/21 1:36 PM, Dan Carpenter wrote:
> > If the intel_engine_create_pinned_context() function returns an error
> > pointer, then dereferencing "ce" will Oops.  Use "vm" instead of
> > "ce->vm".
> > 
> > Fixes: cf586021642d ("drm/i915/gt: Pipelined page migration")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_migrate.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index d0a7c934fd3b..1dac21aa7e5c 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -177,7 +177,7 @@ static struct intel_context *pinned_context(struct intel_gt *gt)
> >   	ce = intel_engine_create_pinned_context(engine, vm, SZ_512K,
> >   						I915_GEM_HWS_MIGRATE,
> >   						&key, "migrate");
> > -	i915_vm_put(ce->vm);
> > +	i915_vm_put(vm);
> >   	return ce;
> >   }
> 
> Thanks,
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

And pushed to drm-intel-gt-next, thanks for the patch and review.

> 
> 
