Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8A9A9BA7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D7210E600;
	Tue, 22 Oct 2024 07:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GweyATkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E61C10E600
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729583934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/toOIhDFxtm2KiH53yytgdrHcc4/hOCbQgrRu1IsbBM=;
 b=GweyATkdPlz0anyMzAz6zXPcWMA27iYEuO3M3LQ6iQb/kjW6uw99NsXwpEZMhqsDCBItwW
 A8vjzzuLMXG0Fgahfefy2hD9sCOtugivyRKBCVH4FLc8A4HJRgC7KweOah9jIZAdgFOFLb
 pBihlF67nq8Dy/vnrzV7TzqDvOEKbCA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-2wjOR0UlM6mWW7lRQdRcmQ-1; Tue, 22 Oct 2024 03:58:53 -0400
X-MC-Unique: 2wjOR0UlM6mWW7lRQdRcmQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-539e5f9df25so3380842e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 00:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729583931; x=1730188731;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/toOIhDFxtm2KiH53yytgdrHcc4/hOCbQgrRu1IsbBM=;
 b=ckLDMDMSu+fPS9CXHvLH774PmeYuCr+Cf+aQWGhqadZOv2Apd/q6NLGdS6y/jKQ6Cj
 PxxIwa8kbF8ssS4mUioLuWMwdh1fp+2e/+SebejfU6eaSUgWNuaSWSCNuPalQ3PukIzV
 Oci7RM1BRF/KjHdFUyRu9DcUAe1+2TXONl+KMgPFoIRX9P/o4uvhp+AwQxz0URTIaYV1
 ruZOCB7hV0seEdYmHlFUjaqrDjNkNDrkayPtII/8JMb3hMPyiN6nY2YZjUJ9/SmuzMnI
 XSug3FprVuu/btd4CSsrYSA9hjbSEshcOFqxA3+npIsZsyucnYuE1R4d+XYuln6OUftU
 W7LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW375Zg2T6dVUpW6Hel2ZR9gdfR91IGheJTQAA/WbFxBNTrkV85w/El1ZK6LlZBKYc/vA2AzMhLnEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxps5aoZVmdTHObxfaHbCLu3fHK/RHoSmi2hsHZzMfqGQAEiiEY
 NrMNfZCgZjcI/GjnAcQkHsmry6rUYy13MqtXQAF3C6qaOqzRLOwfzqo24LKtHbiAXPIk14fcgWo
 j1lZMNTMVoNB+ajjvKOa6WFF10112rqYhpOFKTgZwTG776PC0Wo09gSsWtATQ6fieZw==
X-Received: by 2002:a05:6512:1396:b0:539:e873:6e6 with SMTP id
 2adb3069b0e04-53a15445fbbmr6176912e87.43.1729583931522; 
 Tue, 22 Oct 2024 00:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHZkuY2o29BsH2nW9fSeox5DGzjxId3xF7ANCRMftKPLZng9BBjKBjW/HI8QrQjL7hrhqDkQ==
X-Received: by 2002:a05:6512:1396:b0:539:e873:6e6 with SMTP id
 2adb3069b0e04-53a15445fbbmr6176880e87.43.1729583930939; 
 Tue, 22 Oct 2024 00:58:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66a6a729sm2841670a12.54.2024.10.22.00.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 00:58:50 -0700 (PDT)
Message-ID: <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
Date: Tue, 22 Oct 2024 09:58:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
 <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
 <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Armin,

On 21-Oct-24 10:26 PM, Armin Wolf wrote:
> Am 11.10.24 um 17:26 schrieb Pavel Machek:
> 
>> Hi!
>>
>>>> 1.
>>>> https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/
>>>> -> Should be no problem? Because this is not generally exposing wmi
>>>> calls, just mapping two explicitly with sanitized input (whitelisting
>>>> basically).
>>> It would be OK to expose a selected set of WMI calls to userspace and sanitizing the input of protect potentially buggy firmware from userspace.
>>>
>> I don't believe this is good idea. Passthrough interfaces where
>> userland talks directly to hardware are very tricky.
>>
>>> Regarding the basic idea of having a virtual HID interface: i would prefer to create a illumination subsystem instead, but i have to agree that we should be doing this
>>> only after enough drivers are inside the kernel, so we can design a
>>> suitable interface for them. For now, creating a virtual HID
>>> interface seems to be good enough.
>> I have an RGB keyboard, and would like to get it supported. I already
>> have kernel driver for LEDs (which breaks input functionality). I'd
>> like to cooperate on "illumination" subsystem.
>>
>> Best regards,
>>                                 Pavel
> 
> Sorry for taking a bit long to respond.
> 
> This "illumination" subsystem would (from my perspective) act like some sort of LED subsystem
> for devices with a high count of LEDs, like some RGB keyboards.
> 
> This would allow us too:
> - provide an abstract interface for userspace applications like OpenRGB
> - provide an generic LED subsystem emulation on top of the illumination device (optional)
> - support future RGB controllers in a generic way
> 
> Advanced features like RGB effects, etc can be added later should the need arise.
> 
> I would suggest that we model it after the HID LampArray interface:
> 
> - interface for querying:
>  - number of LEDs
>  - supported colors, etc of those LEDs
>  - position of those LEDs if available
>  - kind (keyboard, ...)
>  - latency, etc
> - interface for setting multiple LEDs at once
> - interface for setting a range of LEDs at once
> - interface for getting the current LED colors
> 
> Since sysfs has a "one value per file" rule, i suggest that we use a chardev interface
> for querying per-LED data and for setting/getting LED colors.
> 
> I do not know if mixing sysfs (for controller attributes like number of LEDs, etc) and IOCTL
> (for setting/getting LED colors) is a good idea, any thoughts?

I wonder what the advantage of this approach is over simply using HID LampArray
(emulation), openRGB is already going to support HID LampArray and since Microsoft
is pushing this we will likely see it getting used more and more.

Using HID LampArray also has the advantage that work has landed and is landing
to allow safely handing over raw HID access to userspace programs or even
individual graphical apps with the option to revoke that access when it is
no longer desired for the app to have access.

HID LampArray gives us a well designed API + a safe way to give direct access
to e.g. games to control the lighting. I really don't see the advantage of
inventing our own API here only to then also have to design + code some way to
safely give access to sandboxed apps.

Note that giving access to sandboxed apps is a lot of work, it is not just
kernel API it also requires designing a portal interface + implementing
that portal for at least GNOME, KDE and wlroots.

Personally I really like the idea to just emulate a HID LampArray device
for this instead or rolling our own API.  I believe there need to be
strong arguments to go with some alternative NIH API and I have not
heard such arguments yet.

Regards,

Hans




