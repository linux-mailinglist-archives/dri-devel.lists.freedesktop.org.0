Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2E88278C8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 20:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8669710E2D0;
	Mon,  8 Jan 2024 19:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A8010E2A6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 19:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704743685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egUOllz/D5/X2Q9TY06OwWychq3jq9oXQBXPrNUeGTY=;
 b=fMRBIgCcvtapMiofFwHwASI4aEkd5fxgks/kzFazwPTGa4gdSxd9xSW0xKZK8SwG5UPo9L
 lKMW7VESB731BemhJMYlMC5QI8qy18/K7yF3Ns8/eb9LtBwlpEFoWB0Q8J0LEewBzZxTqv
 n4DznjdmE+NbeQQzKkiPFSvOLwhi1k4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-dsnJbTmBNTyPgQ4tWvl-1Q-1; Mon, 08 Jan 2024 14:54:44 -0500
X-MC-Unique: dsnJbTmBNTyPgQ4tWvl-1Q-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4298d9ffa96so26509411cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 11:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704743683; x=1705348483;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egUOllz/D5/X2Q9TY06OwWychq3jq9oXQBXPrNUeGTY=;
 b=qZwOrpv4lRklcaH1cB9YbEfvHpPD+p9DvYUnyDZ8elmF6fgQ79Zkp1DiuTFUXIy/63
 zmnN4mX309RPig4Z5pm3rDLNdVFCkqB6arckmq0KmvwFiUwQGVl9i8y1KQDqe91Xuny5
 D0o6XNDMTm7rysZlAHjz5wZg/N8+3lpCbK3DdXrD4lJFv71TRYAft/7p+PkPEwbTcXeg
 XwmOwC0pHzLDm4D0OCI0X/VY1g4CQ0juePWcUkISOBdhnqliuoWBaZn8pYh7/dR63EK+
 Hh4NI04A7OzNtM7+hvlr9Y/UNTGjVoknp6V21Nkiq+1bEtU/Rhwj0IeWe2BUHeKoVUvT
 sNXw==
X-Gm-Message-State: AOJu0Yy78c6q99onrDa76stl0ie8AlcP/6cGUcCzvxPEn55z/BAgHjwR
 jC5Zs3r06fbV8bM4p83ofE6QmuetCo+ULNQRBGz/wZ9eg+ET4Is8wkH1NszHHma4FgiH75vJA7E
 zLGH7PovLp4HrI1patRnvJiGPoP3ohsqHMI9x
X-Received: by 2002:ac8:7c4b:0:b0:429:9e35:6929 with SMTP id
 o11-20020ac87c4b000000b004299e356929mr856810qtv.35.1704743683519; 
 Mon, 08 Jan 2024 11:54:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmkOG8tja7+RozunNkYOsGAklltKR+uZ8OKlPuC9MwHNqtPszjPZTjr+uJxm3CebAM4BfFkQ==
X-Received: by 2002:ac8:7c4b:0:b0:429:9e35:6929 with SMTP id
 o11-20020ac87c4b000000b004299e356929mr856797qtv.35.1704743683171; 
 Mon, 08 Jan 2024 11:54:43 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 bq23-20020a05622a1c1700b00427b3271ab4sm173956qtb.41.2024.01.08.11.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 11:54:42 -0800 (PST)
