Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A454853273
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 14:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE3910E034;
	Tue, 13 Feb 2024 13:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="cBrl3ZT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805B310E034
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 13:59:42 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2d0e01013baso16162781fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 05:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707832780; x=1708437580; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zVqR/5/foYJq4j/fGiXL03ER0xcO4xMj29CysqUTjro=;
 b=cBrl3ZT6KCjODQanPzam8f8JYfRawmLdTjqKc/CeGLEBGDSkdgvJxgQwINF6NYe3OD
 fImIu2n8iQgdNcL+etmMSd4tBGWXwyXuIT5P72fnokbAkHbIIxZHSvTdiVmJbu//ObyT
 l9tzimL8JDGs/IO+qEQa58OjgrcDBxwc6YmZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707832780; x=1708437580;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zVqR/5/foYJq4j/fGiXL03ER0xcO4xMj29CysqUTjro=;
 b=JpvRPcLXzEFVs4vx+TKzLQImNw9YT/kgjMePhl+JWpLDFML1Mxmrm8tooeTkuZMuqs
 B3kGjMib7JMjkyVJXKkq0yKz9Y5sWdVG++d27lBrGm93qX+NC1wt6JpV4oHSAPwe4eTL
 8GN+x8W/ABcjN52NczPxaFbVepKNtUZ1X5D3brPf9hjl7tOn67mkChzrU8xRn7n+zKXx
 C+9QVzYm1E61LdC8TWbxwlHqkW1k54AtyP7lihjZR5ClBiS9i6cNCK503264TQ7WWIDE
 HW390xdwGh2W3sPx2Ve3xQoZu5kqdIrrU2g3eIMRFhr1wwR5U+ME1YcX1oaVnsODiEsx
 PaXA==
X-Gm-Message-State: AOJu0Yw7CfW+ap4HTH7qw+5rDNgTdyVmqNoCasz9oi11OX0wsQ18ELzX
 com2zQN192VB150Jfy7bfNmFQprdI8VO6t9c9ItQ24aKYsVlN/zCmLSdaBdOHQE=
X-Google-Smtp-Source: AGHT+IFBNlzI0zvxG9mlgnTlAxhRn4tLAGuP7Ap4W/XBn3P/DGtvKa+sXaGMuhhfkdP4tuEJJp8X7g==
X-Received: by 2002:a2e:9857:0:b0:2d0:e09c:ceeb with SMTP id
 e23-20020a2e9857000000b002d0e09cceebmr5434388ljj.1.1707832780393; 
 Tue, 13 Feb 2024 05:59:40 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUD/SnKrHxBKm2H7JmahlZvlDCwCIMIDzmiLIhrzzP9DfXJujL0RXWR3Fa7qqgk+Ow1O5nDoCqkvj2eAwhtnx4ksUw4qqBdH6F+UXUivRoC7roxl6NWugZ+pQPzSG9coQDpLC3t3jNnj0iz1JjcPBapR6aMoVhv9THGJLryZgVWGS8DLKpb1tWVTXq7Pp+JKnS9mc3nbDCqXOPoPKnk2r1eHrwL5iettL2/gujR4emCeaPUdV68PJN4dI3YFzHhL/CPgAiYNJIWDHt/qlnlFrMe9WultOXZ3GgehbYWtxmuGTe9ztE7NNxzJ1vT
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a5d5502000000b0033b278cf5fesm9570780wrv.102.2024.02.13.05.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 05:59:39 -0800 (PST)
Date: Tue, 13 Feb 2024 14:59:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/crtc: fix uninitialized variable use even harder
Message-ID: <Zct1yYCi7fKf6uDu@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240212215534.190682-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212215534.190682-1-robdclark@gmail.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Mon, Feb 12, 2024 at 01:55:34PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> DRM_MODESET_LOCK_ALL_BEGIN() has a hidden trap-door (aka retry loop),
> which means we can't rely too much on variable initializers.
> 
> Fixes: 6e455f5dcdd1 ("drm/crtc: fix uninitialized variable use")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Cc: stable@vger.kernel.org

I guess at least ...

> ---
> I have mixed feelings about DRM_MODESET_LOCK_ALL_BEGIN() (and friends)
> magic.  On one hand it simplifies the deadlock/back dance.  OTOH it
> conceals a nasty sharp edge.  Maybe it is better to have the complicated
> restart path a bit more explicit, like it was originally.

Alternative would be a very magic for {} macro, but those tend to get
easily defeated with goto/break and friends. Maybe it works now that
linux/cleanup.h has landed, but I'm not sure it's actually better and not
just trading one set of sharp edges for another. Worth a shot in a
prototype at least, if someone's bored.




> 
>  drivers/gpu/drm/drm_crtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index cb90e70d85e8..65f9f66933bb 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -904,6 +904,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  	connector_set = NULL;
>  	fb = NULL;
>  	mode = NULL;
> +	num_connectors = 0;

I think it'd be neater to have all these right below the
DRM_MODESET_LOCK_A_BEGIN instead of duplicated here and at the beginning
of the function. But it's a bit a bikeshed and in some cases (when you use
it later on) gcc might get pissed too. So either way:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima

>  
>  	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
