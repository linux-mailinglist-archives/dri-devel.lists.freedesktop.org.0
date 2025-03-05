Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953B5A503C4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B2B10E7CA;
	Wed,  5 Mar 2025 15:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nxy9QdBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A3710E7C7;
 Wed,  5 Mar 2025 15:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741189695; x=1772725695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PYXpyrvj59Rr+s6Viq0NdMfzWxntWWdSb5icZCvFr1k=;
 b=Nxy9QdBBv/hR3dmWv2f/DcJV8ET++szOqpgZyUQCIRH16agd3xyLs3oS
 F2z6gVNe1zxwCs/qfeWtj3f9LHIHeyQmO1WMkEQl0IRXZ9mrUGgIGCwqE
 Vs9WJmu9EKJfkkuHnc9/qS04eHbvk7NOJqh3QSrIG6BKo+rPnwxseGYA5
 uvjZ0gh6N9Uth0J2c8BhOum7m66u9Xdzo5YvVHDaEEKR7PW/GNMe7RTzZ
 93iq7+r9Nh+CnWZfNIPlRaR7Qb/NrpNns0BBDFMLjRCyn0RdHlRWCl/iT
 RvSIqUxqwsA49yJ8ZxMWkak0lGXjxNv+EFU25tlzYi/9n0APZxMJZrigW g==;
X-CSE-ConnectionGUID: NXYcp9JTSCCnKRe/79AHag==
X-CSE-MsgGUID: KXiF7ExOSp2Qm/YyLFFF0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59703953"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59703953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:48:13 -0800
X-CSE-ConnectionGUID: pWMuf/kOQ0ynRaGTKOE2Rg==
X-CSE-MsgGUID: A6V0KezpQMaHNoqhGG1fQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118647762"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 07:48:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tpqyb-0000000HSFo-2v5I; Wed, 05 Mar 2025 17:48:05 +0200
Date: Wed, 5 Mar 2025 17:48:05 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 4/8] bits: introduce fixed-type BIT
Message-ID: <Z8hyNXVZxLzhEzNy@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-4-1873dcdf6723@wanadoo.fr>
 <Z8hgqOB5Ym-GGykS@smile.fi.intel.com>
 <d7f3150d-0167-44be-90b2-17f8a050687c@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f3150d-0167-44be-90b2-17f8a050687c@wanadoo.fr>
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

On Wed, Mar 05, 2025 at 11:48:10PM +0900, Vincent Mailhol wrote:
> On 05/03/2025 at 23:33, Andy Shevchenko wrote:
> > On Wed, Mar 05, 2025 at 10:00:16PM +0900, Vincent Mailhol via B4 Relay wrote:

...

> >> +#define BIT_U8(b) (BIT_INPUT_CHECK(u8, b) + (unsigned int)BIT(b))
> >> +#define BIT_U16(b) (BIT_INPUT_CHECK(u16, b) + (unsigned int)BIT(b))
> > 
> > Why not u8 and u16? This inconsistency needs to be well justified.
> 
> Because of the C integer promotion rules, if casted to u8 or u16, the
> expression will immediately become a signed integer as soon as it is get
> used. For example, if casted to u8
> 
>   BIT_U8(0) + BIT_U8(1)
> 
> would be a signed integer. And that may surprise people.

Yes, but wouldn't be better to put it more explicitly like

#define BIT_U8(b)	(BIT_INPUT_CHECK(u8, b) + (u8)BIT(b) + 0 + UL(0)) // + ULL(0) ?

Also, BIT_Uxx() gives different type at the end, shouldn't they all be promoted
to unsigned long long at the end? Probably it won't work in real assembly.
Can you add test cases which are written in assembly? (Yes, I understand that it will
be architecture dependent, but still.)

> David also pointed this in the v3:
> 
> https://lore.kernel.org/intel-xe/d42dc197a15649e69d459362849a37f2@AcuMS.aculab.com/
> 
> and I agree with his comment.
> 
> I explained this in the changelog below the --- cutter, but it is
> probably better to make the explanation more visible. I will add a
> comment in the code to explain this.
> 
> >> +#define BIT_U32(b) (BIT_INPUT_CHECK(u32, b) + (u32)BIT(b))
> >> +#define BIT_U64(b) (BIT_INPUT_CHECK(u64, b) + (u64)BIT_ULL(b))

-- 
With Best Regards,
Andy Shevchenko


