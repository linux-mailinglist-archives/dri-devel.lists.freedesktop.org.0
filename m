Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72030A20C2E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 15:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7845910E009;
	Tue, 28 Jan 2025 14:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34EB10E009
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 14:41:42 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tcmmZ-0007SD-Lt; Tue, 28 Jan 2025 15:41:39 +0100
Message-ID: <e21418ab4f1e82d322569ef2d4a481c564a1040c.camel@pengutronix.de>
Subject: Re: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 marek.olsak@amd.com, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Tue, 28 Jan 2025 15:41:38 +0100
In-Reply-To: <af78559c-057a-4d70-ab05-fcc943dce2e6@gmail.com>
References: <20250128100833.8973-1-christian.koenig@amd.com>
 <6681c5a71cadaee237dc4bf47e12ffd0bfdd89b0.camel@pengutronix.de>
 <af78559c-057a-4d70-ab05-fcc943dce2e6@gmail.com>
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

Am Dienstag, dem 28.01.2025 um 15:28 +0100 schrieb Christian K=C3=B6nig:
> Am 28.01.25 um 11:48 schrieb Lucas Stach:
> > Hi Christian,
> >=20
> > Am Dienstag, dem 28.01.2025 um 11:08 +0100 schrieb Christian K=C3=B6nig=
:
> > > Even the kerneldoc says that with a zero timeout the function should =
not
> > > wait for anything, but still return 1 to indicate that the fences are
> > > signaled now.
> > >=20
> > > Unfortunately that isn't what was implemented, instead of only return=
ing
> > > 1 we also waited for at least one jiffies.
> > >=20
> > > Fix that by adjusting the handling to what the function is actually
> > > documented to do.
> > >=20
> > > Reported-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> > > Reported-by: Lucas Stach <l.stach@pengutronix.de>
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: <stable@vger.kernel.org>
> > > ---
> > >   drivers/dma-buf/dma-resv.c | 11 ++++++-----
> > >   1 file changed, 6 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > > index 5f8d010516f0..ae92d9d2394d 100644
> > > --- a/drivers/dma-buf/dma-resv.c
> > > +++ b/drivers/dma-buf/dma-resv.c
> > > @@ -684,11 +684,12 @@ long dma_resv_wait_timeout(struct dma_resv *obj=
, enum dma_resv_usage usage,
> > >   	dma_resv_iter_begin(&cursor, obj, usage);
> > >   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> > >  =20
> > > -		ret =3D dma_fence_wait_timeout(fence, intr, ret);
> > > -		if (ret <=3D 0) {
> > > -			dma_resv_iter_end(&cursor);
> > > -			return ret;
> > > -		}
> > > +		ret =3D dma_fence_wait_timeout(fence, intr, timeout);
> > > +		if (ret <=3D 0)
> > > +			break;
> > > +
> > > +		/* Even for zero timeout the return value is 1 */
> > > +		timeout =3D min(timeout, ret);
> > This min construct and the comment confused me a bit at first. I think
> > it would be easier to read as
> >=20
> > /* With a zero timeout dma_fence_wait_timeout makes up a
> >   * positive return value for already signaled fences.
> >   */
> > if (timeout)
> > 	timeout =3D ret;
>=20
> Good point, going to change that.
>=20
> >=20
> > Also please change the initialization of ret on top of the function to
> > ret =3D 1 so it has the right value when no fences are present. Now tha=
t
> > you use the timeout variable for the fence wait, there is no point in
> > initializing ret to the timeout.
>=20
> When no fences are present returning 1 would be incorrect if the timeout=
=20
> value was non zero.
>=20
> Only when the timeout value is zero we should return 1 to indicate that=
=20
> there is nothing to wait for.
>=20
Uh, yea didn't think about this.

Honestly, making up this positive return value requires one to think
really hard about those code paths. This would all be much cleaner and
the chaining of multiple waits, like in the function changed here,
would be much more natural when a 0 return would also be treated as a
ordinary successful wait and timeouts would be signaled with ETIMEDOUT.
But that's a large change with lots of callsites to audit, maybe for
another day.

Regards,
Lucas
