Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB3BA89EA4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4B110E782;
	Tue, 15 Apr 2025 12:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="XCrIF9p3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2A410E782;
 Tue, 15 Apr 2025 12:54:44 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZcPJ012q5z9sWs;
 Tue, 15 Apr 2025 14:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1744721680; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/FjfTvH1QRy7+t7pKsVPI8IS+WdkLH8SmEYGjRagwA=;
 b=XCrIF9p3qYjPKTa32Gt7lp4HeMkDbm5dXf4RLEonFk06uMtAbMgwWXkjqIR46XbE713xqz
 fE+SUU+xAn8sk/b6kuU1QEsyKqCPGFGcf6BTCFUdf8HSZp+Mp9hdtWimDXXroOW1Mq2AjZ
 6jpgBk+8cNhNmmeUcj389vv5NY/mtZS/M49hR3sJDMwWdOajQ1vJgMQMIfi7puukA2q1fk
 5oE+49W2M17Uw4RWT+8aoaPjxvUsqm1RjXc1dXF84SCY/AYVTESxoXiWFzmNmy0ti3MLW2
 eUDUqZCbc4KMM3sxTi53SRCABrFe7asAgwL0ryWhoWQ3NNP7zA++k90ukumh0A==
Message-ID: <573a616a5270d97f421a380e2e41c7e35d2f03e3.camel@mailbox.org>
Subject: Re: [PATCH 1/3] drm/nouveau: Prevent signaled fences in pending list
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Sabrina Dubroca <sd@queasysnail.net>, Sumit
 Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
Date: Tue, 15 Apr 2025 14:54:36 +0200
In-Reply-To: <2dba3077-a770-4e00-9a7a-c744096ae876@amd.com>
References: <8583665a-6886-4245-be49-fd8839cfe212@amd.com>
 <c737c89c7ce9174e349c61ab4e5712eee8946f13.camel@mailbox.org>
 <50c9530d-e274-4f89-8620-16afe0981239@amd.com>
 <1a73e5fe4350d6ee4b7d807612264eb637c4f2a9.camel@mailbox.org>
 <d3dee321cd6b70d6ca98768fbcf6f1e6134c43a1.camel@mailbox.org>
 <81a70ba6-94b1-4bb3-a0b2-9e8890f90b33@amd.com>
 <aca00cb25b813da4fd2f215829f02337f05642f3.camel@mailbox.org>
 <45d66ca4-5390-42e9-869a-f5f9125d05b6@amd.com>
 <1127db242503055b2e5e8d07db3aeae46cfb7a24.camel@mailbox.org>
 <6e4628c3cfc7e0d1e4ea9af510ce0b09b34a8cf8.camel@mailbox.org>
 <Z_0bOgTBkkRH9jib@cassiopeiae>
 <2dba3077-a770-4e00-9a7a-c744096ae876@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 8it8cuy3unipa6fs4gcxd9fju5nkgkz1
X-MBO-RS-ID: 9a0b51d9a94caabfc13
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

On Tue, 2025-04-15 at 11:56 +0200, Christian K=C3=B6nig wrote:
> Am 14.04.25 um 16:27 schrieb Danilo Krummrich:
> > On Mon, Apr 14, 2025 at 10:54:25AM +0200, Philipp Stanner wrote:
> > > @Danilo:
> > > We have now 2 possible solutions for the firing WARN_ON floating.
> > >=20
> > > Version A (Christian)
> > > Check in nouveau_fence_context_kill() whether a fence is already
> > > signaled before setting an error.
> > >=20
> > > Version B (Me)
> > > This patch series here. Make sure that in Nouveau, only
> > > nouveau_fence_signal() signals fences.
> > >=20
> > >=20
> > > Both should do the trick. Please share a maintainer-preference so
> > > I can
> > > move on here.
> > Thanks for working on this Philipp.
> >=20
> > If you don't want to rework things entirely, A seems to be
> > superior, since it
> > also catches the case when someone else would call
> > dma_fence_is_signaled() on a
> > nouveau fence (which could happen at any time). This doesn't seem
> > to be caught
> > by B, right?
>=20
> Correct, yes. I would also keep it as simple as possible for
> backporting this bug fix.
>=20
> On the other hand a rework is certainly appropriate including both
> nouveau as well as the DMA-fence calling rules. Especially that the
> DMA-fence framework calls the signaled callback with inconsistent
> locking is something we should fix.

Do you have a suggestion where to start?

I btw would still be interested in adding some sort of centralized
mechanism in dma_fence that the driver could use to do some cleanup
stuff once a fence gets signaled ^_^

P.

>=20
> Regards,
> Christian.

