Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D988162F7E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 20:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7158189F0A;
	Tue, 18 Feb 2020 19:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A227289F0A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 19:12:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so25304662wrd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 11:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jyp8LuSwA2auMcPCoIUKAuOfKUtLNBBbLjy1dsWtP7E=;
 b=dvVr1s0bycacg+In0wqQrojmPadziJAieySvCzTBv8iEY3pya7QSEzaG8fmXsMyZ1F
 3IhF7xoYN0ngRC94yTjPapg5nEKCwIpwmNUFUUPOUGETufFc+1rLMVyreHwB1g9YmOLc
 vgUkXYX5qVv/kiNBz82f2Qh7LzoPzZg6tZN9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Jyp8LuSwA2auMcPCoIUKAuOfKUtLNBBbLjy1dsWtP7E=;
 b=M91ingjbAom/jIaNyId5oljKKMpvTPirWO7RbmxDMphlfMWQEhp0YNpVVCrrtIEQoV
 HuF60k6E3FIxi5yPPz9vq10s7A17uZKdkzHwIZhZz0EGoYeMaeb7EHK9nyzhNw9ubVSR
 CORiO19o186fDJt/CwLlFuMoyv+e1Rl9dRwuCVBhQeWtY0gxpaJYF1MpX93VKbdhWWli
 60tVz2kno7F+wC8+XuGHuPQmU7ubQkqwqfA57BOwJYiepLFZtHbXjm4XmezkRnbcBfOY
 02F9ZPV0kfa8A08+xHDsenDkxM58DJvOeU92XD6Qs23cFgjSjZ96KaxHc0QQ3neuQ1Ij
 mPMg==
X-Gm-Message-State: APjAAAXVbTVPVXB4SkE//GF3HhR7O9nlKmxJH457u9cIc96KOySoHsdt
 MazLk7CWe6+FVsOac50woPVbbQ==
X-Google-Smtp-Source: APXvYqxClT746r2h9FGB0TvTr/y3V4FBjmNT1dRxRA9afN+AEr+lZCNRD9Ez91YSU3sZzckAyCqHug==
X-Received: by 2002:adf:8296:: with SMTP id 22mr31045914wrc.352.1582053172339; 
 Tue, 18 Feb 2020 11:12:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z21sm4519847wml.5.2020.02.18.11.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:12:51 -0800 (PST)
Date: Tue, 18 Feb 2020 20:12:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [RESEND][PATCH] drm/bridge: analogix-anx78xx: Fix drm_dp_link
 helper removal
Message-ID: <20200218191249.GO2363188@phenom.ffwll.local>
Mail-Followup-To: Torsten Duwe <duwe@lst.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200218155744.9675368BE1@verein.lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218155744.9675368BE1@verein.lst.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 04:57:44PM +0100, Torsten Duwe wrote:
> drm_dp_link_rate_to_bw_code and ...bw_code_to_link_rate simply divide by
> and multiply with 27000, respectively. Avoid an overflow in the u8 dpcd[0]
> and the multiply+divide alltogether.
> 
> fixes: ff1e8fb68ea06027 ("analogix-anx78xx: Avoid drm_dp_link helpers")
> Signed-off-by: Torsten Duwe <duwe@suse.de>

Since same company I'm assuming Thomas Zimmermann will take care of these
patches for you. Or you need to ping maintainers again to push these for
you.

Also if you expect to regularlay contribut drm patches, just ask for
commit rights after 5-10 patches landed.

Cheers, Daniel

> Reviewed-by: Thierry Reding <treding@nvidia.com>
> ---
> https://patchwork.freedesktop.org/patch/343003/ (dropped the review mark)
> https://lists.freedesktop.org/archives/dri-devel/2020-January/253535.html
> 
> ---
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 41867be03751..864423f59d66 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -722,10 +722,9 @@ static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
>  	if (err)
>  		return err;
>  
> -	dpcd[0] = drm_dp_max_link_rate(anx78xx->dpcd);
> -	dpcd[0] = drm_dp_link_rate_to_bw_code(dpcd[0]);
>  	err = regmap_write(anx78xx->map[I2C_IDX_TX_P0],
> -			   SP_DP_MAIN_LINK_BW_SET_REG, dpcd[0]);
> +			   SP_DP_MAIN_LINK_BW_SET_REG,
> +			   anx78xx->dpcd[DP_MAX_LINK_RATE]);
>  	if (err)
>  		return err;
>  

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
