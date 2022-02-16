Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73224B8D56
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 17:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEFD10E43A;
	Wed, 16 Feb 2022 16:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD5210E43A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 16:09:38 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nKMs3-0007Kl-OM; Wed, 16 Feb 2022 17:09:35 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nKMs2-00GzCC-S5; Wed, 16 Feb 2022 17:09:34 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nKMs0-001lH9-A3; Wed, 16 Feb 2022 17:09:32 +0100
Message-ID: <89a08ce1cdb1cf0b4d46b916e7107eca0796ca9d.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: Fix dev_dbg frequency output
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mark Jonas <mark.jonas@de.bosch.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 16 Feb 2022 17:09:32 +0100
In-Reply-To: <20220207151411.5009-1-mark.jonas@de.bosch.com>
References: <20220207151411.5009-1-mark.jonas@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: tingquan.ruan@cn.bosch.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

On Mon, 2022-02-07 at 16:14 +0100, Mark Jonas wrote:
> From: Leo Ruan <tingquan.ruan@cn.bosch.com>
>=20
> This commit corrects the printing of the IPU clock error percentage if
> it is between -0.1% to -0.9%. For example, if the pixel clock requested
> is 27.2 MHz but only 27.0 MHz can be achieved the deviation is -0.8%.
> But the fixed point math had a flaw and calculated error of 0.2%.
>=20
> Before:
> =C2=A0 Clocks: IPU 270000000Hz DI 24716667Hz Needed 27200000Hz
> =C2=A0 IPU clock can give 27000000 with divider 10, error 0.2%
> =C2=A0 Want 27200000Hz IPU 270000000Hz DI 24716667Hz using IPU, 27000000H=
z
>=20
> After:
> =C2=A0 Clocks: IPU 270000000Hz DI 24716667Hz Needed 27200000Hz
> =C2=A0 IPU clock can give 27000000 with divider 10, error -0.8%
> =C2=A0 Want 27200000Hz IPU 270000000Hz DI 24716667Hz using IPU, 27000000H=
z
>=20
> Signed-off-by: Leo Ruan <tingquan.ruan@cn.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
> =C2=A0drivers/gpu/ipu-v3/ipu-di.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/ipu-v3/ipu-di.c b/drivers/gpu/ipu-v3/ipu-di.c
> index b4a31d506fcc..74eca68891ad 100644
> --- a/drivers/gpu/ipu-v3/ipu-di.c
> +++ b/drivers/gpu/ipu-v3/ipu-di.c
> @@ -451,8 +451,9 @@ static void ipu_di_config_clock(struct ipu_di *di,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0error =3D rate / (sig->mode.pixelclock / 1000);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0dev_dbg(di->ipu->dev, "=C2=A0 IPU clock can give %lu with=
 divider %u, error %d.%u%%\n",
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rate, div=
, (signed)(error - 1000) / 10, error % 10);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0dev_dbg(di->ipu->dev, "=C2=A0 IPU clock can give %lu with=
 divider %u, error %c%d.%d%%\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rate, div=
, error < 1000 ? '-' : '+',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0abs(error=
 - 1000) / 10, abs(error - 1000) % 10);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0/* Allow a 1% error */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (error < 1010 && error >=3D 990) {

Rounding (always down) is still a bit unintuitive, but this certainly
improves things.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
