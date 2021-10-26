Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6F43B356
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C336E44E;
	Tue, 26 Oct 2021 13:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00C16E44B;
 Tue, 26 Oct 2021 13:44:15 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 l24-20020a9d1c98000000b00552a5c6b23cso19834466ota.9; 
 Tue, 26 Oct 2021 06:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cnRVnGis0LviSSRlXF2AYkWAFRV8p8fLS73OY6mL6og=;
 b=NpH1HzDtBgeQ/+QC82oWWhW856Fa6wiIGUggM3bDbu1EE2aqdrBp9broJwf4YPjiQ9
 kchqlNV7mRClR4Gwu0Vnkaw9ZSzJT9tr3nqtK2IBn/oCHFHS0iK6rIfozaA0zcOqnzma
 YN+slj8fny21NOIURSDzAhjLpMDRkEYdno7AaDTtuC8sJqQ83/Ah0+CoZPKkBqfHizoY
 LScAGb1yBunenvJG8PehUitXrgnsgIvd9vxFcmteVM/nBbLS6gIoDinV6CBrh+d+ClZi
 M5390PHk22iPPO5oXC6c7B/JfKhxkauURqKOce9G2duMe0/WvkRyzJ4EL9+dFAgN4iUd
 xnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=cnRVnGis0LviSSRlXF2AYkWAFRV8p8fLS73OY6mL6og=;
 b=LzetnG6oBILZAkqqraREhjpO2P1ogsusX7ZXJewPhY7guDqnKkdx9wO0NYbEH64qP6
 341GxzCQLcSMHjNqbIg6LayobGHKCRjwBb05bN3JoS+FVnE1Ehnl9RQ989AjPVXf5ggo
 B9DC6niIp2ARwX63mqdK2IrsyXlEXbBSfBFP4dGaI6WB48svQYdvWNQvRhZtkaAzYGxX
 lesAFZntUJO5r97eNPkcIZrgU11mZ5HSR/vVzQqjW7o5Zz6BKAcqHViIOSXEtRHdCme/
 /6C59yxDm/FO8bOq2wjVBzZ9bhnOiL5Aq5iDxLwxVEXj3McPzhmzTWSjCjtOqpdNkSZt
 S4dg==
X-Gm-Message-State: AOAM533V9eC4UQynT3L9VwmTAum8A7+qB3FUYh2XyN3eeBBu+VIKBCav
 Ak95LQ9T0taByKFqisJavI4=
X-Google-Smtp-Source: ABdhPJwa3WfXqBOKxLrj2gnuzWE7NO3b1+nP4A5k3DxrI3jW9n7YxhCcuhcevTkHoNHgwA1wqhUvcQ==
X-Received: by 2002:a9d:6a06:: with SMTP id g6mr19853579otn.347.1635255853524; 
 Tue, 26 Oct 2021 06:44:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v22sm4709895ott.80.2021.10.26.06.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 06:44:12 -0700 (PDT)
Date: Tue, 26 Oct 2021 06:44:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/9] drm/i915/dmabuf: add paranoid flush-on-acquire
Message-ID: <20211026134411.GA3857583@roeck-us.net>
References: <20211018174508.2137279-1-matthew.auld@intel.com>
 <20211018174508.2137279-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211018174508.2137279-4-matthew.auld@intel.com>
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

On Mon, Oct 18, 2021 at 06:45:03PM +0100, Matthew Auld wrote:
> As pointed out by Thomas, we likely need to flush the pages here if the
> GPU can read the page contents directly from main memory. Underneath we
> don't know what the sg_table is pointing to, so just add a
> wbinvd_on_all_cpus() here, for now.
> 
> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

With nosmp builds:

Error log:
drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c: In function 'i915_gem_object_get_pages_dmabuf':
drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c:248:17: error: implicit declaration of function 'wbinvd_on_all_cpus' [-Werror=implicit-function-declaration]
  248 |                 wbinvd_on_all_cpus();
      |                 ^~~~~~~~~~~~~~~~~~

Guenter

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 5be505ebbb7b..1adcd8e02d29 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -232,6 +232,7 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
>  
>  static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>  {
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	struct sg_table *pages;
>  	unsigned int sg_page_sizes;
>  
> @@ -242,8 +243,11 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>  	if (IS_ERR(pages))
>  		return PTR_ERR(pages);
>  
> -	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
> +	/* XXX: consider doing a vmap flush or something */
> +	if (!HAS_LLC(i915) || i915_gem_object_can_bypass_llc(obj))
> +		wbinvd_on_all_cpus();
>  
> +	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
>  	__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
>  
>  	return 0;
> -- 
> 2.26.3
> 
