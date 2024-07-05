Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E89286B2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C226710EA2F;
	Fri,  5 Jul 2024 10:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kHF9P/LJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027F110EA2F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1720174958; x=1720779758; i=wahrenst@gmx.net;
 bh=WD4OZpkM4HUgmvqGgh/yyEha0LutMtATs1AB8Udylds=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=kHF9P/LJU5e1luz5bnILmbyTiKn66/EykuCu8uQEym5+jkWniuLBvCU25Yad/M5r
 cp0yZK8YXZ0Zs/D4lwmY292yuXPOMWUjugLgjeJdPzIC41l3+G51DZCO6TO3Dde5m
 Secb2sBCf0lBuSCickUBB9ibET85kYXNn1y3v426PRWNQMhUIPJYBj/tr3Bd3QcoP
 Oein3YFh6neqZnfcmntEoz+SZqiumJR9wCzPkYrxDK7BMRPZDrnAJWx++r/07/jt6
 /XZu31Fa7d0la9N3haeUeQZC2HGOuNMvRlzwrW1WoJR5g7RNPGe/9C/RJ/6XQwvAx
 ERvQgKbZVCHKVbmQqQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1skWrK1Pb2-00UNmP; Fri, 05
 Jul 2024 12:22:38 +0200
Message-ID: <4502d826-d80c-4a98-a889-da7badfa698e@gmx.net>
Date: Fri, 5 Jul 2024 12:22:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] usb: dwc2: Skip clock gating on Broadcom SoCs
To: Lukas Wunner <lukas@wunner.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-pm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-10-wahrenst@gmx.net>
 <95762956-b46a-4dfa-b22f-bccbfa39558d@broadcom.com>
 <ZoezRpXBgB1B5WjB@wunner.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <ZoezRpXBgB1B5WjB@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s+lf1cnW0lEbygFenT7V76UBWNdrqq8ojM/03RmipVMIMIqD5IT
 Z+Qzg8vlIRZLRIxUSCq2mJtSCJhrNm9K9JGychlpUeWijNb5IyLRwyxkSX1nk+50MmXZQ1z
 SgacpF1Mf/ROQGgoWa8uG1WF6ohMQHpSU9oeCJa0wPfdHe0Zkm7IVypQbOXWe9+7ZW93EYG
 f1IZxqOf2aRpbzNJgCOKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G8MuPM7llmI=;2KJoPdYNmWC1SKxRuWqqXmv2svh
 UoCMWjX8g5y4HJgonBJqmV/xVqL1ZlRh7qJ2OulPl6T0w4FsxgYqhcBVWoTlzULYOWszO1S2e
 T2Pynq/3UubdHabsa9lNN6IUMJRokOesNHdGFQYTg4HXvT2op+rWTXYqSLNHByAoNxFd+x1r1
 bN7dgsK0et7f6smUlEdWVg3JJ12WYK52YhJ+rIq0i0UG4nIxpelIkfgM0ftOsU/cFYvFYiaaZ
 pv3Wh8q/92UaBmeZ0/LcylKrgBrX4rRpMheT0TrFwcW0QY9MJXo6zfOG3zCxCxIDc8ucDHUCF
 Oaf5EGQO4EMwMFZhR77/Ke2Ie35Pv8sZrst3rSiHRtxNyOuMPkvNJMvohGZGhMt0J5vB34IB9
 ZJBmsrxdhNYkuVqVvkqOV4Zoq96wDIyJqqomq0winS3bSHFw8qeILS/iri7j01hTiuY43ZWxe
 3Scx2/x019+DCqUZ32wWVBixB4aRGaeEKjHBqBIaCeBkXLCexQ+xJj7rXtWOarFh2t2aYJ4c1
 krEkK+Lkq3OIJqqIYcncuFdZd9VFwmPoinC8Qfy4MEIm/ati2R0nbQM6qMcxNQsho5O/3mdtV
 U/+qJLe4VR0t3RrF/H3WhakpUj4WYVvytqzxp+opxpUHI7rc5yulVWihTBFwhSRN835b8TKAP
 e5AuTf1flkFzvX81/XrQf5Z1PD1bR2OtPLoyb89xpoHUrRJm+/g4dL/0+/GJEfjnLDFkx9F9P
 YdrndTkE3hXvKSAXEEEgtF1/zTNgxAErrAgU/Lw3MzkfYZi/ZKT/M64OGx56lAmISAkVwFUxo
 ARjNbwxxuM4UyS3vxX8w3UC5j5RKCt1jSkgHM0rc+8Z4A=
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

