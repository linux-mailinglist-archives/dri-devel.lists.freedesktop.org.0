Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B7416DBD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 10:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8866E195;
	Fri, 24 Sep 2021 08:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ADD6E195
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 08:29:13 +0000 (UTC)
Date: Fri, 24 Sep 2021 09:29:02 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
To: Paul Boddie <paul@boddie.org.uk>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-mips <linux-mips@vger.kernel.org>,
 list@opendingux.net, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Message-Id: <EKJXZQ.6VJ0UDHV3T3W@crapouillou.net>
In-Reply-To: <4366739.KZ8Jxz7LyS@jason>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <IXJWZQ.BZQ2M7FHYVJM@crapouillou.net>
 <B7B431EC-BC73-4B39-A03C-003347D8C239@goldelico.com>
 <4366739.KZ8Jxz7LyS@jason>
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

Hi Paul,

Le ven., sept. 24 2021 at 00:51:39 +0200, Paul Boddie=20
<paul@boddie.org.uk> a =E9crit :
> On Thursday, 23 September 2021 22:23:28 CEST H. Nikolaus Schaller=20
> wrote:
>>=20
>>  > Am 23.09.2021 um 21:39 schrieb Paul Cercueil=20
>> <paul@crapouillou.net>:
>>  >
>>  > Start by wiring things properly, like in my previously linked=20
>> DTS, and
>>  > *test*. If it fails, tell us where it fails.
>>=20
>>  Well, I tell where drm_bridge_attach fails with
>>  DRM_BRIDGE_ATTACH_NO_CONNECTOR...
>=20
> I tried to piece together this entire discussion from the mailing list
> archives, but there appear to be two approaches that "work", in that=20
> they
> activate the LCD controller with the HDMI peripheral:
>=20
> 1. Nikolaus's approach, which involves getting the Synopsys driver to=20
> create a
> connector and then avoiding the call to drm_bridge_connector_init in=20
> the
> Ingenic DRM driver.
>=20
> 2. My approach, which just involves changing the Synopsys driver to=20
> set the
> bridge type in dw_hdmi_probe like this:
>=20
>   hdmi->bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
>=20
> Otherwise, I don't see how the bridge's (struct drm_bridge) type will=20
> be set.

The bridge's type is set in hdmi-connector, from DTS. The 'type =3D "a"'=20
will result in the bridge's .type to be set to DRM_MODE_CONNECTOR_HDMIA.

> And this causes drm_bridge_connector_init to fail because it tests=20
> the bridge
> type.
>=20
> Now, I just reintroduced the HDMI connector to the device tree as=20
> follows:
>=20
>         hdmi_connector {
>                 compatible =3D "hdmi-connector";
>                 label =3D "hdmi";
>=20
>                 type =3D "a";
>=20
>                 port {
>                         hdmi_connector_in: endpoint {
>                                 remote-endpoint =3D <&dw_hdmi_out>;
>                         };
>                 };
>         };
>=20
> And then I added a second port to the HDMI peripheral node as follows:
>=20
>                 port@1 {
>                         reg =3D <1>;
>                         dw_hdmi_out: endpoint {
>                                 remote-endpoint =3D=20
> <&hdmi_connector_in>;
>                         };
>                 };
>=20
> And I removed any of the above hacks. What I observe, apart from an=20
> inactive
> LCD controller (and ingenic-drm driver), is the following in=20
> /sys/devices/
> platform/10180000.hdmi/:
>=20
> consumer:platform:13050000.lcdc0
> consumer:platform:hdmi_connector
>=20
> Maybe I don't understand the significance of "consumer" here, but the=20
> LCD
> controller and the HDMI connector obviously have rather different=20
> roles. Then
> again, the device tree is defining bidirectional relationships, so=20
> maybe this
> is how they manifest themselves.
>=20
>>  > Because your "it doesn't work" arguments have zero weight=20
>> otherwise.
>>=20
>>  I hope I still can find it. So I can't promise anything.
>>  We have had it complete in DTS and added code to parse it.
>>  It may have been wiped out by cleaning up patch series during=20
>> rebase.
>=20
> I suppose the question is whether this is actually handled already. I=20
> would
> have thought that either the DRM framework would be able to identify=20
> such
> relationships in a generic way or that the Synopsys driver would need=20
> to do
> so. This might actually be happening, given that the sysfs entries=20
> are there,
> but I might also imagine that something extra would be required to=20
> set the
> bridge type.
>=20
> I did start writing some code to look up a remote endpoint for the=20
> second
> port, find the connector type, and then set it, but it was probably=20
> after
> midnight on that occasion as well. Short-circuiting this little dance=20
> and
> setting the bridge type indicated that this might ultimately be the=20
> right
> approach, but it would probably also mean introducing a point of
> specialisation to the Synopsys driver so that device-specific drivers=20
> can
> define a function to set the connector type.
>=20
> Otherwise, I can't see the Synopsys driver working for devices like=20
> the
> JZ4780, but then again, it seems that all the other devices seem to
> incorporate the Synopsys functionality in a different way and do not=20
> need to
> deal with connectors at all.
>=20
>>  > If I can find some time this weekend I will test it myself.
>>=20
>>  You may be faster than me.
>=20
> So, when I wrote about approaches that "work", I can seemingly get=20
> the LCD
> controller and HDMI peripheral registers set up to match a non-Linux
> environment where I can demonstrate a functioning display, and yet I=20
> don't get
> a valid signal in the Linux environment.
>=20
> Nikolaus can actually get HDMI output, but there may be other factors
> introduced by the Linux environment that frustrate success for me,=20
> whereas my
> non-Linux environment is much simpler and can reliably reproduce a=20
> successful
> result.
>=20
> For me, running modetest yields plenty of information about encoders,
> connectors (and the supported modes via the EDID, thanks to my HDMI-A=20
> hack),
> CRTCs, and planes. But no framebuffers are reported.

Could you paste the result of "modetest -a -c -p" somewhere maybe?

If you have info about the CRTCs, encoders, connectors and EDID info,=20
then I would assume it is very close to working fine.

For your "no framebuffer" issue, keep in mind that CONFIG_FB and=20
CONFIG_FRAMEBUFFER_CONSOLE are now disabled by default.

If that doesn't fix anything, that probably means that one=20
.atomic_check() fails, so it would be a good place to start debugging.

Cheers,
-Paul


