Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62516CCFF46
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCBC710EF0F;
	Fri, 19 Dec 2025 13:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eSbHkBTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA9210EF0A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766149482;
 bh=vZ+m7oVBzU8XLN6KXkZhx2uzu8quEc2imx2YYGvcVNc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eSbHkBTx8RbGqW9wr3dj4LHPp5Pk/BgWQpCxRV8Y+tq/kHgMCS6OmSfVQka4GPo7E
 KlBhgPsi7ic+1wlHea3I9ajURPabf5QZjnfUWUpXjZZI1ZBn6kuBBAyyIe5T0+STce
 /e/kASby6+gtQYd6svw3YCA0Msb9dg92PIHWT8h/VlId6n+DmKMazD/W7GWkux+Ye5
 hS4lbxvAZZAZ2vAJU1TNgqMLdF/KkHTNwy3lmeCegAu8yPANXq5Amym7Kq31vCPFOy
 AJ8NfxMv2/3blz9MKhwJx18KHXH6S/PA+JWPVcgjT5EQ6r9N+Qs0Eio/233nN593lG
 kmxDjTuAHYxQQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 79EF017E0465;
 Fri, 19 Dec 2025 14:04:42 +0100 (CET)
Date: Fri, 19 Dec 2025 14:04:40 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dmitry.osipenko@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/tests: shmem: Add clean-up action to unpin pages
Message-ID: <20251219140440.0b38aa5b@fedora>
In-Reply-To: <20251212160317.287409-3-tzimmermann@suse.de>
References: <20251212160317.287409-1-tzimmermann@suse.de>
 <20251212160317.287409-3-tzimmermann@suse.de>
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

On Fri, 12 Dec 2025 17:00:33 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Automatically unpin pages on cleanup. The test currently fails with
> the error
> 
> [   58.246263] drm-kunit-mock-device drm_gem_shmem_test_get_sg_table.drm-kunit-mock-device: [drm] drm_WARN_ON(refcount_read(&shmem->pages_pin_count))
> 
> while cleaning up the GEM object. The pin count has to be zero at this
> point.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d586b535f144 ("drm/shmem-helper: Add and use pages_pin_count")
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.16+

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tests/drm_gem_shmem_test.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> index 872881ec9c30..1d50bab51ef3 100644
> --- a/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> @@ -34,6 +34,9 @@ KUNIT_DEFINE_ACTION_WRAPPER(sg_free_table_wrapper, sg_free_table,
>  KUNIT_DEFINE_ACTION_WRAPPER(drm_gem_shmem_free_wrapper, drm_gem_shmem_free,
>  			    struct drm_gem_shmem_object *);
>  
> +KUNIT_DEFINE_ACTION_WRAPPER(drm_gem_shmem_unpin_wrapper, drm_gem_shmem_unpin,
> +			    struct drm_gem_shmem_object *);
> +
>  /*
>   * Test creating a shmem GEM object backed by shmem buffer. The test
>   * case succeeds if the GEM object is successfully allocated with the
> @@ -212,6 +215,9 @@ static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
>  	ret = drm_gem_shmem_pin(shmem);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> +	ret = kunit_add_action_or_reset(test, drm_gem_shmem_unpin_wrapper, shmem);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
>  	sgt = drm_gem_shmem_get_sg_table(shmem);
>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
>  	KUNIT_EXPECT_NULL(test, shmem->sgt);

