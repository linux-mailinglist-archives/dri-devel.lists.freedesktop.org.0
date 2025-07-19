Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E03B0B0C5
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 17:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2432310E214;
	Sat, 19 Jul 2025 15:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQpvJ/VI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9605F10E047;
 Sat, 19 Jul 2025 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752940367; x=1784476367;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xTbC8e2ci4SFEuMZIL/U9dGp9KlAJ2KunCZEBYWZfy0=;
 b=fQpvJ/VIHO3+mMRSrh+FwNd6OmC7uLaofO4Ug3KxV1WBB84NBtSwMJXq
 bFTdUElJBKq7basMXCu3B7qPinOj6TAFGzpGgw/Ct7nx/Myri2jKFSnSW
 +677OylkdXl02LSGFxdX8qr3k2/J8hw8Bj0aJOWuWcCFsjE+gk8JbxyLJ
 b5sc2QYq30BleJn4MlaMOZqW6tNMeiA9kO+r6MK+xj0CEd2ruBH45XILB
 oubgTLybIsUqMR/5wYoWlPHMKi9maS6Ud9ML90TJRu+5wJlPUBe0B5lQm
 2WGrWGpMylO/eST9qh94HSjHiAkc7ykaTcemIPIWdHa251WG9Zjtpb0wY w==;
X-CSE-ConnectionGUID: 2XCgI6LfQtuKRp95fF85rQ==
X-CSE-MsgGUID: NH7lZWmYTQuDo78WRvUy9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="77746613"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; d="scan'208";a="77746613"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 08:52:47 -0700
X-CSE-ConnectionGUID: 1H0W9nM9SrOYhVwb5zICQA==
X-CSE-MsgGUID: N0C6cL2mS3+vQ63YVjKQAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; d="scan'208";a="164104452"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.152])
 by orviesa005.jf.intel.com with SMTP; 19 Jul 2025 08:52:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 19 Jul 2025 18:52:42 +0300
Date: Sat, 19 Jul 2025 18:52:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Naveen Kumar <naveen1.kumar@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mdaenzer@redhat.com, sebastian.wick@redhat.com, jadahl@gmail.com
Subject: Re: [PATCH] drm/i915/display: Allow async flips on planes with no
 framebuffer changes
Message-ID: <aHu_SsrCUJTzPhmd@intel.com>
References: <20250707154121.74969-1-naveen1.kumar@intel.com>
 <aHAg2J-uFLLWINqp@intel.com>
 <CAFZQkGwKs04zJ0y2VuwVJkiKH6Z00dZoYGroWS6R=Qux_n0iJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFZQkGwKs04zJ0y2VuwVJkiKH6Z00dZoYGroWS6R=Qux_n0iJQ@mail.gmail.com>
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

On Sat, Jul 19, 2025 at 02:16:22AM +0200, Xaver Hugl wrote:
> Am Do., 10. Juli 2025 um 22:21 Uhr schrieb Ville Syrjälä
> <ville.syrjala@linux.intel.com>:
> >
> > On Mon, Jul 07, 2025 at 03:41:20PM +0000, Naveen Kumar wrote:
> > > Allow asynchronous page flips on planes that either lack a framebuffer or
> > > retain the same framebuffer, as long as no plane properties are modified.
> > >
> > > This avoids unnecessary failures in async flip paths when the update is
> > > effectively a no-op, improving compatibility with some compositors.
> >
> > IMO what we want to do is make the drm core filter out all the garbage
> > from the commit. That way the driver would only see the planes that are
> > supposed to actually participate in the async flip.
> 
> That sounds like a good goal, but I think it'll need some extra care
> to avoid regressions. For example, "no-op" pageflips must still
> trigger pageflip events, and affect the refresh rate with adaptive
> sync.

Not for async commit via the atomic ioctl. That's where I'd want
the filtering.

For sync commit nothing can really be filtered by the core code
because side effects must be observed, and only the driver knows
what all the side effects are.

-- 
Ville Syrjälä
Intel
