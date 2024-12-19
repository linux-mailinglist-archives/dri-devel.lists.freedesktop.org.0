Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9022D9F7A55
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 12:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D4610E047;
	Thu, 19 Dec 2024 11:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TOy5sRgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BF710E047
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734607470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5KwToskacJBu2Zgg8AvtSVwIUL+1Np65e8XEKof5es=;
 b=TOy5sRggyM/uS2x82oIV6ffBo6VCcQAotMH6JiNhB0WQrRgDjaxg4i4BDkucJc6TIqmuYf
 WtvHCcJLvCBA3N1BDWB0bDWpesjQ271qCkqPVo5l2mRr7vCBat+pn2IrsWhsHz+VRRDOHk
 mFV6ApePTXT31AG3PGlfmUpUiJl/Lj8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-YMpKUStCPmSqOrVyik-Bxw-1; Thu, 19 Dec 2024 06:24:26 -0500
X-MC-Unique: YMpKUStCPmSqOrVyik-Bxw-1
X-Mimecast-MFC-AGG-ID: YMpKUStCPmSqOrVyik-Bxw
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-385ded5e92aso296577f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 03:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734607465; x=1735212265;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m5KwToskacJBu2Zgg8AvtSVwIUL+1Np65e8XEKof5es=;
 b=gdo6xfVPtiJVg2IXhnUnLXm2zq1BJvcJvH1jGhIMxaUOph+XwmEYg4VSekEfZw8PBk
 vPdNyEHFIUlSKT/02tTvsMAi8c1n6Z8/39GO0YyHYsjARZ2C0GLgoLDmoN1gozT0QqUd
 VSUQXdNIU6y+BqSICeobBEwpu5HKDKvGCWIuJveZ3y/fT2Acq/qMI1vQPoDfKZWFNTlj
 z7J26VZLlNmMGdQ5S2hWk4JikSG0AR7lrIp0Q9Ht1AmE0+fyCq7hzOk+7BOHhXFJoTxZ
 rZEha3t0qXPgC2zxNWb3seTu6B8wZ9gTgRsoBCzroqC3nmFqUsqCoyoYlpazoJTMfunE
 Hunw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv1mlqmEYKfBfGUC6NX1hDn5ifYZLIj5J1GjRhDjfSgpZA6M8wbKhvNAGJDNfzhG549OzO85Q7Ik8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+OQOdkNLMWCjjveNsxKMJFuTKf6ZQER/3rgCoM0PenzBGg/Rf
 nQHrUYSyWrM9dzC6ByuX2E6qatuqT8ZFRiajQj2iAysBn4f5fS4AHeTYAE4OeemwOsGtq86z/BG
 8h4iR50X8d866be8GwwKjE8KWFlvrFq8AhELzgn7t/0Et+ReYHxx3IMbpblvCjxe4Jw==
X-Gm-Gg: ASbGncuYydQAwulAx41Lp8V3zrpFFCh/D2sJs55t2pD8TWiPiYBO15Cq6ePnG3WPWpA
 GMxr0hFlztrD1IHnQ4eT8GT4HXwFQiGL8AcNzrxSTUzUJx9wSszunHpFFmhxbzQ9dhewZPhSGw+
 wZoF3ZlvibS/SoKxXK7IrcXMndDWseR1WEf3uw083aURFHvoJNdpPp2qMv0GHa7fwOIv/aFrJ1T
 1+yUA6bAG8SfVRnkrwjhrcXFQWuDV8O/Y4LD6FK2FQdUg1Bjp+mhZ4G6zLSz9n8oBTzAOkNmOYs
 mLXL7jwAzbu+34kXyXU5
X-Received: by 2002:a5d:64af:0:b0:386:62f:cf18 with SMTP id
 ffacd0b85a97d-38a19b27268mr2768308f8f.49.1734607465340; 
 Thu, 19 Dec 2024 03:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmr2qEXwyVV1cpTcvqgJhXzRUrGrU/LMRyQsLVwznyEZW78wW+Oj1/FKrvPIC4naj/8VxnBA==
X-Received: by 2002:a5d:64af:0:b0:386:62f:cf18 with SMTP id
 ffacd0b85a97d-38a19b27268mr2768268f8f.49.1734607464777; 
 Thu, 19 Dec 2024 03:24:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c832ec4sm1325158f8f.26.2024.12.19.03.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 03:24:24 -0800 (PST)
