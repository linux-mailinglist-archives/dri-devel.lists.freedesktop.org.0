Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC7197D407
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 12:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5712E10E0BB;
	Fri, 20 Sep 2024 10:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mI0AuGkI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B910A10E0BB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726827135; x=1758363135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=uZcmPQs/H7wTAFmUH1ssqEASAzxuDy7ezpWnhVe0tHs=;
 b=mI0AuGkI1MEejqp7S584VsIbkuUGwQxgDpXN4Mco629A4GGd6etcwWHh
 xJUiIgCzEN8C8jnhqtXD1qM6Cl5en/7JE6nrLvnniv9POyAB2rHZ5n4N9
 20zrXUz1+FHXVlXUeRIoPieKlqLCfIVdp3ne+izeE5JY4m52xkCmP+C6m
 taiUhffQssa6O/w3KWKk/oIcUiC/qPpZcrcirNaqRzOQcLGjHFhRjTUY3
 Vqd0eTmXv24AWXDlc7yfz/xDe43JxS/4IA4oxybY2tgtSouC3Ktaso0tJ
 wj2KElPxe138hwrd+Mfpzek0Mhf+nU5cFCnzXE7pBs2RRMBkP03bmW/FH Q==;
X-CSE-ConnectionGUID: qHuzuUdOQq6MpwFFc2HcgA==
X-CSE-MsgGUID: rdbqyj7nQaqWY8UjVzLGiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29613709"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29613709"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 03:12:15 -0700
X-CSE-ConnectionGUID: /vyeSkMVRqSvmeQGUYQ0tA==
X-CSE-MsgGUID: GavfkqvSR3+nDLIxv3GwVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70381293"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 20 Sep 2024 03:12:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Sep 2024 13:12:11 +0300
Date: Fri, 20 Sep 2024 13:12:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Link drm_rect.o into DRM core module
Message-ID: <Zu1Ke1TuThbtz15E@intel.com>
References: <20240919185436.86790-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240919185436.86790-1-tzimmermann@suse.de>
X-Patchwork-Hint: comment
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

On Thu, Sep 19, 2024 at 08:53:43PM +0200, Thomas Zimmermann wrote:
> Several places in drm.ko use struct drm_rect and its helpers. This
> only works as the called interfaces are declared as static inline in
> the header file. Fix the issue by linking drm_rect.o into drm.ko.

Seems reasonable.
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

PS when grepping for drm_rect I noticed drm_atomic_plane_set_property()
is using it as the format of the fb_damage_clips blob. That
can't be right as drm_rect is an internal thing and should
not be used in the uapi.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 784229d4504d..fc061fd424ed 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -68,6 +68,7 @@ drm-y := \
>  	drm_prime.o \
>  	drm_print.o \
>  	drm_property.o \
> +	drm_rect.o \
>  	drm_syncobj.o \
>  	drm_sysfs.o \
>  	drm_trace_points.o \
> @@ -140,7 +141,6 @@ drm_kms_helper-y := \
>  	drm_modeset_helper.o \
>  	drm_plane_helper.o \
>  	drm_probe_helper.o \
> -	drm_rect.o \
>  	drm_self_refresh_helper.o \
>  	drm_simple_kms_helper.o
>  drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
> -- 
> 2.46.0

-- 
Ville Syrjälä
Intel
