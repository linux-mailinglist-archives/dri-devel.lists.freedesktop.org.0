Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B375F2CB8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 11:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A0F10E0CB;
	Mon,  3 Oct 2022 09:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3040510E0CB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664787769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7C3+MFeIGRnfqVnVfytCbeML4ckf2IWXMmltTCXRBa0=;
 b=UC4zEbitBEiM5RaPOgwGLG3GWXquzO4nwhMYrbR1pgmlmkXcLkItmyQF3kvtBhXuhr7Nsc
 08uXbUXqa1H+3Uid7IL+Kn06FzpCkVU5zMlzU/0fSkQBynOhBt1l7gzZp1dFQzXHFYyHAw
 Txtl4MYCapgqKL5BRpN1vk8FixDpcwI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-crEfljhcNtOVmecOoH5AYw-1; Mon, 03 Oct 2022 05:02:48 -0400
X-MC-Unique: crEfljhcNtOVmecOoH5AYw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hp17-20020a1709073e1100b0078b756ada09so396138ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 02:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=7C3+MFeIGRnfqVnVfytCbeML4ckf2IWXMmltTCXRBa0=;
 b=AX1XKM0rLThoU++4VOulEh56r5Br6zqCFdW0H+t6tBhWLFvZXeN/zEleKqRUlh5fl5
 ldy4eIgtbZ8Ew4IBjefahtUV+lAk8C7BvyuZCL6MAhDwnLiOBAXx9cnOy+bQqRGoS0Fj
 x4iViQnR6784ur+qhpalRGDDmGPof57/YCQAahp1f7JV7cTX6peUmuNlhN+A4njCManH
 PCBfZG3EtWVjN9+FDhlEGIaP21bdvj4fi4Ag5nC1viFt7bxWoq4T0KW6ejAv+AFkm9O7
 rTHRgfIOFre344qDY0CN9rLNNeiz5NXQgnUJwRwjvKnMLqE+M7gjDhcEqWsHjLNqqr5+
 3fIA==
X-Gm-Message-State: ACrzQf1Q9gT2b62TzLAfRdKevf/u7Zk45KhVE265UzfOisarBe5Z7fhD
 wkscpRHA0TnPYgLWL73Rm8rufDticcGJBH+FjFunTW5aYFJKLXitk1oMku2MqxAXAA2oySFB12W
 sKCK/Z3AqVe4IAn2Nnv7D/PdxPW0B
X-Received: by 2002:a17:906:dc90:b0:78b:439f:d185 with SMTP id
 cs16-20020a170906dc9000b0078b439fd185mr3374644ejc.229.1664787767108; 
 Mon, 03 Oct 2022 02:02:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Nj6Gn7Wayk05VYJKXwmb2HMUbhsWqFguLzeMY0pxEtWpXAxrps4uKDNxSVkkUp/8kmsfo8g==
X-Received: by 2002:a17:906:dc90:b0:78b:439f:d185 with SMTP id
 cs16-20020a170906dc9000b0078b439fd185mr3374624ejc.229.1664787766709; 
 Mon, 03 Oct 2022 02:02:46 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a50a6d5000000b00457c321454asm7059949edc.37.2022.10.03.02.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 02:02:46 -0700 (PDT)
Message-ID: <6f167ca3-c1c4-16df-83a0-cdb8be285d4f@redhat.com>
Date: Mon, 3 Oct 2022 11:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC v2] drm/kms: control display brightness through
 drm_connector properties
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
 <878rm3zuge.fsf@intel.com> <YzQojrDOGNhm4D8l@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YzQojrDOGNhm4D8l@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/28/22 12:57, Ville Syrjälä wrote:
