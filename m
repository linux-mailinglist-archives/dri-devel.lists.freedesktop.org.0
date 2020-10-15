Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 721E928F461
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 16:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E116ED17;
	Thu, 15 Oct 2020 14:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00B76ED17;
 Thu, 15 Oct 2020 14:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVdBYlHA+ZZ+5Hh3DDrQxM7vxQE+6uYWnUoJx+JLeWkROSQrqHtebXxOONTGNcpSr2VdikKaW/t+6ExBHDQgqHQigrKXx1AneUpo55Paj61VDSK3uyWpOuhyQl7epJab0K8yPA2JAswjsjo692MvK8kZ7xMxsL0IwUSR5eYv9u8X/bTBQmv7p+y1CCJmRp4ujc+VOY6IWQdes609C82t/Nq07uAhrtcLc0vtHVwfaxxJe9UBykPoc7ANdAGaU+/PaQIQfAkj+vCQ5eG53FDuX8u0a9hnRsfCnme8AQ+ZEyBzkdehFbouloOMyDLM7GoFc9YTqSbltrg46Scz0IPdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElSABT3dzYVayvBI+cG0Ylje7BwHhTr2iqRweK77mNg=;
 b=WE/s9LqvzFrHOJjACjHySCn3BVo9HvogD3tfbqQfGN3SHuDVkyQexge6HQnbU4nAZaneflYPS9huYIF4Ej5YCJe0zO7TOSPbnr9Iui3s744Uosc6QzoVUjFVWP0Y3iR8vmhTJtOhTxAMxqAFYLkk/K1f7CGgSpU6EeqUE75tR1nOjpe0lfTdSrO3cowCi0NfKDW17woLaVxEUnRDGYXA4WIy4XpJ1zW0QXmdPMPNR+zs7/DX0kDPaAFGI56CJUTqPmJDfYqnyccY0V5sHKtDs8Mgp/H8vNKusiPk22box3aLg08lyC7qFCaW8H6OnrnMXVvaXEZBsmQd+GZaBUb7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElSABT3dzYVayvBI+cG0Ylje7BwHhTr2iqRweK77mNg=;
 b=r6pk+dnZN73mOjvhDP5xuMOwdktd8SA3qRp5VnbFn+/BUZO/qrcsoOhfSw/aAFHVQTPPoRdZ42OAJKw7C0H5RBq0x/0EJY/MuW1hFPwlFSJs9SzDu2/FtI4wjkDZOvjlnd5e4Y6sHrmoAwwB1E/qPTWUQoYZy8W89HBUAJVCQhc=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3951.namprd12.prod.outlook.com (2603:10b6:208:16b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 14:08:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 14:08:29 +0000
Subject: Re: [PATCH v4 05/10] drm/ttm: Add vmap/vunmap to TTM and TTM GEM
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-6-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <935d5771-5645-62a6-849c-31e286db1e30@amd.com>
Date: Thu, 15 Oct 2020 16:08:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015123806.32416-6-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [80.187.123.114]
X-ClientProxiedBy: AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.56] (80.187.123.114) by
 AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20 via Frontend Transport; Thu, 15 Oct 2020 14:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13dc04ab-0081-4173-237e-08d87113c9f4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39516C6629AAF06CAD2C31B583020@MN2PR12MB3951.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDfIXr9/7X5kT1QrRcll0NCUVn6kZ8pGzIQQCJD48eLvwHgwtolumBsnTl8tYr9tkSi/N3CieMnkAAyeJepHo6/z+4WIRopBXoeGwyNCzI4zKnXqdL+yRPQ1PwOb7oVTFNjZ+Mc8g9yZHCZxbQf3MkD9QDXXLnWs3ZP/pl9hdtICYNkqzqvsawUK09jIOeVs0PSYzt9E2Sjx9VKeYI3GUSsq4gnkqmgZf/fPq2duqazk4l4Md4erwreo/2QJZ9qlQLEEy+AbJ8HDEyojAfuXRHASHmdzA3olwGP4QgUMnIv8lWx5JGeEdhkSBkgk5LS9bF81q9b3+z2/ss8JouKYD9MOil4qFhfdmzWqq0TfhfgxPiNf1x3PvUV8kJ/kJwCfSnu2IfWxKUIPFaLZhISOXTVmapL6F3TkjJ516wCoNeJvAHLsz8QSj9awQUzPY6Ar
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(83380400001)(86362001)(8936002)(6666004)(956004)(6486002)(34490700002)(7406005)(2906002)(2616005)(16576012)(16526019)(5660300002)(31696002)(316002)(36756003)(66476007)(66556008)(66946007)(186003)(8676002)(52116002)(26005)(4326008)(7416002)(478600001)(31686004)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: WFQveVdFhYq2o10uQNOnzM2DZpX9ODAzL3xVKiUrWXH9Sewxa5qPVTBHbCrzZeNwRUWPgaHrhvY3+Iu89O5vBnpPlQ4W8nLhzEHWk7tAlj4zRbJC9DWSU6MaKOc2vZZc2KVhsAmzW7s1rIhwy28V9jRrYltMyPr1dJZTSo34VEhdWUPY6sEa/pQHJKP7WmTG6Xb5wSm91jx1KoKdL1SRPUW1g3cAGPIMerhXDV6VBKAHCcPEo/JXMrhcG8H/Fdm4+s5KC3kTOAWuVkF+koZGy/uPSMpsDd4fRa8b4Cvd4jv+/Px/wLqr2FONG/EGeKHUOzvlu9LylkyHI8NAKWQG9vY39OzkaeYRfiZ53UKeWUGIT9m7xrbOK7t1cmeY8b4gW0ho5rKyYIU6qgWjii3eIVXaZWMS2xG7YLh8dgKu1fS+eFyQe1NfphHX5aXTEIsehsFsHuy+tu9IcloFZxbd8s2y6K+LV4CoUdSMjGvS8lTHNT05megqHOF1e0i99t/nup/iLImR001KBbm1muR2j064yvZ7xx+lSvrh3wD44pjZrZ+F9sXxoP4b7WBKbEVK/JBs/1KCUuZqOB0Kg8h+sUQQCDIfZiKVR+RbyEqAH6hultzvVfomRqIIsVEgiVitkdLZLD7yQT/LeTUr9mvm6g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dc04ab-0081-4173-237e-08d87113c9f4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 14:08:29.1475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foxGeDB2c3N7aCsaE2FooMCOwo6Uufe5wNMOP0BllgmW7Ma8XHm6bEp3UJWrPfjC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3951
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.10.20 um 14:38 schrieb Thomas Zimmermann:
> The new functions ttm_bo_{vmap,vunmap}() map and unmap a TTM BO in kernel
> address space. The mapping's address is returned as struct dma_buf_map.
> Each function is a simplified version of TTM's existing kmap code. Both
> functions respect the memory's location ani/or writecombine flags.
>
> On top TTM's functions, GEM TTM helpers got drm_gem_ttm_{vmap,vunmap}(),
> two helpers that convert a GEM object into the TTM BO and forward the call
> to TTM's vmap/vunmap. These helpers can be dropped into the rsp GEM object
> callbacks.
>
> v4:
> 	* drop ttm_kmap_obj_to_dma_buf() in favor of vmap helpers (Daniel,
> 	  Christian)

