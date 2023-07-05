Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0C74805C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B3210E1EF;
	Wed,  5 Jul 2023 09:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8FD10E1EF
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688547804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rSX7qOujOrm27lX5ys/0lBz1p5bJBCSZMCXRlfpyvEg=;
 b=Q26ZwIhJ6DuOdfvKNzdxqgryMFUqoo+CKIj9fdTdQkSTfqsZRvSzhSGgBva2aCxqWfiu/W
 VykWv/d0I/iz+vm9kC5tfSsvCGEnazrSzNzD/KPNo8/2pG43sxoCcVuSwi/4yCnNt2qhCT
 FaKdI1/Zna7r9WnrNGxQdR4iqZXdbqQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-lRIaE8GOMuSDCRA_8De0MA-1; Wed, 05 Jul 2023 05:03:23 -0400
X-MC-Unique: lRIaE8GOMuSDCRA_8De0MA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fb40ec952bso40345815e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 02:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688547802; x=1691139802;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rSX7qOujOrm27lX5ys/0lBz1p5bJBCSZMCXRlfpyvEg=;
 b=VPAjT5878EATki209O9TOc96pmri28D9YVb7RzpOmjJFr/4GwBI7nKABCVLBfD3D2v
 DZ9Rb96d8Tg+BACQIUv6xxEvXfEt/geq0Zqm8Hm0OaxIe1vZ61BeRcBs71TJC76R70q4
 o//e1NSI3FxM7uXkydyhsf+5F9A0oJTlzpM5Ctp+ykXB4ms3FMxQKDfqWlxuGWcWFk8+
 b0V6iu+RmmAwgRHH9z0ggV3cNb2KckBbS1BLo8dVxlVPf36YqpfKwVZmC3dTzYps0jjN
 2jZf1iJk85KaR3fxKdmZe9urLiUe3UJPljRpBerP2MR6FEnzFMSGveHIaU7vcxmvAQpg
 9DgA==
X-Gm-Message-State: AC+VfDznHfTWFm/CuOXRWB6qhzLSP5ByWFMyMu0pElU5G7LZZPALId5N
 fh/JBdS9OkGTnknDwrRu24JMiiBiGYtvR3ujCpiF7BMcoTGaX2iqLAdbOQ1rwKunNwqyuOcKmsN
 CZhlspFLRCRxOD+fBjYM+R0ppBxu1
X-Received: by 2002:a1c:f314:0:b0:3fb:adc0:609b with SMTP id
 q20-20020a1cf314000000b003fbadc0609bmr14653349wmq.13.1688547802464; 
 Wed, 05 Jul 2023 02:03:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4D75aEjUYAXwEsqp9EVXq6EMXjhrEVDhsSnE0141Cb1WbjzG1CyfPykxapyYpYnd68hWU11g==
X-Received: by 2002:a1c:f314:0:b0:3fb:adc0:609b with SMTP id
 q20-20020a1cf314000000b003fbadc0609bmr14653330wmq.13.1688547802102; 
 Wed, 05 Jul 2023 02:03:22 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m11-20020a7bce0b000000b003f90b9b2c31sm1507833wmc.28.2023.07.05.02.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:03:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 07/10] drm/omapdrm: Set VM flags in GEM-object mmap
 function
In-Reply-To: <20230704160133.20261-8-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-8-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 11:03:21 +0200
Message-ID: <87o7kqraqu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the mmap callback in struct drm_gem_object_funcs to set the
> VM flags. Replace a number of mmap helpers in omapdrm with their
> GEM helper counterparts. Generate DRM's file-operations instance
> with GEM's DEFINE_DRM_GEM_FOPS.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---

> +static int omap_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  {
>  	struct omap_gem_object *omap_obj = to_omap_bo(obj);
>  
> -	vm_flags_mod(vma, VM_MIXEDMAP, VM_PFNMAP);
> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_IO | VM_MIXEDMAP);
>  
>  	if (omap_obj->flags & OMAP_BO_WC) {
>  		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> @@ -563,12 +548,14 @@ int omap_gem_mmap_obj(struct drm_gem_object *obj,
>  		 * address_space (so unmap_mapping_range does what we want,
>  		 * in particular in the case of mmap'd dmabufs)
>  		 */
> -		vma->vm_pgoff = 0;
> +		vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>  		vma_set_file(vma, obj->filp);
>  
>  		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>  	}
>  
> +	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> +
>  	return 0;
>  }
>

I think this rework deserves a more elaborated commit message.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

