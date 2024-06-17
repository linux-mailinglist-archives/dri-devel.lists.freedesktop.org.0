Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450CC90B30D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4078710E127;
	Mon, 17 Jun 2024 14:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="d7aoavem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670FF10E127;
 Mon, 17 Jun 2024 14:57:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1718636245; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aNCwsYjfcRZ9W9NfNpaAN13uJi4YbDL3TikJmOLmLuplKVfdGGQHQqsdsD4NwiFL+mBbLyDSUWP48ft7r6TT8CGzpd8RuuMJyyMuvcnd0dTqeeve/E84mX3CtXnbJu88O65tMU/WrMETPZQBFX2Gr5Ta7AYVmrzuWNUVMbUR3/o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1718636245;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2mLJtNChd1G7wUJAeAvf58sTxBTG5cAWI0tJWUet3Oc=; 
 b=bSsgH0WC5JIDq6hceVUeNYRjJmIQ+IlsAA6LYAmbu/6nz1Nx0bBMYrwjUIglHr+awrHEqsEZdbJlUKKaR1Kc8xkR6IvjCZUNDFYcKhb+1aAfygqhGYIUYz9wGcJlfGAizjWhEmLvtwk2SPTfAdhBmScoEVXR8Vbnl+goIV8qnwA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718636245; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=2mLJtNChd1G7wUJAeAvf58sTxBTG5cAWI0tJWUet3Oc=;
 b=d7aoavemvLHEhRRSQFPSn8fybepuT4Dtm8eeMEMx8INiZVx8Yf5am9Bke1/ArJ5c
 GwNyRgmhEY3Zsy0bWKOTIQa6XflAiwJSqpYH1CerrqzNshRyNP+YDSefp6gokmSMNjm
 Nu1OLcZ+C94XHxOaZlGDgN6I7TXDwvway/B7EirJcdgxljzsRua0NKNYMdLMKlgPR2Z
 AF1vhRfd1PZdGJOIPG/Kd2nz8xe6pl/1ojhodn2OQ5rt+U0B7JJjKGHxLDNH1AlivAv
 ur6L9ikQl4Op+PkmbpYhU7UYKXdueifWwsPuWhi3ZWzoMrCly4VWpNaI3u/Hm9RCeIb
 QX+LFjnORQ==
Received: by mx.zohomail.com with SMTPS id 1718636244680837.8300130243035;
 Mon, 17 Jun 2024 07:57:24 -0700 (PDT)
Message-ID: <977af3daf5f7eb048eed0310bc93a321728b6106.camel@icenowy.me>
Subject: Re: [PATCH 1/2] drm/amdgpu: make duplicated EOP packet for GFX7/8
 have real content
From: Icenowy Zheng <uwu@icenowy.me>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pierre-Eric
 Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Date: Mon, 17 Jun 2024 22:57:19 +0800
In-Reply-To: <e7a814fc-7b1a-4e32-8868-292be004f920@amd.com>
References: <20240617105846.1516006-1-uwu@icenowy.me>
 <20240617105846.1516006-2-uwu@icenowy.me>
 <88337509-3ad7-47aa-b70f-5294f7f1e486@amd.com>
 <b4ebdbce2f44c06806a650e72b1b6eb9a16dffe6.camel@icenowy.me>
 <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
 <e88d4722fa3bbd7104b140debdd85cb212628944.camel@icenowy.me>
 <d44651a7-0c07-4b84-8828-f1d405359aeb@amd.com>
 <1e5f86991635b9045e91fab6397cda87555f85ff.camel@icenowy.me>
 <e7a814fc-7b1a-4e32-8868-292be004f920@amd.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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

