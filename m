Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307AE9A0C66
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 16:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A662F10E0AE;
	Wed, 16 Oct 2024 14:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Osw11/Qa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E2210E0AE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729088318;
 bh=NABsgyIOWHP+iLDQJhvWhlSE0nvmcrftRvz/MLXs7H4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Osw11/QaYvfmwX+1gndJi0VC2y4cjPMyhcJw3qXygzCtSk4I569tEtGU4pcMlcVBR
 dbWdo4HFwAKnngj5lHDQr0TIh546TXdjBIzkRMFGLsbWb72BLYtSDToGSGEtvVcoon
 6/8owYW1i75/kqwOfkc8Qif7XbokRfkzd1Q5caUdmSWyQJpjuaDVoQA/PYLawdwKjs
 c7rGqLOZA3jIenZy2DCbuVaPTPYfBv/ZsIZV7YKeSCPW2nCePDW88Kh8yBnzvRxbYN
 G5oIl7Ayimo//Qr7wK8Pg79tETbrn0GEhrCl08hwNg/dnzXkNmNjVtIIzIQKXefDIB
 gGD85TIZDUFYg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CA4C117E3613;
 Wed, 16 Oct 2024 16:18:37 +0200 (CEST)
Date: Wed, 16 Oct 2024 16:18:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Erik Faye-Lund <erik.faye-lund@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, kernel@collabora.com, Chris Diamand
 <chris.diamand@foss.arm.com>, Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
Message-ID: <20241016161833.574494ee@collabora.com>
In-Reply-To: <da2c1dcbefcc25760d6a452e04d870987daf0a27.camel@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
 <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
 <1bd37b18455607b709529c8def963c4561e2ff1e.camel@collabora.com>
 <abded30f-3333-49e5-aac2-8da6ac64903b@arm.com>
 <da2c1dcbefcc25760d6a452e04d870987daf0a27.camel@collabora.com>
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

On Wed, 16 Oct 2024 16:05:55 +0200
Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:

> On Wed, 2024-10-16 at 15:02 +0100, Robin Murphy wrote:
> > On 2024-10-16 2:50 pm, Erik Faye-Lund wrote:  
> > > On Wed, 2024-10-16 at 15:16 +0200, Erik Faye-Lund wrote:  
> > > > On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon wrote:  
> > > > > +/**
> > > > > + * enum drm_panthor_sync_op_flags - Synchronization operation
> > > > > flags.
> > > > > + */
> > > > > +enum drm_panthor_sync_op_flags {
> > > > > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK:
> > > > > Synchronization
> > > > > handle type mask. */
> > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK = 0xff,
> > > > > +
> > > > > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
> > > > > Synchronization object type. */
> > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ = 0,
> > > > > +
> > > > > +	/**
> > > > > +	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> > > > > Timeline synchronization
> > > > > +	 * object type.
> > > > > +	 */
> > > > > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ = 1,
> > > > > +
> > > > > +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> > > > > +	DRM_PANTHOR_SYNC_OP_WAIT = 0 << 31,
> > > > > +
> > > > > +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> > > > > +	DRM_PANTHOR_SYNC_OP_SIGNAL = (int)(1u << 31),  
> > > > 
> > > > Why do we cast to int here? 1u << 31 doesn't fit in a 32-bit
> > > > signed
> > > > integer, so isn't this undefined behavior in C?
> > > >   
> > > 
> > > Seems this was proposed here:
> > > https://lore.kernel.org/dri-devel/89be8f8f-7c4e-4efd-0b7b-c30bcfbf1d23@arm.com/
> > > 
> > > ...that kinda sounds like bad advice to me.
> > > 
> > > Also, it's been pointed out to me elsewhere that this isn't
> > > *technically speaking* undefined, it's "implementation defined".
> > > But as
> > > far as kernel interfaces goes, that's pretty much the same; we
> > > can't
> > > guarantee that the kernel and the user-space is using the same
> > > implementation.
> > > 
> > > Here's the quote from the C99 spec, section 6.3.1.3 "Signed and
> > > unsigned integers":
> > > 
> > > """
> > > Otherwise, the new type is signed and the value cannot be
> > > represented
> > > in it; either the result is implementation-defined or an
> > > implementation-defined signal is raised
> > > """"
> > > 
> > > I think a better approach be to use -1 << 31, which is well-
> > > defined.
> > > But the problem then becomes assigning it into
> > > drm_panthor_sync_op::flags in a well-defined way... Could we make
> > > the
> > > field signed? That seems a bit bad as well...  
> > 
> > Is that a problem? Signed->unsigned conversion is always well-defined
> > (6.3.1.3 again), since it doesn't depend on how the signed type 
> > represents negatives.
> > 
> > Robin.  
> 
> Ah, you're right. So that could fix the problem, indeed.

On the other hand, I hate the idea of having -1 << 31 to encode
bit31-set. That's even worse for DRM_PANTHOR_VM_BIND_OP_TYPE_xxx when
we'll reach a value above 0x7, because then the negative value is hard
to map to its unsigned representation. If we really care about this
corner case, I'd rather go full-defines for flags and call it a day.

