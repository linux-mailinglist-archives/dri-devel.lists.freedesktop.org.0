Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F6319303C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 19:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557AD6E817;
	Wed, 25 Mar 2020 18:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C736E1D8;
 Wed, 25 Mar 2020 18:20:47 +0000 (UTC)
IronPort-SDR: x1e3gsmSYJHZTKaqSg4d9Ot9jvzsAHHPsTBPuJrtz2Hv2t1t2CiMjGMvNPdAPWh3gaNAgeazCc
 U3jCUgHM8svA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 11:20:47 -0700
IronPort-SDR: Qq+zrMg+AgOBQf3wjCvW9zqjBhg9vKkLE4Tm2d8ABIPecQfVtooWdr9oHg0guRmlVWYlULGPdZ
 Vy9JqJqwS0Sw==
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="393709857"
Received: from yrahamim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.255.194.58])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 11:20:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH 02/51] drm/i915: Don't clear drvdata in
 ->release
In-Reply-To: <20200323144950.3018436-3-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
 <20200323144950.3018436-3-daniel.vetter@ffwll.ch>
Date: Wed, 25 Mar 2020 20:20:38 +0200
Message-ID: <87o8ski9e1.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Mar 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> For two reasons:
>
> - The driver core clears this already for us after we're unloaded in
>   __device_release_driver().
>
> - It's way too late, the drm_device ->release callback might massively
>   outlive the underlying physical device, since a drm_device can't be

*can be*?

>   kept alive by open drm_file or well really anything else userspace
>   is still hanging onto. So if we clear this ourselves, we should
>   clear it in the pci ->remove callback, not in the drm_device
>   ->relase callback.

->release

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Looking at git history this was fixed in the driver core with
>
> commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
> Author: Hans de Goede <hdegoede@redhat.com>
> Date:   Wed May 23 00:09:34 2012 +0200
>
>     device-core: Ensure drvdata = NULL when no driver is bound
>
> v2: Cite the core fix in the commit message (Chris).
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 48ba37e35bea..4792051e9e2e 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -909,9 +909,6 @@ static void i915_driver_destroy(struct drm_i915_private *i915)
>  
>  	drm_dev_fini(&i915->drm);
>  	kfree(i915);
> -
> -	/* And make sure we never chase our dangling pointer from pci_dev */
> -	pci_set_drvdata(pdev, NULL);
>  }
>  
>  /**

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
