Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA79AB193
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 17:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F18710E08C;
	Tue, 22 Oct 2024 15:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="bz7VkP3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D974A10E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 15:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729609372; x=1730214172; i=w_armin@gmx.de;
 bh=iyTVaz4YZToxUrhmRQO6zFXlT9G5B63Ll4lLI9zE4as=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=bz7VkP3a3IQVdIp3zlcVTsy+Ja1vxLRTaOt9Fk6ClTJ1jpnjcsoNPOrvLaNhyTs+
 A2F9oLpIlpDa/tdYxImMp4FOmwDKjL15ggnt200F0MICpkkpuU7DXkfdWxUugsPeO
 t40x9EfYHiCLv29siKCJxN2SSaiI4rt5v2FBg7v97e23grsEZoOb8cw/w6GASQvRK
 CNuI12DRduFj9ij+V2lj9BOpGFlDpL/2YoNNgF8MEuiOW24WhCY+xhwc48QUwH4Uk
 +GwzZn1G1pn3clezQi86lycWLqNu91MQJnZP2CGv7GIL7es354gLIoAhFBEsQEgEt
 NU5xfR5aLeT2t+Lc/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYPY-1ta67A18Qq-00fzBl; Tue, 22
 Oct 2024 17:02:52 +0200
Message-ID: <eb829c6c-cee0-4d65-b9d6-3df7fd1096a7@gmx.de>
Date: Tue, 22 Oct 2024 17:02:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>
 <ZxdyQFMRIRusMD6S@duo.ucw.cz>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZxdyQFMRIRusMD6S@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:buvMcpt7UqADbxglDvv1br4rnAVjoyNl6mJL2vRW0OAmw2ePwSV
 rf6Ll7E5y7hUFY8h+S69VdRzhAK6FJrBDkWuDKXKFhK77jdPTHe+NE9ZqHnHvQECtmI0F2z
 /KWGhRaUwogFJg9BTpU9CdYsCV78RW+7xsu2ADL9LGmqFtOwmybulAE7KneqNomdp2w37N/
 je1oxtigOzTX0vHYyiSYg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WfBvh+JhZ4Q=;OXt0JGNMGHC98/Pjb7oNflPVIwA
 NVlBkaUMMzTEewvxxYGDTpVYglg1VJCqXHe9BqwG4fHQezZ1TE0NWxbUlXY5p19/Nbw7SzCHq
 b664sJ6NDXBtMF8OD/C+mHMsPFsf/KRc2zztj+KNysD30jG/W7itgAgMp8UgzD3FSf3uP2Q/+
 CIHLlkSBrskBey2D8UBbuZoD3JPSDtdOF2bv/TIoMnJe72Fb17VKbV1WLqaPlCQ18LSst4DYu
 Md0nmKdIDcCqIAizHoSPe9x9a4dy+zm7AMzqdabac8Lm/gheA+RE9QK8kXiEUnUlFeXHxane/
 YzqtWr7tyTI6gBc2k9eBCQU5KSJ5p9RI5vVaZkCHDqA8SNYsV0dp2lOBJ2/QFXNt1iRE0exPd
 ilHSLTz/CqNRWXhbh7Q7p6OKxNU1ZNV7fjz10dk0hlNdPpUFdqJb2XqFHuJmY4bZ6ZM4bAuso
 gcueega+td3x34j0oWL9AqohaDbhndfRIBdzAnURMrhJRLhcA5wBtmI0tpbu9NweZ+NHivSIs
 f7ZePNOodMo99Qf2RdXph2GzeJVGsSZllc+bBp36Ad6zIz1Z8tuEq0bcxTH0ptHqXZveXxvi7
 IKN3C+1cqTBM906T7RRnqv11FZE43F0Z+w5OM6NiKXF9tTrOhzfnrHpFWDccQglbkPevoMyry
 0mlCoiKGA1PrVUvS+kkxasRUtyuq1/jud3OSMdop8sYZdYDRRLgBEHjtG/gYdj3Hvcj0VrYNX
 /jX758Mck6PLhrlispKzHqTU2ssPSdfSzu5CcIDHC03I1ZmJO47WH1bZTvYfhk9uc2xPzOaDx
 kX8r3zY3z6MIAiJ7bZ6fyYEBmnYuLnVUSFRXRfDF7MImM=
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

Am 22.10.24 um 11:37 schrieb Pavel Machek:

> Hi!
>
>>> Personally I really like the idea to just emulate a HID LampArray device
>>> for this instead or rolling our own API.  I believe there need to be
>>> strong arguments to go with some alternative NIH API and I have not
>>> heard such arguments yet.

Using a virtual HID LampArray already creates two issues:

1. We have to supply device size data (length, width, height), but the driver
cannot know this.

2. It is very difficult to extend the HID LampArray interface, for example
there is no way to read the current LED color from the hardware or switch
between different modes.

A sysfs- and/or ioctl-based interface would allow us to:

1. Threat some data as optional.

2. Extend the interface later should the need arise.

Looking at the tuxedo-drivers code, it seems that the WMI interface also reports:

- preset color
- device type (touchpad, keyboard, ...)
- keyboard type (US/UK)

Making this information available through the HID LampArray protocol would be
difficult (except for the device type information).

>> Agreed on everything Hans said.
>>
>> I'll personnaly fight against any new "illumination" API as long as we
>> don't have committed users. This is the same policy the DRM folks
>>> are
> Well, and I'll personally fight against user<->kernel protocol as
> crazy as HID LampArray is.
>
> OpenRGB is not suitable hardware driver.
> 								Pavel

I agree.

The point is that we need to design a userspace API since we cannot just allow
userspace to access the raw device like with HID devices.

And since we are already forced to come up with a userspace API, then maybe it would
make sense to build a extendable userspace API or else we might end up in the exact
same situation later should another similar driver appear.

Since the HID LampArray is a hardware interface standard, we AFAIK cannot easily extend it.

Also i like to point out that OpenRGB seems to be willing to use this new "illumination" API
as long as the underlying hardware interface is properly documented so that they can implement
support for it under Windows.

I would even volunteer to write the necessary OpenRGB backend since i already contributed to
the project in the past.

Thanks,
Armin Wolf

