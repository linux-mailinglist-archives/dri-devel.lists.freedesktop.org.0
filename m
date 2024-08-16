Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267D9954F67
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 18:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328E610E810;
	Fri, 16 Aug 2024 16:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="GlsQntRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 158573 seconds by postgrey-1.36 at gabe;
 Fri, 16 Aug 2024 16:58:04 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D58610E810
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1723827463; x=1724432263; i=wahrenst@gmx.net;
 bh=1n3jBbJPQqCuKXm/cOvjKzuwWNrLdImcAoHrvaKaDeQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=GlsQntRRH5E79PQ4ks2ICsCRiLKuJeXQK7YJa2sMH/QWSW32EmHGRBT0tU2I6vSb
 MgMI1cj8HCqg4Nw8eH79IIPnidPHuh6gr+N8ZRFkkXhFczBn0edvTwkeuJ8OG81VT
 kNPzi/gF4cDTaDSJVlxizvc92xVaJzcBaNYPer79cAa9pw8g6KYWjomqoKKDRhwEa
 ed/kEcmcSSol1ej2UZN9BHRlkoHDE64fbxZX/rrnR+napcQVq1Yy5c5QUl1KaFg/4
 TtWnKpMEN3+GJOMWv5Y/ranvcJolVv8PdFIoRlwCmbE+lEquKkJQPEdtTkUyw5+ox
 txqczpJ/WuOJI2hDzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0JM-1ruiEh1M1Q-00ogF8; Fri, 16
 Aug 2024 18:57:43 +0200
Message-ID: <282f4558-0357-4a8c-983e-b87b50c836a7@gmx.net>
Date: Fri, 16 Aug 2024 18:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 14/16] WIP: usb: dwc2: Implement recovery after PM
 domain off
To: Doug Anderson <dianders@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <20240728130029.78279-6-wahrenst@gmx.net>
 <65de7db8-4f81-4c31-be8d-3a03c9aee989@gmx.net>
 <CAD=FV=W7sdi1+SHfhY6RrjK32r8iAGe4w+O_u5Sp982vgBU6EQ@mail.gmail.com>
 <CAPDyKFpj0C1Bifmx=4zH3r8YooOrNfn_iDB+1sfRb0gTaKnT2Q@mail.gmail.com>
 <51b63ea5-808e-41e4-92a9-50e20afd155b@gmx.net>
 <CAD=FV=XHnKJT4ubmV8EPRYi-qPFH21tNFzWEWMezY2PGEFEKrw@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAD=FV=XHnKJT4ubmV8EPRYi-qPFH21tNFzWEWMezY2PGEFEKrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hQgCYaYLhTBZZ+78rEMu0DvJ/325XlhiOI9tGtnfMaYX52Plshn
 oFdEr5n1FeBjSQmsb8CY2AMCyBZMZp6ejcNwKWE2t/qpqTsbTHL3sEHqHZdM3xLvxnSmZLx
 60XTyGgKPSZGFFSTotcO5GAZVUwi7R4MEI2kYk074bgLuXqbydhRNGHIJ6mB4+Npg21ZC6G
 baSBrM/5yL2YaHOh6VjvA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KUrtCUdNtMY=;HUSH2Aztj1GRgt7R0Vx7g4hK+0D
 svWcViDjqj2MZV1EYU/E/E805k0z8FqxhQboa1OBQjcx1koCvPoci5NxK/4abU2mQFO2IdEX1
 e/XAPyCwwijwhei0B1l/pBQ0Sg5k4ObNcLQCgF2je2kJx+h+PNp/lTWxL5TI6WdJFi3OjSKFb
 HB0xc4NUF8tIxTy64nUoLO0ekgFhKqVL6UK4ONJrXq+BYZOk3USpyJix8JGo2kxopFPpvqv/U
 uTy10FS69eyXSaDDBsS6/pI7j6ICJxye6dUg97NYxalOjNWPHnYwvt5uYQWmaPhGnpiDrL8Ro
 HwiBEgIJrTtS7IbFqCTkFMlYPheiQWSaBOcZ4o7t+smMl8uT6Mb2zZtxvFy4m9aFwNujTGjWb
 bh78PZQgw0JI4ddnDZRDrHExMK6/vjwpUtfT8GoJZ2dEK5IFv1MpMnm7Xou7JEQrHN/ru4B+h
 O8iDEX892tZPc8soSPzQyr7xogOUNOKMRY2//EuJatXO4yyPfsP9pCPdEO7PVxW/Bxqb0lqaw
 eAbOHFnvgAtXXBlXdlKUtWD8ee42Q52IoeHVb/WEC+7FUN/G0m6eeZ7dtoUZJc0UnnBMB13AK
 KxAlpMtVnBIQ7VT7T1ZH7E8uB3ovNdkW1sVQNNoY/Qp0S8wkLnG6ZlHvGfAbFawMPb5Vr6WCU
 gukCcC6MRK0mZBp/LiGzYIgs8XLv6MvJg1CnuJgjRyKtZn4+LjSbOmO1aW2Ez5Fkbegkd6nYz
 qNestUoewQBwflkEOoQOKsjPPjORXUMQax2Jt+rHOkAQL1aYHTuX5HD4H8FFJweA25lXRmVpi
 NAOdC93yUH3uMikAgDNOVKdA==
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

