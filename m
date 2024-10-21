Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA769A9149
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 22:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E4210E598;
	Mon, 21 Oct 2024 20:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="GjGeylWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Mon, 21 Oct 2024 20:32:34 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A4710E598
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729542753; x=1730147553; i=w_armin@gmx.de;
 bh=e9QbNuLAuXgzKvnSaHT2dAq3xYZ/W2rd0vmM7cmicmQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GjGeylWMI4p1dMyuLukqhheR3EtaTKARK7edoz3R5fyeHAu7on2ksn3hcrFlMOhR
 bHDhI3xxp2Klv6Omp2irxW0WfyQURNo2QImHCCaC5nZjznypTHTXBA3MUx3ryJDEl
 yL2ztN4LSbmKFJL5/tOfHJel0zyb7JGnTubIwsu5XMA2BPJuZJP8+bI8PjjjBXtRQ
 yUKnRIKGe/n1VNM4gamzW/WYnx2BYWyENfobkhwZBSbjJ61yFKKUYGqsj1fz+Xu53
 rke4IshdLfQUcMV25wsEe5LyPBIeHDT+/BTRO0/A+VxooJwB/MCRMtSUNz3WBEhqH
 oeLnmSzNIPPiiIgSKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1tokLq117a-00w12Z; Mon, 21
 Oct 2024 22:26:56 +0200
Message-ID: <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
Date: Mon, 21 Oct 2024 22:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 jelle@vdwaa.nl, jikos@kernel.org, lee@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZwlDpCPhieF3tezX@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3UMk7ZMRiG7KwkFqWRpMUf9HSa5Kej0YUjCRMm78uvohH0r57Db
 NagZcni7LAn/QyXuhwv5M3Mj7tDVTx0RNnEkYnM7QOeBRscIkVx4Y7n0AjicHLNAuRDYi45
 qrbUQd6FzewuS90QL4lsQBE7ApYx4+uzWisL9H8/gokYmwXheZ3PYed9n0raiMHbXj4S3aU
 q/QhfvfTgh9FFsvxOIvZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ggJ93g+Ify4=;s58UL74BnCq69sxDYOMUXATZDIr
 09kSBmSSr1sYG8y6Gq4C8/3s2atiHJJJ67mV1S4t0mUy4WbIBdmQ/ugd8rQcX+3mUzaS6YuFi
 CwG8WIsqPnwQsyxjnH4xBQj7zntIgBj+6bj1i5zoFh4aYiRShESHd2ZIf/TcQGMSEcPg4xgM4
 j9uCFbYJ2bwuid7WkGQzQF0ZUa4/9bGaTMv9Oji4ygkAMCKaEBCu85UQdRLdXdUs9Q9X3cZO8
 6a3mnKRfaAh1VGT0Ex+t+12gZsAvC9+nhTLE2ZvFOJT0ApUI84+vsuj3ELZnrhOAfIQq7ka7d
 x0NbJZie/jrzRS2f7lodZCkhxSVfkQYlni/RtCFJz+QPJAUGFkKKS4wahO88rZJfbLtAS3tan
 Anzguc30I6tD0bpGX/O9x7hpiIqs7Ya+ZR0iW/k1pGaNqs9b+QvJyXVkXSJR2uusGnX3tJsS0
 f9ds7gL+XUbG54oG3OvIQMZPKys9qNavLjVzPC/8P4CYa57z1aOIPQWOTdpZFoKSbKLwTzkSn
 tWrziErO2dflZmHfaaMZzKdRGhfgFdlMCk4xELuKJnbq1j0VuS+7cAW60iGPikJJ0do7oOkM+
 5MiHcQffU5VIYzUZhG3Orl4/UGQQHjABcUtXtTVCtnjO2uzpHVhyMoX1X8uygCWlOD8AUyK/B
 ov81k/NPDaTYCzvcn1qxFNODlkS76X6PI4dCFk2YpD7q3nn+rDN6JCLmNXNioUw5KQWXjeQ8x
 xpCUbNJ++qOhVRXxpT0zZl7rm6IDumzb/zJ6LIkHo4VS2dY+vYuxIMIi0KVJM6PW/RyRCRh7Q
 1DfKJgJ3IneHEFyjXr9+pnNTtw4TS0PMALi/XHXGaQd6E=
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

Am 11.10.24 um 17:26 schrieb Pavel Machek:

> Hi!
>
>>> 1.
>>> https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/
>>> -> Should be no problem? Because this is not generally exposing wmi
>>> calls, just mapping two explicitly with sanitized input (whitelisting
>>> basically).
>> It would be OK to expose a selected set of WMI calls to userspace and sanitizing the input of protect potentially buggy firmware from userspace.
>>
> I don't believe this is good idea. Passthrough interfaces where
> userland talks directly to hardware are very tricky.
>
>> Regarding the basic idea of having a virtual HID interface: i would prefer to create a illumination subsystem instead, but i have to agree that we should be doing this
>> only after enough drivers are inside the kernel, so we can design a
>> suitable interface for them. For now, creating a virtual HID
>> interface seems to be good enough.
> I have an RGB keyboard, and would like to get it supported. I already
> have kernel driver for LEDs (which breaks input functionality). I'd
> like to cooperate on "illumination" subsystem.
>
> Best regards,
> 								Pavel

Sorry for taking a bit long to respond.

This "illumination" subsystem would (from my perspective) act like some sort of LED subsystem
for devices with a high count of LEDs, like some RGB keyboards.

This would allow us too:
- provide an abstract interface for userspace applications like OpenRGB
- provide an generic LED subsystem emulation on top of the illumination device (optional)
- support future RGB controllers in a generic way

Advanced features like RGB effects, etc can be added later should the need arise.

I would suggest that we model it after the HID LampArray interface:

- interface for querying:
  - number of LEDs
  - supported colors, etc of those LEDs
  - position of those LEDs if available
  - kind (keyboard, ...)
  - latency, etc
- interface for setting multiple LEDs at once
- interface for setting a range of LEDs at once
- interface for getting the current LED colors

Since sysfs has a "one value per file" rule, i suggest that we use a chardev interface
for querying per-LED data and for setting/getting LED colors.

I do not know if mixing sysfs (for controller attributes like number of LEDs, etc) and IOCTL
(for setting/getting LED colors) is a good idea, any thoughts?

Thanks,
Armin Wolf

