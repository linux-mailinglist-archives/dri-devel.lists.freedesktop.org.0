Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D128288E0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 16:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BD110E05F;
	Tue,  9 Jan 2024 15:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6C710E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 15:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704813712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A0vlnWDmYgjsjQdIBVQqu0hvaJod3A6G6ehCH509XEc=;
 b=e5b+d0Hpct/NpIbXDhZCvmSVIjDuBxUJhD1HB+TUvLJt0iXDW5yWSQ0/w8Hw5/W4Rr8qsl
 VMwSCrYj2mAXhrUp9mtXmbEetYctWwhZKz2It2m7TgFSYahUf2ZrjYZOvu3qG1N+sJwYAo
 6M7z99osRUd9oe7wZZunmuyMWZOVf4g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-rCp3xFqWNfuMK8H44x4l0Q-1; Tue, 09 Jan 2024 10:21:51 -0500
X-MC-Unique: rCp3xFqWNfuMK8H44x4l0Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33680148d24so2042806f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 07:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704813710; x=1705418510;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A0vlnWDmYgjsjQdIBVQqu0hvaJod3A6G6ehCH509XEc=;
 b=Xi1O7RD9UiUCwn/HmucrxxeNQ6YlsYey5kmPzEu6y26HPo2rGg5evH+ueM+5bQjsOf
 aWei6N+noF8UuBb06D2F7zgqbSObxBDZ/HhDC8qooTZoEJAU14Ts+9n129Ee9TXyl+fF
 b8DQggIqT9Dar7bVBp7j1sRWa12d0xgMk8eUb3YRFAHCp+jeeK2cTtc0MiaJrDGFfkyi
 bGlhKzFSM3U8y4l8yLP22wF5sn7IfaUjsiIYWZQlFsXqvCNxz46n6PmLBHzIJRWjQtJm
 YPSAOs3LIPS9n1WXqnWS5lGkdeKks6o3+gVWtPetROXjnO+IAFjfkWpYtHcI0zMAWeRu
 oeEw==
X-Gm-Message-State: AOJu0YyoC8bqei474/020GAhQPABIY6r51AYt9nGhA1r5rGuWwBw4rgM
 iK8KgpBqh+kS73FcCENNTgUXst+rrGNlGvhCN8j9H1o7TZsyc2mFnvPjjqkYa+QjiNI1NPPHAOy
 kJcD/H+6K6116CfHJEGjKLBUTV4X0Nph6cFJf
X-Received: by 2002:a05:6000:1841:b0:337:78a7:559d with SMTP id
 c1-20020a056000184100b0033778a7559dmr391905wri.16.1704813710305; 
 Tue, 09 Jan 2024 07:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/4434fsZ8vrLq0dFEbXoQrDdtSflkOAHiWGf5RnB8a8efIQKXp/1XTfbUlvaLbPVcO1dWYQ==
X-Received: by 2002:a05:6000:1841:b0:337:78a7:559d with SMTP id
 c1-20020a056000184100b0033778a7559dmr391895wri.16.1704813709951; 
 Tue, 09 Jan 2024 07:21:49 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p11-20020a056000018b00b003362d0eefd3sm2661781wrx.20.2024.01.09.07.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 07:21:49 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/imagination: Defer probe if requested firmware is
 not available
In-Reply-To: <ZZ1R7WopPeaW3y44@phenom.ffwll.local>
References: <20240109120604.603700-1-javierm@redhat.com>
 <ZZ1IellMvvyFlQaF@phenom.ffwll.local>
 <8734v6r51h.fsf@minerva.mail-host-address-is-not-set>
 <ZZ1R7WopPeaW3y44@phenom.ffwll.local>
Date: Tue, 09 Jan 2024 16:21:48 +0100
Message-ID: <87ttnmpm5v.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

