Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9403582D762
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 11:29:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EAA10E26E;
	Mon, 15 Jan 2024 10:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A7A10E257
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705314583;
 bh=uD3on164fd9LKLG0EkJsiwWyV7DVmixnMu4hv5UdpVY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eUR8Hzpxx7b8zA1fZH8RPUPwI/PWv2zVMP/7hOhu2XJwomNTg8tV20bSNu2YUzz7s
 sdMxB1s50Am0JUWd1ovML9srkkdJGFnOlroL1xTAuo5YtlTRBIQOS2JqTXoS7sCiTV
 FX1QnCss0Ig/rhgU8FAvykKird2uJ/QWLOj9glXOUJUXZo/zCThHoGjmWmr1+Y4L0Z
 1D64cKev1Ezgfo9QOl0zutNVTQ4dCLrjLGZnvhCd338ebTKdeKPQEt+NsNI9eeEyxp
 VFva0GvTHfHCVqLtvqRk0DJkiv4gXfvS7XMX3CpxLrrNyG2z/9dOUMxrev1uqbutZW
 AkFv3aN1yyKAw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 909EC3780629;
 Mon, 15 Jan 2024 10:29:42 +0000 (UTC)
Date: Mon, 15 Jan 2024 11:29:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 05/14] drm/panthor: Add GEM logical block
Message-ID: <20240115112941.612fa9a2@collabora.com>
In-Reply-To: <d5fb47a9-66b5-490d-9c34-36421823305f@arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-6-boris.brezillon@collabora.com>
 <d5fb47a9-66b5-490d-9c34-36421823305f@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 16:38:33 +0000
Steven Price <steven.price@arm.com> wrote:

> > +
> > +	ret = panthor_vm_unmap_range(vm, bo->va_node.start,
> > +				     panthor_kernel_bo_size(bo));
> > +	if (ret)
> > +		goto out_free_bo;
> > +
> > +	panthor_vm_free_va(vm, &bo->va_node);
> > +	drm_gem_object_put(bo->obj);
> > +
> > +out_free_bo:
> > +	kfree(bo);
> > +}
> > +
> > +/**
> > + * panthor_kernel_bo_create() - Create and map a GEM object to a VM
> > + * @ptdev: Device.
> > + * @vm: VM to map the GEM to. If NULL, the kernel object is not GPU mapped.
> > + * @size: Size of the buffer object.
> > + * @bo_flags: Combination of drm_panthor_bo_flags flags.
> > + * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
> > + * that are related to map operations).
> > + * @gpu_va: GPU address assigned when mapping to the VM.
> > + * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
> > + * automatically allocated.
> > + *
> > + * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
> > + */
> > +struct panthor_kernel_bo *
> > +panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
> > +			 size_t size, u32 bo_flags, u32 vm_map_flags,
> > +			 u64 gpu_va)
> > +{
> > +	struct drm_gem_shmem_object *obj;
> > +	struct panthor_kernel_bo *kbo;
> > +	struct panthor_gem_object *bo;
> > +	int ret;
> > +
> > +	kbo = kzalloc(sizeof(*kbo), GFP_KERNEL);
> > +	if (!kbo)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	obj = drm_gem_shmem_create(&ptdev->base, size);
> > +	if (IS_ERR(obj)) {
> > +		ret = PTR_ERR(obj);
> > +		goto err_free_bo;
> > +	}
> > +
> > +	bo = to_panthor_bo(&obj->base);
> > +	size = obj->base.size;
> > +	kbo->obj = &obj->base;
> > +	bo->flags = bo_flags;
> > +
> > +	if (!vm)
> > +		return 0;  
> 
> This doesn't look right - I'd expect kbo to be returned? (Or an error if
> !vm isn't actually supported).
> 
> I've had a look at the rest of the driver and I can't find a user of the
> !vm case. So either I'm missing something (quite plausible) or we should
> just make the vm argument compulsory and simplify this a bit.

Hm, I can't remember why I made the GPU VM mapping optional for private
BOs, so I'll just make it mandatory as you suggest, and we can revisit
it later if we have an actual use case for that.
