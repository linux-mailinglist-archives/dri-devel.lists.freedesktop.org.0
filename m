Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C719A69E6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FCC10E00C;
	Mon, 21 Oct 2024 13:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18AD810E00C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:19:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BED1DA7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:19:50 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 36CCF3F73B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:19:20 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:19:16 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2] drm/panthor: Fix firmware initialization on systems
 with a page size > 4k
Message-ID: <ZxZU1CMRSF14UMZK@e110455-lin.cambridge.arm.com>
References: <20241014093134.464059-1-boris.brezillon@collabora.com>
 <Zw3Anj_54VAcZiA-@e110455-lin.cambridge.arm.com>
 <20241015090351.0838fca7@collabora.com>
 <Zw7eyWCqKb7CMDif@e110455-lin.cambridge.arm.com>
 <20241016085352.4a5c0beb@collabora.com>
 <20241016114906.7d29e1c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016114906.7d29e1c1@collabora.com>
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

On Wed, Oct 16, 2024 at 11:49:06AM +0200, Boris Brezillon wrote:
> On Wed, 16 Oct 2024 08:53:52 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Tue, 15 Oct 2024 22:29:45 +0100
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > 
> > > On Tue, Oct 15, 2024 at 09:03:51AM +0200, Boris Brezillon wrote:  
> > > > Hi Liviu,
> > > > 
> > > > On Tue, 15 Oct 2024 02:08:46 +0100
> > > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > > >     
> > > > > Hi Boris,
> > > > > 
> > > > > I'm a bit confused, I thought the plan was to separate the FW_PAGE_SIZE
> > > > > from the rest of Panthor's PAGE_SIZE.
> > > > > 
> > > > > On Mon, Oct 14, 2024 at 11:31:34AM +0200, Boris Brezillon wrote:    
> > > > > > The system and GPU MMU page size might differ, which becomes a
> > > > > > problem for FW sections that need to be mapped at explicit address
> > > > > > since our PAGE_SIZE alignment might cover a VA range that's
> > > > > > expected to be used for another section.
> > > > > > 
> > > > > > Make sure we never map more than we need.      
> > > > > 
> > > > > This ^
> > > > >     
> > > > > > 
> > > > > > Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
> > > > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > > ---
> > > > > > Steve, Liviu, Adrian, I intentionally dropped the R-b because of
> > > > > > the panthor_vm_page_size() change. Feel free to add it back if
> > > > > > you're happy with the new version.
> > > > > > ---
> > > > > >  drivers/gpu/drm/panthor/panthor_fw.c  |  4 ++--
> > > > > >  drivers/gpu/drm/panthor/panthor_gem.c | 11 ++++++++---
> > > > > >  drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++---
> > > > > >  drivers/gpu/drm/panthor/panthor_mmu.h |  1 +
> > > > > >  4 files changed, 24 insertions(+), 8 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > > > > > index ef232c0c2049..4e2d3a02ea06 100644
> > > > > > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > > > > > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > > > > > @@ -487,6 +487,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> > > > > >  					 struct panthor_fw_binary_iter *iter,
> > > > > >  					 u32 ehdr)
> > > > > >  {
> > > > > > +	ssize_t vm_pgsz = panthor_vm_page_size(ptdev->fw->vm);
> > > > > >  	struct panthor_fw_binary_section_entry_hdr hdr;
> > > > > >  	struct panthor_fw_section *section;
> > > > > >  	u32 section_size;
> > > > > > @@ -515,8 +516,7 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> > > > > >  		return -EINVAL;
> > > > > >  	}
> > > > > >  
> > > > > > -	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
> > > > > > -	    (hdr.va.end & ~PAGE_MASK) != 0) {
> > > > > > +	if (!IS_ALIGNED(hdr.va.start, vm_pgsz) || !IS_ALIGNED(hdr.va.end, vm_pgsz)) {      
> > > > > 
> > > > > is falsified by this.    
> > > > 
> > > > I don't think it is. panthor_vm_page_size() is returning SZ_4K since
> > > > pgsize_bitmap is set to SZ_4K | SZ_2M in panthor_vm_create().
> > > >     
> > > > > 
> > > > > I think panthor_vm_page_size() is an useful helper to have, but in panthor_fw.c we should use
> > > > > the 4K page mask for allocating firmware sections.    
> > > > 
> > > > That's something we pick at VM creation time. Right now everyone is
> > > > using 4K pages, but I can see a future where user VMs would have a page
> > > > size selected based on the system page size. Basically something like
> > > > that in panthor_vm_create():
> > > > 
> > > >    if (PAGE_SIZE < SZ_64K || for_mcu)
> > > >       pgsize_bitmap = SZ_4K | SZ_2M;
> > > >    else
> > > >       pgsize_bitmap = SZ_64K;
> > > >     
> > > > > 
> > > > > I've asked for confirmation from the firmware team regarding plans for the future wrt section's page size
> > > > > and will get back to you if my assumption that is going to stay at 4K is wrong.    
> > > > 
> > > > My intention has never been to use 64K pages for the MCU page table.
> > > > Given the size of the sections mapped there, I don't think it'd make
> > > > sense. What we could do though, is use a kmem_cache cache for such
> > > > allocations, to avoid losing the remaining of the PAGE_SIZE when FW
> > > > sections/allocations are not 4K aligned, but that's a different kind of
> > > > optimization.    
> > > 
> > > Right, so depending on what firmware/GPU combination you have the firmware in the future can use
> > > either 4K (current public firmware), 64K or 16K for its sections. I'm working with the firmware team
> > > to expose the information somewhere in the headers of the binary.
> > > 
> > > What I was trying to say in my comments is that panthor_fw.c should not use the same function as
> > > the rest of panthor code to get the alignment for the sections as there could be a mismatch between
> > > the two (4K FW sections on 16K system pages, or 16K FW sections on 4K system pages).  
> > 
> > We have the for_mcu parameter that can be used to change the
> > io_pgtable_cfg::pgsize_bitmap (see my pseudo-code above)
> 
> If the FW page size is dynamic, we can also easily extend
> panthor_vm_create() to take the page size, or have a
> panthor_fw_page_size() helper that's called when for_mcu=true.

Yes, I think that is coming at some moment as there is more memory available
to supported devices. With a future patch to handle non-4K firmware pages in mind,

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> > , and this very
> > same config is used to extract the page size in panthor_vm_page_size(),
> > so I don't really see what the problem is. panthor_vm_page_size() will
> > always return the page size that's used for a specific VM, so, if we
> > use a different page size for the MCU VM, it will cope with that
> > without any modification and without needing a new function.
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
