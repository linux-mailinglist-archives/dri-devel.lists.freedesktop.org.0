Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B848C8AC87
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87DF10E2BE;
	Wed, 26 Nov 2025 15:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C0510E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:59:47 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1vOHvh-0006xd-H3; Wed, 26 Nov 2025 16:59:41 +0100
Message-ID: <12a822ffedb4d1c4901c2bfd1c493034c8ed3f90.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Lucas Stach <l.stach@pengutronix.de>
To: phasta@kernel.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Wed, 26 Nov 2025 16:59:39 +0100
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
> >=20
> >=20
> > On 11/26/25 13:37, Philipp Stanner wrote:
> > > On Wed, 2025-11-26 at 13:31 +0100, Christian K=C3=B6nig wrote:
> > > >=20
>=20
> [=E2=80=A6]
>=20
> > > > Well the question is how do you detect *reliable* that there is
> > > > still forward progress?
> > >=20
> > > My understanding is that that's impossible since the internals of
> > > command submissions are only really understood by userspace, who
> > > submits them.
> >=20
> > Right, but we can still try to do our best in the kernel to mitigate
> > the situation.
> >=20
> > I think for now amdgpu will implement something like checking if the
> > HW still makes progress after a timeout but only a limited number of
> > re-tries until we say that's it and reset anyway.
>=20
> Oh oh, isn't that our dear hang_limit? :)

Not really. The hang limit is the limit on how many times a hanging
submit might be retried.

Limiting the number of timeout extensions is more of a safety net
against a workloads which might appear to make progress to the kernel
driver but in reality are stuck. After all, the kernel driver can only
have limited knowledge of the GPU state and any progress check will
have limited precision with false positives/negatives being a part of
reality we have to deal with.

>=20
> We agree that you can never really now whether userspace just submitted
> a while(true) job, don't we? Even if some GPU register still indicates
> "progress".

Yea, this is really hardware dependent on what you can read at
runtime.=C2=A0

For etnaviv we define "progress" as the command frontend moving towards
the end of the command buffer. As a single draw call in valid workloads
can blow through our timeout we also use debug registers to look at the
current primitive ID within a draw call.
If userspace submits a workload that requires more than 500ms per
primitive to finish we consider this an invalid workload and go through
the reset/recovery motions.

Regards,
Lucas
