Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D45D9AD126
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E14882B5;
	Wed, 23 Oct 2024 16:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="bXOrI+Gp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DF710E195
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:38:52 +0000 (UTC)
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8E2802FC0059;
 Wed, 23 Oct 2024 18:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1729701530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qiQI9gPCZD8o3BwnJMzsmwHDB3fnS00qb76DJ3bQLGY=;
 b=bXOrI+GpHBr4zEnl09G31WUIukro7azzzzx5JD4Nb7nnGE8oNQjBFwGKUJ5f6tAM/DD//m
 Q+MnyJ1V5ZLNSAkVRKLE7e4+dqs56dQ7Vj3iHzkCK2eEKoTACh6NQCF0rAX7FunR0yDLRq
 Os43wW3qIK1ykuE906hADe6q2q9J3d4=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b849b2af-1778-4da0-90ea-198a6da89166@tuxedocomputers.com>
Date: Wed, 23 Oct 2024 18:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Benjamin Tissoires <bentiss@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
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

Hi

Am 22.10.24 um 11:47 schrieb Pavel Machek:
> Hi!
>
>>> Sorry for taking a bit long to respond.
>>>
>>> This "illumination" subsystem would (from my perspective) act like some sort of LED subsystem
>>> for devices with a high count of LEDs, like some RGB keyboards.
>>>
>>> This would allow us too:
>>> - provide an abstract interface for userspace applications like OpenRGB
>>> - provide an generic LED subsystem emulation on top of the illumination device (optional)
>>> - support future RGB controllers in a generic way
>>>
>>> Advanced features like RGB effects, etc can be added later should the need arise.
>>>
>>> I would suggest that we model it after the HID LampArray interface:
>>>
>>> - interface for querying:
>>>   - number of LEDs
>>>   - supported colors, etc of those LEDs
>>>   - position of those LEDs if available
>>>   - kind (keyboard, ...)
>>>   - latency, etc
>>> - interface for setting multiple LEDs at once
>>> - interface for setting a range of LEDs at once
> How are LEDs ordered? I don't believe range makes much sense.
For LampArray the spec suggests (but not requires) "row wise" starting in the 
upper left, however the spec does not specify how to handle with double row keys 
like iso-enter or half-key-downward offset arrow keys like they exist on some 
notebooks.
>
>>> I do not know if mixing sysfs (for controller attributes like number of LEDs, etc) and IOCTL
>>> (for setting/getting LED colors) is a good idea, any thoughts?
>> I wonder what the advantage of this approach is over simply using HID LampArray
>> (emulation), openRGB is already going to support HID LampArray and since Microsoft
>> is pushing this we will likely see it getting used more and more.
> There's nothing simple about "HID LampArray". Specification is long
> ang ugly... and we don't want to be stuck with with OpenRGB (links to QT!).
It is the only vendor agnostic approach to complex userspace lighting control 
atm. And what's the problem with QT?
>
>> Using HID LampArray also has the advantage that work has landed and is landing
>> to allow safely handing over raw HID access to userspace programs or even
>> individual graphical apps with the option to revoke that access when it is
>> no longer desired for the app to have access.
> HID raw is not suitable kernel interface.
>
>> Personally I really like the idea to just emulate a HID LampArray device
>> for this instead or rolling our own API.  I believe there need to be
>> strong arguments to go with some alternative NIH API and I have not
>> heard such arguments yet.
> If you don't want "some alternative API", we already have perfectly
> working API for 2D arrays of LEDs. I believe I mentioned it before
> :-). Senzrohssre.
>
> 								Pavel
