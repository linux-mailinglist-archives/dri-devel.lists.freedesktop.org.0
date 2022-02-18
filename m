Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391CD4BB565
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BC810F142;
	Fri, 18 Feb 2022 09:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300F810F141;
 Fri, 18 Feb 2022 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645176093; x=1676712093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=su/3T94pVDNsaL5hedw6oR2jhqFC6VvwaIdbglb4bg0=;
 b=WdtkrdI7gXrVKMz8NwoKGi44g3zJvWg8kyDM8ipcX/lKacKDMyg3eB+5
 KHaQDdGx0GWAltiW/ZRnYRDrizHVvhrSUE5LZUlv2UfWMKIRCGkHDPmUz
 ZZT7+96SP8FPQyx/lQ8N03sFak4+DSo9Gfpsg5KmGiP1RgCIVNBrkmdaL
 ds1+FHZTHLRlgsMTZXG+FAtN73I7MZTRvV+eiKBsMsI5pU/pBKx9CMvO/
 KxoWoWJVgOWvRz1o7hMiGJkbE5AENgfujsAu7u1MruYktigvL/9RhUExs
 eZ0Q++fAabx1haQbltBzZsQNDobW4mFjfU4ljFUql1XqUWFUQX3NkI0Io g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="248687127"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="248687127"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 01:21:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="546205177"
Received: from dkalinic-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 01:21:30 -0800
Date: Fri, 18 Feb 2022 10:21:26 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6
 sysfs interface
Message-ID: <Yg9lFn2SFR4WwmOV@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-6-andi.shyti@linux.intel.com>
 <12c2fcf8-ef3b-e59c-fe1e-23bc8f12cfe5@linux.intel.com>
 <Yg5vlgoTEfJRWP9U@intel.intel>
 <57edfc5a-a330-8661-1509-b375f67b495e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57edfc5a-a330-8661-1509-b375f67b495e@linux.intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> > > > Now tiles have their own sysfs interfaces under the gt/
> > > > directory. Because RC6 is a property that can be configured on a
> > > > tile basis, then each tile should have its own interface
> > > > 
> > > > The new sysfs structure will have a similar layout for the 4 tile
> > > > case:
> > > > 
> > > > /sys/.../card0
> > > >            ├── gt
> > > >            │   ├── gt0
> > > >            │   │   ├── id
> > > >            │   │   ├── rc6_enable
> > > >            │   │   ├── rc6_residency_ms
> > > >            .   .   .
> > > >            .   .   .
> > > >            .   .
> > > >            │   └── gtN
> > > >            │       ├── id
> > > >            │       ├── rc6_enable
> > > >            │       ├── rc6_residency_ms
> > > >            │       .
> > > >            │       .
> > > >            │
> > > >            └── power/                -+
> > > >                 ├── rc6_enable        |    Original interface
> > > >                 ├── rc6_residency_ms  +->  kept as existing ABI;
> > > >                 .                     |    it multiplexes over
> > > >                 .                     |    the GTs
> > > >                                      -+
> > > > 
> > > > The existing interfaces have been kept in their original location
> > > > to preserve the existing ABI. They act on all the GTs: when
> > > > reading they provide the average value from all the GTs.
> > > 
> > > Average feels very odd to me. I'd ask if we can get away providing an errno
> > > instead? Or tile zero data?
> > 
> > Real multiplexing would be providing something when reading and
> > when writing. The idea of average came while revieweing with
> > Chris the write multiplexing. Indeed it makes sense to provide
> > some common value, but I don't know how useful it can be to the
> > user (still if the user needs any average).
> > 
> > Joonas, Chris... any idea?
> > 
> > > Case in point, and please correct me if I am wrong, legacy rc6_enable
> > > returns tile zero, while residency returns average.
> > 
> > As the interface is done now, the rc6_enable is just returning
> > whether the gpu (i.e. i915, not gt) supports RC6 or not. I think
> > there is a patch later.
> > 
> > > Even the deprecated message gets logged with every access right?
> > > 
> > > Btw is the deperecated message limited to multi-tile platforms (can't see
> > > that it is) and what is the plan for that?
> > 
> > yes, at this point the message would need to be removed and I
> > forgot to do it.
> 
> Maybe it is correct to have it, I don't know at this point. Is the plan to
> remove the warning everywhere, or only have it on multi-tile platforms, or
> new platforms? And/or remove legacy files after a while on all platforms, or
> just new ones?

At this point I guess the warning should be removed from
everywhere (i.e.  only those RC6 and RPS interfaces that are
duplicated/multiplexed).

We shouldn't be supposed to need more usage of multiplexed
interfaces in the future (maybe just rc6 enable, but I don't see
it really necessary).

Thanks,
Andi
