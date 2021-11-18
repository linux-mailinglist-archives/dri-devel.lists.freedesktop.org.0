Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A2D455B8B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 13:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469156E914;
	Thu, 18 Nov 2021 12:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBD66E914
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 12:32:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87E839DE;
 Thu, 18 Nov 2021 13:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637238734;
 bh=C5c1xudFIjTUJ99IZiB0OBRFX8l1G1wClAhMB8qfDSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FPhGCahWk00vQw8THYh9uluaEsTRM/YCV9JRRiWLBHRKpWHrr4F8J6HddjNDQ+Suc
 e7H/mJI0ndqW8nV1m5TTVGWfT3welBAxGvYNzAajMMPu67xn3y+Pfvxv6/mYFKl+si
 sb4Gfjsc9/antl0K34r+vnsjrFTABIwBFWD6ppDo=
Date: Thu, 18 Nov 2021 14:31:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Esaki Tomohito <etom@igel.co.jp>
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
Message-ID: <YZZHuNgGr0kZXzyl@pendragon.ideasonboard.com>
References: <20190509054518.10781-1-etom@igel.co.jp>
 <20190509071429.GA4773@pendragon.ideasonboard.com>
 <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
 <20190511181027.GC13043@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190511181027.GC13043@pendragon.ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Esaki-san,