Bunch of minor comments below, but over all look very solid to me.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_gem_ttm_helper.c | 38 +++++++++++++++
>   drivers/gpu/drm/ttm/ttm_bo_util.c    | 72 ++++++++++++++++++++++++++++
>   include/drm/drm_gem_ttm_helper.h     |  6 +++
>   include/drm/ttm/ttm_bo_api.h         | 28 +++++++++++
>   include/linux/dma-buf-map.h          | 20 ++++++++
>   5 files changed, 164 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
> index 0e4fb9ba43ad..db4c14d78a30 100644
> --- a/drivers/gpu/drm/drm_gem_ttm_helper.c
> +++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
> @@ -49,6 +49,44 @@ void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent,
>   }
>   EXPORT_SYMBOL(drm_gem_ttm_print_info);
>   
> +/**
> + * drm_gem_ttm_vmap() - vmap &ttm_buffer_object
> + * @gem: GEM object.
> + * @map: [out] returns the dma-buf mapping.
> + *
> + * Maps a GEM object with ttm_bo_vmap(). This function can be used as
> + * &drm_gem_object_funcs.vmap callback.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> +		     struct dma_buf_map *map)
> +{
> +	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
> +
> +	return ttm_bo_vmap(bo, map);
> +
> +}
> +EXPORT_SYMBOL(drm_gem_ttm_vmap);
> +
> +/**
> + * drm_gem_ttm_vunmap() - vunmap &ttm_buffer_object
> + * @gem: GEM object.
> + * @map: dma-buf mapping.
> + *
> + * Unmaps a GEM object with ttm_bo_vunmap(). This function can be used as
> + * &drm_gem_object_funcs.vmap callback.
> + */
> +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> +			struct dma_buf_map *map)
> +{
> +	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
> +
> +	ttm_bo_vunmap(bo, map);
> +}
> +EXPORT_SYMBOL(drm_gem_ttm_vunmap);
> +
>   /**
>    * drm_gem_ttm_mmap() - mmap &ttm_buffer_object
>    * @gem: GEM object.
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index bdee4df1f3f2..80c42c774c7d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -32,6 +32,7 @@
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/drm_vma_manager.h>
> +#include <linux/dma-buf-map.h>
>   #include <linux/io.h>
>   #include <linux/highmem.h>
>   #include <linux/wait.h>
> @@ -526,6 +527,77 @@ void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map)
>   }
>   EXPORT_SYMBOL(ttm_bo_kunmap);
>   
> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
> +{
> +	struct ttm_resource *mem = &bo->mem;
> +	int ret;
> +
> +	ret = ttm_mem_io_reserve(bo->bdev, mem);
> +	if (ret)
> +		return ret;
> +
> +	if (mem->bus.is_iomem) {
> +		void __iomem *vaddr_iomem;
> +		unsigned long size = bo->num_pages << PAGE_SHIFT;

Please use uint64_t here and make sure to cast bo->num_pages before 
shifting.

We have an unit tests of allocating a 8GB BO and that should work on a 
32bit machine as well :)

> +
> +		if (mem->bus.addr)
> +			vaddr_iomem = (void *)(((u8 *)mem->bus.addr));
> +		else if (mem->placement & TTM_PL_FLAG_WC)

I've just nuked the TTM_PL_FLAG_WC flag in drm-misc-next. There is a new 
mem->bus.caching enum as replacement.

> +			vaddr_iomem = ioremap_wc(mem->bus.offset, size);
> +		else
> +			vaddr_iomem = ioremap(mem->bus.offset, size);
> +
> +		if (!vaddr_iomem)
> +			return -ENOMEM;
> +
> +		dma_buf_map_set_vaddr_iomem(map, vaddr_iomem);
> +
> +	} else {
> +		struct ttm_operation_ctx ctx = {
> +			.interruptible = false,
> +			.no_wait_gpu = false
> +		};
> +		struct ttm_tt *ttm = bo->ttm;
> +		pgprot_t prot;
> +		void *vaddr;
> +
> +		BUG_ON(!ttm);

I think we can drop this, populate will just crash badly anyway.

> +
> +		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * We need to use vmap to get the desired page protection
> +		 * or to make the buffer object look contiguous.
> +		 */
> +		prot = ttm_io_prot(mem->placement, PAGE_KERNEL);

