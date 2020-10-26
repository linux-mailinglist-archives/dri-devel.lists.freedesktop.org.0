Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E84298745
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 08:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E756E1F9;
	Mon, 26 Oct 2020 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF036E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 07:13:53 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09Q7DnKE056180;
 Mon, 26 Oct 2020 02:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603696429;
 bh=J6bEWCZut8iA51alISLtCNAaSgdBxa3EoGP/WK6QrAM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=D03Z+u6vH+dZ8edzTHpPgKqCxB+pv399Wui9mMVBEDSS8e0qQdCmRo36CcLAvFx6u
 mHJ3ZwYHS67gGuym0Ij91SRmLYzwNfDQOXnCcaaW3f4Ks2H31seDeM8K/gGz6rrVu6
 2D2g1N3b/sg59oGJfU4B2+zJUjKP1huwhCalq2DQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09Q7Dncr019471
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Oct 2020 02:13:49 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 26
 Oct 2020 02:13:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 26 Oct 2020 02:13:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09Q7DlRQ043235;
 Mon, 26 Oct 2020 02:13:47 -0500
Subject: Re: [PATCH 13/65] drm/omapdrm: Annotate dma-fence critical section in
 commit path
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-13-daniel.vetter@ffwll.ch>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <c4b4e6d9-8b2a-ee8a-7708-011827d955a3@ti.com>
Date: Mon, 26 Oct 2020 09:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023122216.2373294-13-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/10/2020 15:21, Daniel Vetter wrote:
> Nothing special, just put the end right after hw_done(). Note that in
> one path there's a wait for the flip/update to complete. But as far as
> I understand from comments and code that's only relevant for modesets,
> and skipped if there wasn't a modeset done on a given crtc.
> 
> For a bit more clarity pull the hw_done() call out of the if/else,
> that way it's a bit clearer flow. But happy to shuffle this around as
> is seen fit.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 2e598b8b72af..2b82a708eca6 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -68,6 +68,7 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
>  {
>  	struct drm_device *dev = old_state->dev;
>  	struct omap_drm_private *priv = dev->dev_private;
> +	bool fence_cookie = dma_fence_begin_signalling();
>  
>  	priv->dispc_ops->runtime_get(priv->dispc);
>  
> @@ -90,8 +91,6 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
>  		omap_atomic_wait_for_completion(dev, old_state);
>  
>  		drm_atomic_helper_commit_planes(dev, old_state, 0);
> -
> -		drm_atomic_helper_commit_hw_done(old_state);
>  	} else {
>  		/*
>  		 * OMAP3 DSS seems to have issues with the work-around above,
> @@ -101,10 +100,12 @@ static void omap_atomic_commit_tail(struct drm_atomic_state *old_state)
>  		drm_atomic_helper_commit_planes(dev, old_state, 0);
>  
>  		drm_atomic_helper_commit_modeset_enables(dev, old_state);
> -
> -		drm_atomic_helper_commit_hw_done(old_state);
>  	}
>  
> +	drm_atomic_helper_commit_hw_done(old_state);
> +
> +	dma_fence_end_signalling(fence_cookie);
> +
>  	/*
>  	 * Wait for completion of the page flips to ensure that old buffers
>  	 * can't be touched by the hardware anymore before cleaning up planes.
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
