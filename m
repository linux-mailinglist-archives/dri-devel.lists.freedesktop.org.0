Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF2554BC8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 15:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 160D810F063;
	Wed, 22 Jun 2022 13:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFB310F063
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655905859; x=1687441859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3CohyWmUtUrTBDe+BBE5Y7WDYYBZ1KvVKXJdpbgQSK4=;
 b=i2i8Cezhhe/6XbpYZj7A0k6rwhGzfW3AMLygx2UxlfGG6kkG4pOpmo+F
 3uxqB0YO4PGKNLHHmE/5I2R70gkGJzhJjCZ1FSVlWK2ygLjuP7gYZnxQ4
 KUZ1MTV60iuwxaUuaojTqfnG76ghzfIWeq/zLLyK94t5oDdmGImh8/cpG
 kbIYmEQPF6JePAZa5EMZN7ubfe23GOp6wRuZfngCepWY00T2KVsEh0LuB
 6q2kK2+bz+xzwwawxZbe2hwlVzC2AIljg3A8KGzQ/0uVSl9Hyk+wOHf9Q
 lyUjtSXHBib/uxJClNy3zxe1JVXnsBD5NTAVqQ3wGFsA/ueid7WevdPti A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281149229"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281149229"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 06:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="730356568"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 22 Jun 2022 06:50:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 22 Jun 2022 16:50:50 +0300
Date: Wed, 22 Jun 2022 16:50:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/hyperv-drm: Include framebuffer and EDID headers
Message-ID: <YrMeOiMIg89Pwr7R@intel.com>
References: <20220622083413.12573-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220622083413.12573-1-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, airlied@linux.ie, drawat.floss@gmail.com,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 10:34:13AM +0200, Thomas Zimmermann wrote:
> Fix a number of compile errors by including the correct header
> files. Examples are shown below.
> 
>   ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_blit_to_vram_rect':
>   ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of undefined type 'struct drm_framebuffer'
>    25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
>       |                                                ^~
> 
>   ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_connector_get_modes':
>   ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:59:17: error: implicit declaration of function 'drm_add_modes_noedid' [-Werror=implicit-function-declaration]
>    59 |         count = drm_add_modes_noedid(connector,
>       |                 ^~~~~~~~~~~~~~~~~~~~
> 
>   ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:62:9: error: implicit declaration of function 'drm_set_preferred_mode'; did you mean 'drm_mm_reserve_node'? [-Werror=implicit-function-declaration]
>    62 |         drm_set_preferred_mode(connector, hv->preferred_width,
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")

Presumably should be
Fixes: 720cf96d8fec ("drm: Drop drm_framebuffer.h from drm_crtc.h")
Fixes: 255490f9150d ("drm: Drop drm_edid.h from drm_crtc.h")

Mea culpa

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> Cc: Deepak Rawat <drawat.floss@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: linux-hyperv@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.14+
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index 27f4fcb058f9..b8e64dd8d3a6 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -7,9 +7,11 @@
>  
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_edid.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_gem_shmem_helper.h>
> -- 
> 2.36.1

-- 
Ville Syrjälä
Intel
