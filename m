Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E6B8C27C3
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 17:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310D510E52E;
	Fri, 10 May 2024 15:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0oBaUaS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF43A10E52E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715354943; x=1746890943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=glm6K5/Xk0wjpLSBdU0Yd+zs1pppGMGVEKiFN3HdM7c=;
 b=V0oBaUaSq3vQI6HDPV+CA0n861nzJC4MGRiWQsUiRx0NcHb9icvRPJgs
 apUVxpX+B8GJs6qBcDPizB740Qm3uu1jrZFMtop2fHJhQuBL42Wv0ZYn5
 RfXarzGduYNhrQq01bHBMLvEiWQQ/2Cpug1PgWkHfy7jLZexlYAyK6Ndx
 Sy5wE5yjJs97zHnYlYupx8X4wMGiHwIHO7wb6aL0STvRPhmptcqzFn17+
 v185yoCnHeNJewDeuMmIV8VEDS/kFQvhR+1osCfJtxN8pZElIkw0dsjSl
 zWkN8Xwq/erC1AG1rtJO4fqD7W4Xw9SbYQBKBlDa4uBYk7DuhHddWIUS5 w==;
X-CSE-ConnectionGUID: aX3358RXS/CvDHqcOPxRMg==
X-CSE-MsgGUID: KdhmdWpSRpayykdnYvHweg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28825466"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28825466"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:29:03 -0700
X-CSE-ConnectionGUID: ww4RHDtNREOiGbN3Z/4+6Q==
X-CSE-MsgGUID: YuXYbDQITCqLG7bhB9KUqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29757874"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:28:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s5SB2-0000000695W-188w; Fri, 10 May 2024 18:28:52 +0300
Date: Fri, 10 May 2024 18:28:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
 sebastian.fricke@collabora.com, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, adobriyan@gmail.com,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
 p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
 nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <Zj49M4ZwSChNRuXs@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
 <Zj42vTpyH71TWeTk@smile.fi.intel.com> <87fruphf55.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fruphf55.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 10, 2024 at 06:15:34PM +0300, Jani Nikula wrote:
> On Fri, 10 May 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, May 10, 2024 at 12:09:52AM +0530, Devarsh Thakkar wrote:
> >> Add macros to round to nearest specified power of 2.
> >
> > This is not what they are doing. For the above we already have macros defined.
> >
> >> Two macros are added :
> >
> > (Yes, after I wrapped to comment this line looks better on its own,
> >  so whatever will be the first sentence, this line should be separated
> >  from.)
> >
> >> round_closest_up and round_closest_down which round up to nearest multiple
> >
> > round_closest_up() and round_closest_down()
> >
> >
> >> of 2 with a preference to round up or round down respectively if there are
> >> two possible nearest values to the given number.
> >
> > You should reformulate, because AFAICS there is the crucial difference
> > from these and existing round_*_pow_of_two().
> 
> Moreover, I think the naming of round_up() and round_down() should have
> reflected the fact that they operate on powers of 2. It's unfortunate
> that the difference to roundup() and rounddown() is just the underscore!
> That's just a trap.

FYI:
https://stackoverflow.com/questions/58139219/difference-of-align-and-round-up-macro-in-the-linux-kernel

> So let's perhaps not repeat the same with round_closest_up() and
> round_closest_down()?


-- 
With Best Regards,
Andy Shevchenko


