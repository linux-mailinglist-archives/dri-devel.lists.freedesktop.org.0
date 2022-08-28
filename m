Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 684465A3C96
	for <lists+dri-devel@lfdr.de>; Sun, 28 Aug 2022 10:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3A710EEE6;
	Sun, 28 Aug 2022 08:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5B10EEE6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661674126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGAHMAod5fLJkufKgg4C1wW7gbnQpDFzQ6kIZMFag6Q=;
 b=KOAwI93eZbRtXeN2Su4anmbxQ4/vIcRhv6tYRBhPVNGwdQpSelmNIqQAfomHjQFFlRGZYD
 YfZcSr4e1v/EWqSOICbEOTySfhri5JHaOD4geVu3DruNnuNEsPm4qAoX8MkVbdWiz19N9u
 sNnWeRz+/xMSA9dG0cjCcl2tn9hitLg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-jtHkevbROmOMy1lMfquEeg-1; Sun, 28 Aug 2022 04:08:44 -0400
X-MC-Unique: jtHkevbROmOMy1lMfquEeg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so3719619edd.5
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Aug 2022 01:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zGAHMAod5fLJkufKgg4C1wW7gbnQpDFzQ6kIZMFag6Q=;
 b=gYAfDcsNzU0A5ZyfaVIcQ0VoqGA72IHc1x4va/GOEJSxHHiLe8FwoItbs7n8V4ox5B
 QQyMFGzxi3e5RtJCShmByK/FqCFI0rtZsh6FopPLNfHq5xmelX/GjGeTJl7RpFeOZUCt
 nfERjnJIL67hkcraep8eaYy74fOWRj29VBije8hDTV1URuFLzdOTYLk1qF/Gr+ZQJU36
 5J2MdVsN7oAFvMRueXQZ7BcnOH+9gE4Za6LZW4HFlwSDmahhODHmnq11WG8GppV8L2d8
 B0MOGZ1m8MrGyI8+0wKHJ1XMQ1uUlyG0VpCvrVMGC8br0nmZ85YJbyQ1s3J60fODahXT
 pmeQ==
X-Gm-Message-State: ACgBeo0frQJRxickeM55QnZAhQqMHml1kQ62AkSN5G0kQ4HSzxxd9o2f
 IP8c3QGt8wPqgY/762UDdijkqmreNspwVIvEgEJJhOAFKdAWEJ6M6O+LS8gVOV7B9Gbfiv7BO23
 huN1jzzRh7lSills/dRZCcTenFmpo
X-Received: by 2002:a05:6402:3697:b0:448:2cf9:daf6 with SMTP id
 ej23-20020a056402369700b004482cf9daf6mr4064616edb.199.1661674123393; 
 Sun, 28 Aug 2022 01:08:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xGBtrc+B58NI8jJjfSIBIrZIdXZL4jg591z30CuBlw6FHXNAWM1hu64MM6RFigyoIBMUL8w==
X-Received: by 2002:a05:6402:3697:b0:448:2cf9:daf6 with SMTP id
 ej23-20020a056402369700b004482cf9daf6mr4064599edb.199.1661674123097; 
 Sun, 28 Aug 2022 01:08:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 l9-20020aa7c309000000b0043cc2c9f5adsm3945370edq.40.2022.08.28.01.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Aug 2022 01:08:42 -0700 (PDT)
Message-ID: <02b72b1e-479e-3dda-21c2-222f42a23c5d@redhat.com>
Date: Sun, 28 Aug 2022 10:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Yusuf Khan <yusisamerican@gmail.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <CAJoG2+8a9edJOx85DqH1oAd97cgY=_SaRT8_qEssjDtuObbA=g@mail.gmail.com>
 <b03afa5c-8c0c-4b52-1bec-a74f74b24d23@redhat.com>
 <CAJoG2+-_oskWgqttmACAKPJdJym5zv8MQmcnPzob4AaFZKFzwg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJoG2+-_oskWgqttmACAKPJdJym5zv8MQmcnPzob4AaFZKFzwg@mail.gmail.com>
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
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/25/22 23:40, Yusuf Khan wrote:
> Perhaps the Kconfig modifications could be postponed to stage 2
> since for people running distros that suddenly decide to disable
> /sys/class/backlight/ it may be impractical for them to recompile
> their kernels and such.

In step 1, the Kconfig option is just there to select the default
setting of the kernel commandline parameter. So when a distro
defaults that to disabling /sys/class/backlight (or making it
read-only) then the user can simple override it on the kernel
commandline. No re-compiling of kernels needed.

