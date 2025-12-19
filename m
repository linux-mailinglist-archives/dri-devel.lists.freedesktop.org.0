Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B3CCFF70
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBE110EF8D;
	Fri, 19 Dec 2025 13:06:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="As4NLXXo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE01110EF8F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766149581;
 bh=xwEXc0YZI1B/QU3CrKy/Saw1yLKl2MvE/Ri9dIAvG70=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=As4NLXXo8GNRgelCMvEZPX+33lORBHDFOzEMNTIKL1laBiig82d9prp2gbgJH/v5l
 kh0cWJ1TIjAn2QwboOAdcJfTiOOAT+36ZokuajJu9s4g1MIMP9T9diTpLy+30Awr40
 9J+jxMOGr8NzwundFzv42Oj5bfDH041NFBEU/j6187sr8MP0mf5NjU/BvPx29WWn1X
 P/0tN7i+s84bqCst3SulDpKecWITOQtyu7jpndXP3zhI9KMGWW1t15PzzYPRFEVHEl
 qNTh09bmJMnaV30TTd7kjk9qFvcfUj8/wkr3mzipPhf4lN7LtRCQFZDHua0D8kP16Z
 k6NNKUwCJ8bMQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0221F17E0465;
 Fri, 19 Dec 2025 14:06:20 +0100 (CET)
Date: Fri, 19 Dec 2025 14:06:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dmitry.osipenko@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/tests: shmem: Hold reservation lock around madvise
Message-ID: <20251219140617.279d3c78@fedora>
In-Reply-To: <20251212160317.287409-5-tzimmermann@suse.de>
References: <20251212160317.287409-1-tzimmermann@suse.de>
 <20251212160317.287409-5-tzimmermann@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Dec 2025 17:00:35 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Acquire and release the GEM object's reservation lock around calls
> to the object's madvide operation. The tests use
> drm_gem_shmem_madvise_locked(), which led to errors such as show below.
> 
> [   58.339389] WARNING: CPU: 1 PID: 1352 at drivers/gpu/drm/drm_gem_shmem_helper.c:499 drm_gem_shmem_madvise_locked+0xde/0x140
> 
> Only export the new helper drm_gem_shmem_madvise() for Kunit tests.
> This is not an interface for regular drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 954907f7147d ("drm/shmem-helper: Refactor locked/unlocked functions")
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.16+

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c     | 15 +++++++++++++++
>  drivers/gpu/drm/tests/drm_gem_shmem_test.c |  8 ++++----
>  include/drm/drm_gem_shmem_helper.h         |  1 +
>  3 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 06ef4e5adb7d..4ffcf6ed46f5 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -924,6 +924,21 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct iosys_map *
>  	dma_resv_unlock(obj->resv);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(drm_gem_shmem_vunmap);
> +
> +int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
> +{
> +	struct drm_gem_object *obj = &shmem->base;
> +	int ret;
> +
> +	ret = dma_resv_lock_interruptible(obj->resv, NULL);
> +	if (ret)
> +		return ret;
> +	ret = drm_gem_shmem_madvise_locked(shmem, madv);
> +	dma_resv_unlock(obj->resv);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_IF_KUNIT(drm_gem_shmem_madvise);
>  #endif
>  
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> index 3e7c6f20fbcc..d639848e3c8e 100644
> --- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> @@ -292,17 +292,17 @@ static void drm_gem_shmem_test_madvise(struct kunit *test)
>  	ret = kunit_add_action_or_reset(test, drm_gem_shmem_free_wrapper, shmem);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> -	ret = drm_gem_shmem_madvise_locked(shmem, 1);
> +	ret = drm_gem_shmem_madvise(shmem, 1);
>  	KUNIT_EXPECT_TRUE(test, ret);
>  	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
>  
>  	/* Set madv to a negative value */
> -	ret = drm_gem_shmem_madvise_locked(shmem, -1);
> +	ret = drm_gem_shmem_madvise(shmem, -1);
>  	KUNIT_EXPECT_FALSE(test, ret);
>  	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
>  
>  	/* Check that madv cannot be set back to a positive value */
> -	ret = drm_gem_shmem_madvise_locked(shmem, 0);
> +	ret = drm_gem_shmem_madvise(shmem, 0);
>  	KUNIT_EXPECT_FALSE(test, ret);
>  	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
>  }
> @@ -330,7 +330,7 @@ static void drm_gem_shmem_test_purge(struct kunit *test)
>  	ret = drm_gem_shmem_is_purgeable(shmem);
>  	KUNIT_EXPECT_FALSE(test, ret);
>  
> -	ret = drm_gem_shmem_madvise_locked(shmem, 1);
> +	ret = drm_gem_shmem_madvise(shmem, 1);
>  	KUNIT_EXPECT_TRUE(test, ret);
>  
>  	/* The scatter/gather table will be freed by drm_gem_shmem_free */
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 6924ee226655..3dd93e2df709 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -310,6 +310,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>  #if IS_ENABLED(CONFIG_KUNIT)
>  int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map);
>  void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem, struct iosys_map *map);
> +int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv);
>  #endif
>  
>  #endif /* __DRM_GEM_SHMEM_HELPER_H__ */