Am 05.07.24 um 10:48 schrieb Lukas Wunner:
> On Thu, Jul 04, 2024 at 03:14:50PM +0100, Florian Fainelli wrote:
>> On 6/30/2024 4:36 PM, Stefan Wahren wrote:
>>> On resume of the Raspberry Pi the dwc2 driver fails to enable
>>> HCD_FLAG_HW_ACCESSIBLE before re-enabling the interrupts.
>>> This causes a situation where both handler ignore a incoming port
>>> interrupt and force the upper layers to disable the dwc2 interrupt lin=
e.
>>> This leaves the USB interface in a unusable state:
>>>
>>> irq 66: nobody cared (try booting with the "irqpoll" option)
>>> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W          6.10.0-rc3
>>> Hardware name: BCM2835
>>> Call trace:
>>> unwind_backtrace from show_stack+0x10/0x14
>>> show_stack from dump_stack_lvl+0x50/0x64
>>> dump_stack_lvl from __report_bad_irq+0x38/0xc0
>>> __report_bad_irq from note_interrupt+0x2ac/0x2f4
>>> note_interrupt from handle_irq_event+0x88/0x8c
>>> handle_irq_event from handle_level_irq+0xb4/0x1ac
>>> handle_level_irq from generic_handle_domain_irq+0x24/0x34
>>> generic_handle_domain_irq from bcm2836_chained_handle_irq+0x24/0x28
>>> bcm2836_chained_handle_irq from generic_handle_domain_irq+0x24/0x34
>>> generic_handle_domain_irq from generic_handle_arch_irq+0x34/0x44
>>> generic_handle_arch_irq from __irq_svc+0x88/0xb0
> A similar issue was reported for Agilex platforms back in 2021:
>
> https://lore.kernel.org/all/5e8cbce0-3260-2971-484f-fc73a3b2bd28@synopsy=
s.com/
>
> It was fixed by commit 3d8d3504d233 ("usb: dwc2: Add platform specific
> data for Intel's Agilex"), which sets the no_clock_gating flag on that
> platform.
>
> Looking at drivers/usb/dwc2/params.c, numerous other platforms need
> the same flag.
>
> Please amend the commit message to mention the Agilex issue and
> resulting commit.
 From my understanding Samsung noticed this issue at first and
introduced the no_clock_gating flag [1] and they referenced 0112b7ce68ea
("usb: dwc2: Update dwc2_handle_usb_suspend_intr function.") as I did in
this patch. Later some platforms like Rockchip and Agilex followed.

Should i better refer to the Samsung bugfix instead of the Agilex bugfix?
>
>
>>> --- a/drivers/usb/dwc2/params.c
>>> +++ b/drivers/usb/dwc2/params.c
>>> @@ -23,6 +23,7 @@ static void dwc2_set_bcm_params(struct dwc2_hsotg *h=
sotg)
>>>    	p->max_transfer_size =3D 65535;
>>>    	p->max_packet_count =3D 511;
>>>    	p->ahbcfg =3D 0x10;
>>> +	p->no_clock_gating =3D true;
>> Could we set this depending upon whether the dwc2 host controller is a
>> wake-up source for the system or not?
> The flag seems to mean whether the platform is actually capable of
> disabling the clock of the USB controller.  BCM2835 seems to be
> incapable and as a result, even though dwc2_host_enter_clock_gating()
> is called, the chip signals interrupts.
That's why I was asking about this in the initial bug report. Since I
didn't get a reply, I submitted this workaround.
> There doesn't seem to be a relation to using the controller as a
> wakeup source, so your comment doesn't seem to make sense.
> If the clock can't be gated, the chip can always serve as a
> wakeup source.
I wouldn't conclude that the chip can always serve as a wakeup source
(e.g. power down the USB domain would also prevent this), but i agree
creating a relation between wakeup source and clock gating is a bad idea.
> The real question is whether BCM2848 platforms likewise cannot disable
> the clock of the dwc2 controller or whether this is specific to the
> BCM2835.  Right now dwc2_set_bcm_params() is applied to both the
> BCM2848 and BCM2835.  If the BCM2848 behaves differently in this
> regard, we'd have to duplicate dwc2_set_bcm_params() for the BCM2835.
 From my understand BCM2848 refers to the same SoC, but the ACPI
implementation uses a different ID [2]. So I think this is safe.
>
> Thanks,
>
> Lukas

[1] -
https://lore.kernel.org/linux-usb/20210716050127.4406-1-m.szyprowski@samsu=
ng.com/
[2] -
https://patches.linaro.org/project/linux-usb/patch/20210413215834.3126447-=
2-jeremy.linton@arm.com/

