Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A09BC8AB7C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EC810E2BC;
	Wed, 26 Nov 2025 15:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="b3b2qR9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E9F10E2BC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:45:01 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dGkQf3KYYz9tPx;
 Wed, 26 Nov 2025 16:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764171898; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYuQKYWHvgTzA8qA0Zkdlur/RZgIWQgqyLe70jBOPB8=;
 b=b3b2qR9/Ygc6aU85/+Ub73YlSxQPtXAa3WnZTI4wmqhnGPm1KfjtyBNBrVkkv8sLA/kU+1
 ju2L0hagdnRBZDDcdaDEAFXM62XsMdChI3GBCTeB5A6t2UxLRqJ/JiVuRsQKXDBPzmCJNS
 IW14uEq9MH0AuF5uOq/a4clXdPkE/ZPQD4MhEdDv8nZIcS2ZY8vjTuO2STqElEvhwVt8qK
 6S4tVo9gfxy0bzwpSCc/BCGfCCQrSN+oj+RpxyrQ8QcD5N91W+i66cXPlEOzw7yeNMWCgO
 Gk5YcbcjZYcFITreQAjiUK0JbfWLf0tRdAfc1Lqve75uR7zhb0u71RX+o9PGhA==
Message-ID: <ff4e03cf5281bf54d36c69b4ae0dd5a19723178d.camel@mailbox.org>
Subject: Re: [PATCH 1/4] dma-buf/fence: give some reasonable maximum
 signaling timeout
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, Lucas Stach <l.stach@pengutronix.de>,
 alexdeucher@gmail.com,  simona.vetter@ffwll.ch, faith@gfxstrand.net,
 sumit.semwal@linaro.org
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Date: Wed, 26 Nov 2025 16:44:53 +0100
In-Reply-To: <6151e7c5-1de2-4857-ae64-1e2fd6cb7513@amd.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: dr76na9czm9xxq3nx38d6ykaiqs6nga4
X-MBO-RS-ID: 4d83f1c1ccad0993ace
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2025-11-26 at 16:03 +0100, Christian K=C3=B6nig wrote:
>=20
>=20
> On 11/26/25 13:37, Philipp Stanner wrote:
> > On Wed, 2025-11-26 at 13:31 +0100, Christian K=C3=B6nig wrote:
> > >=20

[=E2=80=A6]

> > > Well the question is how do you detect *reliable* that there is
> > > still forward progress?
> >=20
> > My understanding is that that's impossible since the internals of
> > command submissions are only really understood by userspace, who
> > submits them.
>=20
> Right, but we can still try to do our best in the kernel to mitigate
> the situation.
>=20
> I think for now amdgpu will implement something like checking if the
> HW still makes progress after a timeout but only a limited number of
> re-tries until we say that's it and reset anyway.

Oh oh, isn't that our dear hang_limit? :)

We agree that you can never really now whether userspace just submitted
a while(true) job, don't we? Even if some GPU register still indicates
"progress".

>=20
> > I think the long-term solution can only be fully fledged GPU
> > scheduling
> > with preemption. That's why we don't need such a timeout mechanism
> > for
> > userspace processes: the scheduler simply interrupts and lets
> > someone
> > else run.
>=20
> Yeah absolutely.=20
>=20
> >=20
> > My hope would be that in the mid-term future we'd get firmware
> > rings
> > that can be preempted through a firmware call for all major
> > hardware.
> > Then a huge share of our problems would disappear.
>=20
> At least on AMD HW pre-emption is actually horrible unreliable as
> well.

Do you mean new GPUs with firmware scheduling, or what is "HW pre-
emption"?

With firmware interfaces, my hope would be that you could simply tell

stop_running_ring(nr_of_ring)
// time slice for someone else
start_running_ring(nr_of_ring)

Thereby getting real scheduling and all that. And eliminating many
other problems we know well from drm/sched.

>=20
> Userspace basically needs to co-operate and provide a buffer where
> the state on a pre-emption is saved into.

That's uncool. With CPU preemption all that is done automatically via
the processe's pages.


P.

