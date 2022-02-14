Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAA94B4E5C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 12:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED3210E184;
	Mon, 14 Feb 2022 11:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA8710E184
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 11:31:17 +0000 (UTC)
Date: Mon, 14 Feb 2022 11:30:54 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v15 2/7] drm/ingenic: Add dw-hdmi driver specialization
 for jz4780
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <IBLA7R.1NQX4KVACXPK3@crapouillou.net>
In-Reply-To: <AD978522-8321-476D-955C-3CDD747EFCAC@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
 <e6e1f3f44e6979a998ec9c372e329b6facaded15.1644681054.git.hns@goldelico.com>
 <58IA7R.PZ9FQXN7FVAK@crapouillou.net>
 <AD978522-8321-476D-955C-3CDD747EFCAC@goldelico.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-mips <linux-mips@vger.kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le lun., f=E9vr. 14 2022 at 12:02:53 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 14.02.2022 um 11:24 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi,
>>=20
>>  Le sam., f=E9vr. 12 2022 at 16:50:50 +0100, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>=20
>>>  +static void ingenic_dw_hdmi_cleanup(void *data)
>>>  +{
>>>  +	struct dw_hdmi *hdmi =3D (struct dw_hdmi *)data;
>>>  +
>>>  +	dw_hdmi_remove(hdmi);
>>>  +}
>>>  +
>>>  +static int ingenic_dw_hdmi_probe(struct platform_device *pdev)
>>>  +{
>>>  +	struct dw_hdmi *hdmi;
>>>  +
>>>  +	hdmi =3D dw_hdmi_probe(pdev, &ingenic_dw_hdmi_plat_data);
>>>  +	if (IS_ERR(hdmi))
>>>  +		return PTR_ERR(hdmi);
>>>  +
>>>  +	return devm_add_action_or_reset(&pdev->dev,=20
>>> ingenic_dw_hdmi_cleanup, hdmi);
>>=20
>>  I think I said it already, but in this driver you could use a=20
>> .remove callback, there's not much point in using devm cleanups in=20
>> such a simple setup.
>=20
> Well it was your suggestion after v8:
>=20
> https://lore.kernel.org/all/DIA33R.QE29K7RKLI2C1@crapouillou.net/

It made sense for your v8, not so much for your v15...

> So we now almost go back to RFC v1 almost 2 years ago:
>=20
> https://patchwork.kernel.org/project/linux-mips/patch/2c131e1fb19e19f958a=
612f7186bc83f4afb0b0a.1582744379.git.hns@goldelico.com/
>=20
> Of course there was a good reason to better handle the regulator
> AND the dw_hdmi_remove() by a single mechanism.
>=20
> Now the regulator has gone and been replaced by the hdmi connector
> and we can go back.
>=20
>>=20
>>  In your probe you could just:
>>  return PTR_ERR_OR_ZERO(hdmi);
>=20
> No, this does not work since we need to platform_set_drvdata().
> to be able to access the private struct in the remove callback.
> And checking errors after platform_set_drvdata() can be done but
> looks strange to me.

Yeah, I guess it would look strange. Fine then.

Then I guess just merge your current [6/7] with this one (and make sure=20
it comes after your current [5/7]) and it looks mergeable to me.

Cheers,
-Paul

> It is up to you what you prefer.
>=20
>>=20
>>>  +}
>>>  +
>>>  +static struct platform_driver ingenic_dw_hdmi_driver =3D {
>>>  +	.probe  =3D ingenic_dw_hdmi_probe,
>>>  +	.driver =3D {
>>>  +		.name =3D "dw-hdmi-ingenic",
>>>  +		.of_match_table =3D ingenic_dw_hdmi_dt_ids,
>>>  +	},
>>>  +};
>>>  +module_platform_driver(ingenic_dw_hdmi_driver);
>>>  +
>>>  +MODULE_DESCRIPTION("JZ4780 Specific DW-HDMI Driver Extension");
>>>  +MODULE_LICENSE("GPL v2");
>>>  +MODULE_ALIAS("platform:dwhdmi-ingenic");
>>=20
>>  Should probably be "platform:dw-hdmi-ingenic"?
>=20
> Yes, indeed. Thanks for spotting!
>=20
> Was also good in v1. Probably someone deleted the hyphen unnoticed=20
> during editing of "jz4780" to "ingenic"...




