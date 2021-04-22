Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115243682C0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 16:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499D66EAA7;
	Thu, 22 Apr 2021 14:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8E66EAA6;
 Thu, 22 Apr 2021 14:51:57 +0000 (UTC)
IronPort-SDR: EA6cjr8F8Bp+Rn4zY8tLKXuLjXGMxJaAyi7KOUy2eNyjKAosFcKOxRDx2KA0DpkrM/o0n6KFnt
 s8z6V0blmh5A==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="192711328"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="192711328"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 07:51:56 -0700
IronPort-SDR: 7ThSNZxN7/DzyQgxwuyvs2UwLBv5+Npjjt4tBmB3pqEMo2OeDtsP032DXqUh7QyXbL0WJvprKc
 ZQSHgHTKjOrQ==
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="427976473"
Received: from rlocatel-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.200])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 07:51:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] vfio/gvt: fix DRM_I915_GVT dependency on VFIO_MDEV
In-Reply-To: <20210422135810.GG2047089@ziepe.ca>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210422133547.1861063-1-arnd@kernel.org>
 <20210422135810.GG2047089@ziepe.ca>
Date: Thu, 22 Apr 2021 17:51:47 +0300
Message-ID: <87sg3i74os.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Kevin Tian <kevin.tian@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, intel-gvt-dev@lists.freedesktop.org,
 Zhi Wang <zhi.a.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Cc: gvt list & maintainers

On Thu, 22 Apr 2021, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> On Thu, Apr 22, 2021 at 03:35:33PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The Kconfig dependency is incomplete since DRM_I915_GVT is a 'bool'
>> symbol that depends on the 'tristate' VFIO_MDEV. This allows a
>> configuration with VFIO_MDEV=m, DRM_I915_GVT=y and DRM_I915=y that
>> causes a link failure:
>> 
>> x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `available_instances_show':
>> gvt.c:(.text+0x67a): undefined reference to `mtype_get_parent_dev'
>> x86_64-linux-ld: gvt.c:(.text+0x6a5): undefined reference to `mtype_get_type_group_id'
>> x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `description_show':
>> gvt.c:(.text+0x76e): undefined reference to `mtype_get_parent_dev'
>> x86_64-linux-ld: gvt.c:(.text+0x799): undefined reference to `mtype_get_type_group_id'
>> 
>> Clarify the dependency by specifically disallowing the broken
>> configuration. If VFIO_MDEV is built-in, it will work, but if
>> VFIO_MDEV=m, the i915 driver cannot be built-in here.
>> 
>> Fixes: 07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV")
>> Fixes: 9169cff168ff ("vfio/mdev: Correct the function signatures for the mdev_type_attributes")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/gpu/drm/i915/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Oh kconfig stuff like this makes my head hurt, thanks for finding it
>
> I also can't see an alternative to this ugly thing, besides having the
> i915 guys properly modularize this code someday
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Jason

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
