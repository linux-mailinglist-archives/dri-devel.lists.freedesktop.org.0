Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDE84D2178
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7CF10E4D1;
	Tue,  8 Mar 2022 19:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0BC10E4CE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646767783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kX1L2re/YQHASfVzqrCRvIe3dgRuIIIu9OGl7xqxUdw=;
 b=FpsQD/D7bVNFZ/6RL1qC6W/Ov6H2PAn6zpRcWVYQtL5NC3FrCRHyJ8UkaKvYnf6Dy4rSt5
 8t2aF6hGwJM84iBCFiU8Z2nFzi7P4jt8/pqQXJPYyEmw01w+p1zufs5qsoyY6HJLUbJiiK
 a/ngdA+LC1+hjMnFSpI4hdgaw+wW9g0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-CPIEk8hPO0iQkuepl201kg-1; Tue, 08 Mar 2022 14:29:42 -0500
X-MC-Unique: CPIEk8hPO0iQkuepl201kg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n62-20020a1ca441000000b0038124c99ebcso47748wme.9
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 11:29:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kX1L2re/YQHASfVzqrCRvIe3dgRuIIIu9OGl7xqxUdw=;
 b=ZePu8lgA3kYchZi4Rt0PjFIFtU3L7ZDzfqfNM4nhb2i62V5I+eT//qJDa9j1gx45u7
 Mw+/lhDkYIXStIlgo7NuO5tmLkmJ9eN8eNGHXOUuiT9JWMSm+gL/J1ueaRaa+5e41dru
 Q+LXxhGIRj/MEmV90Xxks4YznbO+vX46ZtcAjMd++xu6aCJIFN27A1nSArBV7gFvuMxs
 WGJ5UOZz3ODbtg47VeE+WSrUwd9rWN8pJ1/X0lT7drIAZajRjg9O7PTntdbakDPDo7B3
 xBbl/uxjrj9H607AmeqMwJoM++gbxeOvIK5zv1QRRQgdH4VCPpf887URAIcPNeY4a3RX
 E02g==
X-Gm-Message-State: AOAM531s4daDon4DkBzXQWyEg8sn1xy+gsX3taSIBHf793wGykLttj4m
 IEZp4Dv/wQmEiV6XQKZsyPl945inRcbdk3HkyPanAafvi1n3PFikijJvLGofRXf5zvUzI7LFYYO
 mc8zo3YsrcPpj8mf0/45hOjlKnaGZ
X-Received: by 2002:a05:600c:3512:b0:382:ee82:b3d1 with SMTP id
 h18-20020a05600c351200b00382ee82b3d1mr633484wmq.126.1646767780763; 
 Tue, 08 Mar 2022 11:29:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzv2iTUZ4J35siqwIsOcPJMq6FNTOWfc6gKh8An0gveT64fVSFOk5vBAdPowGEG/7kETlglA==
X-Received: by 2002:a05:600c:3512:b0:382:ee82:b3d1 with SMTP id
 h18-20020a05600c351200b00382ee82b3d1mr633469wmq.126.1646767780513; 
 Tue, 08 Mar 2022 11:29:40 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i186-20020a1c3bc3000000b00382b25f6c9fsm2998305wma.42.2022.03.08.11.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:29:40 -0800 (PST)
Message-ID: <265aba53-ff78-e1ab-8596-e2226dff23f0@redhat.com>
Date: Tue, 8 Mar 2022 20:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 8/9] drm/gem-shmem: Implement fbdev dumb buffer and mmap
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-9-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220303205839.28484-9-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 21:58, Thomas Zimmermann wrote:
> Implement struct drm_driver.dumb_create_fbdev for GEM SHMEM. The
> created buffer object returned by this function implements deferred
> I/O for its mmap operation.
> 
> Add this feature to a number of drivers that use GEM SHMEM helpers
> as shadow planes over their regular video memory. The new macro
> DRM_GEM_SHMEM_DRIVER_OPS_WITH_SHADOW_PLANES sets the regular GEM
> functions and dumb_create_fbdev in struct drm_driver. Fbdev emulation
> on these drivers will now mmap the GEM SHMEM pages directly with
> deferred I/O without an intermediate shadow buffer.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[snip]

> @@ -49,8 +50,20 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>  	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
>  
> +static const struct drm_gem_object_funcs drm_gem_shmem_funcs_fbdev = {
> +	.free = drm_gem_shmem_object_free,
> +	.print_info = drm_gem_shmem_object_print_info,
> +	.pin = drm_gem_shmem_object_pin,
> +	.unpin = drm_gem_shmem_object_unpin,
> +	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> +	.vmap = drm_gem_shmem_object_vmap,
> +	.vunmap = drm_gem_shmem_object_vunmap,
> +	.mmap = drm_gem_shmem_object_mmap_fbdev,
> +	.vm_ops = &drm_gem_shmem_vm_ops_fbdev,

The drm_gem_shmem_funcs_fbdev is the same than drm_gem_shmem_funcs but
.mmap and .vm_ops callbacks. Maybe adding a macro to declare these two
struct drm_gem_object_funcs could make easier to maintain it long term ?

> +};
> +
>  static struct drm_gem_shmem_object *
> -__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
> +__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private, bool fbdev)
>  {
>  	struct drm_gem_shmem_object *shmem;
>  	struct drm_gem_object *obj;
> @@ -70,8 +83,12 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
>  		obj = &shmem->base;
>  	}
>  
> -	if (!obj->funcs)
> -		obj->funcs = &drm_gem_shmem_funcs;
> +	if (!obj->funcs) {
> +		if (fbdev)

Same question than in patch #6, maybe

                if (defined(CONFIG_DRM_FBDEV_EMULATION) && fbdev) ?

[snip]

> + */
> +int drm_gem_shmem_dumb_create_fbdev(struct drm_file *file, struct drm_device *dev,
> +				    struct drm_mode_create_dumb *args)
> +{
> +#if defined(CONFIG_DRM_FBDEV_EMULATION)
> +	return __drm_gem_shmem_dumb_create(file, dev, true, args);
> +#else
> +	return -ENOSYS;
> +#endif
> +}

I believe the correct errno code here should be -ENOTSUPP.

[snip]

> +	/* We don't use vmf->pgoff since that has the fake offset */
> +	page_offset = (vmf->address - vma->vm_start) >> PAGE_SHIFT;

I see this (vmf->address - vma->vm_start) calculation in many places of
this series. Maybe we could add a macro to calculate the offset instead ?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

