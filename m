Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2876A3C7287
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D88C898C2;
	Tue, 13 Jul 2021 14:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBB1898C2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 14:44:50 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 y21-20020a7bc1950000b02902161fccabf1so1828789wmi.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=1L5mINw096xieWbL4KVvspXBhC9JteSQpT+QZNzKqog=;
 b=Wbhf8JuvNz44wJSRHA2QE88fdWKQPvw4NwOF8GWoCl6ZQQ3rovreUx15ZL1xT9DIe5
 GbRcTwGDO9t7DITYYg3f/RvV6yI7FQOgVK6K6oF5VjdvGslUF/EEV1liesjWYjbBLk4/
 R7IzuKXb+5uRYs+pw4FOQ2rYbYUIsnTk2Wblg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=1L5mINw096xieWbL4KVvspXBhC9JteSQpT+QZNzKqog=;
 b=Ge2PdQ0BNP2rE0Nt41LLncLL6tgQvhLpwD5gsPghGIPkJGvB5DAJhEEGVIPh52ux9C
 ZqUfT382bAWBJP8YMB3e4XuL3vezkngkZr+uBhCz3yQGl1CqO+GddDMUTpHyWfgM3RS2
 63+x8mbbsa1Pvmaw2wwaWx/xPmZPZHnXkhmwgCkewdGEysKos4Mq/x+L0JtNg0DrNNh5
 fjTd7TTlCgfQLMplwU8qrjIGkqWouYApJGTnaeyqsSz39CqidyoLafco5cNh3w+YpDJG
 QlCPajSTGarhlz/F8anM7cWYsDep4itEGnh95ACNNENBbQT9AjacvBtC0Ob0CWoL++gi
 3vzg==
X-Gm-Message-State: AOAM530CJl2CnTJjy3hR8BV1UFnX/1mHg80AqAf8dXoQ9hZ1GFEZGvS6
 mcCRWoeuKheCudrJ2ocnLNyI3A==
X-Google-Smtp-Source: ABdhPJxwGMh21x8xPx1H1um/FI524/8QthcmMsSa6POVlFurHRIBZt2WYFT38dVdiqPRABOIzoAjCQ==
X-Received: by 2002:a05:600c:4856:: with SMTP id
 j22mr431663wmo.126.1626187489399; 
 Tue, 13 Jul 2021 07:44:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j12sm18993322wrq.83.2021.07.13.07.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:44:48 -0700 (PDT)
Date: Tue, 13 Jul 2021 16:44:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 2/2] drm/i915/gem: Migrate to system at dma-buf attach
 time (v5)
Message-ID: <YO2m36je6vf6Wgwu@phenom.ffwll.local>
References: <20210712231234.1031975-1-jason@jlekstrand.net>
 <20210712231234.1031975-2-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210712231234.1031975-2-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: thomas.hellstrom@linux.intel.com, kernel test robot <lkp@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>, matthew.auld@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 06:12:34PM -0500, Jason Ekstrand wrote:
> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> Until we support p2p dma or as a complement to that, migrate data
> to system memory at dma-buf attach time if possible.
> 
> v2:
> - Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
>   selftest to migrate if we are LMEM capable.
> v3:
> - Migrate also in the pin() callback.
> v4:
> - Migrate in attach
> v5: (jason)
> - Lock around the migration
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 25 ++++++++++++++++++-
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  4 ++-
>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 9a655f69a0671..3163f00554476 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -170,8 +170,31 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
>  				  struct dma_buf_attachment *attach)
>  {
>  	struct drm_i915_gem_object *obj = dma_buf_to_obj(dmabuf);
> +	struct i915_gem_ww_ctx ww;
> +	int err;
> +
> +	for_i915_gem_ww(&ww, err, true) {
> +		err = i915_gem_object_lock(obj, &ww);
> +		if (err)
> +			continue;
> +
> +		if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM)) {
> +			err = -EOPNOTSUPP;
> +			continue;
> +		}
> +
> +		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_SMEM);
> +		if (err)
> +			continue;
>  
> -	return i915_gem_object_pin_pages_unlocked(obj);
> +		err = i915_gem_object_wait_migration(obj, 0);
> +		if (err)
> +			continue;
> +
> +		err = i915_gem_object_pin_pages(obj);
> +	}
> +
> +	return err;
>  }
>  
>  static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 3dc0f8b3cdab0..4f7e77b1c0152 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -106,7 +106,9 @@ static int igt_dmabuf_import_same_driver(void *arg)
>  	int err;
>  
>  	force_different_devices = true;
> -	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
> +	obj = i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);

I'm wondering (and couldn't answer) whether this creates an lmem+smem
buffer, since if we create an lmem-only buffer then the migration above
should fail.

Which I'm also not sure we have a testcase for that testcase either ...

I tried to read some code here, but got a bit lost. Ideas?
-Daniel

> +	if (IS_ERR(obj))
> +		obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
>  	if (IS_ERR(obj))
>  		goto out_ret;
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
