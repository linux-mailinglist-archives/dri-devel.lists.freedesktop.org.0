Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5984461E9
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 11:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFE96E14D;
	Fri,  5 Nov 2021 10:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126076E1ED;
 Fri,  5 Nov 2021 10:04:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="255524120"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="255524120"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 03:04:57 -0700
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="501887624"
Received: from jprisaca-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 03:04:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm: Add a drm_drv_enabled() to check if drivers
 should be enabled
In-Reply-To: <38dbcc8f-2f95-6846-537f-9b85468bfa87@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-2-javierm@redhat.com> <87ilx7ae3v.fsf@intel.com>
 <0c07f121-42d3-9f37-1e14-842fb685b501@redhat.com>
 <d4a64906-69e5-3250-2362-79f2afac0a23@suse.de>
 <38dbcc8f-2f95-6846-537f-9b85468bfa87@redhat.com>
Date: Fri, 05 Nov 2021 12:04:48 +0200
Message-ID: <877ddmapfj.fsf@intel.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Ben Skeggs <bskeggs@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 virtualization@lists.linux-foundation.org, intel-gfx@lists.freedesktop.org,
 Michel =?utf-8?Q?D?= =?utf-8?Q?=C3=A4nzer?= <michel@daenzer.net>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
> Hello Thomas,
>
> On 11/5/21 09:43, Thomas Zimmermann wrote:
>> Hi
>> 
>> Am 04.11.21 um 21:09 schrieb Javier Martinez Canillas:
>>> Hello Jani,
>>>
>>> On 11/4/21 20:57, Jani Nikula wrote:
>>>> On Thu, 04 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
>>>>> +/**
>>>>> + * drm_drv_enabled - Checks if a DRM driver can be enabled
>>>>> + * @driver: DRM driver to check
>>>>> + *
>>>>> + * Checks whether a DRM driver can be enabled or not. This may be the case
>>>>> + * if the "nomodeset" kernel command line parameter is used.
>>>>> + *
>>>>> + * Return: 0 on success or a negative error code on failure.
>>>>> + */
>>>>> +int drm_drv_enabled(const struct drm_driver *driver)
>> 
>> Jani mentioned that i915 absolutely wants this to run from the 
>> module_init function. Best is to drop the parameter.
>>
>
> Ok. I now wonder though how much value would add this function since
> it will just be a wrapper around the nomodeset check.
>
> We talked about adding a new DRIVER_GENERIC feature flag and check for
> this, but as danvet mentioned that is not really needed. We just need
> to avoid testing for nomodeset in the simpledrm driver.
>
> Do you envision other condition that could be added later to disable a
> DRM driver ? Or do you think that just from a code readability point of
> view makes worth it ?

Taking a step back for perspective.

I think there's broad consensus in moving the parameter to drm, naming
the check function to drm_something_something(), and breaking the ties
to CONFIG_VGA_CONSOLE. I appreciate the work you're doing to that
effect.

I think everything beyond that is still a bit vague and/or
contentious. So how about making the first 2-3 patches just that?
Something we can all agree on, makes good progress, improves the kernel,
and gives us something to build on?

BR,
Jani.


>
>>>>> +{
>>>>> +	if (vgacon_text_force()) {
>>>>> +		DRM_INFO("%s driver is disabled\n", driver->name);
>>>>> +		return -ENODEV;
>>>>> +	}
>> 
>> If we run this from within a module_init function, we'd get plenty of 
>> these warnings if drivers are compiled into the kernel. Maybe simply 
>> remove the message. There's already a warning printed by the nomodeset 
>> handler.
>>
>
> Indeed. I'll just drop it.
>
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_drv_enabled);
>>>>
>>>> The name implies a bool return, but it's not.
>>>>
>>>> 	if (drm_drv_enabled(...)) {
>>>> 		/* surprise, it's disabled! */
>>>> 	}
>>>>
>>>
>>> It used to return a bool in v2 but Thomas suggested an int instead to
>>> have consistency on the errno code that was returned by the callers.
>>>
>>> I should probably name that function differently to avoid confusion.
>> 
>> Yes, please.
>>
>
> drm_driver_check() maybe ?
>  
> Best regards,

-- 
Jani Nikula, Intel Open Source Graphics Center
