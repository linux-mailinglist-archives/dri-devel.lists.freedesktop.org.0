Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE19F5A7A2A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 11:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA3D10E160;
	Wed, 31 Aug 2022 09:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9756310E160
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 09:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661937964; x=1693473964;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QVVOxa5CAKqbH+RerLVWhklDkj5aNGiQ5eBmUvlln6Q=;
 b=SSWqFoaLL45dBPi0uHzTUnjUiBdwYN/Z8/+x+va0NsVoHyjCvp2ohteX
 6WScd6b8QZMabOSHk0DrG3idUkLQ7FcNT8pOVdFB61iz5Ru6TTgzpBN3H
 lGrOSzIZty/cfyLY670U+3IGKb0PyrEkM0Ld1dZYH5VaYr/xRj7vVvLww
 x9eyZ8rPF8L+WG7tgf9mpgV24Jx6uDFuTEGgpSbtXQQOfu2NysD/N+QLi
 aWOtKT3GQb/MirPgm4kzrgQ13QpPKUTdfQsYZXSCx1MH3JOffuppqOJ3I
 0tNA8aCn5hvqd2ul9n6YoBOqai3XsZ0g3MQjhqswSzl3mjWNFbMjKupFh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="295414626"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="295414626"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 02:26:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="673278171"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.43.15])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 02:26:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: cgel.zte@gmail.com, airlied@linux.ie
Subject: Re: [PATCH linux-next] drm/gem: Remove the unneeded result variable
In-Reply-To: <20220831033301.302121-1-ye.xingchen@zte.com.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220831033301.302121-1-ye.xingchen@zte.com.cn>
Date: Wed, 31 Aug 2022 12:25:52 +0300
Message-ID: <8735dcepcv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julia Lawall <julia.lawall@inria.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 tzimmermann@suse.de, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Aug 2022, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value drm_gem_handle_delete() directly instead of storing it
> in another redundant variable.

Personally, I generally prefer keeping these types of variables, because
they make future changes on the code easier. For example, adding a new
call where you need to check the return value, or having to deal with
the error value right there. Or just adding ad hoc debug logging of the
return value.

Related, but not exactly the same, see commit b784c7707502
("coccinnelle: Remove ptr_ret script"). Adding Cc's from that commit for
input.

BR,
Jani.

> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/drm_gem.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index ad068865ba20..3fa0deff3014 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -782,14 +782,11 @@ drm_gem_close_ioctl(struct drm_device *dev, void *data,
>  		    struct drm_file *file_priv)
>  {
>  	struct drm_gem_close *args = data;
> -	int ret;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_GEM))
>  		return -EOPNOTSUPP;
>  
> -	ret = drm_gem_handle_delete(file_priv, args->handle);
> -
> -	return ret;
> +	return drm_gem_handle_delete(file_priv, args->handle);
>  }
>  
>  /**

-- 
Jani Nikula, Intel Open Source Graphics Center
