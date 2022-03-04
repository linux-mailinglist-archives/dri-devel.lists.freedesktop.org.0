Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B74CDBB9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 19:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C1311284A;
	Fri,  4 Mar 2022 18:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FD11127FF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 18:04:34 +0000 (UTC)
Date: Fri, 04 Mar 2022 18:04:20 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [Letux-kernel] [PATCH v16 1/4] drm/bridge: dw-hdmi: introduce
 dw_hdmi_enable_poll()
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <8JF88R.9V5YQ3Q6E8QO2@crapouillou.net>
In-Reply-To: <929BF693-D54F-40F0-BB61-520301D1C31F@goldelico.com>
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



Le ven., mars 4 2022 at 18:51:14 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul, Neil,
>=20
>>  Am 04.03.2022 um 17:47 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  From what I understood in Nikolaus' last message, HDMI hotplug is=20
>> actually correctly detected, so there's no need for polling. What is=20
>> missing is the call to drm_kms_helper_hotplug_event *somewhere*, so=20
>> that the information is correctly relayed to userspace.
>=20
> Exactly.
>=20
> As Maxime pointed out it should already be called by=20
> drm_helper_hpd_irq_event() in dw_hdmi_irq() but isn't
> because mode_config.poll_enabled isn't enabled.
>=20
> So we can either
> a) enable mode_config.poll_enabled so that it is called by=20
> drm_helper_hpd_irq_event() or
>=20
> b) make drm_kms_helper_hotplug_event() being called explicitly in=20
> dw_hdmi_irq().
>    We could guard that by mode_config.poll_enabled to avoid=20
> drm_kms_helper_hotplug_event()
>    being called twice (but I think the "changed" mechanism will take=20
> care of).
>=20
>>  I think this issue can be fixed by calling=20
>> drm_bridge_connector_enable_hpd() on the connector in=20
>> ingenic-drm-drv.c.
>=20
> I don't see yet how this would solve it, but it may work.

dw_hdmi_irq() calls drm_bridge_hpd_notify(), which would call=20
bridge->hpd_cb() if it was non-NULL.

Calling drm_bridge_connector_enable_hpd() will set the bridge->hpd_cb()=20
callback to point to drm_bridge_connector_hpd_cb(), which itself will=20
call drm_kms_helper_hotplug_event(). Therefore, all that is missing is=20
one call to drm_bridge_connector_enable_hpd().

Cheers,
-Paul

>=20
> Anyways, this all is a missing feature (sometimes called "bug") of=20
> the *dw-hdmi driver* and IMHO
> neither of the connector nor the ingenic-drm-drv.
>=20
> So I think it should not be solved outside dw-hdmi.
>=20
> BR and thanks,
> Nikolaus
>=20


