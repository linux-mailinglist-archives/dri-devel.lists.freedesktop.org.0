Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDCB077AD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 16:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4448110E03E;
	Wed, 16 Jul 2025 14:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Ttp3yrOR";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Pxd9Mszt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A48410E7C0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 14:11:35 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bhyfF6bCfz9svm;
 Wed, 16 Jul 2025 16:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752675093; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkTA/82R8j53qvFejMMTMSc0nVHIRGksK6KvPM96JZY=;
 b=Ttp3yrOREE9PRzZxbmAS7wLtTGSVyKcWWWEZP+qUVkPEoQdH2t3TCEamjNK1MW8dNuiIPG
 FJI5JQPZY+rHuueTVnI2HFjOCaxa54p6mQOO/Gmj2ttmX90CelJzc/Zx1i4xUuWVmCzORX
 u7qPTOmrugaObSa8KRrrNLKLoJyX62UjWxfBH4EnaLny1/0+Fas/Af9p5w1gZt1oO9lhkl
 xGtdXEfzxB41w9n1y7dKi4X7QKm995yure0iIRdLjfD9gQ789dZFwfEX8ZmeGy2epCIpGB
 EE+wLhFvNpKeSStJfBkmDlgpxEK7Zc/nUiX7ulR0+APbHStADj+IaoDI0gXHFA==
Message-ID: <d229a8b9ddaa169d504bd2dd68faf209709cff60.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752675091; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkTA/82R8j53qvFejMMTMSc0nVHIRGksK6KvPM96JZY=;
 b=Pxd9MsztvuSCR+Mcwf6Ocw2Y684oXoSACxG2Opv2Q/sgSAH/eBzShw6/cHqIs5iNxAa0q/
 UACXLSAD4i3gTNwrMwALyV3EwkutjsvPmI/H+hUC2sQbWU6lRn8QA2pvNiEfpnifEMyDxY
 W/W/nhVwtSCnpzr7/t5ExVrYdVsCO9nmIFMiQwws2TdhomqQ4WbbEJ9uFXVZs4pddthNaH
 SVT+lDgq63e7DkY868DXwYp1YbxEJq7L8xgjWQtx5DHKEonsDgg/9CaWRQagI8WYjfX88Z
 67z0sluZIXoRfIwaLjae3F8NajBwUIfKHD3FgP39tikiB1uwEBp+dYnyl26WUw==
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, phasta@kernel.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Michel
 =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>, "cao, lin"
 <lin.cao@amd.com>,  "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Yin, ZhenGuo (Chris)"
 <ZhenGuo.Yin@amd.com>,  "Deng, Emily" <Emily.Deng@amd.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "matthew.brost@intel.com"
 <matthew.brost@intel.com>, Sasha Levin <sashal@kernel.org>
Date: Wed, 16 Jul 2025 16:11:27 +0200
In-Reply-To: <2025071620-reunion-polka-ae73@gregkh>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
 <fd46ca0c-e484-4bf8-b74e-0139ecc7deae@mailbox.org>
 <49d822fc0f46e0fdeaccaeb2fbb1ade1c5cb1e5d.camel@mailbox.org>
 <ff383098-b453-44bd-9862-c6fc1447cf1d@amd.com>
 <2025071635-petition-unhitched-bdd0@gregkh>
 <0e58a96e61054ae88de112cb8be7e45e2b6f4f0c.camel@mailbox.org>
 <2025071620-reunion-polka-ae73@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: ptyuqcftwdc61ryk84ato91bsyq3abcp
X-MBO-RS-ID: c8f861cab532c2fb70a
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

