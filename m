Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1E2D72B6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 10:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4226ECF7;
	Fri, 11 Dec 2020 09:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CC36ECF6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 09:17:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k10so6926825wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 01:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nHRfY59QhkfMEXZ7CuK5jky9K2Cwi3YsJSJRMFWT6No=;
 b=hO8cVwjqsKkSxW9Jc2m7rLR4b04EHbViBLZ7UoDa7i6jOGhcSdsHcFqZ3sQA9/9R5R
 6A9EtRGI6naTKPxLm5yuxCURVFz+BKH7vTiTMFdLsE/MgtVcZS7xXWjwwZg7dSSZI8V+
 7YZ639LylNoQTOyzv+dIO6hA2EeRkBPC/ABzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nHRfY59QhkfMEXZ7CuK5jky9K2Cwi3YsJSJRMFWT6No=;
 b=Vd13pAuJS00tufxNwjbJiKV2J0Iy4rbOj69ioxXDXN8bOvjwOc9e2ODBV5L4w9R//E
 nsKhaZysqNmflasqkrVxvGFK0TvbqIyD/OFXaZn7R1OQVHEQ+bFooSYWxYPJomJeK9ol
 seNRdB1NVHScmaKdzuPNt+rgMrJQuglqVLhqsSSKM1CxlYMLLSrvqqUxKRGjPbZD3fFA
 B1Vt4SKpq4s/DpcyAIdmsxZw/HRnmu6qKMbgDeRiKYSO3DEOocriAgZOlHkB/D4BFrYA
 NyGGkUq9htD0LO0gGO4NF5xYvq5C5YCM+LpLyw1tuCanQI6Jh5ArYuK8riDOXlWCARoo
 yRhA==
X-Gm-Message-State: AOAM532Mvs6BuDvM+RA4vagCKZGQmhoswERBC/SmoYfLoMoaFZdcrRwY
 wF/jpIgn7PtV+upPQhYXQjophg==
X-Google-Smtp-Source: ABdhPJwhqZnjuDxU8ELTuggdLj8b1ktQf2rn/kBMD6lri7loryTXWBLqguaqBTmBBSL+8CX1w2WUVw==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr12920664wml.31.1607678254267; 
 Fri, 11 Dec 2020 01:17:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m17sm15349777wrn.0.2020.12.11.01.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 01:17:33 -0800 (PST)
Date: Fri, 11 Dec 2020 10:17:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 2/3] drm: validate possible_crtcs for primary and cursor
 planes
Message-ID: <20201211091731.GG401619@phenom.ffwll.local>
References: <9YgBvQ4vfzhtRAXphq8hsw4alh2IZQ3Jh3aQztBFk@cp7-web-042.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9YgBvQ4vfzhtRAXphq8hsw4alh2IZQ3Jh3aQztBFk@cp7-web-042.plabs.ch>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 03:50:31PM +0000, Simon Ser wrote:
> If a primary or cursor plane is not compatible with a CRTC it's attached
> to via the legacy primary/cursor field, things will be broken for legacy
> user-space.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Yup, that's something we can validate.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index f1affc1bb679..2c73a60e8765 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -625,6 +625,7 @@ static void validate_encoder_possible_crtcs(struct drm_encoder *encoder)
>  void drm_mode_config_validate(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
> +	struct drm_crtc *crtc;
>  
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return;
> @@ -636,4 +637,19 @@ void drm_mode_config_validate(struct drm_device *dev)
>  		validate_encoder_possible_clones(encoder);
>  		validate_encoder_possible_crtcs(encoder);
>  	}
> +
> +	drm_for_each_crtc(crtc, dev) {
> +		if (crtc->primary) {
> +			WARN(!(crtc->primary->possible_crtcs & BIT(crtc->index)),
> +			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
> +			     crtc->primary->base.id, crtc->primary->name,
> +			     crtc->base.id, crtc->name);
> +		}
> +		if (crtc->cursor) {
> +			WARN(!(crtc->cursor->possible_crtcs & BIT(crtc->index)),
> +			     "Bogus cursor plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
> +			     crtc->cursor->base.id, crtc->cursor->name,
> +			     crtc->base.id, crtc->name);
> +		}
> +	}
>  }
> -- 
> 2.29.2
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
