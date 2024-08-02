Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5FB945E3A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 15:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C5D10E11A;
	Fri,  2 Aug 2024 13:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="S0uZlbcn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074410E0BC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722603610; x=1723208410; i=wahrenst@gmx.net;
 bh=A2QzoTKTII1WsKG0PH3QuAO0/0n3FuaOu6aOpLAVdNQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=S0uZlbcn1w/QQinHP793wsvSDuLscCzWLifIO5Z1tc1YkJuqD1ROvgfz8ZGqzW1F
 5vZdnLMyF5DVGARxN0JdvBPeRMvrDyCiV1JpWEfG4inyd68A6EPsSXuaPCjI2IVDE
 WRom3o4rqhvTTBOpr7kNH+TtgRdljU870COhJDKQhsXOdQRdTnPmz/JXNTw0xuWCG
 yvvj3PCxseJolIa8mb1Jc6WyQyV9MIxeaede1pM40W32wkFcecbw+mjV9cCvMLZyC
 uZIn+g3AGZNuLV139xDLK2PEQe7057Nky71so6ZdwF4MmbJoQBf7WdD0Sdbl0w8Tz
 d2MUva9YUCX8yyScPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2E1G-1s6XwN33GQ-00uTsS; Fri, 02
 Aug 2024 15:00:09 +0200
Message-ID: <a19767c3-c457-4e52-bc66-8f1898a83193@gmx.net>
Date: Fri, 2 Aug 2024 15:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 09/16] drm/vc4: v3d: simplify clock retrieval
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
 <581726ae-dd9c-476f-817d-4140f7217ec7@igalia.com>
 <b34cc73c-721f-48b6-a7a3-da8190d80dd8@gmx.net>
 <6047643f-e1f5-4be4-b55d-f59576999d91@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <6047643f-e1f5-4be4-b55d-f59576999d91@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rSWdEotFxjzjRcS7FB9Jk7LKsLdKnIul40HzxtW2lF3Y2vSxXrn
 l9xU9sr25E9vtAbxZNcStcQNHNcUatMO2WBm/1/EunVjh6qPZWm5qcBUJfEq7ESbuhtXD30
 gZT3GhXutgYSULEvLRlZzQHSLrsiN9NYe9YcN28icOoCSq4imGrBS7R0XaAACHIgK+jNIO3
 5QgjbTyaFZYeb6fT4XOZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OZcbhCw+rgg=;Wt5r+cNqth9P7BB10FttMMDVdRY
 780NMXapa0hd8uQjXxsrCLZ9hm4j1eX/XgNtsG9ccq18VlmYPbhGeX1fNtCcuMqeaZGz7oo0C
 XXqT7v8QoQF4obr/q9WMmnz/ZxjyPk87gqs/NVUJ4isHVmmiGCeXo70exafN/BZY/WrCvz6DF
 vMGWV6FcZLEDFbGmbHF+uS/YRgjVEuTR4llOQl+b9U5/mx3vyzbX1Pcffo7HzBF5H1Xb3oFfh
 uuRli8lhw7t/3jDwONcS8w29Ehv71V1ycS8SM1STA6VKMXJGdgTv5IuBb7seDqhk8CZJfUnCa
 Ca06GbcHD98KaxdldYySk6Lb1eVd6oZJUUc84s7AZDNv6Vj4OTSbHOJobS2rmAsFNNfA1z1gj
 8p3DX+md6vTXjq0eLRrbI7gO1/HkosGH7q1XmyW9Sbjh3zAziUD0Y+UKcJJRURexaerwJoReU
 MTUhvuPF+DPdV5lk9n+VoKZtFpoBKQNLrqqTrgU4K5eclzp4TmQm9DDIObZT+Hz9UU2OtXSfA
 p0JD7yDP6lK0g4T9XcmGeMcZy/Gus3rjPJ7AbnSEqyr6Hf5R5QN3i//ReMfvklr54QW5tn6kY
 NsCnuWH+HLJDvYaoMHrG5c7pN29pK7cUOJ7GgQtwIptDqoqZ/ERjwYcrsZXxOLdsb2iy8ZFzL
 DKUPhoWu3SS9nQDfnHawFg+WElez+aqLEtOz1XVmCwcmSWy43sU2mEIEUcLwHBH5VsgVRRsgZ
 vuW70tcUcLGg31dD57XAwXO0bA/m6yLG50DZvMRV9wBYyoMioqeqnv+wYVimiPbH8TIXiS2Ly
 wAJBrICu5oSXhF5AtupT3qOw==
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

Hi Ma=C3=ADra,

Am 02.08.24 um 14:56 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> On 7/31/24 13:41, Stefan Wahren wrote:
>> Hi Ma=C3=ADra,
>>
>> Am 30.07.24 um 13:23 schrieb Ma=C3=ADra Canal:
>>> On 7/28/24 10:00, Stefan Wahren wrote:
>>>> Common pattern of handling deferred probe can be simplified with
>>>> dev_err_probe() and devm_clk_get_optional(). This results in much
>>>> less code.
>>>>
>>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>>> ---
>>>> =C2=A0 drivers/gpu/drm/vc4/vc4_v3d.c | 13 ++-----------
>>>> =C2=A0 1 file changed, 2 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c
>>>> b/drivers/gpu/drm/vc4/vc4_v3d.c
>>>> index 1ede508a67d3..4bf3a8d24770 100644
>>>> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
>>>> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
>>>> @@ -441,20 +441,11 @@ static int vc4_v3d_bind(struct device *dev,
>>>> struct device *master, void *data)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vc4->v3d =3D v3d;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v3d->vc4 =3D vc4;
>>>>
>>>> -=C2=A0=C2=A0=C2=A0 v3d->clk =3D devm_clk_get(dev, NULL);
>>>> +=C2=A0=C2=A0=C2=A0 v3d->clk =3D devm_clk_get_optional(dev, NULL);
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(v3d->clk)) {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D PT=
R_ERR(v3d->clk);
>>>>
>>>
>>> Super nit: you could delete this line ^
>> Can you please explain? ret is required for dev_err_probe or do you mea=
n
>> the empty line after the declaration?
>
> Just deleting the empty line after the declaration. It is a super small
> nit indeed.
AFAIK an empty line after a declaration is part of the coding style. Or
is different in drm?

Best regards
>
> Best Regards,
> - Ma=C3=ADra
>
>>>
>>> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>>>
>>> Best Regards,
>>> - Ma=C3=ADra
>>>
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret =3D=3D -ENOENT) {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
* bcm2835 didn't have a clock reference in the DT. */
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
et =3D 0;
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=
3d->clk =3D NULL;
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (ret !=3D -EPROBE_DEFER)
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "Failed to get V3D clock: %d\n",
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret);
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
eturn ret;
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(dev,=
 ret, "Failed to get V3D clock\n");
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D platform_get_irq(pdev, 0);
>>>> --
>>>> 2.34.1
>>>>
>>>
>>

