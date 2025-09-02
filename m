Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD6B40DD8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 21:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4046C10E81E;
	Tue,  2 Sep 2025 19:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qx3Zx3/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8774810E81E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 19:26:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 31BCFC6D;
 Tue,  2 Sep 2025 21:24:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1756841097;
 bh=K5FHRQfG74/3uwGbvOqfy7sOkX4EOSJRWCw0QqjgE6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qx3Zx3/OJBChrh02xfFc8tk4nkT0jirENKy+hIYIvJgK+HwPNUf8dONhnxoH299Db
 fTY9Hrix/FRqg8a+Ym1WXxgwM1v7PiOGaPz9AeLBAWkuClv3FUEZ6jX+fOhnUZOfio
 SHZweFoA2blSFFYMkYBCIQqbIsb1kQKMEDEoEzgg=
Date: Tue, 2 Sep 2025 21:25:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/29] drm/atomic: Fix unused but set warning in
 for_each_old_plane_in_state
Message-ID: <20250902192544.GQ13448@pendragon.ideasonboard.com>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-2-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-drm-state-readout-v1-2-14ad5315da3f@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Thank you for the patch.

On Tue, Sep 02, 2025 at 10:32:30AM +0200, Maxime Ripard wrote:
> The for_each_old_plane_in_state() macro triggers a compiler warning if
> the plane parameter passed to it isn't used in the code block.
> 
> Add a similar workaround than in most other macros.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 38636a593c9d98cadda85ccd67326cb152f0dd27..689a29bdeb4a06672ab6fffecb513d58ff6e07f9 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -1053,11 +1053,13 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
>  	for ((__i) = 0;							\
>  	     (__i) < (__state)->dev->mode_config.num_total_plane;	\
>  	     (__i)++)							\
>  		for_each_if ((__state)->planes[__i].ptr &&		\
>  			     ((plane) = (__state)->planes[__i].ptr,	\
> +			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
>  			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
> +

While at it, shouldn't you apply the same workaround to the
old_plane_state variable, like done for new_plane_state in
for_each_new_plane_in_state() ? Or is it expected that drivers will
always make use of it.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  /**
>   * for_each_new_plane_in_state - iterate over all planes in an atomic update
>   * @__state: &struct drm_atomic_state pointer
>   * @plane: &struct drm_plane iteration cursor
>   * @new_plane_state: &struct drm_plane_state iteration cursor for the new state

-- 
Regards,

Laurent Pinchart
