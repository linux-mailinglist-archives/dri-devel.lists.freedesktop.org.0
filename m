Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9984506AC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97156EE03;
	Mon, 15 Nov 2021 14:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669E66EDFE;
 Mon, 15 Nov 2021 14:22:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="220657806"
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="220657806"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 06:22:15 -0800
X-IronPort-AV: E=Sophos;i="5.87,236,1631602800"; d="scan'208";a="566466218"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 06:22:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mmcrx-0077Cm-Ex; Mon, 15 Nov 2021 16:22:01 +0200
Date: Mon, 15 Nov 2021 16:22:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v1 1/3] string: Consolidate yesno() helpers under
 string.h hood
Message-ID: <YZJtCZm7YoBBoqUz@smile.fi.intel.com>
References: <20210215142137.64476-1-andriy.shevchenko@linux.intel.com>
 <20211005213423.dklsii4jx37pjvb4@ldmartin-desk2>
 <YZI/VB+RhScL1wAi@smile.fi.intel.com> <874k8d3ard.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874k8d3ard.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 amd-gfx@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Leo Li <sunpeng.li@amd.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Raju Rangoju <rajur@chelsio.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 01:43:02PM +0200, Jani Nikula wrote:
> On Mon, 15 Nov 2021, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 05, 2021 at 02:34:23PM -0700, Lucas De Marchi wrote:
> >> On Mon, Feb 15, 2021 at 04:21:35PM +0200, Andy Shevchenko wrote:
> >> > We have already few similar implementation and a lot of code that can benefit
> >> > of the yesno() helper.  Consolidate yesno() helpers under string.h hood.
> >> 
> >> I was taking a look on i915_utils.h to reduce it and move some of it
> >> elsewhere to be shared with others.  I was starting with these helpers
> >> and had [1] done, then Jani pointed me to this thread and also his
> >> previous tentative. I thought the natural place for this would be
> >> include/linux/string_helpers.h, but I will leave it up to you.
> >
> > Seems reasonable to use string_helpers (headers and/or C-file).
> >
> >> After reading the threads, I don't see real opposition to it.
> >> Is there a tree you plan to take this through?
> >
> > I rest my series in favour of Jani's approach, so I suppose there is no go
> > for _this_ series.
> 
> If you want to make it happen, please pick it up and drive it. I'm
> thoroughly had enough of this.

My point is still the same, so it's more to Lucas.

I'm not going to drive this activity due to lack of time.

> >> [1] https://lore.kernel.org/lkml/20211005212634.3223113-1-lucas.demarchi@intel.com/T/#u

-- 
With Best Regards,
Andy Shevchenko


