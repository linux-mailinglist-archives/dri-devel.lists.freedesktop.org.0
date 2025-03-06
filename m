Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF1A54601
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9728610E91D;
	Thu,  6 Mar 2025 09:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UqK9OTqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792EE10E836;
 Thu,  6 Mar 2025 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741252383; x=1772788383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Fa3khYTsYb65t1eGIqtFP/8//326/NxcLm3FoWFgUpE=;
 b=UqK9OTqBXybm3lubgYz/+rXvESEwAO6+QGWdKuz1tKcpjTFFPuhYatSW
 EpPBf+vIXGOVtb9qy+SZP5BW7YNclJUFJJWwd/w0Lf3eztZUqOqtxYO95
 49TFCnJmqElJ2yBa0y9fC46V3I6jOzbfAz+zJTUeEB14I6uOkRLbAWj4W
 Y3yBq8P97rgCdGOZarhHRNEt9vGD2351h9zVe1Xjc1WeuGPmNii24zWdK
 kdA4xV7ApKRIzP1Q4PCVuTc8Whk0xOnfnJ1i6igZOh8fy8wzAcBUfNjUF
 Xr4yvCWYsqfjlHNob8lrEunLBas47fZljnc9ms+nOCUk/vUdv0pOmb/26 A==;
X-CSE-ConnectionGUID: gK4W3nlWS++liSibjQ/iDw==
X-CSE-MsgGUID: 3PjJAWvkT62flQa/kKWykQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53235039"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53235039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:13:02 -0800
X-CSE-ConnectionGUID: dFBNRtAfSS6CGP6FLmnZ9w==
X-CSE-MsgGUID: mAS1kDNERQ6UBT2LTMCvdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="156189644"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:12:58 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tq7Hi-000000004PZ-41p3; Thu, 06 Mar 2025 11:12:54 +0200
Date: Thu, 6 Mar 2025 11:12:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Yury Norov <yury.norov@gmail.com>,
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
Message-ID: <Z8lnFpkVTjpFHZtB@smile.fi.intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-4-1873dcdf6723@wanadoo.fr>
 <Z8hgqOB5Ym-GGykS@smile.fi.intel.com>
 <d7f3150d-0167-44be-90b2-17f8a050687c@wanadoo.fr>
 <Z8hyNXVZxLzhEzNy@smile.fi.intel.com>
 <824dc1d1-14f0-433e-aa3f-679527b87077@wanadoo.fr>
 <Z8isZodEqhZw5p7-@smile.fi.intel.com>
 <20250305215027.5d9be1fa@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250305215027.5d9be1fa@pumpkin>
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

On Wed, Mar 05, 2025 at 09:50:27PM +0000, David Laight wrote:
> On Wed, 5 Mar 2025 21:56:22 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 06, 2025 at 02:17:18AM +0900, Vincent Mailhol wrote:
> > > On 06/03/2025 at 00:48, Andy Shevchenko wrote:  
> > > > On Wed, Mar 05, 2025 at 11:48:10PM +0900, Vincent Mailhol wrote:  
> > > >> On 05/03/2025 at 23:33, Andy Shevchenko wrote:  
> > > >>> On Wed, Mar 05, 2025 at 10:00:16PM +0900, Vincent Mailhol via B4 Relay wrote:  

...

> > > >>>> +#define BIT_U8(b) (BIT_INPUT_CHECK(u8, b) + (unsigned int)BIT(b))
> > > >>>> +#define BIT_U16(b) (BIT_INPUT_CHECK(u16, b) + (unsigned int)BIT(b))  
> > > >>>
> > > >>> Why not u8 and u16? This inconsistency needs to be well justified.  
> > > >>
> > > >> Because of the C integer promotion rules, if casted to u8 or u16, the
> > > >> expression will immediately become a signed integer as soon as it is get
> > > >> used. For example, if casted to u8
> > > >>
> > > >>   BIT_U8(0) + BIT_U8(1)
> > > >>
> > > >> would be a signed integer. And that may surprise people.  
> > > > 
> > > > Yes, but wouldn't be better to put it more explicitly like
> > > > 
> > > > #define BIT_U8(b)	(BIT_INPUT_CHECK(u8, b) + (u8)BIT(b) + 0 + UL(0)) // + ULL(0) ?  
> > > 
> > > OK, the final result would be unsigned. But, I do not follow how this is
> > > more explicit.
> > > 
> > > Also, why doing:
> > > 
> > >   (u8)BIT(b) + 0 + UL(0)
> > > 
> > > and not just:
> > > 
> > >   (u8)BIT(b) + UL(0)
> > > 
> > > ?
> > > 
> > > What is that intermediary '+ 0' for?
> > > 
> > > I am sorry, but I am having a hard time understanding how casting to u8
> > > and then doing an addition with an unsigned long is more explicit than
> > > directly doing a cast to the desired type.  
> > 
> > Reading this again, I think we don't need it at all. u8, aka unsigned char,
> > will be promoted to int, but it will be int with a value < 256, can't be signed
> > as far as I understand this correctly.
> 
> The value can't be negative, but the type will be a signed one.

Yes, that's what I mentioned above: "int with the value < 256".

> Anything comparing types (and there are a few) will treat it as signed.
> It really is bad practise to even pretend you can have an expression
> (rather that a variable) that has a type smaller than 'int'.
> It wouldn't surprise me if even an 'a = b' assignment promotes 'b' to int.

We have tons of code with u8/u16, what you are proposing here is like
"let's get rid of those types and replace all of them by int/unsigned int".
We have ISAs that are byte-oriented despite being 32- or 64-bit platforms.

> So it is even questionable whether BIT8() and BIT16() should even exist at all.

The point is to check the boundaries and not in the returned value per se.

> There can be reasons to return 'unsigned int' rather than 'unsigned long'.
> But with the type definitions that Linux uses (and can't really be changed)
> you can have BIT32() that is 'unsigned int' and BIT64() that is 'unsigned long
> long'. These are then the same on 32bit and 64bit.

-- 
With Best Regards,
Andy Shevchenko