The calling convention has changed on drm-misc-next as well, but should 
be trivial to adapt.

Regards,
Christian.

> +		vaddr = vmap(ttm->pages, bo->num_pages, 0, prot);
> +		if (!vaddr)
> +			return -ENOMEM;
> +
> +		dma_buf_map_set_vaddr(map, vaddr);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_bo_vmap);
> +
> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
> +{
> +	if (dma_buf_map_is_null(map))
> +		return;
> +
> +	if (map->is_iomem)
> +		iounmap(map->vaddr_iomem);
> +	else
> +		vunmap(map->vaddr);
> +	dma_buf_map_clear(map);
> +
> +	ttm_mem_io_free(bo->bdev, &bo->mem);
> +}
> +EXPORT_SYMBOL(ttm_bo_vunmap);
> +
>   static int ttm_bo_wait_free_node(struct ttm_buffer_object *bo,
>   				 bool dst_use_tt)
>   {
> diff --git a/include/drm/drm_gem_ttm_helper.h b/include/drm/drm_gem_ttm_helper.h
> index 118cef76f84f..7c6d874910b8 100644
> --- a/include/drm/drm_gem_ttm_helper.h
> +++ b/include/drm/drm_gem_ttm_helper.h
> @@ -10,11 +10,17 @@
>   #include <drm/ttm/ttm_bo_api.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   
> +struct dma_buf_map;
> +
>   #define drm_gem_ttm_of_gem(gem_obj) \
>   	container_of(gem_obj, struct ttm_buffer_object, base)
>   
>   void drm_gem_ttm_print_info(struct drm_printer *p, unsigned int indent,
>   			    const struct drm_gem_object *gem);
> +int drm_gem_ttm_vmap(struct drm_gem_object *gem,
> +		     struct dma_buf_map *map);
> +void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
> +			struct dma_buf_map *map);
>   int drm_gem_ttm_mmap(struct drm_gem_object *gem,
>   		     struct vm_area_struct *vma);
>   
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 37102e45e496..2c59a785374c 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -48,6 +48,8 @@ struct ttm_bo_global;
>   
>   struct ttm_bo_device;
>   
> +struct dma_buf_map;
> +
>   struct drm_mm_node;
>   
>   struct ttm_placement;
> @@ -494,6 +496,32 @@ int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>    */
>   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>   
> +/**
> + * ttm_bo_vmap
> + *
> + * @bo: The buffer object.
> + * @map: pointer to a struct dma_buf_map representing the map.
> + *
> + * Sets up a kernel virtual mapping, using ioremap or vmap to the
> + * data in the buffer object. The parameter @map returns the virtual
> + * address as struct dma_buf_map. Unmap the buffer with ttm_bo_vunmap().
> + *
> + * Returns
> + * -ENOMEM: Out of memory.
> + * -EINVAL: Invalid range.
> + */
> +int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> +
> +/**
> + * ttm_bo_vunmap
> + *
> + * @bo: The buffer object.
> + * @map: Object describing the map to unmap.
> + *
> + * Unmaps a kernel map set up by ttm_bo_vmap().
> + */
> +void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);
> +
>   /**
>    * ttm_bo_mmap_obj - mmap memory backed by a ttm buffer object.
>    *
> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-buf-map.h
> index fd1aba545fdf..2e8bbecb5091 100644
> --- a/include/linux/dma-buf-map.h
> +++ b/include/linux/dma-buf-map.h
> @@ -45,6 +45,12 @@
>    *
>    *	dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>    *
> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_iomem().
> + *
> + * .. code-block:: c
> + *
> + *	dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> + *
>    * Test if a mapping is valid with either dma_buf_map_is_set() or
>    * dma_buf_map_is_null().
>    *
> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(struct dma_buf_map *map, void *vaddr)
>   	map->is_iomem = false;
>   }
>   
> +/**
> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping structure to an address in I/O memory
> + * @map:		The dma-buf mapping structure
> + * @vaddr_iomem:	An I/O-memory address
> + *
> + * Sets the address and the I/O-memory flag.
> + */
> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_map *map,
> +					       void __iomem *vaddr_iomem)
> +{
> +	map->vaddr_iomem = vaddr_iomem;
> +	map->is_iomem = true;
> +}
> +
>   /**
>    * dma_buf_map_is_equal - Compares two dma-buf mapping structures for equality
>    * @lhs:	The dma-buf mapping structure

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
