Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E204CED5E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 20:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD5E10E106;
	Sun,  6 Mar 2022 19:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5310E0E4;
 Sun,  6 Mar 2022 19:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646594629; x=1678130629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nlcmAEkcfWn3z+w+TBjJx8rEzELfzh4KdiJ5YuhKpY0=;
 b=fWC7NpUqMhLQAolFyFCAKk/9oCe9JMIZWoDotY964g71LeB38XZEZaoL
 VaG1rL//GTvJq2hVHSTqP1K82vWQiK105Tkai48VkvFVLiGINroRQupOe
 8T4A1IqPN8iRZMeVYT2a/KxEtM+1nqZWb8n5fdsgrFJag/V7+iOvluIl/
 dVNtngMwEfMjeRXcrJoC5A/LSiR2lFcBUTF065wq+H7SbvmfBrDVueH8o
 uWst6HtzN+ZuFmDW5geROYhkdnXrWR0CsnDiw8M/JHa1IK9CluO8RwQo+
 to3LNXX75DdF1PC+SulNKdpeCNy8wVe6yJTN/ZH6luS3nCOZjRKqxsTQl g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="234209466"
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="234209466"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 11:23:48 -0800
X-IronPort-AV: E=Sophos;i="5.90,160,1643702400"; d="scan'208";a="552872372"
Received: from swray-mobl1.ger.corp.intel.com (HELO intel.com) ([10.252.53.53])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2022 11:23:45 -0800
Date: Sun, 6 Mar 2022 21:23:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 3/7] drm/i915/gt: add gt_is_root() helper
Message-ID: <YiUKPl7Sa966t8kV@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-4-andi.shyti@linux.intel.com>
 <5cf0034a-fa60-0d80-b538-f070a166614c@intel.com>
 <9bf5b3df-dca9-285e-761f-572c6f9a37a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bf5b3df-dca9-285e-761f-572c6f9a37a7@intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej and Michal,

> > > The "gt_is_root(struct intel_gt *gt)" helper return true if the
> > > gt is the root gt, which means that its id is 0. Return false
> > > otherwise.
> > > 
> > > Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_gt.h | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> > > index 915d6192079b..f17f51e2d394 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> > > @@ -19,6 +19,11 @@ struct drm_printer;
> > >   		  ##__VA_ARGS__);					\
> > >   } while (0)
> > > +static inline bool gt_is_root(struct intel_gt *gt)
> > > +{
> > > +	return !gt->info.id;
> > > +}
> > > +
> > we could squash this patch with prev one, where it can be used in:
> > 
> >   intel_gt_tile_cleanup(struct intel_gt *gt)
> >   {
> >   	intel_uncore_cleanup_mmio(gt->uncore);
> > 
> > -	if (gt->info.id) {
> > +	if (!gt_is_root(gt)) {
> >   		kfree(gt->uncore);
> >   		kfree(gt);
> >   	}
> >   }
> 
> It can be used in intel_gt_tile_setup as well, and then you can remove id
> var.

I will move this before, then before patch 2 and use it where you
suggested, as well.

> > 
> > or just use it this way in this patch, with that:
> > 
> > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Accordingly:
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thank you!

Andi
