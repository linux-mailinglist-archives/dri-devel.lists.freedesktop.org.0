Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D106D4EBD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 19:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A160610E539;
	Mon,  3 Apr 2023 17:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D8510E534;
 Mon,  3 Apr 2023 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680542085; x=1712078085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VzR1NbRhU0x1GI1fw3Fm+1eH2rVLXuoWv28niCZxmKo=;
 b=M8qqJxa463EGHEeyvu7W6FIzl+EHC0jk53LpHFTQT/5TmPt1bhUyzGOo
 nfehw1csNwwnT4+tUM4E1c8HJmxazYIkNvEYFeUJ7WeEyZyVS2aQ5sEXc
 p/Z+WZGV2tYxP3A4PsI+j9CFzihOhnNCfPY9dZf63TuQNaGwnUEvKz3qh
 gctj4jYfzbDXvxYlXRTn77wmwBatESiW/K9Op8ZFyz4wrx4gW/i2tx1mW
 0sMI2H8QbMCkA9Q0iKoD5YniLWMKm//hcjt0YzpMPWra4aE9F/PzVwTSz
 fvikySm+W5hJKN4+iUSQ5NKrylTSFRlM5WyM4ZUTBgtb8mH+dKqJJirTp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428250997"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="428250997"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636190020"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="636190020"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga003.jf.intel.com with SMTP; 03 Apr 2023 10:14:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Apr 2023 20:14:40 +0300
Date: Mon, 3 Apr 2023 20:14:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
Subject: Re: [PATCH 5/7] drm/i915: use pat_index instead of cache_level
Message-ID: <ZCsJgNB1XY1yuq7Y@intel.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-6-fei.yang@intel.com>
 <ZCrntC9f1E0MZlXa@intel.com>
 <BYAPR11MB25675C7C3491973BB79379E29A929@BYAPR11MB2567.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR11MB25675C7C3491973BB79379E29A929@BYAPR11MB2567.namprd11.prod.outlook.com>
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
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 04:57:21PM +0000, Yang, Fei wrote:
> > Subject: Re: [PATCH 5/7] drm/i915: use pat_index instead of cache_level
> >
> > On Fri, Mar 31, 2023 at 11:38:28PM -0700, fei.yang@intel.com wrote:
> >> From: Fei Yang <fei.yang@intel.com>
> >> 
> >> Currently the KMD is using enum i915_cache_level to set caching policy for
> >> buffer objects. This is flaky because the PAT index which really controls
> >> the caching behavior in PTE has far more levels than what's defined in the
> >> enum.
> >
> > Then just add more enum values.
> 
> That would be really messy because PAT index is platform dependent, you would
> have to maintain many tables for the the translation.
> 
> > 'pat_index' is absolutely meaningless to the reader, it's just an
> > arbitrary number. Whereas 'cache_level' conveys how the thing is
> > actually going to get used and thus how the caches should behave.
> 
> By design UMD's understand PAT index. Both UMD and KMD should stand on the
> same ground, the Bspec, to avoid any potential ambiguity.
> 
> >> In addition, the PAT index is platform dependent, having to translate
> >> between i915_cache_level and PAT index is not reliable,
> >
> >If it's not realiable then the code is clearly broken.
> 
> Perhaps the word "reliable" is a bit confusing here. What I really meant to
> say is 'difficult to maintain', or 'error-prone'.
> 
> >> and makes the code more complicated.
> >
> > You have to translate somewhere anyway. Looks like you're now adding
> > translations the other way (pat_index->cache_level). How is that better?
> 
> No, there is no pat_index->cache_level translation.

i915_gem_object_has_cache_level() is exactly that. And that one
does look actually fragile since it assumes only one PAT index
maps to each cache level. So if the user picks any other pat_index
anything using i915_gem_object_has_cache_level() is likely to
do the wrong thing.

If we do switch to pat_index then I think cache_level should
be made a purely uapi concept, and all the internal code should
instead be made to query various aspects of the caching behaviour
of the current pat_index (eg. is LLC caching enabled, and thus
do I need to clflush?).

-- 
Ville Syrjälä
Intel