Hi Doug,

Am 15.08.24 um 21:37 schrieb Doug Anderson:
> Hi,
>
> On Wed, Aug 14, 2024 at 2:48=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net>=
 wrote:
>>>> You're saying that your
>>>> registers get saved _unless_ the power domain gets turned off, right?
>> On BCM2835 there is no need to store the registers because there is no
>> power management supported by USB core except of the power domain. So
>> DWC2 don't expect a register loss.
>>>> ...and the device core keeps power domains on for suspended devices i=
f
>>>> they are wakeup sources, which makes sense.
>>>>
>>>> So with that, your patch sounds like a plausible way to do it. I gues=
s
>>>> one other way to do it would be some sort of "canary" approach. You
>>>> could _always_ save registers and then, at resume time, you could
>>>> detect if some "canary" register had reset to its power-on default. I=
f
>>>> you see this then you can assume power was lost and re-init all the
>>>> registers. This could be pretty much any register that you know won't
>>>> be its power on default. In some ways a "canary" approach is uglier
>>>> but it also might be more reliable across more configurations?
>> I don't have enough knowledge about DWC2 and i also don't have the
>> databook to figure out if there is a magic register which could be used
>> for the canary approach. But all these different platforms, host vs
>> gadget role, different low modes let me think the resulting solution
>> would be also fragile and ugly.
> I won't admit to having a DWC2 databook. ;-)
you convinced me of the canary approach. I missed one critical point the
whole time. The used power domain notifier can/will be called while the
USB clock is disabled. So this worked for the Raspberry Pi because the
clock is fixed.
> ...but don't think it's too hard to find a good canary. What about
> "GAHBCFG_GLBL_INTR_EN" ? From a quick glance it looks like the driver
> seems to set that bit during driver startup and then it stays on until
> driver shutdown. The databook that I definitely won't admit to having
> almost certainly says that this register resets to 0 on all hardware
> and it's applicable to both host and device. I think you could say
> that if the register is 0 at resume time that registers must have been
> lost and you can restore them.
There are several reason to not use the GAHBCFG_GLBL_INTR_EN. One is the
fact that the driver disabled this flag at several places, not just on
shutdown. Another reason is that the register layout of GAHBCFG on
BCM2835 is customized ( see last page of datasheet [1]).

I dumped the relevant registers with a unmodified dwc2 driver and the
outcome is a little bit unexpected (0 =3D PRE_POWER_OFF, 3 =3D POWER_ON):

[=C2=A0 169.101071] dwc2 20980000.usb: dwc2_suspend enter GAHBCFG =3D 0000=
0031
[=C2=A0 169.101143] dwc2 20980000.usb: dwc2_suspend enter GUSBCFG =3D 2000=
1707
[=C2=A0 169.101172] dwc2 20980000.usb: dwc2_suspend enter GINTMSK =3D f300=
0806
[=C2=A0 169.105888] dwc2 20980000.usb: dwc2_power_notifier: 0 GAHBCFG =3D =
00000031
[=C2=A0 169.105962] dwc2 20980000.usb: dwc2_power_notifier: 0 GUSBCFG =3D =
20001707
[=C2=A0 169.105994] dwc2 20980000.usb: dwc2_power_notifier: 0 GINTMSK =3D =
f3000806
[=C2=A0 174.248046] dwc2 20980000.usb: dwc2_power_notifier: 3 GAHBCFG =3D =
0000001f
[=C2=A0 174.248118] dwc2 20980000.usb: dwc2_power_notifier: 3 GUSBCFG =3D =
20402700
[=C2=A0 174.248148] dwc2 20980000.usb: dwc2_power_notifier: 3 GINTMSK =3D =
f3000806
[=C2=A0 174.253086] dwc2 20980000.usb: dwc2_resume enter: GAHBCFG =3D 0000=
001f
[=C2=A0 174.253162] dwc2 20980000.usb: dwc2_resume enter: GUSBCFG =3D 2040=
2700
[=C2=A0 174.253190] dwc2 20980000.usb: dwc2_resume enter: GINTMSK =3D f300=
0806
> I guess if that doesn't work then "GUSBCFG_TOUTCAL" could be used (I
> think that resets to 0 but must be initted to non-0 by the driver).
Yes this looks good and match with the trace above. The driver seems to
initialize this once and a quick test seems to work so far. I will stick
to this.
> Yet another register that could probably work as a canary would be
> "GINTMSK". I believe that inits to all 0 (everything is masked) and
> obviously to use the device we've got to unmask _some_ interrupts.
I don't know why but this didn't worked according to trace, but i also
didn't noticed a interrupt after enabling of the power domain.Thanks [1]
-
https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pd=
f
> I can look for more, if need be.
>
> -Doug
>

