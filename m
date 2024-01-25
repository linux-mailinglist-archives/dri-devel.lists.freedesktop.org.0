Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E283BD4C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 10:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA92210F865;
	Thu, 25 Jan 2024 09:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A66D10F865
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706174941;
 bh=MuHOFFDvhunWa09yCKieBQeofTJm5hUil4z2V5RP7/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NrDb1FaBaq13ye++Lhg9rKsUJUXv0CRes27oB17iSRjJI+f260kZqghxxIZiHPzKF
 yG6w09yncfIcrwFhoeCGYZ/UGRPOvZj+BlKCoxh0Kbrzd/cMl51zO7QWS4loE7xDkx
 R8JmJ/OZjwElQbafLdkoQovcnyaDjPRBNW5oDS+E7/hS0AKI10hMKA1rvqLulArOiC
 /gg8mIL23r6i4JVwuVbbfG5bPGMGvlO5PRxPX3vXd/g/7vPtHw838An9VQnD8DfxH8
 vXnkf3u1PESFA9piBvV8wC2PNTy0r3VVjSEBCViVMZWseP6/oklRc8Ydq8iLOdBE1v
 tbEsIRBp4/X9w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E09AB378000B;
 Thu, 25 Jan 2024 09:29:00 +0000 (UTC)
Date: Thu, 25 Jan 2024 10:28:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 24/30] drm/shmem-helper: Optimize unlocked
 get_pages_sgt()
Message-ID: <20240125102859.6d8a864f@collabora.com>
In-Reply-To: <20240105184624.508603-25-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-25-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  5 Jan 2024 21:46:18 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> SGT isn't refcounted. Once SGT pointer has been obtained, it remains the
> same for both locked and unlocked get_pages_sgt(). Return cached SGT
> directly without taking a potentially expensive lock.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

but I'm wondering if we should have made this change directly in
'drm/shmem-helper: Change sgt allocation policy'.

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 8fd7851c088b..e6e6e693ab95 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -962,6 +962,18 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
>  	    drm_WARN_ON(obj->dev, drm_gem_shmem_is_purgeable(shmem)))
>  		return ERR_PTR(-EBUSY);
>  
> +	/*
> +	 * Drivers that use shrinker should take into account that shrinker
> +	 * may relocate BO, thus invalidating the returned SGT pointer.
> +	 * Such drivers should pin GEM while they use SGT.
> +	 *
> +	 * Drivers that don't use shrinker should take into account that
> +	 * SGT is released together with the GEM pages. Pages should be kept
> +	 * alive while SGT is used.
> +	 */
> +	if (shmem->sgt)
> +		return shmem->sgt;
> +
>  	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
>  	if (ret)
>  		return ERR_PTR(ret);

