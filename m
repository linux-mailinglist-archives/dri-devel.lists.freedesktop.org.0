Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4269319D32
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 12:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4063F6E59B;
	Fri, 12 Feb 2021 11:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3F16E59B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 11:20:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DE31AC69;
 Fri, 12 Feb 2021 11:20:17 +0000 (UTC)
Message-ID: <97eef5ad872b08b174dfd4ed903508371b1baaa5.camel@suse.de>
Subject: Re: [PATCH v2 14/15] ARM: dts: bcm2711: Add the BSC interrupt
 controller
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Florian Fainelli <f.fainelli@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>
Date: Fri, 12 Feb 2021 12:20:14 +0100
In-Reply-To: <d4f8c89b-9bab-3dce-1f05-aeef39f64211@gmail.com>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-15-maxime@cerno.tech>
 <CAPY8ntC7U1BAVT8xe0emX19p4mCu-BQOeBeC-CDgKjE+asZKRQ@mail.gmail.com>
 <20210210144043.s4plyc7ekwnnu7k4@gilmour>
 <9d868bf76072fee7838b6f2ff73a575c@kernel.org>
 <CAPY8ntCG3vLy1NWNF09DEZWE-t_xc+q5m89Jv8GB8GofBLVp3Q@mail.gmail.com>
 <d4f8c89b-9bab-3dce-1f05-aeef39f64211@gmail.com>
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
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
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2105569188=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2105569188==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-c2ZiMS/8MK1k9wh+A4JP"


--=-c2ZiMS/8MK1k9wh+A4JP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-02-10 at 10:49 -0800, Florian Fainelli wrote:
> On 2/10/21 7:49 AM, Dave Stevenson wrote:
> > Hi Marc.
> >=20
> > On Wed, 10 Feb 2021 at 15:30, Marc Zyngier <maz@kernel.org> wrote:
> > >=20
> > > Hi Maxime,
> > >=20
> > > On 2021-02-10 14:40, Maxime Ripard wrote:
> > > > Hi Dave,
> > > >=20
> > > > On Tue, Feb 09, 2021 at 09:49:05AM +0000, Dave Stevenson wrote:
> > > > > On Mon, 11 Jan 2021 at 14:23, Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > >=20
> > > > > > The BSC controllers used for the HDMI DDC have an interrupt con=
troller
> > > > > > shared between both instances. Let's add it to avoid polling.
> > > > >=20
> > > > > This seems to have unintended side effects.
> > > > > GIC interrupt 117 is shared between the standard I2C controllers
> > > > > (i2c-bcm2835) and the l2-intc block handling the HDMI I2C interru=
pts.
> > > > >=20
> > > > > Whilst i2c-bcm2835 requests the interrupt with IRQF_SHARED, that
> > > > > doesn't appear to be an option for l2-intc registering as an inte=
rrupt
> > > > > controller. i2c-bcm2835 therefore loses out and fails to register=
 for
> > > > > the interrupt.
> > > > >=20
> > > > > Is there an equivalent flag that an interrupt controller can add =
to
> > > > > say that the parent interrupt is shared? Is that even supported?
> > > >=20
> > > > Indeed, it looks like setting an equivalent to IRQF_SHARED would be=
 the
> > > > solution, but I couldn't find anything that would allow us to in th=
e
> > > > irqchip code.
> > > >=20
> > > > Marc, Thomas, is it something that is allowed?
> > >=20
> > > No, not really. That's because the chained handler is actually an
> > > interrupt flow, and not a normal handler. IRQF_SHARED acts at the wro=
ng
> > > level for that.
> > >=20
> > > I can see two possibilities:
> > >=20
> > > - the l2-intc gets turned into a normal handler, and does the demux
> > > =C2=A0=C2=A0=C2=A0from there. Horrible stuff.
> > >=20
> > > - the i2c controller gets parented to the l2c-int as a fake interrupt=
,
> > > =C2=A0=C2=A0=C2=A0and gets called from there. Horrible stuff.
> > >=20
> > > Pick your poison... :-/
> >=20
> > Thanks for the info.
> >=20
> > Option 3 - remove l2-intc and drop back to polling the i2c-brcmstb
> > blocks (which the driver supports anyway).
> > HDMI I2C generally isn't heavily used once displays are connected, so
> > I'd be OK with that.
> >=20
> > (We can keep the l2-intc that handles CEC and HPD as that is on a
> > unique GIC interrupt).
>=20
> Agreed, Maxime or Nicolas do you want me to send a revert of this patch?

Reverting seems the safe move, but I'll defer to whatever Maxime says.

Regards,
Nicolas


--=-c2ZiMS/8MK1k9wh+A4JP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmAmZG4ACgkQlfZmHno8
x/5YOgf/R/l8SyblxkstWXvc6zfCjfB89hKUbIctbdEK1RHkvwIvanO4qScRUL4d
EaUHq3za69fXEHf6Uplk+nANGMncTVG3nDlpD60vjf1/v4hixsn+7j8bf1eFiKF3
i71eFfzGgEjh2v5k+qjzfDdjYbs5y2QuT7u1Dfrr+RmRt/vX2MB/8yuByXHl5+iV
54WT4Qo9BRUIWeAIPBg9ewTT9+d/Fg+NcxjPxe5daoYJcj6VLRcr61MG2QK7+t/d
LoxHQGBqkWdrBE930lYCGMeA/NtMExYdiUEyf0jHhDMkONb+lvQ8F3Hy5aK6bqcK
SfTZI6wEcCZkB2q+GrVmTXf5EE6BXA==
=TacG
-----END PGP SIGNATURE-----

--=-c2ZiMS/8MK1k9wh+A4JP--


--===============2105569188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2105569188==--