=E5=9C=A8 2024-06-17=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 16:42 +0200=EF=BC=
=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> Am 17.06.24 um 16:30 schrieb Icenowy Zheng:
> > =E5=9C=A8 2024-06-17=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 15:59 +0200=EF=
=BC=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> > > Am 17.06.24 um 15:43 schrieb Icenowy Zheng:
> > > > =E5=9C=A8 2024-06-17=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 15:09 +020=
0=EF=BC=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> > > > > Am 17.06.24 um 15:03 schrieb Icenowy Zheng:
> > > > > > =E5=9C=A8 2024-06-17=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 14:35 =
+0200=EF=BC=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > Am 17.06.24 um 12:58 schrieb Icenowy Zheng:
> > > > > > > > The duplication of EOP packets for GFX7/8, with the
> > > > > > > > former
> > > > > > > > one
> > > > > > > > have
> > > > > > > > seq-1 written and the latter one have seq written,
> > > > > > > > seems to
> > > > > > > > confuse
> > > > > > > > some
> > > > > > > > hardware platform (e.g. Loongson 7A series PCIe
> > > > > > > > controllers).
> > > > > > > >=20
> > > > > > > > Make the content of the duplicated EOP packet the same
> > > > > > > > with
> > > > > > > > the
> > > > > > > > real
> > > > > > > > one, only masking any possible interrupts.
> > > > > > > Well completely NAK to that, exactly that disables the
> > > > > > > workaround.
> > > > > > >=20
> > > > > > > The CPU needs to see two different values written here.
> > > > > > Why do the CPU need to see two different values here? Only
> > > > > > the
> > > > > > second
> > > > > > packet will raise an interrupt before and after applying
> > > > > > this
> > > > > > patch,
> > > > > > and the first packet's result should just be overriden on
> > > > > > ordinary
> > > > > > platforms. The CPU won't see the first one, until it's
> > > > > > polling
> > > > > > for
> > > > > > the
> > > > > > address for a very short interval, so short that the GPU CP
> > > > > > couldn't
> > > > > > execute 2 commands.
> > > > > Yes exactly that. We need to make two writes, one with the
> > > > > old
> > > > > value
> > > > > (seq - 1) and a second with the real value (seq).
> > > > >=20
> > > > > Otherwise it is possible that a polling CPU would see the
> > > > > sequence
> > > > > before the second EOP is issued with results in incoherent
> > > > > view
> > > > > of
> > > > > memory.
> > > > In this case shouldn't we write seq-1 before any work, and then
> > > > write
> > > > seq after work, like what is done in Mesa?
> > > No. This hw workaround requires that two consecutive write
> > > operations
> > > happen directly behind each other on the PCIe bus with two
> > > different
> > > values.
> > Well to be honest the workaround code in Mesa seems to not be
> > working
> > in this way ...
>=20
> Mesa doesn't have any workaround for that hw issue, the code there
> uses=20
> a quite different approach.

Ah? Commit bf26da927a1c ("drm/amdgpu: add cache flush workaround to
gfx8 emit_fence") says "Both PAL and Mesa use it for gfx8 too, so port
this commit to gfx_v8_0_ring_emit_fence_gfx", so maybe the workaround
should just be not necessary here?


>=20
> > > To make the software logic around that work without any changes
> > > we
> > > use
> > > the values seq - 1 and seq because those are guaranteed to be
> > > different
> > > and not trigger any unwanted software behavior.
> > >=20
> > > Only then we can guarantee that we have a coherent view of system
> > > memory.
> > Any more details about it?
>=20
> No, sorry. All I know is that it's a bug in the cache flush logic
> which=20
> can be worked around by issuing two write behind each other to the
> same=20
> location.

So the issue is that the first EOP write does not properly flush the
cache? Could EVENT_WRITE be used instead of EVENT_WRITE_EOP in this
workaround to properly flush it without hurting the fence value?


>=20
> > BTW in this case, could I try to write it for 3 times instead of 2,
> > with seq-1, seq and seq?
>=20
> That could potentially work as well, but at some point we would need
> to=20
> increase the EOP ring buffer size or could run into performance
> issues.

Well I will try this. I think the buffer is enlarged in the original
workaround commit.

>=20
> > > > As what I see, Mesa uses another command buffer to emit a
> > > > EVENT_WRITE_EOP writing 0, and commit this command buffer
> > > > before
> > > > the
> > > > real command buffer.
> > > >=20
> > > > > > Or do you mean the GPU needs to see two different values
> > > > > > being
> > > > > > written,
> > > > > > or they will be merged into only one write request?
> > > > > >=20
> > > > > > Please give out more information about this workaround,
> > > > > > otherwise
> > > > > > the
> > > > > > GPU hang problem on Loongson platforms will persist.
> > > > > Well if Loongson can't handle two consecutive write
> > > > > operations to
> > > > > the
> > > > > same address with different values then you have a massive
> > > > > platform
> > > > > bug.
> > > > I think the issue is triggered when two consecutive write
> > > > operations
> > > > and one IRQ is present, which is exactly the case of this
> > > > function.
> > > Well then you have a massive platform bug.
> > >=20
> > > Two consecutive writes to the same bus address are perfectly
> > > legal
> > > from
> > > the PCIe specification and can happen all the time, even without
> > > this
> > > specific hw workaround.
> > Yes I know it, and I am not from Loongson, just some user trying to
> > mess around it.
>=20
> Well to be honest on a platform where even two consecutive writes to
> the=20
> same location doesn't work I would have strong doubts that it is
> stable=20
> in general.

Well I think the current situation is that the IRQ triggered by the
second EOP packet arrives before the second write is finished, not the
second write is totally dropped.

>=20
> Regards,
> Christian.