> On Wed, Sep 28, 2022 at 01:04:01PM +0300, Jani Nikula wrote:
>> On Fri, 09 Sep 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>>> Hi all,
>>>
>>> Here is v2 of my "drm/kms: control display brightness through drm_connector properties" RFC:
>>>
>>> Changes from version 1:
>>> - Drop bl_brightness_0_is_min_brightness from list of new connector
>>>   properties.
>>> - Clearly define that 0 is always min-brightness when setting the brightness
>>>   through the connector properties.
>>> - Drop bl_brightness_control_method from list of new connector
>>>   properties.
>>> - Phase 1 of the plan has been completed
>>>
>>> As discussed already several times in the past:
>>>  https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
>>>  https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
>>>
>>> The current userspace API for brightness control offered by
>>> /sys/class/backlight devices has various issues:
>>>
>>> 1. There is no way to map the backlight device to a specific
>>>    display-output / panel (1)
>>> 2. Controlling the brightness requires root-rights requiring
>>>    desktop-environments to use suid-root helpers for this.
>>> 3. The meaning of 0 is not clearly defined, it can be either off,
>>>    or minimum brightness at which the display is still readable
>>>    (in a low light environment)
>>> 4. It's not possible to change both the gamma and the brightness in the
>>>    same KMS atomic commit. You'd want to be able to reduce brightness to
>>>    conserve power, and counter the effects of that by changing gamma to
>>>    reach a visually similar image. And you'd want to have the changes take
>>>    effect at the same time instead of reducing brightness at some frame and
>>>    change gamma at some other frame. This is pretty much impossible to do
>>>    via the sysfs interface.
>>>
>>> As already discussed on various conference's hallway tracks
>>> and as has been proposed on the dri-devel list once before (2),
>>> it seems that there is consensus that the best way to to solve these
>>> 2 issues is to add support for controlling a video-output's brightness
>>> through properties on the drm_connector.
>>>
>>> This RFC outlines my plan to try and actually implement this,
>>> which has 3 phases:
>>>
>>>
>>> Phase 1: Stop registering multiple /sys/class/backlight devs for a single display
>>> =================================================================================
>>>
>>> On x86 there can be multiple firmware + direct-hw-access methods
>>> for controlling the backlight and in some cases the kernel registers
>>> multiple backlight-devices for a single internal laptop LCD panel.
>>>
>>> A plan to fix this was posted here:
>>> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
>>> And a pull-req actually implementing this plan has been send out this week:
>>> https://lore.kernel.org/dri-devel/261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com/
>>>
>>>
>>> Phase 2: Add drm_connector properties mirroring the matching backlight device
>>> =============================================================================
>>>
>>> The plan is to add a drm_connector helper function, which optionally takes
>>> a pointer to the backlight device for the GPU's native backlight device,
>>> which will then mirror the backlight settings from the backlight device
>>> in a set of read/write brightness* properties on the connector.
>>>
>>> This function can then be called by GPU drivers for the drm_connector for
>>> the internal panel and it will then take care of everything. When there
>>> is no native GPU backlight device, or when it should not be used then
>>> (on x86) the helper will use the acpi_video_get_backlight_type() to
>>> determine which backlight-device should be used instead and it will find
>>> + mirror that one.
>>>
>>>
>>> Phase 3: Deprecate /sys/class/backlight uAPI
>>> ============================================
>>>
>>> Once most userspace has moved over to using the new drm_connector
>>> brightness props, a Kconfig option can be added to stop exporting
>>> the backlight-devices under /sys/class/backlight. The plan is to
>>> just disable the sysfs interface and keep the existing backlight-device
>>> internal kernel abstraction as is, since some abstraction for (non GPU
>>> native) backlight devices will be necessary regardless.
>>>
>>> It is unsure if we will ever be able to do this. For example people using
>>> non fully integrated desktop environments like e.g. sway often use custom
>>> scripts binded to hotkeys to get functionality like the brightness
>>> up/down keyboard hotkeys changing the brightness. This typically involves
>>> e.g. the xbacklight utility.
>>>
>>> Even if the xbacklight utility is ported to use kms with the new connector
>>> object brightness properties then this still will not work because
>>> changing the properties will require drm-master rights and e.g. sway will
>>> already hold those.
>>>
>>>
>>> The drm_connector brightness properties
>>> =======================================
>>>
>>> The new uAPI for this consists of 2 properties:
>>>
>>> 1. "display brightness": rw 0-int32_max property controlling the brightness setting
>>> of the connected display. The actual maximum of this will be less then
>>> int32_max and is given in "display brightness max".
>>
>> This could use a few words explaining the choice of range and property
>> type. (I assume it's because you can't change a range property's max at
>> runtime. Which is also why you need a separate max property.)
> 
> Why don't we just normalize the range to something sensible?

Because:

1. Userspace needs to know the effective range, some older laptops only have 7 or 8 levels
and GNOME by default does 20 steps when using the hotkeys. If GNOME does not know there are
only 7 or 8 levels then every other step won't do anything on those models.

2. Because we don't want to loose precision so we would need to normalize to something
really large like say 2^24, which means that userspace sees a false precision which
is not really there, see 1.

3. Because we still have a lot of userspace code using the old API and we cannot just
go and change the range there. So we would need to convert when going between the 2,
which eventually leads to rounding errors. E.g. backlight levels get saved/restored
over reboots by systemd using the old API. So we could end up with the value drifting 
over time because of rounding errors in back/forward conversion.

So all in all it is just easier and cleaner to have the new API mirror the old
API and give userspace the raw range of the chosen control method, minus a
possible min value cut off at the bottom of the range to avoid the screen
going black. Since this cutoff is a fixed conversion of +/- the min value
it does not have the round-trip rounding error problem.

> 
>>
>>> Unlike the /sys/class/backlight/foo/brightness this brightness property
>>> has a clear definition for the value 0. The kernel must ensure that 0
>>> means minimum brightness (so 0 should _never_ turn the backlight off).
>>> If necessary the kernel must enforce a minimum value by adding
>>> an offset to the value seen in the property to ensure this behavior.
>>>
>>> For example if necessary the driver must clamp 0-255 to 10-255, which then
>>> becomes 0-245 on the brightness property, adding 10 internally to writes
>>> done to the brightness property. This adding of an extra offset when
>>> necessary must only be done on the brightness property,
>>> the /sys/class/backlight interface should be left unchanged to not break
>>> userspace which may rely on 0 = off on some systems.
>>>
>>> Note amdgpu already does something like this even for /sys/class/backlight,
>>> see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.
>>>
>>> Also whenever possible the kernel must ensure that the brightness range
>>> is in perceived brightness, but this cannot always be guaranteed.
>>
>> Do you mean every step should be a visible change?
> 
> Hmm. I guess due to this. I'd prefer the opposite tbh so I could
> just put in my opregion BCLM patch. It's annoying to have to
> carry it locally just to have reasonable backlight behaviour.
> 

From your next email:

> After second though I guess I'm actually agreeing with Hans here.
> The current situation is where small change in the value near one
> end of the range does basically nothing, while a small change at
> the other of the range causes a massive brightness change. That
> is no good.

Yes exactly, this proposal actually suggests (suggests not mandates)
that your patch gets merged. As Jani mentioned it might even be
interesting too make the "curve" available as a property (on
select hw) which can be read + write by userspace and which then
gets pre-populated with the BCLM data. But that is for once the
basics have all landed. And we could already add the curve
internally before we have hashed out such an extra property.

Regards,

Hans


