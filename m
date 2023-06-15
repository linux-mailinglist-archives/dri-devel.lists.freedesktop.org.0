Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283D731353
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A624910E4A2;
	Thu, 15 Jun 2023 09:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4B210E49A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:14:51 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q9j43-0002j0-9G; Thu, 15 Jun 2023 11:14:47 +0200
Message-ID: <5eda22a30113abd46ebdbab40ca54233868f5bfe.camel@pengutronix.de>
Subject: Re: drm/etnaviv: disable MLCG and pulse eater on GPU reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, etnaviv@lists.freedesktop.org
Date: Thu, 15 Jun 2023 11:14:45 +0200
In-Reply-To: <9ca50a8e-5e56-14a2-7ae7-988340ee8c81@loongson.cn>
References: <20230607125841.3518385-1-l.stach@pengutronix.de>
 <b154bee4-9129-8f21-06d4-d86e3b5234f7@loongson.cn>
 <58362294c70476e54abc29d7591a328b1e92a617.camel@pengutronix.de>
 <9ca50a8e-5e56-14a2-7ae7-988340ee8c81@loongson.cn>
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

Am Donnerstag, dem 15.06.2023 um 01:49 +0800 schrieb Sui Jingfeng:
> Hi
>=20
> On 2023/6/14 15:45, Lucas Stach wrote:
> > Hi,
> >=20
> > Am Mittwoch, dem 14.06.2023 um 00:42 +0800 schrieb Sui Jingfeng:
> > > Hi, Lucas
> > >=20
> > >=20
> > > I love your patch, perhaps something to improve:
> > >=20
> > > The MLCG stand for "Module Level Clock Gating",
> > >=20
> > > without reading the commit message, I guess there may have people don=
't
> > > know its meaning.
> > >=20
> > Yea, I expect people to read the commit message and not just the
> > subject if they want to know what a patch does. The MLCG abbreviation
> > is already well established within the driver code.
>=20
> Yeah, I agree with you that the reviewer should read the commit message=
=20
> and the patch itself(code)
>=20
> But after look the code quite a while, I'm wondering that
>=20
> 1) is the "Module Level" absolutely needed ?
>=20
> 2) is it accurate enough ?
>=20
>=20
> For question in 1),=C2=A0 I meant that is it better by saying: "drm/etnav=
iv:=20
> disable clock gating and pulse eater on GPU reset"
>=20
> For question in 2),=C2=A0 I mean that the code inside the=20
> etnaviv_hw_reset(struct etnaviv_gpu *gpu) function are per GPU instance=
=20
> level.
>=20
>=20
> Every GPU instance managed by the drm/etnaviv will run those clock=20
> gating related code.
>=20
> So it is per GPU instance level.
>=20
>=20
> As far as I can understand, the "Module Level" stand for the=20
> drm/etnaviv(etnaviv.ko) as a whole
>=20
> Nearly all patches for the gpu/drm/drivers are module level by default,
>=20
> What's you really want to emphasize?
>=20
>=20
> I think you probably want to drop the "ML",=C2=A0 and replace the "MLCG" =
with=20
> "clock gating".
>=20
> explain the "ML" in the commit message should be enough.
>=20
No "module level" here has nothing to do with the kernel module at
all.=C2=A0

MLCG is the GPU internal clock gating mechanism implemented in the
Vivante GPU cores. The module level here means that the GPU can gate
individual modules of the core like the texture engine, pixel engine,
etc. when the they are either idle or stalled. It's a fine grained
clock gating mechanism, in contrast to the more coarse-grained platform
level mechanisms, which may be able to gate the clock for the GPU as a
whole.

So in essence MLCG is the absolutely right and most specific term that
need to be used here to describe what is being done in this patch.

Regards,
Lucas

> > > There are still more thing in this patch can only be understand relay=
 on
> > > guessing... :-)
> > >=20
> > That's unfortunately true. I don't know exactly what the pulse eater
> > control bits mean either. I've taken them verbatim from the reset
> > sequence in the Vivante kernel driver, which is also why I didn't try
> > to assign some meaning by giving them a name, but keep them as BITs in
> > the driver code.
> >=20
> > Regards,
> > Lucas
> >=20
> > > But drm/etnaviv drvier still works with this patch applied, so
> > >=20
> > >=20
> > > On 2023/6/7 20:58, Lucas Stach wrote:
> > > > Module level clock gating and the pulse eater might interfere with
> > > > the GPU reset, as they both have the potential to stop the clock
> > > > and thus reset propagation to parts of the GPU.
> > > >=20
> > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>
> > >=20
> > > Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > >=20
> > >=20
> > > > ---
> > > > I'm not aware of any cases where this would have been an issue, but
> > > > it is what the downstream driver does and fundametally seems like
> > > > the right thing to do.
> > > > ---
> > > >    drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 13 ++++++++++++-
> > > >    1 file changed, 12 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gpu.c
> > > > index de8c9894967c..41aab1aa330b 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > > > @@ -505,8 +505,19 @@ static int etnaviv_hw_reset(struct etnaviv_gpu=
 *gpu)
> > > >    	timeout =3D jiffies + msecs_to_jiffies(1000);
> > > >   =20
> > > >    	while (time_is_after_jiffies(timeout)) {
> > > > -		/* enable clock */
> > > >    		unsigned int fscale =3D 1 << (6 - gpu->freq_scale);
> > > > +		u32 pulse_eater =3D 0x01590880;
> > > > +
> > > > +		/* disable clock gating */
> > > > +		gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, 0x0);
> > > > +
> > > > +		/* disable pulse eater */
> > > > +		pulse_eater |=3D BIT(17);
> > > > +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> > > > +		pulse_eater |=3D BIT(0);
> > > > +		gpu_write_power(gpu, VIVS_PM_PULSE_EATER, pulse_eater);
> > > > +
> > > > +		/* enable clock */
> > > >    		control =3D VIVS_HI_CLOCK_CONTROL_FSCALE_VAL(fscale);
> > > >    		etnaviv_gpu_load_clock(gpu, control);
> > > >   =20
>=20

