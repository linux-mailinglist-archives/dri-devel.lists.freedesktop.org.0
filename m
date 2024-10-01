Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705DB98C611
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 21:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FFE10E068;
	Tue,  1 Oct 2024 19:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Atz0zIks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CC610E068
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 19:33:01 +0000 (UTC)
Received: from [192.168.42.96] (pd9e59da1.dip0.t-ipconnect.de
 [217.229.157.161]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 783832FC0055;
 Tue,  1 Oct 2024 21:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1727811179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDX5wJFZxlatFS6ebJoqWhvuvAnbxTE4pt6EeQjhV5U=;
 b=Atz0zIks78MLeCryke6J5rh5wghF3m4TbWhvECEE8nxtUlnogDvArvFboE36LlcI21sBoW
 AznePLQKH/KSzg6/Xph/JOZ1UwNqIUjLML2fw+kQIGKFyHrVEXlFM9faCcDo1/xQnzdPOR
 BErPmHP5csw2WIz4rxHTlZumlIjAv0E=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <74f8bd23-d85a-4f12-b8db-ebde59f3abe3@tuxedocomputers.com>
Date: Tue, 1 Oct 2024 21:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Armin Wolf <W_Armin@gmx.de>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <ZvcdNXQJmc8cjifw@amd.ucw.cz>
 <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <c4e0beb6-acd1-45fa-ad47-f5cf9df89b11@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <c4e0beb6-acd1-45fa-ad47-f5cf9df89b11@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Armin,

Am 01.10.24 um 18:45 schrieb Armin Wolf:
> Am 01.10.24 um 15:41 schrieb Benjamin Tissoires:
>
>> On Oct 01 2024, Werner Sembach wrote:
>>> (sorry resend because thunderbird made it a html mail)
>>>
>>> Hi,
>>>
>>> Am 30.09.24 um 19:06 schrieb Benjamin Tissoires:
>>>> On Sep 30 2024, Werner Sembach wrote:
>>>>> [...]
>>>>> Thinking about it, maybe it's not to bad that it only changes once udev is
>>>>> ready, like this udev could decide if leds should be used or if it should
>>>>> directly be passed to OpenRGB for example, giving at least some consistency
>>>>> only changing once: i.e. firmware -> OpenRGB setting and not firmware->leds
>>>>> setting->OpenRGB setting.
>>>> That would work if OpenRGB gets to ship the LampArray bpf object (not
>>>> saying that it should). Because if OpenRGB is not installed, you'll get
>>>> a led class device, and if/when OpenRGB is installed, full LampArray
>>>> would be presented.
>>> The idea in my head is still that there is some kind of sysfs switch to
>>> enable/disable leds.
>> FWIW, I'm never a big fan of sysfs. They become UAPI and we are screwed
>> without possibility to change them...
>
> Why not having a simple led driver for HID LampArray devices which exposes the
> whole LampArray as a single LED?
Yes that is my plan, but see my last reply to Benjamin, it might not be trivial 
as different leds in the same LampArray might have different max values for red, 
green, blue, and intensity. And the LampArray spec even allows to mix RGB and 
non-RGB leds.
>
> If userspace wants to have direct control over the underlying LampArray device,
> it just needs to unbind the default driver (maybe udev can be useful here?).
There was something in the last discussion why this might not work, but i can't 
put my finger on it.
>
>>> My idea is then that a udev rule shipped with OpenRGB sets this switch to
>>> disable before loading the BPF driver so leds never get initialized for the
>>> final LampArray device.
>> FWIW, udev-hid-bpf can inject a udev property into a HID-BPF. So
>> basically we can have a udev property set (or not) by openrgb which
>> makes the BPF program decide whether to present the keyboard as
>> LampArray or not.
>
> I do not think that using HID-BPF makes sense here, since the underlying HID 
> device
> is already purely virtual.
>
> Using HID-BPF on top of the already virtual HID device would be a bit strange.
>
>>>> But anyway, BPF allows to dynamically change the behaviour of the
>>>> device, so that's IMO one bonus point of it.
>>>>
>>>>>> FWIW, the use of BPF only allows you to not corner yourself. If you
>>>>>> failed at your LampArray implementation, you'll have to deal with it
>>>>>> forever-ish. So it's perfectly sensible to use BPF as an intermediate step
>>>>>> where you develop both userspace and kernel space and then convert back
>>>>>> the BPF into a proper HID driver.
>>>>> I don't really see this point: The LampArray API is defined by the HID Usage
>>>>> Table and the report descriptor, so there is not API to mess up and
>>>>> everything else has to be parsed dynamically by userspace anyway, so it can
>>>>> easily be changed and userspace just adopts automatically.
>>>>>
>>>>> And for this case the proper HID driver is already ready.
>>>> Yeah, except we don't have the fallback LED class. If you are confident
>>>> enough with your implementation, then maybe yes we can include it as a
>>>> driver from day one, but that looks like looking for troubles from my
>>>> point of view.
>>> To be on the safe side that we don't talk about different things: My current
>>> plan is that the leds subsystem builds on top of the LampArray
>>> implementation.
>> I would say that the HID subsystem knows how to translate LampArray into
>> a subset of LEDs. But I think that's what you are saying.
>>
>>> Like this the leds part has to be only implemented once for all LampArray
>>> devices be it emulated via a driver or native via firmware in the device
>>> itself.
>> yep, that's the plan. However, not sure how to fit LampArray into LED.
>
> Maybe the LED driver can present the whole LampArry as a single RGB LED. This
> might be enough for basic LED control (on/off, changing color, ...).
>
> For advanced LED control (effects, large number of LEDs, ...) userspace can just
> unbind the default LED driver and use hidraw to drive the LampArray themself.
>
>>> And I feel confident that the UAPI should be that the userspace gets a
>>> hidraw device with a LampArray HID descriptor, and every thing else is, by
>>> the HID spec, dynamic anyway so I can still change my mind in implementation
>>> specifics there, can't I?
>> Yeah... I think?
>>
>>  From my point of view we are just bikeshedding on to where put that
>> "firmware" extension, in WMI, in HID (kernel with a subdriver), or
>> externally in BPF.
>>
> Just a insane idea: can Tuxedo change the ACPI code supplied by the BIOS?
Sadly not easily, we get the BIOS from the ODMs and don't have the source and 
built tools for it so we need to request each change individually from the ODMs.
>
>>>> After a second look at the LampArray code here... Aren't you forgetting
>>>> the to/from CPU conversions in case you are on a little endian system?
>>> Since this driver is for built in keyboards of x86 notebooks it isn't
>>> required or is it?
>> Good point. Let's just hope you don't start shipping a LE laptop with
>> the same keyboard hardware :)
>
> I believe we should do those CPU conversions regardless, so future driver 
> developers
> have good examples to copy from.
TBH I don't know where to look for an example myself, on how the appropriate 
conversion functions/macros are called xD.
>
>>>>> So the only point for me currently is: Is it ok to have key position/usage
>>>>> description tables in the kernel driver or not?
>>>> good question :)
>>>>
>>>> I would say, probably not in the WMI driver itself. I would rather have
>>>> a hid-tuxedo.c HID driver that does that. But even there, we already had
>>>> Linus complaining once regarding the report descriptors we sometimes
>>>> insert in drivers, which are looking like opaque blobs. So it might not be
>>>> the best either.
>>> Isn't tuxedo_nb04_wmi_ab_virtual_lamp_array.c not something like
>>> hid-tuxedo.c? or should it be a separate file with just the arrays?
>> It is, in a way. I think it's more a question for Hans and the other
>> platform maintainers, whether they would accept this.
>
> Is there a possibility to query the physical keyboard layout using the WMI 
> interface?

