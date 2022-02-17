Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732CC4BA506
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF7C10EAEA;
	Thu, 17 Feb 2022 15:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85CC10EADE;
 Thu, 17 Feb 2022 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645113243; x=1676649243;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=feiIE8hKQ7xOTurPToJ7wkzWqz3KqfWns/T191tEu1c=;
 b=Qbs6jasBXbBQ/AIf7r6cv9n+A72a2rCHeGHSAUhUrw5BjJil3WTfS9sL
 M5rt4P7ALCE5CcyFuzY9MAFyUsqAUvWRkLWgEw1L5HrEsJ7hROrnWz3lA
 N2KBHa5TWKACX+3eISdD3UeZwcA/ca88WlcCxAT3I8eZwsJahJ8fixd/n
 w5hpNmcGMU4VCFxY2RVm+IVVg8G492KZR5ktPqLxrQSEz8qxB/OUUE2QE
 tsz9oWznnTfKcpun/U3ehxghGRPRXlElI20vsdbacbNnyZSRDfl1SP7sP
 TtPBAINxx/cicponjiEkn3gqbbcznEwLmiN1OT9RwAiPjNvSFz7hKRtXo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="249737135"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="249737135"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 07:54:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545672799"
Received: from pkivi-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.43.228])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 07:54:00 -0800
Date: Thu, 17 Feb 2022 16:53:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 5/7] drm/i915/gt: Create per-tile RC6
 sysfs interface
Message-ID: <Yg5vlgoTEfJRWP9U@intel.intel>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-6-andi.shyti@linux.intel.com>
 <12c2fcf8-ef3b-e59c-fe1e-23bc8f12cfe5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12c2fcf8-ef3b-e59c-fe1e-23bc8f12cfe5@linux.intel.com>
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

> > Now tiles have their own sysfs interfaces under the gt/
> > directory. Because RC6 is a property that can be configured on a
> > tile basis, then each tile should have its own interface
> > 
> > The new sysfs structure will have a similar layout for the 4 tile
> > case:
> > 
> > /sys/.../card0
> >           ├── gt
> >           │   ├── gt0
> >           │   │   ├── id
> >           │   │   ├── rc6_enable
> >           │   │   ├── rc6_residency_ms
> >           .   .   .
> >           .   .   .
> >           .   .
> >           │   └── gtN
> >           │       ├── id
> >           │       ├── rc6_enable
> >           │       ├── rc6_residency_ms
> >           │       .
> >           │       .
> >           │
> >           └── power/                -+
> >                ├── rc6_enable        |    Original interface
> >                ├── rc6_residency_ms  +->  kept as existing ABI;
> >                .                     |    it multiplexes over
> >                .                     |    the GTs
> >                                     -+
> > 
> > The existing interfaces have been kept in their original location
> > to preserve the existing ABI. They act on all the GTs: when
> > reading they provide the average value from all the GTs.
> 
> Average feels very odd to me. I'd ask if we can get away providing an errno
> instead? Or tile zero data?

Real multiplexing would be providing something when reading and
when writing. The idea of average came while revieweing with
Chris the write multiplexing. Indeed it makes sense to provide
some common value, but I don't know how useful it can be to the
user (still if the user needs any average).

Joonas, Chris... any idea?

> Case in point, and please correct me if I am wrong, legacy rc6_enable
> returns tile zero, while residency returns average.

As the interface is done now, the rc6_enable is just returning
whether the gpu (i.e. i915, not gt) supports RC6 or not. I think
there is a patch later.

> Even the deprecated message gets logged with every access right?
> 
> Btw is the deperecated message limited to multi-tile platforms (can't see
> that it is) and what is the plan for that?

yes, at this point the message would need to be removed and I
forgot to do it.

> It's a tough problem, no easy answers even after all this time. :D

yeah! quite hard to get it conceptually right!

Thanks Tvrtko,
Andi
