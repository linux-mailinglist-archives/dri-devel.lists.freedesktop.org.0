Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFB416603
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 21:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77116E108;
	Thu, 23 Sep 2021 19:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0136E108
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 19:39:30 +0000 (UTC)
Date: Thu, 23 Sep 2021 20:39:18 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-mips
 <linux-mips@vger.kernel.org>, list@opendingux.net, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Paul Boddie <paul@boddie.org.uk>
Message-Id: <IXJWZQ.BZQ2M7FHYVJM@crapouillou.net>
In-Reply-To: <ABE75744-46FE-4F37-A14C-D996F36B7B0E@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
 <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
 <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
 <3764505C-7CA9-40C4-8CFA-8B0F2361E6D5@goldelico.com>
 <YUxQ9k/CDYz20rYo@pendragon.ideasonboard.com>
 <B7C9EEE8-F999-4105-B805-1B32619A3847@goldelico.com>
 <7U2WZQ.D8DTPCJ0ZPKO3@crapouillou.net>
 <ABE75744-46FE-4F37-A14C-D996F36B7B0E@goldelico.com>
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



Le jeu., sept. 23 2021 at 20:52:23 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Paul,
>=20
>>  Am 23.09.2021 um 15:30 schrieb Paul Cercueil <paul@crapouillou.net>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  Le jeu., sept. 23 2021 at 13:41:28 +0200, H. Nikolaus Schaller=20
>> <hns@goldelico.com> a =E9crit :
>>>  Hi Laurent,
>>>  Ah, ok.
>>>  But then we still have issues.
>>>  Firstly I would assume that get_edid only works properly if it is=20
>>> initialized
>>>  through dw_hdmi_connector_create().
>>>  Next, in the current code, passing DRM_BRIDGE_ATTACH_NO_CONNECTOR=20
>>> to
>>>  dw_hdmi_bridge_attach() indeed does not call=20
>>> dw_hdmi_connector_create()
>>>  but returns 0.
>>>  This patch 6/6 makes drm/ingenic unconditionally require a=20
>>> connector
>>>  to be attached which is defined somewhere else (device tree e.g.=20
>>> "connector-hdmi")
>>>  unrelated to dw-hdmi. Current upstream code for drm/ingenic does=20
>>> not init/attach
>>>  such a connector on its own so it did work before.
>>>  I.e. I think we can't just use parts of dw-hdmi.
>>=20
>>  The fact that Laurent is using dw-hdmi with=20
>> DRM_BRIDGE_ATTACH_NO_CONNECTOR on Renesas makes me think that it's=20
>> possible here as well. There's no reason why it shouldn't work with=20
>> ingenic-drm.
>=20
> That is interesting and Laurent can probably comment on differences=20
> between
> his setup (I wasn't able to deduce what device you are referring to)=20
> and dw-hdmi.
>=20
> For jz4780 we tried that first. I do not remember the exact reasons=20
> but we wasted
> weeks trying to but failed to get it working. While the dw-hdmi=20
> connector simply works
> on top of upstream and fails only if we apply your patch.
>=20
> Another issue is how you want to tell connector-hdmi to use the extra=20
> i2c bus driver
> for ddc which is not available directly as a standard i2c controller=20
> of the jz4780.
>=20
> hdmi-connector.yaml defines:
>=20
>   ddc-i2c-bus:
> 	description: phandle link to the I2C controller used for DDC EDID=20
> probing
> 	$ref: /schemas/types.yaml#/definitions/phandle
>=20
> So we would need some ddc-i2c-bus =3D <&i2c-controller-inside-the=20
> dw-hdmi>.
>=20
> But that i2c-controller-inside-the dw-hdmi does not exist in device=20
> tree
> and can not be added unless someone significantly rewrites dw-hdmi to
> register and expose it as i2c controller.

No, you don't need to do that at all. Just don't set the "ddc-i2c-bus"=20
property.

>>=20
>>  The ingenic-drm driver does not need to create any connector. The=20
>> "connector-hdmi" is connected to dw-hdmi as the "next bridge" in the=20
>> list.
>=20
> Sure. It does not *create* a connector. It expects that it can safely=20
> call
> drm_bridge_connector_init() to get a pointer to a newly created=20
> connector.
>=20
> But if we use the dw-hdmi connector, there is no such connector and=20
> "next bridge".

We don't want to use the dw-hdmi connector. Your "next bridge" is the=20
"hdmi-connector" that should be wired in DTS.

> Or can you tell me how to make the dw-hdmi connector created by
> dw_hdmi_connector_create() become the "next bridge" in the list for=20
> your driver?
> But without significantly rewriting dw-hdmi.c (and testing).

Wire it to the LCD node in DTS...

See how we do it for the IT66121 driver:
https://github.com/OpenDingux/linux/blob/jz-5.15/arch/mips/boot/dts/ingenic=
/rg350m.dts#L114-L134

>>=20
>>>  If drm_bridge_attach() would return some errno if=20
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>  is set, initialization in ingenic_drm_bind() would fail likewise=20
>>> with "Unable to attach bridge".
>>>  So in any case dw-hdmi is broken by this drm/ingenic patch unless=20
>>> someone
>>>  reworks it to make it compatible.
>>=20
>>  Where would the errno be returned? Why would drm_bridge_attach()=20
>> return an error code?
>=20
> Currently dw_hdmi_bridge_attach() returns 0 if it is asked to support
> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>=20
> This is not treated as an error by drm_bridge_attach().
>=20
> Here it could return an error (-ENOTSUPP?) instead, to allow for=20
> error handling
> by its caller.

And why would you do that? If you don't want to attach a connector,=20
then drm_bridge_attach() doesn't need to do much. So it's normal that=20
it returns zero.

> But that raises an error message like "failed to attach bridge to=20
> encoder" and
> the bridge is reset and detached.
>=20
>>=20
>>>  Another issue is that dw_hdmi_connector_create() does not only do=20
>>> dcd/edid
>>>  but appears to detects hot plug and does some special=20
>>> initialization.
>>>  So we probably loose hotplug detect if we just use=20
>>> drm_bridge_funcs.get_edid().
>>=20
>>  There's drm_bridge_funcs.detect().
>=20
> You mean in dw-hdmi? Yes, it calls dw_hdmi_bridge_detect() which=20
> calls dw_hdmi_detect().
> This does some read_hpd.
>=20
> Anyways, this does not solve the problem that with your drm/ingenic=20
> proposal the
> dw-hdmi subsystem (hdmi + ddc) can no longer be initialized properly=20
> unless someone
> fixes either.
>=20
> So IMHO this should be treated as a significant blocking point for=20
> your patch
> because it breaks something that is working upstream and there seems=20
> to be no
> rationale to change it.
>=20
> Your commit message just says:
> "All the bridges are now attached with=20
> DRM_BRIDGE_ATTACH_NO_CONNECTOR."
> but gives no reason why.
>=20
> I fully understand that you want to change it and Laurent said that=20
> it will become
> standard in the far future. Therefore I suggest to find a way that=20
> you can find out
> if a connector has already been created by drm_bridge_attach() to=20
> stay compatible
> with current upstream code.

No, absolutely not. There is nothing upstream yet that can bind the=20
ingenic-drm driver with the dw-hdmi driver. This is your downstream=20
patch. I'm not breaking anything that's upstream, so there is no=20
blocking point.

Besides, even with your downstream patch I don't see any reason why the=20
dw-hdmi driver wouldn't work with this patch, provided it's wired=20
properly, and you never did show a proof of failure either. You come up=20
with "possible points where it will fail" but these are based on your=20
assumptions on how the drivers should be working together, and I think=20
you somehow miss the whole picture.

Start by wiring things properly, like in my previously linked DTS, and=20
*test*. If it fails, tell us where it fails. Because your "it doesn't=20
work" arguments have zero weight otherwise.

If I can find some time this weekend I will test it myself.

Cheers,
-Paul

> I even want to help here but I don't know how to detect the inverse of
> drm_connector_attach_encoder(), i.e.=20
> is_drm_encoder_attached_to_any_connector().
>=20
> BR and thanks,
> Nikolaus
>=20
>=20
>=20