> On Tue, Jan 09, 2024 at 02:48:42PM +0100, Javier Martinez Canillas wrote:
>> Daniel Vetter <daniel@ffwll.ch> writes:
>> 
>> Hello Sima,
>> 
>> Thanks for your feedback.
>> 
>> > On Tue, Jan 09, 2024 at 01:05:59PM +0100, Javier Martinez Canillas wrote:
>> >> The device is initialized in the driver's probe callback and as part of
>> >> that initialization, the required firmware is loaded. But this fails if
>> >> the driver is built-in and the firmware isn't present in the initramfs:
>> >> 
>> >> $ dmesg | grep powervr
>> >> [    2.969757] powervr fd00000.gpu: Direct firmware load for powervr/rogue_33.15.11.3_v1.fw failed with error -2
>> >> [    2.979727] powervr fd00000.gpu: [drm] *ERROR* failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-2)
>> >> [    2.989885] powervr: probe of fd00000.gpu failed with error -2
>> >> 
>> >> $ ls -lh /lib/firmware/powervr/rogue_33.15.11.3_v1.fw.xz
>> >> -rw-r--r-- 1 root root 51K Dec 12 19:00 /lib/firmware/powervr/rogue_33.15.11.3_v1.fw.xz
>> >> 
>> >> To prevent the probe to fail for this case, let's defer the probe if the
>> >> firmware isn't available. That way, the driver core can retry it and get
>> >> the probe to eventually succeed once the root filesystem has been mounted.
>> >> 
>> >> If the firmware is also not present in the root filesystem, then the probe
>> >> will never succeed and the reason listed in the debugfs devices_deferred:
>> >> 
>> >> $ cat /sys/kernel/debug/devices_deferred
>> >> fd00000.gpu     powervr: failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-517)
>> >> 
>> >> Fixes: f99f5f3ea7ef ("drm/imagination: Add GPU ID parsing and firmware loading")
>> >> Suggested-by: Maxime Ripard <mripard@kernel.org>
>> >> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> >
>> > Uh that doesn't work.
>> >
>> > Probe is for "I'm missing a struct device" and _only_ that. You can't
>> > assume that probe deferral will defer enough until the initrd shows up.
>> >
>> 
>> Fair.
>> 
>> > You need to fix this by fixing the initrd to include the required
>> > firmwares. This is what MODULE_FIRMWARE is for, and if your initrd fails
>> > to observe that it's just broken.
>> >
>> 
>> Tha's already the case, when is built as a module the initrd (dracut in
>> this particular case) does figure out that the firmware needs to be added
>> but that doesn't work when the DRM driver is built-in. Because dracut is
>> not able to figure out and doesn't even have a powervr.ko info to look at
>> whatever is set by the MODULE_FIRMWARE macro.
>
> Yeah built-in drivers that require firmware don't really work. I'm not
> sure it changed, but a while ago you had to actually include these in the
> kernel image itself (initrd was again too late), and that gives you
> something you can't even ship because it links blobs with gplv2 kernel.
>

Indeed and even let the legal question aside, doing that makes the kernel
too platform specific, even more than building drivers in.

> Maybe that changed and the initramfs is set up early enough now that it's
> sufficient to have it there ...
>

It does work if I force to include the firmware file in the initrd, e.g:

$ cat /etc/dracut.conf.d/firmware.conf 
install_items+=" /lib/firmware/powervr/rogue_33.15.11.3_v1.fw "

> Either way I think this needs module/kernel-image build changes so that
> the list of firmware images needed for the kernel itself is dumped
> somewhere, so that dracut can consume it and tdrt. My take at least.
>

That's a very good idea indeed. Dracut just looking at loaded modules and
their respective module info doesn't really work for built-in drivers...

>> > Yes I know as long as you have enough stuff built as module so that there
>> > will be _any_ kind of device probe after the root fs is mounted, this
>> > works, because that triggers a re-probe of everything. But that's the most
>> > kind of fragile fix there is.
>> >
>> 
>> Is fragile that's true but on the other hand it does solve the issue in
>> pratice. The whole device probal mechanism is just a best effort anyways.
>> 
>> > If you want to change that then I think that needs an official blessing
>> > from Greg KH/device core folks.
>> >

