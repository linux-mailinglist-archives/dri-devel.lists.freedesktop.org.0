Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5CC445203
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 12:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC01E6E8AE;
	Thu,  4 Nov 2021 11:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E87F6E887
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 11:10:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211735595"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="211735595"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 04:10:53 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="501504405"
Received: from mihaelac-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.32.21])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 04:10:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 4/5] drm: Add a drm_drv_enabled() helper function
In-Reply-To: <54aedf5a-34b1-15f6-47f1-39815b3832ae@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211103123206.1041442-1-javierm@redhat.com>
 <87o871bbmb.fsf@intel.com> <54aedf5a-34b1-15f6-47f1-39815b3832ae@suse.de>
Date: Thu, 04 Nov 2021 13:10:48 +0200
Message-ID: <87bl30b2h3.fsf@intel.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>,
 Neal Gompa <ngompa13@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Nov 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 03.11.21 um 14:41 schrieb Jani Nikula:
>> On Wed, 03 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
>>> DRM drivers can use this to determine whether they can be enabled or not.
>>>
>>> For now it's just a wrapper around drm_modeset_disabled() but having the
>>> indirection level will allow to add other conditions besides "nomodeset".
>>>
>>> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>> Can't see i915 trivially using this due to the drm_driver
>> parameter. Please let's not merge helpers like this without actual
>> users.
>
> Can you explain?
>
> This would be called on the top of the PCI probe function. The parameter 
> would allow to decide on a per-driver base (e.g., to ignore generic 
> drivers).

Where and how exactly? This is why we need to see the patch using the
function. A patch is worth a thousand words. ;)

See current vgacon_text_force() usage in i915/i915_module.c. It happens
way before anything related to pci or drm driver. Why bother with the
complicated setup and teardown of stuff if you can bail out earlier?


BR,
Jani.

>
> Best regards
> Thomas
>
>> 
>> BR,
>> Jani.
>> 
>> 
>>> ---
>>>
>>>   drivers/gpu/drm/drm_drv.c | 21 +++++++++++++++++++++
>>>   include/drm/drm_drv.h     |  1 +
>>>   2 files changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 8214a0b1ab7f..70ef08941e06 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -975,6 +975,27 @@ int drm_dev_set_unique(struct drm_device *dev, const char *name)
>>>   }
>>>   EXPORT_SYMBOL(drm_dev_set_unique);
>>>   
>>> +/**
>>> + * drm_drv_enabled - Checks if a DRM driver can be enabled
>>> + * @driver: DRM driver to check
>>> + *
>>> + * Checks whether a DRM driver can be enabled or not. This may be the case
>>> + * if the "nomodeset" kernel command line parameter is used.
>>> + *
>>> + * Returns:
>>> + * True if the DRM driver is enabled and false otherwise.
>>> + */
>>> +bool drm_drv_enabled(const struct drm_driver *driver)
>>> +{
>>> +	if (drm_modeset_disabled()) {
>>> +		DRM_INFO("%s driver is disabled\n", driver->name);
>>> +		return false;
>>> +	}
>>> +
>>> +	return true;
>>> +}
>>> +EXPORT_SYMBOL(drm_drv_enabled);
>>> +
>>>   /*
>>>    * DRM Core
>>>    * The DRM core module initializes all global DRM objects and makes them
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index 0cd95953cdf5..48f2b6eec012 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -598,5 +598,6 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
>>>   
>>>   int drm_dev_set_unique(struct drm_device *dev, const char *name);
>>>   
>>> +bool drm_drv_enabled(const struct drm_driver *driver);
>>>   
>>>   #endif
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
