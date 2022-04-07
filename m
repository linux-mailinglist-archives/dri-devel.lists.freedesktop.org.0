Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158DD4F83AF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5348010EB20;
	Thu,  7 Apr 2022 15:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A729010E375
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649345945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iGF2Ok8tOyeHVhA6DjP2MAY9ZeZQvzWp19AuCf0eAFY=;
 b=iXX0+IF/o2Yigmq/CaGlYR8lhH2UZFO8n7n40blVzAr4RAtYAgtd469ESiPRCLbY7I9o6c
 0Ndoi1VY+01HNwrw3IpsCvfDtRaYXg/mUnpJcZYuuLl9JGZ5oZUYEYpQiLh+RVttZvY9tx
 LiCu7NZ3Yu4wa4N+6K5NWmCYywNSGpg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-Nzy8zJRvMkiuG1V-xl2Lew-1; Thu, 07 Apr 2022 11:39:02 -0400
X-MC-Unique: Nzy8zJRvMkiuG1V-xl2Lew-1
Received: by mail-ed1-f72.google.com with SMTP id
 m23-20020a056402051700b0041cd56be44cso3159128edv.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 08:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=iGF2Ok8tOyeHVhA6DjP2MAY9ZeZQvzWp19AuCf0eAFY=;
 b=GFefrjDGeTvR+E54vdczEFBS43RIAF3q0PSXay/0OFUsQu6p9BdaJvANvv1wNCxosE
 4ZdYI9S+ZHpUqrqSDbqJYxgw5U895aB7XR26MBl2ORf3Obc8814XIGJG4bK0GZKGrOqh
 r1PggTlLnWnJgbrWiMUpRN644Abjy7lgqYKTuC4UJrXtSY1YgSMl1VNjfUqFsndcMW2z
 eUMol/zEJDCrY2RuizH2zDpRfekE8/BIG3H1PWW8wPN5RxWi3CyUrtcAdX/Ta4xY5ciQ
 m3EHwZ965l/LVuu0QlNWIk172WAYHck3QhgWnR1SXxBZGrFin2ZGMVkiahCN2QtlTi4m
 eJgg==
X-Gm-Message-State: AOAM531U42V8C0dkLw4y/pwF+VWuC8TkD9osVU8KVbZJUEQMs8GB116p
 Ka5i97d72fyK/Xq8ex/IG9XW7Ao/l5iTjj0CPu+9FapS8bwIohO3karS3SxA3/ZiZuu6gHlht7l
 R7X+cksbGO8/tjc3eRC8V9KQL2SUXK+Kwehf8rjqsSmW0v02WadsAhKwLupBVC0QNk3iLrAvrY1
 RasExG
X-Received: by 2002:a50:d798:0:b0:41c:c2f2:2c5c with SMTP id
 w24-20020a50d798000000b0041cc2f22c5cmr14952071edi.311.1649345940998; 
 Thu, 07 Apr 2022 08:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZpTXU5MOoGq79dVXFz4B6aKB2wZTE6rlFt82iHKadZpxVOeXMN+U9ZllrpD8sZZ7xiJMB7g==
X-Received: by 2002:a50:d798:0:b0:41c:c2f2:2c5c with SMTP id
 w24-20020a50d798000000b0041cc2f22c5cmr14952033edi.311.1649345940546; 
 Thu, 07 Apr 2022 08:39:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a170906289600b006e44a0c1105sm7809720ejd.46.2022.04.07.08.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 08:38:59 -0700 (PDT)
Message-ID: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
Date: Thu, 7 Apr 2022 17:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
From: Hans de Goede <hdegoede@redhat.com>
Subject: [RFC] drm/kms: control display brightness through drm_connector
 properties
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As discussed already several times in the past:
 https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
 https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/

The current userspace API for brightness control offered by
/sys/class/backlight devices has various issues, the biggest 2 being:

1. There is no way to map the backlight device to a specific
   display-output / panel (1)
