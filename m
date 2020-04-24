Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7FE1B7D33
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 19:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332F36EAF3;
	Fri, 24 Apr 2020 17:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9C46EAF1;
 Fri, 24 Apr 2020 17:45:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AA9ED803E8;
 Fri, 24 Apr 2020 19:45:23 +0200 (CEST)
Date: Fri, 24 Apr 2020 19:45:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 48/59] drm/arc: Drop fb/crtc check in arc_pgu_update
Message-ID: <20200424174522.GE7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-49-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-49-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=e5mUnYsNAAAA:8
 a=ouqfoXld7TVcS4CPGaMA:9 a=CjuIK1q_8ugA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
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

On Wed, Apr 15, 2020 at 09:40:23AM +0200, Daniel Vetter wrote:
> First it's redundant, fb and crtc are only ever both set or not set.


> 2nd, the atomic_check code in simple display pipe helpers guarantees
> that this never happens.
I looked at drm_simple_kms_plane_atomic_check() - which I assume you
refer to. And I see no code that will guarantee both.

What have I missed?

	Sam


So nice bugfix for arcpgu driver here, since
> it was lacking a call to drm_atomic_helper_check_plane_state().
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> index 5c6d7e34ca73..4655f03e37f1 100644
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -143,9 +143,6 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
>  	struct arcpgu_drm_private *arcpgu;
>  	struct drm_gem_cma_object *gem;
>  
> -	if (!pipe->plane.state->crtc || !pipe->plane.state->fb)
> -		return;
> -
>  	arcpgu = pipe_to_arcpgu_priv(pipe);
>  	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
>  	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
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
