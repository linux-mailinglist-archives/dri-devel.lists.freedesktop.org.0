Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984B19E71F
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 20:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC566E0C4;
	Sat,  4 Apr 2020 18:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075796E0C4
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Apr 2020 18:40:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CEF052002D;
 Sat,  4 Apr 2020 20:40:02 +0200 (CEST)
Date: Sat, 4 Apr 2020 20:40:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: plane: Verify that no or all planes have a zpos
 property
Message-ID: <20200404184001.GA25264@ravnborg.org>
References: <20200404181253.25873-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200404181253.25873-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=jr4h7bY5dK5DwrReC6AA:9
 a=cYSKACxV25U9CEf6:21 a=POOf_qXYUQZoc5yJ:21 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Sat, Apr 04, 2020 at 09:12:53PM +0300, Laurent Pinchart wrote:
> The zpos property is used by userspace to sort the order of planes.
> While the property is not mandatory for drivers to implement, mixing
> planes with and without zpos confuses userspace, and shall not be
> allowed. Clarify this in the documentation and warn at runtime if the
> drivers mixes planes with and without zpos properties.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Looks good.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_blend.c | 10 ++++++----
>  drivers/gpu/drm/drm_plane.c |  9 +++++++++
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 88eedee018d3..f1dcad96f341 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -135,7 +135,9 @@
>   *	are underneath planes with higher Z position values. Two planes with the
>   *	same Z position value have undefined ordering. Note that the Z position
>   *	value can also be immutable, to inform userspace about the hard-coded
> - *	stacking of planes, see drm_plane_create_zpos_immutable_property().
> + *	stacking of planes, see drm_plane_create_zpos_immutable_property(). If
> + *	any plane has a zpos property (either mutable or immutable), then all
> + *	planes shall have a zpos property.
>   *
>   * pixel blend mode:
>   *	Pixel blend mode is set up with drm_plane_create_blend_mode_property().
> @@ -344,10 +346,10 @@ EXPORT_SYMBOL(drm_rotation_simplify);
>   * should be set to 0 and max to maximal number of planes for given crtc - 1.
>   *
>   * If zpos of some planes cannot be changed (like fixed background or
> - * cursor/topmost planes), driver should adjust min/max values and assign those
> - * planes immutable zpos property with lower or higher values (for more
> + * cursor/topmost planes), drivers shall adjust the min/max values and assign
> + * those planes immutable zpos properties with lower or higher values (for more
>   * information, see drm_plane_create_zpos_immutable_property() function). In such
> - * case driver should also assign proper initial zpos values for all planes in
> + * case drivers shall also assign proper initial zpos values for all planes in
>   * its plane_reset() callback, so the planes will be always sorted properly.
>   *
>   * See also drm_atomic_normalize_zpos().
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index d6ad60ab0d38..efb9c16ddc21 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -289,6 +289,8 @@ EXPORT_SYMBOL(drm_universal_plane_init);
>  
>  int drm_plane_register_all(struct drm_device *dev)
>  {
> +	unsigned int num_planes = 0;
> +	unsigned int num_zpos = 0;
>  	struct drm_plane *plane;
>  	int ret = 0;
>  
> @@ -297,8 +299,15 @@ int drm_plane_register_all(struct drm_device *dev)
>  			ret = plane->funcs->late_register(plane);
>  		if (ret)
>  			return ret;
> +
> +		if (plane->zpos_property)
> +			num_zpos++;
> +		num_planes++;
>  	}
>  
> +	drm_WARN(dev, num_planes != num_zpos,
> +		 "Mixing planes with and without zpos property is invalid\n");
> +
>  	return 0;
>  }
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