Only if it is ansii or iso layout. The id's for the special keys and the key 
positions are not provided by the firmware.

Best regards,

Werner

>
>>>> Sorry I don't have a clear yes/no answer.
>>> Hm... Well if it's no problem I would keep the current implementation with
>>> minor adjustments because, like i described above, I don't see a benefit now
>>> that this already works to rewrite it in BPF again.
>>>
>>> If it is a problem then i don't see another way then to rewrite it in BPF.
>>>
>>> Note: For future devices there might be more keyboard layouts added,
>>> basically every time the chassis form factor changes.
>> If the WMI part doesn't change, then maybe having BPF would be easier
>> for you in the future. Adding a HID-BPF file would cost basically
>> nothing, and it'll be out of band with the kernel, meaning you can ship
>> it in already running kernels (assuming the same WMI driver doesn't need
>> any updates).
>>
>>>> Cheers,
>>>> Benjamin
>>> To sum up the architechture (not mutally exclusive technically)
>>>
>>> /- leds
>>> WMI <- WMI to LampArray Kernel driver <-switch-|
>>>                                                 \- OpenRGB
>>>
>>> /- leds
>>> WMI <- WMI to Custom HID Kernel driver <- Custom HID to LampArray BPF
>>> driver<-switch-|
>>> \- OpenRGB
>>>
>>> With the "switch" and "leds" implemented in hid core, automatically
>>> initialized every time a LampArray device pops up (regardless if it is from
>>> native firmware, a bpf driver or a kernel driver)
>>>
>>> Writing this down I think it was never decided how the switch should look like:
>>>
>>> It should not be a sysfs attribute of the leds device as the leds device
>>> should disappear when the switch is set away from it, but should it be a
>>> sysfs variable of the hid device? This would mean that hid core needs to add
>>> that switch variable to every hid device having a LampArray section in the
>>> descriptor.
>> Again, not a big fan of the sysfs, because it's UAPI and need root to
>> trigger it (though the udev rule sort this one out).
>> BPF allows already to re-enumerate the device with a different look and
>> feel, so it seems more appropriate to me.
>>
>> Also, having a sysfs that depends on the report descriptor basically
>> means that we will lose it whenever we re-enumerate it (kind of what the
>> LED problem you mentioned above). So we would need to have a sysfs on
>> *every* HID devices???
>>
>> Actually, what would work is (ignoring the BPF bikeshedding for Tuxedos
>> HW):
>> - a device presents a report descriptor with LampArray (wherever it
>>    comes from)
>> - hid-led.c takes over it (assuming we extend it for LampArray), and
>>    creates a few LEDs based on the Input usage (one global rgb color for
>>    regular keys, another one for the few other LEDs known to userspace)
>> - when openRGB is present (special udev property), a BPF program is
>>    inserted that only contains a report descriptor fixup that prevent the
>>    use of hid-led.c
>
> Can we just manually unbind the hid-led driver?
>
>> - the device gets re-enumerated, cleaning the in-kernel leds, and only
>>    present the LampArray through hidraw, waiting for OpenRGB to take
>>    over.
>> - at any time we can remove the BPF and restore the LEDs functionality
>>    of hid-led.c
>>
>>>>>> Being able to develop a kernel driver without having to reboot and
>>>>>> being sure you won't crash your kernel is a game changer ;)
>>>>>>
>>>>>> Cheers,
>>>>>> Benjamin
>>> Best regards and sorry for the many questions,
>>>
>>> Werner Sembach
>>>
>>> PS: on a side node: How does hid core handle HID devices with a broken HID
>>> implementation fixed by bpf, if bpf is loaded after hid-core? Does the hid
>>> device get reinitialized by hid core once the bpf driver got loaded? If yes,
>>> is there a way to avoid side effects by this double initialization or is
>>> there a way to avoid this double initialization, like marking the device id
>>> as broken so that hid core- does not initialize it unless it's fixed by bpf?
>> - broken HID device:
>>    it depends on what you call "broken" HID device. If the report
>>    descriptor is boggus, hid-core will reject the device and will not
>>    present it to user space (by returning -EINVAL).
>>    If the device is sensible in terms of HID protocol, it will present it
>>    to userspace, but the fact that it creates an input node or LED or
>>    whatever just depends on what is inside the report descriptor.
>>
>> - HID-BPF:
>>    HID-BPF is inserted between the device itself and the rest of the
>>    in-kernel HID stack.
>>    Whenever you load and attach (or detach) a BPF program which has a
>>    report descriptor fixup, HID-core will reconnect the device,
>>    re-enumerate it (calling ->probe()), and will re-present it to
>>    userspace as if it were a new device (you get all uevents).
>>
>> - double initialization:
>>    nowadays hid-generic doesn't do anything on the device itself except
>>    calling the powerup/powerdown, by calling ->start and ->stop on the
>>    HID transport driver. It's not a problem on 99% of the devices AFAICT.
>>    technically, if the report descriptor is bogus, start/stop won't be
>>    called, but you'll get an error in the dmesg. So if you really want to
>>    rely on that "broken" scenario we can always add a specific quirk in
>>    HID to not spew that error.
>>
>> Cheers,
>> Benjamin
>>
>> PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
>> all of the requirements here:
>> - need to be dynamic
>> - still unsure of the userspace implementation, meaning that userspace
>>    might do something wrong, which might require kernel changes
>> - possibility to extend later the kernel API
>> - lots of fun :)
