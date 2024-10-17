Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C69A1F90
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 12:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A83010E315;
	Thu, 17 Oct 2024 10:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="G4yNOPp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F15510E315
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 10:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729160158; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JUxYC2LV+7BPrYu+du4oh35lUClqj5eO0MW1H2MB8RID4KjbIzA7eeqUJLWfcGS6CgoxXXUciHxo6kBcU1OqtbCt66Sr5tG6lKmMcStM/FlgAQtvVXwwrY3T32H0DVRnFKqfAMTjN/ArR2Ul0DfQqjaPi2Z+cl7FND7Duw95SbU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729160158;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=P4npK6KjoSPa7jwQy5A5ZKaLuXdZEaNBMVY7RcdeAJQ=; 
 b=cpfg2RI5SNWyRdNxrS3V1+i0bvN1naxUgmmezPmvfZLDk6kFYZBMdqO42iI8oek7BZUZMfFul3EP6fjODjPDLQ9fUk5zlbJywXlsRvV+63xW9vrN/iCkoRDJR5J+QoR2z6uAjUxLV3OPjkvEJs5NWlX5ua3VhCM4qtBHdLj0+TY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
 dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729160158; 
 s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=P4npK6KjoSPa7jwQy5A5ZKaLuXdZEaNBMVY7RcdeAJQ=;
 b=G4yNOPp790e4/Euovz76O2fj4lHJQ/zs278OHHxkKjt4YGj42sPqNmrt4Ml6Egv7
 FpE4kpoqdCCoxoiQLXZ/n1Rxm3v58TGlcgrYHu8SQta+iHMlck/ECSJuDcG2O+jTyWc
 RXwkhUowDBojce0AvomVAhxxXlVSaklFqwv40Pgc=
Received: by mx.zohomail.com with SMTPS id 1729160155942313.91293706336853;
 Thu, 17 Oct 2024 03:15:55 -0700 (PDT)
Message-ID: <a4ab8336641158eca5106279547af5a6e9b3754c.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org, 
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, 	kernel@collabora.com, Chris Diamand
 <chris.diamand@foss.arm.com>, Ketil Johnsen	 <ketil.johnsen@arm.com>
Date: Thu, 17 Oct 2024 12:15:52 +0200
In-Reply-To: <20241017120847.02b6db35@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
 <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
 <1bd37b18455607b709529c8def963c4561e2ff1e.camel@collabora.com>
 <abded30f-3333-49e5-aac2-8da6ac64903b@arm.com>
 <da2c1dcbefcc25760d6a452e04d870987daf0a27.camel@collabora.com>
 <20241016161833.574494ee@collabora.com>
 <e4cd985a471f4ab787ac002ae67e957ee85ede85.camel@collabora.com>
 <20241017120847.02b6db35@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 (by Flathub.org) 
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

