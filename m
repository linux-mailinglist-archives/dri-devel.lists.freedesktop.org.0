Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2DD1E8F2D
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 09:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFAA6E9BB;
	Sat, 30 May 2020 07:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581DB6E9BB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 07:48:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 8D09620021;
 Sat, 30 May 2020 09:48:31 +0200 (CEST)
Date: Sat, 30 May 2020 09:48:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 2/2] drm/auth: drop unnessesary variable assignments
Message-ID: <20200530074830.GB70485@ravnborg.org>
References: <20200529214807.3801851-1-emil.l.velikov@gmail.com>
 <20200529214807.3801851-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529214807.3801851-2-emil.l.velikov@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=4rXtc6OWBYw2JhXKSXYA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

On Fri, May 29, 2020 at 10:48:07PM +0100, Emil Velikov wrote:
> The variables are already the exact same value or will be overwritten
> shortly afterwords. In either case there's no functional difference.
s/afterwords/afterwards/

> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  drivers/gpu/drm/drm_auth.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index db701a9e9393..5ae5623f2482 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -215,7 +215,7 @@ drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
>  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_priv)
>  {
> -	int ret = 0;
> +	int ret;

This was the redundant asignment I mentioned in first mail - good.
>  
>  	mutex_lock(&dev->master_mutex);
>  
> @@ -282,7 +282,6 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  
>  	if (file_priv->master->lessor != NULL) {
>  		DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
> -		ret = -EINVAL;
This is wrong. ret is 0 when this code is reached, so we loose the error
value if this code-path is triggered.
Or I miss something??

	Sam
>  		goto out_unlock;
>  	}
>  
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
