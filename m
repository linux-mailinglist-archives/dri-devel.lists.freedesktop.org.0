Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A57C979F6
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 14:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1EE10E3D8;
	Mon,  1 Dec 2025 13:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZtRzSJGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B89E10E3D8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mTELGbFpVaCUrMTgdQQ8USkCzx9ZbeWZ86YtiywIlwg=; b=ZtRzSJGP8cVftW4U//TMs37z4y
 V9Ai2YU/1gDApQ3tuGxhuEDfXo1Eyi9yDsxUCDODO+6XaJyhPETkLOLdbx65NH20Uo4uEWPsH4xR2
 BI3LJuRwRpHRxW3oWN2OJUTkcX3VIwuUgekjTX4tmP3ekRABvgRN6yidPf50ChH/9exFR5ctf40nR
 gPKImJPwkQxW+VLdy4EgYzyt7uJba5fgprn7RbWDKXFe9hkTGANOGzJ+b9LEt45vgy1cBi3UL+Jiy
 uAj5L74xH9fju6+eFN2xAItVga6RNs8pQir1ycDanpHSUfI3da7M7LICrumSPqmupRtAoJVvdmvb8
 gCMrcCVA==;
Received: from [189.7.87.198] (helo=[192.168.0.4])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vQ43j-007Ofq-Ml; Mon, 01 Dec 2025 14:35:20 +0100
Message-ID: <a4787977-8249-484b-8ed2-c243e0a74d21@igalia.com>
Date: Mon, 1 Dec 2025 10:35:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: set the V3D GPU sg segment limitation
To: Xiaolei Wang <xiaolei.wang@windriver.com>, mwen@igalia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251113092538.1971286-1-xiaolei.wang@windriver.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <20251113092538.1971286-1-xiaolei.wang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Xiaolei,

On 13/11/25 06:25, Xiaolei Wang wrote:
> When using V3D rendering, the kernel occasionally reports a
> segment size mismatch. This is because 'max_seg_size' is not

Could you mention that this only happens when CONFIG_DMA_API_DEBUG is
enabled?

Best Regards,
- Maíra

> set. The kernel defaults to 64K. Based on V3D's addressing
> capabilities, setting 'max_seg_size' to the maximum will
> prevent 'debug_dma_map_sg()' from complaining about the
> over-mapping of the V3D segment length.
> 
> DMA-API: v3d 1002000000.v3d: mapping sg segment longer than device
>   claims to support [len=8290304] [max=65536]
> WARNING: CPU: 0 PID: 493 at kernel/dma/debug.c:1179 debug_dma_map_sg+0x330/0x388
> CPU: 0 UID: 0 PID: 493 Comm: Xorg Not tainted 6.12.53-yocto-standard #1
> Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : debug_dma_map_sg+0x330/0x388
> lr : debug_dma_map_sg+0x330/0x388
> sp : ffff8000829a3ac0
> x29: ffff8000829a3ac0 x28: 0000000000000001 x27: ffff8000813fe000
> x26: ffffc1ffc0000000 x25: ffff00010fdeb760 x24: 0000000000000000
> x23: ffff8000816a9bf0 x22: 0000000000000001 x21: 0000000000000002
> x20: 0000000000000002 x19: ffff00010185e810 x18: ffffffffffffffff
> x17: 69766564206e6168 x16: 74207265676e6f6c x15: 20746e656d676573
> x14: 20677320676e6970 x13: 5d34303334393134 x12: 0000000000000000
> x11: 00000000000000c0 x10: 00000000000009c0 x9 : ffff8000800e0b7c
> x8 : ffff00010a315ca0 x7 : ffff8000816a5110 x6 : 0000000000000001
> x5 : 000000000000002b x4 : 0000000000000002 x3 : 0000000000000008
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010a315280
> Call trace:
>   debug_dma_map_sg+0x330/0x388
>   __dma_map_sg_attrs+0xc0/0x278
>   dma_map_sgtable+0x30/0x58
>   drm_gem_shmem_get_pages_sgt+0xb4/0x140
>   v3d_bo_create_finish+0x28/0x130 [v3d]
>   v3d_create_bo_ioctl+0x54/0x180 [v3d]
>   drm_ioctl_kernel+0xc8/0x140
>   drm_ioctl+0x2d4/0x4d8
> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>   drivers/gpu/drm/v3d/v3d_drv.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index c5a3bbbc74c5..f4da7a94e401 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -377,6 +377,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto clk_disable;
>   
> +	dma_set_max_seg_size(&pdev->dev, UINT_MAX);

I believe I'd

> +
>   	v3d->va_width = 30 + V3D_GET_FIELD(mmu_debug, V3D_MMU_VA_WIDTH);
>   
>   	ident1 = V3D_READ(V3D_HUB_IDENT1);