> Also stage 2 should probably take ~2 decades
> until it comes into being, for reference fbdev SPECIFIC drivers
> were removed from fedora just recently and because of that there
> were some issues with some user's systems. I understand it's much
> easier to change from the /sys/class/backlight/ interface to the one
> you have proposed than to change from fbdev to KMS though.

Yes chances are we will be stuck with the old sysfs API for a long
time to come. Note that since in some cases the backlight driver
is not part of the GPU driver, but rather part of e.g. dell-laptop
we will need the backlight-device abstraction in the kernel going
forward regardless of what happens with /sys/class/backlight.

So the cleanup resulting from removing it completely will not
be that big as the backlight-device abstraction will stay it
will only be the sysfs interface which disappears.

As such just having a kernel cmdline parameter to hide/unhide
it might be good enough.

Regards,

Hans



> 
> On Thu, Aug 25, 2022 at 3:27 AM Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     Hi Yusuf,
> 
>     On 8/24/22 04:18, Yusuf Khan wrote:
>     > Sorry for the necro-bump, I hadnt seen this go by
> 
>     No problem.
> 
>     > My main concern with this proposal is the phasing out of /sys/class/backlight/.
>     > Currently on the user(user, not userland) level its easier for me to just modify
>     > the file and be done with it. xbacklight doesnt tell me when its failed,
>     > brightnessctl doesnt make assumptions about what device is what, and
>     > other brightness setting applications ive seen are much worse than them.
>     > Someone needs to create a userland application thats less inconvenient
>     > than `echo`ing into /sys/class/backlight with a name that human beings can
>     > actually remember before I stop using the sysfs, perhaps "setbrightness"
>     > could be the binary's name? Also I dont think its wise to disable or make it
>     > read only though Kconfig as older apps may depend on it, maybe add a
>     > kernel param that disables the old interface so bigger distros can pressure
>     > app makers into changing the interface? As a big draw for DDC/CI is that
>     > many displays support it as a way to change brightness(even if you arent
>     > doing anything special that would break the old interface) perhaps it could
>     > be an early adopter to that kernel parameter?
> 
>     Right, so deprecating the /sys/class/backlight API definitely is the last
>     step and probably is years away. As you say hiding / making it read-only
>     should probably be a kernel-parameter at first, with maybe a Kconfig
>     option to set the default. So the depcration would go like this:
> 
>     1. Add:
>     A kernel-parameter to allow hiding or read-only-ing the sysfs interface +
>     Kconfig to select the default +
>     dev_warn_once() when the old API is used
> 
>     2. (much later) Drop the Kconfig option and default to hiding/read-only
> 
>     3. (even later) Maybe completely remove the sysfs interface?
> 
>     Note the hiding vs read-only thing is to be decided. ATM I'm rather more
>     focused on getting the new API in place then on deprecating the old one :)
> 
>     Anyways I fully agree that we need to do the deprecation carefully and
>     slowly. This is likely going to take multiple years and then some ...
> 
>     Regards,
> 
>     Hans
> 
> 
> 
>     >
>     > On Thu, Apr 7, 2022 at 10:39 AM Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com> <mailto:hdegoede@redhat.com <mailto:hdegoede@redhat.com>>> wrote:
>     >
>     >     As discussed already several times in the past:
>     >      https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/ <https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/> <https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/ <https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/>>
>     >      https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/ <https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/> <https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/ <https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/>>
>     >
>     >     The current userspace API for brightness control offered by
>     >     /sys/class/backlight devices has various issues, the biggest 2 being:
>     >
>     >     1. There is no way to map the backlight device to a specific
>     >        display-output / panel (1)
>     >     2. Controlling the brightness requires root-rights requiring
>     >        desktop-environments to use suid-root helpers for this.
>     >
>     >     As already discussed on various conference's hallway tracks
>     >     and as has been proposed on the dri-devel list once before (2),
>     >     it seems that there is consensus that the best way to to solve these
>     >     2 issues is to add support for controlling a video-output's brightness
>     >     through properties on the drm_connector.
>     >
>     >     This RFC outlines my plan to try and actually implement this,
>     >     which has 3 phases:
>     >
>     >
>     >     Phase 1: Stop registering multiple /sys/class/backlight devs for a single display
>     >     =================================================================================
>     >
>     >     On x86 there can be multiple firmware + direct-hw-access methods
>     >     for controlling the backlight and in some cases the kernel registers
>     >     multiple backlight-devices for a single internal laptop LCD panel:
>     >
>     >     a) i915 and nouveau unconditionally register their "native" backlight dev
>     >        even on devices where /sys/class/backlight/acpi_video0 must be used
>     >        to control the backlight, relying on userspace to prefer the "firmware"
>     >        acpi_video0 device over "native" devices.
>     >     b) amdgpu and nouveau rely on the acpi_video driver initializing before
>     >        them, which currently causes /sys/class/backlight/acpi_video0 to usually
>     >        show up and then they register their own native backlight driver after
>     >        which the drivers/acpi/video_detect.c code unregisters the acpi_video0
>     >        device. This means that userspace briefly sees 2 devices and the
>     >        disappearing of acpi_video0 after a brief time confuses the systemd
>     >        backlight level save/restore code, see e.g.:
>     >        https://bbs.archlinux.org/viewtopic.php?id=269920 <https://bbs.archlinux.org/viewtopic.php?id=269920> <https://bbs.archlinux.org/viewtopic.php?id=269920 <https://bbs.archlinux.org/viewtopic.php?id=269920>>
>     >
>     >     I already have a pretty detailed plan to tackle this, which I will
>     >     post in a separate RFC email. I plan to start working on this right
>     >     away, as it will be good to have this fixed regardless.
>     >
>     >
>     >     Phase 2: Add drm_connector properties mirroring the matching backlight device
>     >     =============================================================================
>     >
>     >     The plan is to add a drm_connector helper function, which optionally takes
>     >     a pointer to the backlight device for the GPU's native backlight device,
>     >     which will then mirror the backlight settings from the backlight device
>     >     in a set of read/write brightness* properties on the connector.
>     >
>     >     This function can then be called by GPU drivers for the drm_connector for
>     >     the internal panel and it will then take care of everything. When there
>     >     is no native GPU backlight device, or when it should not be used then
>     >     (on x86) the helper will use the acpi_video_get_backlight_type() to
>     >     determine which backlight-device should be used instead and it will find
>     >     + mirror that one.
>     >
>     >
>     >     Phase 3: Deprecate /sys/class/backlight uAPI
>     >     ============================================
>     >
>     >     Once most userspace has moved over to using the new drm_connector
>     >     brightness props, a Kconfig option can be added to stop exporting
>     >     the backlight-devices under /sys/class/backlight. The plan is to
>     >     just disable the sysfs interface and keep the existing backlight-device
>     >     internal kernel abstraction as is, since some abstraction for (non GPU
>     >     native) backlight devices will be necessary regardless.
>     >
>     >     An alternative to disabling the sysfs class entirely, would be
>     >     to allow setting it to read-only through Kconfig.
>     >
>     >
>     >     What scale to use for the drm_connector bl_brightness property?
>     >     ===============================================================
>     >
>     >     The tricky part of this plan is phase 2 and then esp. defining what the
>     >     new brightness properties will look like and how they will work.
>     >
>     >     The biggest challenge here is to decide on a fixed scale for the main
>     >     brightness property, say 0-65535, using scaling where the actual hw scale
>     >     is different, or if this should simply be a 1:1 mirror of the current
>     >     backlight interface, with the actual hw scale / brightness_max value
>     >     exposed as a drm_connector property.
>     >
>     >     1:1 advantages / 0-65535 disadvantages
>     >     - Userspace will likely move over to the connector-props quite slowly and
>     >       we can expect various userspace bits, esp. also custom user scripts, to
>     >       keep using the old uAPI for a long time. Using the 2 APIs are intermixed
>     >       is fine when using a 1:1 brightness scale mapping. But if we end up doing
>     >       a scaling round-trip all the time then eventually the brightness is going
>     >       do drift. This can even happen if the user never changes the brightness
>     >       when userspace saves it over suspend/resume or reboots.
>     >     - Almost all laptops have brightness up/down hotkeys. E.g GNOME decides
>     >       on a step size for the hotkeys by doing min(brightness_max/20, 1).
>     >       Some of the vendor specific backlight fw APIs (e.g. dell-laptop) have
>     >       only 8 steps. When giving userspace the actual max_brightness value, then
>     >       this will all work just fine. When hardcode brightness_max to 65535 OTOH
>     >       then in this case GNOME will still give the user 20 steps where only 1
>     >       in every 2-3 steps actually changes the brightness which IMHO is
>     >       an unacceptably bad user experience.
>     >
>     >     0-65535 advantages / 1:1 disadvantages
>     >     - Without a fixed scale for the brightness property the brightness_max
>     >       value may change after an userspace application's initial enumeration
>     >       of the drm_connector. This can happen when neither the native GPU nor
>     >       the acpi_video backlight devices are present/usable in this case
>     >       acpi_video_get_backlight_type() will _assume_ a vendor specific fw API
>     >       will be used for backlight control and the driver proving the "vendor"
>     >       backlight device will show up much later and may even never show-up,
>     >       so waiting for it is not an option. With a fixed 0-65535 scale userspace
>     >       can just always assume this and the drm_connector backlight props helper
>     >       code can even cache writes and send it to the actual backlight device
>     >       when it shows up. With a 1:1 mapping userspace needs to listen for
>     >       a uevent and then update the brightness range on such an event.
>     >
>     >     I believe that the 1:1 mapping advantages out way the disadvantages
>     >     here. Also note that current userspace already blindly assumes that
>     >     all relevant drivers are loaded before the graphical-environment
>     >     starts and all the desktop environments as such already only do
>     >     a single scan of /sys/class/backlight when they start. So when
>     >     userspace forgets to add code to listen for the uevent when switching
>     >     to the new API nothing changes; and with the uevent userspace actually
>     >     gets a good mechanism to detect backlight drivers loading after
>     >     the graphical-environment has already started.
>     >
>     >     So based on this here is my proposal for a set of new brightness
>     >     properties on the drm_connector object. Note these are all prefixed with
>     >     bl which stands for backlight, which is technically not correct for OLED.
>     >     But we need a prefix to avoid a name collision with the "brightness"
>     >     attribute which is part of the existing TV specific properties and IMHO
>     >     it is good to have a common prefix to make it clear that these all
>     >     belong together.
>     >
>     >
>     >     The drm_connector brightness properties
>     >     =======================================
>     >
>     >     bl_brightness: rw 0-int32_max property controlling the brightness setting
>     >     of the connected display. The actual maximum of this will be less then
>     >     int32_max and is given in bl_brightness_max.
>     >
>     >     bl_brightness_max: ro 0-int32_max property giving the actual maximum
>     >     of the display's brightness setting. This will report 0 when brightness
>     >     control is not available (yet).
>     >
>     >     bl_brightness_0_is_min_brightness: ro, boolean
>     >     When this is set to true then it is safe to set brightness to 0
>     >     without worrying that this completely turns the backlight off causing
>     >     the screen to become unreadable. When this is false setting brightness
>     >     to 0 may turn the backlight off, but this is _not_ guaranteed.
>     >     This will e.g. be true when directly driving a PWM and the video-BIOS
>     >     has provided a minimum (non 0) duty-cycle below which the driver will
>     >     never go.
>     >
>     >     bl_brightness_control_method: ro, enum, possible values:
>     >     none:     The GPU driver expects brightness control to be provided by another
>     >               driver and that driver has not loaded yet.
>     >     unknown:  The underlying control mechanism is unknown.
>     >     pwm:      The brightness property directly controls the duty-cycle of a PWM
>     >               output.
>     >     firmware: The brightness is controlled through firmware calls.
>     >     DDC/CI:   The brightness is controlled through the DDC/CI protocol.
>     >     gmux:     The brightness is controlled by the GMUX.
>     >     Note this enum may be extended in the future, so other values may
>     >     be read, these should be treated as "unknown".
>     >
>     >     When brightness control becomes available after being reported
>     >     as not available before (bl_brightness_control_method=="none")
>     >     a uevent with CONNECTOR=<connector-id> and
>     >     PROPERTY=<bl_brightness_control_method-id> will be generated
>     >     at this point all the properties must be re-read.
>     >
>     >     When/once brightness control is available then all the read-only
>     >     properties are fixed and will never change.
>     >
>     >     Besides the "none" value for no driver having loaded yet,
>     >     the different bl_brightness_control_method values are intended for
>     >     (userspace) heuristics for such things as the brightness setting
>     >     linearly controlling electrical power or setting perceived brightness.
>     >
>     >     Regards,
>     >
>     >     Hans
>     >
>     >
>     >     1) The need to be able to map the backlight device to a specific display
>     >     has become clear once more with the recent proposal to add DDCDI support:
>     >     https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/ <https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/> <https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/ <https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/>>
>     >
>     >     2) https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/ <https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/> <https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/ <https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/>>
>     >     Note this proposal included a method for userspace to be able to tell the
>     >     kernel if the native/acpi_video/vendor backlight device should be used,
>     >     but this has been solved in the kernel for years now:
>     >      https://www.spinics.net/lists/linux-acpi/msg50526.html <https://www.spinics.net/lists/linux-acpi/msg50526.html> <https://www.spinics.net/lists/linux-acpi/msg50526.html <https://www.spinics.net/lists/linux-acpi/msg50526.html>>
>     >     An initial implementation of this proposal is available here:
>     >      https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight <https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight> <https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight <https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight>>
>     >
> 

