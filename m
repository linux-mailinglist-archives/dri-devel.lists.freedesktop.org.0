Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F11792096
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 08:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8DE10E43A;
	Tue,  5 Sep 2023 06:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7309B10E16F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 06:46:16 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FCA066071F8;
 Tue,  5 Sep 2023 07:46:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693896375;
 bh=fJwED56Qhvdtu7z0U1GYzrQoI1Muoc82RDmLEyljqjs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hZAsFguPp1mjXFmpDkEjgRUcqUn0ljQnWscxYzfYdVQ6kQftwcTJa91FbapIu0cyd
 oyqedwBX2aQVqNp5NxRUICwrxb/teG59KFDf5oPkal570CGMVGazRwjII3fmFN9pgY
 Ywp+H2K3jn8bQJgCyZ+LK4sihYpKLuwQz0lOr3S2PNO6cuJSsSZgZTIWpszWdSCl/8
 BM6n6jVdOPbkNbL/OjUN+5u5C7SYHJoRYHaRMc4K8j4hAnLQiPuwcrxGdMndaFHQvd
 no1riSKkgmgEsY5M+TD2pbUqFR4OJcOSaMAUNA6jjlq2sjlz6ZCs6VKaFCiLjIBwN9
 RxHmyLLq7Ej4Q==
Date: Tue, 5 Sep 2023 08:46:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 09/20] drm/shmem-helper: Remove obsoleted is_iomem test
Message-ID: <20230905084611.6a404ff1@collabora.com>
In-Reply-To: <20230903170736.513347-10-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-10-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun,  3 Sep 2023 20:07:25 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Everything that uses the mapped buffer should be agnostic to is_iomem.
> The only reason for the is_iomem test is that we're setting shmem->vaddr
> to the returned map->vaddr. Now that the shmem->vaddr code is gone, remove
> the obsoleted is_iomem test to clean up the code.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 2b50d1a7f718..25e99468ced2 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -317,12 +317,6 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  
>  	if (obj->import_attach) {
>  		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> -		if (!ret) {
> -			if (drm_WARN_ON(obj->dev, map->is_iomem)) {
> -				dma_buf_vunmap(obj->import_attach->dmabuf, map);
> -				return -EIO;
> -			}
> -		}

Given there's nothing to unroll for the dmabuf case, I think it'd be
good to return directly and skip all the error paths. It would also
allow you to get rid of one indentation level for the !dmabuf path.

	if (obj->import_attach)
		return dma_buf_vmap(obj->import_attach->dmabuf, map);

	// non-dmabuf vmap logic here...



>  	} else {
>  		pgprot_t prot = PAGE_KERNEL;
>  

