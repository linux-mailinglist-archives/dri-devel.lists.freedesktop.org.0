Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7245B34DF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 12:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AE210EC5A;
	Fri,  9 Sep 2022 10:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F8410EC54
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662718375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9oOAUaE0o+Omx4MKMVctMXZTkhB/+h4IPQigLHUsfpA=;
 b=Tohh4Pt2M6vgSpNRpmg7s6Kz2yAwIRUkH+uvIsJ+u3j9BMtIS+Znx/MN8AD7lP2HoFPXEE
 i/w82pq4nOy8s2K/KULVVGIISvgLvLrYGdigZd4sUBihyPGQRdJznWTDZ1dKmMaOr4E7UI
 3XFpaBDtGBKnfGAnZp0BSvbkiZfJkl4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-B-5II-VsMaOVU3W_lKsOsg-1; Fri, 09 Sep 2022 06:12:54 -0400
X-MC-Unique: B-5II-VsMaOVU3W_lKsOsg-1
Received: by mail-ed1-f69.google.com with SMTP id
 b13-20020a056402350d00b0043dfc84c533so930734edd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 03:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:content-language:cc:to:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=9oOAUaE0o+Omx4MKMVctMXZTkhB/+h4IPQigLHUsfpA=;
 b=j2O4MDcCW+gmvr45kgRl8JFwF1qkgnaIo348/S7630RgkqAEmKpjAghM06HdZiSon/
 RL788x9Y5S8Gy6IvudN3bi1Vzf0GGwpVAdoVoF2NdglqFkI9gDcUo4Gm/HpJDl/98YVs
 Kq6jgBlQtEHaBFCT5XuwUPSOhcL03J8+ojE7VJb3S3FAwRnArWJtmYse7W+0zFZxVc60
 VhaL3r1wA3jUf1tBj2tr8nTvJiA3iQE2ArlOKEsLl4L6MpiIfwlAfvF2g1Ktsuy+xk/e
 ljs9Wi22x4eVDqpucV4vBJ2mvTd1TbwdLyPHL3MnKLERu+EzLzge3fw3DOwJ7NC/0wtI
 qNZw==
X-Gm-Message-State: ACgBeo3XtjaV6JY55QGFXTVz1LzCwBcApMuq+fQuPqKx32PNP69Hti2n
 ecPpAvbyzUCR6a70VMnkZYwrrnP85xuSw2e5Gikx7blYmjUB6GPPg1qj6b9UzaO10+TeCyxve3C
 txi++jTCax1LfkHKz2oTBbeOA24p5P2tJjoObrDr4W73ZdEsdSxzx7+Cbf3UFhIkaZI5D4i1Ikz
 H/BXeC
X-Received: by 2002:a17:907:6d05:b0:73d:8092:91ea with SMTP id
 sa5-20020a1709076d0500b0073d809291eamr9313648ejc.280.1662718373047; 
 Fri, 09 Sep 2022 03:12:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6bf4NVgQCojYKWZCpzalkhZyvHMRFjtJjXAe5RhWRBIbFSGHHyU1lNUGrNucsssWkDM5GDMg==
X-Received: by 2002:a17:907:6d05:b0:73d:8092:91ea with SMTP id
 sa5-20020a1709076d0500b0073d809291eamr9313626ejc.280.1662718372668; 
 Fri, 09 Sep 2022 03:12:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 pw13-20020a17090720ad00b0073ddb2eff27sm51541ejb.167.2022.09.09.03.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 03:12:52 -0700 (PDT)
Message-ID: <b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com>
Date: Fri, 9 Sep 2022 12:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Hans de Goede <hdegoede@redhat.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Subject: [RFC v2] drm/kms: control display brightness through drm_connector
 properties
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

Hi all,

Here is v2 of my "drm/kms: control display brightness through drm_connector properties" RFC:

Changes from version 1:
- Drop bl_brightness_0_is_min_brightness from list of new connector
  properties.
- Clearly define that 0 is always min-brightness when setting the brightness
  through the connector properties.
- Drop bl_brightness_control_method from list of new connector
  properties.
- Phase 1 of the plan has been completed

As discussed already several times in the past:
 https://www.x.org/wiki/Events/XDC2014/XDC2014GoedeBacklight/
 https://lore.kernel.org/all/4b17ba08-39f3-57dd-5aad-d37d844b02c6@linux.intel.com/

The current userspace API for brightness control offered by
/sys/class/backlight devices has various issues:

1. There is no way to map the backlight device to a specific
   display-output / panel (1)
2. Controlling the brightness requires root-rights requiring
   desktop-environments to use suid-root helpers for this.
3. The meaning of 0 is not clearly defined, it can be either off,
   or minimum brightness at which the display is still readable
   (in a low light environment)
4. It's not possible to change both the gamma and the brightness in the
   same KMS atomic commit. You'd want to be able to reduce brightness to
   conserve power, and counter the effects of that by changing gamma to
   reach a visually similar image. And you'd want to have the changes take
   effect at the same time instead of reducing brightness at some frame and
   change gamma at some other frame. This is pretty much impossible to do
   via the sysfs interface.

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
multiple backlight-devices for a single internal laptop LCD panel.

A plan to fix this was posted here:
https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
And a pull-req actually implementing this plan has been send out this week:
https://lore.kernel.org/dri-devel/261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com/


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

It is unsure if we will ever be able to do this. For example people using
non fully integrated desktop environments like e.g. sway often use custom
scripts binded to hotkeys to get functionality like the brightness
up/down keyboard hotkeys changing the brightness. This typically involves
e.g. the xbacklight utility.

Even if the xbacklight utility is ported to use kms with the new connector
object brightness properties then this still will not work because
changing the properties will require drm-master rights and e.g. sway will
already hold those.


The drm_connector brightness properties
=======================================

The new uAPI for this consists of 2 properties:

1. "display brightness": rw 0-int32_max property controlling the brightness setting
of the connected display. The actual maximum of this will be less then
int32_max and is given in "display brightness max".

Unlike the /sys/class/backlight/foo/brightness this brightness property
has a clear definition for the value 0. The kernel must ensure that 0
means minimum brightness (so 0 should _never_ turn the backlight off).
If necessary the kernel must enforce a minimum value by adding
an offset to the value seen in the property to ensure this behavior.

For example if necessary the driver must clamp 0-255 to 10-255, which then
becomes 0-245 on the brightness property, adding 10 internally to writes
done to the brightness property. This adding of an extra offset when
necessary must only be done on the brightness property,
the /sys/class/backlight interface should be left unchanged to not break
userspace which may rely on 0 = off on some systems.

Note amdgpu already does something like this even for /sys/class/backlight,
see the use of AMDGPU_DM_DEFAULT_MIN_BACKLIGHT in amdgpu.

Also whenever possible the kernel must ensure that the brightness range
is in perceived brightness, but this cannot always be guaranteed.


2. "display brightness max": ro 0-int32_max property giving the actual maximum
of the display's brightness setting. This will report 0 when brightness
control is not available.

The value of "display brightness max" may change at runtime, either by
a legacy drivers/platform/x86 backlight driver loading after the drm
driver has loaded; or when plugging in a monitor which allows brightness
control over DDC/CI. In both these cases the max value will change from 0
to the actual max value, indicating backlight control has become available
on this connector.


Future extensions
=================

Some hardware do adaptive brightness in hardware, rather then providing
an ALS sensor and letting userspace handle this.

One example of this is the Steam deck, which currently uses some custom
sysfs attributes to allow tweaking (and enable/disable?) the adaptive
brightness. Adding standardized uAPI for this through new
"display brightness *" properties seems like a natural extension of this
proposal.

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


