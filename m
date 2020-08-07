Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152B23E708
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 07:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518876E051;
	Fri,  7 Aug 2020 05:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F656E051
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 05:27:03 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Thu, 6 Aug 2020 22:26:57 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id E3BEBB275D;
 Fri,  7 Aug 2020 01:27:00 -0400 (EDT)
Subject: Re: [PATCH] drm/vmwgfx/stdu: Use drm_mode_config_reset
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20200806154227.2255197-1-daniel.vetter@ffwll.ch>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <5e1ac626-db94-77f3-bf37-58ba5b45338c@vmware.com>
Date: Fri, 7 Aug 2020 07:27:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806154227.2255197-1-daniel.vetter@ffwll.ch>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-002.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@intel.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I was investigating this bug too and this seems correct to me.
I've tested it with a kernel which doesn't have the other crash issue,
and indeed it seems to work fine.

That said, this also needs to be fixed in the older paths (these will be
used by vms using older hw version lacking some capabilities),
vmwgfx_sou_[display_]init and vmwgfx_ldu_[display_]init, it'll crash
there just the same.
Exactly the same patch lines work there as well. Although for the ldu
path, while there was nothing unusual in the logs, I could not actually
get a display. Need to do some more testing, but it's probably an
unrelated older issue...

I'll send out a patch for these older paths, I'll apply this one to
vmwgfx-next branch, though until the other crash is fixed it won't help
all that much yet.

Roland



Am 06.08.20 um 17:42 schrieb Daniel Vetter:
> When converting to atomic the state reset was done by directly calling
> the functions, and before the modeset object was fully initialized.
> This means the various ->dev pointers weren't set up.
> 
> After
> 
> commit 51f644b40b4b794b28b982fdd5d0dd8ee63f9272
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Fri Jun 12 18:00:49 2020 +0200
> 
>     drm/atomic-helper: reset vblank on crtc reset
> 
> this started to oops because now we're trying to derefence
> drm_crtc->dev. Fix this up by entirely switching over to
> drm_mode_config_reset, called once everything is set up.
> 
> Fixes: 51f644b40b4b ("drm/atomic-helper: reset vblank on crtc reset")
> Reported-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index 16b385629688..cf3aafd00837 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -1738,8 +1738,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
>  	stdu->base.is_implicit = false;
>  
>  	/* Initialize primary plane */
> -	vmw_du_plane_reset(primary);
> -
>  	ret = drm_universal_plane_init(dev, primary,
>  				       0, &vmw_stdu_plane_funcs,
>  				       vmw_primary_plane_formats,
> @@ -1754,8 +1752,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
>  	drm_plane_enable_fb_damage_clips(primary);
>  
>  	/* Initialize cursor plane */
> -	vmw_du_plane_reset(cursor);
> -
>  	ret = drm_universal_plane_init(dev, cursor,
>  			0, &vmw_stdu_cursor_funcs,
>  			vmw_cursor_plane_formats,
> @@ -1769,8 +1765,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
>  
>  	drm_plane_helper_add(cursor, &vmw_stdu_cursor_plane_helper_funcs);
>  
> -	vmw_du_connector_reset(connector);
> -
>  	ret = drm_connector_init(dev, connector, &vmw_stdu_connector_funcs,
>  				 DRM_MODE_CONNECTOR_VIRTUAL);
>  	if (ret) {
> @@ -1798,7 +1792,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
>  		goto err_free_encoder;
>  	}
>  
> -	vmw_du_crtc_reset(crtc);
>  	ret = drm_crtc_init_with_planes(dev, crtc, &stdu->base.primary,
>  					&stdu->base.cursor,
>  					&vmw_stdu_crtc_funcs, NULL);
> @@ -1894,6 +1887,8 @@ int vmw_kms_stdu_init_display(struct vmw_private *dev_priv)
>  		}
>  	}
>  
> +	drm_mode_config_reset(dev);
> +
>  	DRM_INFO("Screen Target Display device initialized\n");
>  
>  	return 0;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
