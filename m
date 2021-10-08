Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23177426770
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 12:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229E36E0CA;
	Fri,  8 Oct 2021 10:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416876E0CA;
 Fri,  8 Oct 2021 10:15:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="223887058"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="223887058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 03:14:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="489406319"
Received: from laileona-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.209.155])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 03:14:53 -0700
Date: Fri, 8 Oct 2021 12:14:49 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Andi Shyti <andi@etezian.org>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/gt: move remaining debugfs interfaces into gt
Message-ID: <YWAaGdKXpSAaBfab@intel.intel>
References: <20211007230903.4084-1-andi@etezian.org>
 <CAKi4VAJ-HUR1=-VKeB0i21Q81i3aC00n2c-gp2zmw3ybeULUbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKi4VAJ-HUR1=-VKeB0i21Q81i3aC00n2c-gp2zmw3ybeULUbw@mail.gmail.com>
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

Hi Lucas,

> > I am reproposing this patch exactly as it was proposed initially
> > where the original interfaces are kept where they have been
> > originally placed. It might generate some duplicated code but,
> > well, it's debugfs and I don't see any issue. In the future we
> > can transform the upper interfaces to act upon all the GTs and
> > provide information from all the GTs. This is, for example, how
> > the sysfs interfaces will act.
> 
> NACK. We've made this mistake in the past for other debugfs files.
> We don't want to do it again just to maintain 2 separate places for
> one year and then finally realize we want to merge them.

In my opinion it's all about what mistake you like the most
because until we will have multi-gt support in upstream all the
patches come with the "promise" of a follow-up and maintenance
cost.

> > The reason I removed them in V1 is because igt as only user is
> > not a strong reason to keep duplicated code, but as Chris
> > suggested offline:
> >
> > "It's debugfs, igt is the primary consumer. CI has to be bridged over
> > changes to the interfaces it is using in any case, as you want
> > comparable results before/after the patches land.
> 
> That doesn't mean you have to copy and paste it. It may mean you
> do the implementation in one of them and the other calls that implementation.
> See how I did the deduplication in commit d0c560316d6f ("drm/i915:
> deduplicate frequency dump on debugfs")

In this case, from a user perspective, which gt is the interface
affecting? is it affecting all the system? or gt 0, 1...? Does
the user know? The maintenance cost is that later you will need
to use for_each_gt and make all those interfaces multitile, and
this would be your "promise".

How are you going to do it then? Will every interface iterate and
perform its own action? When you read, whad do you read? all the
gt values in 'or'? in 'and'? Is there any common strategy? Or
will we have inconsistent behaviors?

In sysfs (where we are left with the same questions) some times
ago I proposoed a common solution for all the upper level files
in order to provide the user with a consistent interface all
along the GTs.

This is my "promise" and until then it's just a matter of what
promise and what mistake you like the most.

> Alternative would be to prepare igt already and then add a Test-with:
> in this patch
> series.... But I think it makes more sense to support both locations
> for some time and then later
> remove the previous one.

Anyway, I can sure do something similar to how you did it, it
might look prettier but it doesn't exclude a follow-up
improvement.

Thanks for the review,
Andi
