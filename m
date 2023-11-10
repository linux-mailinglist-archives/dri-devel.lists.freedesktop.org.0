Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0418B7E7D34
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 15:59:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611CD10E0D1;
	Fri, 10 Nov 2023 14:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE9010E0D1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:59:04 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E28566073EF;
 Fri, 10 Nov 2023 14:59:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699628342;
 bh=SQb2j6nDMO+EiuEwHZDxGZzthkvFJAlHjbUlz+IdTNw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YH+nfkgLbkWQkV37II3bYdZcSxqLDwOFcTSgy7M/3n5WqMe4lphFWoXyhqvonc1RG
 OW7e5fBKPttqYaSSLUxUqqcc+TNzF5VwADvhL28pA4+KpvuQ+EZB7A3cLHm63evqlG
 ajV1CVKB+iXnG2EsczpWQAq7oyXBpLvnTYovGgz6cEnIU9xeNQm/N5YRqyjsITHjMc
 BAYaGIu20tYV+MlsSB0r6BMQ/9i/eW6r0pifvYA+ICQf7MXsiGfbESbwN9Mf0/09zo
 SzVHoOfpbmrbD7P+z8MTWwR2ixJK8Zvx1Q1xc98tFkfOLq+AItBtNT1eokLkaQ/HLa
 luLbtD3iwJL6Q==
Date: Fri, 10 Nov 2023 15:58:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 19/26] drm/shmem-helper: Add common memory shrinker
Message-ID: <20231110155858.4c92f05d@collabora.com>
In-Reply-To: <20231029230205.93277-20-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-20-dmitry.osipenko@collabora.com>
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

On Mon, 30 Oct 2023 02:01:58 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> @@ -238,6 +308,20 @@ void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
>  	if (refcount_dec_not_one(&shmem->pages_use_count))
>  		return;
>  
> +	/*
> +	 * Destroying the object is a special case because acquiring
> +	 * the obj lock can cause a locking order inversion between
> +	 * reservation_ww_class_mutex and fs_reclaim.
> +	 *
> +	 * This deadlock is not actually possible, because no one should
> +	 * be already holding the lock when GEM is released.  Unfortunately
> +	 * lockdep is not aware of this detail.  So when the refcount drops
> +	 * to zero, we pretend it is already locked.
> +	 */
> +	if (!kref_read(&shmem->base.refcount) &&
> +	    refcount_dec_and_test(&shmem->pages_use_count))
> +		return drm_gem_shmem_free_pages(shmem);

Uh, with get/put_pages() being moved to the create/free_gem()
hooks, we're back to a situation where pages_use_count > 0 when we
reach gem->refcount == 0, which is not nice. We really need to patch
drivers so they dissociate GEM creation from the backing storage
allocation/reservation + mapping of the BO in GPU VM space.

