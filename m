Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC4C4B836F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB0410E9C1;
	Wed, 16 Feb 2022 08:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D2610E9CF;
 Wed, 16 Feb 2022 08:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645001785; x=1676537785;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vT07H/KR5z14mAxdyha9EhAw5XBO5ie4tmnFoY3of4I=;
 b=XbMek5XoFwleOEnoVeqgkibarSGD6rFVC7y410GO0nGJT+2DeBjXkFZg
 mKGE1GsGOoz0bzLLBGINZ92SSeSl01P41CrcTXS7DybE7xeQmW2tnFyet
 sljVfUpvonI7jb+ctTztEiMQJoRMQqqjhOz/OTSo/3DrMwSC0uZLqKA62
 vDRkvQR0+xvVgMfSthCTzWFWGtd8LpV8AH5L1w9+vNHDT1jMIoCgPE6uV
 MbqN0OmKsTcUwSKe0lJnAkfolE6QGOxPNhPZce0aZ9qes1nkTf4O2qL8D
 5UMejFK2Zjwbw1xEkAZpnwqvTe5PgaemsIV2ix/wF6gDWNDKBhsjUWcR4 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250757053"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="250757053"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:55:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="529345731"
Received: from rbilei-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.13.113])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:55:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] drm/i915/selftests: Replace too verbose for-loop
 with simpler while
In-Reply-To: <Ygv32CptVknidyP3@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220215163213.54917-1-andriy.shevchenko@linux.intel.com>
 <87o83859x2.fsf@intel.com> <Ygv32CptVknidyP3@smile.fi.intel.com>
Date: Wed, 16 Feb 2022 10:55:11 +0200
Message-ID: <87leyb5gy8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Feb 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Feb 15, 2022 at 07:14:49PM +0200, Jani Nikula wrote:
>> On Tue, 15 Feb 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>> > It's hard to parse for-loop which has some magic calculations inside.
>> > Much cleaner to use while-loop directly.
>> 
>> I assume you're trying to prove a point following our recent
>> for-vs-while loop discussion. I really can't think of any other reason
>> you'd end up looking at this file or this loop.
>> 
>> With the change, the loop indeed becomes simpler, but it also runs one
>> iteration further than the original. Whoops.
>
> Yeah, sorry for that, the initial condition should be d = depth - 1,
> of course.

Well, no, the condition should be while (--i) instead to also match the
values the original loop takes. ;D

Cheers,
Jani.


>
>> It's a selftest. The loop's been there for five years. What are we
>> trying to achieve here? So we disagree on loops, fine. Perhaps this is
>> not the best use of either of our time? Please just let the for loops in
>> i915 be.
>
> Yes, I'm pretty much was sure that no-one will go and apply this anyway
> (so I haven't paid too much attention), but to prove my point in the
> certain discussion.
>
> And yes, the point is for the new code, I'm not going to change existing
> suboptimal and too hard to read for-loops, it will consume my time later
> when I will try to understand the code.

-- 
Jani Nikula, Intel Open Source Graphics Center
