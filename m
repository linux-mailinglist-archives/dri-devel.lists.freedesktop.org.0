Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504A733D49
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 02:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5EA10E6B1;
	Sat, 17 Jun 2023 00:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B8D10E6AE;
 Sat, 17 Jun 2023 00:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=cszALHYSeI7dIli/xZoXLXNFlOmkeWHMkASD1ujijPw=; b=nmJ5S18KN8QJqxlk12F8Nkt1es
 TVWXxAbwC0HOZvexLboqUuF+NfzHwyQ2pakRl2XVBW9ifpd67VmDF14KOO4AJGeuZJahfH53QVp7l
 s3QZa+56kqmwgDXZOyCEY42DWB3l/D+s7PuJFl4A+SqgYM40t4PDuPazmIuahi3f1ZLBQvhKuKxEC
 4uAhQGn+UJ9RPPlq56a/wJjfMH2koVfDWaZ2hUI9rzX3zlBhReXSZQKwkcmyWF2p9eU7a2d1aX3ls
 QUr2H+TG9vcE6uEAiRzVWOTHi6QHWZd2hkL/bbPpIH5x/drQaZiFEkaGDOLIof8lRHsQK+O/6VTty
 w5+Ta3sw==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qAK3o-002GI7-0B; Sat, 17 Jun 2023 00:45:00 +0000
Message-ID: <3cd3fc67-fb39-f483-3a6f-94ddfbbcf652@infradead.org>
Date: Fri, 16 Jun 2023 17:44:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] drm/i915: make i915_drm_client_fdinfo() reference
 conditional again
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20230616093158.3568480-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230616093158.3568480-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/16/23 02:31, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The function is only defined if CONFIG_PROC_FS is enabled:
> 
> ld.lld: error: undefined symbol: i915_drm_client_fdinfo
>>>> referenced by i915_driver.c
>>>>               drivers/gpu/drm/i915/i915_driver.o:(i915_drm_driver) in archive vmlinux.a
> 
> Use the PTR_IF() helper to make the reference NULL otherwise.
> 
> Fixes: e894b724c316d ("drm/i915: Use the fdinfo helper")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/gpu/drm/i915/i915_driver.c     | 2 +-
>  drivers/gpu/drm/i915/i915_drm_client.h | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 75cbc43b326dd..0ad0c5885ec27 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1816,7 +1816,7 @@ static const struct drm_driver i915_drm_driver = {
>  	.open = i915_driver_open,
>  	.lastclose = i915_driver_lastclose,
>  	.postclose = i915_driver_postclose,
> -	.show_fdinfo = i915_drm_client_fdinfo,
> +	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> index 4c18b99e10a4e..67816c912bca1 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -47,8 +47,6 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
>  
>  struct i915_drm_client *i915_drm_client_alloc(void);
>  
> -#ifdef CONFIG_PROC_FS
>  void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
> -#endif
>  
>  #endif /* !__I915_DRM_CLIENT_H__ */

-- 
~Randy
