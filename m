Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D59A91AB0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B05C10EA98;
	Thu, 17 Apr 2025 11:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DsUMX9/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A250810EA98
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 11:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744889051;
 bh=WuR/jSiHAV9ieBYmByMdUURAgsTHUYEO8XiXHs5Es2Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DsUMX9/tn4TZROqKjD8Wl2fVtRc62GtnKPS0Wa01Mj/8DqDhnKG6BpDyjwN5j8/R3
 FFwt98BKnGgW3SAIAdNWSTkKkd7vTn+ZacltNbVpILGEmAK+CevdshLfNvOjQzNIDx
 uSQvQwv/SyhpUm3+m1+4t2HoN2FqXQq2hxrdXHCQ2MNJYd3J3S3kKGnGzr9io9hWjP
 mo08FhwZYUBT8VYLCfEI24bUDzCXNGXt/sZtaVnp9xdLa7tnnOY8Jh+Fy8yaaiXjXo
 EfPrn/nHrJoY3tISH7Lih8l+g2t/zBJY/rGE2QpdPbNdm04aNikJdVYtxBYYo36Ja3
 rgS5qTSt3osYQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E838917E0CA7;
 Thu, 17 Apr 2025 13:24:10 +0200 (CEST)
Date: Thu, 17 Apr 2025 13:24:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 1/2] drm/panthor: Fix missing explicit padding in
 drm_panthor_gpu_info
Message-ID: <20250417132406.79122824@collabora.com>
In-Reply-To: <b25491fc-122c-4b6c-981a-703147d2f7d8@arm.com>
References: <20250417100503.3478405-1-boris.brezillon@collabora.com>
 <20250417100503.3478405-2-boris.brezillon@collabora.com>
 <b25491fc-122c-4b6c-981a-703147d2f7d8@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 17 Apr 2025 11:24:32 +0100
Steven Price <steven.price@arm.com> wrote:

> On 17/04/2025 11:05, Boris Brezillon wrote:
> > drm_panthor_gpu_info::shader_present is currently automatically offset
> > by 4 byte to meet Arm's 32-bit/64-bit field alignment rules, but those
> > constraints don't stand on 32-bit x86 and cause a mismatch when running
> > an x86 binary in a user emulated environment like FEX. It's also
> > generally agreed that uAPIs should explicitly pad their struct fields,
> > which we originally intended to do, but a mistake slipped through during
> > the submission process, leading drm_panthor_gpu_info::shader_present to
> > be misaligned.
> > 
> > This uAPI change doesn't break any of the existing users of panthor
> > which are either arm32 or arm64 where the 64-bit alignment of
> > u64 fields is already enforced a the compiler level.
> > 
> > Fixes: 0f25e493a246 ("drm/panthor: Add uAPI")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  include/uapi/drm/panthor_drm.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> > index 97e2c4510e69..1379a2d4548c 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -293,6 +293,18 @@ struct drm_panthor_gpu_info {
> >  	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
> >  	__u32 as_present;
> >  
> > +	/**
> > +	 * @garbage: Unused field that's not even zero-checked.
> > +	 *
> > +	 * This originates from a missing padding that leaked in the initial driver submission
> > +	 * and was only found when testing the driver in a 32-bit x86 environment, where
> > +	 * u64 field alignment rules are relaxed compared to aarch32.
> > +	 *
> > +	 * This field can't be repurposed, because it's never been checked by the driver and
> > +	 * userspace is not guaranteed to zero it out.  
> 
> Why would user space be providing this structure? This is meant to be
> provided from the kernel to user space, and (fingers-crossed) we've been
> zeroing the padding even though not explicitly? (rather than leaking
> some kernel data).

Uh, you're right this doesn't matter for kernel -> user data transfers.
I guess we can just make it a regular padding field, and allow it to be
repurposed if needed (as long as the expected default value is zero, of
course).

> 
> Other than the comment - yes this is a uAPI mistake we should fix.
> 
> I'm not sure how much we care about historic x86 uAPI but it also should
> be possible to identify an old x86 client using the x86 padding because
> the structure will be too short. But my preference would be to say "it's
> always been broken on x86" and therefore there's no regression.

That's also my opinion: we don't have native x86 users of panthor, and
emulated ones are just broken right now, because the kernel side (which
is arm32/64) already has a different layout.

> 
> Thanks,
> Steve
> 
> > +	 */
> > +	__u32 garbage;
> > +
> >  	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
> >  	__u64 shader_present;
> >    
> 

