Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8977388A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 09:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE7210E3A7;
	Tue,  8 Aug 2023 07:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51E210E3A7;
 Tue,  8 Aug 2023 07:21:22 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ADBD066071E9;
 Tue,  8 Aug 2023 08:21:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691479281;
 bh=UXRcgMncZj39YeKfwT0rE7PfhMSJQ8L3/sbxhBni15s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NK7ESBq/vynUZ0Aazs9Dv3B48dz4zwMylbAeXJWVjgbX0SRVb4XVKHmOK689nJcsI
 940GrX/OyXYwglHIez6BsuJ5SnoypyDdhvMlC2dh48xqc5re0LuN0wGfHbaZu7yjPw
 ihmKR3w23weg0AxJVQWy/DWUzflpbA+9m4O40mHmqts6OB7F45jYaok7FmOlO6nfGK
 Tvd8zy79/WYRbfuW2OXi7nNEf15+GwtJLaA96nzjdh7VWWlo1DZgC2A17iqiEiWYMP
 9Xwp9XM2n/jZgg/P/NiZ4YaVImnQoV7VHCDvuGCqKp5cnDSEr2bq3xsXFSnIGHnAx8
 kMbkoFMYZdQ7g==
Date: Tue, 8 Aug 2023 09:21:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v9 01/11] drm/gem: fix lockdep check for
 dma-resv lock
Message-ID: <20230808092117.7f7fdef9@collabora.com>
In-Reply-To: <20230803165238.8798-2-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
 <20230803165238.8798-2-dakr@redhat.com>
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  3 Aug 2023 18:52:20 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> When no custom lock is set to protect a GEMs GPUVA list, lockdep checks
> should fall back to the GEM objects dma-resv lock. With the current
> implementation we're setting the lock_dep_map of the GEM objects 'resv'
> pointer (in case no custom lock_dep_map is set yet) on
> drm_gem_private_object_init().
> 
> However, the GEM objects 'resv' pointer might still change after
> drm_gem_private_object_init() is called, e.g. through
> ttm_bo_init_reserved(). This can result in the wrong lock being tracked.
> 
> To fix this, call dma_resv_held() directly from
> drm_gem_gpuva_assert_lock_held() and fall back to the GEMs lock_dep_map
> pointer only if an actual custom lock is set.
> 
> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

but I'm wondering if it wouldn't be a good thing to add a
drm_gem_set_resv() helper, so the core can control drm_gem_object::resv
re-assignments (block them if it's happening after the GEM has been
exposed to the outside world or update auxiliary data if it's happening
before that).

> ---
>  include/drm/drm_gem.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index c0b13c43b459..bc9f6aa2f3fe 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -551,15 +551,17 @@ int drm_gem_evict(struct drm_gem_object *obj);
>   * @lock: the lock used to protect the gpuva list. The locking primitive
>   * must contain a dep_map field.
>   *
> - * Call this if you're not proctecting access to the gpuva list
> - * with the dma-resv lock, otherwise, drm_gem_gpuva_init() takes care
> - * of initializing lock_dep_map for you.
> + * Call this if you're not proctecting access to the gpuva list with the
> + * dma-resv lock, but with a custom lock.
>   */
>  #define drm_gem_gpuva_set_lock(obj, lock) \
> -	if (!(obj)->gpuva.lock_dep_map) \
> +	if (!WARN((obj)->gpuva.lock_dep_map, \
> +		  "GEM GPUVA lock should be set only once.")) \
>  		(obj)->gpuva.lock_dep_map = &(lock)->dep_map
>  #define drm_gem_gpuva_assert_lock_held(obj) \
> -	lockdep_assert(lock_is_held((obj)->gpuva.lock_dep_map))
> +	lockdep_assert((obj)->gpuva.lock_dep_map ? \
> +		       lock_is_held((obj)->gpuva.lock_dep_map) : \
> +		       dma_resv_held((obj)->resv))
>  #else
>  #define drm_gem_gpuva_set_lock(obj, lock) do {} while (0)
>  #define drm_gem_gpuva_assert_lock_held(obj) do {} while (0)
> @@ -573,11 +575,12 @@ int drm_gem_evict(struct drm_gem_object *obj);
>   *
>   * Calling this function is only necessary for drivers intending to support the
>   * &drm_driver_feature DRIVER_GEM_GPUVA.
> + *
> + * See also drm_gem_gpuva_set_lock().
>   */
>  static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
>  {
>  	INIT_LIST_HEAD(&obj->gpuva.list);
> -	drm_gem_gpuva_set_lock(obj, &obj->resv->lock.base);
>  }
>  
>  /**

