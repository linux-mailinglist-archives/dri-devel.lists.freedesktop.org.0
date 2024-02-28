Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728F286AC41
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 11:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BE210E036;
	Wed, 28 Feb 2024 10:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eCDM+bPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0C910E036
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709116515;
 bh=NRqr1dpwYUlQ6FoUMm6M+TEnJE1+w5bLR4PyT/dhe/I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eCDM+bPLoXmAIxi0rf4MO760UiCKetBnx9hA3AVD+az3ori0UWAvGiusf73t8rSq8
 ePsDM+F4ugmgznTDD/0zA6ZA3P1GtfDQPU7lg0mq9JbZ8On0ZQVvKtcf5S7XWY59Iy
 b7/P6kXGmZpO8flFgbTIU+CTChA9unb9t8zJDfZD3VtcwiogDZErY4Z7HGSSSTwj8o
 aZ+teo0Hk87aBKP6GrU9EL3MnBUsxUGk1ylWtIgl57DFEt/HtHn/C3d0uyKP5wEd06
 MDDn/KRnVNRzDe5635yStUr976zj33VZozQXZJIlFLGetI9j8RT1e+ACiDksGklB0B
 puk4nRHzVxzbw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 14B6037820D0;
 Wed, 28 Feb 2024 10:35:14 +0000 (UTC)
Date: Wed, 28 Feb 2024 11:35:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, "Marty E . Plummer"
 <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>, =?UTF-8?B?Q2w=?=
 =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi
 <ishitatsuyuki@gmail.com>, Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Grant Likely
 <grant.likely@linaro.org>
Subject: Re: [PATCH v5 12/14] drm/panthor: Allow driver compilation
Message-ID: <20240228113512.300db712@collabora.com>
In-Reply-To: <20240218214131.3035480-13-boris.brezillon@collabora.com>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
 <20240218214131.3035480-13-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Sun, 18 Feb 2024 22:41:26 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Now that all blocks are available, we can add/update Kconfig/Makefile
> files to allow compilation.
> 
> v4:
> - Add Steve's R-b
> 
> v3:
> - Add a dep on DRM_GPUVM
> - Fix dependencies in Kconfig
> - Expand help text to (hopefully) describe which GPUs are to be
>   supported by this driver and which are for panfrost.
> 
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora
> Reviewed-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/Kconfig          |  2 ++
>  drivers/gpu/drm/Makefile         |  1 +
>  drivers/gpu/drm/panthor/Kconfig  | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/Makefile | 15 +++++++++++++++
>  4 files changed, 41 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/Kconfig
>  create mode 100644 drivers/gpu/drm/panthor/Makefile
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 872edb47bb53..ad8227d88840 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -370,6 +370,8 @@ source "drivers/gpu/drm/lima/Kconfig"
>  
>  source "drivers/gpu/drm/panfrost/Kconfig"
>  
> +source "drivers/gpu/drm/panthor/Kconfig"
> +
>  source "drivers/gpu/drm/aspeed/Kconfig"
>  
>  source "drivers/gpu/drm/mcde/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 104b42df2e95..6eb2b553a163 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -179,6 +179,7 @@ obj-$(CONFIG_DRM_XEN) += xen/
>  obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
>  obj-$(CONFIG_DRM_LIMA)  += lima/
>  obj-$(CONFIG_DRM_PANFROST) += panfrost/
> +obj-$(CONFIG_DRM_PANTHOR) += panthor/
>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
>  obj-$(CONFIG_DRM_TIDSS) += tidss/
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> new file mode 100644
> index 000000000000..159845e51116
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +config DRM_PANTHOR
> +	tristate "Panthor (DRM support for ARM Mali CSF-based GPUs)"
> +	depends on DRM
> +	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
> +	depends on MMU
> +	select DRM_GPUVM
> +	select DRM_EXEC
> +	select DRM_SCHED
> +	select IOMMU_SUPPORT
> +	select IOMMU_IO_PGTABLE_LPAE
> +	select DRM_GEM_SHMEM_HELPER
> +	select PM_DEVFREQ
> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	help
> +	  DRM driver for ARM Mali CSF-based GPUs.
> +
> +	  This driver is for Mali (or Immortalis) Valhall Gxxx GPUs.
> +
> +	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
> +	  be supported with the panfrost driver as they are not CSF GPUs.
> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> new file mode 100644
> index 000000000000..64193a484879
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +panthor-y := \
> +	panthor_devfreq.o \
> +	panthor_device.o \
> +	panthor_drv.o \
> +	panthor_gem.o \
> +	panthor_gpu.o \
> +	panthor_heap.o \
> +	panthor_heap.o \

Duplicate panthor_heap.o

> +	panthor_fw.o \

Should be moved before panthor_gem.o if we want to keep things
alphabetically ordered.

I'll fix both of these when applying the patch series to drm-misc-next.

> +	panthor_mmu.o \
> +	panthor_sched.o
> +
> +obj-$(CONFIG_DRM_PANTHOR) += panthor.o

