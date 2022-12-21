Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D3652EBB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 10:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6688A10E064;
	Wed, 21 Dec 2022 09:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF86710E064
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 09:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671615673; x=1703151673;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ABf8vfI3IIw12ocR1zSeeiipTn1viEXhdkoDc2bJQ/g=;
 b=nyc72VlE1l+kMNCSYEypDAmWDPT//XZ9x2iLeaMaQ/Q6P3/A/Y4tKf5Z
 emi8xbrzah2Mb+LD9Ptz1h9n1aobz1bycQDscunYc5STIbLaUUNt2+n9i
 crzBl8kq4vRkkqTS1HPa38I/aW2HiYl4p3Hchz50m7URo+fl2vwV4Ho25
 v+NmSHlgv7x6AlP0cpBNBHpOlHdQv/bwQQpstoIBDLopkeBX6yM+IGSo+
 ykm+7GLGYzbj1mX1M4kdhRQZ031b2qt8cp1jETvCPAHnYTK9DjWf/bO/e
 QNhBStJ4/d3QDA3MbqutooTrX/W6YxqHcLmHJI8rXFBJ/lPdHh24bUA3/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="299509392"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="299509392"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 01:41:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="644773486"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="644773486"
Received: from jorgeblx-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.46.119])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 01:41:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Siddh Raman Pant <code@siddh.me>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 04/10] drm/print: Fix support for NULL as first argument
 of drm_dbg_*
In-Reply-To: <3ebf0d61ad5e82875a4493108602e62429306b14.1671566741.git.code@siddh.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1671566741.git.code@siddh.me>
 <3ebf0d61ad5e82875a4493108602e62429306b14.1671566741.git.code@siddh.me>
Date: Wed, 21 Dec 2022 11:41:07 +0200
Message-ID: <87edst2ix8.fsf@intel.com>
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Dec 2022, Siddh Raman Pant <code@siddh.me> wrote:
> Comments say macros DRM_DEBUG_* are deprecated in favor of
> drm_dbg_*(NULL, ...), but they have broken support for it,
> as the macro will result in `(NULL) ? (NULL)->dev : NULL`.

What's wrong with that?

>
> Thus, fix them by casting input drm to a temporary struct ptr,
> with the same convention as in __DRM_DEFINE_DBG_RATELIMITED.
>
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>  include/drm/drm_print.h | 89 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 69 insertions(+), 20 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index a44fb7ef257f..53702d830291 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -486,26 +486,75 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>  	__drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
>  
>  
> -#define drm_dbg_core(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> -#define drm_dbg_driver(drm, fmt, ...)						\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> -#define drm_dbg_kms(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> -#define drm_dbg_prime(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> -#define drm_dbg_atomic(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> -#define drm_dbg_vbl(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> -#define drm_dbg_state(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> -#define drm_dbg_lease(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> -#define drm_dbg_dp(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DP, fmt, ##__VA_ARGS__)
> -#define drm_dbg_drmres(drm, fmt, ...)					\
> -	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> +#define drm_dbg_core(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_CORE,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_driver(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_DRIVER,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_kms(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_KMS,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_prime(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_PRIME,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_atomic(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_ATOMIC,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_vbl(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_VBL,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_state(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_STATE,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_lease(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_LEASE,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_dp(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_DP,		\
> +		    fmt, ##__VA_ARGS__);			\
> +})
> +
> +#define drm_dbg_drmres(drm, fmt, ...)				\
> +({								\
> +	const struct drm_device *drm_ = (drm);			\
> +	drm_dev_dbg(drm_ ? drm_->dev : NULL, DRM_UT_DRMRES,	\
> +		    fmt, ##__VA_ARGS__);			\
> +})
>  
>  #define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)

-- 
Jani Nikula, Intel Open Source Graphics Center
