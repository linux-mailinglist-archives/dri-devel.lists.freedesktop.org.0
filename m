Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFE78B20BF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 13:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AE911A3E8;
	Thu, 25 Apr 2024 11:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTD2xcoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663E511A3D1;
 Thu, 25 Apr 2024 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714045920; x=1745581920;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=JdieYab+VuBd8IHv7Rd+EQz7ayx9e9lUtwh+NNRAU5Q=;
 b=lTD2xcoGRrNaz+TL4sgHQeOvTbOEM5yC0zmBvqpCtK9BHViZBJ2gsuPI
 oQWvO3+DsMjVoh7LlsV1dxdwfggaSxJ15bMCkIuNkAzaARD/wWhXjprBl
 MGozcfzDJf9RCJaImpmhO4auBXctNYt1vBZT3b3CT3Waj8v+wVAlPGK46
 AoO6Pss1guOO1uIXbuCtDuLhODXhqIeIZiCsqO3J3x5+45fj+038Sjy/P
 AQzeDmllTB7N5GlNl5MBOyLceHoOFBOgwCp9iobnV0PrbUKruSd7R3htK
 /fElYMlqkUFUEyEdA562hVdDWdd5Sda6RgUIbn2tZTKrVmUNb2g7720ZO w==;
X-CSE-ConnectionGUID: 5u82NzR5TWmYzShj/+JQKg==
X-CSE-MsgGUID: 4QO4SYB4RAKVwK/HttIQJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9593053"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9593053"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 04:51:58 -0700
X-CSE-ConnectionGUID: KQl0Tw63Qr+E5OYEtuGs4w==
X-CSE-MsgGUID: t2wnuVjwSlCkPXB8goU64w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25535263"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 04:51:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "Hogander, Jouni"
 <jouni.hogander@intel.com>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, "javierm@redhat.com" <javierm@redhat.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Deak, Imre"
 <imre.deak@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v8 6/6] drm/{i915,xe}: Implement fbdev emulation as
 in-kernel client
In-Reply-To: <e10d9029-0f02-4d2e-8fee-f4759eb05148@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240409081029.17843-1-tzimmermann@suse.de>
 <20240409081029.17843-7-tzimmermann@suse.de>
 <d164f7d9b0fab2573c9c9781cab17b02c4cdce46.camel@intel.com>
 <1517673a-50da-4f66-958c-1222b1dfc4a6@suse.de>
 <275e85aa8165204bcfe8ff6039356cd0f3577c61.camel@intel.com>
 <e10d9029-0f02-4d2e-8fee-f4759eb05148@suse.de>
