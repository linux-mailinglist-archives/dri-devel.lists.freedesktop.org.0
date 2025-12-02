Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C577DC9C2DE
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 17:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C237510E687;
	Tue,  2 Dec 2025 16:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lBlA5ztc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D55110E687
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764692521;
 bh=6UrUG0wHO6W+5qklQhDKLJzFkrjQJ4ceCXmcETm07pI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lBlA5ztc1KRyQrBQG9KWfLSmbwoIy3EbY1L3Z+wfb3rCmEmIuZMOj+wbP8vJbwTpe
 Tva9Gwn3BpeucHM+Jh6OpiLWmjspQDOvTPz9IIYxckFhtLqRHfkethXXJ0Ok8Vzuo0
 96+P7ZXAyDXhMz1xpIVZzEFLAgsVNALyI3Qi7nNYmnJDn2Ux7kUmqXjV1ZuMrUdxUZ
 vM99DcGW+4V7clPKMX/gYxdU+HT2Jymm2tPoRe6OzOFyunFzPb+IhxzcRsQC7CpdL2
 FB6K0vs/eIrq7Q1fws2+RZctjQ7KuVic6q/EWtsdkyVdYw3cRgf+E+sxtUC0onsSGe
 uLNlNDp+lQA6Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DCEAC17E090D;
 Tue,  2 Dec 2025 17:22:00 +0100 (CET)
Date: Tue, 2 Dec 2025 17:21:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v1 3/3] drm/panthor: Unlock the locked region before
 disabling an AS
Message-ID: <20251202172153.64d3d129@fedora>
In-Reply-To: <1bf563a8-0670-4167-b909-310220e4b57a@arm.com>
References: <20251202133538.83078-1-boris.brezillon@collabora.com>
 <20251202133538.83078-4-boris.brezillon@collabora.com>
 <1bf563a8-0670-4167-b909-310220e4b57a@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Tue, 2 Dec 2025 15:09:42 +0000
Akash Goel <akash.goel@arm.com> wrote:

> Hi Boris,
> 
> 
> On 12/2/25 13:35, Boris Brezillon wrote:
> > An AS can be disabled in the middle of a VM operation (VM being
> > evicted from an AS slot, for instance). In that case, we need the
> > locked section to be unlocked before releasing the slot.
> > 
> > Fixes: 6e2d3b3e8589 ("drm/panthor: Add support for atomic page table updates")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/panthor/panthor_mmu.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 3644af1a8e56..4ed28bd1b8ec 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -588,6 +588,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
> >   static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
> >   				  bool recycle_slot)
> >   {
> > +	struct panthor_vm *vm = ptdev->mmu->as.slots[as_nr].vm;
> >   	int ret;
> >     
> 
> Thanks for the fix.
> 
> Please can you consider adding a lockdep_assert_held for 
> mmu->as.slots_lock. That would in a way make it explicit that it is safe 
> to de-reference vm pointer here.

Sure, I can do that.

> 
> Best regards
> Akash
> 
> 
> >   	/* Flush+invalidate RW caches, invalidate RO ones. */
> > @@ -596,6 +597,16 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr,
> >   	if (ret)
> >   		return ret;
> >   
> > +	if (vm && vm->locked_region.size) {
> > +		/* Unlock the region if there a lock pending. */
> > +		ret = as_send_cmd_and_wait(ptdev, vm->as.id, AS_COMMAND_UNLOCK);
> > +		if (ret)
> > +			return ret;
> > +
> > +		vm->locked_region.start = 0;
> > +		vm->locked_region.size = 0;
> > +	}
> > +
> >   	/* If the slot is going to be used immediately, don't bother changing
> >   	 * the config.
> >   	 */  

