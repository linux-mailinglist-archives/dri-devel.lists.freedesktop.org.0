Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3034CC0F7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 16:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DE510E363;
	Thu,  3 Mar 2022 15:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C854610E363
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 15:16:12 +0000 (UTC)
Date: Thu, 03 Mar 2022 15:15:54 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v16 4/4] drm/bridge: dw-hdmi: fix bus formats negotiation
 for 8 bit modes
To: Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <I2D68R.CP2B1MABRO51@crapouillou.net>
In-Reply-To: <d75cd860-2a4c-6f81-b5d0-dc75f37b7150@baylibre.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <169afe64b4985c3f420177cd6f4e1e72feeb2449.1645895582.git.hns@goldelico.com>
 <5da069b6-8a99-79c2-109c-c85715165857@baylibre.com>
 <E0D3B7E8-0C8D-4119-8267-0556AB921B24@goldelico.com>
 <fca28594-8d4e-dd2f-93a0-a052cb888d90@baylibre.com>
 <75CBD357-577A-402D-9E3B-DBE82A84BC43@goldelico.com>
 <4cb08b5d-c1ec-f2b4-a107-63a771146ec0@baylibre.com>
 <598F3A49-9CE2-4C59-95D4-CDA888A3B3BF@goldelico.com>
 <3625b23b-9718-640a-1aac-0b30773a26ab@baylibre.com>
 <E95145AB-DEFC-419D-B926-B0BAF0985D09@goldelico.com>
 <d75cd860-2a4c-6f81-b5d0-dc75f37b7150@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Paul Boddie <paul@boddie.org.uk>, Maxime Ripard <maxime@cerno.tech>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-mips <linux-mips@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Any feedback on the other patches?

They look fine to me, but I still need an ack to merge them in=20
drm-misc-next.

Cheers,
-Paul


Le jeu., mars 3 2022 at 12:42:02 +0100, Neil Armstrong=20
<narmstrong@baylibre.com> a =E9crit :
> On 03/03/2022 11:40, H. Nikolaus Schaller wrote:
>> Hi Neil,
>>=20
>>> Am 03.03.2022 um 09:35 schrieb Neil Armstrong=20
>>> <narmstrong@baylibre.com>:
>>>=20
>>> Hi,
>>>=20
>>> On 02/03/2022 23:24, H. Nikolaus Schaller wrote:
>>>> Hi Neil,
>>>>> Am 02.03.2022 um 15:34 schrieb Neil Armstrong=20
>>>>> <narmstrong@baylibre.com>:
>>>>>=20
>>>>> Hi,
>>>>>=20
>>>>>> (cross-checked: RGB mode still works if I force=20
>>>>>> hdmi->sink_is_hdmi =3D false)
>>>>>=20
>>>>> I don't understand what's wrong, can you try to make the logic=20
>>>>> select MEDIA_BUS_FMT_YUV8_1X24 instead of=20
>>>>> DRM_COLOR_FORMAT_YCBCR422 ?
>>>> I have forced hdmi->sink_is_hdmi =3D false and replaced
>>>>   	/* Default 8bit RGB fallback */
>>>> -	output_fmts[i++] =3D MEDIA_BUS_FMT_RGB888_1X24;
>>>> +	output_fmts[i++] =3D MEDIA_BUS_FMT_YUV8_1X24;
>>>> And then screen remains black. MEDIA_BUS_FMT_RGB888_1X24 works.
>>>> (MEDIA_BUS_FMT_VUY8_1X24 doesn't work either).
>>>> So this indicates that YUV conversion is not working properly.=20
>>>> Maybe missing some special
>>>> setup.
>>>> What I have to test if it works on a different monitor.
>>=20
>> Same effect on a Xiaomi monitor (user manual just telling HDMI1,4=20
>> compatible), an
>> older Acer video projector and a Sharp TV set.
>>=20
>> The Xiaomi monitor does not say "No signal" but shows a black=20
>> screen. The others
>> do not even report any HDMI signals. All work well with=20
>> MEDIA_BUS_FMT_RGB888_1X24.
>>=20
>> This means the transcoding to YUV does not work properly on the=20
>> jz4780 SoC setup.
>>=20
>> So it looks as if we have to disable it (at least unless someone=20
>> finds a fix).
>>=20
>>>> Not that this specific panel
>>>> (a 7 inch waveshare touch with HDMIinput) is buggy and reports YUV=20
>>>> capabilities
>>>> but does not handle them...
>>>> On the other hand this panel works on RasPi and OMAP5 (where I=20
>>>> admit I do not know in
>>>> which mode).
>>>=20
>>> Pretty sure they don't support YUV HDMI output.
>>>=20
>>> If you can try on a certified HDMI devices like a TV, it would here=20
>>> figuring out where comes the issue.
>>=20
>> I am not sure if the Sharp TV is fully certified but would assume...
>>=20
>>>=20
>>>>> If your CSC is broken, we'll need to disable it on your platform.
>>>> Indeed.
>>>> So it seems as if we need a mechanism to overwrite=20
>>>> dw_hdmi_bridge_atomic_get_output_bus_fmts()
>>>> in our ingenic-dw-hdmi platform specialization [1] to always=20
>>>> return MEDIA_BUS_FMT_RGB888_1X24.
>>>> Or alternatively set sink_is_hdmi =3D false there (unfortunately=20
>>>> there is no direct access to
>>>> struct dw_hdmi in a specialization drivers).
>>>> Is this already possible or how can it be done?
>>>=20
>>> It's not handled yet, but we may add the logic to handle the lack=20
>>> of CSC config bit and
>>> add a glue config bit to override this like we already did for CEC.
>>>=20
>>> I wrote an initial support to disable CSC (only compile-tested),=20
>>> could you try on your platform with setting disable_csc =3D 1 in your=20
>>> dw-hdmi glue code ?
>>=20
>> This works!
>>=20
>> So how can we get that merged? IMHO your proposal should be before=20
>> we add ingenic-dw-hdmi.
>> If you have a version with proper commit message I can add it to the=20
>> beginning of my
>> seried and include it in a v17. Or if you get yours merged to=20
>> drm-misc/drm-misc-next I
>> can build on top.
>=20
> You can add it in your v17 patchset with my authorship and my=20
> Signed-off-by tag + yours.
>=20
> As commit message something like :
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> drm/bridge: dw-hdmi: handle unusable or non-configured CSC module
>=20
> The dw-hdmi integrates an optional Color Space Conversion feature used
> to handle color-space conversions.
>=20
> On some platforms, the CSC isn't built-in or non-functional.
>=20
> This adds the necessary code to disable the CSC functionality
> and limit the bus format negotiation to force using the same
> input bus format as the output bus format.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Thanks,
> Neil
>=20
>>=20
>> BR and thanks,
>> Nikolaus
>>=20
>=20


