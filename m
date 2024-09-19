Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1F97C8AA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 13:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DF510E2A3;
	Thu, 19 Sep 2024 11:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3+60WpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F384910E0B9;
 Thu, 19 Sep 2024 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726745616; x=1758281616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NcBJu+XqIX/R4VYua3akIQ8HJeyHuZX6IPvoC9kjjys=;
 b=H3+60WpTyYeXyifDlHCakEUxnzUfE3l4A7oxrEy/NxxfLsLvDjmfvfbF
 UDaX8pyFK3y3nv1qbSlLRnE3WftiOKE86o9PjBMUyHsAeLMkwlfoou+6l
 7QUxDn6qw84DhJqM5GQNh1x1JuiyHf2Lr1ydUVVPn03Au+hXJeqpy4O6o
 cKc03xsmoKLV0HyJ+E0GRhfL4EclQ0Oiu9We5TvlwG1L7/Dcagsz8zcNp
 qoG39Wy5gankexcevAZIsRFSommm9SsW3GGRB8b/KahqBW/u8Q8Td37D2
 f2XmlaZCqFACWST+JcdtCWPVdS+wkUb6d7EXlaKA6l1YqJENQ6PJdudsA Q==;
X-CSE-ConnectionGUID: S77YZzuJQOC5oPfgCZuO5A==
X-CSE-MsgGUID: Ug74nyRQQbKXbYnnQkBHwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="13591991"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="13591991"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:33:34 -0700
X-CSE-ConnectionGUID: zZYEQDG4Rwy98zuHscXtDw==
X-CSE-MsgGUID: u6yhHqTgRVeXh1tU9sAFgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74014577"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 04:33:30 -0700
Date: Thu, 19 Sep 2024 14:33:27 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v5 2/4] drm: Expose wedge recovery methods
Message-ID: <ZuwMB6LrO_7IW4j-@black.fi.intel.com>
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-3-raag.jadav@intel.com>
 <87msk6d8jw.fsf@intel.com> <ZuujCuVxFnOAKdgR@black.fi.intel.com>
 <87r09g9jp0.fsf@intel.com> <ZuvjGpIdOgGpbBQu@black.fi.intel.com>
 <87ikus9eti.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikus9eti.fsf@intel.com>
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

On Thu, Sep 19, 2024 at 12:24:09PM +0300, Jani Nikula wrote:
> On Thu, 19 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> > On Thu, Sep 19, 2024 at 10:38:51AM +0300, Jani Nikula wrote:
> >> On Thu, 19 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> >> > On Tue, Sep 17, 2024 at 10:49:07AM +0300, Jani Nikula wrote:
> >> >> On Tue, 17 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> >> >> >  
> >> >> > +extern const char *const wedge_recovery_opts[];
> >> >> 
> >> >> Data is not an interface. Please add a function for this.
> >> >
> >> > For a single user?
> >> 
> >> Yes.
> >> 
> >> Well, you kind of have two, and both places need to do bounds checking
> >> on indexing the array. You also need to do bounds checking on the string
> >> manipulation, you can't just strcat and assume it'll be all right.
> >
> > Which would be true if we were to receive an unknown string. Here we sorta
> > know it offhand so we're not gonna shoot in our foot :D
> 
> The thing about long term code maintenance is that "we know" often turns
> into "not too obvious" and "probably" somewhere down the line, as
> features get added and code gets refactored and moved about.
> 
> Here, it only takes a new, longer string, and failure to manually check
> that the lengths don't exceed the magic 32 bytes. Just be safe from the
> start, and you don't have to worry about it later.

On that note...

> > Anyway, would you prefer strlcat instead?
> 
> I think the cleaner option is:
> 
> 	char event_string[32];
> 
> 	snprintf(event_string, sizeof(event_string), "WEDGED=%s", wedge_name(method));
> 
> which is also what most other code constructing environments for
> kobject_uevent_env() do.

...should we use kasprintf instead of hardcoding size?

Raag
