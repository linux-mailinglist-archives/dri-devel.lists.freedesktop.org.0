Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C174FFB20
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 18:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CA810E4DB;
	Wed, 13 Apr 2022 16:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4620110E4DB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649867055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BIpdW5kOzRDP9nhLtZbUUPw9Qw38NoG700S91+yMq6k=;
 b=gZi0L0sZXCRO7WSGj+rkDS80MMLK8QeVRyiKxU+a7k4P7DYrm/IhE3VUc6hJODa9V/CSSg
 lPlG8o5xnOSkMAeNKg3qS1Lse6rUY6E4q5Y3lj85IkDjU+RHUvidDwCfzNEDvqbJ/2FYZL
 MiDOxMXyFP6nq6sp2aComEtS6ficM/s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-NCR5S8-FNhORTQceaNRR5Q-1; Wed, 13 Apr 2022 12:24:13 -0400
X-MC-Unique: NCR5S8-FNhORTQceaNRR5Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 cm1-20020a0564020c8100b0041d6b9cf07eso1343416edb.14
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:content-language:content-transfer-encoding;
 bh=BIpdW5kOzRDP9nhLtZbUUPw9Qw38NoG700S91+yMq6k=;
 b=6Xe43r1bASeM6zcDg2LWxNJQkiDfRsOI8FHdeAZDwTCQmlnCbEgERwIQ7N+JvRPOuf
 NEEKtb62BqXL7JhoWVdOSHhxEj0NfaiTQmKwoqIyzL91e31YvEXZq+FVACr3LvdXZvDZ
 dRUrsjEjx8pMoBKH0Z8bc9K3hvC8IL3aUeyViAsbbfIHK4/MEqXGX+6Df49bzIvHA76g
 IEDc5R1t9nxt/wzraPMcJlkctjlNBtlBX11dSQclKsWyGfOr1urYFbxzCQUsALonUo3b
 Sa/IS7s8DG6Pmpsz1cALNvXU8i4z6Hbm5vrn8ACvc9GTH0T0bQHP1ijmAIo1sxhSIe3G
 mNLQ==
X-Gm-Message-State: AOAM530AKMR1mFgI8ffjwOVLcMH6VsHqVJ5ma2Bm0Rm77LsbbhWTFdW5
 wXdWGGtQpI7Kr+FICYXLfAyapNUUnWWVDGgS5m1mgK0PM1QIUsOSM9j7Pt/bHhmfmqaZNjV0TaS
 vaEroO7RG1d89TPubum/1B+sBmN2NIWT3lZCSc6vTsWNG0K+fau/XLLJr7PyVtf3XR78s37b7xL
 O5vgiA
X-Received: by 2002:a17:907:724a:b0:6e8:4f12:b6fd with SMTP id
 ds10-20020a170907724a00b006e84f12b6fdmr23305393ejc.198.1649867051948; 
 Wed, 13 Apr 2022 09:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8Gai42abr3xZ9EsAIiNdcPrXoZfCLq2iDVtdEds1gvMKjogOqRrGuO3wC9DTI+g9bnzwq6Q==
X-Received: by 2002:a17:907:724a:b0:6e8:4f12:b6fd with SMTP id
 ds10-20020a170907724a00b006e84f12b6fdmr23305362ejc.198.1649867051533; 
 Wed, 13 Apr 2022 09:24:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a50858d000000b0041d71502d2dsm1376617edh.13.2022.04.13.09.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 09:24:10 -0700 (PDT)
Message-ID: <98519ba0-7f18-201a-ea34-652f50343158@redhat.com>
Date: Wed, 13 Apr 2022 18:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Hans de Goede <hdegoede@redhat.com>
Subject: [RFC] drm/kms: Stop registering multiple /sys/class/backlight devs
 for a single display
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
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

Hi All,

As discussed in the "[RFC] drm/kms: control display brightness through
drm_connector properties" thread, step 1 of the plan is to stop
registering multiple /sys/class/backlight devs for a single display.

On x86 there can be multiple firmware + direct-hw-access methods
for controlling the backlight and in some cases the kernel registers
multiple backlight-devices for a single internal laptop LCD panel,
2 common scenarios where this happens are:

