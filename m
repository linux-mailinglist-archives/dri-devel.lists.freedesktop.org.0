Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45086FFF7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5287110FFE9;
	Mon,  4 Mar 2024 11:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f9CripOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A44E10FFE3;
 Mon,  4 Mar 2024 11:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709550684; x=1741086684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0T0lhm8LzcAdzbLDuBp+ZTGZjesoCjhi5zU7O8aSCKI=;
 b=f9CripOA53/9SXNGSz+zq2JlTMz1QpfLG06Rp8dFiiv6jRJJC3zGadXv
 URNX0JDSLzzLF4LrHSbcuVRwVHrSPJ7/SP/6wkmRw4odyWRzODjmthBZB
 er9wzOk5XBC8mIZFTyCFM83crmdnA9Ndfw5hijyTEFQlaeX5iPRvu0O2G
 UMhW6hh5f3kHo6RFGmZRTpLi2eQe3iWu3yGMkUj0fngd/K7sQXQimppR/
 A1v6DCvMTrOw8Yzhvu6kGXRnE7Y12n5bwgIO+xZ6Q11njjRPnLjVrfbuW
 Q896JnC3KpaUZDtusRcL3O6D5nJughBec5rh9OuJVqO+PFv8gQViBGWkI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4160899"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4160899"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="827773138"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="827773138"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Mar 2024 03:11:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 04 Mar 2024 13:11:17 +0200
Date: Mon, 4 Mar 2024 13:11:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nikita Kiryushin <kiryushin@ancud.ru>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Manasi Navare <manasi.d.navare@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm/i915: Remove unneeded double drm_rect_visible call
 in check_overlay_dst
Message-ID: <ZeWsVXhj1AUD4q3G@intel.com>
References: <> <79c92cfa-cf5a-4a23-8a93-11c1af7432fc@ancud.ru>
 <ZeB45WKv4lP8QQpv@intel.com>
 <ecfb0f31-a454-4a51-9fb8-9cd0aca3195c@ancud.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecfb0f31-a454-4a51-9fb8-9cd0aca3195c@ancud.ru>
X-Patchwork-Hint: comment
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

On Fri, Mar 01, 2024 at 09:56:41PM +0300, Nikita Kiryushin wrote:
> On 2/29/24 15:30, Ville Syrjälä wrote:
> > I prefer the current way where we have no side effects in
> > the if statement.
> >
> 
> This seem like a valid concern from readability and maintainability 
> standpoint. My patch was aimed mostly at performance and maintainability 
> using tools: some more pedantic analyzers are sensitive to non-checked 
> return values (as of now, drm_rect_intersect is ignored).
> 
> Would it be a better idea to make an update to the patch with second 
> drm_rect_visible call changed to an appropriately named state flag set 
> with drm_rect_intersect result?

I was thinking of maybe removing that drm_rect_visible() from
drm_rect_intersect() entirely, but looks like it's used fairly
extensively, so would require a bunch of work.

But now that I though about this I recalled that there was an earlier
patch trying to do exactly what you suggested in this patch. And looks
like there was a second version posted which I completely missed:
https://patchwork.freedesktop.org/series/115605/

While that does still have drm_rect_intersect() with its side effects
inside the if() I don't find it quite as objectionable since it's the
only thing in there. So it's a bit more obvious what is happening.
I've gone and merged that one.

Thanks for the patch regardless. At least I reminded me to look at the
earlier attempt ;)

> 
> BTW, the original patch somehow got mangled while it made its way to the 
> patchwork: source list line in patch got broken, which permits the patch 
> from being applied (the original version did not have that line break). 
> Any ideas how to prevent this happening with the second version of patch 
> (in case the idea is viable)?

-- 
Ville Syrjälä
Intel
