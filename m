Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B64402C51E6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 11:18:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCACC6E86E;
	Thu, 26 Nov 2020 10:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D606E86E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 10:18:15 +0000 (UTC)
Received: from [2a0a:edc0:0:900:6245:cbff:fea0:1793]
 (helo=kresse.office.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kiELo-0004JU-QA; Thu, 26 Nov 2020 11:18:09 +0100
Message-ID: <27cd40e629113290db88f38900d2eb4367490f49.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>
Date: Thu, 26 Nov 2020 11:18:07 +0100
In-Reply-To: <20201120211306.325841-1-l.stach@pengutronix.de>
References: <20201120211306.325841-1-l.stach@pengutronix.de>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:6245:cbff:fea0:1793
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: Re: [PATCH] drm: mxsfb: fix fence synchronization
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fr, 2020-11-20 at 22:13 +0100, Lucas Stach wrote:
> The conversion away from the simple display pipeline helper missed
> to convert the prepare_fb plane callback, so no fences are attached to
> the atomic state, breaking synchronization with other devices. Fix
> this by plugging in the drm_gem_fb_prepare_fb helper function.

This is a regression in the 5.10 release series, so I would appreciate
if someone could review/ack this patch so I can smash it into
drm-misc-fixes.

Regards,
Lucas

> Fixes: ae1ed009328 (drm: mxsfb: Stop using DRM simple display pipeline helper)
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index b721b8b262ce..4d556532281a 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -22,6 +22,7 @@
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -485,11 +486,13 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
>  }
>  
>  static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
> +	.prepare_fb = drm_gem_fb_prepare_fb,
>  	.atomic_check = mxsfb_plane_atomic_check,
>  	.atomic_update = mxsfb_plane_primary_atomic_update,
>  };
>  
>  static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
> +	.prepare_fb = drm_gem_fb_prepare_fb,
>  	.atomic_check = mxsfb_plane_atomic_check,
>  	.atomic_update = mxsfb_plane_overlay_atomic_update,
>  };

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
