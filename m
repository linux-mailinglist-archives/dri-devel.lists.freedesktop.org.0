Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585189BE97
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 14:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A4E1124E5;
	Mon,  8 Apr 2024 12:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hs01.dakr.org (hs01.dk-develop.de [173.249.23.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460301124E5;
 Mon,  8 Apr 2024 12:02:17 +0000 (UTC)
Message-ID: <3c4dcf1c-e833-4c03-a009-c92e42ed31f5@dakr.org>
Date: Mon, 8 Apr 2024 14:02:07 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] nouveau: fix devinit paths to only handle display on GSP.
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240408064243.2219527-1-airlied@gmail.com>
Content-Language: en-US
From: Danilo Krummrich <me@dakr.org>
In-Reply-To: <20240408064243.2219527-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 4/8/24 08:42, Dave Airlie wrote:
> This reverts:
> nouveau/gsp: don't check devinit disable on GSP.
> and applies a further fix.
> 
> It turns out the open gpu driver, checks this register, but only for display.
> 
> Match that behaviour and only disable displays on turings.
> 
> Fixes: 5d4e8ae6e57b ("nouveau/gsp: don't check devinit disable on GSP.")
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c | 12 ++++++++----
>   drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c  |  1 +
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> index 7bcbc4895ec2..271bfa038f5b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> @@ -25,6 +25,7 @@
>   
>   #include <subdev/bios.h>
>   #include <subdev/bios/init.h>
> +#include <subdev/gsp.h>
>   
>   void
>   gm107_devinit_disable(struct nvkm_devinit *init)
> @@ -33,10 +34,13 @@ gm107_devinit_disable(struct nvkm_devinit *init)
>   	u32 r021c00 = nvkm_rd32(device, 0x021c00);
>   	u32 r021c04 = nvkm_rd32(device, 0x021c04);
>   
> -	if (r021c00 & 0x00000001)
> -		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
> -	if (r021c00 & 0x00000004)
> -		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 2);
> +	/* gsp only wants to enable/disable display */
> +	if (!nvkm_gsp_rm(device->gsp)) {
> +		if (r021c00 & 0x00000001)
> +			nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
> +		if (r021c00 & 0x00000004)
> +			nvkm_subdev_disable(device, NVKM_ENGINE_CE, 2);
> +	}
>   	if (r021c04 & 0x00000001)
>   		nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> index 11b4c9c274a1..666eb93b1742 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> @@ -41,6 +41,7 @@ r535_devinit_new(const struct nvkm_devinit_func *hw,
>   
>   	rm->dtor = r535_devinit_dtor;
>   	rm->post = hw->post;
> +	rm->disable = hw->disable;
>   
>   	ret = nv50_devinit_new_(rm, device, type, inst, pdevinit);
>   	if (ret)
