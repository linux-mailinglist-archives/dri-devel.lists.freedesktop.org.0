Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3927E953E73
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 02:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9787910E569;
	Fri, 16 Aug 2024 00:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cRdO2hMg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A1810E567;
 Fri, 16 Aug 2024 00:53:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2462461BA0;
 Fri, 16 Aug 2024 00:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA49AC32786;
 Fri, 16 Aug 2024 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723769620;
 bh=UKhRsshcadMpMUroXZC4qZUzo5g1S1EjdSC082Qo6fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cRdO2hMgiB8nur34lKZSGxASheEbejGdLHb5W61kGhQwrjI7MUfIQoRqAu03doU3+
 VsDaghhM/teiyFtekjbIcmnw7gYY/80hfrif6NjHM+k72SJf0HGO7XJfTfC1FXEEet
 FcoU+0/YYwGgPuqG7T4iklNswi+7qxi2ZjIKmCfDuuh6eRvhlyqvEmhGpmSpskvvLc
 UBJK3HqJU8TzpOeSmkQJMbOBe/6NiXhTjNFDTh2jQ+TkQVV/WdQ8C/nAy9Kb45UKCe
 yHEfgAUigaJPAbwm3GW8FI8gKyn2yfAYaUkU/MaDhkBokHfGMNN/szqe5LP06iIKhz
 owAwE1sK2rdLg==
Date: Fri, 16 Aug 2024 02:53:37 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] nouveau/firmware: using dma non-coherent interfaces for
 fw loading. (v2)
Message-ID: <Zr6jEY1L0Cv3FIOt@cassiopeiae>
References: <20240815201923.632803-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815201923.632803-1-airlied@gmail.com>
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

On Fri, Aug 16, 2024 at 06:19:23AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Currently, enabling SG_DEBUG in the kernel will cause nouveau to hit a
> BUG() on startup, when the iommu is enabled:
> 
> kernel BUG at include/linux/scatterlist.h:187!
> invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 7 PID: 930 Comm: (udev-worker) Not tainted 6.9.0-rc3Lyude-Test+ #30
> Hardware name: MSI MS-7A39/A320M GAMING PRO (MS-7A39), BIOS 1.I0 01/22/2019
> RIP: 0010:sg_init_one+0x85/0xa0
> Code: 69 88 32 01 83 e1 03 f6 c3 03 75 20 a8 01 75 1e 48 09 cb 41 89 54
> 24 08 49 89 1c 24 41 89 6c 24 0c 5b 5d 41 5c e9 7b b9 88 00 <0f> 0b 0f 0b
> 0f 0b 48 8b 05 5e 46 9a 01 eb b2 66 66 2e 0f 1f 84 00
> RSP: 0018:ffffa776017bf6a0 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffffa77600d87000 RCX: 000000000000002b
> RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffffa77680d87000
> RBP: 000000000000e000 R08: 0000000000000000 R09: 0000000000000000
> R10: ffff98f4c46aa508 R11: 0000000000000000 R12: ffff98f4c46aa508
> R13: ffff98f4c46aa008 R14: ffffa77600d4a000 R15: ffffa77600d4a018
> FS:  00007feeb5aae980(0000) GS:ffff98f5c4dc0000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f22cb9a4520 CR3: 00000001043ba000 CR4: 00000000003506f0
> Call Trace:
>  <TASK>
>  ? die+0x36/0x90
>  ? do_trap+0xdd/0x100
>  ? sg_init_one+0x85/0xa0
>  ? do_error_trap+0x65/0x80
>  ? sg_init_one+0x85/0xa0
>  ? exc_invalid_op+0x50/0x70
>  ? sg_init_one+0x85/0xa0
>  ? asm_exc_invalid_op+0x1a/0x20
>  ? sg_init_one+0x85/0xa0
>  nvkm_firmware_ctor+0x14a/0x250 [nouveau]
>  nvkm_falcon_fw_ctor+0x42/0x70 [nouveau]
>  ga102_gsp_booter_ctor+0xb4/0x1a0 [nouveau]
>  r535_gsp_oneinit+0xb3/0x15f0 [nouveau]
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? nvkm_udevice_new+0x95/0x140 [nouveau]
>  ? srso_return_thunk+0x5/0x5f
>  ? srso_return_thunk+0x5/0x5f
>  ? ktime_get+0x47/0xb0
> 
> Fix this by using the non-coherent allocator instead, I think there
> might be a better answer to this, but it involve ripping up some of
> APIs using sg lists.
> 
> v2: fix build warning
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Cc: stable@vger.kernel.org

Does this need the following fixes tag?

Fixes: 2541626cfb79 ("drm/nouveau/acr: use common falcon HS FW code for ACR FWs")

> ---
>  drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 9 ++++++---
>  drivers/gpu/drm/nouveau/nvkm/falcon/fw.c     | 6 ++++++
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> index adc60b25f8e6..0af01a0ec601 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
> @@ -205,7 +205,8 @@ nvkm_firmware_dtor(struct nvkm_firmware *fw)
>  		break;
>  	case NVKM_FIRMWARE_IMG_DMA:
>  		nvkm_memory_unref(&memory);
> -		dma_free_coherent(fw->device->dev, sg_dma_len(&fw->mem.sgl), fw->img, fw->phys);
> +		dma_free_noncoherent(fw->device->dev, sg_dma_len(&fw->mem.sgl),
> +				     fw->img, fw->phys, DMA_TO_DEVICE);
>  		break;
>  	case NVKM_FIRMWARE_IMG_SGT:
>  		nvkm_memory_unref(&memory);
> @@ -236,10 +237,12 @@ nvkm_firmware_ctor(const struct nvkm_firmware_func *func, const char *name,
>  		break;
>  	case NVKM_FIRMWARE_IMG_DMA: {
>  		dma_addr_t addr;
> -
>  		len = ALIGN(fw->len, PAGE_SIZE);
>  
> -		fw->img = dma_alloc_coherent(fw->device->dev, len, &addr, GFP_KERNEL);
> +		fw->img = dma_alloc_noncoherent(fw->device->dev,
> +						len, &addr,
> +						DMA_TO_DEVICE,
> +						GFP_KERNEL);
>  		if (fw->img) {
>  			memcpy(fw->img, src, fw->len);
>  			fw->phys = addr;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> index 80a480b12174..a1c8545f1249 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/falcon/fw.c
> @@ -89,6 +89,12 @@ nvkm_falcon_fw_boot(struct nvkm_falcon_fw *fw, struct nvkm_subdev *user,
>  		nvkm_falcon_fw_dtor_sigs(fw);
>  	}
>  
> +	/* after last write to the img, sync dma mappings */
> +	dma_sync_single_for_device(fw->fw.device->dev,
> +				   fw->fw.phys,
> +				   sg_dma_len(&fw->fw.mem.sgl),
> +				   DMA_TO_DEVICE);
> +
>  	FLCNFW_DBG(fw, "resetting");
>  	fw->func->reset(fw);
>  
> -- 
> 2.46.0
> 