1) i915 and nouveau unconditionally register their "native" backlight dev
   even on devices where /sys/class/backlight/acpi_video0 must be used
   to control the backlight, relying on userspace to prefer the "firmware"
   acpi_video0 device over "native" devices.

2) amdgpu and nouveau rely on the acpi_video driver initializing before
   them, which currently causes /sys/class/backlight/acpi_video0 to usually
   show up and then they register their own native backlight driver after
   which the drivers/acpi/video_detect.c code unregisters the acpi_video0
   device. This means that userspace briefly sees 2 devices and the
   disappearing of acpi_video0 after a brief time confuses the systemd
   backlight level save/restore code, see e.g.:
   https://bbs.archlinux.org/viewtopic.php?id=269920


Fixing kms driver unconditionally register their "native" backlight dev
=======================================================================

The plan for fixing 1) is to add a "bool native_backlight_available"
parameter to acpi_video_get_backlight_type(), which will be set to
true when called by e.g. the i915 code to check if it should register
its native backlight-device. This way acpi_video_get_backlight_type()
will know that a native backlight-device is (will be) available even
though it has not been registered yet and then it can return
acpi_backlight_native if that is the best option.

And then the i915 code will only actually register its native
backlight when acpi_backlight_native gets returned, thus hiding it
in scenario 1.


Fixing acpi_video0 getting registered for a brief time
======================================================

ATM the acpi_video code will delay parsing the ACPI video extensions
when an i915 opregion is present and will immediately parse these
+ register an acpi_video backlight device on laptops without Intel
integrated graphics. On laptops with i915 gfx the i915 driver calls
acpi_video_register() near the end of its probe() function when things
are ready for the acpi_video code to run, avoiding scenario 2.

Where as on systems without i915 gfx acpi_video's module_init()
immediately calls acpi_video_register() and then later the ACPI 
video_detect code calls acpi_video_unregister_backlight() to hide
the acpi_video# backlight-device on systems where the native
backlight-device should be used. The plan to fix this is to add
an acpi_video_register_backlight() and to make acpi_video_register()
do all the usual ACPI video extension probing, but have it skip
the actual registering of the backlight devices and have drivers
explicitly call acpi_video_register() after they have setup their
own native backlight-device. This way acpi_video_get_backlight_type()
already will know that a native backlight-device is available
(and preferred) when acpi_video_register_backlight() runs and
the registering of the acpi_video# device will then be skipped,
removing it briefly showing up and disappearing again.

One problem with this approach is that this relies on the GPU
driver to call acpi_video_register_backlight() when it is done.
One could argue that this is actually a feature, we have had
issues with some desktops where acpi_video falsely registers
its backlight (even though there is no internal LCD panel), but
this will likely cause issues on some systems (1). So the plan is
to queue a delayed work with an 8 second (1) delay from
acpi_video_register() and have that register the backlight-device
if not done already.


Other issues
============

The above only takes native vs acpi_video backlight issues into
account, there are also a couple of other scenarios which may
lead to multiple backlight-devices getting registered:

1) Apple laptops using the apple_gmux driver
2) Nvidia laptops using the (new) nvidia-wmi-ec-backlight driver
3) drivers/platform/x86 drivers calling acpi_video_set_dmi_backlight_type()
   to override the normal acpi_video_get_backlight_type() heuristics after
   the native/acpi_video drivers have already loaded

The plan for 1) + 2) is to extend the acpi_backlight_type enum with
acpi_backlight_gmux and acpi_backlight_nvidia_wmi_ec values and to add
detection of these 2 to acpi_video_get_backlight_type().

The plan for 3) is to move the DMI quirks from drivers/platform/x86
drivers which call acpi_video_set_dmi_backlight_type() in to the
existing DMI quirk table in drivers/acpi/video_detect.c, so that they
will be available during the first/every call of
acpi_video_get_backlight_type() and then remove
acpi_video_set_dmi_backlight_type()

Regards,

Hans


Footnotes:

1) E.g. systems using the nvidia binary driver, esp. systems using
the legacy nvidia binary driver versions. I at least expect the current
nvidia binary driver versions to get updated to actually call
acpi_video_register_backlight() when necessary.

2) The 8 second delay is the timeout plymouth uses waiting for a kms
device to show up when showing the bootsplash. This is based on the
amdgpu driver taking 5 seconds to initialize on some systems +
margin.


