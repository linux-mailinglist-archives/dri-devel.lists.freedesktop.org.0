Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E43499DF07
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 09:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B944D10E512;
	Tue, 15 Oct 2024 07:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="adGzHvaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3675410E512
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728975836;
 bh=Mw4fakRWtxMujc0unJLXzwWDSCQ4C7hlb7eEQrPyoRk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=adGzHvaIUmbF3K9fJiNFzY3pDFhc575HCxUqABJKc+hlnloi9GBwsBpS/ERhXln3F
 JHObbsxYrf91Z51ALCj89vfIXlK0vs5cU915PSGKewaYycuNTersndfDQKhIofTSfd
 +FpmtVdrpJhgCz2wYAuj6WVD7vKFIdvnn4+aUnpOokd1mvHjmxMAqZPOMkq8iwFVk+
 n6p4eqISP8mUB4Qj1FP7kHFvwLY2AZdvYYkFp5RhZCJ4QXEQrBWhASaGJaoiRXajhB
 aYcU2a/6DcLF0i5EbkAUjlyFWcC/E6DqUs8RBUkXebcmh05DJ7gM/5DXnByzP3hloS
 8tvG0+ydaofiw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7163417E1088;
 Tue, 15 Oct 2024 09:03:56 +0200 (CEST)
Date: Tue, 15 Oct 2024 09:03:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v2] drm/panthor: Fix firmware initialization on systems
 with a page size > 4k
Message-ID: <20241015090351.0838fca7@collabora.com>
In-Reply-To: <Zw3Anj_54VAcZiA-@e110455-lin.cambridge.arm.com>
References: <20241014093134.464059-1-boris.brezillon@collabora.com>
 <Zw3Anj_54VAcZiA-@e110455-lin.cambridge.arm.com>
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

Hi Liviu,

On Tue, 15 Oct 2024 02:08:46 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> Hi Boris,
> 
> I'm a bit confused, I thought the plan was to separate the FW_PAGE_SIZE
> from the rest of Panthor's PAGE_SIZE.
> 
> On Mon, Oct 14, 2024 at 11:31:34AM +0200, Boris Brezillon wrote:
> > The system and GPU MMU page size might differ, which becomes a
> > problem for FW sections that need to be mapped at explicit address
> > since our PAGE_SIZE alignment might cover a VA range that's
> > expected to be used for another section.
> > 
> > Make sure we never map more than we need.  
> 
> This ^
> 
> > 
> > Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > Steve, Liviu, Adrian, I intentionally dropped the R-b because of
> > the panthor_vm_page_size() change. Feel free to add it back if
> > you're happy with the new version.
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c  |  4 ++--
> >  drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++---
> >  drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
> >  4 files changed, 24 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index ef232c0c2049..4e2d3a02ea06 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -487,6 +487,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >  					 struct panthor_fw_binary_iter *iter,
> >  					 u32 ehdr)
> >  {
> > +	ssize_t vm_pgsz = panthor_vm_page_size(ptdev->fw->vm);
> >  	struct panthor_fw_binary_section_entry_hdr hdr;
> >  	struct panthor_fw_section *section;
> >  	u32 section_size;
> > @@ -515,8 +516,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >  		return -EINVAL;
> >  	}
> >  
> > -	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
> > -	    (hdr.va.end & ~PAGE_MASK) != 0) {
> > +	if (!IS_ALIGNED(hdr.va.start, vm_pgsz) || !IS_ALIGNED(hdr.va.end, vm_pgsz)) {  
> 
> is falsified by this.

I don't think it is. panthor_vm_page_size() is returning SZ_4K since
pgsize_bitmap is set to SZ_4K | SZ_2M in panthor_vm_create().

> 
> I think panthor_vm_page_size() is an useful helper to have, but in panthor_fw.c we should use
> the 4K page mask for allocating firmware sections.

That's something we pick at VM creation time. Right now everyone is
using 4K pages, but I can see a future where user VMs would have a page
size selected based on the system page size. Basically something like
that in panthor_vm_create():

   if (PAGE_SIZE < SZ_64K || for_mcu)
      pgsize_bitmap = SZ_4K | SZ_2M;
   else
      pgsize_bitmap = SZ_64K;

> 
> I've asked for confirmation from the firmware team regarding plans for the future wrt section's page size
> and will get back to you if my assumption that is going to stay at 4K is wrong.

My intention has never been to use 64K pages for the MCU page table.
Given the size of the sections mapped there, I don't think it'd make
sense. What we could do though, is use a kmem_cache cache for such
allocations, to avoid losing the remaining of the PAGE_SIZE when FW
sections/allocations are not 4K aligned, but that's a different kind of
optimization.

Regards,

Boris
