Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4E78BEE03
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 22:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05229112623;
	Tue,  7 May 2024 20:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eJn2f38I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AC6112623
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 20:21:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD5A4DFB;
 Tue,  7 May 2024 22:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715113298;
 bh=qnFkKVTP+o//0MobSjb1ptmrlHIH+f6uJ/IOr5bJrH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eJn2f38IciskKjGoUsWEFqR08CSxOqqeyhTCurgnYSb92k3fopsbbA+MhNdvgr2BA
 yU+GR05PEhk3eMlYiLThHwGD7DTc/F/bij2tVLGupzu+Kv6Wl+lc/tnteNSk57zEJy
 RgLYE5U+Ai8Emz6drdQafZ2rJmKJwT+/cLGThob8=
Date: Tue, 7 May 2024 23:21:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/drm-bridge.c: Drop conditionals around of_node
 pointers
Message-ID: <20240507202131.GD2012@pendragon.ideasonboard.com>
References: <20240507180001.1358816-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240507180001.1358816-1-sui.jingfeng@linux.dev>
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

On Wed, May 08, 2024 at 02:00:00AM +0800, Sui Jingfeng wrote:
> Having conditional around the of_node pointer of the drm_bridge structure
> is not necessary, since drm_bridge structure always has the of_node as its
> member.
> 
> Let's drop the conditional to get a better looks, please also note that
> this is following the already accepted commitments. see commit d8dfccde2709
> ("drm/bridge: Drop conditionals around of_node pointers") for reference.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

It looks like this was forgotten in commit d8dfccde2709 ("drm/bridge:
Drop conditionals around of_node pointers").

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 30d66bee0ec6..a6dbe1751e88 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -352,13 +352,8 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  	bridge->encoder = NULL;
>  	list_del(&bridge->chain_node);
>  
> -#ifdef CONFIG_OF
>  	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
>  		  bridge->of_node, encoder->name, ret);
> -#else
> -	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> -		  encoder->name, ret);
> -#endif
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart
