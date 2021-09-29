Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F241C6B0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BF96EA93;
	Wed, 29 Sep 2021 14:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C1F6E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:30:52 +0000 (UTC)
Date: Wed, 29 Sep 2021 15:30:31 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 02/10] drm/ingenic: Add support for JZ4780 and HDMI
 output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Message-Id: <VM970R.TLCBMNA67DOI2@crapouillou.net>
In-Reply-To: <17BF1D7A-2057-448B-9FD2-907DE0EFD281@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
 <OA150R.JLKJBJP8V7FJ2@crapouillou.net>
 <1E10A04A-4A78-4B47-B0FB-1E8C99456DA1@goldelico.com>
 <17BF1D7A-2057-448B-9FD2-907DE0EFD281@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mar., sept. 28 2021 at 14:06:03 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 28.09.2021 um 12:21 schrieb H. Nikolaus Schaller=20
>> <hns@goldelico.com>:
>>=20
>>>>  @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>>>>  {
>>>>  	int err;
>>>>  +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
>>>>  +		err =3D platform_driver_register(ingenic_dw_hdmi_driver_ptr);
>>>>  +		if (err)
>>>>  +			return err;
>>>>  +	}
>>>=20
>>>  I don't see why you need to register the ingenic-dw-hdmi driver=20
>>> here. Just register it in the ingenic-dw-hdmi driver.
>>=20
>>  Ok, I never though about this (as the code was not from me). We=20
>> apparently just followed the IPU code pattern (learning by example).
>>=20
>>  It indeed looks not necessary and would also avoid the=20
>> ingenic_dw_hdmi_driver_ptr dependency.
>>=20
>>  But: what is ingenic_ipu_driver_ptr then good for?
>>=20

It's done this way because ingenic-drm-drv.c and ingenic-ipu.c are both=20
compiled within the same module ingenic-drm.

I'm not sure this is still required, maybe ingenic-ipu.c can be its own=20
module now.

>>=20
>>  If we can get rid of this as well, we can drop patch 1/10=20
>> ("drm/ingenic: Fix drm_init error path if IPU was registered")=20
>> completely.
>=20
> A quick test shows that it *is* required. At least if I configure=20
> everything as modules.
> But like you I can't explain why.

Well, a quick test here shows that it is not required, at least when=20
configuring with everything built-in.

-Paul

> Well, just a very rough idea (may be wrong): the bridge chain is not=20
> like an i2c bus and
> clients are not automatically loaded/probed if linked in the device=20
> tree. Therefore the
> consumer (ingenic_drm_drv) must register the "clients" like IPU and=20
> HDMI.
>=20
> BR,
> Nikolaus
>=20


