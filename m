Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEDB90AFC6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1A410E3CF;
	Mon, 17 Jun 2024 13:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="MhZhQSod";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F2210E3CF;
 Mon, 17 Jun 2024 13:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1718631796; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Hokgeck+Y8PouhlrlJ4mIrhR0wChdzLv1Tn3iKLa2QeUgeI/3ij+hqsQFiEStPjWqBFsT+LZRD/r5ubZpGFN9WG4OMHnAGWZqLeWcSaJecefvTBgyEHcDdivgMGctiqYCP5j2baOA3hIEau4SPngxRUkgGuztxEzJ6APxDexfG4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1718631796;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=c1E9WBMtpBHWD0CIJK7m5aHMGnrQFnw/g0UX/IVKAuk=; 
 b=YWPfDz34xWwrGHwqJEkIi8FN4QENpZj8WRDrU9j9O3HaFsVc2liixk8GaZX70QhhMAyQwiZNgPZ4AtgE3acfIRH6EyFLtOKUNrbGxWG+ikq8SPmLwEadiVSeBHehvi3wg4OPi+WsGEgXowxLzNYxZV2J37xDZGFE0LkTAbmu+v0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718631796; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=c1E9WBMtpBHWD0CIJK7m5aHMGnrQFnw/g0UX/IVKAuk=;
 b=MhZhQSodKoduTW+7fwvyLqLSoTySqeH1oNRkj2hDaMwXVYxzW1eiPy+wd21sforu
 CqT5Svuevqs8B0ZqG+D8nemWSjGEsieCLyE7YPXUA0rWDWczBuyl3xriRzIBLzIs5ax
 MtgiM2uVGrA2qMOVd4/3orR8nw/QExLcGr8FFsoFWNOzRuQrhpbHlYMZD1+TDXPIQux
 6q3plFohBTVAAlzAWxxHCbYHfboTIt1fv3+LyuQN+Qb0DZbHTq58oMGPNT+0ox/T5vx
 TlT+23b79pAx+wr1fSebwce4u5hCV2sZHxJQkR9NBXV4gpxCvmFPhC8Ulh+jTG0LQL8
 O2sufHV9ZA==
Received: by mx.zohomail.com with SMTPS id 1718631794981796.3743031204694;
 Mon, 17 Jun 2024 06:43:14 -0700 (PDT)
Message-ID: <e88d4722fa3bbd7104b140debdd85cb212628944.camel@icenowy.me>
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
Date: Mon, 17 Jun 2024 21:43:08 +0800
In-Reply-To: <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
References: <20240617105846.1516006-1-uwu@icenowy.me>
 <20240617105846.1516006-2-uwu@icenowy.me>
 <88337509-3ad7-47aa-b70f-5294f7f1e486@amd.com>
 <b4ebdbce2f44c06806a650e72b1b6eb9a16dffe6.camel@icenowy.me>
 <09fbcd1f-c7b1-47e3-9146-17f8189978a8@amd.com>
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

=E5=9C=A8 2024-06-17=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 15:09 +0200=EF=BC=
=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> Am 17.06.24 um 15:03 schrieb Icenowy Zheng:
> > =E5=9C=A8 2024-06-17=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 14:35 +0200=EF=
=BC=8CChristian K=C3=B6nig=E5=86=99=E9=81=93=EF=BC=9A
> > > Am 17.06.24 um 12:58 schrieb Icenowy Zheng:
> > > > The duplication of EOP packets for GFX7/8, with the former one
> > > > have
> > > > seq-1 written and the latter one have seq written, seems to
> > > > confuse
> > > > some
> > > > hardware platform (e.g. Loongson 7A series PCIe controllers).
> > > >=20
> > > > Make the content of the duplicated EOP packet the same with the
> > > > real
> > > > one, only masking any possible interrupts.
> > > Well completely NAK to that, exactly that disables the
> > > workaround.
> > >=20
> > > The CPU needs to see two different values written here.
> > Why do the CPU need to see two different values here? Only the
> > second
> > packet will raise an interrupt before and after applying this
> > patch,
> > and the first packet's result should just be overriden on ordinary
> > platforms. The CPU won't see the first one, until it's polling for
> > the
> > address for a very short interval, so short that the GPU CP
> > couldn't
> > execute 2 commands.
>=20
> Yes exactly that. We need to make two writes, one with the old value=20
> (seq - 1) and a second with the real value (seq).
>=20
> Otherwise it is possible that a polling CPU would see the sequence=20
> before the second EOP is issued with results in incoherent view of
> memory.

In this case shouldn't we write seq-1 before any work, and then write
seq after work, like what is done in Mesa?

