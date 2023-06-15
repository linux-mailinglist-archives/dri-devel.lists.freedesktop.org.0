Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A930773148F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A32510E4B6;
	Thu, 15 Jun 2023 09:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AAE10E4B6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:53:25 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q9jfL-000108-UE; Thu, 15 Jun 2023 11:53:20 +0200
Message-ID: <7bbad708041fffac5fcaf5c0ef2b0e53c29c682a.camel@pengutronix.de>
Subject: Re: drm/etnaviv: slow down FE idle polling
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Date: Thu, 15 Jun 2023 11:53:18 +0200
In-Reply-To: <b69671a6-4d4a-b1ee-784e-e21bd8f5558c@loongson.cn>
References: <20230607125932.3518547-1-l.stach@pengutronix.de>
 <8c36b8bc-5a0d-75f7-265c-b0191979165a@loongson.cn>
 <d17de4ebfd08faa23238ece2ad0b737bf271498b.camel@pengutronix.de>
 <36946504-45c3-f0bc-3e4a-9106d9f4a2dd@loongson.cn>
 <CAH9NwWeB-MudNvuyuH1kUNiyWQTZ5Y4fuiB4uNKtutCKL3EZPg@mail.gmail.com>
 <b69671a6-4d4a-b1ee-784e-e21bd8f5558c@loongson.cn>
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 15.06.2023 um 17:37 +0800 schrieb Sui Jingfeng:
> Hi,
>=20
[...]
> > > > > > +
> > > > > > +   /*
> > > > > > +    * Choose number of wait cycles to target a ~30us (1/32768)=
 max latency
> > > > > > +    * until new work is picked up by the FE when it polls in t=
he idle loop.
> > > > > > +    */
> > > > > > +   gpu->fe_waitcycles =3D min(gpu->base_rate_core >> (15 - gpu=
->freq_scale),
> > > > > > +                            0xffffUL);
> > > > > This patch is NOT effective on our hardware GC1000 v5037 (ls7a100=
0 +
> > > > > ls3a5000).
> > > > >=20
> > > > > As the gpu->base_rate_core is 0,  so, in the end gpu->fe_waitcycl=
es is
> > > > > also zero.
> > > > >=20
> > > > Uh, that's a problem, as the patch will then have the opposite effe=
ct
> > > > on your platform by speeding up the idle loop. Thanks for catching
> > > > this! I'll improve the patch to keep a reasonable amount of wait cy=
cles
> > > > in this case.
> > > It's OK, no big problem as far as I can see. (it my platform's proble=
m,
> > > not your problem)
> > >=20
> > It will become a problem as it eats up the bandwidth that you want to
> > spend for real graphic work.
> >=20
> > > Merge it is also OK, if we found something wrong we could fix it with=
 a
> > > another patch.
> > >=20
> > Hmm.. I think that the fix for this problem is more or less an extra
> > if so I would love to see a proper fix
> > before this patch gets merged.

Right, we don't merge known broken stuff. We are all humans and bugs
and oversights happen, but we don't knowingly regress things.

>=20
> It just no effect(at least I can't find).
>=20
> I have tried, The score of glmark2 does not change, not become better,=
=20
> not become worse.

That's because it only affects your system when the GPU is idle but
isn't in runtime PM yet. If you measure the DRAM bandwidth in that time
window you'll see that the GPU now uses much more bandwidth, slowing
down other workloads.

Regards,
Lucas

