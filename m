Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF09264E0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A56F10E94D;
	Wed,  3 Jul 2024 15:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="b+swRCGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9A210E94D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1720020776; x=1720625576; i=wahrenst@gmx.net;
 bh=yl1nTP1CLzZB+KqfQ4zqkTGplb9iUlDVeXwjVUfcLNU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=b+swRCGHMb7T+IF+fLsxlqXDlj1oFqgPtFBkTNegQXukR8sdNLLn2xCk/Br/xQ9I
 NFPNM8V1FBGFxvUo5QLezthP0RsxQ2phPTarefOyMUZqDoW+CHE8+j1u4HBcssa2A
 W6fBg3iuEXqdTzDS2LO/SqqEOZGxNuCoS0eOinsQCHd+IZF2iYL+BGXhxdrXvbLFM
 uXywgNlGCxuCQ4Ic1f7WGU0hgtSIYbAFVeMsbAgSPxboSnyJknuCVDk+PS5dwK638
 nH+NGLauAV+tgP68qmZzazk6tE2MjEL4JvUshko8gj6soP/OjB9T7V2JhuyqLzsIS
 QtoLgixMhOhFBtt1fg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1s0N3m1OM2-00kHIT; Wed, 03
 Jul 2024 17:32:56 +0200
Message-ID: <7e3d4769-bd9c-47e8-bac2-9245b08866c3@gmx.net>
Date: Wed, 3 Jul 2024 17:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] drm/vc4: hdmi: Disable connector status polling
 during suspend
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com
References: <20240630153652.318882-1-wahrenst@gmx.net>
 <20240630153652.318882-8-wahrenst@gmx.net>
 <20240702-qualified-archetypal-worm-416a2f@houat>
 <b4295be1-6fa4-4118-8554-b8a7cc605f9d@gmx.net>
Content-Language: en-US
In-Reply-To: <b4295be1-6fa4-4118-8554-b8a7cc605f9d@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ePjWIzkXckMeXLCLN/9eWki0p9PbzMMzwiOfq3KAK6zQa7sDIBF
 zH8h+siK/1Z3d4McRciBNMemTboDtgGnkEtqsmZ7h95n/EwESNV73n6tV7WEHvrhu3K0Qh0
 potxhOzBRp5gWXn1F+pPXcE9TzfCaXny5WdTC+fsWiiYs9R1H5C6OjsKcRDToQbAlO2TRNi
 oy3MbvVrQbkJqmuUhOzDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BQzv5ocnjQY=;x9/HKnkcpT8XNMHe0LAN+c4jHE2
 QAlqSIu10Lv8ioocBQxf6Q07NbNighg/IJzNce9x9jq3oSQ/pL2TpJaJy6ME1OG9AgW3VbxUK
 GFJzdu/tllTghQlPOKAQ52RmJJ/JqX2eGWjYd2lf29U1fX26sUT9afSyD8G89RuGOARYK7asl
 ys19OVQUKejWOYACtcpdQBDI5B6v9UHKvtErQ0Pkaidnp3q3D08zu5nbfIl7t8+TwDPWauQGt
 u/IxlhYBs2mST1NgHDGzg7guiooeGdx9117SCPcA7Y5dyeChavFTyh7IMQ8JfjjmXsU98fwC1
 RPbvwUBIhy3orNk5RNT7jU3URrhfx4ogbq/iFnq9serP7aufYPMiG3Z4zCjFnVD0F45+mYBx6
 6Fo9zFu6Xn9LtoXjL1u3xWnwPAdAzZ9l6xVs4VXswcObkPL7kCCtqtxjaUvQk3C7liGzmMuLb
 +Rr1WJYNHeWrhcEVMFSZlpBN8/4xZ3cpJdKjw4smgTpFpNsNzIBcs7dGp8JRzzdzetOylAksP
 JXgl3qDdYyCCIV+U5KX1Sk1g35nkMNRoxYMdAXkIO5acBbYQDfrln7PbZyWq3cv+ulnEq3+Yy
 pXdaITskzC1+l7RRW+28eR1nyRQLm0h2vSI1TMstoZYCsZZmF2pIX5ya+ZjAtBnWW+NBUfB2/
 WNpiwXGLxnGRaXaViQfOi+ZBLJ76e+xfqoPnjRZW0Y8yFZOasoCRA6VmEjr3S+eyjqgyxlVfL
 xZV+ixfsIDZxI5aZ5C8i8EBjK0eAiuHwNw1QPsm5y4N5IEfHzhsDnNKy8M7yUXRvWfi+gWFDf
 jX8TvgK/ORZkMzrQlMtFYKs6VGiwqIDQllJcvLX5wxAb8=
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

Am 03.07.24 um 12:28 schrieb Stefan Wahren:
> Hi Maxime,
>
> Am 02.07.24 um 15:48 schrieb Maxime Ripard:
>> Hi,
>>
>> On Sun, Jun 30, 2024 at 05:36:48PM GMT, Stefan Wahren wrote:
>>> Suspend of VC4 HDMI will likely triggers a warning from
>>> vc4_hdmi_connector_detect_ctx() during poll of connector status.
>>> The power management will prevent the resume and keep the relevant
>>> power domain disabled.
>>>
>>> Since there is no reason to poll the connector status during
>>> suspend, the polling should be disabled during this.
>>>
>>> It not possible to use drm_mode_config_helper_suspend() here,
>>> because the callbacks might be called during bind phase and not all
>>> components are fully initialized.
>>>
>>> Link:
>>> https://lore.kernel.org/dri-devel/7003512d-7303-4f41-b0d6-a8af5bf8e497=
@gmx.net/
>>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>>> ---
>>> =C2=A0 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++++
>>> =C2=A0 1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> index b3a42b709718..e80495cea6ac 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
>>> @@ -3106,6 +3106,13 @@ static int vc5_hdmi_init_resources(struct
>>> drm_device *drm,
>>> =C2=A0 static int vc4_hdmi_runtime_suspend(struct device *dev)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vc4_hdmi *vc4_hdmi =3D dev_get_d=
rvdata(dev);
>>> +=C2=A0=C2=A0=C2=A0 struct drm_device *drm =3D vc4_hdmi->connector.dev=
;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Don't disable polling if it was never init=
ialized
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 if (drm && drm->mode_config.poll_enabled)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_kms_helper_poll_disabl=
e(drm);
>> Does it make sense to add it to runtime_suspend?
> i saw that other drm drivers used drm_mode_config_helper_suspend() in
> the RUNTIME_PM_OPS. But i agree, it should be better moved to
> SYSTEM_SLEEP_PM_OPS.
>> What if the board boots without a display connected, and only after a
>> while one is connected? Wouldn't that prevent the driver from detecting
>> it?
> tbh I noticed that HDMI re-detection didn't worked in my setup
> 6.10-rcX before this series. I need to investigate ...
Okay, this patch breaks definitely HDMI re-detection. So please ignore
this patch. Sorry, about this mess.

There is another minor issue which already exists before that cause the
following log entry on HDMI reconnect:

[=C2=A0=C2=A0 74.078745] vc4-drm soc:gpu: [drm] User-defined mode not supp=
orted:
"1920x1200": 60 154000 1920 1968 2000 2080 1200 1203 1209 1235 0x68 0x9

But in this case HDMI works.

Regards
>>
>> Maxime
>

