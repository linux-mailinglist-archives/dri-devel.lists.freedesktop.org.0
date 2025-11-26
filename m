Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E9C8ADAC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365D110E66E;
	Wed, 26 Nov 2025 16:11:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF74110E161
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 16:11:08 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1vOI6g-0008FX-TN; Wed, 26 Nov 2025 17:11:02 +0100
Message-ID: <5267e8fbb93a8fe722f845331d17c61e29f1a705.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Lucas Stach <l.stach@pengutronix.de>
To: phasta@kernel.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Wed, 26 Nov 2025 17:11:01 +0100
In-Reply-To: <ff4e03cf5281bf54d36c69b4ae0dd5a19723178d.camel@mailbox.org>
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-2-christian.koenig@amd.com>
 <380012b9d6f0e9ee3c2f125cfe2f37f65c1979e0.camel@mailbox.org>
 <b46913b6-fe61-48cd-a9ca-aa2fe3a12b63@amd.com>
 <1c1a14d42d0a4a25ebce26a2af0a61dc1b7813fc.camel@mailbox.org>
 <508ff709-0f05-4982-8e15-5fea3bbd12e7@amd.com>
 <c2b571a7e74f86c6cb95bebd11274447c3080df9.camel@mailbox.org>
 <52d484c5-6dfb-4e2f-9caa-a61cf1d94801@amd.com>
 <e2c006ca81081ee1afa00b1b52a035c28a267e0f.camel@pengutronix.de>
 <207d50fe-eef3-4baa-97a7-567598e56b55@amd.com>
 <54d6e863fc606d22f245e30012bb5120d5bee7ee.camel@mailbox.org>
 <6151e7c5-1de2-4857-ae64-1e2fd6cb7513@amd.com>
 <ff4e03cf5281bf54d36c69b4ae0dd5a19723178d.camel@mailbox.org>
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

Am Mittwoch, dem 26.11.2025 um 16:44 +0100 schrieb Philipp Stanner:
> On Wed, 2025-11-26 at 16:03 +0100, Christian K=C3=B6nig wrote:
>=20
> > >=20
[...]
> > > My hope would be that in the mid-term future we'd get firmware
> > > rings
> > > that can be preempted through a firmware call for all major
> > > hardware.
> > > Then a huge share of our problems would disappear.
> >=20
> > At least on AMD HW pre-emption is actually horrible unreliable as
> > well.
>=20
> Do you mean new GPUs with firmware scheduling, or what is "HW pre-
> emption"?
>=20
> With firmware interfaces, my hope would be that you could simply tell
>=20
> stop_running_ring(nr_of_ring)
> // time slice for someone else
> start_running_ring(nr_of_ring)
>=20
> Thereby getting real scheduling and all that. And eliminating many
> other problems we know well from drm/sched.

It doesn't really matter if you have firmware scheduling or not for
preemption to be a hard problem on GPUs. CPUs have limited software
visible state that needs to be saved/restored on a context switch and
even there people start complaining now that they need to context
switch the AVX512 register set.

GPUs have megabytes of software visible state. Which needs to be
saved/restored on the context switch if you want fine grained
preemption with low preemption latency. There might be points in the
command execution where you can ignore most of that state, but reaching
those points can have basically unbounded latency. So either you can
reliably save/restore lots of state or you are limited to very coarse
grained preemption with all the usual issues of timeouts and DoS
vectors.
I'm not totally up to speed with the current state across all relevant
GPUs, but until recently NVidia was the only vendor to have real
reliable fine-grained preemption.

Regards,
Lucas


