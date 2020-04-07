Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1051A0831
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 09:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A47689956;
	Tue,  7 Apr 2020 07:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB5D89956
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 07:24:10 +0000 (UTC)
IronPort-SDR: NjHjcH6BRbiqdlDcwvKNWFRuQtSD0v6jkfvGTsVE+QJlVOH6OlROoilGp1OgGgr7NAr6OnWBkn
 q0ADXzpA/1Mg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 00:24:10 -0700
IronPort-SDR: r85A28yrv6BGkczixoDwi3oYAwEGNDoh8KfstGxvxwklNQ5URCkjoYOt9q35JqYHaUgGXiaAtc
 4Y6HmDga3luA==
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; d="scan'208";a="424653982"
Received: from vogtstef-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.40.153])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 00:24:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/10] Set up generic fbdev after registering device
In-Reply-To: <fe7d4cbb-5e44-60fb-c54a-6cb975154ad7@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406200051.GA26582@ravnborg.org>
 <fe7d4cbb-5e44-60fb-c54a-6cb975154ad7@suse.de>
Date: Tue, 07 Apr 2020 10:24:00 +0300
Message-ID: <87blo3lpwv.fsf@intel.com>
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
Cc: chunkuang.hu@kernel.org, hdegoede@redhat.com, airlied@linux.ie,
 puck.chen@hisilicon.com, jsarha@ti.com, dri-devel@lists.freedesktop.org,
 paul@crapouillou.net, xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 tomi.valkeinen@ti.com, kraxel@redhat.com, zourongrong@gmail.com,
 matthias.bgg@gmail.com, tiantao6@hisilicon.com, sean@poorly.run,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 07 Apr 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi Sam
>
> Am 06.04.20 um 22:00 schrieb Sam Ravnborg:
>> Hi Thomas.
>> 
>> On Mon, Apr 06, 2020 at 03:43:55PM +0200, Thomas Zimmermann wrote:
>>> Generic fbdev emulation is a DRM client. If possible, it should behave
>>> like userspace clients. Therefore it should not run before the driver
>>> registered the new DRM device. If the setup function fails, the driver
>>> should not report an error.
>> 
>> Thanks for taking the time to refactor all the relevant drivers.
>> 
>> I have received some push-back in the past when suggesting this,
>> but cannot remember from who.
>> Let's see what review comments you get.
>> 
>> As the rule is that the fbdev setup shall be setup after registering
>> the DRM device - it would be nice to have this included in the
>> documentation of drm_fbdev_generic_setup
>> 
>> Could you try to to update the documentation to cover this?
>
> Good idea. I'll add this to patchset's next iteration.

How about something like:

	drm_WARN_ON(dev, !dev->registered);

(Not sure if that needs to be !dev->driver->load && !dev->registered).

This can be a follow-up patch later too.

BR,
Jani.


>
> Best regards
> Thomas
>
>> 
>> I will get back to the patches later this week.
>> 
>> 	Sam
>> 
>>>
>>> This is a follow-up patchset to the discussion at [1].  I went
>>> through all calls to drm_fbdev_generic_setup(), moved them to the
>>> final operation of their driver's probe function, and removed the
>>> return value.
>>>
>>> Built-tested on x86-64, aarch64 and arm.
>>>
>>> [1] https://lore.kernel.org/dri-devel/20200403135828.2542770-1-daniel.vetter@ffwll.ch/T/#m216b5b37aeeb7b28d55ad73b7a702b3d1d7bf867
>>>
>>> Thomas Zimmermann (10):
>>>   drm/ast: Set up fbdev after registering device; remove error checks
>>>   drm/hibmc: Remove error check from fbdev setup
>>>   drm/kirin: Set up fbdev after fully registering device
>>>   drm/ingenic: Remove error check from fbdev setup
>>>   drm/mediathek: Remove error check from fbdev setup
>>>   drm/mgag200: Set up fbdev after registering device; remove error
>>>     checks
>>>   drm/tilcdc: Set up fbdev after fully registering device
>>>   drm/udl: Remove error check from fbdev setup
>>>   drm/vboxvideo: Set up fbdev after registering device; remove error
>>>     checks
>>>   drm/fb-helper: Remove return value from drm_fbdev_generic_setup()
>>>
>>>  drivers/gpu/drm/ast/ast_drv.c                  |  3 +++
>>>  drivers/gpu/drm/ast/ast_main.c                 |  5 -----
>>>  drivers/gpu/drm/drm_fb_helper.c                | 18 ++++++++----------
>>>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |  6 +-----
>>>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  4 ++--
>>>  drivers/gpu/drm/ingenic/ingenic-drm.c          |  4 +---
>>>  drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  4 +---
>>>  drivers/gpu/drm/mgag200/mgag200_drv.c          |  2 ++
>>>  drivers/gpu/drm/mgag200/mgag200_main.c         |  4 ----
>>>  drivers/gpu/drm/tilcdc/tilcdc_drv.c            |  3 +--
>>>  drivers/gpu/drm/udl/udl_drv.c                  |  6 +-----
>>>  drivers/gpu/drm/vboxvideo/vbox_drv.c           |  6 ++----
>>>  include/drm/drm_fb_helper.h                    |  5 +++--
>>>  13 files changed, 25 insertions(+), 45 deletions(-)
>>>
>>> --
>>> 2.26.0

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
