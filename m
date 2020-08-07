Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB7623E8FA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 10:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C97B6E966;
	Fri,  7 Aug 2020 08:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A716E96C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 08:34:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z18so874824wrm.12
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NlQYNFl5h6vlCePSxiXUDu21O9Zx7wr5Pr/S+7JA+C4=;
 b=AwJhwGZg8pUL6uzEhmi9mF2faCR7+y0EkN+qZFc9vb9z34cdz8G7eL6FENTBpz9RRf
 MO/R5w3dYJeiomjOOsLz6UlgWC9zhqNg6gk/Wq/UiBShEciuIurFiCdlgJ0jo93YlkvR
 CnnPyCZz96ye2PIz5WZUCSheGkjW89CIT6I8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NlQYNFl5h6vlCePSxiXUDu21O9Zx7wr5Pr/S+7JA+C4=;
 b=ZnVuzMo1+dEQ9DtyEOqza2edj+4kpzQpZHwC+SfSyWjTH6/uoZeoxo6eQ0El53HDNa
 M+GtvgEcIzgKacmbRKa3fGeIqIUx0sfz0dMZcUdQrmhfdM+uCwj7c0+EyGT5agVqR1jn
 uhls1E1n1+JwJuRzDN5xJqvtRmhX55zOTUUWOgct9PDrbik57Ql7tBIdDhLpvPJ03Gpx
 i182pTEdvaLjQAeH5QpzcWpqd6ey8mBs388XUxEdoKgIHFB6eYSTgJno+25OZ6CYf4U1
 iobr4C0gRh+JKPMiob43YXTkJ3bGUDrOBWLKbD7ZF9NKLnhSQ7eK7TAznXMMXQOq8PmU
 a4Pw==
X-Gm-Message-State: AOAM530zHq1ysp7FfuC1+h5GJDA2B9uw8Szv1O9W6ccD8kWvDmHRhswe
 wdF83ZNH0h8Jt/9Re/XFyQzKKQ==
X-Google-Smtp-Source: ABdhPJymdYmgLOFO3pD28oBJ+w/EDv/OVYEFfLOi2XNe+78E0n9kawVoAMqzEhvzKCcUm4Xj8DQbXw==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr11918580wrr.390.1596789267130; 
 Fri, 07 Aug 2020 01:34:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm9891869wma.45.2020.08.07.01.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:34:26 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:34:24 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH 5/7] drm/amd/display: Reset plane for anything that's not
 a FAST update
Message-ID: <20200807083424.GM6419@phenom.ffwll.local>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 04:36:40PM -0400, Nicholas Kazlauskas wrote:
> [Why]
> MEDIUM or FULL updates can require global validation or affect
> bandwidth. By treating these all simply as surface updates we aren't
> actually passing this through DC global validation.
> 
> [How]
> There's currently no way to pass surface updates through DC global
> validation, nor do I think it's a good idea to change the interface
> to accept these.
> 
> DC global validation itself is currently stateless, and we can move
> our update type checking to be stateless as well by duplicating DC
> surface checks in DM based on DRM properties.
> 
> We wanted to rely on DC automatically determining this since DC knows
> best, but DM is ultimately what fills in everything into DC plane
> state so it does need to know as well.
> 
> There are basically only three paths that we exercise in DM today:
> 
> 1) Cursor (async update)
> 2) Pageflip (fast update)
> 3) Full pipe programming (medium/full updates)
> 
> Which means that anything that's more than a pageflip really needs to
> go down path #3.
> 
> So this change duplicates all the surface update checks based on DRM
> state instead inside of should_reset_plane().
> 
> Next step is dropping dm_determine_update_type_for_commit and we no
> longer require the old DC state at all for global validation.

I think we do something similar in i915, where we have a "nothing except
base address changed" fast path, but for anything else we fully compute a
new state. Obviously you should try to keep global state synchronization
to a minimum for this step, so it's not entirely only 2 options.

Once we have the states, we compare them and figure out whether we can get
away with a fast modeset operation (maybe what you guys call medium
update). Anyway I think being slightly more aggressive with computing full
state, and then falling back to more optimized update again is a good
approach. Only risk is if we you have too much synchronization in your
locking (e.g. modern compositors do like to change tiling and stuff,
especially once you have modifiers enabled, so this shouldn't cause a sync
across crtc except when absolutely needed).
-Daniel

> 
> Optimization can come later so we don't reset DC planes at all for
> MEDIUM udpates and avoid validation, but we might require some extra
> checks in DM to achieve this.
> 
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0d5f45742bb5..2cbb29199e61 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8336,6 +8336,31 @@ static bool should_reset_plane(struct drm_atomic_state *state,
>  		if (old_other_state->crtc != new_other_state->crtc)
>  			return true;
>  
> +		/* Src/dst size and scaling updates. */
> +		if (old_other_state->src_w != new_other_state->src_w ||
> +		    old_other_state->src_h != new_other_state->src_h ||
> +		    old_other_state->crtc_w != new_other_state->crtc_w ||
> +		    old_other_state->crtc_h != new_other_state->crtc_h)
> +			return true;
> +
> +		/* Rotation / mirroring updates. */
> +		if (old_other_state->rotation != new_other_state->rotation)
> +			return true;
> +
> +		/* Blending updates. */
> +		if (old_other_state->pixel_blend_mode !=
> +		    new_other_state->pixel_blend_mode)
> +			return true;
> +
> +		/* Alpha updates. */
> +		if (old_other_state->alpha != new_other_state->alpha)
> +			return true;
> +
> +		/* Colorspace changes. */
> +		if (old_other_state->color_range != new_other_state->color_range ||
> +		    old_other_state->color_encoding != new_other_state->color_encoding)
> +			return true;
> +
>  		/* Framebuffer checks fall at the end. */
>  		if (!old_other_state->fb || !new_other_state->fb)
>  			continue;
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