As what I see, Mesa uses another command buffer to emit a
EVENT_WRITE_EOP writing 0, and commit this command buffer before the
real command buffer.

>=20
> > Or do you mean the GPU needs to see two different values being
> > written,
> > or they will be merged into only one write request?
> >=20
> > Please give out more information about this workaround, otherwise
> > the
> > GPU hang problem on Loongson platforms will persist.
>=20
> Well if Loongson can't handle two consecutive write operations to the
> same address with different values then you have a massive platform
> bug.

I think the issue is triggered when two consecutive write operations
and one IRQ is present, which is exactly the case of this function.

>=20
> That is something which can happen all the time throughout the
> operation.
>=20
> Regards,
> Christian.
>=20
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > Fixes: bf26da927a1c ("drm/amdgpu: add cache flush workaround to
> > > > gfx8 emit_fence")
> > > > Fixes: a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts")
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 12 +++++------=
-
> > > > =C2=A0=C2=A0 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 12 ++++-------=
-
> > > > =C2=A0=C2=A0 2 files changed, 9 insertions(+), 15 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > > > b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > > > index 541dbd70d8c75..778f27f1a34fe 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > > > @@ -2117,9 +2117,8 @@ static void
> > > > gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64
> > > > addr,
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool write64b=
it =3D flags & AMDGPU_FENCE_FLAG_64BIT;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool int_sel =
=3D flags & AMDGPU_FENCE_FLAG_INT;
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Workaround for cache =
flush problems. First send a
> > > > dummy
> > > > EOP
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * event down the pipe w=
ith seq one below.
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Workaround for cache =
flush problems, send EOP twice.
> > > > */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring,
> > > > PACKET3(PACKET3_EVENT_WRITE_EOP,
> > > > 4));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring, (EOP_TCL1_ACTION_EN |
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EOP_TC_ACTION_EN =
|
> > > > @@ -2127,11 +2126,10 @@ static void
> > > > gfx_v7_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64
> > > > addr,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EVENT_INDEX(5)));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring, addr & 0xfffffffc);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring, (upper_32_bits(addr) & 0xffff)
> > > > |
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DATA_SEL(1) | INT_SEL(0));
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_write(ring, =
lower_32_bits(seq - 1));
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_write(ring, =
upper_32_bits(seq - 1));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DATA_SEL(write64bit ? 2 : 1) |
> > > > INT_SEL(0));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_write(ring, =
lower_32_bits(seq));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_write(ring, =
upper_32_bits(seq));
> > > > =C2=A0=C2=A0=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Then send the real EO=
P event down the pipe. */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring,
> > > > PACKET3(PACKET3_EVENT_WRITE_EOP,
> > > > 4));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring, (EOP_TCL1_ACTION_EN |
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EOP_TC_ACTION_EN =
|
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > > > b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > > > index 2f0e72caee1af..39a7d60f1fd69 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > > > @@ -6153,9 +6153,7 @@ static void
> > > > gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64
> > > > addr,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool write64b=
it =3D flags & AMDGPU_FENCE_FLAG_64BIT;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool int_sel =
=3D flags & AMDGPU_FENCE_FLAG_INT;
> > > > =C2=A0=C2=A0=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Workaround for cache =
flush problems. First send a
> > > > dummy
> > > > EOP
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * event down the pipe w=
ith seq one below.
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Workaround for cache =
flush problems, send EOP twice.
> > > > */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring,
> > > > PACKET3(PACKET3_EVENT_WRITE_EOP,
> > > > 4));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring, (EOP_TCL1_ACTION_EN |
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EOP_TC_ACTION_EN =
|
> > > > @@ -6164,12 +6162,10 @@ static void
> > > > gfx_v8_0_ring_emit_fence_gfx(struct amdgpu_ring *ring, u64
> > > > addr,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EVENT_INDEX(5)));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring, addr & 0xfffffffc);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring, (upper_32_bits(addr) & 0xffff)
> > > > |
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DATA_SEL(1) | INT_SEL(0));
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_write(ring, =
lower_32_bits(seq - 1));
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_write(ring, =
upper_32_bits(seq - 1));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 DATA_SEL(write64bit ? 2 : 1) |
> > > > INT_SEL(0));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_write(ring, =
lower_32_bits(seq));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_write(ring, =
upper_32_bits(seq));
> > > > =C2=A0=C2=A0=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Then send the real EO=
P event down the pipe:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * EVENT_WRITE_EOP - flu=
sh caches, send int */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring,
> > > > PACKET3(PACKET3_EVENT_WRITE_EOP,
> > > > 4));
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0amdgpu_ring_w=
rite(ring, (EOP_TCL1_ACTION_EN |
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EOP_TC_ACTION_EN =
|
>=20

