Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EAE3C809A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91BF6E1BA;
	Wed, 14 Jul 2021 08:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44D06E1BC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:45:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AA383F1;
 Wed, 14 Jul 2021 10:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1626252356;
 bh=kA2Y4FJIJGeEeTU6vVmBG77N+dXcBs2sjaI5o/JAHDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S+2ubGoNIpLW7Tqls7ZKp7zx8L6fVH6bKC3NtP/CUIqn9Np+gv2BAisk0YqtEaOZc
 SurIaDmZs3qgkCYxggC0Gdgy8XH9IyWmrSuiLXrlIMt4sUbi80RYAfCQXtnvLfdFat
 SxGl+Maw4a/tcqyM4zGRdQKwA7GwtWj23mXVwmUc=
Date: Wed, 14 Jul 2021 11:45:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 1/1] drm: bridge: Mark mode_fixup deprecated
Message-ID: <YO6kQ2QwZ4iehrv+@pendragon.ideasonboard.com>
References: <20210713193257.958852-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210713193257.958852-1-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Tue, Jul 13, 2021 at 09:32:57PM +0200, Sam Ravnborg wrote:
> Make it obvious that mode_fixup is deprecated and new drivers shall use
> atomic_check.

Could you also mark drm_bridge_chain_mode_fixup() as deprecated ?

Regarding usage of .atomic_check(), while I agree that's the way to go,
we have more work to do. .mode_fixup() was created a long time ago, when
we were supposed to have a single bridge at the output of the CRTC. The
bridge could then instruct the CRTC to output a different mode than what
the display requires. Now that we have support for multiple bridges,
it's not as straightforward, and we've so far just pretended to ignore
the problem. The .mode_fixup() operation is used and abused, and just
telling people to use .atomic_check() will likely make things worse as
that operation has access to the full atomic commit and can alter the
mode of pretty much anything. We need to define clear semantics for
.atomic_check() in bridges.

> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/drm/drm_bridge.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 46bdfa48c413..668f14234459 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -136,6 +136,9 @@ struct drm_bridge_funcs {
>  	 *
>  	 * NOTE:
>  	 *
> +	 * This is deprecated, do not use!
> +	 * New drivers shall use &drm_bridge_funcs.atomic_check.
> +	 *
>  	 * This function is called in the check phase of atomic modesets, which
>  	 * can be aborted for any reason (including on userspace's request to
>  	 * just check whether a configuration would be possible). Drivers MUST

-- 
Regards,

Laurent Pinchart