Message-ID: <7f8680b2-9f0d-4df6-9cb4-856ec42c008d@redhat.com>
Date: Thu, 19 Dec 2024 12:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Petr Mladek <pmladek@suse.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
 <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
 <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
 <Z2LZozgxxQuusHVS@pathway.suse.cz>
 <ffa47056-994c-487a-b3ea-92c049c11b81@redhat.com>
 <Z2L16iXZ-BD4RliW@pathway.suse.cz>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z2L16iXZ-BD4RliW@pathway.suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cF66r3EPqLjxExe7eF1BVFdcJFvsXkDtNe31ABZUpm8_1734607465
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 18/12/2024 17:18, Petr Mladek wrote:
> On Wed 2024-12-18 15:58:46, Jocelyn Falempe wrote:
>> On 18/12/2024 15:18, Petr Mladek wrote:
>>> On Wed 2024-12-18 12:41:39, Jocelyn Falempe wrote:
>>>> On 18/12/2024 12:00, Geert Uytterhoeven wrote:
>>>>> Hi Jocelyn,
>>>>>
>>>>> On Wed, Dec 18, 2024 at 11:14 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>> On 17/12/2024 15:54, Geert Uytterhoeven wrote:
>>>>>>> On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>>>> On 17/12/2024 15:19, Geert Uytterhoeven wrote:
>>>>>>>>> On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>>>>>> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
>>>>>>>>>> This is not a full replacement to fbcon, as it will only print the kmsg.
>>>>>>>>>> It will never handle user input, or a terminal because this is better done in userspace.
>>>>>>>>>>
>>>>>>>>>> If you're curious on how it looks like, I've put a small demo here:
>>>>>>>>>> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
>>>>>>>>>>
>>>>>>>>>> Design decisions:
>>>>>>>>>>        * It uses the drm_client API, so it should work on all drm drivers from the start.
>>>>>>>>>>        * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>>>>>>>>>>          It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>>>>>>>>>>        * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>>>>>>>>>
>>>>>>>>> I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
>>>>>>>>> Unfortunately I don't see any kernel messages, and my monitor complains
>>>>>>>>> about no signal. Does this require special support from the driver?
>>>>>>>>
>>>>>>>> It doesn't require a special support from the driver. But as it is the
>>>>>>>> first drm client other than fbdev emulation, I'm not surprised it's
>>>>>>>> broken on some driver.
>>>>>>>> I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
>>>>>>>> (Qualcomm SDM845/freedreno), without requiring driver changes.
>>>>>>>>
>>>>>>>> Do you have a serial console on this device, to check if there is
>>>>>>>> something in kmsg?
>>>>>>>
>>>>>>> Nothing interesting to see. Compared to the fbdev client:
>>>>>>>
>>>>>>>          rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
>>>>>>>          [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
>>>>>>>          rcar-du feb00000.display: [drm] Device feb00000.display probed
>>>>>>>         -Console: switching to colour frame buffer device 240x67
>>>>>>>         -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
>>>>>>>
>>>>>>> I did verify (by adding my own debug prints) that the code does
>>>>>>> get to the success case in drm_log_register().
>>>>>>> Thanks!
>>>>>>
>>>>>> Maybe you need to add console=drm_log to your kernel command line, so
>>>>>> the kernel will actually use this console.
>>>>>
>>>>> Thanks, that does the trick!
>>>>>
>>>>> Note that I do not need to specify any console= kernel command line
>>>>> parameter for the fbdev console.
>>>>
>>>> Yes, the fbcon console is tty0, which is hardcoded for historical reason.
>>>> Some architectures use add_preferred_console() to enable specific consoles,
>>>> I'm not sure it's allowed to use that from the drm_log_register() code.
>>>
>>> add_preferred_console() is used when the console should get enabled
>>> intentionally. I would split the intentions into two categories:
>>>
>>>     + requested by the end-user on the command line, see
>>>          __add_preferred_console(..., true) in console_setup()
>>>
>>>     + enabled by default by a hardware definition (manufacture), see
>>>          add_preferred_console() in:
>>>
>>> 	+ of_console_check(): generic solution via device tree
>>> 	+ acpi_parse_spcr(): generic solution via SPCR table
>>> 	+ *: hardcoded in few more HW-specific drivers
>>>
>>> add_preferred_console() causes the console will always get enabled
>>> when it is successfully initialized.
>>>
>>> So, should the "drm_log" console get always enabled?
>>
>> drm_log is a replacement for fbcon, which is always enabled, so I think it
>> should also be always enabled. Otherwise you won't get any console as fbcon
>> is no more available.
> 
> IMHO, it is not true that "fbcon" is always enabled. For example,
> if you mention "console=ttyS0,115200" on the command line then only
> the serial console is enabled.
> 
> Honestly, I do not understand completely the connection between the
> drm drivers and the console subsystem.
> 
> My understanding is that fbcon is registered via the very old and
> generic VT (Virtual Terminal) layer, see do_fbcon_takeover().
> 
> As a result, it gets registered/enabled by default when there is
> no other console defined on the command line or an
> add_preferred_console() call.
> 
> It is this code:
> 
> void register_console(struct console *newcon)
> {
> [...]
> 	/*
> 	 * See if we want to enable this console driver by default.
> 	 *
> 	 * Nope when a console is preferred by the command line, device
> 	 * tree, or SPCR.
> 	 *
> 	 * The first real console with tty binding (driver) wins. More
> 	 * consoles might get enabled before the right one is found.
> 	 *
> 	 * Note that a console with tty binding will have CON_CONSDEV
> 	 * flag set and will be first in the list.
> 	 */
> 	if (preferred_console < 0) {
> 		if (hlist_empty(&console_list) || !console_first()->device ||
> 		    console_first()->flags & CON_BOOT) {
> 			try_enable_default_console(newcon);
> 		}
> 	}
> [...]
> }
> 
> Note that try_enable_default_console(newcon) fails only when
> newcon->setup() fails. It means that the given console is almost
> always enabled when this function is called.
> 
> The important thing here might be the check of "!console_first()->device".
> It causes, that register_console() stop calling
> try_enable_default_console(newcon) when there is at least one console
> with the tty binding registered.
> 
> IMHO, this is the reason why "fbcon" is enabled by default. It is
> the first registered driver with the tty binding.
> 
> Also this might be the reason why "drm_log" is _not_ enabled by
> default. I guess that drm_log_register() is called too late.
> I guess that there already is enabled another console driver with
> tty binding at that time, most likely the serial console.
> 
> Could you please confirm this?
> What console is enabled when console=drm_log is not used, please?

For fbcon, it's the VT_CONSOLE config option that enable the console.
It is run very early in the boot, and the console is registered even if 
there are no framebuffer device or fbdev emulation.

so if I have VT_CONSOLE=y, then tty0 is the default console, even if 
there are no drivers to write the content somewhere.

[    0.103324] Console: colour dummy device 80x25

If I disable VT_CONSOLE, then the default console is ttyS0, even if in 
most laptop/desktop, the serial line is no more accessible.

So in order to mimic the fbcon behavior, drm_log should register a dummy 
console very early, without knowing if some hardware would be able to 
actually display something later.


> 
> 
>> drm_log doesn't really fit in the architecture/hardware model, because drm
>> drivers are available for a wide range of architecture, and a GPU can do
>> either fbdev/fbcon or drm_log.
>>>
>>>> I will still send a patch to add update the Kconfig help for drm_log, as
>>>> this command line argument is required to have it working.
>>>
>>> I guess that the drm_log consoles should get enabled only when
>>> requested by the user => documenting the command line parameter
>>> is the right solution here.
>>
>> Most embedded linux specify the console on the command line, but for
>> laptop/desktop distributions, it's not the case as fbcon is the default
>> since the beginning.
>>
>> I see a few options here:
>> 1) Use add_preferred_console("drm_log") if DRM_CLIENT_LOG is enabled for
>> x86_64 and maybe arm64, so at least the main users are covered.
>> 2) Have a DRM_CLIENT_LOG_PREFERRED_CONSOLE config, so that it's easier to
>> setup than changing the kernel command line.
> 
> I guess that you plan to call add_preferred_console() in this case.
> It is not the same as "fbcon" now:
> 
> 1. It would cause that "drm_log" will always be enabled. It won't be
>     possible to override it on the command line.

You can disable drm_log from the command line, by passing 
"drm_client.active=", in this case no drm_log console would be registered.
> 
> 2. It will set "preferred_console". As a result,
>     try_enable_default_console(newcon) will never be called.
>     => there won't be any console when "drm_log" initialization
>     fails and drm_log_register() is not called from some reason.
> 
I don't think it's a problem. It's the same currently with fbcon.
tty0 is the default console with dummy output. if fbdev initialization 
fails, then the only console available is the dummy console, which does 
nothing at all.
So at least there won't be any regression when switching from fbcon to 
drm_log.

>> 3) Use the kernel command line.
> 
> 
> An ideal solution would be to allow calling drm_log_register() so
> that it can be registered as the first console driver by
> try_enable_default_console().
> 
> If this is not possible than we should think hard about it.
> The console registration rules are already very complicated.
> And we should think twice before adding any other twist
> in the logic.

Yes, I agree, we shouldn't make it worse than what it is already.

I will experiment with add_preferred_console() or having an early dummy 
drm_log registration, and see what works best.

> 
> Best Regards,
> Petr
> 

