Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBCB8AE1C0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 12:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2E610FB82;
	Tue, 23 Apr 2024 10:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M88zFfaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7243710FB64;
 Tue, 23 Apr 2024 10:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713866732; x=1745402732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JlqaQjHeeUnkbHgGAnCGAm0JwArhkJonGKKlfTLIK3A=;
 b=M88zFfaUtJBgmXpv+Bd9Gl1sdmOokATdu71+zRdhJXncvLL8dmyXEIQ9
 E2ku0CZJj+LXx1JdIvhnd08+1ZClsz8zFxd133hu8wZRPvg67IGiA1PK1
 oTItDYHqXShIA1pgbOKKyjoFBS/+qfqg7h7dq44K9t6hDyheRtiq8T6/B
 n4c0J0Kk2LocyOyx4iQntjUhQO9VsmBaSu7SXtZ5O8hVBPIsfHkelOJ7r
 AYfOzRHhe9PaKuFXZCw+RZMnNe2ucOsvSnpApp70hQRBHgd7G4SMC2Mw6
 hr6+ZTwfnjs2my6PRvRR07BmH3BjdxPMshWXNGYqDVzTfAtV1xKdDdG00 g==;
X-CSE-ConnectionGUID: oxNnmVsYTj6q2DAPldytiA==
X-CSE-MsgGUID: UtWcBbQBQ9661MLZ8DEJ6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="12375481"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="12375481"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:05:31 -0700
X-CSE-ConnectionGUID: ujT31sNvT8m43mBzGYsaFg==
X-CSE-MsgGUID: lSM4gHXyS1Ke78Nv+tXzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24763526"
Received: from unknown (HELO intel.com) ([10.247.119.79])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 03:05:19 -0700
Date: Tue, 23 Apr 2024 12:05:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915/gt: Refactor uabi engine class/instance list
 creation
Message-ID: <ZieH1WjOS8cyPfXl@ashyti-mobl2.lan>
References: <20240416224953.385726-1-andi.shyti@linux.intel.com>
 <3e69af0e-11e5-4bfc-8400-8ebbec7d34ef@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e69af0e-11e5-4bfc-8400-8ebbec7d34ef@linux.intel.com>
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

Hi Nirmoy,

On Tue, Apr 23, 2024 at 11:02:06AM +0200, Nirmoy Das wrote:
> On 4/17/2024 12:49 AM, Andi Shyti wrote:

...

>      void intel_engines_driver_register(struct drm_i915_private *i915)
>      {
>     -       u16 name_instance, other_instance = 0;
>     +       u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 2] = { };
> 
> +2 is confusing here. I think we need a better macro.

This is to avoid buffer overflow, otherwise we will always hit
the GEM_BUG_ON below.

>             struct legacy_ring ring = {};
>             struct list_head *it, *next;
>             struct rb_node **p, *prev;

...

>     +               GEM_BUG_ON(uabi_class >=
>     +                          ARRAY_SIZE(i915->engine_uabi_class_count));
>     +               i915->engine_uabi_class_count[uabi_class]++;
> 
> Shouldn't this be  i915->engine_uabi_class_count[uabi_class] =  class_instance
> [uabi_class]; ?

that's mostly a counter, we don't really need to be on sync with
the real instance of the engines.

> What I see is that this patch mainly adding this class_instance array and rest
> looks the same.
> May be it make sense to add other upcoming  patches to better understand why we
> need this patch.

yes, this patch simplifies the coming patches and the logic
inside, as well.

I just wanted to anticipate some of the refactorings so that we
could speed up the reviews. There is no functional change in
here, that's why I thought it was harmless.

Thanks for taking a look into it.

Andi
