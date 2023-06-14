Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB5B72F6A2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 09:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DB510E12F;
	Wed, 14 Jun 2023 07:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C246310E411
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 07:45:33 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q9LBz-0006mN-TT; Wed, 14 Jun 2023 09:45:23 +0200
Message-ID: <58362294c70476e54abc29d7591a328b1e92a617.camel@pengutronix.de>
Subject: Re: drm/etnaviv: disable MLCG and pulse eater on GPU reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, etnaviv@lists.freedesktop.org
Date: Wed, 14 Jun 2023 09:45:22 +0200
In-Reply-To: <b154bee4-9129-8f21-06d4-d86e3b5234f7@loongson.cn>
References: <20230607125841.3518385-1-l.stach@pengutronix.de>
 <b154bee4-9129-8f21-06d4-d86e3b5234f7@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am Mittwoch, dem 14.06.2023 um 00:42 +0800 schrieb Sui Jingfeng:
> Hi, Lucas
>=20
>=20
> I love your patch, perhaps something to improve:
>=20
> The MLCG stand for "Module Level Clock Gating",
>=20
> without reading the commit message, I guess there may have people don't=
=20
> know its meaning.
>=20
Yea, I expect people to read the commit message and not just the
subject if they want to know what a patch does. The MLCG abbreviation
is already well established within the driver code.

> There are still more thing in this patch can only be understand relay on=
=20
> guessing... :-)
>=20
That's unfortunately true. I don't know exactly what the pulse eater
control bits mean either. I've taken them verbatim from the reset
sequence in the Vivante kernel driver, which is also why I didn't try
to assign some meaning by giving them a name, but keep them as BITs in
the driver code.

Regards,
Lucas

>=20
> But drm/etnaviv drvier still works with this patch applied, so
>=20
>=20
> On 2023/6/7 20:58, Lucas Stach wrote:
> > Module level clock gating and the pulse eater might interfere with
> > the GPU reset, as they both have the potential to stop the clock
> > and thus reset propagation to parts of the GPU.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
>=20
>=20
> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
>=20
>=20
> > ---
> > I'm not aware of any cases where this would have been an issue, but
> > it is what the downstream driver does and fundametally seems like
> > the right thing to do.
> > ---
> >   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> > index de8c9894967c..41aab1aa330b 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -505,8 +505,19 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gp=
u)
> >   	timeout =3D jiffies + msecs_to_jiffies(1000);
> >  =20
> >   	while (time_is_after_jiffies(timeout)) {
> > -		/* enable clock */
> >   		unsigned int fscale =3D 1 << (6 - gpu->freq_scale);
> > +		u32 pulse_eater =3D 0x01590880;
> > +
> > +		/* disable clock gating */
> > +		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> > +
> > +		/* disable pulse eater */
> > +		pulse_eater |=3D BIT(17);
> > +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> > +		pulse_eater |=3D BIT(0);
> > +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> > +
> > +		/* enable clock */
> >   		control =3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
> >   		etnaviv_gpu_load_clock(gpu, control);
> >  =20
>=20

