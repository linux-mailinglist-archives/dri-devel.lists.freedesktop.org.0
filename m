Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849A17E9968
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B970310E32E;
	Mon, 13 Nov 2023 09:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B972910E32E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:50:02 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 599A966071C9;
 Mon, 13 Nov 2023 09:50:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699869001;
 bh=wCfkXVzFh9+4/eq4jvC4jcqKh2QCYCyEjmq0UU8BsDw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PZPUaFlPSKPp3o6zruu/QciXsc7IUJUUWsGdEFqHyBk79f3gt7ldiZCkGCTcQByFL
 URjfigZn911fDQha95PLuUss6T6/Nq6Xa9150A0aij5ByTPs4+LWV81CMmWU0pKdDN
 ub2bKS2aO6rbcVIlOedm1FilPSCI6wWT5q5AUiGSD9k6OOhl+C3HuLMsZKiKt/No7C
 2D3u/BqrowOvvKcxvDzyDx4nAIVz/YaEAHhlXosdQ2IYxlCsNpl+I0CBYFmnZ+nTiT
 Zf/gVe1drWYIyqbxIQXJBAaS/LrJL6Qiu4njP416DMYHN6h9C5laL8f+xy9uHeZDKs
 XC5cvNPCqPXpg==
Date: Mon, 13 Nov 2023 10:49:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 21/26] drm/shmem-helper: Optimize unlocked
 get_pages_sgt()
Message-ID: <20231113104956.2255269a@collabora.com>
In-Reply-To: <20231029230205.93277-22-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-22-dmitry.osipenko@collabora.com>
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

On Mon, 30 Oct 2023 02:02:00 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> SGT isn't refcounted. Once SGT pointer has been obtained, it remains the
> same for both locked and unlocked get_pages_sgt(). Return cached SGT
> directly without taking a potentially expensive lock.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 560ce565f376..6dd087f19ea3 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -955,6 +955,9 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
>  	drm_WARN_ON(obj->dev, drm_gem_shmem_is_evictable(shmem));
>  	drm_WARN_ON(obj->dev, drm_gem_shmem_is_purgeable(shmem));
>  
> +	if (shmem->sgt)
> +		return shmem->sgt;
> +

By doing that, you introduce a race between drm_gem_shmem_put_pages()
and drm_gem_shmem_get_pages_sgt(). I know it's only happening if the
user doesn't follow the rule listed in drm_gem_shmem_get_pages_sgt() doc
(caller must owns a pages ref before calling
drm_gem_shmem_get_pages_sgt()), but now you return a possibly invalid
pointer instead of returning an error when this happens.
If that's what we want, we should at least update the documentation to
make it clear.

>  	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
>  	if (ret)
>  		return ERR_PTR(ret);

