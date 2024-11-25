Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC24E9D88CD
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 16:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C8410E061;
	Mon, 25 Nov 2024 15:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YcY51RuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B920E10E061
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732547289;
 bh=uJqLFyCrWR7vqKWE5PPALUlsiK37e+2rr7vIPXNJJsc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YcY51RuZXnaOO4zGebIb8vJ6ZsWoPaaQ9D7PQSmrC2JOYGLXelHm3w/Tdq4iH+ZUB
 eE0MVGwkR1cf582CC3KhMGexvinLZTr+mh/rx7e1XN1dxEP/v39vYEs5I5gChusxeH
 fNiAX9VHRAbUySVqPK9DWQ1s7Xthdwc//DmSWH8qK1kvy7FNaSzLP8+aS4fnUeQyHK
 fy2ukYXhkqhVCezEYncDtmSwQ6orLQGVLL8Hi/z7HgWehvXEUF7EGOdxgWEg2qJjf8
 2nxinVGTKFm65Nx+ENs0NlPG1J1NXVBBraXbYnu7w+g2FyN6OYCpFvZcvI66GQi6nK
 5ZNwNZgGFJLWQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D7C6917E36CC;
 Mon, 25 Nov 2024 16:08:08 +0100 (CET)
Date: Mon, 25 Nov 2024 16:07:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: register size of internal objects
 through fdinfo
Message-ID: <20241125160758.2e0fa766@collabora.com>
In-Reply-To: <20241115191426.3101123-1-adrian.larumbe@collabora.com>
References: <20241115191426.3101123-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adrian,

On Fri, 15 Nov 2024 19:14:18 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> @@ -71,9 +112,9 @@ void panthor_kernel_bo_destroy(struct panthor_kernel_b=
o *bo)
>   * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
>   */
>  struct panthor_kernel_bo *
> -panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm=
 *vm,
> -			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va)
> +panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_fi=
le *pfile,
> +			 struct panthor_vm *vm, size_t size, u32 bo_flags,
> +			 u32 vm_map_flags, u64 gpu_va)
>  {
>  	struct drm_gem_shmem_object *obj;
>  	struct panthor_kernel_bo *kbo;
> @@ -116,6 +157,16 @@ panthor_kernel_bo_create(struct panthor_device *ptde=
v, struct panthor_vm *vm,
>  	bo->exclusive_vm_root_gem =3D panthor_vm_root_gem(vm);
>  	drm_gem_object_get(bo->exclusive_vm_root_gem);
>  	bo->base.base.resv =3D bo->exclusive_vm_root_gem->resv;
> +
> +	INIT_LIST_HEAD(&kbo->private_obj);
> +
> +	/* Only FW regions are not bound to an open file */
> +	if (pfile) {
> +		mutex_lock(&ptdev->private_obj_list_lock);
> +		list_add(&kbo->private_obj, &pfile->private_file_list);
> +		mutex_unlock(&ptdev->private_obj_list_lock);

I hate the fact we have to take a device lock to insert/remove elements
in the private_file list. I'd rather opt for an idr map (like we have
for public GEM handles), with the pfile owning a ref to the internal
GEMs.

When the kbo needs to be added to the pfile kbo list, you pass a
non-NULL pfile and let panthor_kernel_bo_create() add the entry to the
IDR. In the destroy path, you remove the entry, and reset the
kbo->handle value, to make sure panthor_kernel_bo_destroy() is not
called a second time with a non-NULL pfile. This way your lock can be
moved to panthor_file, and you don't have to worry about UAFs on the
pfile object.

> +	}
> +
>  	return kbo;
> =20
>  err_free_va:

Regards,

Boris
