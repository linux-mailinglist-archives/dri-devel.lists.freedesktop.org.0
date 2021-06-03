Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89139AA34
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 20:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AEB46F4E3;
	Thu,  3 Jun 2021 18:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3118F6F4E3;
 Thu,  3 Jun 2021 18:42:14 +0000 (UTC)
IronPort-SDR: PEZ4sZQQrx3WDu2p6b4UrMqZiPDzRd7egNnheCRENBJUJ6jPv4YTAOWOdkg0E15quhv1Lfudwg
 Foo0AQEmPz4Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="265287849"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="265287849"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 11:42:08 -0700
IronPort-SDR: 7b8N9DM8TFqBMmSaVTEoibMuMD4qRq2bLRhvvuoROdl4FnUZZQXGfse5aMjOBQJe3wg7StTE5V
 omsR23QyxeLg==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="480335484"
Received: from aconradi-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.213])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 11:42:04 -0700
Date: Thu, 3 Jun 2021 21:42:00 +0300
From: Andi Shyti <andi.shyti@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v2 4/4] drm/vgem: use shmem helpers
Message-ID: <YLkieISPHgzmUnD4@intel.intel>
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
 <20210603150326.1326658-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603150326.1326658-5-daniel.vetter@ffwll.ch>
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
Cc: Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

> +/*
> + * This just sets wc mode for shmem helpers. vgem doesn't have any begin/end cpu
> + * access ioctls, there must use coherent memory or dma-buf sharing just wont
> + * work.
> + */
> +static struct drm_gem_object *vgem_gem_create_object(struct drm_device *dev, size_t size)
>  {
> -	struct drm_vgem_gem_object *obj;
> -	int npages;
> +	struct drm_gem_shmem_object *obj;
>  
> -	obj = __vgem_gem_create(dev, attach->dmabuf->size);
> -	if (IS_ERR(obj))
> -		return ERR_CAST(obj);
> -
> -	npages = PAGE_ALIGN(attach->dmabuf->size) / PAGE_SIZE;
> +	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> +	if (!obj)
> +		return NULL;
>  
> -	obj->table = sg;
> -	obj->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
> -	if (!obj->pages) {
> -		__vgem_gem_destroy(obj);
> -		return ERR_PTR(-ENOMEM);
> -	}
> +	obj->base.funcs = &drm_gem_shmem_funcs;
> +	obj->map_wc = true;
>  
> -	obj->pages_pin_count++; /* perma-pinned */
> -	drm_prime_sg_to_page_array(obj->table, obj->pages, npages);
>  	return &obj->base;

here you are allocating a bigger object than what you are
returning, in size. How does it get freed?

Andi
