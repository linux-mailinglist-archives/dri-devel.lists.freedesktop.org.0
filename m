Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 240DFB074D3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 13:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0801610E276;
	Wed, 16 Jul 2025 11:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QlRIecdT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fPHbkzVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B8C10E276
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 11:32:50 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bhv745ktbz9sm3;
 Wed, 16 Jul 2025 13:32:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752665568; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMGfdoOoS6iQPCr/bywDVwi8zs4P0HQGhorIHlY9F0Y=;
 b=QlRIecdT2zomfbh9oE58e8hlTADUyLSGA5KBsGXFhFxZ2gJVyohWo+wjMqEAKUWuBIpbuy
 AVXZlQ+MF4gFfGrDr5huVjmUQI2EvVku8ydU/J4rzovLCQ+Eujx7RJWFxJJsZR/EjjBbL0
 3Z9WVTLAAqVyR6xTmJ+GiB7TrJAmIQCPCfOtEcanqeWY6g84GDpCytppOJOaiXkq/YVNIH
 KH+KsnpJnc3kE/Kqri3ADs2F12yHBT5rUMewWknodtweizyVjYMjUjkI37KG0cMexuzAuD
 xxnrZjgv6GP28QA0SIwVRhOnP48BFTbdqNn4hnu6TyQchdmtp2cdhEJrTKRfrg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fPHbkzVj;
 spf=pass (outgoing_mbo_mout: domain of phasta@mailbox.org designates
 2001:67c:2050:b231:465::1 as permitted sender)
 smtp.mailfrom=phasta@mailbox.org
Message-ID: <0e58a96e61054ae88de112cb8be7e45e2b6f4f0c.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752665566; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMGfdoOoS6iQPCr/bywDVwi8zs4P0HQGhorIHlY9F0Y=;
 b=fPHbkzVjDz1UnCrUjS+ABf7uUQCb09yoiyiqZmhcYhqyHArLVUWMZlvE4DzGTmd7jHxzTd
 xwucBFJh4lxed7tnPztrO5ZCy3AoZcFpGjZIHkqiF4KRcaeSoVo0+P/q24VHe0sKdlibdC
 fZpl0v15FIq0r/m1Tikqj4qXRQsIdjjwipOMrkNJUtPcH8WldUzPwSIcppUZ9DO7DpmQ+u
 PLBrMzSDEZSZ41MO/yMi3Urs/bBjdiS5/dC04LqRvoe60ja+znvbV+q9lJFYXLMh05SPbw
 mx9MlGfNlIiOCXiZqjXkK9TvzajgulFW9pc7DsZewdWmmmVhhGnQwMVdAUO0hg==
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: phasta@kernel.org, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>, "cao, lin" <lin.cao@amd.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Yin,
 ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,  "Deng, Emily"
 <Emily.Deng@amd.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>, Sasha Levin
 <sashal@kernel.org>
Date: Wed, 16 Jul 2025 13:32:42 +0200
In-Reply-To: <2025071635-petition-unhitched-bdd0@gregkh>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
 <fd46ca0c-e484-4bf8-b74e-0139ecc7deae@mailbox.org>
 <49d822fc0f46e0fdeaccaeb2fbb1ade1c5cb1e5d.camel@mailbox.org>
 <ff383098-b453-44bd-9862-c6fc1447cf1d@amd.com>
 <2025071635-petition-unhitched-bdd0@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 758d3edeb2c9d6dc96d
X-MBO-RS-META: pf8mu6ehkws4qaansn1j83h9m9mryx1f
X-Rspamd-Queue-Id: 4bhv745ktbz9sm3
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

On Wed, 2025-07-16 at 13:15 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 16, 2025 at 12:58:28PM +0200, Christian K=C3=B6nig wrote:
> > On 16.07.25 12:46, Philipp Stanner wrote:
> > > +Cc Greg, Sasha
> > >=20
> > > On Wed, 2025-07-16 at 12:40 +0200, Michel D=C3=A4nzer wrote:
> > > > On 16.07.25 11:57, Philipp Stanner wrote:
> > > > > On Wed, 2025-07-16 at 09:43 +0000, cao, lin wrote:
> > > > > >=20
> > > > > > Hi Philipp,
> > > > > >=20
> > > > > >=20
> > > > > > Thank you for the review. I found that this optimization
> > > > > > was
> > > > > > introduced 9 years ago in commit
> > > > > > 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu: drop
> > > > > > a
> > > > > > dummy
> > > > > > wakeup scheduler").
> > > > > >=20
> > > > > >=20
> > > > > > Given that the=C2=A0codebase has undergone significant changes
> > > > > > over
> > > > > > these
> > > > > > 9 years. May I ask if I still need to include the Fixes:
> > > > > > tag?
> > > > >=20
> > > > > Yes. It's a helpful marker to see where the problem comes
> > > > > from, and
> > > > > it
> > > > > adds redundancy helping the stable-kernel maintainers in
> > > > > figuring
> > > > > out
> > > > > to which kernels to backport it to.
> > > > >=20
> > > > > If stable can't apply a patch to a very old stable kernel
> > > > > because
> > > > > the
> > > > > code base changed too much, they'll ping us and we might
> > > > > provide a
> > > > > dedicated fix.
> > > > >=20
> > > > > So like that:
> > > > >=20
> > > > > Cc: stable@vger.kernel.org=C2=A0# v4.6+
> > > > > Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup
> > > > > scheduler")
> > > >=20
> > > > FWIW, Fixes: alone is enough for getting backported to stable
> > > > branches, Cc: stable is redundant with it.
> > >=20
> > > Both are used all the time together, though. And the official
> > > documentation does not list dropping Cc: stable as a valid option
> > > in
> > > this regard
> > >=20
> > > https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml#option-1
> > >=20
> > >=20
> > > As long as the official documentation demands it, I'm not willing
> > > to
> > > drop it. If the docu were to be changed, that would be fine by
> > > me, too.
> >=20
> > As far as I understand "CC: stable" and "Fixes:" tags are to handle
> > two distinct use cases.
>=20
> Yes.
>=20
> > "CC: stable..." means please backport, eventually with a kernel
> > version and/or necessary pre-requisites.
>=20
> Yes.
>=20
> > "Fixes:" only backport if you have this patch in your tree as well.
> > In other words it is a restriction when to backport something.
>=20
> No.
>=20
> "Fixes:" is only for you to say "this commit fixes this other
> commit".
> And when you add a cc: stable, that will get you a FAILED email if
> the
> commit does NOT apply that far back.

Does that mean we should NOT add Fixes: if the fixing patch does not
apply on top of that old commit?

And if so, should we drop the Fixes: tag completely in such cases as
Lin suggested in this thread?


P.

>=20
> "Fixes:" on its own does NOT mean it will ever be backported to the
> stable trees.=C2=A0 But because so many people KEEP GETTING THIS WRONG
> (despite cc: stable@ happening first in history _before_ Fixes: came
> about), we do try to sweep the tree every so often and do a "best
> effort" backport of those only marked with Fixes:
>=20
> But that happens later, if at all, and you do NOT get a FAILED email
> if
> a patch does not apply to a stable branch.
>=20
> So ALWAYS use cc: stable@ for something you want backported to stable
> kernels.=C2=A0 That's what the documentation states, and is what we have
> been
> doing for 15+ years now (is it 20?).
>=20
> thanks,
>=20
> greg k-h

