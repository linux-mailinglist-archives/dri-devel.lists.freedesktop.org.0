Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9846C1D11
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 18:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A4910E053;
	Mon, 20 Mar 2023 17:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADA410E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 17:01:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E08E9CE136D;
 Mon, 20 Mar 2023 17:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E55CC4339B;
 Mon, 20 Mar 2023 17:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679331660;
 bh=KmJ/oFXmAm37DV4SuZPLCkjjERN6TSNmtSmlsR7nsUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fIUXguaAn3Smfj+ncepg6XqMZ00K09/+L1F6OcxR73uhTMI4IwNFis7TBBuORpYZ7
 zXkRaVy1XqjoZ2j4yf2QZ8C+zia52EPL9mXanmwlwyhVvaVBv5iq4FJ1UMF7JWOn7I
 HvB2AHcz8Ux8ZvSgJdJ+BC8a4f6s7qJS9HVmxSCiJ9Ev3hITezvV9J0ibXm8AAzq+k
 uBuEdW+VDGOPSYJp4N50nky2T/yMqMJOuGv+zrNkH3QDuXm0IWqgZvCzyyiPh+bQBd
 pWtuiGGmeT5MnBB/4JWqNODCaxI+tAtphC6nYubeDZ4GrhRIKD9vs4m6aq8LMoMuvB
 /3Qw8n5fFFmLQ==
Date: Mon, 20 Mar 2023 10:00:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tom Rix <trix@redhat.com>
Subject: Re: [PATCH] drm/rockchip: vop2: fix uninitialized variable
 possible_crtcs
Message-ID: <20230320170057.GA592480@dev-arch.thelio-3990X>
References: <20230316132302.531724-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316132302.531724-1-trix@redhat.com>
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
Cc: s.hauer@pengutronix.de, llvm@lists.linux.dev, ndesaulniers@google.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 michael.riesch@wolfvision.net, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 09:23:02AM -0400, Tom Rix wrote:
> clang reportes this error
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error:
>   variable 'possible_crtcs' is used uninitialized whenever 'if'
>   condition is false [-Werror,-Wsometimes-uninitialized]
>                         if (vp) {
>                             ^~
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2336:36: note:
>   uninitialized use occurs here
>                 ret = vop2_plane_init(vop2, win, possible_crtcs);
>                                                  ^~~~~~~~~~~~~~
> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:4:
>   note: remove the 'if' if its condition is always true
>                         if (vp) {
>                         ^~~~~~~~
> 
> The else-statement changes the win->type to OVERLAY without setting the
> possible_crtcs variable.  Rework the block, initialize possible_crtcs to
> 0 to remove the else-statement.  Split the else-if-statement out to its
> own if-statement so the OVERLAY check will catch when the win-type has
> been changed.
> 
> Fixes: 368419a2d429 ("drm/rockchip: vop2: initialize possible_crtcs properly")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 03ca32cd2050..fce992c3506f 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -2301,7 +2301,7 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>  	nvp = 0;
>  	for (i = 0; i < vop2->registered_num_wins; i++) {
>  		struct vop2_win *win = &vop2->win[i];
> -		u32 possible_crtcs;
> +		u32 possible_crtcs = 0;
>  
>  		if (vop2->data->soc_id == 3566) {
>  			/*
> @@ -2327,12 +2327,11 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>  				/* change the unused primary window to overlay window */
>  				win->type = DRM_PLANE_TYPE_OVERLAY;
>  			}
> -		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
> -			possible_crtcs = (1 << nvps) - 1;
> -		} else {
> -			possible_crtcs = 0;
>  		}
>  
> +		if (win->type == DRM_PLANE_TYPE_OVERLAY)
> +			possible_crtcs = (1 << nvps) - 1;
> +
>  		ret = vop2_plane_init(vop2, win, possible_crtcs);
>  		if (ret) {
>  			drm_err(vop2->drm, "failed to init plane %s: %d\n",
> -- 
> 2.27.0
> 
