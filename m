Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C893273BBF3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3381D10E662;
	Fri, 23 Jun 2023 15:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC4C10E662
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:46:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FC95838;
 Fri, 23 Jun 2023 17:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687535140;
 bh=d4FBXG63CJwNZipIqCkAvtDaYos1ujZp8A3xay9g6vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=opXjkoJ40p1X8d/acUN86mfm0zCE3oSZmx/aVhG6gjKYHx8XS5vzkNvJrm3oM36bh
 dhY+Nq3t4ZA2ayBfZYPlGz5p7uij7NxzGcEq0g6sszWUqp+tGaDFLMsR1DyJPPNZHy
 Hji3i2RkZIDJUza87dBqXxx1Vayx+ELs+bQybNtc=
Date: Fri, 23 Jun 2023 18:46:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 17/39] drm: renesas: shmobile: Use
 drmm_universal_plane_alloc()
Message-ID: <20230623154615.GU2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <9af0b0e18c6f3ce3348cc728f177bf466e30e66a.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9af0b0e18c6f3ce3348cc728f177bf466e30e66a.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:29AM +0200, Geert Uytterhoeven wrote:
> According to the comments for drm_universal_plane_init(), the plane
> structure should not be allocated with devm_kzalloc().
> 
> Fix lifetime issues by using drmm_universal_plane_alloc() instead.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Plane (and connector) structures are still allocated with devm_kzalloc()
> in several other drivers...
> ---
>  .../drm/renesas/shmobile/shmob_drm_plane.c    | 24 ++++++-------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 0b2ab153e9ae76df..1fb68b5fe915b8dc 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -176,16 +176,9 @@ static int shmob_drm_plane_disable(struct drm_plane *plane,
>  	return 0;
>  }
>  
> -static void shmob_drm_plane_destroy(struct drm_plane *plane)
> -{
> -	drm_plane_force_disable(plane);
> -	drm_plane_cleanup(plane);

drm_plane_cleanup() will still be called from
drmm_universal_plane_alloc_release(), but drm_plane_force_disable()
won't. Is this an issue ? This should be documented in the commit
message.

> -}
> -
>  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
>  	.update_plane = shmob_drm_plane_update,
>  	.disable_plane = shmob_drm_plane_disable,
> -	.destroy = shmob_drm_plane_destroy,
>  };
>  
>  static const uint32_t formats[] = {
> @@ -204,19 +197,16 @@ static const uint32_t formats[] = {
>  int shmob_drm_plane_create(struct shmob_drm_device *sdev, unsigned int index)
>  {
>  	struct shmob_drm_plane *splane;
> -	int ret;
>  
> -	splane = devm_kzalloc(sdev->dev, sizeof(*splane), GFP_KERNEL);
> -	if (splane == NULL)
> -		return -ENOMEM;
> +	splane = drmm_universal_plane_alloc(sdev->ddev, struct shmob_drm_plane,
> +					    plane, 1, &shmob_drm_plane_funcs,
> +					    formats, ARRAY_SIZE(formats), NULL,
> +					    DRM_PLANE_TYPE_OVERLAY, NULL);
> +	if (IS_ERR(splane))
> +		return PTR_ERR(splane);
>  
>  	splane->index = index;
>  	splane->alpha = 255;
>  
> -	ret = drm_universal_plane_init(sdev->ddev, &splane->plane, 1,
> -				       &shmob_drm_plane_funcs,
> -				       formats, ARRAY_SIZE(formats), NULL,
> -				       DRM_PLANE_TYPE_OVERLAY, NULL);
> -
> -	return ret;
> +	return 0;
>  }

-- 
Regards,

Laurent Pinchart
