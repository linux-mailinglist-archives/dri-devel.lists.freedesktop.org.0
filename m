Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722AC4CD968
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 17:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C4B1128D4;
	Fri,  4 Mar 2022 16:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E841128D4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 16:47:31 +0000 (UTC)
Date: Fri, 04 Mar 2022 16:47:19 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
To: Neil Armstrong <narmstrong@baylibre.com>
Message-Id: <VYB88R.ATGIVGZ13PFM1@crapouillou.net>
In-Reply-To: <a52702bd-c929-8170-8896-d34ba82aba3c@baylibre.com>
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
 David Airlie <airlied@linux.ie>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mips <linux-mips@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Le ven., mars 4 2022 at 14:30:46 +0100, Neil Armstrong=20
<narmstrong@baylibre.com> a =E9crit :
> Hi,
>=20
> On 03/03/2022 18:59, H. Nikolaus Schaller wrote:
>> Hi Paul, Neil,
>>=20
>>> Am 03.03.2022 um 18:20 schrieb Paul Cercueil <paul@crapouillou.net>:
>>>=20
>>> Hi Nikolaus,
>>>=20
>>> [snip]
>>>=20
>>>>> Well he said "the Ingenic DRM core" aka ingenic-drm-drv.c. You do=20
>>>>> have access to the main drm_device in the ingenic_drm_bind()=20
>>>>> function, so you can add it there (with a cleanup function=20
>>>>> calling drm_kms_helper_poll_fini() registered with=20
>>>>> drmm_add_action_or_reset()).
>>>> Well, do you really want to mix HPD detection between connector,=20
>>>> Synopsys bridge and Ingenic DRM core? These are independent...
>>>> Or should be accessed only through the bridge chain pointers.
>>>> IMHO we should keep separate functions separate.
>>>=20
>>> The drm_kms_helper_poll_init() just says "this DRM device may have=20
>>> connectors that need to be polled" so it very well fits inside the=20
>>> main driver, IMHO.
>>=20
>> As far as I understand, it has the side-effect to always set=20
>> dev->mode_config.poll_enabled and
>> schedule_delayed_work() for all devices.
>> I am not sure if this is intended for arbitrary ingenic-drm devices.=20
>> But you know better than me.
>>=20
>>=20
>> Hm. But wait, I think I now finally remember why I have proposed it=20
>> the way it is!
>> It is always better to go back to requirements and find the least=20
>> invasive solution.
>>=20
>> - HPD IRQ works and calls dw_hdmi_irq() [as can be shown by adding=20
>> printk()]
>> - it is just that the udevd is only notified if poll_enabled =3D true=20
>> (but no polling takes place!).
>>=20
>> An earlier version (v4) to fix this proposed to add an explicit call=20
>> to drm_kms_helper_hotplug_event()
>> in dw_hdmi_irq() but that was rejected a while ago because=20
>> drm_helper_hpd_irq_event() will already call it:
>>=20
>> 	https://www.spinics.net/lists/dri-devel/msg316846.html
>>=20
>> Since this did not take into account that=20
>> dev->mode_config.poll_enabled must be set true, I then proposed the
>> enable_poll() mechanism just to set this bit for the ingenic-dw-hdmi=20
>> specialization.
>>=20
>> So a HPD event is delivered to the dw-hdmi driver as dw_hdmi_irq()=20
>> and that calls drm_helper_hpd_irq_event()
>> but not drm_kms_helper_hotplug_event() and user-space is not getting=20
>> aware.
>>=20
>> It is all a hack because we mix the dw-hdmi driver which originally=20
>> did register its own connector
>> with an explicit connector...
>>=20
>> In summary I now thing that the v4 patch is the simplest and least=20
>> invasive solution.
>>=20
>> We neither have to introduce a dw_hdmi_enable_poll() function or=20
>> call drm_kms_helper_poll_init() anywhere.
>>=20
>> It is just a single line to add to dw-hdmi. And neither touches=20
>> ingenic-dw-hdmi nor ingenic-drm-drv.
>>=20
>> So let's go back to v4 version (just modify commit message to better=20
>> describe why we have to call
>> drm_kms_helper_hotplug_event() explicitly) and forget about=20
>> alternatives.
>=20
> Please don't and add drm_kms_helper_poll_init() from the=20
> ingenic-drm-drv.c like every other DRM driver.
>=20
> Adding drm_kms_helper_hotplug_event() in dw-hdmi will impact other=20
> drivers using dw-hdmi but correctly
> calling drm_kms_helper_poll_init().

 From what I understood in Nikolaus' last message, HDMI hotplug is=20
actually correctly detected, so there's no need for polling. What is=20
missing is the call to drm_kms_helper_hotplug_event *somewhere*, so=20
that the information is correctly relayed to userspace.

I think this issue can be fixed by calling=20
drm_bridge_connector_enable_hpd() on the connector in ingenic-drm-drv.c.

Cheers,
-Paul


