Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CEF15953D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977226EEC1;
	Tue, 11 Feb 2020 16:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D046EEC1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 16:42:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 08:42:55 -0800
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="226561750"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 08:42:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/irq: remove check on dev->dev_private
In-Reply-To: <20200211151219.GF2363188@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200211144753.3175-1-jani.nikula@intel.com>
 <20200211151219.GF2363188@phenom.ffwll.local>
Date: Tue, 11 Feb 2020 18:42:49 +0200
Message-ID: <874kvxyt12.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Feb 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Feb 11, 2020 at 04:47:53PM +0200, Jani Nikula wrote:
>> There is no real reason to require drivers to set and use
>> dev->dev_private. Indeed, the current recommendation, as documented in
>> drm_device.h, is to embed struct drm_device in the per-device struct
>> instead of using dev_private.
>> 
>> Remove the requirement for dev_private to have been set to indicate
>> driver initialization.
>
> Yeah this is nonsense. Also, drm_irq_install is purely optional
> semi-midlayer (it's not really a midlayer for the legacy drivers, but
> whatever, who cares about those).
>
> Now there might be some hilarious races this papers over, but:
>
> - Proper drivers should only call drm_dev_register once everything is set
>   up, including this stuff here. No race possible with anything else
>   really.
>
> - Slightly more wobbly drivers, including the legacy ones, all use
>   drm_global_mutex. This was the former BKL, which means that it was
>   impossible for soeone to go through the load/unload/reload (between
>   lastclose and firstopen) paths and also run the ioctl. But the ioctl had
>   to be made unlocked because blocking there killed X:
>
> 	commit 8f4ff2b06afcd6f151868474a432c603057eaf56
> 	Author: Ilija Hadzic <ihadzic@research.bell-labs.com>
> 	Date:   Mon Oct 31 17:46:18 2011 -0400
>
> 	    drm: do not sleep on vblank while holding a mutex
>
>   The even more legacy DRM_CONTROL ioctl stayed fully locked. But the file
>   open/close paths are still fully locked, and that's the only place
>   legacy drivers should call drm_irq_install/uninstall, so should all
>   still be fully ordered and protected and happy.
>
> Feel free to quote or not quote the above in the commit message.
>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>> 
>> Any ideas for something else drm_irq_install() could/should check to
>> ensure "Driver must have been initialized"?
>> 
>> There are only a few instances of dev_private uses in i915, also to be
>> removed, and we could stop initializing dev_private altogether. We could
>> in fact do that without this patch too, as we don't use
>> drm_irq_install(). But it would be cleaner to not have any checks for
>> driver private stuff outside of drivers.
>
> I hope my review above answers your question here. Patch, as-is:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Many thanks, pushed to drm-misc-next with the details addded to commit
message.

BR,
Jani.


>
>> ---
>>  drivers/gpu/drm/drm_irq.c | 4 ----
>>  1 file changed, 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
>> index 03bce566a8c3..588be45abd7a 100644
>> --- a/drivers/gpu/drm/drm_irq.c
>> +++ b/drivers/gpu/drm/drm_irq.c
>> @@ -111,10 +111,6 @@ int drm_irq_install(struct drm_device *dev, int irq)
>>  	if (irq == 0)
>>  		return -EINVAL;
>>  
>> -	/* Driver must have been initialized */
>> -	if (!dev->dev_private)
>> -		return -EINVAL;
>> -
>>  	if (dev->irq_enabled)
>>  		return -EBUSY;
>>  	dev->irq_enabled = true;
>> -- 
>> 2.20.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