(CC'ing dri-devel and Daniel Stone)

On Sat, May 11, 2019 at 09:10:27PM +0300, Laurent Pinchart wrote:
> On Thu, May 09, 2019 at 06:25:19PM +0900, Esaki Tomohito wrote:
> > Hi Laurent-san
> > 
> > > What's the purpose of this, as it adds no new functionality to the
> > > driver ? Why is this change needed ?
> > 
> > Weston compositor (v5.0.0 or later) uses the DRM API to get the
> > supported modifiers and determines if the sprite plane can be used by
> > comparing the modifiers with the client specified modifier.
> > In currently driver, since the weston doesn't know supported modifiers,
> > that cannot determine if the received dmabuf can be passed through to
> > sprite plane.
> > Since there are R-Car GPU which support linear modifier, the sprite
> > plane cannot be used in a compositor similar to the weston if client
> > specify linear modifier.
> 
> I don't think the right solution is to expose the linear modifier from
> all drivers that don't otherwise support modifiers. We should instead
> fix it either in Weston, and treat drivers that don't support the
> modifiers API as supporting the linear modifier only, or in the DRM/KMS
> core by reporting the linear modifier for drivers that don't explicitly
> support modifiers.

I've been pointed to
https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3350#note_1161827,
and we had a discussion on the #dri-devel IRC channel today on this
topic. It turns out I was wrong, not specifying modifiers in userspace
is different than specifying a linear modifier. This is true for some
legacy drivers only (e.g. radeon) that pre-date the modifiers API, and
which select a tiling format internally based on some heuristics.

I still don't like this patch though, as it would need to be replicated
in most drivers. It would be better if we could handle this in the DRM
core. Daniel kindly offered to summarize the IRC discussion in a reply
to this e-mail.

> > On 2019/05/09 16:14, Laurent Pinchart wrote:
> > > On Thu, May 09, 2019 at 02:45:18PM +0900, Tomohito Esaki wrote:
> > >> Add support for the linear modifier. Since the rcar-du device supports
> > >> only linear modifier, this driver doesn't support other modifiers.
> > > 
> > > What's the purpose of this, as it adds no new functionality to the
> > > driver ? Why is this change needed ?
> > > 
> > >> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> > >> ---
> > >>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 11 +++++++++++
> > >>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 15 ++++++++++++++-
> > >>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 15 ++++++++++++++-
> > >>  3 files changed, 39 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > >> index 3b7d50a8fb9b..9c5e15a5ab1c 100644
> > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > >> @@ -214,6 +214,16 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> > >>  		return ERR_PTR(-EINVAL);
> > >>  	}
> > >>  
> > >> +	/*
> > >> +	 * Support only LINEAR modifier.
> > >> +	 */
> > >> +	if ((mode_cmd->flags & DRM_MODE_FB_MODIFIERS) &&
> > >> +	    mode_cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR) {
> > >> +		dev_dbg(dev->dev, "unsupported fb modifier 0x%llx\n",
> > >> +			mode_cmd->modifier[0]);
> > >> +		return ERR_PTR(-EINVAL);
> > >> +	}
> > >> +
> > >>  	if (rcdu->info->gen < 3) {
> > >>  		/*
> > >>  		 * On Gen2 the DU limits the pitch to 4095 pixels and requires
> > >> @@ -529,6 +539,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
> > >>  	dev->mode_config.min_width = 0;
> > >>  	dev->mode_config.min_height = 0;
> > >>  	dev->mode_config.normalize_zpos = true;
> > >> +	dev->mode_config.allow_fb_modifiers = true;
> > >>  	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
> > >>  	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
> > >>  
> > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > >> index c6430027169f..32135ad387fa 100644
> > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> > >> @@ -726,6 +726,13 @@ static int rcar_du_plane_atomic_get_property(struct drm_plane *plane,
> > >>  	return 0;
> > >>  }
> > >>  
> > >> +static bool rcar_du_plane_format_mod_supported(struct drm_plane *plane,
> > >> +					       uint32_t format,
> > >> +					       uint64_t modifier)
> > >> +{
> > >> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> > >> +}
> > >> +
> > >>  static const struct drm_plane_funcs rcar_du_plane_funcs = {
> > >>  	.update_plane = drm_atomic_helper_update_plane,
> > >>  	.disable_plane = drm_atomic_helper_disable_plane,
> > >> @@ -735,6 +742,7 @@ static const struct drm_plane_funcs rcar_du_plane_funcs = {
> > >>  	.atomic_destroy_state = rcar_du_plane_atomic_destroy_state,
> > >>  	.atomic_set_property = rcar_du_plane_atomic_set_property,
> > >>  	.atomic_get_property = rcar_du_plane_atomic_get_property,
> > >> +	.format_mod_supported = rcar_du_plane_format_mod_supported,
> > >>  };
> > >>  
> > >>  static const uint32_t formats[] = {
> > >> @@ -750,6 +758,11 @@ static const uint32_t formats[] = {
> > >>  	DRM_FORMAT_NV16,
> > >>  };
> > >>  
> > >> +static const uint64_t modifiers[] = {
> > >> +	DRM_FORMAT_MOD_LINEAR,
> > >> +	DRM_FORMAT_MOD_INVALID,
> > >> +};
> > >> +
> > >>  int rcar_du_planes_init(struct rcar_du_group *rgrp)
> > >>  {
> > >>  	struct rcar_du_device *rcdu = rgrp->dev;
> > >> @@ -776,7 +789,7 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
> > >>  		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
> > >>  					       &rcar_du_plane_funcs, formats,
> > >>  					       ARRAY_SIZE(formats),
> > >> -					       NULL, type, NULL);
> > >> +					       modifiers, type, NULL);
> > >>  		if (ret < 0)
> > >>  			return ret;
> > >>  
> > >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > >> index 0878accbd134..9d1382b02717 100644
> > >> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > >> @@ -139,6 +139,11 @@ static const u32 formats_kms[] = {
> > >>  	DRM_FORMAT_YVU444,
> > >>  };
> > >>  
> > >> +static const uint64_t modifiers_kms[] = {
> > >> +	DRM_FORMAT_MOD_LINEAR,
> > >> +	DRM_FORMAT_MOD_INVALID,
> > >> +};
> > >> +
> > >>  static const u32 formats_v4l2[] = {
> > >>  	V4L2_PIX_FMT_RGB332,
> > >>  	V4L2_PIX_FMT_ARGB444,
> > >> @@ -344,6 +349,13 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
> > >>  	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
> > >>  }
> > >>  
> > >> +static bool rcar_du_vsp_plane_format_mod_supported(struct drm_plane *plane,
> > >> +						   uint32_t format,
> > >> +						   uint64_t modifier)
> > >> +{
> > >> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> > >> +}
> > >> +
> > >>  static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
> > >>  	.update_plane = drm_atomic_helper_update_plane,
> > >>  	.disable_plane = drm_atomic_helper_disable_plane,
> > >> @@ -351,6 +363,7 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
> > >>  	.destroy = drm_plane_cleanup,
> > >>  	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
> > >>  	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
> > >> +	.format_mod_supported = rcar_du_vsp_plane_format_mod_supported,
> > >>  };
> > >>  
> > >>  int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> > >> @@ -397,7 +410,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> > >>  					       &rcar_du_vsp_plane_funcs,
> > >>  					       formats_kms,
> > >>  					       ARRAY_SIZE(formats_kms),
> > >> -					       NULL, type, NULL);
> > >> +					       modifiers_kms, type, NULL);
> > >>  		if (ret < 0)
> > >>  			return ret;
> > >>  

-- 
Regards,

Laurent Pinchart
