Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E0C500B1D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 12:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E646410FFA2;
	Thu, 14 Apr 2022 10:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B2010FF9B;
 Thu, 14 Apr 2022 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649932215; x=1681468215;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9iKKBoQty3jCLn8d57O8xvh7sZoGswg4277CJyKjFNQ=;
 b=d/IVj+tZ1kWKqc7qSimAkId3X3A7cAmoEGaLBN/DAnaBjzKRDyLGoEWX
 sCjzolQnuB5q1ZhYHrVpU6lMIB/cKaphpUuiuGICmZztSAgpe39ZwzjKb
 RlcEbxtgNqLIb69EEyyQmgqSuE8yLt1LZ9aKhDInFL0jbzV9uCS6stToj
 gJGknUFCUqyiWdBTR4H79/yf0j6cHzk7uBgTjKRJOIDB/xri/aA2o6M5L
 8hRk7THr7bc3ebmm8baueq69iONzhezgARZ+uXTS9Jjom+mbsMnXuaD+r
 Kzig4t+yYVBtw4z38KYE8U5IOGiWKDcMV8BACUOAWF50RX6SyDqJcAWkk g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="263077716"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="263077716"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:30:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="725311185"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 03:30:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] drm/dp: Factor out a function to probe a DPCD
 address
In-Reply-To: <20220411132539.984647-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220408172154.807900-1-imre.deak@intel.com>
 <20220411132539.984647-1-imre.deak@intel.com>
Date: Thu, 14 Apr 2022 13:30:05 +0300
Message-ID: <8735igez4i.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022, Imre Deak <imre.deak@intel.com> wrote:
> Factor out from drm_dp_dpcd_read() a function to probe a DPCD address
> with a 1-byte read access. This will be needed by the next patch doing a
> read from an LTTPR address, which must happen without the preceding
> wake-up read in drm_dp_dpcd_read().
>
> While at it add tracing for the 1 byte read even if the read was
> successful.

Let's see if that's going to be annoying and confusing...

>
> v2: Add a probe function instead of exporting drm_dp_dpcd_access(). (Jani)
> v3: Add tracing for the 1-byte read even if the read was successful. (Khaled)
>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/dp/drm_dp.c    | 33 ++++++++++++++++++++++++++++-----
>  include/drm/dp/drm_dp_helper.h |  1 +
>  2 files changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/dp/drm_dp.c b/drivers/gpu/drm/dp/drm_dp.c
> index 580016a1b9eb7..2a1f5ff6633cc 100644
> --- a/drivers/gpu/drm/dp/drm_dp.c
> +++ b/drivers/gpu/drm/dp/drm_dp.c
> @@ -527,6 +527,31 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
>  	return ret;
>  }
>  
> +/**
> + * drm_dp_dpcd_probe() - probe a given DPCD address with a 1-byte read access
> + * @aux: DisplayPort AUX channel (SST)
> + * @offset: address of the register to probe
> + *
> + * Probe the provided DPCD address by reading 1 byte from it. The function can
> + * be used to trigger some side-effect the read access has, like waking up the
> + * sink, without the need for the read-out value.
> + *
> + * Returns 0 if the read access suceeded, or a negative error code on failure.
> + */
> +int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset)
> +{
> +	u8 buffer;
> +	int ret;
> +
> +	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, 1);
> +	WARN_ON(ret == 0);
> +
> +	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, &buffer, ret);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +EXPORT_SYMBOL(drm_dp_dpcd_probe);
> +
>  /**
>   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
>   * @aux: DisplayPort AUX channel (SST or MST)
> @@ -559,10 +584,9 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  	 * monitor doesn't power down exactly after the throw away read.
>  	 */
>  	if (!aux->is_remote) {
> -		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_DPCD_REV,
> -					 buffer, 1);
> -		if (ret != 1)
> -			goto out;
> +		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
> +		if (ret < 0)
> +			return ret;
>  	}
>  
>  	if (aux->is_remote)
> @@ -571,7 +595,6 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset,
>  					 buffer, size);
>  
> -out:
>  	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, buffer, ret);
>  	return ret;
>  }
> diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> index 1eccd97419436..91af98e6617c6 100644
> --- a/include/drm/dp/drm_dp_helper.h
> +++ b/include/drm/dp/drm_dp_helper.h
> @@ -2053,6 +2053,7 @@ struct drm_dp_aux {
>  	bool is_remote;
>  };
>  
> +int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
>  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
>  			 void *buffer, size_t size);
>  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,

-- 
Jani Nikula, Intel Open Source Graphics Center
