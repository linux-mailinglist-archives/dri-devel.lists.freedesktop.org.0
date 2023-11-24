Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31577F86D9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 00:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9BA10E812;
	Fri, 24 Nov 2023 23:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12E210E37E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 23:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700869223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsNn83uVzegyrMAxmthRza05bc6xMx7My6riRjbiWxM=;
 b=WVBZq1IZUeK3L9zclihDicbVQKq94ymyBjSk3z6E7JpxFGqMtwpCvjUr/SdwauWQGmYrzY
 9938J/l58hsfCJsvKKBrR0PduMukr/fNHJGP1syRtFesCk9WhRhwOcQj/h95GPFVYo/RjD
 pdgC6YWW6+fFnCLA0k2r0Tv/S8Lnplw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-39_hlC76NfitrMftY4yrsQ-1; Fri, 24 Nov 2023 18:40:21 -0500
X-MC-Unique: 39_hlC76NfitrMftY4yrsQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-509901ca83eso2415441e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700869220; x=1701474020;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fsNn83uVzegyrMAxmthRza05bc6xMx7My6riRjbiWxM=;
 b=Z+KMSXjsmxQtDJfz301QN8zbSXdCr1l7EJ3VhkFsYBy3oOiP2QPNj5WG2d66n2bJ+7
 VIxtwSKA+fqzYwV3PWMPtcOSS5Ka5kjc55iej9hwyQptPLv3d9TKkGmwvLtDPWvbzFdj
 y/XeR8WcAePNFD3vR3yTeN3AGFfF6X1PL29h+yDlSgGkmXlOobPPOTiz972vv8O4Rpsy
 IcOKLuLOi5bUqIDlouy0ki+Vz6nneo7tyCLZF541YrOJALan+JXewD9C/M6fDTosNt9A
 90fLssnNQJ0Khe+LyEt6b3I65haVikbLn8Bzv6XupfRttkRR3VP15SAV0zQCRgcX6lQH
 3ivw==
X-Gm-Message-State: AOJu0YwiklfcOdh3oWNXlVrK8nYvXz6c2qoqlKy/NnOIpn54onpOqoFe
 sjcDrAcrdDLkFE7SjYjG9wmL0Jc0ExUkJd0hrnJCBYrObWiD+SmIRS4pexBa1uwzKtuFx8+VzZi
 IYi8doFsbNZF1msOWnkmjZQXv1JSm
X-Received: by 2002:ac2:5e66:0:b0:509:115c:51de with SMTP id
 a6-20020ac25e66000000b00509115c51demr2442993lfr.25.1700869220278; 
 Fri, 24 Nov 2023 15:40:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE43TACgtQqni4gIc//CIbNfXYGQLDp8MQ9/Q7mckrKAY+RLB0ZlCTXb9rABMWA5a/tegKkDw==
X-Received: by 2002:ac2:5e66:0:b0:509:115c:51de with SMTP id
 a6-20020ac25e66000000b00509115c51demr2442983lfr.25.1700869219959; 
 Fri, 24 Nov 2023 15:40:19 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170906050a00b009fc54390966sm2673473eja.145.2023.11.24.15.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Nov 2023 15:40:19 -0800 (PST)
Message-ID: <3c7b7683-da36-4ffe-a250-91eef019499f@redhat.com>
Date: Sat, 25 Nov 2023 00:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next 4/5] drm/gpuvm: fall back to
 drm_exec_lock_obj()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-5-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231124233650.152653-5-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: sarah.walker@imgtec.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org, matt.coster@imgtec.com,
 donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

do you think it makes sense to handle this in drm_exec_prepare_obj() or
even dma_resv_reserve_fences() even?

- Danilo

On 11/25/23 00:36, Danilo Krummrich wrote:
> Fall back to drm_exec_lock_obj() if num_fences is zero for the
> drm_gpuvm_prepare_* function family.
> 
> Otherwise dma_resv_reserve_fences() would actually allocate slots even
> though num_fences is zero.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/drm_gpuvm.c | 36 +++++++++++++++++++++++++++++++++---
>   include/drm/drm_gpuvm.h     | 23 +++--------------------
>   2 files changed, 36 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 54f5e8851de5..d1d1c2379e44 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1085,6 +1085,36 @@ drm_gpuvm_put(struct drm_gpuvm *gpuvm)
>   }
>   EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>   
> +static int
> +exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
> +		 unsigned int num_fences)
> +{
> +	return num_fences ? drm_exec_prepare_obj(exec, obj, num_fences) :
> +			    drm_exec_lock_obj(exec, obj);
> +}
> +
> +/**
> + * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
> + * @gpuvm: the &drm_gpuvm
> + * @exec: the &drm_exec context
> + * @num_fences: the amount of &dma_fences to reserve
> + *
> + * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
> + *
> + * Using this function directly, it is the drivers responsibility to call
> + * drm_exec_init() and drm_exec_fini() accordingly.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
> +		     struct drm_exec *exec,
> +		     unsigned int num_fences)
> +{
> +	return exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_prepare_vm);
> +
>   static int
>   __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>   			    struct drm_exec *exec,
> @@ -1095,7 +1125,7 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>   	int ret = 0;
>   
>   	for_each_vm_bo_in_list(gpuvm, extobj, &extobjs, vm_bo) {
> -		ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
> +		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
>   		if (ret)
>   			break;
>   	}
> @@ -1116,7 +1146,7 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
>   
>   	drm_gpuvm_resv_assert_held(gpuvm);
>   	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
> -		ret = drm_exec_prepare_obj(exec, vm_bo->obj, num_fences);
> +		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
>   		if (ret)
>   			break;
>   
> @@ -1186,7 +1216,7 @@ drm_gpuvm_prepare_range(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>   	drm_gpuvm_for_each_va_range(va, gpuvm, addr, end) {
>   		struct drm_gem_object *obj = va->gem.obj;
>   
> -		ret = drm_exec_prepare_obj(exec, obj, num_fences);
> +		ret = exec_prepare_obj(exec, obj, num_fences);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index f94fec9a8517..b3f82ec7fb17 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -544,26 +544,9 @@ struct drm_gpuvm_exec {
>   	} extra;
>   };
>   
> -/**
> - * drm_gpuvm_prepare_vm() - prepare the GPUVMs common dma-resv
> - * @gpuvm: the &drm_gpuvm
> - * @exec: the &drm_exec context
> - * @num_fences: the amount of &dma_fences to reserve
> - *
> - * Calls drm_exec_prepare_obj() for the GPUVMs dummy &drm_gem_object.
> - *
> - * Using this function directly, it is the drivers responsibility to call
> - * drm_exec_init() and drm_exec_fini() accordingly.
> - *
> - * Returns: 0 on success, negative error code on failure.
> - */
> -static inline int
> -drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
> -		     struct drm_exec *exec,
> -		     unsigned int num_fences)
> -{
> -	return drm_exec_prepare_obj(exec, gpuvm->r_obj, num_fences);
> -}
> +int drm_gpuvm_prepare_vm(struct drm_gpuvm *gpuvm,
> +			 struct drm_exec *exec,
> +			 unsigned int num_fences);
>   
>   int drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>   			      struct drm_exec *exec,