On Wed, 2025-07-16 at 14:05 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 16, 2025 at 01:32:42PM +0200, Philipp Stanner wrote:
> > On Wed, 2025-07-16 at 13:15 +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Jul 16, 2025 at 12:58:28PM +0200, Christian K=C3=B6nig wrote:
> > > > On 16.07.25 12:46, Philipp Stanner wrote:
> > > > > +Cc Greg, Sasha
> > > > >=20
> > > > > On Wed, 2025-07-16 at 12:40 +0200, Michel D=C3=A4nzer wrote:
> > > > > > On 16.07.25 11:57, Philipp Stanner wrote:
> > > > > > > On Wed, 2025-07-16 at 09:43 +0000, cao, lin wrote:
> > > > > > > >=20
> > > > > > > > Hi Philipp,
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > Thank you for the review. I found that this
> > > > > > > > optimization
> > > > > > > > was
> > > > > > > > introduced 9 years ago in commit
> > > > > > > > 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu:
> > > > > > > > drop
> > > > > > > > a
> > > > > > > > dummy
> > > > > > > > wakeup scheduler").
> > > > > > > >=20
> > > > > > > >=20
> > > > > > > > Given that the=C2=A0codebase has undergone significant
> > > > > > > > changes
> > > > > > > > over
> > > > > > > > these
> > > > > > > > 9 years. May I ask if I still need to include the
> > > > > > > > Fixes:
> > > > > > > > tag?
> > > > > > >=20
> > > > > > > Yes. It's a helpful marker to see where the problem comes
> > > > > > > from, and
> > > > > > > it
> > > > > > > adds redundancy helping the stable-kernel maintainers in
> > > > > > > figuring
> > > > > > > out
> > > > > > > to which kernels to backport it to.
> > > > > > >=20
> > > > > > > If stable can't apply a patch to a very old stable kernel
> > > > > > > because
> > > > > > > the
> > > > > > > code base changed too much, they'll ping us and we might
> > > > > > > provide a
> > > > > > > dedicated fix.
> > > > > > >=20
> > > > > > > So like that:
> > > > > > >=20
> > > > > > > Cc: stable@vger.kernel.org=C2=A0# v4.6+
> > > > > > > Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup
> > > > > > > scheduler")
> > > > > >=20
> > > > > > FWIW, Fixes: alone is enough for getting backported to
> > > > > > stable
> > > > > > branches, Cc: stable is redundant with it.
> > > > >=20
> > > > > Both are used all the time together, though. And the official
> > > > > documentation does not list dropping Cc: stable as a valid
> > > > > option
> > > > > in
> > > > > this regard
> > > > >=20
> > > > > https://www.kernel.org/doc/html/latest/process/stable-kernel-rule=
s.html#option-1
> > > > >=20
> > > > >=20
> > > > > As long as the official documentation demands it, I'm not
> > > > > willing
> > > > > to
> > > > > drop it. If the docu were to be changed, that would be fine
> > > > > by
> > > > > me, too.
> > > >=20
> > > > As far as I understand "CC: stable" and "Fixes:" tags are to
> > > > handle
> > > > two distinct use cases.
> > >=20
> > > Yes.
> > >=20
> > > > "CC: stable..." means please backport, eventually with a kernel
> > > > version and/or necessary pre-requisites.
> > >=20
> > > Yes.
> > >=20
> > > > "Fixes:" only backport if you have this patch in your tree as
> > > > well.
> > > > In other words it is a restriction when to backport something.
> > >=20
> > > No.
> > >=20
> > > "Fixes:" is only for you to say "this commit fixes this other
> > > commit".
> > > And when you add a cc: stable, that will get you a FAILED email
> > > if
> > > the
> > > commit does NOT apply that far back.
> >=20
> > Does that mean we should NOT add Fixes: if the fixing patch does
> > not
> > apply on top of that old commit?
>=20
> Add Fixes: if you feel it accurataly describes the commit that caused
> the problem that this commit is fixing.=C2=A0 That is independant of "you
> need other commits after that to apply this one", that issue can be
> resolved by reading the stable kernel rules document and following
> what
> it says there to do for that.
>=20
> > And if so, should we drop the Fixes: tag completely in such cases
> > as
> > Lin suggested in this thread?
>=20
> If you don't want to ever be notified of any failures of stable
> patches
> being applied as far back as they should be applied, sure, don't put
> a
> Fixes: tag.=C2=A0 That means I do a "best effort" and just stop applying
> when
> they don't apply anymore.
>=20
> It also means that if you do NOT have a Fixes: tag, and the commit
> ends
> up getting assigned a CVE, we have to assume that the bug has been
> there
> since "the beginning of time" and will mark it as such.=C2=A0 Which might
> cause you headaches if you are responsible for keeping older kernels
> alive for vendors :)
>=20
> your call.
>=20
> hope this helps, and really, this should all be documented already,
> right?=C2=A0 If not, what is missing (becides the CVE stuff.)

It does help, thank you.

Regarding documentation, I can only tell you that the stable kernel
docu only sparringly mentions the Fixes: tag and it certainly doesn't
mention what you detail above.

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#opt=
ion-1

I think such questions are an excellent example for an FAQ section

"
FAQ

1. Do patches for the stable kernel have to include a Fixes: tag?
"


P.

>=20
> thanks,
>=20
> greg k-h

