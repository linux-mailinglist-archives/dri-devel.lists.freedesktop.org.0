Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF916C2FB45
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 08:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E085410E53C;
	Tue,  4 Nov 2025 07:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CrtMHL+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B946D10E53C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762242215;
 bh=EgOjPpMbuIpW1PbfJJN6aKm/ynZ9oeu/E55eJu4DaqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CrtMHL+NGVxQRrHqP3Co6TFKJc4rMe+XysXn5uDyu6ZNKEiUri68EltdfEuX3msxt
 Ffoj1HAtcp70c57qxvjMxMNsMAylxaFrdXCWJh3XyWwlTRs5U1sOXrr9kIAJIg8O7n
 jo+dVgNDbQYcrFwv3BVCm5u9rOPeTagsVG16EkaFl5byRpIXSwlRqnjkqM51CcehBT
 ShKoYX5GTrnCSUR9yvqBafch6zvErLQ70Ob3YE70STqUv4tkXPnYCKT/Be+3GzvINF
 ABu2CT11Lcga9dn5N4Ncahq9IGfhQ33sfCwa4Ds/ch9CoowWeFObbcnvCG76zpSyyA
 WIeNFiUm6lsJw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 129EB17E0927;
 Tue,  4 Nov 2025 08:43:35 +0100 (CET)
Date: Tue, 4 Nov 2025 08:43:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, Lars-Ivar Hesselberg Simonsen
 <lars-ivar.simonsen@arm.com>, kernel@collabora.com
Subject: Re: [PATCH v1 3/4] drm/panthor: Make panthor_vm_[un]map_pages()
 more robust
Message-ID: <20251104084332.3838c081@fedora>
In-Reply-To: <dedbbff4-0c06-4d6d-b3dd-73cdc592a98e@arm.com>
References: <20251031154818.821054-1-boris.brezillon@collabora.com>
 <20251031154818.821054-4-boris.brezillon@collabora.com>
 <dedbbff4-0c06-4d6d-b3dd-73cdc592a98e@arm.com>
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

On Mon, 3 Nov 2025 21:00:58 +0000
Akash Goel <akash.goel@arm.com> wrote:

> On 10/31/25 15:48, Boris Brezillon wrote:
> > There's no reason for panthor_vm_[un]map_pages() to fail unless the
> > drm_gpuvm state and the page table are out of sync, so let's reflect that
> > by making panthor_vm_unmap_pages() a void function and adding
> > WARN_ON()s in various places. We also try to recover from those
> > unexpected mismatch by checking for already unmapped ranges and skipping
> > them. But there's only so much we can do to try and cope with such
> > SW bugs, so when we see a mismatch, we flag the VM unusable and disable
> > the AS to avoid further GPU accesses to the memory.
> >
> > It could be that the as_disable() call fails because the MMU unit is
> > stuck, in which case the whole GPU is frozen, and only a GPU reset can
> > unblock things. Ater the reset, the VM will be seen as unusable and
> > any attempt to re-use it will fail, so we should be covered for any
> > use-after-unmap issues.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >   drivers/gpu/drm/panthor/panthor_mmu.c | 82 ++++++++++++++++++---------
> >   1 file changed, 55 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index ea886c8ac97f..a4f3ed04b5cc 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -846,12 +846,32 @@ static size_t get_pgsize(u64 addr, size_t size, size_t *count)
> >       return SZ_2M;
> >   }
> >
> > -static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
> > +static void panthor_vm_declare_unusable(struct panthor_vm *vm)
> > +{
> > +     struct panthor_device *ptdev = vm->ptdev;
> > +     int cookie;
> > +
> > +     if (vm->unusable)
> > +             return;
> > +
> > +     vm->unusable = true;
> > +     mutex_unlock(&ptdev->mmu->as.slots_lock);  
> 
> Please fix this. Need to call mutex_lock.

Oops. Will fix.

> 
> 
> > +     if (vm->as.id >= 0 && drm_dev_enter(&ptdev->base, &cookie)) {
> > +             panthor_mmu_as_disable(ptdev, vm->as.id);
> > +             drm_dev_exit(cookie);
> > +     }
> > +     mutex_unlock(&ptdev->mmu->as.slots_lock);
> > +}
> > +
> > +static void panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)  
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

