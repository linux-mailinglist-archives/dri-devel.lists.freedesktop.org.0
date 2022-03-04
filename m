Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481DE4CDC9C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 19:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F72410FE86;
	Fri,  4 Mar 2022 18:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E19B1121AA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 18:34:12 +0000 (UTC)
Date: Fri, 04 Mar 2022 18:33:59 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <NWG88R.ZTPBZB4D9J5Z@crapouillou.net>
In-Reply-To: <5CC8B441-AA50-45F5-A5D3-2F40F72A1B50@goldelico.com>
References: <cover.1645895582.git.hns@goldelico.com>
 <e54838849f80454b863f9f5634dd10f79ef7bb8f.1645895582.git.hns@goldelico.com>
 <983e9064-17ad-e646-f37d-ca9173ba0967@baylibre.com>
 <C8AE9A7A-E288-4637-ACAD-40CD33CD5F8C@goldelico.com>
 <3E620AF4-402E-45EA-9D92-92EAEA9647F5@goldelico.com>
 <SHH68R.Z3J9KSY0GQVA2@crapouillou.net>
 <ABC1BD09-383B-4499-B034-340CE88725B3@goldelico.com>
 <RUI68R.Z009SPJAAD8N1@crapouillou.net>
 <F0F8F36B-3A0A-476C-8C7D-566255C629C6@goldelico.com>
 <a52702bd-c929-8170-8896-d34ba82aba3c@baylibre.com>
 <VYB88R.ATGIVGZ13PFM1@crapouillou.net>
 <929BF693-D54F-40F0-BB61-520301D1C31F@goldelico.com>
 <8JF88R.9V5YQ3Q6E8QO2@crapouillou.net>
 <5CC8B441-AA50-45F5-A5D3-2F40F72A1B50@goldelico.com>
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
Cc: Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-mips <linux-mips@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le ven., mars 4 2022 at 19:15:13 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 04.03.2022 um 19:04 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>=20
>>=20
>>  Le ven., mars 4 2022 at 18:51:14 +0100, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  Hi Paul, Neil,
>>>>  Am 04.03.2022 um 17:47 schrieb Paul Cercueil=20
>>>> <paul@crapouillou.net>:
>>>>  From what I understood in Nikolaus' last message, HDMI hotplug is=20
>>>> actually correctly detected, so there's no need for polling. What=20
>>>> is missing is the call to drm_kms_helper_hotplug_event=20
>>>> *somewhere*, so that the information is correctly relayed to=20
>>>> userspace.
>>>  Exactly.
>>>  As Maxime pointed out it should already be called by=20
>>> drm_helper_hpd_irq_event() in dw_hdmi_irq() but isn't
>>>  because mode_config.poll_enabled isn't enabled.
>>>  So we can either
>>>  a) enable mode_config.poll_enabled so that it is called by=20
>>> drm_helper_hpd_irq_event() or
>>>  b) make drm_kms_helper_hotplug_event() being called explicitly in=20
>>> dw_hdmi_irq().
>>>    We could guard that by mode_config.poll_enabled to avoid=20
>>> drm_kms_helper_hotplug_event()
>>>    being called twice (but I think the "changed" mechanism will=20
>>> take care of).
>>>>  I think this issue can be fixed by calling=20
>>>> drm_bridge_connector_enable_hpd() on the connector in=20
>>>> ingenic-drm-drv.c.
>>>  I don't see yet how this would solve it, but it may work.
>>=20
>>  dw_hdmi_irq() calls drm_bridge_hpd_notify(), which would call=20
>> bridge->hpd_cb() if it was non-NULL.
>=20
> Ok, this is a case c).
>=20
> I vaguely remember having tried to analyse what bridge->hpd_cb is but=20
> stopped since it is NULL...
>=20
>>=20
>>  Calling drm_bridge_connector_enable_hpd() will set the=20
>> bridge->hpd_cb() callback to point to drm_bridge_connector_hpd_cb(),=20
>> which itself will call drm_kms_helper_hotplug_event(). Therefore,=20
>> all that is missing is one call to drm_bridge_connector_enable_hpd().
>=20
> Ah, ok, I see.
>=20
>>>  Anyways, this all is a missing feature (sometimes called "bug") of=20
>>> the *dw-hdmi driver* and IMHO
>>>  neither of the connector nor the ingenic-drm-drv.
>=20
> Well, a little more analysis shows that=20
> drm_bridge_connector_enable_hpd is called
> in the *-drv.c for some other plaforms:
>=20
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/imx/dcss/d=
css-dev.c#L292
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/imx/dcss/d=
css-kms.c#L145
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm/om=
ap_drv.c#L393
> https://elixir.bootlin.com/linux/v5.17-rc6/source/drivers/gpu/drm/msm/hdm=
i/hdmi.c#L317
>=20
>>>  So I think it should not be solved outside dw-hdmi.
>=20
> Hm. Can we call drm_bridge_connector_enable_hpd() from inside dw-hdmi?
>=20
> Or would this be the solution if merged? (I currently can't try code).
>=20
> https://lore.kernel.org/lkml/a7d0b013-6114-07b3-0a7b-0d17db8a3982@cogente=
mbedded.com/T/

Looks correct to me. It has been reviewed by two people so I believe it=20
will be merged very soon.

Cheers,
-Paul


