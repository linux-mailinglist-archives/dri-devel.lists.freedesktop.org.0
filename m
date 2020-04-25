Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCA61B8679
	for <lists+dri-devel@lfdr.de>; Sat, 25 Apr 2020 14:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0547B6E266;
	Sat, 25 Apr 2020 12:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B8E6E1BA;
 Sat, 25 Apr 2020 12:24:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C997320028;
 Sat, 25 Apr 2020 14:24:14 +0200 (CEST)
Date: Sat, 25 Apr 2020 14:24:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 46/59] drm/arc: Align with simple pipe helpers
Message-ID: <20200425122413.GA11913@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-47-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-47-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=KmmBHjvb7uYrGmTg5WEA:9 a=CjuIK1q_8ugA:10
 a=Lf5xNeLK5dgiOs8hzIjU:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Wed, Apr 15, 2020 at 09:40:21AM +0200, Daniel Vetter wrote:
> Simple pipe helpers only have an enable and disable hook, no more
> mode_set_nofb. Call it from our enable hook to align with that
> conversions.
> 
> Atomic helpers always call mode_set_nofb and enable together, so
> there's no functional change here.
Hmmm....

mode_set_nofb() is only called from drm_atomic_helper - crtc_set_mode()
crtc_set_mode() is only called from drm_atomic_helper_commit_modeset_disables()
drm_atomic_helper_commit_modeset_disables() is called from drm_atomic_helper_commit_tail()

So it seems you are right.

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>


> ---
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> index 72719556debb..c7769edeefdf 100644
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -73,10 +73,9 @@ static enum drm_mode_status arc_pgu_crtc_mode_valid(struct drm_crtc *crtc,
>  	return MODE_NOCLOCK;
>  }
>  
> -static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +static void arc_pgu_mode_set(struct arcpgu_drm_private *arcpgu)
>  {
> -	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> -	struct drm_display_mode *m = &crtc->state->adjusted_mode;
> +	struct drm_display_mode *m = &arcpgu->pipe.crtc.state->adjusted_mode;
>  	u32 val;
>  
>  	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
> @@ -110,7 +109,7 @@ static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
>  	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
>  
> -	arc_pgu_set_pxl_fmt(crtc);
> +	arc_pgu_set_pxl_fmt(&arcpgu->pipe.crtc);
>  
>  	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
>  }
> @@ -120,6 +119,8 @@ static void arc_pgu_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>  	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
>  
> +	arc_pgu_mode_set(arcpgu);
> +
>  	clk_prepare_enable(arcpgu->clk);
>  	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
>  		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
> @@ -139,7 +140,6 @@ static void arc_pgu_crtc_atomic_disable(struct drm_crtc *crtc,
>  
>  static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
>  	.mode_valid	= arc_pgu_crtc_mode_valid,
> -	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
>  	.atomic_enable	= arc_pgu_crtc_atomic_enable,
>  	.atomic_disable	= arc_pgu_crtc_atomic_disable,
>  };
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
