Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E217169AE3E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 15:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5819C10F010;
	Fri, 17 Feb 2023 14:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5086E10F010
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 14:42:35 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 896A92D8;
 Fri, 17 Feb 2023 15:42:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1676644954;
 bh=V2bGPL+iRIFYgsDKzzjaFb76asyVtKj8MW+gh6JL1L0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jdBs7DOkJwg4ZVJwy47ZWV8UI6VulHj8pVvEkJkE4C67B2JIx7RhLxMBUKlhlVEfq
 5Ke/znp9/h7uavwJWZq0huRmS02qnHT0VFmMSox2P4n5QfuwRNfpfKXetW7FsobopG
 eRA3RFVXBfCZZ9WkOjdXEjl4RLhY+W3oJKfxibF8=
Message-ID: <548d8a1b-4820-4825-7700-94c583530056@ideasonboard.com>
Date: Fri, 17 Feb 2023 16:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/6] drm/tidss: Implement struct
 drm_plane_helper_funcs.atomic_enable
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-7-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230209154107.30680-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2023 17:41, Thomas Zimmermann wrote:
> Enable the primary plane for tidss hardware via atomic_enable.
> Atomic helpers invoke this callback only when the plane becomes
> active.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tidss/tidss_plane.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index 0b12405edb47..6bdd6e4a955a 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -124,6 +124,16 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
>   	hw_videoport = to_tidss_crtc(new_state->crtc)->hw_videoport;
>   
>   	dispc_plane_setup(tidss->dispc, tplane->hw_plane_id, new_state, hw_videoport);
> +}
> +
> +static void tidss_plane_atomic_enable(struct drm_plane *plane,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_device *ddev = plane->dev;
> +	struct tidss_device *tidss = to_tidss(ddev);
> +	struct tidss_plane *tplane = to_tidss_plane(plane);
> +
> +	dev_dbg(ddev->dev, "%s\n", __func__);
>   
>   	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, true);
>   }
> @@ -151,6 +161,7 @@ static void drm_plane_destroy(struct drm_plane *plane)
>   static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
>   	.atomic_check = tidss_plane_atomic_check,
>   	.atomic_update = tidss_plane_atomic_update,
> +	.atomic_enable = tidss_plane_atomic_enable,
>   	.atomic_disable = tidss_plane_atomic_disable,
>   };
>   

I haven't tested this, but looks fine to me.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

One thought, though, is that we still do dispc_plane_enable(false) in 
tidss_plane_atomic_update() when the plane is not visible. Not a 
problem, but it would be nice to only enable/disable the plane inside 
atomic_enable/disable.

Or maybe in cases like this the driver should only use atomic_update, 
and do all the enabling and disabling there...

  Tomi

