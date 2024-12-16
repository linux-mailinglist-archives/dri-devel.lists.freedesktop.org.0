Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5312D9F368D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C402A10E707;
	Mon, 16 Dec 2024 16:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KZnBJp+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD8210E707
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:50:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 586B5FF808;
 Mon, 16 Dec 2024 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734367823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=te7DXBJEFmkw4wLK7+D8XCmSvwdHasl+YkrbIAWRIuM=;
 b=KZnBJp+4gUYWYsyot7di5lM7/foj5AZcdQF/ialAKIa60nENDPGhS2p/dJ7ZxafwwJ7Xrj
 nEzzg3c7t7AEnN/elTuMuoCLzl7c0V96l31xpw4K4mptcPxwIwGbkUc0tQRvr5KNhYjJmg
 IlvS6qLTPJwlvcMsZavLv9wyJLZexokbQrkwUgvQoPgA1cLvzaZl5HN5U4Je8jpoge2uyT
 tXQdceLLLbG3uQfkQ/hB1rBSShUNNQn7YH9+piATy8ybAmfVioOauL5iwJIasa5+sLEd0Z
 BESGLBP5h+SLANk6y69qQos4Ujhj8I9s+Kt5JPl3ME6DMVMlaHRdcCU0cFQ5Ow==
Date: Mon, 16 Dec 2024 17:50:21 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/4] drm/atomic-helper: improve CRTC
 enabled/connectors mismatch logging message
Message-ID: <Z2BaTT25YfQMzy9c@louis-chauvet-laptop>
Mail-Followup-To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241216-drm-small-improvements-v3-0-78bbc95ac776@bootlin.com>
 <20241216-drm-small-improvements-v3-2-78bbc95ac776@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-drm-small-improvements-v3-2-78bbc95ac776@bootlin.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

On 16/12/24 - 17:40, Luca Ceresoli wrote:
> This message reports a mismatch between new_crtc_state->enable and
> has_connectors, which should be either both true or both false. However it
> does not mention which one is true and which is false, which can be useful
> for debugging. Add the value of both avriables to the log message.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Louis	Chauvet	<louis.chauvet@bootlin.com>

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 43cdf39019a44537794cc5a519d139b0cb77073c..3c3bdef9bcf3c4ffcd861744f6607f317ab0c041 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -666,8 +666,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  		}
>  
>  		if (new_crtc_state->enable != has_connectors) {
> -			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch\n",
> -				       crtc->base.id, crtc->name);
> +			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch (%d/%d)\n",
> +				       crtc->base.id, crtc->name,
> +				       new_crtc_state->enable, has_connectors);
>  
>  			return -EINVAL;
>  		}
> 
> -- 
> 2.34.1
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