Date: Thu, 25 Apr 2024 14:51:49 +0300
Message-ID: <87frv9psmi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 23 Apr 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 23.04.24 um 13:36 schrieb Hogander, Jouni:
>> On Tue, 2024-04-23 at 13:13 +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 22.04.24 um 16:11 schrieb Hogander, Jouni:
>>>> On Tue, 2024-04-09 at 10:04 +0200, Thomas Zimmermann wrote:
>>>>> Replace all code that initializes or releases fbdev emulation
>>>>> throughout the driver. Instead initialize the fbdev client by a
>>>>> single call to intel_fbdev_setup() after i915 has registered its
>>>>> DRM device. Just like similar code in other drivers, i915 fbdev
>>>>> emulation now acts like a regular DRM client. Do the same for xe.
>>>>>
>>>>> The fbdev client setup consists of the initial preparation and
>>>>> the
>>>>> hot-plugging of the display. The latter creates the fbdev device
>>>>> and sets up the fbdev framebuffer. The setup performs display
>>>>> hot-plugging once. If no display can be detected, DRM probe
>>>>> helpers
>>>>> re-run the detection on each hotplug event.
>>>>>
>>>>> A call to drm_client_dev_unregister() releases all in-kernel
>>>>> clients
>>>>> automatically. No further action is required within i915. If the
>>>>> fbdev
>>>>> framebuffer has been fully set up, struct fb_ops.fb_destroy
>>>>> implements
>>>>> the release. For partially initialized emulation, the fbdev
>>>>> client
>>>>> reverts the initial setup. Do the same for xe and remove its call
>>>>> to
>>>>> intel_fbdev_fini().
>>>>>
>>>>> v8:
>>>>> - setup client in intel_display_driver_register (Jouni)
>>>>> - mention xe in commit message
>>>>>
>>>>> v7:
>>>>> - update xe driver
>>>>> - reword commit message
>>>>>
>>>>> v6:
>>>>> - use 'i915' for i915 device (Jouni)
>>>>> - remove unnecessary code for non-atomic mode setting (Jouni,
>>>>> Ville)
>>>>> - fix function name in commit message (Jouni)
>>>>>
>>>>> v3:
>>>>> -=C2=A0 as before, silently ignore devices without displays
>>>>>
>>>>> v2:
>>>>> -=C2=A0 let drm_client_register() handle initial hotplug
>>>>> -=C2=A0 fix driver name in error message (Jani)
>>>>> -=C2=A0 fix non-fbdev build (kernel test robot)
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Reviewed-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
>>> Thank you so much. All patches has R-bs. Can you add the series to
>>> the
>>> intel tree?
>> Is it ok to merge patch 01/06 via intel tree as well?
>
> Sure, np.

Pushed the series to drm-intel-next, thanks for the patches and
review. And the patience in waiting for us to getting this merged!

BR,
Jani.


>
> Best regards
> Thomas
>
>>
>> Rodrigo, This set is containing Xe display changes as well. Is it ok to
>> push this via drm-intel?
>>
>> BR,
>>
>> Jouni H=C3=B6gander
>>
>>> Best regards
>>> Thomas
>>>
>>>>> ---
>>>>>  =C2=A0=C2=A0drivers/gpu/drm/i915/display/intel_display.c=C2=A0 |=C2=
=A0=C2=A0 1 -
>>>>>  =C2=A0=C2=A0.../drm/i915/display/intel_display_driver.c=C2=A0=C2=A0 =
|=C2=A0 20 +-
>>>>>  =C2=A0=C2=A0drivers/gpu/drm/i915/display/intel_fbdev.c=C2=A0=C2=A0=
=C2=A0 | 177 ++++++++---
>>>>> -----
>>>>> --
>>>>>  =C2=A0=C2=A0drivers/gpu/drm/i915/display/intel_fbdev.h=C2=A0=C2=A0=
=C2=A0 |=C2=A0 20 +-
>>>>>  =C2=A0=C2=A0drivers/gpu/drm/xe/display/xe_display.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 -
>>>>>  =C2=A0=C2=A05 files changed, 80 insertions(+), 140 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>>>>> b/drivers/gpu/drm/i915/display/intel_display.c
>>>>> index 614e60420a29a..161a5aabf6746 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>>>> @@ -85,7 +85,6 @@
>>>>>  =C2=A0=C2=A0#include "intel_dvo.h"
>>>>>  =C2=A0=C2=A0#include "intel_fb.h"
>>>>>  =C2=A0=C2=A0#include "intel_fbc.h"
>>>>> -#include "intel_fbdev.h"
>>>>>  =C2=A0=C2=A0#include "intel_fdi.h"
>>>>>  =C2=A0=C2=A0#include "intel_fifo_underrun.h"
>>>>>  =C2=A0=C2=A0#include "intel_frontbuffer.h"
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c
>>>>> b/drivers/gpu/drm/i915/display/intel_display_driver.c
>>>>> index e5f052d4ff1cc..ed8589fa35448 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
>>>>> @@ -514,10 +514,6 @@ int intel_display_driver_probe(struct
>>>>> drm_i915_private *i915)
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_overlay_=
setup(i915);
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D intel_fbdev_init(&=
i915->drm);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>>>>> -
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Only enable=
 hotplug handling once the fbdev is fully
