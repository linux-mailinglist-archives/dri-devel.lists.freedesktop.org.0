Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CAA40FCDB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 17:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BA16EE1D;
	Fri, 17 Sep 2021 15:41:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52126EE2A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:41:00 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id a66so18717201qkc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 08:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G/b3XiXy0Sb8x2PtTRvVL/40239eORGz1ZL98EY1EC8=;
 b=fzPGLaz85DNSjT8BpuMHmKOqlTmjcQ0qE3xixhpENWlDBqA/2YO/GHW63weTUvqukt
 /hTvkY+SrTcPo885plyDeFM72/dI9tOCbng/4AcduL2xIMkCXnVtu7q+T7+a/dD51gTH
 L7gwVnqTw/HxFpzCGCbsHv4pnw4VgWgPaHdZVIoNesVklyEarxWWcfWZeFjT4RjtbAt0
 zKMyHOGfRmRVSf82T/XUmWcFRHrKWywI2DYIEWYrkh+TpOc6k/7I+sqzH4nT9t/FGY5F
 hAHLlOmKX+HDxFDYattoDa8cZNtr6c5DAixr6gOGgaZ9CCc1QkEkWDxuavEl/4geEn+l
 1U9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G/b3XiXy0Sb8x2PtTRvVL/40239eORGz1ZL98EY1EC8=;
 b=Ty0umYF1cqcTjeD3DoprzbU1MNqmGKhUDUACW70M+jecy0wZBaiy38jXhhXt9dD3qo
 EICzRaLGbWhSG0m5HauKyoGlkDlYq/WxaZzucnDtgGxrS9UL1GjSwYuZrpHdBBX4XYnn
 DeTSvENKwA8IXGkbsAWWZ5KFd2lY16SJsCpXBKqsTudzy2KwN4oo3kpLEQa8ZVpZ8lOY
 Ab82sa/WtZKtwsr0uwEqP58791ocDARdziuXrLJ4VdZCiHmR0dcdOum/MNUT0ZMzhGgM
 4FRbxvMiObHOClaTje+GEGD7H80Q4ORUrU4Ytoq8t0gFyojGdUjreSHVUe7yvCgzu2q0
 KC7Q==
X-Gm-Message-State: AOAM533WPZzndXPz0Id+ek+LT+VPaEsLZbrYUno8SQnNCGm69uUk4SfT
 n6CdVJqU3Zk0q+tpvlU5xyHnFg==
X-Google-Smtp-Source: ABdhPJwEOXquIsSStFswyl2f30Mm94RU8fNeBCXsfk8xn7q1LDa0ztl6hhBn29sVtbQXy6Bzc6IuSA==
X-Received: by 2002:a37:9b93:: with SMTP id
 d141mr10910675qke.236.1631893259801; 
 Fri, 17 Sep 2021 08:40:59 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id l195sm3821941qke.98.2021.09.17.08.40.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:40:59 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:40:57 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/15] drm/omapdrm: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917154057.GI2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-10-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-10-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 16, 2021 at 11:15:46PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/omapdrm/omap_fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 190afc564914..56013c3ef701 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -62,13 +62,15 @@ static int omap_framebuffer_dirty(struct drm_framebuffer *fb,
>  				  unsigned num_clips)
>  {
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
>  
> -	drm_modeset_lock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(fb->dev, ctx, 0, ret);
>  
>  	drm_for_each_crtc(crtc, fb->dev)
>  		omap_crtc_flush(crtc);
>  
> -	drm_modeset_unlock_all(fb->dev);
> +	DRM_MODESET_LOCK_ALL_END(fb->dev, ctx, ret);
>  
>  	return 0;

Return ret here

>  }
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
