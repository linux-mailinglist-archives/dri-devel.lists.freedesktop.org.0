Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894C99287B6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 13:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7558A10EADF;
	Fri,  5 Jul 2024 11:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="cmK5IeBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2ED10EADD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 11:19:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4257480ee5aso1633905e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720178393; x=1720783193; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mRlQ8AlnLhBKW/e+W7V++lZYUKpnkva2hJ++8rdmz4E=;
 b=cmK5IeBs5ZNBtwPKxtKITxGcOOtc0Ra3OQreDOlZfqcc5OTelkMGkNvTdzEOZJ7xYp
 cXMjyKCWYDnrMJWwX9wudEVQBqx/9Pr7H4+NBRxPZw2S23WArWAWK6/Ax3KMD1RGx14Q
 cJ6XkYo7SPzVIga/GTlYUeO3aTVjyaNbRq70g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720178393; x=1720783193;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mRlQ8AlnLhBKW/e+W7V++lZYUKpnkva2hJ++8rdmz4E=;
 b=DQg79UmRLGNRHQgFzWvu5LBStD73gN6oHs8Od4a4hO+JWFrQQ7baqwdUd7gQfHJ8kK
 3fJNQkBkgrge/2SwvUfB0jwGY2fDq9f+m0gZz+I3gvowz0Vl2AfJEMLuTtvUvSVe/HWo
 gtp0un0of5QX73ROTgqvEX/REJ+sA7Pidt7mL1FP7W63XZJlHekJiRjh6f8oA0vnWvx+
 ZwnU4oWr/HefnPlYZ7Al+jHXHwAPJiJlnDtXEqfy4+prA2ELRZygpCsVJ/lrfHI1jA5W
 SGx/vWkDDHGOdo84k4RJeFO1QKVcjhiJ+kR5ZpYJPwAYV20Fn0hupi0tYQRdfphIoCmW
 ABPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTgjcgVmXp7jFiSYKe1FZD+q29EMko2WWtMoFiRQMddGUPEKVkmQhMIspLfQpesEHwln9F266z0Y9rPdrYjP3hMPN+JO3lntY9O0eEIaR5
X-Gm-Message-State: AOJu0Yx1D119dnwyjmUGZvu6AZX3sm5ehbCHzIP/u639o8W41kdm/fDG
 8j28pWC3Svo1d9DlAvnnsaoJwq4oVfNG1cjDlaoZeo0OHaCpPqpD741YjWdu1ZEU7ysG47qk+aP
 tqyA=
X-Google-Smtp-Source: AGHT+IECr35g0yFQB00KYk1wD2jMjl5S+5iSXH9l6xSpc5QI9GNI/J64xxachpK9QXdoYxj2ZKUHZQ==
X-Received: by 2002:a5d:6d8f:0:b0:366:ea51:be79 with SMTP id
 ffacd0b85a97d-3679dd73cfamr3178927f8f.6.1720178392888; 
 Fri, 05 Jul 2024 04:19:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367947ddebfsm6221414f8f.34.2024.07.05.04.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 04:19:52 -0700 (PDT)
Date: Fri, 5 Jul 2024 13:19:50 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: drm/sti: mark it as Odd Fixes
Message-ID: <ZofW1v4uEFo9GscF@phenom.ffwll.local>
Mail-Followup-To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240705100356.16760-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705100356.16760-1-krzysztof.kozlowski@linaro.org>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jul 05, 2024 at 12:03:56PM +0200, Krzysztof Kozlowski wrote:
> Patches to STI DRM are not being picked up, so even though there is
> maintainer activity, it seems that these drivers are not being actively
> looked at.  Reflect this in maintainer status.

Note that since the driver is in drm-misc, other committers can also pick
up patches and push them. Both Neil and Dimtry have commit rights and
should be able to pick up your patches for you, if they get stuck.
-Sima

> 
> Link: https://lore.kernel.org/all/77b4e4ad-2b1e-4b6d-bc3b-0c7b339bc295@linaro.org/
> Link: https://lore.kernel.org/all/f207b481-f530-4f54-a482-218908869050@linaro.org/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c8e16a649a0e..f284cb8db544 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7595,7 +7595,7 @@ F:	drivers/gpu/drm/rockchip/
>  DRM DRIVERS FOR STI
>  M:	Alain Volmat <alain.volmat@foss.st.com>
>  L:	dri-devel@lists.freedesktop.org
> -S:	Maintained
> +S:	Odd Fixes
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
>  F:	drivers/gpu/drm/sti
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
