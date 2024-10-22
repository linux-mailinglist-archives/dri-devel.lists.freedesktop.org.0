Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB949AB1D3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 17:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A827F10E1FF;
	Tue, 22 Oct 2024 15:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="VucLLaoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9DE10E1FF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 15:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729610319; x=1730215119; i=w_armin@gmx.de;
 bh=+LRGaDe+Stgy5CCZ/3A3Mnw1RHXr59PL8Vt6Ku7+Ll0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=VucLLaoMPq/xGUr20kHB9InIobOyL3z8y0L9dafS7/zBOqi8m7QOqEpR11cZts1C
 HCdMyxPEznUk69/fx//jcDSok9JhVfcOp3vsPC87Af00gUTJ245CeAnaZOGx8s0g1
 2Zi2wA96mxitzxVcFG+Ce02POYltVbXMTHgWX1bLe+54vN8V6jwBz9HyDHcVbUyMN
 mFnrjDeGS5JVTwFfipTlv5ZKSRep3M1PPYNdVtaC4oK5BUlCBYSpD/Tu10sDnCLaT
 XVIcXUMlMfzg8ARXhJ5C/meihdQVdw+6HCi5qIqT1KHhu763Wx3lzsKKy4XoMs1Fh
 2Z5Y4tpQuPeSFEudEw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MmUHp-1tkt9423RR-00iPmB; Tue, 22
 Oct 2024 17:18:39 +0200
Message-ID: <35a98b67-d1eb-4aa9-9d3f-025c94cd6b0f@gmx.de>
Date: Tue, 22 Oct 2024 17:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
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
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <Zxd0ou7GpCRu0K5a@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZeIZAH2Xu1nwYxtwU8UI4KY9oDAHTf0p1g29jRN8fyzdBMETX4n
 mk5s8AY6A5dF9aXWRVF1gwiaCNKzuHN2ZPK7bTh2DHfBFkW7yhojONZtMUpBpS4dayHt1sx
 iTdexFwaMHE9Akiv7L77FRn/eYUb5vgg74h4VteC/z6C3LnKeEvbqLSEBnxGlXaoUmUdvnx
 ZIq9wRgXbm5jkSJ621g9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:48MQsRlI0js=;IwlaPd5r16YHo3FdR4hUaxQxxtq
 fhAbL+vhyAE3oBU2VGU+TBdFFk9TXv4Z0ElfK4hpQXxWvykuQIGB5nqpbFERO9wMVOSv6W+xn
 PfQmDqtdTx/jZl7B2Nuv2hqwFeLjaLO3yHpcklkx7hy6mwHZl2FnZNq/cPZJFAeLKMZmsyVmd
 UWgLstw+3dcZACrXs8cR38yHBaR36/laycp3q2XwKDUAJ3lFmVPbFHTNFsKzC6SG5c2Z80SA4
 dQYJRJuWIWvPBP34XITmuhWShXekmtNO40pNxhuQqTja8d1mhFTqq517pYd/SLUGMz2eT0Ebo
 hJbhlNoKGr8hT0ZS9moAUMnzU8UTB8m6ISQ2poVjBm/SvgxXsj5bEr1a6MX5JX8Abl8Oo7At/
 1j+KDEffTcxyE0hjY6rMiNC3wb02l/ghhKLaZwgg1JCxldLBANjPfCH/g+V1Iz+9nUFHyyOWJ
 lO+NIxvBMSzc2PPTmixvwp3gMeKlf9ZjaUj7mvBxXkGHVcD4hTpKw71GpmaorZANhvZcHMu7L
 loXcsjpREp/O/Xsk2GyesKQbMsK1yIUOac93N2G3C3Tab49sloUHvYibDJe665tXf7Iw7X17t
 Pd8zpTh2xVJkBKQ265XhZL9OgN8Lnmj7PAY7yNokk7x5iHswOejcGNmYL2h1Sf0oSpWg7NIO4
 CVOBSjTyjWojQPbmsxg0XUEoKz9XsC13mqv0xoSsDoDzIF4XyCjztGSW+Ul+acBgTKvmIbGJJ
 rrVF4i2AyM0t8qPPDnq8OG97lyOlEcwvIlBrOwvp9+ByJR2MkEAY+b4EzOW+UlzQtTbmEWI13
 LljQW5s9wOSnQKqEzvoyFidg==
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