On Thu, 2024-10-17 at 12:08 +0200, Boris Brezillon wrote:
> On Thu, 17 Oct 2024 10:51:32 +0200
> Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:
>=20
> > On Wed, 2024-10-16 at 16:18 +0200, Boris Brezillon wrote:
> > > On Wed, 16 Oct 2024 16:05:55 +0200
> > > Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:
> > > =C2=A0=20
> > > > On Wed, 2024-10-16 at 15:02 +0100, Robin Murphy wrote:=C2=A0=20
> > > > > On 2024-10-16 2:50 pm, Erik Faye-Lund wrote:=C2=A0=C2=A0=C2=A0=
=20
> > > > > > On Wed, 2024-10-16 at 15:16 +0200, Erik Faye-Lund wrote:=C2=A0=
=C2=A0=C2=A0
> > > > > > > On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon
> > > > > > > wrote:=C2=A0=C2=A0=C2=A0=20
> > > > > > > > +/**
> > > > > > > > + * enum drm_panthor_sync_op_flags - Synchronization
> > > > > > > > operation
> > > > > > > > flags.
> > > > > > > > + */
> > > > > > > > +enum drm_panthor_sync_op_flags {
> > > > > > > > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK:
> > > > > > > > Synchronization
> > > > > > > > handle type mask. */
> > > > > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK =3D 0xff,
> > > > > > > > +
> > > > > > > > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
> > > > > > > > Synchronization object type. */
> > > > > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ =3D 0,
> > > > > > > > +
> > > > > > > > +	/**
> > > > > > > > +	 *
> > > > > > > > @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> > > > > > > > Timeline synchronization
> > > > > > > > +	 * object type.
> > > > > > > > +	 */
> > > > > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCO
> > > > > > > > BJ =3D
> > > > > > > > 1,
> > > > > > > > +
> > > > > > > > +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation.
> > > > > > > > */
> > > > > > > > +	DRM_PANTHOR_SYNC_OP_WAIT =3D 0 << 31,
> > > > > > > > +
> > > > > > > > +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal
> > > > > > > > operation.
> > > > > > > > */
> > > > > > > > +	DRM_PANTHOR_SYNC_OP_SIGNAL =3D (int)(1u <<
> > > > > > > > 31),=C2=A0=C2=A0=C2=A0=20
> > > > > > >=20
> > > > > > > Why do we cast to int here? 1u << 31 doesn't fit in a 32-
> > > > > > > bit
> > > > > > > signed
> > > > > > > integer, so isn't this undefined behavior in C?
> > > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > >=20
> > > > > > Seems this was proposed here:
> > > > > > https://lore.kernel.org/dri-devel/89be8f8f-7c4e-4efd-0b7b-c30bc=
fbf1d23@arm.com/
> > > > > >=20
> > > > > > ...that kinda sounds like bad advice to me.
> > > > > >=20
> > > > > > Also, it's been pointed out to me elsewhere that this isn't
> > > > > > *technically speaking* undefined, it's "implementation
> > > > > > defined".
> > > > > > But as
> > > > > > far as kernel interfaces goes, that's pretty much the same;
> > > > > > we
> > > > > > can't
> > > > > > guarantee that the kernel and the user-space is using the
> > > > > > same
> > > > > > implementation.
> > > > > >=20
> > > > > > Here's the quote from the C99 spec, section 6.3.1.3 "Signed
> > > > > > and
> > > > > > unsigned integers":
> > > > > >=20
> > > > > > """
> > > > > > Otherwise, the new type is signed and the value cannot be
> > > > > > represented
> > > > > > in it; either the result is implementation-defined or an
> > > > > > implementation-defined signal is raised
> > > > > > """"
> > > > > >=20
> > > > > > I think a better approach be to use -1 << 31, which is
> > > > > > well-
> > > > > > defined.
> > > > > > But the problem then becomes assigning it into
> > > > > > drm_panthor_sync_op::flags in a well-defined way... Could
> > > > > > we
> > > > > > make
> > > > > > the
> > > > > > field signed? That seems a bit bad as well...=C2=A0=C2=A0=C2=A0=
=20
> > > > >=20
> > > > > Is that a problem? Signed->unsigned conversion is always
> > > > > well-
> > > > > defined
> > > > > (6.3.1.3 again), since it doesn't depend on how the signed
> > > > > type=20
> > > > > represents negatives.
> > > > >=20
> > > > > Robin.=C2=A0=C2=A0=C2=A0=20
> > > >=20
> > > > Ah, you're right. So that could fix the problem, indeed.=C2=A0=20
> > >=20
> > > On the other hand, I hate the idea of having -1 << 31 to encode
> > > bit31-set. That's even worse for DRM_PANTHOR_VM_BIND_OP_TYPE_xxx
> > > when
> > > we'll reach a value above 0x7, because then the negative value is
> > > hard
> > > to map to its unsigned representation. If we really care about
> > > this
> > > corner case, I'd rather go full-defines for flags and call it a
> > > day.
> > > =C2=A0=20
> >=20
> > Yeah, I suppose it can get ugly for some other cases.
> >=20
> > If we rule that out, I think there's only two options I can think
> > of
> > left:
> >=20
> > 1. Using #defines instead, like Boris suggested
> > 2. Using 64 bit signed enums (e.g "1ll << 31" instead)
> >=20
> > Again, #2 here would be the smaller change. But I kinda think I
> > lean
> > towards #1, because... These aren't really enumerators. They are
> > flags.
> >=20
> > ...Yeah, sure. In C the practical difference isn't huge. But if we
> > ever
> > wanted to support using these enums from C++ code, we'd need to add
> > overloaded operators, because C++ doesn't allow ORing together
> > enums
> > out of the box.
> >=20
> > I'm not saying I have any plans on using the uAPI from C++, just
> > saying
> > that if we're going to tackle this, we might as well tackle it
> > completely...
> >=20
> > Also, expanding the enum-type to 64 bits might have some additional
> > consequences, like needlessly needing more stack-space to pass
> > values
> > around etc.
> >=20
> > Thoughts?
>=20
> I'm leaning towards defines, because 64-bit enums are uncommon
> (FWIW, 'git grep "1ll << 31" include/uapi' returns nothing).

Agreed. Doing some grepping, it seems we're the *only* ones using the
current cast-through-int trickery. And there's *one* other driver using
the 1 << 31 with an enum (G2D_BUF_USERPTR in exynos_drm.h), which is
what was supposedly a problem with the original code.

All other 1 << 31 variants in the uapi folder are defines.

I'll type up a patch when I have some time.
