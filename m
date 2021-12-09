Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C479446F1CE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9767B10E1DB;
	Thu,  9 Dec 2021 17:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FD710E1DB;
 Thu,  9 Dec 2021 17:26:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="298950809"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="298950809"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:26:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="516397649"
Received: from achlenov-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.252.52.59])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:26:04 -0800
Date: Thu, 9 Dec 2021 19:26:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 01/11] drm/i915: Store backpointer to GT
 in uncore
Message-ID: <YbI8KBKFMSjWhEKl@intel.intel>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
 <20211209132512.47241-2-andi.shyti@linux.intel.com>
 <87ilvx3dz9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilvx3dz9.fsf@intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

thanks for looking at it.

> > -	intel_gt_init_early(&dev_priv->gt, dev_priv);
> > +	__intel_gt_init_early(&dev_priv->gt, dev_priv);
> 
> Why double underscores here? It looks like it's supposed to be internal
> to intel_gt, not to be called by anyone else.

I forgot to write two lines in the commit log about this.

It's a temporary solution that will go away in the next patch
series[*].

The reason for it is because at this point I need to break the
early initialization of the gt into two parts. In the specific
the '__intel_gt_init_early' assigns the i915 private data and the
uncore.

It's not pretty, but, knowing what's coming next, it's the change
with the smallest impact.

> >  
> >  	i915_gem_init_early(dev_priv);
> >  

Thank you,
Andi

[*] https://patchwork.freedesktop.org/patch/464475/?series=97352&rev=1
