Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C64AC732D41
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 12:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2490910E047;
	Fri, 16 Jun 2023 10:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0F510E047;
 Fri, 16 Jun 2023 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686910657; x=1718446657;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p9l3rC4lvWmIcDE6S4P319s7+1UjqTQtD/uy17dtOa4=;
 b=oDkNHXtsFmTFZGI4pZqK1orZkLbdFrC8ldgsxIzjfKcdOXDqUYNdgmAY
 EALGf38CfIWUMs59cLS+Y07IuxG+26j/ZwCOf8cDNF+C5yQ455CB/1s1k
 y8djngrtOpnfz1+5e5dAORX7znCbbhok+zwSwuaFJ418H5GEIBiBl1p7m
 1IEtFMFXSVdfVQXgR6qd3wokn9iiXZCgZAkZXS8PILYNxuuvvkGEkJPoM
 LAUm2OYr1RWSZJoVLvmLvLRbXZBqJCnuej22LrWdiINmwQ6m2crlZcOXn
 ogNSdqtfMc4ICqjVK7oTghKs+8rCDkFS677wwOrTO7UQdHZaOjapvIKpo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445560377"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="445560377"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742618866"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="742618866"
Received: from vyashin-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.36.124])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:16:53 -0700
Date: Fri, 16 Jun 2023 12:16:49 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/i915: make i915_drm_client_fdinfo() reference
 conditional again
Message-ID: <ZIw2kdx9+DCmUZUV@ashyti-mobl2.lan>
References: <20230616093158.3568480-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616093158.3568480-1-arnd@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Fri, Jun 16, 2023 at 11:31:47AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The function is only defined if CONFIG_PROC_FS is enabled:
> 
> ld.lld: error: undefined symbol: i915_drm_client_fdinfo
> >>> referenced by i915_driver.c
> >>>               drivers/gpu/drm/i915/i915_driver.o:(i915_drm_driver) in archive vmlinux.a
> 
> Use the PTR_IF() helper to make the reference NULL otherwise.
> 
> Fixes: e894b724c316d ("drm/i915: Use the fdinfo helper")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
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

nice! This is becoming the new trend now.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
