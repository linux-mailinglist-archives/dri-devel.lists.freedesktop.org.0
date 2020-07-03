Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96A21344A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 08:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870366E150;
	Fri,  3 Jul 2020 06:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB5E6E150
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 06:38:53 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AC0C22002A;
 Fri,  3 Jul 2020 08:38:49 +0200 (CEST)
Date: Fri, 3 Jul 2020 08:38:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 12/14] drm/ast: Replace struct ast_crtc with struct
 drm_crtc
Message-ID: <20200703063848.GA1690637@ravnborg.org>
References: <20200702115029.5281-1-tzimmermann@suse.de>
 <20200702115029.5281-13-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702115029.5281-13-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=u3Cx1-CsSemIOwhcsMUA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

Just browsing code..

On Thu, Jul 02, 2020 at 01:50:27PM +0200, Thomas Zimmermann wrote:
> Struct ast_crtc has been cleaned up and it's now a wrapper around the
> DRM CRTC structure struct drm_crtc. This patch converts the driver to
> struct drm_crtc and removes struct ast_crtc.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Why is it we cannot embed struct drm_crtc?
And I also failed to see where is is de-allocated - but surely I miss
something obvious here.

	Sam

> ---
>  drivers/gpu/drm/ast/ast_drv.h  |  5 -----
>  drivers/gpu/drm/ast/ast_mode.c | 11 ++++++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index ea4de3dce2c4..77226e2fd7c0 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -238,11 +238,6 @@ struct ast_connector {
>  	struct ast_i2c_chan *i2c;
>  };
>  
> -struct ast_crtc {
> -	struct drm_crtc base;
> -};
> -
> -#define to_ast_crtc(x) container_of(x, struct ast_crtc, base)
>  #define to_ast_connector(x) container_of(x, struct ast_connector, base)
>  
>  struct ast_vbios_stdtable {
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 89d9ee0a9e81..43c9686ba0f7 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -881,21 +881,22 @@ static const struct drm_crtc_funcs ast_crtc_funcs = {
>  static int ast_crtc_init(struct drm_device *dev)
>  {
>  	struct ast_private *ast = to_ast_private(dev);
> -	struct ast_crtc *crtc;
> +	struct drm_crtc *crtc;
>  	int ret;
>  
> -	crtc = kzalloc(sizeof(struct ast_crtc), GFP_KERNEL);
> +	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
>  	if (!crtc)
>  		return -ENOMEM;
>  
> -	ret = drm_crtc_init_with_planes(dev, &crtc->base, &ast->primary_plane,
> +	ret = drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane,
>  					&ast->cursor_plane, &ast_crtc_funcs,
>  					NULL);
>  	if (ret)
>  		goto err_kfree;
>  
> -	drm_mode_crtc_set_gamma_size(&crtc->base, 256);
> -	drm_crtc_helper_add(&crtc->base, &ast_crtc_helper_funcs);
> +	drm_mode_crtc_set_gamma_size(crtc, 256);
> +	drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
> +
>  	return 0;
>  
>  err_kfree:
> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
