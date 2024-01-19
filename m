Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C72A832C15
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 16:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84EF10E079;
	Fri, 19 Jan 2024 15:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C16910E079
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705676673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gYcJVkXMjM/MA4K8BzwTfXlCDI5aN8CHClwcdTmEEbM=;
 b=ELkHmAZQBiTlQU+e3nJjcSy1kY2Q0pSLGDxx1AisjndUfBywSzpDcrzyMHEJWAwctUsZUC
 KpT7S8h+cTuhYPIT6kz3T1nw/+YaEWFbBhYD7jUODKNzD/aMdUSHZo5tulwAbftl7JIktS
 kTHgIP2gYHUSUjy7OBHGVlOCyD/Os3Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-ND_PzlC6MiODXKjowIYzEg-1; Fri, 19 Jan 2024 10:04:30 -0500
X-MC-Unique: ND_PzlC6MiODXKjowIYzEg-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5574e49005eso412807a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 07:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705676668; x=1706281468;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gYcJVkXMjM/MA4K8BzwTfXlCDI5aN8CHClwcdTmEEbM=;
 b=HyFF7D97WnYdlHcwfLr/MIj/miyIJ/Ta154XpvZL/Q7GGSUpTLwYHp+SpV799pJ5cJ
 kfxLGcrLkTa3R7rNpPDIiSdCwTHOWKNARd1DNMQl/NVbQ9wSU0+L+ZjfM66bb90bAC+e
 41f4QFiuXtCR8XrD1Jx3SSiWcpfleaXEsuO4craG6sXkVJCnm+94KNGaQ+AnJpLecULz
 +ex9lbPkgbq84XYKHZh4CkMZ+0YGbzjyiPn+DJdbSduk0wQzsOUa8T4gtqm9NxuW5xwQ
 HPkH3FwpoO2TFUKHEM3PxK2QUoCLNCcYOGbP9UufUQgrKDVdYuhE3F5cNhv1rGlMLPqx
 3FCw==
X-Gm-Message-State: AOJu0Yz00gM4pqi3h/kjH8Peci3haq37ULMzcB9xDxVWTjZG3yP6uYow
 7GARy6MxJIwO4RgNuMe1ESisM8xXNFQ+AuivTFP1SMUQkjVkhYo0naw498l5Up2JYZBVoXlgPGB
 sIX+Cr/zu3dSR5bWgNWexQKTk4tPOn4E2lwQzuLfgGCAtTQKUMLxbIt8EbS1KvtTcAWWd+uyr7g
 ==
X-Received: by 2002:a05:6402:2285:b0:55a:6124:1414 with SMTP id
 cw5-20020a056402228500b0055a61241414mr527304edb.48.1705676668678; 
 Fri, 19 Jan 2024 07:04:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHwXHrK0lNyVDzTiz+UqwaMdzLW1w1YYltKBlu/EoceZmaQFlRikGGVEe+RSfP2jDQXM4czA==
X-Received: by 2002:a05:6402:2285:b0:55a:6124:1414 with SMTP id
 cw5-20020a056402228500b0055a61241414mr527296edb.48.1705676668346; 
 Fri, 19 Jan 2024 07:04:28 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 da12-20020a056402176c00b00559f653b328sm2602400edb.22.2024.01.19.07.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 07:04:27 -0800 (PST)
Message-ID: <b285cf5f-10c9-42a1-81fd-dda3af743497@redhat.com>
Date: Fri, 19 Jan 2024 16:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/exec, drm/gpuvm: Prefer u32 over uint32_t
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240119090557.6360-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/24 10:05, Thomas Hellström wrote:
> The relatively recently introduced drm/exec utility was using uint32_t
> in its interface, which was then also carried over to drm/gpuvm.
> 
> Prefer u32 in new code and update drm/exec and drm/gpuvm accordingly.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/drm_exec.c | 2 +-
>   include/drm/drm_exec.h     | 4 ++--
>   include/drm/drm_gpuvm.h    | 2 +-
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
> index 5d2809de4517..20e59d88218d 100644
> --- a/drivers/gpu/drm/drm_exec.c
> +++ b/drivers/gpu/drm/drm_exec.c
> @@ -72,7 +72,7 @@ static void drm_exec_unlock_all(struct drm_exec *exec)
>    *
>    * Initialize the object and make sure that we can track locked objects.
>    */
> -void drm_exec_init(struct drm_exec *exec, uint32_t flags)
> +void drm_exec_init(struct drm_exec *exec, u32 flags)
>   {
>   	exec->flags = flags;
>   	exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index b5bf0b6da791..187c3ec44606 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -18,7 +18,7 @@ struct drm_exec {
>   	/**
>   	 * @flags: Flags to control locking behavior
>   	 */
> -	uint32_t		flags;
> +	u32                     flags;
>   
>   	/**
>   	 * @ticket: WW ticket used for acquiring locks
> @@ -135,7 +135,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
>   	return !!exec->contended;
>   }
>   
> -void drm_exec_init(struct drm_exec *exec, uint32_t flags);
> +void drm_exec_init(struct drm_exec *exec, u32 flags);
>   void drm_exec_fini(struct drm_exec *exec);
>   bool drm_exec_cleanup(struct drm_exec *exec);
>   int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 48311e6d664c..554046321d24 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -514,7 +514,7 @@ struct drm_gpuvm_exec {
>   	/**
>   	 * @flags: the flags for the struct drm_exec
>   	 */
> -	uint32_t flags;
> +	u32 flags;
>   
>   	/**
>   	 * @vm: the &drm_gpuvm to lock its DMA reservations

