Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3EAB0A90C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6FA10EA19;
	Fri, 18 Jul 2025 17:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="i+5Z4/qj";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="jsFNiMgp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167FC10EA19
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1752858392;
 x=1753463192; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=pWZoMtcYLl9ItjToTNZK1+kjo/IA9M5j09YLwNf09Jo=;
 b=i+5Z4/qjl9IgrbtZXkmZnP4g90lETkF6danqUjTWOd2LnAozKHZOhBGfdSPso4WMLIvCP+h0p+7Lu
 PT/TIGPKSfSGuleoXzGQM4audEA1z89pt2akDm0A5JDnchaUtVNeDzzFNQgqDxAe+CHBb7T2bRB+XJ
 Osy6Fvg2/qSa5JEQsFeu1LKYgJaaGB2nulW5EpWRetCjE1iIHVnVe2nGIBs7VbXrqhDOCcuCN9z0Z4
 P8ilyPwuHpc5dLIHxnjGYSxsoucXnuqMwJantGTzZQbT9WuougPT57Z9wgo8L/gXW6XsGs4586h4Uu
 i/5h2ieZVvU133vwTj5+nccE25csWbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1752858392;
 x=1753463192; d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=pWZoMtcYLl9ItjToTNZK1+kjo/IA9M5j09YLwNf09Jo=;
 b=jsFNiMgpRW9mCM7JJXDfDWHjDfaAl4lrf62j639/hlK1qUhQJfDUT/ZciQlOZ8MKte9W6sMH6TvO7
 ygCPwCKDA==
X-HalOne-ID: 8bf17ddc-63f9-11f0-915d-f7376af24660
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 8bf17ddc-63f9-11f0-915d-f7376af24660;
 Fri, 18 Jul 2025 17:06:31 +0000 (UTC)
Date: Fri, 18 Jul 2025 19:06:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Cc: airlied@gmail.com, jani.nikula@linux.intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net
Subject: Re: [PATCH] [PATCH v2] drm/i915: move struct_mutex from drm_device
 to drm_i915_private
Message-ID: <20250718170630.GA114969@ravnborg.org>
References: <20250718163413.291909-1-luiz.mello@estudante.ufscar.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718163413.291909-1-luiz.mello@estudante.ufscar.br>
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

On Fri, Jul 18, 2025 at 01:34:13PM -0300, Luiz Otavio Mello wrote:
> Includes the missing file drm_device.h, which was unintentionally
> omitted in v1.
> 
> i915 is the only remaining user of struct_mutex lock.
> 
> Move it from drm_device to drm_i915_private so it is only used within
> the i915 driver.
> 
> Also update intel_guc_log.c to use the new location of struct_mutex.
> 
> Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  4 ++--
>  drivers/gpu/drm/i915/i915_drv.h            |  8 ++++++++
>  include/drm/drm_device.h                   | 10 ----------
>  3 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index e8a04e476c57..7135fdb0ebb4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -678,7 +678,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	if (level < GUC_LOG_LEVEL_DISABLED || level > GUC_LOG_LEVEL_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&i915->drm.struct_mutex);
> +	mutex_lock(&i915->struct_mutex);
>  
>  	if (log->level == level)
>  		goto out_unlock;
> @@ -696,7 +696,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>  	log->level = level;
>  
>  out_unlock:
> -	mutex_unlock(&i915->drm.struct_mutex);
> +	mutex_unlock(&i915->struct_mutex);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index d0e1980dcba2..c585569b6036 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -224,6 +224,14 @@ struct drm_i915_private {
>  
>  	bool irqs_enabled;
>  
> +	/*
> +	 * Currently, struct_mutex is only used by the i915 driver as a replacement
> +	 * for BLK. 
               ^BKL.


	Sam