Ok. Let's see what Greg says, I think $SUBJECT is the path of least
resistance and something that is simple enough that could be easy to
backport / cherry-pick if needed.

But also agree with you that it's fragile (just like the driver as is).

Something that I forgot to mention but came up in our IRC discussion is
that the powervr driver is render only, so deferring the probe won't
affect the display that's driven by a different driver (tidss in my case).

>> 
>> I liked this approach due its simplicity but an alternative (and more
>> complex) solution could be to delay the firmware request and not do it at
>> probe time.
>> 
>> For example, the following (only barely tested) patch solves the issue for
>> me as well but it's a bigger change to this driver and wasn't sure if will
>> be acceptable:
>
> I think this is still barking up the wrong tree. I think there's two
> proper fixes:
>
> - make the "EPROBE_DEFER delays until rootfs no matter what" official and
>   documented policy. That's much better than drivers hand-rolling
>   EPROBE_DEFER each in their own driver code.
>

I would love that to be the case but the whole probe and deferral is
already quite messy. Most subsystems just keep deferring but there are
some that timeout after an arbitrary value (currently that being 30 secs)
and there's  a "deferred_probe_timeout" kernel cmdline param to change it.

I even tried to disable that timeout by default to have an official and
consistent deferral policy but unfortunately the patches were nacked due
some people relying on the existing beahviour of the deferral timing out:

https://lore.kernel.org/lkml/20221116115348.517599-1-javierm@redhat.com/

> - fix kernel build and dracut so it can pick up the firmware images the
>   kernel itself needs. Because having a driver built-in but it still fails
>   to load until the rootfs is there is some very confusing failure mode.
>   Due to that failure mode I think this is the right fix, otherwise
>   built-in drivers become confusing.
>

That's a good idea but that will mean adding a new kernel interface (and
unsure where that should live since sysfs for example has the "one entry,
one value" rule. I don't know where is a good place to expose such list.

>   Alternatively I guess you could disallow drm/img as a built-in driver
>   ... And also any other driver that requires fw to function.
>

That's an option too. But I still think that retrying is better than forcing
the driver to be built as a module.

> I don't think a "mostly works due to undocumented driver-specific hack" is
> a good fix, since this is entirely a generic issue.
>

Maybe something that could be proposed is to have a request_firmware_defer()
helper that changes the request_firmare() behaviour to return -EPROBE_DEFER
instead of -ENOENT? At least is something that could be documented and will
avoid drivers to open code a if (ret == -ENOENT) return -EPROBE_DEFER logic?

> I think it's different if the fw is only needed for optional features,
> e.g. for i915 some of the display firmware is only needed for self refresh
> and low power modes. And a runtime_pm_get until the firmware has shown up
> to prevent mayhem is imo a clean design for that, since the hardware is
> fully working aside from using a bit too much power.
>

As mentioned is only needed for rendering, display works without the FW
since is handled by another driver.

[...]

>> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
>> index 5c3b2d58d766..f8fb45136326 100644
>> --- a/drivers/gpu/drm/imagination/pvr_drv.c
>> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
>> @@ -1309,10 +1309,18 @@ pvr_drm_driver_open(struct drm_device *drm_dev, struct drm_file *file)
>>  {
>>  	struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
>>  	struct pvr_file *pvr_file;
>> +	int err;
>> +
>> +	/* Perform GPU-specific initialization steps. */
>> +	err = pvr_device_gpu_init(pvr_dev);
>
> Ok this is full blas "init hw on first open" drm 1 design. I think what
> would be ok somewhat is delaying the drm_dev_register, but this here gives
> me nightmares ...
>
> Please no :-)
>

Ok, that's why I added a RFC prefix to this patch's subject :)

> Cheers, Sima
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

