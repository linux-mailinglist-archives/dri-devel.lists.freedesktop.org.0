Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270CDA921C2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 17:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C13310EB50;
	Thu, 17 Apr 2025 15:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TPexUOm2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AA010EB52
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744904260;
 bh=hM6kKC0/Gx7gAdKV9B/H2DjGQ5AtNwnZSoIsEPTqU7E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TPexUOm22/HwyuNFpEHu1pKKLCou20rp3bajTe1d+KIY91NeP+J4TNyuGN+2QLQMF
 7nha5Ja/4HglLnatlPms4f5ysuGHua0JM+5+36zVdpb7gPTYA0YhqsyIqh4UKYukvM
 x1/awqIo1eC/JANzln+Q+1h51H4ZJf7jNzrz2vsrQutKsnpxex87axtYAI4p7KX7gz
 06GeDKIRKkZRTT/birvnb82u/4hMP+GfFf0jfUhNGz83FUUl0AZTtVZwE0852xFhHk
 tS39Z/2iVl38qkMuF2bPsqtExOjALwNJBLSm0TBIKulixIJBbAOwRjToxpYTmibr7A
 lrK6ZcWmwlv5w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A376317E0FA5;
 Thu, 17 Apr 2025 17:37:40 +0200 (CEST)
Date: Thu, 17 Apr 2025 17:37:36 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 2/2] drm/panthor: Fix the user MMIO offset logic for
 emulators
Message-ID: <20250417173736.5eae4ee7@collabora.com>
In-Reply-To: <2b37d2cd-4d2e-4eb6-aa09-3887d1adb375@arm.com>
References: <20250417144907.3679831-1-boris.brezillon@collabora.com>
 <20250417144907.3679831-3-boris.brezillon@collabora.com>
 <2b37d2cd-4d2e-4eb6-aa09-3887d1adb375@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 17 Apr 2025 16:13:49 +0100
Steven Price <steven.price@arm.com> wrote:

> On 17/04/2025 15:49, Boris Brezillon wrote:
> > Currently, we pick the MMIO offset based on the size of the pgoff_t
> > type seen by the process that manipulates the FD, such that a 32-bit
> > process can always map the user MMIO ranges. But this approach doesn't
> > work well for emulators like FEX, where the emulator is a 64-bit binary
> > which might be executing 32-bit code. In that case, the kernel thinks
> > it's the 64-bit process and assumes DRM_PANTHOR_USER_MMIO_OFFSET_64BIT
> > is in use, but the UMD library expects DRM_PANTHOR_USER_MMIO_OFFSET_32B=
IT,
> > because it can't mmap() anything above the pgoff_t size.
> >=20
> > In order to solve that, we need a way to explicitly set the user MMIO
> > offset from the UMD, such that the kernel doesn't have to guess it
> > from the TIF_32BIT flag set on user thread. We keep the old behavior
> > if DRM_PANTHOR_SET_USER_MMIO_OFFSET is never called.
> >=20
> > Changes:
> > - Drop the lock/immutable fields and allow SET_USER_MMIO_OFFSET
> >   requests to race with mmap() requests
> > - Don't do the is_user_mmio_offset test twice in panthor_mmap()
> > - Improve the uAPI docs
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com> =20
>=20
> Much nicer, thanks!
>=20
> Reviewed-by: Steven Price <steven.price@arm.com>
>=20
> One note for merging - both this and Adri=C3=A1n's series are introducing=
 the
> new 1.4 version. So we either need to switch one to 1.5 or combine the
> series.

I'll let Adrian series go first. I want to leave some time for others
to chime in anyway.

Thanks for the reviews/suggestions.

Boris

>=20
> Thanks,
> Steve
>=20
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 18 ++++++++
> >  drivers/gpu/drm/panthor/panthor_drv.c    | 56 +++++++++++++++++-------
> >  include/uapi/drm/panthor_drm.h           | 38 ++++++++++++++++
> >  3 files changed, 96 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm=
/panthor/panthor_device.h
> > index 4c27b6d85f46..6d8c2d5042f2 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -219,6 +219,24 @@ struct panthor_file {
> >  	/** @ptdev: Device attached to this file. */
> >  	struct panthor_device *ptdev;
> > =20
> > +	/** @user_mmio: User MMIO related fields. */
> > +	struct {
> > +		/**
> > +		 * @offset: Offset used for user MMIO mappings.
> > +		 *
> > +		 * This offset should not be used to check the type of mapping
> > +		 * except in panthor_mmap(). After that point, MMIO mapping
> > +		 * offsets have been adjusted to match
> > +		 * DRM_PANTHOR_USER_MMIO_OFFSET and this macro should be used
> > +		 * instead.
> > +		 * Make sure this rule is followed at all times, because
> > +		 * userspace is in control of the offset, and can change the
> > +		 * value behind out back, potentially leading to erronous

Oops, typo here                 ^ our

> > +		 * branching happening in kernel space.
> > +		 */
> > +		u64 offset;
> > +	} user_mmio;
