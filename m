Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CA3E5989
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 13:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FFC89D99;
	Tue, 10 Aug 2021 11:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5973089D99
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 11:58:34 +0000 (UTC)
Date: Tue, 10 Aug 2021 13:58:24 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie
 <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-Id: <C9HMXQ.KW3EEZJNMS8I@crapouillou.net>
In-Reply-To: <YRJcKeFKVoaFUeck@phenom.ffwll.local>
References: <20210805192110.90302-1-paul@crapouillou.net>
 <20210805192110.90302-3-paul@crapouillou.net> <YQw9hjZll4QmYVLX@kroah.com>
 <3HUDXQ.7RBGD4FUHR2F@crapouillou.net> <YQ0MU/GcLkPLiy5C@kroah.com>
 <LYZEXQ.9UWPIAZCVXIK@crapouillou.net> <YRJIb8ofHe8r5g1z@phenom.ffwll.local>
 <4BDMXQ.S6A97ME8XJUV@crapouillou.net> <YRJcKeFKVoaFUeck@phenom.ffwll.local>
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

Hi Daniel,

Le mar., ao=FBt 10 2021 at 12:59:53 +0200, Daniel Vetter=20
<daniel@ffwll.ch> a =E9crit :
> On Tue, Aug 10, 2021 at 12:33:04PM +0200, Paul Cercueil wrote:
>>  Hi Daniel,
>>=20
>>  Le mar., ao=FBt 10 2021 at 11:35:43 +0200, Daniel Vetter=20
>> <daniel@ffwll.ch> a
>>  =E9crit :
>>  > On Fri, Aug 06, 2021 at 01:01:33PM +0200, Paul Cercueil wrote:
>>  > >  Hi Greg,
>>  > >
>>  > >  Le ven., ao=FBt 6 2021 at 12:17:55 +0200, Greg Kroah-Hartman
>>  > >  <gregkh@linuxfoundation.org> a =E9crit :
>>  > >  > On Thu, Aug 05, 2021 at 10:05:27PM +0200, Paul Cercueil=20
>> wrote:
>>  > >  > >  Hi Greg,
>>  > >  > >
>>  > >  > >  Le jeu., ao=FBt 5 2021 at 21:35:34 +0200, Greg=20
>> Kroah-Hartman
>>  > >  > >  <gregkh@linuxfoundation.org> a =E9crit :
>>  > >  > >  > On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil
>>  > > wrote:
>>  > >  > >  > >  When the drivers of remote devices (e.g. HDMI chip)=20
>> are
>>  > >  > > disabled in
>>  > >  > >  > > the
>>  > >  > >  > >  config, we want the ingenic-drm driver to be able to=20
>> probe
>>  > >  > >  > > nonetheless
>>  > >  > >  > >  with the other devices (e.g. internal LCD panel)=20
>> that are
>>  > >  > > enabled.
>>  > >  > >  > >
>>  > >  > >  > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  > >  > >  > >  ---
>>  > >  > >  > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12
>>  > > ++++++++++++
>>  > >  > >  > >   1 file changed, 12 insertions(+)
>>  > >  > >  > >
>>  > >  > >  > >  diff --git=20
>> a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  > >  > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  > >  > >  index d261f7a03b18..5e1fdbb0ba6b 100644
>>  > >  > >  > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  > >  > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  > >  > >  > >  @@ -1058,6 +1058,18 @@ static int=20
>> ingenic_drm_bind(struct
>>  > >  > > device
>>  > >  > >  > > *dev, bool has_components)
>>  > >  > >  > >   	for (i =3D 0; ; i++) {
>>  > >  > >  > >   		ret =3D drm_of_find_panel_or_bridge(dev->of_node,=20
>> 0, i,
>>  > >  > > &panel,
>>  > >  > >  > > &bridge);
>>  > >  > >  > >   		if (ret) {
>>  > >  > >  > >  +			/*
>>  > >  > >  > >  +			 * Workaround for the case where the drivers for=20
>> the
>>  > >  > >  > >  +			 * remote devices are not enabled. When that=20
>> happens,
>>  > >  > >  > >  +			 * drm_of_find_panel_or_bridge() returns=20
>> -EPROBE_DEFER
>>  > >  > >  > >  +			 * endlessly, which prevents the ingenic-drm=20
>> driver
>>  > > from
>>  > >  > >  > >  +			 * working at all.
>>  > >  > >  > >  +			 */
>>  > >  > >  > >  +			if (ret =3D=3D -EPROBE_DEFER) {
>>  > >  > >  > >  +				ret =3D driver_deferred_probe_check_state(dev);
>>  > >  > >  > >  +				if (ret =3D=3D -ENODEV || ret =3D=3D -ETIMEDOUT)
>>  > >  > >  > >  +					continue;
>>  > >  > >  > >  +			}
>>  > >  > >  >
>>  > >  > >  > So you are mucking around with devices on other busses
>>  > > within this
>>  > >  > >  > driver?  What could go wrong?  :(
>>  > >  > >
>>  > >  > >  I'm doing the same thing as everybody else. This is the=20
>> DRM
>>  > > driver,
>>  > >  > > and
>>  > >  > >  there is a driver for the external HDMI chip which gives=20
>> us a
>>  > > DRM
>>  > >  > > bridge
>>  > >  > >  that we can obtain from the device tree.
>>  > >  >
>>  > >  > But then why do you need to call this function that is there=20
>> for
>>  > > a bus,
>>  > >  > not for a driver.
>>  > >
>>  > >  The documentation disagrees with you :)
>>  > >
>>  > >  And, if that has any weight, this solution was proposed by Rob.
>>  > >
>>  > >  > >  > Please use the existing driver core functionality for=20
>> this
>>  > > type of
>>  > >  > >  > thing, it is not unique, no need for this function to be
>>  > > called.
>>  > >  > >
>>  > >  > >  I'm not sure you understand what I'm doing here. This=20
>> driver
>>  > > calls
>>  > >  > >  drm_of_find_panel_or_bridge(), without guarantee that the
>>  > > driver
>>  > >  > > for the
>>  > >  > >  remote device (connected via DT graph) has been enabled=20
>> in the
>>  > >  > > kernel
>>  > >  > >  config. In that case it will always return -EPROBE_DEFER=20
>> and
>>  > > the
>>  > >  > > ingenic-drm
>>  > >  > >  driver will never probe.
>>  > >  > >
>>  > >  > >  This patch makes sure that the driver can probe if the=20
>> HDMI
>>  > > driver
>>  > >  > > has been
>>  > >  > >  disabled in the kernel config, nothing more.
>>  > >  >
>>  > >  > That should not be an issue as you do not care if the config=20
>> is
>>  > > enabled,
>>  > >  > you just want to do something in the future if the driver=20
>> shows
>>  > > up,
>>  > >  > right?
>>  > >
>>  > >  Well, the DRM subsystem doesn't really seem to handle hotplug=20
>> of
>>  > > hardware.
>>  > >  Right now all the drivers for the connected hardware need to=20
>> probe
>>  > > before
>>  > >  the main DRM driver. So I need to know that a remote device
>>  > > (connected via
>>  > >  DT graph) will never probe.
>>  > >
>>  > >  Give me a of_graph_remote_device_driver_will_never_probe() and=20
>> I'll
>>  > > use
>>  > >  that.
>>  > >
>>  > >  > Much like the device link code, have you looked at that?
>>  > >
>>  > >  I don't see how that would help in any way. The device link=20
>> code
>>  > > would allow
>>  > >  me to set a dependency between the remote hardware (HDMI chip,
>>  > > provider) and
>>  > >  the LCD controller (consumer), but I already have that=20
>> dependency
>>  > > though the
>>  > >  DT graph. What I need is a way for the consumer to continue=20
>> probing
>>  > > if the
>>  > >  provider is not going to probe.
>>  >
>>  > Is this actually a legit use-case?
>>  >
>>  > Like you have hw with a bunch of sub-devices linked, and you=20
>> decided to
>>  > disable some of them, which makes the driver not load.
>>=20
>>  Yes. I'm facing that issue with a board that has a LCD panel and a=20
>> HDMI
>>  controller (IT66121). I have a "flasher" program for all the=20
>> Ingenic boards,
>>  that's basically just a Linux kernel + initramfs booted over USB=20
>> (device). I
>>  can't realistically enable every single driver for all the hardware=20
>> that's
>>  on these boards while still having a tiny footprint. And I=20
>> shouldn't have to
>>  care about it either.
>=20
> I think this is were things go wrong.
>=20
> Either you have a generic image, where all the needed drivers are=20
> included
> as modules.
>=20
> Or you have a bespoke image, where you just built-in what you actually
> needed.

Yes, and that's what I want - a kernel with just the minimal number of=20
built-in drivers that I need (so, not the HDMI chip).

> Asking for both is a bit much ...
>=20
>>  > Why should we care? Is that hdmi driver really that big that we=20
>> have to
>>  > support this use-case?
>>=20
>>  DRM maintainers work with what embedded devs would call "infinite
>>  resources". It annoys me that CONFIG_DRM pulls the I2C code even=20
>> though I
>>  may just have a LCD panel, and it annoys me that I have to enable=20
>> support
>>  for hardware that I'm not even planning to use, just so that the=20
>> DRM driver
>>  works for the hardware I do want to use.
>=20
> No.
>=20
> What I'm rejecting is when people add Kconfig knobs for a single=20
> function,
> while we have everything else as fairly monolithic dependencies in=20
> drm.
> That makes no sense.
>=20
> The only requirement for tiny drm that I have is that whomever=20
> proposes
> it:
>=20
> - does an overall survey and shows that we do actually get rid of the=20
> big
>   pieces, and not just of the pieces which are easy to make optional
>=20
> - has a solid answer to the maintainance cost this will incur. This=20
> one is
>   very important, because for historical reasons we have a bunch of
>   optional things like backlight, and the trend is to make them less
>   optional because a) those are all rather invalid configs anyway b)=20
> no on
>   has time to review the constant flux of busy-work bugfixes when
>   something inevitably breaks again
>=20
> Thus far all I got from people who want to make drm tiny is some=20
> wishlist
> items and stand-alone patches that don't make sense stand-alone. Until
> that's fixed and someone invests serious amounts of time here drm=20
> will be
> a big behemoth. And that's because we're very much not operating in
> an "infinite resource" world, the most constraint supply we have is
> contributor, reviewer and maintainer bandwidth.
>=20
> Which yes means occasionally things will continue to suck because no=20
> one
> cared enough about it yet.

Alright, I can totally understand that.

>>  > I know it's possible to do this, that doesn't mean it's a good=20
>> idea.
>>  > There's inifinitely more randconfigs that don't boot on my=20
>> machine here
>>  > for various reasons than the ones that do boot. We don't have=20
>> "fixes"
>>  > for
>>  > all of these to make things still work, despite user=20
>> misconfiguring
>>  > their
>>  > kernel.
>>=20
>>  I understand, you can't really expect random configs to work every=20
>> time. But
>>  it should still be possible to disable drivers for *optional*=20
>> hardware in
>>  the config and end up with a working system.
>=20
> The thing is, right now that stuff just isn't optional. Except if you
> patch your dt, which I think is the other approach that's been=20
> discussed
> here.

It's not been discussed yet - I think we talked about it a few weeks=20
ago on IRC.

DT is supposed to represent the hardware though, and not a specific=20
configuration, which would be policy; so this isn't really the best=20
solution either.

Cheers,
-Paul


