Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC2249AAA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 12:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A3F6E21A;
	Wed, 19 Aug 2020 10:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE9C6E219
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 10:44:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07JAhS5P011860;
 Wed, 19 Aug 2020 05:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1597833808;
 bh=FQ/P96RlmX4WL6iS15Y4+TdcnOXuRLw5jD5fcCLIPRM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=hq3DNU8GyRjS+6Rnn7skcN1ku0AwIVNiB8bZ3hVmcFFpSNzKBAUK00toMRz1KnLCE
 NxcnurQiObMWPuedh5shwC1BCu6hnnUua5zjmH8lZNKmxDlxcyNuA14gMqszA0YtC2
 JjErGKTXzkqOL97zfTZs8nV570QUwaiW3pOgGLAw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07JAhSRj019744
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 19 Aug 2020 05:43:28 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 19
 Aug 2020 05:43:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 19 Aug 2020 05:43:27 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07JAhFih039071;
 Wed, 19 Aug 2020 05:43:15 -0500
Subject: Re: [PATCH 10/20] drm/omapdrm: Introduce GEM object functions
To: Thomas Zimmermann <tzimmermann@suse.de>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux@armlinux.org.uk>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <l.stach@pengutronix.de>,
 <christian.gmeiner@gmail.com>, <inki.dae@samsung.com>,
 <jy0922.shim@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <kgene@kernel.org>, <krzk@kernel.org>,
 <patrik.r.jakobsson@gmail.com>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
 <matthias.bgg@gmail.com>, <robdclark@gmail.com>, <sean@poorly.run>,
 <bskeggs@redhat.com>, <eric@anholt.net>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <rodrigosiqueiramelo@gmail.com>, <hamohammed.sa@gmail.com>,
 <oleksandr_andrushchenko@epam.com>, <hyun.kwon@xilinx.com>,
 <laurent.pinchart@ideasonboard.com>, <michal.simek@xilinx.com>,
 <sumit.semwal@linaro.org>, <evan.quan@amd.com>,
 <Hawking.Zhang@amd.com>, <tianci.yin@amd.com>, <marek.olsak@amd.com>,
 <hdegoede@redhat.com>, <andrey.grodzovsky@amd.com>,
 <Felix.Kuehling@amd.com>, <xinhui.pan@amd.com>, <aaron.liu@amd.com>,
 <nirmoy.das@amd.com>, <chris@chris-wilson.co.uk>,
 <matthew.auld@intel.com>, <abdiel.janulgue@linux.intel.com>,
 <tvrtko.ursulin@linux.intel.com>, <andi.shyti@intel.com>,
 <sam@ravnborg.org>, <miaoqinglang@huawei.com>, <emil.velikov@collabora.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-11-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <8739b085-0342-4c43-60e3-a21d6b257319@ti.com>
Date: Wed, 19 Aug 2020 13:43:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200813083644.31711-11-tzimmermann@suse.de>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 13/08/2020 11:36, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in omapdrm.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c |  9 ---------
>  drivers/gpu/drm/omapdrm/omap_gem.c | 16 +++++++++++++++-
>  drivers/gpu/drm/omapdrm/omap_gem.h |  1 -
>  3 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 53d5e184ee77..2e598b8b72af 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -521,12 +521,6 @@ static int dev_open(struct drm_device *dev, struct drm_file *file)
>  	return 0;
>  }
>  
> -static const struct vm_operations_struct omap_gem_vm_ops = {
> -	.fault = omap_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static const struct file_operations omapdriver_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
> @@ -549,10 +543,7 @@ static struct drm_driver omap_drm_driver = {
>  #endif
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = omap_gem_prime_export,
>  	.gem_prime_import = omap_gem_prime_import,
> -	.gem_free_object_unlocked = omap_gem_free_object,
> -	.gem_vm_ops = &omap_gem_vm_ops,
>  	.dumb_create = omap_gem_dumb_create,
>  	.dumb_map_offset = omap_gem_dumb_map_offset,
>  	.ioctls = ioctls,
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index d0d12d5dd76c..d68dc63dea0a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -487,7 +487,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
>   * vma->vm_private_data points to the GEM object that is backing this
>   * mapping.
>   */
> -vm_fault_t omap_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t omap_gem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -1169,6 +1169,18 @@ static bool omap_gem_validate_flags(struct drm_device *dev, u32 flags)
>  	return true;
>  }
>  
> +static const struct vm_operations_struct omap_gem_vm_ops = {
> +	.fault = omap_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs omap_gem_object_funcs = {
> +	.free = omap_gem_free_object,
> +	.export = omap_gem_prime_export,
> +	.vm_ops = &omap_gem_vm_ops,
> +};
> +
>  /* GEM buffer object constructor */
>  struct drm_gem_object *omap_gem_new(struct drm_device *dev,
>  		union omap_gem_size gsize, u32 flags)
> @@ -1236,6 +1248,8 @@ struct drm_gem_object *omap_gem_new(struct drm_device *dev,
>  		size = PAGE_ALIGN(gsize.bytes);
>  	}
>  
> +	obj->funcs = &omap_gem_object_funcs;
> +
>  	/* Initialize the GEM object. */
>  	if (!(flags & OMAP_BO_MEM_SHMEM)) {
>  		drm_gem_private_object_init(dev, obj, size);
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
> index 729b7812a815..9e6b5c8195d9 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.h
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.h
> @@ -69,7 +69,6 @@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags);
>  struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
>  		struct dma_buf *buffer);
>  
> -vm_fault_t omap_gem_fault(struct vm_fault *vmf);
>  int omap_gem_roll(struct drm_gem_object *obj, u32 roll);
>  void omap_gem_cpu_sync_page(struct drm_gem_object *obj, int pgoff);
>  void omap_gem_dma_sync_buffer(struct drm_gem_object *obj,

omap_gem_free_object() can also be made static, and removed from omap_gem.h.

Tested on AM5 EVM.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
