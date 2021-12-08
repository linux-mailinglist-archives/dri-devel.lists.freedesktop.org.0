Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047246D72A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 16:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB97B739D7;
	Wed,  8 Dec 2021 15:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1921D7339D;
 Wed,  8 Dec 2021 15:39:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="224721263"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="224721263"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 07:39:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="462803287"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.205])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 07:39:40 -0800
Date: Wed, 8 Dec 2021 21:09:22 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915: Sanitycheck device iomem on
 probe
Message-ID: <20211208153922.GC5006@intel.com>
References: <20211208145800.27246-1-ramalingam.c@intel.com>
 <20211208145800.27246-3-ramalingam.c@intel.com>
 <YbDN7pb6WUIWselA@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YbDN7pb6WUIWselA@intel.intel>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-08 at 17:23:26 +0200, Andi Shyti wrote:
> Hi Ram,
> 
> > +static int intel_memory_region_memtest(struct intel_memory_region *mem,
> > +				       void *caller)
> > +{
> > +	struct drm_i915_private *i915 = mem->i915;
> > +	int err = 0;
> > +
> > +	if (!mem->io_start)
> > +		return 0;
> > +
> > +	if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> > +		err = iomemtest(mem, caller);
> 
> I don't understand the debugging part of the iomemtest, if memory
> is failing we wouldn't relise if DEBUG_GEM is not enabled.
Thanks for the review Andi!

Since this is in the system init path, running the time taking mem
test only (on demand basis) when the DEBUG_GEM is set or mod_param
is set as per the next patch.

Ram
> 
> In any case,
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Andi