>>>>> set
>>>>> up. */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_hpd_init=
(i915);
>>>>>=20=20=20=20
>>>>> @@ -544,16 +540,6 @@ void intel_display_driver_register(struct
>>>>> drm_i915_private *i915)
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_display_=
debugfs_register(i915);
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Some ports require corr=
ectly set-up hpd registers for
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * detection to work prope=
rly (leading to ghost connected
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * connector status), e.g.=
 VGA on gm45.=C2=A0 Hence we can
>>>>> only
>>>>> set
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * up the initial fbdev co=
nfig after hpd irqs are fully
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * enabled. We do it last =
so that the async config cannot
>>>>> run
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * before the connectors a=
re registered.
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_initial_config=
_async(i915);
>>>>> -
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We need to =
coordinate the hotplugs with the
>>>>> asynchronous
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * fbdev confi=
guration, for which we use the
>>>>> @@ -562,6 +548,8 @@ void intel_display_driver_register(struct
>>>>> drm_i915_private *i915)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_kms_helper=
_poll_init(&i915->drm);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_hpd_poll=
_disable(i915);
>>>>>=20=20=20=20
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_setup(i915);
>>>>> +
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_display_=
device_info_print(DISPLAY_INFO(i915),
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DISPLAY_RUNTIME_INFO(i91
>>>>> 5),
>>>>> &p);
>>>>>  =C2=A0=C2=A0}
>>>>> @@ -597,9 +585,6 @@ void intel_display_driver_remove_noirq(struct
>>>>> drm_i915_private *i915)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_hpd_poll=
_fini(i915);
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* poll work can call into=
 fbdev, hence clean that up