2. Controlling the brightness requires root-rights requiring
   desktop-environments to use suid-root helpers for this.

As already discussed on various conference's hallway tracks
and as has been proposed on the dri-devel list once before (2),
it seems that there is consensus that the best way to to solve these
2 issues is to add support for controlling a video-output's brightness
through properties on the drm_connector.

This RFC outlines my plan to try and actually implement this,
which has 3 phases:


Phase 1: Stop registering multiple /sys/class/backlight devs for a single display
=================================================================================

On x86 there can be multiple firmware + direct-hw-access methods
for controlling the backlight and in some cases the kernel registers
multiple backlight-devices for a single internal laptop LCD panel:

a) i915 and nouveau unconditionally register their "native" backlight dev
   even on devices where /sys/class/backlight/acpi_video0 must be used
   to control the backlight, relying on userspace to prefer the "firmware"
   acpi_video0 device over "native" devices.
b) amdgpu and nouveau rely on the acpi_video driver initializing before
   them, which currently causes /sys/class/backlight/acpi_video0 to usually
   show up and then they register their own native backlight driver after
   which the drivers/acpi/video_detect.c code unregisters the acpi_video0
   device. This means that userspace briefly sees 2 devices and the
   disappearing of acpi_video0 after a brief time confuses the systemd
   backlight level save/restore code, see e.g.:
   https://bbs.archlinux.org/viewtopic.php?id=269920

I already have a pretty detailed plan to tackle this, which I will
post in a separate RFC email. I plan to start working on this right
away, as it will be good to have this fixed regardless.


Phase 2: Add drm_connector properties mirroring the matching backlight device
=============================================================================

The plan is to add a drm_connector helper function, which optionally takes
a pointer to the backlight device for the GPU's native backlight device,
which will then mirror the backlight settings from the backlight device
in a set of read/write brightness* properties on the connector.

This function can then be called by GPU drivers for the drm_connector for
the internal panel and it will then take care of everything. When there
is no native GPU backlight device, or when it should not be used then
(on x86) the helper will use the acpi_video_get_backlight_type() to
determine which backlight-device should be used instead and it will find
+ mirror that one.


Phase 3: Deprecate /sys/class/backlight uAPI
============================================

Once most userspace has moved over to using the new drm_connector
brightness props, a Kconfig option can be added to stop exporting
the backlight-devices under /sys/class/backlight. The plan is to
just disable the sysfs interface and keep the existing backlight-device
internal kernel abstraction as is, since some abstraction for (non GPU
native) backlight devices will be necessary regardless.

An alternative to disabling the sysfs class entirely, would be
to allow setting it to read-only through Kconfig.


What scale to use for the drm_connector bl_brightness property?
===============================================================

The tricky part of this plan is phase 2 and then esp. defining what the
new brightness properties will look like and how they will work.

The biggest challenge here is to decide on a fixed scale for the main
brightness property, say 0-65535, using scaling where the actual hw scale
is different, or if this should simply be a 1:1 mirror of the current
backlight interface, with the actual hw scale / brightness_max value
exposed as a drm_connector property.

1:1 advantages / 0-65535 disadvantages
- Userspace will likely move over to the connector-props quite slowly and
  we can expect various userspace bits, esp. also custom user scripts, to
  keep using the old uAPI for a long time. Using the 2 APIs are intermixed
  is fine when using a 1:1 brightness scale mapping. But if we end up doing
  a scaling round-trip all the time then eventually the brightness is going
  do drift. This can even happen if the user never changes the brightness
  when userspace saves it over suspend/resume or reboots.
- Almost all laptops have brightness up/down hotkeys. E.g GNOME decides
  on a step size for the hotkeys by doing min(brightness_max/20, 1).
  Some of the vendor specific backlight fw APIs (e.g. dell-laptop) have
  only 8 steps. When giving userspace the actual max_brightness value, then
  this will all work just fine. When hardcode brightness_max to 65535 OTOH
  then in this case GNOME will still give the user 20 steps where only 1
  in every 2-3 steps actually changes the brightness which IMHO is
  an unacceptably bad user experience.

