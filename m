Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63975927A3C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 17:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5858E10E153;
	Thu,  4 Jul 2024 15:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="IfB7BJIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E5810E153
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1720107211; x=1720712011; i=wahrenst@gmx.net;
 bh=98Fv4WaU9GlBG/dHpM2dEGKJgOrhk2ynM6NmVcPE9QI=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=IfB7BJIzm3FbgnqQrPiJDHydXnP33zbtPotcO4fDqVNDDTLwYvSkJHVOsLhBvEyc
 jX8ajkdysTMYzb6wljafi8uypqeRgxEjl/xV3OR/SY7biLZ8QMtFtAM0KUFge0yIr
 iZLqty3SF8kGjKMtW3A1DZUb0ggQfg+cqUhJdxbkYKZEWlGApbhkRe70k7VRD+Wik
 /nFIieC5QiPgbqW91cSbJAXcIvbrOa2CF4XvfXZlel5pl69cwOTBWo9RJfSo3hE+f
 4Gk5hhyQxu5fDgKCJISgZ7gGC+N5JClPRuHXYh7GlrF/B413Q1h+Qkxc/fb/x3qTn
 0pDj8gHA+sCj65Uk2Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Kr-1sTXSq1JWF-006291; Thu, 04
 Jul 2024 17:33:31 +0200
Message-ID: <3e926b4d-07e5-4f9b-adc9-aee0a2722f1c@gmx.net>
Date: Thu, 4 Jul 2024 17:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] usb: dwc2: Skip clock gating on Broadcom SoCs
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-10-wahrenst@gmx.net>
 <95762956-b46a-4dfa-b22f-bccbfa39558d@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <95762956-b46a-4dfa-b22f-bccbfa39558d@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w4pSxCNjC/D9OtsHIZDqyIGCKnLROh7+9G0ssYOdaT9Aw1wW7WN
 cB3k4sAz6S9j1K2d0vOeNijqu9VMMP7C3jelcpkbp+XQA4yWsJoEXafBGiMQ3TY9fR37arx
 vOyRtLFYMVci6rREjreiVju2A14cqPBU+rA3Wf+621oJ3EzFbw2YS3BPBq/KUDZf8lCFeSI
 6/pHnXNMWJsChBeWW8yUA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rv48hkiZCGU=;i8aKzOnd47OXo4FG50ROfCiFRrj
 YUQRAV5OHAgxzF76ZObXHgxs8cE8ga9JFIcb9669uZLWH+VAPX9IgsPO0IfjQ4K8y7DyvEd1V
 CxpzVd6FoZAcVInn/nkNVDov3XEP9xSDeJUkO8ukmZkKvLcWyNoCB4IjcgLy++7kAbSKK6ZPR
 Gusv23hB9M+FD4SCRwV+6N1hULkunhaWQCiez1ZzvilB+Ow8K5C/XUhTSKHV1NKIhMvSzBGUf
 DpwVwexfuUbDKT6IKHZmgSglmJ/4j61yQtx+cqZVSwOz7mT2kZfIxg3T2cEOAHiabkkriUB/c
 8B6QRY33eQrSd4cNarwGSrnajIWfP3tj4DB3bim4+VSCbGNH07QhLvRUxWyusKZzPLFpbykzw
 DlEMmvakX7g3qW6/DiYTfRCKbyXnS4ngLK9orUHf2m/rUM9HmigEOAgqLFQMT53C8RcJrZsaA
 kuqA5L+Y02Y6iG+nYpwsuWOQ4LAxlSSNWzxO8A/VLELIkRWig5qtQzGGJzHndvZr6JkkVFjd6
 mAw0ZQMHguuy0dgSb9Es3Ar0gnBmSGIjv7fIvBYOOEkpuwRl4veIhUjy/kINd+jFYOIR+DOXO
 X67Eq/Gm60/o0fv22oAuAxLdPx2msnf03YmD3qRgQWv+h1uFM3ea6iu8VymTGv2QThcEkPGQd
 ZaTo0sCTgpnufs1RhBTELvF9N2qJ+qeUsp76FHgefO85p2558D2HuLx3V6kqwnZRZyLtgtniq
 wtHS0Dzgs3pcRq1dHLZgDLvMQAK5fUY+DQCA+VKKO5q9IEQDjTti2xwZFRbdUOWkIZgp89APv
 IOu8/H6+ojMp6qECy5QNW8PJeIds/+juweFFTJyLWKZDE=
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

