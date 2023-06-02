Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C360771FFFF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 13:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989CB10E665;
	Fri,  2 Jun 2023 11:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8FC10E66B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 11:06:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp
 [126.156.168.104])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 163206E0;
 Fri,  2 Jun 2023 13:05:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685703958;
 bh=H0LfW0kt48rXXIsADqS7s4ieQRL9M5rRvbwHyylFCDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MSc7QFvzSUD390rJN/7Lpo6HN6lMixboT3h+VA4W1fr3wM1fZmlPN4W9Wc1hIGUxj
 yb7lgSEZ8OnBGjhiRUrTbwqWbiuwJfhEIVHeAo7V0XTfinpVPuVSaslFA67SRCAJ2o
 idax+IsxVl7nzOVOnFMRMc4vzDrNVxT6gZ8/IDwA=
Date: Fri, 2 Jun 2023 14:06:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 3/3] drm: Fix references to drm_plane_helper_check_state()
Message-ID: <20230602110618.GD26944@pendragon.ideasonboard.com>
References: <cover.1685696114.git.geert+renesas@glider.be>
 <2408d7841c91e98e9a2b24b1b4df9b2b865519a6.1685696114.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2408d7841c91e98e9a2b24b1b4df9b2b865519a6.1685696114.git.geert+renesas@glider.be>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jyri.sarha@iki.fi>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Jun 02, 2023 at 11:11:36AM +0200, Geert Uytterhoeven wrote:
> As of commit a01cb8ba3f628293 ("drm: Move drm_plane_helper_check_state()
> into drm_atomic_helper.c"), drm_plane_helper_check_state() no longer
> exists, but is part of drm_atomic_helper_check_plane_state().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Interestingly, all these comments appeared only after the commit that
> removed the function...
> 
> This is against next-20230602, which does not have the
> drivers/gpu/drm/{ => renesas}/rcar-du move yet.
> 
> Biju: you're adding a new copy in
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 3 ++-
>  drivers/gpu/drm/tidss/tidss_plane.c     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index d759e019218181ce..e445fac8e0b46c21 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -600,7 +600,8 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
>  	if (!state->crtc) {
>  		/*
>  		 * The visible field is not reset by the DRM core but only
> -		 * updated by drm_plane_helper_check_state(), set it manually.
> +		 * updated by drm_atomic_helper_check_plane_state(), set it
> +		 * manually.
>  		 */
>  		state->visible = false;
>  		*format = NULL;
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 6bdd6e4a955ab3cc..e1c0ef0c3894c855 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -38,7 +38,8 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
>  	if (!new_plane_state->crtc) {
>  		/*
>  		 * The visible field is not reset by the DRM core but only
> -		 * updated by drm_plane_helper_check_state(), set it manually.
> +		 * updated by drm_atomic_helper_check_plane_state(), set it
> +		 * manually.
>  		 */
>  		new_plane_state->visible = false;
>  		return 0;

-- 
Regards,

Laurent Pinchart
