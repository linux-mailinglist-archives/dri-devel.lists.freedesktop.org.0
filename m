Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E25007A8AFE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 19:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84E110E532;
	Wed, 20 Sep 2023 17:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483C10E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 17:56:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 77C2E86BEB;
 Wed, 20 Sep 2023 19:56:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1695232599;
 bh=Bjr3o8UTERBvtPZ2mOiCNnFlwFXjn5RbZJsdVQ3LxK8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MrtkGmciiTV1THQlnfU6BzaIdReBlkE49rz+tGGDbYL23CV26CXaAqoT1LTZuMbjz
 32+/4XCpAoI77EoCsOGCu8noZcsHS0enNhUZ8w7krI5zeGSg/1uYxF6YmVGo3rCIa/
 BqyTap36qTCsU/O91AQEtQS1mWXnSshNEINWgCYKQl5k4E8M6u3q6aDUZD1O8dbzdn
 yhj4hdjuaq8rsNSn4Qu8QRiyUG0wMDZqpPUdPk0nXHWg3UI9QC8WVcR5kjsfrAdbFS
 Mh3xgVgPmJMFpolIwraeMTOCqOA9BYnKaOqRHptq7u98ZpBubcZMQKiJQarvZVwfG6
 g/X5XWdqEIMcg==
Message-ID: <c0871d55-807d-93b3-1c9a-acbf4270bc7c@denx.de>
Date: Wed, 20 Sep 2023 19:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/5] drm: lcdif: force modeset when FB format changes
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-6-l.stach@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230920103126.2759601-6-l.stach@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/20/23 12:31, Lucas Stach wrote:
> Force a modeset if the new FB has a different format than the
> currently active one. While it might be possible to change between
> compatible formats without a full modeset as the format control is
> also supposed to be double buffered, the colorspace conversion is
> not, so when the CSC changes we need a modeset.
> 
> For now just always force a modeset when the FB format changes to
> properly reconfigure all parts of the device for the new format.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/mxsfb/lcdif_drv.c | 18 +++++++++++++++++-
>   drivers/gpu/drm/mxsfb/lcdif_kms.c | 26 ++++++++++++++++++++------
>   2 files changed, 37 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 18de2f17e249..b74f0cf1e240 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -30,9 +30,25 @@
>   #include "lcdif_drv.h"
>   #include "lcdif_regs.h"
>   
> +static int lcdif_atomic_check(struct drm_device *dev,
> +				struct drm_atomic_state *state)
> +{
> +	int ret;
> +
> +	ret = drm_atomic_helper_check(dev, state);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Check modeset again in case crtc_state->mode_changed is
> +	 * updated in plane's ->atomic_check callback.
> +	 */
> +	return drm_atomic_helper_check_modeset(dev, state);
> +}
> +
>   static const struct drm_mode_config_funcs lcdif_mode_config_funcs = {
>   	.fb_create		= drm_gem_fb_create,
> -	.atomic_check		= drm_atomic_helper_check,
> +	.atomic_check		= lcdif_atomic_check,
>   	.atomic_commit		= drm_atomic_helper_commit,
>   };
>   
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> index 3ebf55d06027..8167604bd3f8 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -647,18 +647,32 @@ static const struct drm_crtc_funcs lcdif_crtc_funcs = {
>   static int lcdif_plane_atomic_check(struct drm_plane *plane,
>   				    struct drm_atomic_state *state)
>   {
> -	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state,
> -									     plane);
> +	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
> +									   plane);
> +	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
> +									   plane);
>   	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(plane->dev);
>   	struct drm_crtc_state *crtc_state;
> +	int ret;
> +
> +	/* always okay to disable the plane */
> +	if (!new_state->fb)
> +		return 0;
>   
>   	crtc_state = drm_atomic_get_new_crtc_state(state,
>   						   &lcdif->crtc);
>   
> -	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> -						   DRM_PLANE_NO_SCALING,
> -						   DRM_PLANE_NO_SCALING,
> -						   false, true);
> +	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, true);
> +	if (ret)
> +		return ret;
> +
> +	if (old_state->fb && new_state->fb->format != old_state->fb->format)
> +		crtc_state->mode_changed = true;
> +
> +	return 0;
>   }
>   
>   static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,

Reviewed-by: Marek Vasut <marex@denx.de>
