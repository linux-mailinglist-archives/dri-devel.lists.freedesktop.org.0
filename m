Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2102E8447CE
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 20:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BCA10FC6C;
	Wed, 31 Jan 2024 19:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D3010FC63
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 19:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706728242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVxUbMWh6nuUV7HAlwwrXn49k8LjkIFOKFR9DwoBMVA=;
 b=EgdIbQGwz58cXIT3lvuhCugB0ISm1aWEeeyysr2wUUTYDHDUqn/UxYvmTxdG6A1qnFCUvQ
 QWey50Yx7e5FRWKPYeuU+n9qrsXZmZ/adJB1e9XmeN8jtQht4eBmg2M9FDKkq1cbidM06G
 UFcDHZq0IyYDpX7SgEjJe3u4iFttuO8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-5HegkpD8P6SBgZHKYlWc3w-1; Wed, 31 Jan 2024 14:10:40 -0500
X-MC-Unique: 5HegkpD8P6SBgZHKYlWc3w-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-558b04cb660so59343a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 11:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706728239; x=1707333039;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVxUbMWh6nuUV7HAlwwrXn49k8LjkIFOKFR9DwoBMVA=;
 b=X3vvmQPwhEKzGoqFb6JwlO5+m/Ybx86pUnO2R/ZFjQnTGaS/07zhVWZL+3GELsp4zo
 n2YX5Nh/qUZdqJTpvrobXdHxs/9YwBbRU8sU/qJEYSJgGLUTjOkrn6pJIWTdTm1TyYbX
 H+fPrnXf7YwFVoItOCHxx0za2a8PzBGBg8ZpV0CXPHfsgwaUjmraIEOXmmM6k8KWxheC
 JRcKBri9kDi0WKJg1ek4Z2ht/a2FI//2OK4fN3k3iuAo5dISDHni0hEVMIO41/9zXDkQ
 60uHH+rXeJoxL5wPkBzuOPmlHbJzX6ccPXEKcAHTpgn67gGOMsOGYejgNOgRgQ4MxNyi
 31QQ==
X-Gm-Message-State: AOJu0YyzCYlt+lB5fXkemPIt+ODYX+t0vnxLJMwUpokgm2eP/mHYuXf2
 /rox6fYxW6w3PMRwKwejoSwZOBk/8rJN6rYZGoLWpsSkXrtGhWk91YlzszP3ckZYaxdeCTHito2
 USk7W+mBOmH1zFHYChya1Cj/c5Kd/Ol0aCfoisZOYub+0tL2kd5hluscVyb27KSFF5w==
X-Received: by 2002:a17:907:171b:b0:a35:b2b1:5372 with SMTP id
 le27-20020a170907171b00b00a35b2b15372mr1869964ejc.68.1706728239403; 
 Wed, 31 Jan 2024 11:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEu38E4u4tFn+VorqkD/WncuomGRye9/IU/vt9+7QV1Ygj3N6RHb83/ZusPyTNmHK3yPi6BQg==
X-Received: by 2002:a17:907:171b:b0:a35:b2b1:5372 with SMTP id
 le27-20020a170907171b00b00a35b2b15372mr1869951ejc.68.1706728239152; 
 Wed, 31 Jan 2024 11:10:39 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a1709061d4e00b00a2c70ec1533sm6410851ejh.66.2024.01.31.11.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 11:10:38 -0800 (PST)
Message-ID: <4ba66e36-f4a8-4c5e-af88-bc47157b5c03@redhat.com>
Date: Wed, 31 Jan 2024 20:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/nouveau/svm: remove unused but set variables
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1704908087.git.jani.nikula@intel.com>
 <8b133e7ec0e9aef728be301ac019c5ddcb3bbf51.1704908087.git.jani.nikula@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <8b133e7ec0e9aef728be301ac019c5ddcb3bbf51.1704908087.git.jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/24 18:39, Jani Nikula wrote:
> Fix the W=1 warning -Wunused-but-set-variable.
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_svm.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index cc03e0c22ff3..4d1008915499 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -112,7 +112,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>   {
>   	struct nouveau_cli *cli = nouveau_cli(file_priv);
>   	struct drm_nouveau_svm_bind *args = data;
> -	unsigned target, cmd, priority;
> +	unsigned target, cmd;
>   	unsigned long addr, end;
>   	struct mm_struct *mm;
>   
> @@ -136,9 +136,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>   		return -EINVAL;
>   	}
>   
> -	priority = args->header >> NOUVEAU_SVM_BIND_PRIORITY_SHIFT;
> -	priority &= NOUVEAU_SVM_BIND_PRIORITY_MASK;
> -
>   	/* FIXME support CPU target ie all target value < GPU_VRAM */
>   	target = args->header >> NOUVEAU_SVM_BIND_TARGET_SHIFT;
>   	target &= NOUVEAU_SVM_BIND_TARGET_MASK;
> @@ -926,15 +923,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
>   		 unsigned long addr, u64 *pfns, unsigned long npages)
>   {
>   	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
> -	int ret;
>   
>   	args->p.addr = addr;
>   	args->p.size = npages << PAGE_SHIFT;
>   
>   	mutex_lock(&svmm->mutex);
>   
> -	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> -				struct_size(args, p.phys, npages), NULL);
> +	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> +			  struct_size(args, p.phys, npages), NULL);
>   
>   	mutex_unlock(&svmm->mutex);
>   }

