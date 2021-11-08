Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331F4499E7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 17:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2E189913;
	Mon,  8 Nov 2021 16:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0553289913
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 16:31:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="232205658"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="232205658"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 08:31:32 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="491278288"
Received: from mschuett-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.33.194])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 08:31:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
In-Reply-To: <7047ccc5-0927-f304-4d60-181d61344f8b@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211108121544.776590-1-javierm@redhat.com>
 <509f58a5-5276-5608-e3ba-4694956f6c50@suse.de>
 <7047ccc5-0927-f304-4d60-181d61344f8b@redhat.com>
Date: Mon, 08 Nov 2021 18:31:27 +0200
Message-ID: <87pmra7go0.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
> Hello Thomas,
>
> On 11/8/21 13:50, Thomas Zimmermann wrote:
>> Hi
>> 
>> Am 08.11.21 um 13:15 schrieb Javier Martinez Canillas:
>>> There is a lot of historical baggage on this parameter. It is defined in
>>> the vgacon driver as nomodeset, but its set function is called text_mode()
>>> and the value queried with a function named vgacon_text_force().
>>>
>>> All this implies that it's about forcing text mode for VGA, yet it is not
>>> used in neither vgacon nor other console driver. The only users for these
>>> are DRM drivers, that check for the vgacon_text_force() return value to
>>> determine whether the driver should be loaded or not.
>>>
>>> That makes it quite confusing to read the code, because the variables and
>>> function names don't reflect what they actually do and also are not in the
>>> same subsystem as the drivers that make use of them.
>>>
>>> This patch-set attempts to cleanup the code by moving the nomodseset param
>>> to the DRM subsystem and do some renaming to make their intention clearer.
>>>
>>> This is a v3 of the patches, that address issues pointed out by Jani Nikula
>>> in v2: https://lkml.org/lkml/2021/11/4/594
>>>
>>> Patch #1 and #2 are just trivial cleanups.
>>>
>>> Patch #3 moves the nomodeset boot option to the DRM subsystem and renames
>>> the variables and functions names.
>>>
>>> Patch #4 removes the relationship between the nomodeset parameter and the
>>> CONFIG_VGA_CONSOLE Kconfig symbol.
>> 
>> On patches 1 to 4
>> 
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>
> Thanks!
>  
>>>
>>> Patch #5 adds nomodeset to the kernel parameters documentation.
>>>
>>> Patch #6 improves the message when nomodeset is enabled to make it more
>>> accurate and less sensational.
>> 
>> See my comments on these patches.
>>
>
> Yes, agreed with your feedback on these. I'll improve it when posting a v4.

With the changes proposed by Thomas, the series is also

Acked-by: Jani Nikula <jani.nikula@intel.com>

In particular, it's fine to merge the i915 parts via whichever tree
suits you all best (I presume it's drm-misc).

I might have bikeshedded the drm_get_modeset() name and the choice of
drm_mode_config.h to place the declaration... but meh. The series is
definitely an improvement to the status quo.


BR,
Jani.


>
> Best regards, -- 
> Javier Martinez Canillas
> Linux Engineering
> Red Hat
>

-- 
Jani Nikula, Intel Open Source Graphics Center
