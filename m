Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4343B0D89
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 21:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D366E875;
	Tue, 22 Jun 2021 19:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1776E6E877
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 19:15:56 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4df655c1-d38e-11eb-a36f-0050568cd888;
 Tue, 22 Jun 2021 19:16:11 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 9236E194B05;
 Tue, 22 Jun 2021 21:16:00 +0200 (CEST)
Date: Tue, 22 Jun 2021 21:15:53 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 12/15] drm/simple-helper:
 drm_gem_simple_display_pipe_prepare_fb as default
Message-ID: <YNI26R5tdoTcEBaR@ravnborg.org>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-13-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622165511.3169559-13-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Jun 22, 2021 at 06:55:08PM +0200, Daniel Vetter wrote:
> It's tedious to review this all the time, and my audit showed that
> arcpgu actually forgot to set this.
> 
> Make this the default and stop worrying.
> 
> Again I sprinkled WARN_ON_ONCE on top to make sure we don't have
> strange combinations of hooks: cleanup_fb without prepare_fb doesn't
> make sense, and since simpler drivers are all new they better be GEM
> based drivers.
> 
> v2: Warn and bail when it's _not_ a GEM driver (Noralf)
> 
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 12 ++++++++++--
>  include/drm/drm_simple_kms_helper.h     |  7 +++++--
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 0b095a313c44..735f4f34bcc4 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -9,6 +9,8 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
> @@ -225,8 +227,14 @@ static int drm_simple_kms_plane_prepare_fb(struct drm_plane *plane,
>  	struct drm_simple_display_pipe *pipe;
>  
>  	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
> -	if (!pipe->funcs || !pipe->funcs->prepare_fb)
> -		return 0;
> +	if (!pipe->funcs || !pipe->funcs->prepare_fb) {
> +		if (WARN_ON_ONCE(!drm_core_check_feature(plane->dev, DRIVER_GEM)))
> +			return 0;
> +
> +		WARN_ON_ONCE(pipe->funcs && pipe->funcs->cleanup_fb);
> +
> +		return drm_gem_simple_display_pipe_prepare_fb(pipe, state);
> +	}
>  
>  	return pipe->funcs->prepare_fb(pipe, state);
>  }
> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
> index ef9944e9c5fc..363a9a8c3587 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -116,8 +116,11 @@ struct drm_simple_display_pipe_funcs {
>  	 * the documentation for the &drm_plane_helper_funcs.prepare_fb hook for
>  	 * more details.
>  	 *
> -	 * Drivers which always have their buffers pinned should use
> -	 * drm_gem_simple_display_pipe_prepare_fb() for this hook.
> +	 * For GEM drivers who neither have a @prepare_fb not @cleanup_fb hook
> +	 * set drm_gem_simple_display_pipe_prepare_fb() is called automatically
> +	 * to implement this.
Same comments like before.

	Sam

         * Other drivers which need additional plane
> +	 * processing can call drm_gem_simple_display_pipe_prepare_fb() from
> +	 * their @prepare_fb hook.
>  	 */
>  	int (*prepare_fb)(struct drm_simple_display_pipe *pipe,
>  			  struct drm_plane_state *plane_state);
> -- 
> 2.32.0.rc2
