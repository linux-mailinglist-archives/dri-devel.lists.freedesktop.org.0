Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E091500FAB
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0940010FC68;
	Thu, 14 Apr 2022 13:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8223C10FC5E;
 Thu, 14 Apr 2022 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649943616; x=1681479616;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oe/BJrwW4pAsB1nX950gAS+RLvGZsHho+J6bPq9fR/s=;
 b=f7Oqqruip+H+RCFFbU4imMnNvJdYuksQFLYUgS3rJoRrhHB9fOUOh9JA
 z7O6FK7ThLtJMwKA9PoQOKRubhl+5jakIHSVKmi2pGvL9RCcp09xBrk7y
 qqqfum/RT0+PWij3GlybrYlkHkC4m+zSvDuciyzLdJybTfStNxMiQH9ly
 /5L5qT46N1VSH6ItZeX1YIPRNWYg4W0vI5bO/CHk9LYxh3Qqy69eU0/3d
 hjtW6907LjEm0XgqafmkyXbdbuW4+KoHqRyP5iQ5w+agPFKf0B1N2CIj5
 t9n+byLJxvx9ujNDhMhtn4k26GSYQubg+Q+opUL/8M4lKXK5MtEuQsWZm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="323374724"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="323374724"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:40:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="573800067"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:40:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
In-Reply-To: <20220414133427.GB2120790@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com>
Date: Thu, 14 Apr 2022 16:40:11 +0300
Message-ID: <87ilrbeqbo.fsf@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Apr 2022, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Thu, Apr 14, 2022 at 12:20:42PM +0000, Wang, Zhi A wrote:
>> On 4/13/22 11:20 PM, Jason Gunthorpe wrote:
>> > On Wed, Apr 13, 2022 at 11:13:06PM +0000, Wang, Zhi A wrote:
>> >> Hi folks:
>> >>
>> >> Thanks so much for the efforts. I prepared a branch which contains all our patches.The aim of the branch is for the VFIO maintainers to pull the whole bunch easily after the drm-intel-next got merged through drm (as one of the MMIO patches depends on a patch in drm-intel-next).
>> >>
>> >> I dropped patch 4 and patch 5 as they have been covered by Jani's patches. Some conflicts was solved.
>> >> QA is going to test it today. 
>> >>
>> >> You can find it here:
>> >>
>> >> git clone https://github.com/intel/gvt-linux -b for-christoph
>> > 
>> > There are alot of extra commits on there - is it possible to base this
>> > straight on rc1 not on some kind of existing DRM tree?
>> > 
>> > Why did you choose drm/i915/fbc: Call intel_fbc_activate() directly
>> > from frontbuffer flush  as a base?
>> > 
>> > Jason
>> > 
>> 
>> Hi Jason:
>> 
>> I updated the branch. You can check if those are what you are expecting. :)
>
> This is better, except for the first commit:
>
>  [DON'T PULL] drm/i915/dmc: split out dmc registers to a separate file
>  THIS PATCH WILL GO THROUGH DRM-INTEL-NEXT TO UPSTREAM
>
>  Clean up the massive i915_reg.h a bit with this isolated set of
>  registers.
>
>  v2: Remove stale comment (Lucas)
>
> Clean the commit message and send that as a proper PR to
> drm-intel-next, then everything else is OK.

It's already in drm-intel-next, I guess the problem is basing the branch
on something that doesn't have it. I'd probably just base everything
cleanly on -rc1, and whoever does the merge between the two will need to
account for the missing include in the result. It's just adding one line
in the right place.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
