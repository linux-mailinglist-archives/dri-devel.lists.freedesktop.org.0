Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846AA4A70F6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 13:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1BD10E3A9;
	Wed,  2 Feb 2022 12:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B4410E3A9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 12:41:36 +0000 (UTC)
Date: Wed, 02 Feb 2022 12:41:21 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v12 2/9] drm/ingenic: Add support for JZ4780 and HDMI
 output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <XKGO6R.LTTYDEGZ8RJH3@crapouillou.net>
In-Reply-To: <78F51BD7-112A-458D-8FCE-6A67572A182B@goldelico.com>
References: <cover.1643632014.git.hns@goldelico.com>
 <6a7b188769a7ad477bf8cb71e1b9bc086b92388d.1643632014.git.hns@goldelico.com>
 <N7AO6R.7I6FABF106MT1@crapouillou.net>
 <1F27171F-DFCA-4707-8F50-D1A343F6D78E@goldelico.com>
 <CYEO6R.2QDXEFO5G1WQ3@crapouillou.net>
 <37CB6D86-4295-4281-BF3E-3E4B40E74196@goldelico.com>
 <5ZFO6R.M6Z7S3EBA1YC1@crapouillou.net>
 <78F51BD7-112A-458D-8FCE-6A67572A182B@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le mer., f=E9vr. 2 2022 at 13:33:15 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
>=20
>=20
>>  Am 02.02.2022 um 13:28 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>=20
>>=20
>>  Le mer., f=E9vr. 2 2022 at 13:17:14 +0100, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  Hi Paul,
>>>>  Am 02.02.2022 um 13:06 schrieb Paul Cercueil=20
>>>> <paul@crapouillou.net>:
>>>>  Hi Nikolaus,
>>>>>>>  @@ -446,6 +454,9 @@ static int=20
>>>>>>> ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>>>>>>>  	if (!crtc)
>>>>>>>  		return 0;
>>>>>>>  +	if (plane =3D=3D &priv->f0)
>>>>>>>  +		return -EINVAL;
>>>>>>  This will break JZ4725B -> JZ4770 SoCs, the f0 plane is=20
>>>>>> perfectly usable there.
>>>>>  Hm. I think it was your request/proposal to add this [1]?
>>>>  Because otherwise with your current patchset the f0 plane does=20
>>>> not work *on JZ4780*.
>>>  Not that I am eager to fix that, but...
>>>  maybe it could be better to fix than having the check and -EINVAL=20
>>> depend on SoC compatible string
>>>  (or some new flag in soc_info. plane_f0_not_working)?
>>=20
>>  Totally agree! A proper fix would be much better. A=20
>> "plane_f0_not_working" in the meantime is OK with me.
>=20
> Ok, then I'll prepare a v13 with plane_f0_not_working.
>=20
>>=20
>>  Note that there are other things not working with your current=20
>> implementation, for instance you cannot set the X/Y start position=20
>> of the f1 plane, which means it's only really usable for fullscreen=20
>> desktop/windows.
>=20
> Is setting x/y possible for the other SoC?

Yes. They support different x/y positions, sizes, and pixel format for=20
both f0, f1 and IPU planes.

-Paul

>>=20
>>>>  It does work on older SoCs.
>>>>>  What I have forgotten is why the f0 plane should not be usable=20
>>>>> for jz4780.
>>>>  We return an error here to prevent userspace from using the f0=20
>>>> plane until it's effectively working on the JZ4780.
>>>  Well, what would be not working with that plane if user-space=20
>>> would try to use it?
>>=20
>>  From what I remember, it wouldn't show anything on screen, and=20
>> after that trying to use the f1 plane wouldn't work either.
>=20
> Ok. That may become a big project to fix. So let's do step 1 first.
>=20
> BR and thanks,
> NIkolaus
>=20


