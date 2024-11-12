Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C819C517F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 10:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D073A10E5A7;
	Tue, 12 Nov 2024 09:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="apVyWmKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9B110E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731402524;
 bh=1BPCp/eM6urbPUDXCjCfw1PE8UHU+GB2Mm8NG/AaJpY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=apVyWmKdTawdkNq8GjXAhYwaUwXBp9uE3/RlXEhgVyO6/RXvBw6l3jaV+rVkOzwNH
 AZtZjQN5vJ1HRda+9ZQql+79U6hG2R6MEfmWbwfsv+AMmITmAifPCoaLDW62tPSKl2
 uUxWKm9DhmPt4/D28ZxOKWnVH3+jaCM69e03SlF4nA23DFZ6n2xetwwsaYwGUylARn
 A5T4L+AfBK2DxuWJDn8rbHBeID2qf8HZ3GafOlAQK681Yg718ZJqj8lbcvazbQM7Me
 Vfx0hovjkv8yMw4L9AVawkDlSvQuSyLGZyiFXoJ3hwXgCdj1ox33v5pKnS/p+/LkiW
 /lM2HhGCQ9CGA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A907617E1411;
 Tue, 12 Nov 2024 10:08:43 +0100 (CET)
Date: Tue, 12 Nov 2024 10:08:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH v2] drm/panthor: Fix handling of partial GPU mapping of BOs
Message-ID: <20241112100836.57fcfd5f@collabora.com>
In-Reply-To: <20241111134720.780403-1-akash.goel@arm.com>
References: <20241111134720.780403-1-akash.goel@arm.com>
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

On Mon, 11 Nov 2024 13:47:20 +0000
Akash Goel <akash.goel@arm.com> wrote:

> This commit fixes the bug in the handling of partial mapping of the
> buffer objects to the GPU, which caused kernel warnings.
> 
> Panthor didn't correctly handle the case where the partial mapping
> spanned multiple scatterlists and the mapping offset didn't point
> to the 1st page of starting scatterlist. The offset variable was
> not cleared after reaching the starting scatterlist.
> 
> Following warning messages were seen.
> WARNING: CPU: 1 PID: 650 at drivers/iommu/io-pgtable-arm.c:659 __arm_lpae_unmap+0x254/0x5a0
> <snip>
> pc : __arm_lpae_unmap+0x254/0x5a0
> lr : __arm_lpae_unmap+0x2cc/0x5a0
> <snip>
> Call trace:
>  __arm_lpae_unmap+0x254/0x5a0
>  __arm_lpae_unmap+0x108/0x5a0
>  __arm_lpae_unmap+0x108/0x5a0
>  __arm_lpae_unmap+0x108/0x5a0
>  arm_lpae_unmap_pages+0x80/0xa0
>  panthor_vm_unmap_pages+0xac/0x1c8 [panthor]
>  panthor_gpuva_sm_step_unmap+0x4c/0xc8 [panthor]
>  op_unmap_cb.isra.23.constprop.30+0x54/0x80
>  __drm_gpuvm_sm_unmap+0x184/0x1c8
>  drm_gpuvm_sm_unmap+0x40/0x60
>  panthor_vm_exec_op+0xa8/0x120 [panthor]
>  panthor_vm_bind_exec_sync_op+0xc4/0xe8 [panthor]
>  panthor_ioctl_vm_bind+0x10c/0x170 [panthor]
>  drm_ioctl_kernel+0xbc/0x138
>  drm_ioctl+0x210/0x4b0
>  __arm64_sys_ioctl+0xb0/0xf8
>  invoke_syscall+0x4c/0x110
>  el0_svc_common.constprop.1+0x98/0xf8
>  do_el0_svc+0x24/0x38
>  el0_svc+0x34/0xc8
>  el0t_64_sync_handler+0xa0/0xc8
>  el0t_64_sync+0x174/0x178
> <snip>
> panthor : [drm] drm_WARN_ON(unmapped_sz != pgsize * pgcount)
> WARNING: CPU: 1 PID: 650 at drivers/gpu/drm/panthor/panthor_mmu.c:922 panthor_vm_unmap_pages+0x124/0x1c8 [panthor]
> <snip>
> pc : panthor_vm_unmap_pages+0x124/0x1c8 [panthor]
> lr : panthor_vm_unmap_pages+0x124/0x1c8 [panthor]
> <snip>
> panthor : [drm] *ERROR* failed to unmap range ffffa388f000-ffffa3890000 (requested range ffffa388c000-ffffa3890000)
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Oops, sorry, didn't notice the v2 before adding my R-b on v1.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index d8cc9e7d064e..8d05124793f5 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -989,6 +989,8 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
>  
>  		if (!size)
>  			break;
> +
> +		offset = 0;
>  	}
>  
>  	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);

