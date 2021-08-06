Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E443E2907
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 13:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E82496E8BD;
	Fri,  6 Aug 2021 11:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EA36E8BD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 11:01:43 +0000 (UTC)
Date: Fri, 06 Aug 2021 13:01:33 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-Id: <LYZEXQ.9UWPIAZCVXIK@crapouillou.net>
In-Reply-To: <YQ0MU/GcLkPLiy5C@kroah.com>
References: <20210805192110.90302-1-paul@crapouillou.net>
 <20210805192110.90302-3-paul@crapouillou.net> <YQw9hjZll4QmYVLX@kroah.com>
 <3HUDXQ.7RBGD4FUHR2F@crapouillou.net> <YQ0MU/GcLkPLiy5C@kroah.com>
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

Hi Greg,

Le ven., ao=FBt 6 2021 at 12:17:55 +0200, Greg Kroah-Hartman=20
<gregkh@linuxfoundation.org> a =E9crit :
> On Thu, Aug 05, 2021 at 10:05:27PM +0200, Paul Cercueil wrote:
>>  Hi Greg,
>>=20
>>  Le jeu., ao=FBt 5 2021 at 21:35:34 +0200, Greg Kroah-Hartman
>>  <gregkh@linuxfoundation.org> a =E9crit :
>>  > On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil wrote:
>>  > >  When the drivers of remote devices (e.g. HDMI chip) are=20
>> disabled in
>>  > > the
>>  > >  config, we want the ingenic-drm driver to be able to probe
>>  > > nonetheless
>>  > >  with the other devices (e.g. internal LCD panel) that are=20
>> enabled.
>>  > >
>>  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > >  ---
>>  > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
>>  > >   1 file changed, 12 insertions(+)
>>  > >
>>  > >  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  index d261f7a03b18..5e1fdbb0ba6b 100644
>>  > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  @@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct=20
>> device
>>  > > *dev, bool has_components)
>>  > >   	for (i =3D 0; ; i++) {
>>  > >   		ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, i,=20
>> &panel,
>>  > > &bridge);
>>  > >   		if (ret) {
>>  > >  +			/*
>>  > >  +			 * Workaround for the case where the drivers for the
>>  > >  +			 * remote devices are not enabled. When that happens,
>>  > >  +			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
>>  > >  +			 * endlessly, which prevents the ingenic-drm driver from
>>  > >  +			 * working at all.
>>  > >  +			 */
>>  > >  +			if (ret =3D=3D -EPROBE_DEFER) {
>>  > >  +				ret =3D driver_deferred_probe_check_state(dev);
>>  > >  +				if (ret =3D=3D -ENODEV || ret =3D=3D -ETIMEDOUT)
>>  > >  +					continue;
>>  > >  +			}
>>  >
>>  > So you are mucking around with devices on other busses within this
>>  > driver?  What could go wrong?  :(
>>=20
>>  I'm doing the same thing as everybody else. This is the DRM driver,=20
>> and
>>  there is a driver for the external HDMI chip which gives us a DRM=20
>> bridge
>>  that we can obtain from the device tree.
>=20
> But then why do you need to call this function that is there for a=20
> bus,
> not for a driver.

The documentation disagrees with you :)

And, if that has any weight, this solution was proposed by Rob.

>>  > Please use the existing driver core functionality for this type of
>>  > thing, it is not unique, no need for this function to be called.
>>=20
>>  I'm not sure you understand what I'm doing here. This driver calls
>>  drm_of_find_panel_or_bridge(), without guarantee that the driver=20
>> for the
>>  remote device (connected via DT graph) has been enabled in the=20
>> kernel
>>  config. In that case it will always return -EPROBE_DEFER and the=20
>> ingenic-drm
>>  driver will never probe.
>>=20
>>  This patch makes sure that the driver can probe if the HDMI driver=20
>> has been
>>  disabled in the kernel config, nothing more.
>=20
> That should not be an issue as you do not care if the config is=20
> enabled,
> you just want to do something in the future if the driver shows up,
> right?

Well, the DRM subsystem doesn't really seem to handle hotplug of=20
hardware. Right now all the drivers for the connected hardware need to=20
probe before the main DRM driver. So I need to know that a remote=20
device (connected via DT graph) will never probe.

Give me a of_graph_remote_device_driver_will_never_probe() and I'll use=20
that.

> Much like the device link code, have you looked at that?

I don't see how that would help in any way. The device link code would=20
allow me to set a dependency between the remote hardware (HDMI chip,=20
provider) and the LCD controller (consumer), but I already have that=20
dependency though the DT graph. What I need is a way for the consumer=20
to continue probing if the provider is not going to probe.

Cheers,
-Paul


