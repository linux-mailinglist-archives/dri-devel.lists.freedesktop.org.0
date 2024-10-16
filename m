Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701C9A0BD7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 15:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854B910E708;
	Wed, 16 Oct 2024 13:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SN9khXS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBCE10E708
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729086476;
 bh=OP7Tc4PxP3Fgd9Vv+XXCjgFdWs16x0dx/47Skh0axIY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SN9khXS5FPJ4pjDaGg+PGB0WIPQj/HjXmY40v3gpPJAOGQFLIgs1Vh7K3DO+Fbl0/
 pvQmrSE+Twmg7g+lDe6EwB5/ZG/VNn2vUI1mnwNcFHAwN44Yl7kL6V10Nmmlb12EoI
 Xt+AoPYCNgjZp3uFwK5H7t7JUSkBW/LsEM02Kg1UNiS8GjDPUpPGhwj9sldciGbDrI
 I6r6ubBEsTcVnFhFCoVzCLegPZ1cCBNlE+F26/QNI0kmPGuSoJfZpEW58EHsZkIF5b
 BGM9bAmyoyuzUJLpvKdnx9Su9TxCzYNIImRTiYO855/nsegSVb3eoOfNXMOhlp1m0w
 fMs+672JUQdEA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D520E17E360B;
 Wed, 16 Oct 2024 15:47:55 +0200 (CEST)
Date: Wed, 16 Oct 2024 15:47:47 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Erik Faye-Lund <erik.faye-lund@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com, Chris Diamand	
 <chris.diamand@foss.arm.com>, Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v6 01/14] drm/panthor: Add uAPI
Message-ID: <20241016154747.336db4fb@collabora.com>
In-Reply-To: <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-2-boris.brezillon@collabora.com>
 <64ff75ddede7623c16ed0272eef5e950ae34e7d5.camel@collabora.com>
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

On Wed, 16 Oct 2024 15:16:22 +0200
Erik Faye-Lund <erik.faye-lund@collabora.com> wrote:

> On Thu, 2024-02-29 at 17:22 +0100, Boris Brezillon wrote:
> > +/**
> > + * enum drm_panthor_sync_op_flags - Synchronization operation flags.
> > + */
> > +enum drm_panthor_sync_op_flags {
> > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK: Synchronization
> > handle type mask. */
> > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_MASK = 0xff,
> > +
> > +	/** @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ:
> > Synchronization object type. */
> > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_SYNCOBJ = 0,
> > +
> > +	/**
> > +	 * @DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> > Timeline synchronization
> > +	 * object type.
> > +	 */
> > +	DRM_PANTHOR_SYNC_OP_HANDLE_TYPE_TIMELINE_SYNCOBJ = 1,
> > +
> > +	/** @DRM_PANTHOR_SYNC_OP_WAIT: Wait operation. */
> > +	DRM_PANTHOR_SYNC_OP_WAIT = 0 << 31,
> > +
> > +	/** @DRM_PANTHOR_SYNC_OP_SIGNAL: Signal operation. */
> > +	DRM_PANTHOR_SYNC_OP_SIGNAL = (int)(1u << 31),  
> 
> Why do we cast to int here? 1u << 31 doesn't fit in a 32-bit signed
> integer, so isn't this undefined behavior in C?
> 
> I'm asking, because Coverity complains about overflows when we assign
> the value to drm_panthor_sync_op::flags in Mesa, and looking at it...
> it seems to be right in complaining!
> 
> For reference, here's the Coverity issue (requires login,
> unfortunately):
> https://scan5.scan.coverity.com/#/project-view/59795/10037?selectedIssue=1605083
> 

The cast was originally suggested here [1]. If we don't want to rely
on gcc/llvm implementation of this UB, I guess the only option is to
redefine those enums as #defines.

[1]https://lore.kernel.org/dri-devel/89be8f8f-7c4e-4efd-0b7b-c30bcfbf1d23@arm.com/

