Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B771E916F
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 15:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40DE6E061;
	Sat, 30 May 2020 13:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93326E061
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 13:18:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D524E20023;
 Sat, 30 May 2020 15:18:16 +0200 (CEST)
Date: Sat, 30 May 2020 15:18:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/auth: make drm_{set,drop]master_ioctl
 symmetrical
Message-ID: <20200530131815.GA82487@ravnborg.org>
References: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
 <20200530124640.4176323-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530124640.4176323-2-emil.l.velikov@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=DfNHnWVPAAAA:8 a=pGLkceISAAAA:8
 a=i9wYiXSb3f5uVhTpkwcA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=rjTVMONInIDnV1a_A2c_:22
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
Cc: David Airlie <airlied@linux.ie>, Colin Ian King <colin.king@canonical.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.
On Sat, May 30, 2020 at 01:46:40PM +0100, Emil Velikov wrote:
> Currently the ret handling is all over the place - with two redundant
> assignments and another one addressed earlier.
> 
> Use the exact same flow in both functions.
> 
> v2: straighten the code flow, instead of just removing the assignments
Now even I should be able to follow the flow - thanks :-)

> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> Colin, pretty sure that this should address couple of Coverity warnings.
> Yet I didn't check their web UI thingy.
> ---
>  drivers/gpu/drm/drm_auth.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 4c723e3a689c..f2d46b7ac6f9 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -215,7 +215,7 @@ drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
>  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv)
>  {
> -	int ret = 0;
> +	int ret;
>  
>  	mutex_lock(&dev->master_mutex);
>  
> @@ -272,12 +272,15 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out_unlock;
>  
> -	ret = -EINVAL;
> -	if (!drm_is_current_master(file_priv))
> +	if (!drm_is_current_master(file_priv)) {
> +		ret = -EINVAL;
>  		goto out_unlock;
> +	}
>  
> -	if (!dev->master)
> +	if (!dev->master) {
> +		ret = -EINVAL;
>  		goto out_unlock;
> +	}
>  
>  	if (file_priv->master->lessor != NULL) {
>  		DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
> @@ -285,7 +288,6 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  		goto out_unlock;
>  	}
>  
> -	ret = 0;
>  	drm_drop_master(dev, file_priv);
>  out_unlock:
>  	mutex_unlock(&dev->master_mutex);
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
