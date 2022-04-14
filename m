Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA11500FBD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1046010FCBA;
	Thu, 14 Apr 2022 13:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADCC10FCBA;
 Thu, 14 Apr 2022 13:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649943896; x=1681479896;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=h/1cEA2KokmS/KpSs5jH8/70OIy1UebIn7InZNEstbU=;
 b=ds/GWiSq2YktergqhNzQ3YS57BVqKXDBn0OB6WpC96ohx6ZTtIE7UtNe
 whcjME8jeCirLrqWsMMFniLOSaV+8X8uXx2YBFjJV+6KPt/WLYeJFNnfF
 Jr452wZ0rtlcoZbhN68vO+gVOSoPcXjM+dHvVdLW1okMhqTTjrfyBSUr9
 m/gAGKkOb5pmlgc2yB8HF7W0ZgmFQi8wQ6GyuuFDSGgCnPHSQ4F6QI6NA
 hDb3CzM1fFoGcBxAohzHvEvE9SHkLxw7F/QfQpP96PSbaMfP8i7PGlkrp
 qJsFZ//DAv/nNH6E1ITjqtCBCthLymIrHFdUVnr3fw4Av6iEcjy+Z2AdE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="287986674"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="287986674"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:44:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="573801563"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 06:44:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support and move to the modern mdev API v3
In-Reply-To: <20220414134129.GC2120790@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220411141403.86980-1-hch@lst.de>
 <82c13d8e-1cb4-2873-86e9-16fd38e15b27@intel.com>
 <20220413154642.GA28095@lst.de> <871qy1geko.fsf@intel.com>
 <5af7726e-920e-603a-bad3-8adb09d2ba89@intel.com>
 <20220413232053.GA2120790@nvidia.com>
 <1c3aaab9-3bd4-95d4-9f9f-4be9e10e6516@intel.com>
 <20220414133427.GB2120790@nvidia.com>
 <ae3bec3f-b89a-2845-a924-046874fa38c7@intel.com>
 <20220414134129.GC2120790@nvidia.com>
Date: Thu, 14 Apr 2022 16:44:52 +0300
Message-ID: <87fsmfeq3v.fsf@intel.com>
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
> On Thu, Apr 14, 2022 at 01:39:11PM +0000, Wang, Zhi A wrote:
>> This one belongs to i915, which has already been queued in drm-intel-next, but
>> not yet reached to the top. When it is landed in -rc, I will rebase this branch
>> on it, then we can drop this patch in this branch.
>
> A commit called 'split out dmc registers' with no Fixes: will be sent
> to a rc?

Won't. It's in drm-intel-next (and drm-next), headed to v5.19.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
