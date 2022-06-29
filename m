Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 504EE55F6D0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 08:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6A710F3FC;
	Wed, 29 Jun 2022 06:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5BF10E198;
 Wed, 29 Jun 2022 06:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 854E940C62;
 Wed, 29 Jun 2022 08:40:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pU0wAbFoBRnS; Wed, 29 Jun 2022 08:40:21 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 936C240C41;
 Wed, 29 Jun 2022 08:40:18 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E158636016C;
 Wed, 29 Jun 2022 08:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1656484818; bh=c5X9p3SygrAeI8kAv4cnUEr14Zu67PfkDBqu5n1JZJE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Dk1heA72TzwfqFM5AthBnHTC6DdPNKvqtIGAYZbJH355/RVnt8ijwSIqu7vAttHPz
 WX0p2SfS1SVHlAS1p1yD4GOPcww+7e+8Exx0MOiTrCnsrz24ZGcufvDpM/Zewvu/Cr
 GmWw0z/B/OoxA6n6QgI6GEuF4woAkKSKa2Gz0HFU=
Message-ID: <b8271f0c-d6a3-4194-1959-e112859756a3@shipmail.org>
Date: Wed, 29 Jun 2022 08:40:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 02/22] drm/gem: Move mapping of imported dma-bufs to
 drm_gem_mmap_obj()
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <20220526235040.678984-3-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220526235040.678984-3-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/27/22 01:50, Dmitry Osipenko wrote:
> Drivers that use drm_gem_mmap() and drm_gem_mmap_obj() helpers don't
> handle imported dma-bufs properly, which results in mapping of something
> else than the imported dma-buf. For example, on NVIDIA Tegra we get a hard
> lockup when userspace writes to the memory mapping of a dma-buf that was
> imported into Tegra's DRM GEM.
>
> To fix this bug, move mapping of imported dma-bufs to drm_gem_mmap_obj().
> Now mmaping of imported dma-bufs works properly for all DRM drivers.
Same comment about Fixes: as in patch 1,
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/gpu/drm/drm_gem.c              | 3 +++
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ---------
>   drivers/gpu/drm/tegra/gem.c            | 4 ++++
>   3 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 86d670c71286..7c0b025508e4 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1038,6 +1038,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>   	if (obj_size < vma->vm_end - vma->vm_start)
>   		return -EINVAL;
>   
> +	if (obj->import_attach)
> +		return dma_buf_mmap(obj->dma_buf, vma, 0);

If we start enabling mmaping of imported dma-bufs on a majority of 
drivers in this way, how do we ensure that user-space is not blindly 
using the object mmap without calling the needed DMA_BUF_IOCTL_SYNC 
which is needed before and after cpu access of mmap'ed dma-bufs?

I was under the impression (admittedly without looking) that the few 
drivers that actually called into dma_buf_mmap() had some private 
user-mode driver code in place that ensured this happened.

/Thomas


> +
>   	/* Take a ref for this mapping of the object, so that the fault
>   	 * handler can dereference the mmap offset's pointer to the object.
>   	 * This reference is cleaned up by the corresponding vm_close
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 8ad0e02991ca..6190f5018986 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -609,17 +609,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_ops);
>    */
>   int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma)
>   {
> -	struct drm_gem_object *obj = &shmem->base;
>   	int ret;
>   
> -	if (obj->import_attach) {
> -		/* Drop the reference drm_gem_mmap_obj() acquired.*/
> -		drm_gem_object_put(obj);
> -		vma->vm_private_data = NULL;
> -
> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
> -	}
> -
>   	ret = drm_gem_shmem_get_pages(shmem);
>   	if (ret) {
>   		drm_gem_vm_close(vma);
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 7c7dd84e6db8..f92aa20d63bb 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -564,6 +564,10 @@ int __tegra_gem_mmap(struct drm_gem_object *gem, struct vm_area_struct *vma)
>   {
>   	struct tegra_bo *bo = to_tegra_bo(gem);
>   
> +	/* imported dmu-buf is mapped by drm_gem_mmap_obj()  */
> +	if (gem->import_attach)
> +		return 0;
> +
>   	if (!bo->pages) {
>   		unsigned long vm_pgoff = vma->vm_pgoff;
>   		int err;
