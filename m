Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1DD7920B0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FAF10E035;
	Tue,  5 Sep 2023 07:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3EB10E035
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 07:20:33 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A4F06606FC2;
 Tue,  5 Sep 2023 08:20:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693898432;
 bh=ViufKsNlWWk8KZTSfvqYHZ2OvbkMoj8nCUrSGDydXGs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iH1ci9YojMcECNCDV3YsRmvOsabpbJ/198VEJ0SKr8qECVVrARyidjb8o58WJlFCV
 zKY9RLbyK8fMvziaUdfgzucn5WqxCqiUv9ykxGtQfVRsYhirlebqBgZHFfctaV6wZU
 p99ux1ZyebZ5LKLomfBWKrRBv7lHT7NalpAO0aPHrLSpvLcufesvqXvFpoShQHRb0f
 TXS6ntWMaCBltqPAVHBFHgW42trvJ/d0VrKaSz25znWRBhiLwQjmsCornj6LkhjAJA
 2r2t8o/ztoVTpzn4fFjfo/nSzSnT0A+vblHrA6gJ3A1I2akaIef7Eu0fN0roPwxhN7
 ZtzxENeDvHKqQ==
Date: Tue, 5 Sep 2023 09:20:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 06/20] drm/virtio: Replace drm_gem_shmem_free() with
 drm_gem_object_put()
Message-ID: <20230905092028.182f8ed8@collabora.com>
In-Reply-To: <20230903170736.513347-7-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-7-dmitry.osipenko@collabora.com>
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

On Sun,  3 Sep 2023 20:07:22 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Prepare virtio_gpu_object_create() to addition of memory shrinker support
> by replacing open-coded drm_gem_shmem_free() with drm_gem_object_put() that
> decrements GEM refcount to 0, which becomes important for drm-shmem because
> it will start to use GEM's refcount during the shmem's BO freeing time in
> order to prevent spurious lockdep warning about resv lock ordering vs
> fs_reclaim code paths.

I think I'm okay with the change (assuming virtio_gpu_free_object()
can deal with partially initialized objects), not with the explanation
:-). I don't really see why we need to take the resv lock in
drm_gem_shmem_free(). As said in my v15 review, I think we should
replace the drm_gem_shmem_put_pages() call we have in
drm_gem_shmem_free() by a call to a new drm_gem_shmem_free_pages()
helper that does exactly what drm_gem_shmem_put_pages() does without
the refcounting/locking, because all that should remain at the time
drm_gem_shmem_free() is called is the implicit pages ref owned by
shmem->sgt, and there's no risk of other threads accessing the GEM
object at that point.

> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index c7e74cf13022..343b13428125 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -244,6 +244,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>  err_put_id:
>  	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
>  err_free_gem:
> -	drm_gem_shmem_free(shmem_obj);
> +	drm_gem_object_put(&bo->base.base);
>  	return ret;
>  }

