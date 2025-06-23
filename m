Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3927EAE3FE6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB0C10E1BD;
	Mon, 23 Jun 2025 12:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8208B10E13E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 12:25:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uTgEQ-00084L-4d; Mon, 23 Jun 2025 14:25:02 +0200
Message-ID: <424c7fbf417c6d13c5842d78e83d72f705e021f1.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/6] drm/etnaviv: Add PPU flop reset
From: Lucas Stach <l.stach@pengutronix.de>
To: Gert Wollny <gert.wollny@collabora.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 23 Jun 2025 14:25:01 +0200
In-Reply-To: <7c8b78f040d872f7f119f849e7969a7f2a4e9c86.camel@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250618204400.21808-6-gert.wollny@collabora.com>
 <3197df27de7438c67558060414bff16662cb155a.camel@pengutronix.de>
 <7c8b78f040d872f7f119f849e7969a7f2a4e9c86.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, dem 23.06.2025 um 14:05 +0200 schrieb Gert Wollny:
> On Fri, 2025-06-20 at 22:22 +0200, Lucas Stach wrote:
> >=20
> > > @@ -1807,6 +1808,11 @@ static int etnaviv_gpu_bind(struct device
> > > *dev, struct device *master,
> > > =C2=A0		ret =3D -ENXIO;
> > > =C2=A0		goto out_sched;
> > > =C2=A0	}
> > > +
> > > +	if (etnaviv_flop_reset_ppu_require(&gpu->identity) &&
> > > +	=C2=A0=C2=A0=C2=A0 !priv->flop_reset_data_ppu)
> > > +		etnaviv_flop_reset_ppu_init(priv);
> > > +
> > I don't see why you would need to do this in the bind callback. You
> > should be able to move this to etnaviv_gpu_init(), so you have the
> > needed identification data. gpu_init is also executed serially over
> > all GPUs in the device, so there is no problem with potential races
> > there.
>=20
> I moved this here because you wrote before:=20
>=20
> > But then you should allocate this buffer
> > in etnaviv_gpu_bind to avoid races between GPUs starting up and=20
> > trying to allocate this global memory.
>=20
Yea, sorry about this. I hadn't noticed the dependency on the HW
identification when I wrote this.

> If etnaviv_gpu_init() is fine, I'll move it there.=20

I'm not saying that I may not again miss some implicit dependency, but
as far as I can see right now moving it there should be fine.
gpu_init() fulfills the same properties with regard to init ordering
between the GPUs as gpu_bind().

Regards,
Lucas
