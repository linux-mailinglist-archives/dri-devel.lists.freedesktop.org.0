Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C644B9C3DE5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 13:03:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495B210E484;
	Mon, 11 Nov 2024 12:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C2CC10E484
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 12:03:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEF8C11FB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 04:03:57 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC1373F6A8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 04:03:27 -0800 (PST)
Date: Mon, 11 Nov 2024 12:03:24 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Akash Goel <akash.goel@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Fix handling of partial GPU mapping of BOs
Message-ID: <ZzHyjJRCbicx1aJl@e110455-lin.cambridge.arm.com>
References: <20241111092621.763285-1-akash.goel@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241111092621.763285-1-akash.goel@arm.com>
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

On Mon, Nov 11, 2024 at 09:26:21AM +0000, Akash Goel wrote:
> This commit fixes the handling of partial GPU mapping of buffer objects
> in Panthor.
> VM_BIND ioctl allows Userspace to partially map the BOs to GPU.
> To map a BO, Panthor walks through the sg_table to retrieve the physical
> address of pages. If the mapping is created at an offset into the BO,
> then the scatterlist(s) at the beginning have to be skipped to reach the
> one corresponding to the offset. But the case where the offset didn't
> point to the first page of desired scatterlist wasn't handled correctly.
> The bug caused the partial GPU mapping of BO to go wrong for the said
> case, as the pages didn't get map at the expected virtual address and
> consequently there were kernel warnings on unmap.

Maybe it's just me, but I would find it easier to figure out what's being
fixed here if commit message said something like:

When the BO being mapped spans multiple scatterlists, offset is not cleared
after the starting scatterlist, leading to holes in the mapping.


If I understand it correctly you found this based on some WARN() being triggered,
so maybe adding the dump here would've helped too.


> 
> Signed-off-by: Akash Goel <akash.goel@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index d8cc9e7d064e..6bc188d9a9ad 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -957,6 +957,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
>  
>  		paddr += offset;
>  		len -= offset;
> +		offset = 0;
>  		len = min_t(size_t, len, size);
>  		size -= len;

Again, my preference so feel free to ignore, but I would put the resetting of offset at the
end of for_each_sgtable_dma_sg() loop, after the if (!size) break lines. That way it is clear
that it applies to the next iteration of the loop.

Regardsless of the changes you're going to make,

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  
> -- 
> 2.25.1
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