>>>>> afterwards */
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_fini(i915);
>>>>> -
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_unregist=
er_dsm_handler();
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* flush any d=
elayed tasks or pending work */
>>>>> @@ -640,7 +625,6 @@ void intel_display_driver_unregister(struct
>>>>> drm_i915_private *i915)
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_client_dev=
_unregister(&i915->drm);
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_unregister(i91=
5);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * After flush=
ing the fbdev (incl. a late async config
>>>>> which
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * will have d=
elayed queuing of a hotplug event), then
>>>>> flush
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>>> b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>>> index f783de611a7f5..bda702c2cab8e 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>>>>> @@ -24,7 +24,6 @@
>>>>>  =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 David Airlie
>>>>>  =C2=A0=C2=A0 */
>>>>>=20=20=20=20
>>>>> -#include <linux/async.h>
>>>>>  =C2=A0=C2=A0#include <linux/console.h>
>>>>>  =C2=A0=C2=A0#include <linux/delay.h>
>>>>>  =C2=A0=C2=A0#include <linux/errno.h>
>>>>> @@ -39,6 +38,7 @@
>>>>>  =C2=A0=C2=A0#include <linux/vga_switcheroo.h>
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0#include <drm/drm_crtc.h>
>>>>> +#include <drm/drm_crtc_helper.h>
>>>>>  =C2=A0=C2=A0#include <drm/drm_fb_helper.h>
>>>>>  =C2=A0=C2=A0#include <drm/drm_fourcc.h>
>>>>>  =C2=A0=C2=A0#include <drm/drm_gem_framebuffer_helper.h>
>>>>> @@ -58,7 +58,6 @@ struct intel_fbdev {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_f=
ramebuffer *fb;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i915_vm=
a *vma;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned long =
vma_flags;
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0async_cookie_t cookie;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int preferred_=
bpp;
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Whether or =
not fbdev hpd processing is temporarily
>>>>> suspended */
>>>>> @@ -135,6 +134,26 @@ static int intel_fbdev_mmap(struct fb_info
>>>>> *info, struct vm_area_struct *vma)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return i915_ge=
m_fb_mmap(obj, vma);
>>>>>  =C2=A0=C2=A0}
>>>>>=20=20=20=20
>>>>> +static void intel_fbdev_fb_destroy(struct fb_info *info)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_fb_helper *fb_h=
elper =3D info->par;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_fbdev *ifbdev=
 =3D container_of(fb_helper,
>>>>> struct
>>>>> intel_fbdev, helper);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_fini(&ifbdev=
->helper);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We rely on the object-f=
ree to release the VMA pinning
>>>>> for
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the info->screen_base m=
maping. Leaking the VMA is
>>>>> simpler
>>>>> than
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * trying to rectify all t=
he possible error paths leading
>>>>> here.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_unpin_fb_vma(ifbdev-=
>vma, ifbdev->vma_flags);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_framebuffer_remove(&if=
bdev->fb->base);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_client_release(&fb_hel=
per->client);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_unprepare(&i=
fbdev->helper);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(ifbdev);
>>>>> +}
>>>>> +
>>>>>  =C2=A0=C2=A0__diag_push();
>>>>>  =C2=A0=C2=A0__diag_ignore_all("-Woverride-init", "Allow field
>>>>> initialization
>>>>> overrides for fb ops");
>>>>>=20=20=20=20
>>>>> @@ -147,6 +166,7 @@ static const struct fb_ops intelfb_ops =3D {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fb_pan_displa=
y =3D intel_fbdev_pan_display,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__FB_DEFAULT_D=
EFERRED_OPS_DRAW(intel_fbdev),
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fb_mmap =3D i=
ntel_fbdev_mmap,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fb_destroy =3D intel_fbde=
v_fb_destroy,
>>>>>  =C2=A0=C2=A0};
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0__diag_pop();
>>>>> @@ -158,7 +178,6 @@ static int intelfb_create(struct
>>>>> drm_fb_helper
>>>>> *helper,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_f=
ramebuffer *intel_fb =3D ifbdev->fb;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_dev=
ice *dev =3D helper->dev;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i91=
5_private *dev_priv =3D to_i915(dev);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pci_dev *pdev =3D t=
o_pci_dev(dev_priv->drm.dev);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const struct i=
915_gtt_view view =3D {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.type =3D I915_GTT_VIEW_NORMAL,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
>>>>> @@ -250,7 +269,7 @@ static int intelfb_create(struct
>>>>> drm_fb_helper
>>>>> *helper,
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ifbdev->vma_fl=
ags =3D flags;
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_runtime_=
pm_put(&dev_priv->runtime_pm, wakeref);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vga_switcheroo_client_fb_s=
et(pdev, info);
>>>>> +
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0out_unpin:
>>>>> @@ -276,26 +295,6 @@ static const struct drm_fb_helper_funcs
>>>>> intel_fb_helper_funcs =3D {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fb_dirty =3D =
intelfb_dirty,
>>>>>  =C2=A0=C2=A0};
>>>>>=20=20=20=20
>>>>> -static void intel_fbdev_destroy(struct intel_fbdev *ifbdev)
>>>>> -{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* We rely on the object-f=
ree to release the VMA pinning
>>>>> for
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the info->screen_base m=
maping. Leaking the VMA is
>>>>> simpler
>>>>> than
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * trying to rectify all t=
he possible error paths leading
>>>>> here.
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_fini(&ifbdev=
->helper);
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ifbdev->vma)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0intel_unpin_fb_vma(ifbdev->vma, ifbdev-
>>>>>> vma_flags);
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ifbdev->fb)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0drm_framebuffer_remove(&ifbdev->fb->base);
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_client_release(&ifbdev=
->helper.client);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_unprepare(&i=
fbdev->helper);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(ifbdev);
>>>>> -}
>>>>> -
>>>>>  =C2=A0=C2=A0/*
>>>>>  =C2=A0=C2=A0 * Build an intel_fbdev struct using a BIOS allocated
>>>>> framebuffer,
>>>>> if possible.
>>>>>  =C2=A0=C2=A0 * The core display code will have read out the current =
plane
>>>>> configuration,
>>>>> @@ -459,16 +458,6 @@ static void
>>>>> intel_fbdev_suspend_worker(struct
>>>>> work_struct *work)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0true);
>>>>>  =C2=A0=C2=A0}
>>>>>=20=20=20=20
>>>>> -static void intel_fbdev_sync(struct intel_fbdev *ifbdev)
>>>>> -{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ifbdev->cookie)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Only serialises with al=
l preceding async calls, hence
>>>>> +1
>>>>> */
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0async_synchronize_cookie(i=
fbdev->cookie + 1);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ifbdev->cookie =3D 0;
>>>>> -}
>>>>> -
>>>>>  =C2=A0=C2=A0/* Suspends/resumes fbdev processing of incoming HPD eve=
nts.
>>>>> When
>>>>> resuming HPD
>>>>>  =C2=A0=C2=A0 * processing, fbdev will perform a full connector repro=
be if a
>>>>> hotplug event
>>>>>  =C2=A0=C2=A0 * was received while HPD was suspended.
>>>>> @@ -559,8 +548,6 @@ static int
>>>>> intel_fbdev_output_poll_changed(struct
>>>>> drm_device *dev)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ifbdev)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_sync(ifbdev);
>>>>> -
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&if=
bdev->hpd_lock);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0send_hpd =3D !=
ifbdev->hpd_suspended;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ifbdev->hpd_wa=
iting =3D true;
>>>>> @@ -580,7 +567,6 @@ static int intel_fbdev_restore_mode(struct
>>>>> drm_i915_private *dev_priv)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ifbdev)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_sync(ifbdev);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ifbdev->v=
ma)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
>>>>>=20=20=20=20
>>>>> @@ -598,7 +584,20 @@ static int intel_fbdev_restore_mode(struct
>>>>> drm_i915_private *dev_priv)
>>>>>  =C2=A0=C2=A0 */
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0static void intel_fbdev_client_unregister(struct drm_cli=
ent_dev
>>>>> *client)
>>>>> -{ }
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_fb_helper *fb_h=
elper =3D
>>>>> drm_fb_helper_from_client(client);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_device *dev =3D=
 fb_helper->dev;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pci_dev *pdev =3D t=
o_pci_dev(dev->dev);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (fb_helper->info) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0vga_switcheroo_client_fb_set(pdev, NULL);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_unregister_info(fb_helper);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_unprepare(fb_helper);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0drm_client_release(&fb_helper->client);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0kfree(fb_helper);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>>>> +}
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0static int intel_fbdev_client_restore(struct drm_client_=
dev
>>>>> *client)
>>>>>  =C2=A0=C2=A0{
>>>>> @@ -616,7 +615,31 @@ static int intel_fbdev_client_restore(struct
>>>>> drm_client_dev *client)
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0static int intel_fbdev_client_hotplug(struct drm_client_=
dev
>>>>> *client)
>>>>>  =C2=A0=C2=A0{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return intel_fbdev_output_=
poll_changed(client->dev);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_fb_helper *fb_h=
elper =3D
>>>>> drm_fb_helper_from_client(client);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_device *dev =3D=
 client->dev;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct pci_dev *pdev =3D t=
o_pci_dev(dev->dev);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dev->fb_helper)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return intel_fbdev_output_poll_changed(dev);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_fb_helper_init=
(dev, fb_helper);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err_drm_err;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_fb_helper_init=
ial_config(fb_helper);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err_drm_fb_helper_fini;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vga_switcheroo_client_fb_s=
et(pdev, fb_helper->info);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>>>>> +
>>>>> +err_drm_fb_helper_fini:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_fini(fb_help=
er);
>>>>> +err_drm_err:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_err(dev, "Failed to se=
tup i915 fbdev emulation
>>>>> (ret=3D%d)\n", ret);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>>>>>  =C2=A0=C2=A0}
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0static const struct drm_client_funcs intel_fbdev_client_=
funcs =3D
>>>>> {
>>>>> @@ -626,22 +649,23 @@ static const struct drm_client_funcs
>>>>> intel_fbdev_client_funcs =3D {
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hotplug=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D intel_fbdev_client_hotplug,
>>>>>  =C2=A0=C2=A0};
>>>>>=20=20=20=20
>>>>> -int intel_fbdev_init(struct drm_device *dev)
>>>>> +void intel_fbdev_setup(struct drm_i915_private *i915)
>>>>>  =C2=A0=C2=A0{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_i915_private *d=
ev_priv =3D to_i915(dev);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct drm_device *dev =3D=
 &i915->drm;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_f=
bdev *ifbdev;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (drm_WARN_ON(dev, !HAS_=
DISPLAY(dev_priv)))
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENODEV;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!HAS_DISPLAY(i915))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ifbdev =3D kza=
lloc(sizeof(*ifbdev), GFP_KERNEL);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ifbdev)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -ENOMEM;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&ifbdev->hpd_lo=
ck);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_=
prepare(dev, &ifbdev->helper, 32,
>>>>> &intel_fb_helper_funcs);
>>>>>=20=20=20=20
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0i915->display.fbdev.fbdev =
=3D ifbdev;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_WORK(&i915->display.f=
bdev.suspend_work,
>>>>> intel_fbdev_suspend_worker);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_init(&ifbdev->hpd_lo=
ck);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (intel_fbde=
v_init_bios(dev, ifbdev))
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ifbdev->helper.preferred_bpp =3D ifbdev-
>>>>>> preferred_bpp;
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
>>>>> @@ -649,68 +673,19 @@ int intel_fbdev_init(struct drm_device
>>>>> *dev)
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_cl=
ient_init(dev, &ifbdev->helper.client,
>>>>> "intel-
>>>>> fbdev",
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &intel_fbdev_client_funcs);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0drm_err(dev, "Failed to register client: %d\n",
>>>>> ret);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto err_drm_fb_helper_unprepare;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D drm_fb_helper_init=
(dev, &ifbdev->helper);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err_drm_client_release;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_priv->display.fbdev.fb=
dev =3D ifbdev;
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0INIT_WORK(&dev_priv->displ=
ay.fbdev.suspend_work,
>>>>> intel_fbdev_suspend_worker);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_client_register(&ifbde=
v->helper.client);
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
>>>>>=20=20=20=20
>>>>> -err_drm_client_release:
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_client_release(&ifbdev=
->helper.client);
>>>>>  =C2=A0=C2=A0err_drm_fb_helper_unprepare:
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_=
unprepare(&ifbdev->helper);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_destroy(&ifbdev->hpd=
_lock);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kfree(ifbdev);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return ret;
>>>>> -}
>>>>> -
>>>>> -static void intel_fbdev_initial_config(void *data,
>>>>> async_cookie_t
>>>>> cookie)
>>>>> -{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_fbdev *ifbdev=
 =3D data;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Due to peculiar init or=
der wrt to hpd handling this is
>>>>> separate. */
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (drm_fb_helper_initial_=
config(&ifbdev->helper))
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_unregister(to_i915(ifbdev-
>>>>>> helper.dev));
>>>>> -}
>>>>> -
>>>>> -void intel_fbdev_initial_config_async(struct drm_i915_private
>>>>> *dev_priv)
>>>>> -{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_fbdev *ifbdev=
 =3D dev_priv-
>>>>>> display.fbdev.fbdev;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ifbdev)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ifbdev->cookie =3D
>>>>> async_schedule(intel_fbdev_initial_config,
>>>>> ifbdev);
>>>>> -}
>>>>> -
>>>>> -void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
>>>>> -{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_fbdev *ifbdev=
 =3D dev_priv-
>>>>>> display.fbdev.fbdev;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ifbdev)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_set_suspend(&d=
ev_priv->drm,
>>>>> FBINFO_STATE_SUSPENDED, true);
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!current_is_async())
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_sync(ifbdev);
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_fb_helper_unregister_i=
nfo(&ifbdev->helper);
>>>>> -}
>>>>> -
>>>>> -void intel_fbdev_fini(struct drm_i915_private *dev_priv)
>>>>> -{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_fbdev *ifbdev=
 =3D fetch_and_zero(&dev_priv-
>>>>>> display.fbdev.fbdev);
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ifbdev)
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
>>>>> -
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_destroy(ifbdev=
);
>>>>>  =C2=A0=C2=A0}
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0struct intel_framebuffer *intel_fbdev_framebuffer(struct
>>>>> intel_fbdev
>>>>> *fbdev)
>>>>> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.h
>>>>> b/drivers/gpu/drm/i915/display/intel_fbdev.h
>>>>> index 8c953f102ba22..08de2d5b34338 100644
>>>>> --- a/drivers/gpu/drm/i915/display/intel_fbdev.h
>>>>> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.h
>>>>> @@ -14,27 +14,11 @@ struct intel_fbdev;
>>>>>  =C2=A0=C2=A0struct intel_framebuffer;
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0#ifdef CONFIG_DRM_FBDEV_EMULATION
>>>>> -int intel_fbdev_init(struct drm_device *dev);
>>>>> -void intel_fbdev_initial_config_async(struct drm_i915_private
>>>>> *dev_priv);
>>>>> -void intel_fbdev_unregister(struct drm_i915_private *dev_priv);
>>>>> -void intel_fbdev_fini(struct drm_i915_private *dev_priv);
>>>>> +void intel_fbdev_setup(struct drm_i915_private *dev_priv);
>>>>>  =C2=A0=C2=A0void intel_fbdev_set_suspend(struct drm_device *dev, int=
 state,
>>>>> bool
>>>>> synchronous);
>>>>>  =C2=A0=C2=A0struct intel_framebuffer *intel_fbdev_framebuffer(struct
>>>>> intel_fbdev
>>>>> *fbdev);
>>>>>  =C2=A0=C2=A0#else
>>>>> -static inline int intel_fbdev_init(struct drm_device *dev)
>>>>> -{
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>>>>> -}
>>>>> -
>>>>> -static inline void intel_fbdev_initial_config_async(struct
>>>>> drm_i915_private *dev_priv)
>>>>> -{
>>>>> -}
>>>>> -
>>>>> -static inline void intel_fbdev_unregister(struct
>>>>> drm_i915_private
>>>>> *dev_priv)
>>>>> -{
>>>>> -}
>>>>> -
>>>>> -static inline void intel_fbdev_fini(struct drm_i915_private
>>>>> *dev_priv)
>>>>> +static inline void intel_fbdev_setup(struct drm_i915_private
>>>>> *dev_priv)
>>>>>  =C2=A0=C2=A0{
>>>>>  =C2=A0=C2=A0}
>>>>>=20=20=20=20
>>>>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
>>>>> b/drivers/gpu/drm/xe/display/xe_display.c
>>>>> index cdbc3f04c80a7..ca5cbe1d8a03b 100644
>>>>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>>>>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>>>>> @@ -214,9 +214,7 @@ void xe_display_fini(struct xe_device *xe)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!xe->info.=
enable_display)
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
>>>>>=20=20=20=20
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* poll work can call into=
 fbdev, hence clean that up
>>>>> afterwards */
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_hpd_poll=
_fini(xe);
>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fbdev_fini(xe);
>>>>>=20=20=20=20
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_hdcp_com=
ponent_fini(xe);
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_audio_de=
init(xe);

--=20
Jani Nikula, Intel