0-65535 advantages / 1:1 disadvantages
- Without a fixed scale for the brightness property the brightness_max
  value may change after an userspace application's initial enumeration
  of the drm_connector. This can happen when neither the native GPU nor
  the acpi_video backlight devices are present/usable in this case
  acpi_video_get_backlight_type() will _assume_ a vendor specific fw API
  will be used for backlight control and the driver proving the "vendor"
  backlight device will show up much later and may even never show-up,
  so waiting for it is not an option. With a fixed 0-65535 scale userspace
  can just always assume this and the drm_connector backlight props helper
  code can even cache writes and send it to the actual backlight device
  when it shows up. With a 1:1 mapping userspace needs to listen for
  a uevent and then update the brightness range on such an event.

I believe that the 1:1 mapping advantages out way the disadvantages
here. Also note that current userspace already blindly assumes that
all relevant drivers are loaded before the graphical-environment
starts and all the desktop environments as such already only do
a single scan of /sys/class/backlight when they start. So when
userspace forgets to add code to listen for the uevent when switching
to the new API nothing changes; and with the uevent userspace actually
gets a good mechanism to detect backlight drivers loading after
the graphical-environment has already started.

So based on this here is my proposal for a set of new brightness
properties on the drm_connector object. Note these are all prefixed with
bl which stands for backlight, which is technically not correct for OLED.
But we need a prefix to avoid a name collision with the "brightness"
attribute which is part of the existing TV specific properties and IMHO
it is good to have a common prefix to make it clear that these all
belong together.


The drm_connector brightness properties
=======================================

bl_brightness: rw 0-int32_max property controlling the brightness setting
of the connected display. The actual maximum of this will be less then
int32_max and is given in bl_brightness_max.

bl_brightness_max: ro 0-int32_max property giving the actual maximum
of the display's brightness setting. This will report 0 when brightness
control is not available (yet).

bl_brightness_0_is_min_brightness: ro, boolean
When this is set to true then it is safe to set brightness to 0
without worrying that this completely turns the backlight off causing
the screen to become unreadable. When this is false setting brightness
to 0 may turn the backlight off, but this is _not_ guaranteed.
This will e.g. be true when directly driving a PWM and the video-BIOS
has provided a minimum (non 0) duty-cycle below which the driver will
never go.

bl_brightness_control_method: ro, enum, possible values:
none:     The GPU driver expects brightness control to be provided by another
          driver and that driver has not loaded yet.
unknown:  The underlying control mechanism is unknown.
pwm:      The brightness property directly controls the duty-cycle of a PWM
          output.
firmware: The brightness is controlled through firmware calls.
DDC/CI:   The brightness is controlled through the DDC/CI protocol.
gmux:     The brightness is controlled by the GMUX.
Note this enum may be extended in the future, so other values may
be read, these should be treated as "unknown".

When brightness control becomes available after being reported
as not available before (bl_brightness_control_method=="none")
a uevent with CONNECTOR=<connector-id> and
PROPERTY=<bl_brightness_control_method-id> will be generated
at this point all the properties must be re-read.

When/once brightness control is available then all the read-only
properties are fixed and will never change.

Besides the "none" value for no driver having loaded yet,
the different bl_brightness_control_method values are intended for
(userspace) heuristics for such things as the brightness setting
linearly controlling electrical power or setting perceived brightness.

Regards,

Hans


1) The need to be able to map the backlight device to a specific display
has become clear once more with the recent proposal to add DDCDI support:
https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/

2) https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/
Note this proposal included a method for userspace to be able to tell the
kernel if the native/acpi_video/vendor backlight device should be used,
but this has been solved in the kernel for years now:
 https://www.spinics.net/lists/linux-acpi/msg50526.html
An initial implementation of this proposal is available here:
 https://cgit.freedesktop.org/~mperes/linux/log/?h=backlight

