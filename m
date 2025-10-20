Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DEBF22DC
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0863110E476;
	Mon, 20 Oct 2025 15:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 26B8110E474
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:44:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9AC51063;
 Mon, 20 Oct 2025 08:44:29 -0700 (PDT)
Received: from [10.57.36.117] (unknown [10.57.36.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B2153F66E;
 Mon, 20 Oct 2025 08:44:35 -0700 (PDT)
Message-ID: <95c053f6-bb90-4eca-beff-0b46ef251a32@arm.com>
Date: Mon, 20 Oct 2025 16:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix kernel panic on partial unmap of a
 GPU VA region
To: Akash Goel <akash.goel@arm.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20251020060028.1262648-1-akash.goel@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251020060028.1262648-1-akash.goel@arm.com>
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

Hi Akash,

On 20/10/2025 07:00, Akash Goel wrote:
> This commit address a kernel panic issue that can happen if Userspace
> tries to partially unmap a GPU virtual region (aka drm_gpuva).
> The VM_BIND interface allows partial unmapping of a BO.
> 
> Panthor driver pre-allocates memory for the new drm_gpuva structures
> that would be needed for the map/unmap operation, done using drm_gpuvm
> layer. It expected that only one new drm_gpuva would be needed on umap
> but a partial unmap can require 2 new drm_gpuva and that's why it
> ended up doing a NULL pointer dereference causing a kernel panic.
> 
> Following dump was seen when partial unmap was exercised.
>  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000078
>  Mem abort info:
>    ESR = 0x0000000096000046
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x06: level 2 translation fault
>  Data abort info:
>    ISV = 0, ISS = 0x00000046, ISS2 = 0x00000000
>    CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>  user pgtable: 4k pages, 48-bit VAs, pgdp=000000088a863000
>  [000000000000078] pgd=080000088a842003, p4d=080000088a842003, pud=0800000884bf5003, pmd=0000000000000000
>  Internal error: Oops: 0000000096000046 [#1] PREEMPT SMP
>  <snip>
>  pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  pc : panthor_gpuva_sm_step_remap+0xe4/0x330 [panthor]
>  lr : panthor_gpuva_sm_step_remap+0x6c/0x330 [panthor]
>  sp : ffff800085d43970
>  x29: ffff800085d43970 x28: ffff00080363e440 x27: ffff0008090c6000
>  x26: 0000000000000030 x25: ffff800085d439f8 x24: ffff00080d402000
>  x23: ffff800085d43b60 x22: ffff800085d439e0 x21: ffff00080abdb180
>  x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000010
>  x17: 6e656c202c303030 x16: 3666666666646466 x15: 393d61766f69202c
>  x14: 312d3d7361203a70 x13: 303030323d6e656c x12: ffff80008324bf58
>  x11: 0000000000000003 x10: 0000000000000002 x9 : ffff8000801a6a9c
>  x8 : ffff00080360b300 x7 : 0000000000000000 x6 : 000000088aa35fc7
>  x5 : fff1000080000000 x4 : ffff8000842ddd30 x3 : 0000000000000001
>  x2 : 0000000100000000 x1 : 0000000000000001 x0 : 0000000000000078
>  Call trace:
>   panthor_gpuva_sm_step_remap+0xe4/0x330 [panthor]
>   op_remap_cb.isra.22+0x50/0x80
>   __drm_gpuvm_sm_unmap+0x10c/0x1c8
>   drm_gpuvm_sm_unmap+0x40/0x60
>   panthor_vm_exec_op+0xb4/0x3d0 [panthor]
>   panthor_vm_bind_exec_sync_op+0x154/0x278 [panthor]
>   panthor_ioctl_vm_bind+0x160/0x4a0 [panthor]
>   drm_ioctl_kernel+0xbc/0x138
>   drm_ioctl+0x240/0x500
>   __arm64_sys_ioctl+0xb0/0xf8
>   invoke_syscall+0x4c/0x110
>   el0_svc_common.constprop.1+0x98/0xf8
>   do_el0_svc+0x24/0x38
>   el0_svc+0x40/0xf8
>   el0t_64_sync_handler+0xa0/0xc8
>   el0t_64_sync+0x174/0x178
> 
> Changes in v2:
>     - Add R-bs and fixes tags

Sorry, perhaps I wasn't very clear. I've already pushed v1 to
drm-misc-fixes (with the fixes line and the R-bs):

4eabd0d8791e ("drm/panthor: Fix kernel panic on partial unmap of a GPU VA region")

Usually there's no need to post another version just to update the tags 
as we can do that as part of applying the series.

Thanks,
Steve

> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Signed-off-by: Akash Goel <akash.goel@arm.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 6dec4354e378..7870e7dbaa5d 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1175,10 +1175,14 @@ panthor_vm_op_ctx_prealloc_vmas(struct panthor_vm_op_ctx *op_ctx)
>  		break;
>  
>  	case DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP:
> -		/* Partial unmaps might trigger a remap with either a prev or a next VA,
> -		 * but not both.
> +		/* Two VMAs can be needed for an unmap, as an unmap can happen
> +		 * in the middle of a drm_gpuva, requiring a remap with both
> +		 * prev & next VA. Or an unmap can span more than one drm_gpuva
> +		 * where the first and last ones are covered partially, requring
> +		 * a remap for the first with a prev VA and remap for the last
> +		 * with a next VA.
>  		 */
> -		vma_count = 1;
> +		vma_count = 2;
>  		break;
>  
>  	default:

