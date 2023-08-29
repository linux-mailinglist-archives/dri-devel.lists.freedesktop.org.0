Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7AB78C7D8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D826310E36F;
	Tue, 29 Aug 2023 14:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E58310E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:45:11 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F093660721F;
 Tue, 29 Aug 2023 15:45:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693320309;
 bh=45yk7m3E/s3yy1/WpyeCpRnM5GyV14jym5glVbJImpc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PH5Wf5QTDXyFBLnxApwkUUufTszqKKqDLrHpMtZBAVF+U6p/GeOmNf+pJmNlBG8rJ
 FWSbXKjXhW1O94tvWamhzsxAkP6cjMkEi0u9ziO4EYiHopRTMTAqDkCkFbE0iz3avb
 N/SLVDLZqQSlDWsh8AtsdiVGXN4JdOX1Ot+cKQYTdFoJz5JzvmIskcvmHDwkgQeodW
 4Lm2exfF6ZJSqnecOmSNKoJQuIcMwh4gm+q8cShmEnklRvLhEqsDRb2+xnKtJrmL8x
 pIsCapFBwXpZn2s9SUdKOLDRm4vBVGOwT2AW2PyFwXV52/5pxECnsWixB7Z82v+sLr
 lNQemKRR2TNxA==
Date: Tue, 29 Aug 2023 16:45:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 06/15] drm/panthor: Add GEM logical block
Message-ID: <20230829164506.04b53369@collabora.com>
In-Reply-To: <1ae8e22b-c9f2-aa93-dc39-b25cd3adbfda@arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-7-boris.brezillon@collabora.com>
 <1ae8e22b-c9f2-aa93-dc39-b25cd3adbfda@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Aug 2023 14:40:25 +0100
Steven Price <steven.price@arm.com> wrote:

> > +/**
> > + * panthor_gem_create_with_handle() - Create a GEM object and attach it to a handle.
> > + * @file: DRM file.
> > + * @ddev: DRM device.
> > + * @exclusive_vm: Exclusive VM. Not NULL if the GEM object can't be shared.
> > + * @size: Size of the GEM object to allocate.
> > + * @flags: Combination of drm_panthor_bo_flags flags.
> > + * @handle: Pointer holding the handle pointing to the new GEM object.
> > + *
> > + * Return: A valid pointer on success, an ERR_PTR() otherwise.
> > + */
> > +struct panthor_gem_object *
> > +panthor_gem_create_with_handle(struct drm_file *file,
> > +			       struct drm_device *ddev,
> > +			       struct panthor_vm *exclusive_vm,
> > +			       size_t size,
> > +			       u32 flags, u32 *handle)
> > +{
> > +	int ret;
> > +	struct drm_gem_shmem_object *shmem;
> > +	struct panthor_gem_object *bo;
> > +
> > +	shmem = drm_gem_shmem_create(ddev, size);
> > +	if (IS_ERR(shmem))
> > +		return ERR_CAST(shmem);
> > +
> > +	bo = to_panthor_bo(&shmem->base);
> > +	bo->flags = flags;
> > +
> > +	if (exclusive_vm) {
> > +		bo->exclusive_vm = panthor_vm_get(exclusive_vm);
> > +		bo->base.base.resv = panthor_vm_resv(exclusive_vm);
> > +	}
> > +
> > +	/*
> > +	 * Allocate an id of idr table where the obj is registered
> > +	 * and handle has the id what user can see.
> > +	 */
> > +	ret = drm_gem_handle_create(file, &shmem->base, handle);
> > +	/* drop reference from allocate - handle holds it now. */
> > +	drm_gem_object_put(&shmem->base);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	return bo;
> > +}  
> 
> This function might be better just returning a simple int. The
> "with_handle" approach means that doing anything much with the returned
> object is dodgy (because another user space thread could have already
> guessed the handle), and anyway the only caller
> (panthor_ioctl_bo_create()) doesn't use the object and just extracts the
> error code (if any).

Totally agree. I'll change the return type for an int.
