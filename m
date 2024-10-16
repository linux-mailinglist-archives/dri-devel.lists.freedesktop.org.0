Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA44A9A0BE8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E784610E70A;
	Wed, 16 Oct 2024 13:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=erik.faye-lund@collabora.com header.b="L9y6QOtZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2503010E70A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:51:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729086660; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XOBDpFWf96pcUWrMjW6umGFGhBsC/mA7961FRGSeStDyYoEA3MGj6CddpDIyqp+YWkNHk2ZqCcX7qVvzVl5IgnWSdFYimJvWZiUnGw03IN6bOrDq2/Lg3bOpjCI/ImLVn/pMig00DVvdVtltghR09e13YASKFSAJfZJ1Rh9mY/0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729086660;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=W4BbNuxWHkxAZpAHutKfJ6e2/XQiEilqV2sXY6EC67E=; 
 b=ATD0V41FbBm/5yFPSm0D6akI9sPFDzGV1HBcuygy6sI63PjUOr3ZFsdp87ZMjP3Checu1bF3Lp9FQGUmiHhRPHnPUTS7S3/BDXmYxrOJu06JCAvpk4msCwDlzlOen5tHckt3ZuYadaJmXXFyhkwX25QrkqnVuLWUND0zWf/NkcM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=erik.faye-lund@collabora.com;
 dmarc=pass header.from=<erik.faye-lund@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729086660; 
 s=zohomail; d=collabora.com; i=erik.faye-lund@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=W4BbNuxWHkxAZpAHutKfJ6e2/XQiEilqV2sXY6EC67E=;
 b=L9y6QOtZ80AnuCKlYMQMDyKfM5ZduGGbYmMRQXYuwGSkFZR5GEQb2f8xa2NA1gir
 DqDFDCiHHHuyu056wAa5fBdsBAqicgVzbS9wUZn4BKehqdHfmDLrkx8VPL/8xWjEPKG
 fvJV4x07fu/TKPKZAVfMy+Hb1bwfOKtgsUcfx3fk=
Received: by mx.zohomail.com with SMTPS id 1729086659264725.0178944186945;
 Wed, 16 Oct 2024 06:50:59 -0700 (PDT)
Message-ID: <1bd37b18455607b709529c8def963c4561e2ff1e.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
From: Erik Faye-Lund <erik.faye-lund@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 dri-devel@lists.freedesktop.org
Cc: Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Chris Diamand	 <chris.diamand@foss.arm.com>, Ketil
 Johnsen <ketil.johnsen@arm.com>
Date: Wed, 16 Oct 2024 15:50:55 +0200
In-Reply-To: <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
 <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
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

On Wed, 2024-10-16 at 15:16 +0200, Erik Faye-Lund wrote:
> On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon wrote:
> > +/**
> > + * enum drm_panthor_sync_op_flags - Synchronization operation
> > flags.
> > + */
> > +enum drm_panthor_sync_op_flags {
> > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization
> > handle type mask. */
> > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK =3D 0xff,
> > +
> > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
> > Synchronization object type. */
> > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ =3D 0,
> > +
> > +	/**
> > +	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> > Timeline synchronization
> > +	 * object type.
> > +	 */
> > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ =3D 1,
> > +
> > +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> > +	DRM_PANTHOR_SYNC_OP_WAIT =3D 0 << 31,
> > +
> > +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> > +	DRM_PANTHOR_SYNC_OP_SIGNAL =3D (int)(1u << 31),
>=20
> Why do we cast to int here? 1u << 31 doesn't fit in a 32-bit signed
> integer, so isn't this undefined behavior in C?
>=20

Seems this was proposed here:
https://lore.kernel.org/dri-devel/89be8f8f-7c4e-4efd-0b7b-c30bcfbf1d23@arm.=
com/

...that kinda sounds like bad advice to me.

Also, it's been pointed out to me elsewhere that this isn't
*technically speaking* undefined, it's "implementation defined". But as
far as kernel interfaces goes, that's pretty much the same; we can't
guarantee that the kernel and the user-space is using the same
implementation.

Here's the quote from the C99 spec, section 6.3.1.3 "Signed and
unsigned integers":

"""
Otherwise, the new type is signed and the value cannot be represented
in it; either the result is implementation-defined or an
implementation-defined signal is raised
""""

I think a better approach be to use -1 << 31, which is well-defined.
But the problem then becomes assigning it into
drm_panthor_sync_op::flags in a well-defined way... Could we make the
field signed? That seems a bit bad as well...
