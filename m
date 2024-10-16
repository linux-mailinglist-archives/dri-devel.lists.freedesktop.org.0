Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4197F9A0C3F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 16:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C5910E02D;
	Wed, 16 Oct 2024 14:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="RI2aGP87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B3210E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 14:07:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729087632; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GfWsEYMW4zWMc8Ds6QqX4vwaIOzCDheE5yEPs8Rv3nDAalz4ZZIf2hpH9xH+Fuc8YQNea4Vyl+Mtd/UOh1WnC7EoXTGENIjwhYPkq6bBwFOv5f+9t1dfIttCMEgyk683MmrimqBKv0vU7AWlbcc510RknCXoZVforL3a791G/3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729087632;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8PGyjMMLI0XGsbsIzYvLSfi2as1lrWOP7zlBaVgkL5I=; 
 b=ErcTQkdWBcEiOQpyUHBwISMT2/9C/pERN1O/mhU9K7E0q9kZAVDw7oJeHqCUKgFgbs/s7vlnhA27tcMdpsTSkgVf+VCcMVM4FT1vaopp170xzBHpcs0i72PnYm6HISEwCGUc3ybeHEvB3vWj5zmJ9PUwQ36ofJMzCgHv+BAGHFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
 dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729087632; 
 s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=8PGyjMMLI0XGsbsIzYvLSfi2as1lrWOP7zlBaVgkL5I=;
 b=RI2aGP878P+KjjDjwmUGbL0kae52+6PmLgrR1SkHpSbUR7bdF04+88EObSB6wWK5
 4+jU/DUJPLl0RyqbHlGngmdZ15BQ/rDFh5Ecti4VHT2Qi/lwu2mDRUtZKNrkrjFDZn4
 kgAIawR4L2kfNKDW7GSWiHyMBl+ONKk1yPMeQ5+0=
Received: by mx.zohomail.com with SMTPS id 1729087629867153.27078066601246;
 Wed, 16 Oct 2024 07:07:09 -0700 (PDT)
Message-ID: <8212bbc06f59b4004b8cba1a9ef621edb54f595f.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>, 
 Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, 	kernel@collabora.com, Chris Diamand
 <chris.diamand@foss.arm.com>, Ketil Johnsen	 <ketil.johnsen@arm.com>
Date: Wed, 16 Oct 2024 16:07:06 +0200
In-Reply-To: <20241016154747.336db4fb@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
 <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
 <20241016154747.336db4fb@collabora.com>
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

On Wed, 2024-10-16 at 15:47 +0200, Boris Brezillon wrote:
> On Wed, 16 Oct 2024 15:16:22 +0200
> Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:
>=20
> > On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon wrote:
> > > +/**
> > > + * enum drm_panthor_sync_op_flags - Synchronization operation
> > > flags.
> > > + */
> > > +enum drm_panthor_sync_op_flags {
> > > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK:
> > > Synchronization
> > > handle type mask. */
> > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK =3D 0xff,
> > > +
> > > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
> > > Synchronization object type. */
> > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ =3D 0,
> > > +
> > > +	/**
> > > +	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> > > Timeline synchronization
> > > +	 * object type.
> > > +	 */
> > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ =3D 1,
> > > +
> > > +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> > > +	DRM_PANTHOR_SYNC_OP_WAIT =3D 0 << 31,
> > > +
> > > +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> > > +	DRM_PANTHOR_SYNC_OP_SIGNAL =3D (int)(1u << 31),=C2=A0=20
> >=20
> > Why do we cast to int here? 1u << 31 doesn't fit in a 32-bit signed
> > integer, so isn't this undefined behavior in C?
> >=20
> > I'm asking, because Coverity complains about overflows when we
> > assign
> > the value to drm_panthor_sync_op::flags in Mesa, and looking at
> > it...
> > it seems to be right in complaining!
> >=20
> > For reference, here's the Coverity issue (requires login,
> > unfortunately):
> > https://scan5.scan.coverity.com/#/project-view/59795/10037?selectedIssu=
e=3D1605083
> >=20
>=20
> The cast was originally suggested here [1]. If we don't want to rely
> on gcc/llvm implementation of this UB, I guess the only option is to
> redefine those enums as #defines.
>=20
> [1]
> https://lore.kernel.org/dri-devel/89be8f8f-7c4e-4efd-0b7b-c30bcfbf1d23@ar=
m.com
> /
>=20

I think we could either do the defines, or use "-1 << 31", with a
comment to explain what's going on. Either works for me.
