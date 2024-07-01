Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C191E6D1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 19:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656B010E4C2;
	Mon,  1 Jul 2024 17:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEA110E4C6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 17:42:40 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sOL2z-0005XQ-7W; Mon, 01 Jul 2024 19:42:37 +0200
Message-ID: <1b28fce1c09887eb53679f687a50c6dd31903eb1.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/etnaviv: move debug register en-/disable into
 own function
From: Lucas Stach <l.stach@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, etnaviv@lists.freedesktop.org
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date: Mon, 01 Jul 2024 19:42:36 +0200
In-Reply-To: <e8e9d2ca2844e3ccbbe23b2c38b69ffe8d8307eb.camel@pengutronix.de>
References: <20240628104745.2602036-1-l.stach@pengutronix.de>
 <e8e9d2ca2844e3ccbbe23b2c38b69ffe8d8307eb.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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

Am Freitag, dem 28.06.2024 um 13:07 +0200 schrieb Philipp Zabel:
> On Fr, 2024-06-28 at 12:47 +0200, Lucas Stach wrote:
> > The next changes will introduce another place where the debug registers
> > need to be en-/disabled. Split into separate functions, so we don't nee=
d
> > to replicate the code there. Also allow those calls to nest, keeping
> > the debug registers enabled until all callers don't need them any longe=
r.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 33 ++++++++++++++++++++-------
> >  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  3 +++
> >  2 files changed, 28 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/et=
naviv/etnaviv_gpu.c
> > index 7c7f97793ddd..ade6f7554706 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> > @@ -471,6 +471,29 @@ static void etnaviv_hw_identify(struct etnaviv_gpu=
 *gpu)
> > =20
> >  	etnaviv_hw_specs(gpu);
> >  }
> > +void etnaviv_gpu_enable_debug_regs(struct etnaviv_gpu *gpu)
> > +{
> > +	u32 val;
> > +
> > +	if (atomic_inc_return(&gpu->dbg_ref) > 1)
> > +		return;
>=20
> This is a reference count, any reason not to use refcount_t?

refcount_t doesn't provide the nice _return interface and I don't think
the memory related messages emitted by refcount on misuse are helpful
here.

>=20
> > +
> > +	val =3D gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
> > +	val &=3D ~VIVS_HI_CLOCK_CONTROL_DISABLE_DEBUG_REGISTERS;
> > +	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
>=20
> Does this need locking after patch 3, to avoid racing of
> sync_point_perfmon_sample_pre/post() with etnaviv_sched_timedout_job()?
>=20
Right, the enable path is racy and may cause one of the racing threads
to read the debug registers before they have been enabled. This will
need proper locking.

Regards,
Lucas
