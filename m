Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88AD871A97
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12A21129DE;
	Tue,  5 Mar 2024 10:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKMcoSjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD59A1129DE;
 Tue,  5 Mar 2024 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709633940; x=1741169940;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BF/pBSiXdbQyOEIM8kTA33A2GgG45f64qyPk+qc59Eg=;
 b=UKMcoSjCvXi1ZMAzcg9A7qbPiizNYzspE9XO8FeE4Pbiyns1fIatZG89
 I3XFZKaHrvdFFBYQtc3tOsRKSzdYZ7XJr5qQzjkGz2n+6qGHrNzNeKfxC
 3sNoid7cV5NspmM5hI17+hFgfqlDQsG5vXbOPpCPytTW8nZMipdRMkZI1
 IaDZ4MKIBXMcB7NWUTHS/jfsJLpoPwwioJBoAbn3AevHL93p4YViWiZRu
 /cXPXfy6bUTtjUGdEBAucznqU1XJQ9uPDVzK0WmOKW9k+dE1AsG0IlrOC
 DdhJfDuAffSIr4tqYeHjAWYazFYcxvBoS4YmXgMrxzNZCwsOsdtsyNkPt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14821807"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14821807"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:18:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14003443"
Received: from unknown (HELO intel.com) ([10.247.118.75])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 02:18:52 -0800
Date: Tue, 5 Mar 2024 11:18:45 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [PATCH v3 1/4] drm/i915/gt: Refactor uabi engine class/instance
 list creation
Message-ID: <ZebxhWK4axnMdLDd@ashyti-mobl2.lan>
References: <20240229232859.70058-1-andi.shyti@linux.intel.com>
 <20240229232859.70058-2-andi.shyti@linux.intel.com>
 <170963369058.35653.11240745207600457716@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170963369058.35653.11240745207600457716@jlahtine-mobl.ger.corp.intel.com>
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

Hi Joonas,

...

> >  void intel_engines_driver_register(struct drm_i915_private *i915)
> >  {
> > -       u16 name_instance, other_instance = 0;
> > +       u16 class_instance[I915_LAST_UABI_ENGINE_CLASS + 1] = { };
> 
> Do you mean this to be size I915_LAST_UABI_ENGINE_CLASS + 2? Because ...

Yes, this is an oversight. I was playing around with indexes to
optimize the code a bit more and I forgot to restore this back.

Thanks,
Andi

> <SNIP>
> 
> > @@ -222,15 +224,14 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
> >  
> >                 GEM_BUG_ON(engine->class >= ARRAY_SIZE(uabi_classes));
> >                 engine->uabi_class = uabi_classes[engine->class];
> > -               if (engine->uabi_class == I915_NO_UABI_CLASS) {
> > -                       name_instance = other_instance++;
> > -               } else {
> > -                       GEM_BUG_ON(engine->uabi_class >=
> > -                                  ARRAY_SIZE(i915->engine_uabi_class_count));
> > -                       name_instance =
> > -                               i915->engine_uabi_class_count[engine->uabi_class]++;
> > -               }
> > -               engine->uabi_instance = name_instance;
> > +
> > +               if (engine->uabi_class == I915_NO_UABI_CLASS)
> > +                       uabi_class = I915_LAST_UABI_ENGINE_CLASS + 1;
> 
> .. otherwise this ...
> 
> > +               else
> > +                       uabi_class = engine->uabi_class;
> > +
> > +               GEM_BUG_ON(uabi_class >= ARRAY_SIZE(class_instance));
> 
> .. will trigger this assertion?
> 
> Regards, Joonas
