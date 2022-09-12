Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B65B5F6D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 19:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34B910E10A;
	Mon, 12 Sep 2022 17:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A76DE10E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 17:36:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92267106F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:36:18 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F26C03F73D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 10:36:11 -0700 (PDT)
Date: Mon, 12 Sep 2022 18:36:01 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH RESEND drm-misc-next 4/7] drm/arm/hdlcd: plane: use drm
 managed resources
Message-ID: <Yx9uAe//u/Z9zfmM@e110455-lin.cambridge.arm.com>
References: <20220905152719.128539-1-dakr@redhat.com>
 <20220905152719.128539-5-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905152719.128539-5-dakr@redhat.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

I have applied your patch series for HDLCD on top of drm-next (commit 213cb76ddc8b)
and on start up I get a warning:

[   12.882554] hdlcd 7ff50000.hdlcd: drm_WARN_ON(funcs && funcs->destroy)
[   12.882596] WARNING: CPU: 1 PID: 211 at drivers/gpu/drm/drm_crtc.c:393 __drmm_crtc_init_with_planes+0x70/0xf0 [drm]

It looks like the .destroy hook is still required or I'm missing some other required
series where the WARN has been removed?

Best regards,
Liviu

On Mon, Sep 05, 2022 at 05:27:16PM +0200, Danilo Krummrich wrote:
> Use drm managed resource allocation (drmm_universal_plane_alloc()) in
> order to get rid of the explicit destroy hook in struct drm_plane_funcs.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/arm/hdlcd_crtc.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
> index c0a5ca7f578a..17d3ccf12245 100644
> --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> @@ -289,7 +289,6 @@ static const struct drm_plane_helper_funcs hdlcd_plane_helper_funcs = {
>  static const struct drm_plane_funcs hdlcd_plane_funcs = {
>  	.update_plane		= drm_atomic_helper_update_plane,
>  	.disable_plane		= drm_atomic_helper_disable_plane,
> -	.destroy		= drm_plane_cleanup,
>  	.reset			= drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> @@ -297,24 +296,19 @@ static const struct drm_plane_funcs hdlcd_plane_funcs = {
>  
>  static struct drm_plane *hdlcd_plane_init(struct drm_device *drm)
>  {
> -	struct hdlcd_drm_private *hdlcd = drm->dev_private;
> +	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
>  	struct drm_plane *plane = NULL;
>  	u32 formats[ARRAY_SIZE(supported_formats)], i;
> -	int ret;
> -
> -	plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
> -	if (!plane)
> -		return ERR_PTR(-ENOMEM);
>  
>  	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
>  		formats[i] = supported_formats[i].fourcc;
>  
> -	ret = drm_universal_plane_init(drm, plane, 0xff, &hdlcd_plane_funcs,
> -				       formats, ARRAY_SIZE(formats),
> -				       NULL,
> -				       DRM_PLANE_TYPE_PRIMARY, NULL);
> -	if (ret)
> -		return ERR_PTR(ret);
> +	plane = drmm_universal_plane_alloc(drm, struct drm_plane, dev, 0xff,
> +					   &hdlcd_plane_funcs,
> +					   formats, ARRAY_SIZE(formats),
> +					   NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (IS_ERR(plane))
> +		return plane;
>  
>  	drm_plane_helper_add(plane, &hdlcd_plane_helper_funcs);
>  	hdlcd->plane = plane;
> -- 
> 2.37.2
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
