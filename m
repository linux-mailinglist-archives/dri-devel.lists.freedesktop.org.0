Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C059C3D53
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 12:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F0A10E479;
	Mon, 11 Nov 2024 11:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 932EB10E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 11:31:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 126DA1D14;
 Mon, 11 Nov 2024 03:31:45 -0800 (PST)
Received: from [10.1.26.32] (e122027.cambridge.arm.com [10.1.26.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A33D3F6A8;
 Mon, 11 Nov 2024 03:31:13 -0800 (PST)
Message-ID: <bff9ae58-8587-4f44-a797-d919770978aa@arm.com>
Date: Mon, 11 Nov 2024 11:31:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix handling of partial GPU mapping of BOs
To: Akash Goel <akash.goel@arm.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20241111092621.763285-1-akash.goel@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241111092621.763285-1-akash.goel@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/11/2024 09:26, Akash Goel wrote:
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
> 
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

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
>  