Hi Florian,

Am 04.07.24 um 16:14 schrieb Florian Fainelli:
>
>
> On 6/30/2024 4:36 PM, Stefan Wahren wrote:
>> On resume of the Raspberry Pi the dwc2 driver fails to enable
>> HCD_FLAG_HW_ACCESSIBLE before re-enabling the interrupts.
>> This causes a situation where both handler ignore a incoming port
>> interrupt and force the upper layers to disable the dwc2 interrupt line=
.
>> This leaves the USB interface in a unusable state:
>>
>> irq 66: nobody cared (try booting with the "irqpoll" option)
>> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.10.0-rc3
>> Hardware name: BCM2835
>> Call trace:
>> unwind_backtrace from show_stack+0x10/0x14
>> show_stack from dump_stack_lvl+0x50/0x64
>> dump_stack_lvl from __report_bad_irq+0x38/0xc0
>> __report_bad_irq from note_interrupt+0x2ac/0x2f4
>> note_interrupt from handle_irq_event+0x88/0x8c
>> handle_irq_event from handle_level_irq+0xb4/0x1ac
>> handle_level_irq from generic_handle_domain_irq+0x24/0x34
>> generic_handle_domain_irq from bcm2836_chained_handle_irq+0x24/0x28
>> bcm2836_chained_handle_irq from generic_handle_domain_irq+0x24/0x34
>> generic_handle_domain_irq from generic_handle_arch_irq+0x34/0x44
>> generic_handle_arch_irq from __irq_svc+0x88/0xb0
>> Exception stack(0xc1b01f20 to 0xc1b01f68)
>> 1f20: 0005c0d4 00000001 00000000 00000000 c1b09780 c1d6b32c c1b04e54
>> c1a5eae8
>> 1f40: c1b04e90 00000000 00000000 00000000 c1d6a8a0 c1b01f70 c11d2da8
>> c11d4160
>> 1f60: 60000013 ffffffff
>> __irq_svc from default_idle_call+0x1c/0xb0
>> default_idle_call from do_idle+0x21c/0x284
>> do_idle from cpu_startup_entry+0x28/0x2c
>> cpu_startup_entry from kernel_init+0x0/0x12c
>> handlers:
>> [<f539e0f4>] dwc2_handle_common_intr
>> [<75cd278b>] usb_hcd_irq
>> Disabling IRQ #66
>>
>> Disabling clock gatling workaround this issue.
>
> Typo: gatling/gating.
>
>>
>> Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr
>> function.")
>> Link:
>> https://lore.kernel.org/linux-usb/3fd0c2fb-4752-45b3-94eb-42352703e1fd@=
gmx.net/T/
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>> =C2=A0 drivers/usb/dwc2/params.c | 1 +
>> =C2=A0 1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>> index 5a1500d0bdd9..66580de52882 100644
>> --- a/drivers/usb/dwc2/params.c
>> +++ b/drivers/usb/dwc2/params.c
>> @@ -23,6 +23,7 @@ static void dwc2_set_bcm_params(struct dwc2_hsotg
>> *hsotg)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->max_transfer_size =3D 65535;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->max_packet_count =3D 511;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->ahbcfg =3D 0x10;
>> +=C2=A0=C2=A0=C2=A0 p->no_clock_gating =3D true;
>
> Could we set this depending upon whether the dwc2 host controller is a
> wake-up source for the system or not?

I would prefer to fix the suspend/resume behavior reported here [1]
instead of making tricky workarounds. But i don't have an idea how to
achieve this.

[1] -
https://lore.kernel.org/linux-usb/3fd0c2fb-4752-45b3-94eb-42352703e1fd@gmx=
.net/
