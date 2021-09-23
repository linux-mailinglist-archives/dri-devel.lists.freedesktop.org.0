Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF33415FD0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 15:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA3B6ED18;
	Thu, 23 Sep 2021 13:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7420B6ED18
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 13:30:18 +0000 (UTC)
Date: Thu, 23 Sep 2021 14:30:07 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, linux-mips
 <linux-mips@vger.kernel.org>, list@opendingux.net, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Paul Boddie <paul@boddie.org.uk>
Message-Id: <7U2WZQ.D8DTPCJ0ZPKO3@crapouillou.net>
In-Reply-To: <B7C9EEE8-F999-4105-B805-1B32619A3847@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
 <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
 <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
 <3764505C-7CA9-40C4-8CFA-8B0F2361E6D5@goldelico.com>
 <YUxQ9k/CDYz20rYo@pendragon.ideasonboard.com>
 <B7C9EEE8-F999-4105-B805-1B32619A3847@goldelico.com>
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

Hi Nikolaus,

Le jeu., sept. 23 2021 at 13:41:28 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> Hi Laurent,
>=20
>>  Am 23.09.2021 um 12:03 schrieb Laurent Pinchart=20
>> <laurent.pinchart@ideasonboard.com>:
>>=20
>>  Hi Nikolaus,
>>=20
>>  On Thu, Sep 23, 2021 at 11:55:56AM +0200, H. Nikolaus Schaller=20
>> wrote:
>>>>  Am 23.09.2021 um 11:27 schrieb Laurent Pinchart:
>>>>  On Thu, Sep 23, 2021 at 11:19:23AM +0200, H. Nikolaus Schaller=20
>>>> wrote:
>>>>>=20
>>>>>>>>  +		ret =3D drm_bridge_attach(encoder, &ib->bridge, NULL,
>>>>>>>>  +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>>>>>=20
>>>>>>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR makes it fundamentally=20
>>>>>>> incompatible
>>>>>>>  with synopsys/dw_hdmi.c
>>>>>>>  That driver checks for DRM_BRIDGE_ATTACH_NO_CONNECTOR being=20
>>>>>>> NOT present,
>>>>>>>  since it wants to register its own connector through=20
>>>>>>> dw_hdmi_connector_create().
>>>>>>>  It does it for a reason: the dw-hdmi is a multi-function=20
>>>>>>> driver which does
>>>>>>>  HDMI and DDC/EDID stuff in a single driver (because I/O=20
>>>>>>> registers and power
>>>>>>>  management seem to be shared).
>>>>>>=20
>>>>>>  The IT66121 driver does all of that too, and does not need
>>>>>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR. The drm_bridge_funcs struct has
>>>>>>  callbacks to handle cable detection and DDC stuff.
>>>>>>=20
>>>>>>>  Since I do not see who could split this into a separate bridge=20
>>>>>>> and a connector driver
>>>>>>>  and test it on multiple SoC platforms (there are at least 3 or=20
>>>>>>> 4), I think modifying
>>>>>>>  the fundamentals of the dw-hdmi architecture just to get CI20=20
>>>>>>> HDMI working is not
>>>>>>>  our turf.
>>>>>>=20
>>>>>>  You could have a field in the dw-hdmi pdata structure, that=20
>>>>>> would
>>>>>>  instruct the driver whether or not it should use the new API.=20
>>>>>> Ugly,
>>>>>>  I know, and would probably duplicate a lot of code, but that=20
>>>>>> would
>>>>>>  allow other drivers to be updated at a later date.
>>>>>=20
>>>>>  Yes, would be very ugly.
>>>>>=20
>>>>>  But generally who has the knowledge (and time) to do this work?
>>>>>  And has a working platform to test (jz4780 isn't a good=20
>>>>> development environment)?
>>>>>=20
>>>>>  The driver seems to have a turbulent history starting 2013 in=20
>>>>> staging/imx and
>>>>>  apparently it was generalized since then... Is Laurent currently=20
>>>>> dw-hdmi maintainer?
>>>>=20
>>>>  "Maintainer" would be an overstatement. I've worked on that=20
>>>> driver in
>>>>  the past, and I still use it, but don't have time to really=20
>>>> maintain it.
>>>>  I've also been told that Synopsys required all patches for that=20
>>>> driver
>>>>  developed using documentation under NDA to be submitted=20
>>>> internally to
>>>>  them first before being published, so I decided to stop=20
>>>> contributing
>>>>  instead of agreeing with this insane process. There's public
>>>>  documentation about the IP in some NXP reference manuals though,=20
>>>> so it
>>>>  should be possible to still move forward without abiding by this=20
>>>> rule.
>>>>=20
>>>>>>>  Therefore the code here should be able to detect if=20
>>>>>>> drm_bridge_attach() already
>>>>>>>  creates and attaches a connector and then skip the code below.
>>>>>>=20
>>>>>>  Not that easy, unfortunately. On one side we have dw-hdmi which
>>>>>>  checks that DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set, and on=20
>>>>>> the
>>>>>>  other side we have other drivers like the IT66121 which will=20
>>>>>> fail if
>>>>>>  this flag is not set.
>>>>>=20
>>>>>  Ok, I see. You have to handle contradicting cases here.
>>>>>=20
>>>>>  Would it be possible to run it with=20
>>>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR first
>>>>>  and retry if it fails without?
>>>>>=20
>>>>>  But IMHO the return value (in error case) is not well defined.=20
>>>>> So there
>>>>>  must be a test if a connector has been created (I do not know=20
>>>>> how this
>>>>>  would work).
>>>>>=20
>>>>>  Another suggestion: can you check if there is a downstream=20
>>>>> connector defined in
>>>>>  device tree (dw-hdmi does not need such a definition)?
>>>>>  If not we call it with 0 and if there is one we call it with
>>>>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR and create one?
>>>>=20
>>>>  I haven't followed the ful conversation, what the reason why
>>>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR can't always be use here ?
>>>=20
>>>  The synopsys driver creates its own connector through=20
>>> dw_hdmi_connector_create()
>>>  because the IP handles DDC/EDID directly.
>>=20
>>  That doesn't require creating a connector though. The driver=20
>> implements
>>  drm_bridge_funcs.get_edid(), which is used to get the EDID without=20
>> the
>>  need to create a connector in the dw-hdmi driver.
>=20
> Ah, ok.
>=20
> But then we still have issues.
>=20
> Firstly I would assume that get_edid only works properly if it is=20
> initialized
> through dw_hdmi_connector_create().
>=20
> Next, in the current code, passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to
> dw_hdmi_bridge_attach() indeed does not call=20
> dw_hdmi_connector_create()
> but returns 0.
>=20
> This patch 6/6 makes drm/ingenic unconditionally require a connector
> to be attached which is defined somewhere else (device tree e.g.=20
> "connector-hdmi")
> unrelated to dw-hdmi. Current upstream code for drm/ingenic does not=20
> init/attach
> such a connector on its own so it did work before.
>=20
> I.e. I think we can't just use parts of dw-hdmi.

The fact that Laurent is using dw-hdmi with=20
DRM_BRIDGE_ATTACH_NO_CONNECTOR on Renesas makes me think that it's=20
possible here as well. There's no reason why it shouldn't work with=20
ingenic-drm.

The ingenic-drm driver does not need to create any connector. The=20
"connector-hdmi" is connected to dw-hdmi as the "next bridge" in the=20
list.

> If drm_bridge_attach() would return some errno if=20
> DRM_BRIDGE_ATTACH_NO_CONNECTOR
> is set, initialization in ingenic_drm_bind() would fail likewise with=20
> "Unable to attach bridge".
>=20
> So in any case dw-hdmi is broken by this drm/ingenic patch unless=20
> someone
> reworks it to make it compatible.

Where would the errno be returned? Why would drm_bridge_attach() return=20
an error code?

> Another issue is that dw_hdmi_connector_create() does not only do=20
> dcd/edid
> but appears to detects hot plug and does some special initialization.
> So we probably loose hotplug detect if we just use=20
> drm_bridge_funcs.get_edid().

There's drm_bridge_funcs.detect().

Cheers,
-Paul

> I come to the conclusion that not creating a specific connector in=20
> dw-hdmi
> and relying on a generic connector does not seem to be an option with=20
> current
> code proposals.
>=20
> In such a situation the question is what the least invasive surgery=20
> is to
> avoid complications and lenghty regression tests on unknown platforms.
> IMHO it is leaving (mature) dw-hdmi untouched and make attachment of=20
> a connector
> in ingenic_drm_bind() depend on some condition.
>=20
> BR and thanks,
> Nikolaus
>=20
>=20