Message-ID: <724fdfaf-0e38-408b-a2d6-e3f39f28743d@redhat.com>
Date: Mon, 8 Jan 2024 20:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] drm/nouveau: uapi: fix kerneldoc warnings
To: Vegard Nossum <vegard.nossum@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
References: <20231225065145.3060754-1-vegard.nossum@oracle.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231225065145.3060754-1-vegard.nossum@oracle.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 nouveau@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/25/23 07:51, Vegard Nossum wrote:
> As of commit b77fdd6a48e6 ("scripts/kernel-doc: restore warning for
> Excess struct/union"), we see the following warnings when running 'make
> htmldocs':
> 
>    ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_OP_MAP' description in 'drm_nouveau_vm_bind_op'
>    ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_OP_UNMAP' description in 'drm_nouveau_vm_bind_op'
>    ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_SPARSE' description in 'drm_nouveau_vm_bind_op'
>    ./include/uapi/drm/nouveau_drm.h:336: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_RUN_ASYNC' description in 'drm_nouveau_vm_bind'
> 
> The problem is that these values are #define constants, but had kerneldoc
> comments attached to them as if they were actual struct members.
> 
> There are a number of ways we could fix this, but I chose to draw
> inspiration from include/uapi/drm/i915_drm.h, which pulls them into the
> corresponding kerneldoc comment for the struct member that they are
> intended to be used with.
> 
> To keep the diff readable, there are a number of things I _didn't_ do in
> this patch, but which we should also consider:
> 
> - This is pretty good documentation, but it ends up in gpu/driver-uapi,
>    which is part of subsystem-apis/ when it really ought to display under
>    userspace-api/ (the "Linux kernel user-space API guide" book of the
>    documentation).

I agree, it indeed looks like this would make sense, same goes for
gpu/drm-uapi.rst.

@Jani, Sima: Was this intentional? Or can we change it?

> 
> - More generally, we might want a warning if include/uapi/ files are
>    kerneldoc'd outside userspace-api/.
> 
> - I'd consider it cleaner if the #defines appeared between the kerneldoc
>    for the member and the member itself (which is something other DRM-
>    related UAPI docs do).
> 
> - The %IDENTIFIER kerneldoc syntax is intended for "constants", and is
>    more appropriate in this context than ``IDENTIFIER`` or &IDENTIFIER.
>    The DRM docs aren't very consistent on this.
> 
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Applied to drm-misc-next, thanks!

> ---
>   include/uapi/drm/nouveau_drm.h | 56 ++++++++++++++++------------------
>   1 file changed, 27 insertions(+), 29 deletions(-)
> 
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index 0bade1592f34..c95ef8a4d94a 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -238,34 +238,32 @@ struct drm_nouveau_vm_init {
>   struct drm_nouveau_vm_bind_op {
>   	/**
>   	 * @op: the operation type
> +	 *
> +	 * Supported values:
> +	 *
> +	 * %DRM_NOUVEAU_VM_BIND_OP_MAP - Map a GEM object to the GPU's VA
> +	 * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be
> +	 * passed to instruct the kernel to create sparse mappings for the
> +	 * given range.
> +	 *
> +	 * %DRM_NOUVEAU_VM_BIND_OP_UNMAP - Unmap an existing mapping in the
> +	 * GPU's VA space. If the region the mapping is located in is a
> +	 * sparse region, new sparse mappings are created where the unmapped
> +	 * (memory backed) mapping was mapped previously. To remove a sparse
> +	 * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
>   	 */
>   	__u32 op;
> -/**
> - * @DRM_NOUVEAU_VM_BIND_OP_MAP:
> - *
> - * Map a GEM object to the GPU's VA space. Optionally, the
> - * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kernel to
> - * create sparse mappings for the given range.
> - */
>   #define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
> -/**
> - * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
> - *
> - * Unmap an existing mapping in the GPU's VA space. If the region the mapping
> - * is located in is a sparse region, new sparse mappings are created where the
> - * unmapped (memory backed) mapping was mapped previously. To remove a sparse
> - * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
> - */
>   #define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
>   	/**
>   	 * @flags: the flags for a &drm_nouveau_vm_bind_op
> +	 *
> +	 * Supported values:
> +	 *
> +	 * %DRM_NOUVEAU_VM_BIND_SPARSE - Indicates that an allocated VA
> +	 * space region should be sparse.
>   	 */
>   	__u32 flags;
> -/**
> - * @DRM_NOUVEAU_VM_BIND_SPARSE:
> - *
> - * Indicates that an allocated VA space region should be sparse.
> - */
>   #define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
>   	/**
>   	 * @handle: the handle of the DRM GEM object to map
> @@ -301,17 +299,17 @@ struct drm_nouveau_vm_bind {
>   	__u32 op_count;
>   	/**
>   	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
> +	 *
> +	 * Supported values:
> +	 *
> +	 * %DRM_NOUVEAU_VM_BIND_RUN_ASYNC - Indicates that the given VM_BIND
> +	 * operation should be executed asynchronously by the kernel.
> +	 *
> +	 * If this flag is not supplied the kernel executes the associated
> +	 * operations synchronously and doesn't accept any &drm_nouveau_sync
> +	 * objects.
>   	 */
>   	__u32 flags;
> -/**
> - * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
> - *
> - * Indicates that the given VM_BIND operation should be executed asynchronously
> - * by the kernel.
> - *
> - * If this flag is not supplied the kernel executes the associated operations
> - * synchronously and doesn't accept any &drm_nouveau_sync objects.
> - */
>   #define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
>   	/**
>   	 * @wait_count: the number of wait &drm_nouveau_syncs

