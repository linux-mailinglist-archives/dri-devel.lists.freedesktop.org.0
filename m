Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CFA4FC920
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39BAD10E1A3;
	Tue, 12 Apr 2022 00:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC03510E18C;
 Tue, 12 Apr 2022 00:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649722389; x=1681258389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZrA6IPSlpMeV5apEVTbTswcV8UyOWEgiAiQFjIRQHGM=;
 b=SJYfIGb27DOQy3CQE1sbn59/iIT7i4SqVTiVEOi+COdSAWog5Wi2hmVN
 BD/3lwbSFClDV5vU+2T+OXkd9MYpG8v5hVZpav8yqfOdXweJYKXVcxjIM
 n8kjwK/Kc9ISVHKj8PvdJLB6vvvYF1a7Ns/oQVDHY23l/oWtWj9QGKDA3
 BMqJDXsZNNlYB1ZPuq0P4aQ21ATkKanad6rX+LcBJOQqhde/moLQtXDHe
 N2DHkZgUV2WCEpCmaiIlxsCuZqgCrLul4Ulr+cEBW/9BGkss2UY1HvBnj
 7MNuwK3XCpUuy6ZAQXhsz7pFsC3tDDXMEkoWLN2TSx6TonN6rNaswWIBv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="242830493"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="242830493"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:13:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="644489923"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 17:13:09 -0700
Date: Mon, 11 Apr 2022 17:13:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Francisco Jerez <currojerez@riseup.net>
Subject: Re: [PATCH v4 RFC] drm/i915/uapi: Add
 DRM_I915_QUERY_GEOMETRY_SUBSLICES
Message-ID: <YlTEFJicjghWYed+@mdroper-desk1.amr.corp.intel.com>
References: <20220330215311.21849-1-matthew.s.atwood@intel.com>
 <YkX7hTrEZN53MN+z@phenom.ffwll.local> <87czi0fnv5.fsf@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czi0fnv5.fsf@riseup.net>
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
Cc: vrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 Matt Atwood <matthew.s.atwood@intel.com>, dri-devel@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 03:19:26PM -0700, Francisco Jerez wrote:
> Daniel Vetter <daniel@ffwll.ch> writes:
> 
> > On Wed, Mar 30, 2022 at 02:53:11PM -0700, Matt Atwood wrote:
...
> >> @@ -2718,6 +2719,9 @@ struct drm_i915_query_item {
> >>  	 *	- DRM_I915_QUERY_PERF_CONFIG_LIST
> >>  	 *      - DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID
> >>  	 *      - DRM_I915_QUERY_PERF_CONFIG_FOR_UUID
> >> +	 *
> >> +	 * When query_id == DRM_I915_QUERY_GEOMETRY_SUBSLICES must have a valid
> >> +	 * i915_engine_class_instance struct.
> 
> It would also be worth adding to the documentation that the specified engine
> must be a render engine instance.
> 
> >>  	 */
> >>  	__u32 flags;
> >>  #define DRM_I915_QUERY_PERF_CONFIG_LIST          1
> >> @@ -2776,16 +2780,20 @@ struct drm_i915_query {
> >>  };
> >>  
> >>  /*
> >
> > Can we please include this in the kerneldoc, and also make sure that the
> > queries are nicely all listed somewhere and link to each respective
> > information structure?
> >
> > Most of the doc for queries is there now, but the presentation and linking
> > lacks still a lot.
> > -Daniel

MattA is out at the moment, so I've picked this up in his absence; I
sent a new series here that includes various kerneldoc updates in
addition to his patch:

   https://patchwork.freedesktop.org/series/102553/

Let me know if that's more along the lines of what you guys were looking
for.


Matt

> >
> >> - * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO :
> >> + * Data written by the kernel with query DRM_I915_QUERY_TOPOLOGY_INFO,
> >> + * DRM_I915_QUERY_GEOMETRY_SUBSLICE:
> >>   *
> >>   * data: contains the 3 pieces of information :
> >>   *
> >> - * - the slice mask with one bit per slice telling whether a slice is
> >> - *   available. The availability of slice X can be queried with the following
> >> - *   formula :
> >> + * - For DRM_I915_QUERY_TOPOLOGY_INFO the slice mask with one bit per slice
> >> + *   telling whether a slice is available. The availability of slice X can be
> >> + *   queried with the following formula :
> >>   *
> >>   *           (data[X / 8] >> (X % 8)) & 1
> >>   *
> >> + * - For DRM_I915_QUERY_GEOMETRY_SUBSLICES Slices are equal to 1 and this field
> >> + *   is not used.
> >> + *
> >>   * - the subslice mask for each slice with one bit per subslice telling
> >>   *   whether a subslice is available. Gen12 has dual-subslices, which are
> >>   *   similar to two gen11 subslices. For gen12, this array represents dual-
> >> -- 
> >> 2.21.3
> >> 
> >
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
