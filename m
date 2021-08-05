Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3566C3E1D24
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 22:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769BE6EB2A;
	Thu,  5 Aug 2021 20:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1646EB2A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 20:05:36 +0000 (UTC)
Date: Thu, 05 Aug 2021 22:05:27 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] gpu/drm: ingenic: Add workaround for disabled drivers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, list@opendingux.net,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-Id: <3HUDXQ.7RBGD4FUHR2F@crapouillou.net>
In-Reply-To: <YQw9hjZll4QmYVLX@kroah.com>
References: <20210805192110.90302-1-paul@crapouillou.net>
 <20210805192110.90302-3-paul@crapouillou.net> <YQw9hjZll4QmYVLX@kroah.com>
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

Le jeu., ao=FBt 5 2021 at 21:35:34 +0200, Greg Kroah-Hartman=20
<gregkh@linuxfoundation.org> a =E9crit :
> On Thu, Aug 05, 2021 at 09:21:09PM +0200, Paul Cercueil wrote:
>>  When the drivers of remote devices (e.g. HDMI chip) are disabled in=20
>> the
>>  config, we want the ingenic-drm driver to be able to probe=20
>> nonetheless
>>  with the other devices (e.g. internal LCD panel) that are enabled.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>=20
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index d261f7a03b18..5e1fdbb0ba6b 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -1058,6 +1058,18 @@ static int ingenic_drm_bind(struct device=20
>> *dev, bool has_components)
>>   	for (i =3D 0; ; i++) {
>>   		ret =3D drm_of_find_panel_or_bridge(dev->of_node, 0, i, &panel,=20
>> &bridge);
>>   		if (ret) {
>>  +			/*
>>  +			 * Workaround for the case where the drivers for the
>>  +			 * remote devices are not enabled. When that happens,
>>  +			 * drm_of_find_panel_or_bridge() returns -EPROBE_DEFER
>>  +			 * endlessly, which prevents the ingenic-drm driver from
>>  +			 * working at all.
>>  +			 */
>>  +			if (ret =3D=3D -EPROBE_DEFER) {
>>  +				ret =3D driver_deferred_probe_check_state(dev);
>>  +				if (ret =3D=3D -ENODEV || ret =3D=3D -ETIMEDOUT)
>>  +					continue;
>>  +			}
>=20
> So you are mucking around with devices on other busses within this
> driver?  What could go wrong?  :(

I'm doing the same thing as everybody else. This is the DRM driver, and=20
there is a driver for the external HDMI chip which gives us a DRM=20
bridge that we can obtain from the device tree.

> Please use the existing driver core functionality for this type of
> thing, it is not unique, no need for this function to be called.

I'm not sure you understand what I'm doing here. This driver calls=20
drm_of_find_panel_or_bridge(), without guarantee that the driver for=20
the remote device (connected via DT graph) has been enabled in the=20
kernel config. In that case it will always return -EPROBE_DEFER and the=20
ingenic-drm driver will never probe.

This patch makes sure that the driver can probe if the HDMI driver has=20
been disabled in the kernel config, nothing more.

Cheers,
-Paul