Am 22.10.24 um 11:47 schrieb Pavel Machek:

> Hi!
>
>>> Sorry for taking a bit long to respond.
>>>
>>> This "illumination" subsystem would (from my perspective) act like som=
e sort of LED subsystem
>>> for devices with a high count of LEDs, like some RGB keyboards.
>>>
>>> This would allow us too:
>>> - provide an abstract interface for userspace applications like OpenRG=
B
>>> - provide an generic LED subsystem emulation on top of the illuminatio=
n device (optional)
>>> - support future RGB controllers in a generic way
>>>
>>> Advanced features like RGB effects, etc can be added later should the =
need arise.
>>>
>>> I would suggest that we model it after the HID LampArray interface:
>>>
>>> - interface for querying:
>>>  =C2=A0- number of LEDs
>>>  =C2=A0- supported colors, etc of those LEDs
>>>  =C2=A0- position of those LEDs if available
>>>  =C2=A0- kind (keyboard, ...)
>>>  =C2=A0- latency, etc
>>> - interface for setting multiple LEDs at once
>>> - interface for setting a range of LEDs at once
> How are LEDs ordered? I don't believe range makes much sense.

Range would allow for efficiently changing the color of all LEDs. But i ag=
ree
that this can be considered optional and can be added later.

Should we ever prototype such an interface, then providing a method for se=
tting
multiple LEDs at once would be enough.

>>> I do not know if mixing sysfs (for controller attributes like number o=
f LEDs, etc) and IOCTL
>>> (for setting/getting LED colors) is a good idea, any thoughts?
>> I wonder what the advantage of this approach is over simply using HID L=
ampArray
>> (emulation), openRGB is already going to support HID LampArray and sinc=
e Microsoft
>> is pushing this we will likely see it getting used more and more.
> There's nothing simple about "HID LampArray". Specification is long
> ang ugly... and we don't want to be stuck with with OpenRGB (links to QT=
!).

And HID LampArray its not easily extendable.

>
>> Using HID LampArray also has the advantage that work has landed and is =
landing
>> to allow safely handing over raw HID access to userspace programs or ev=
en
>> individual graphical apps with the option to revoke that access when it=
 is
>> no longer desired for the app to have access.
> HID raw is not suitable kernel interface.

I agree, using HID raw in this case would be like amdgpu emulating a i915 =
GPU to
support applications working with a i915 GPU.

>> Personally I really like the idea to just emulate a HID LampArray devic=
e
>> for this instead or rolling our own API.  I believe there need to be
>> strong arguments to go with some alternative NIH API and I have not
>> heard such arguments yet.
> If you don't want "some alternative API", we already have perfectly
> working API for 2D arrays of LEDs. I believe I mentioned it before
> :-). Senzrohssre.
>
> 								Pavel

We may have to support 3D arrays of LEDs, so using a simple framebuffer
would likely cause trouble.

I think of something like this:

illumination class:

sysfs attrs:

  - lamp_count
  - kind (optional)
  - width, height, length (all optional)
  - latency (optional)
  - driver-defined attributes like firmware_version, ... (optional)

ioctl interface:

  - get LED info (id, supported colors, position (optional), key code (opt=
ional), ...)
  - get current color of LEDs
  - set multiple LEDs (by ID)

This interface is similar the the HID LampArray interface except that:

  - we can read the current color
  - we can omit optional information
  - we can extend the interface later (animations, etc)

Thanks,
Armin Wolf

