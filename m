Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FCB8B2ED3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 05:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA2C10F244;
	Fri, 26 Apr 2024 03:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CIg9jDzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862A110F244
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 03:03:57 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51967f75729so1873058e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 20:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714100636; x=1714705436; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fZ/Zisfurjw8Hv+zb+kdUFeJT0emSA9bFk6trK+4kyA=;
 b=CIg9jDzZole/j+wOAg/ZuJXjjfdh/VEiZ6cXsrPkvaAghDLXAH2VfLGE5HmKILFTsL
 TRoHbGcwVGvRttCap1AwL74UA3usY9A9dZbnbIDfYrfx9+pGG0KCFMiYZaf+5PoKOwLh
 te5P/V4XGu02FSBr3VkUQlAfnXBPMKYf41KjDQHcdOd5ndGIMc7Qryh2lOen5Zc/6PRg
 z84e5RIzlMVpEm90fu+yVhja5lUU872odpI++74je0JGdOeakS7OOXns06BDQISpm6Zo
 Ha/ZqHU8L598L+0YmgXtvF+UABcjmPjL1pscrWEm6/HIGWhwNdsQj/GVIgw+SziQorwV
 lvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714100636; x=1714705436;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZ/Zisfurjw8Hv+zb+kdUFeJT0emSA9bFk6trK+4kyA=;
 b=eAGkoRRocNndZG8T1lRtXdNDq4B/w7Rm62aSPmsEnRMo8e5ysL57HndRDH25scMUjQ
 P8Wrau/orGGHumwNySxgjTFVIChKwSWcl4S2jbpeCy8rQAK3+/PuRjFKzp2Um+G2bluE
 V1mNK/Fi05sA1NVqZYGwB1U2283UnuAzDjmHU6yySbmSuYXUZRQiCAveSoMUCDVrd5zf
 I0L3GB5IrGuqtSirPEsg2xLBJjPCzS9n5uXUFoRyXrlV5dgCwL0Bzo4uoL8PyysiMGpp
 oh/ZQNhqrg4gT0IxUfzeEtBYKXGs2BB9uPA2+ervY0tdPoxKpXwwXhllAUyjRKfKWcLx
 Ic0A==
X-Gm-Message-State: AOJu0YyiT2gTtZg+v+p6EZoMb0w8IWVYzu3F01yFqIvA6R9OlKluW9fw
 v5zRnh40XC+uwGc5DTfjSt+FJFN0f2U9Em5+1SKmhe7qudvZAL3FsEp4/ARGgTw=
X-Google-Smtp-Source: AGHT+IFch5YMzjBVT+EvM3f1ZPtVnXoiD3CHTvIe0yLTKpvZyGcnKIQ946KYzuPdELctZsAYmJYgSQ==
X-Received: by 2002:ac2:46cd:0:b0:519:2828:c284 with SMTP id
 p13-20020ac246cd000000b005192828c284mr574250lfo.65.1714100635860; 
 Thu, 25 Apr 2024 20:03:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d10-20020ac241ca000000b00518a085f7fcsm2964719lfi.161.2024.04.25.20.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 20:03:55 -0700 (PDT)
Date: Fri, 26 Apr 2024 06:03:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: fix LG sw43408 panel driver drm-misc git URL
Message-ID: <u2smxa7mk6dh6tz6ynjwdrsxedgpgccv7ip7o5y7g7udvrw2bd@agm4lt4c65xv>
References: <20240425110352.1374729-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425110352.1374729-1-jani.nikula@intel.com>
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

On Thu, Apr 25, 2024 at 02:03:52PM +0300, Jani Nikula wrote:
> The drm-misc git repo has moved to Gitlab. Fix the URL.
> 
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applying to drm-misc

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6327dc12cb1..23997d2ea91c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6766,7 +6766,7 @@ DRM DRIVER FOR LG SW43408 PANELS
>  M:	Sumit Semwal <sumit.semwal@linaro.org>
>  M:	Caleb Connolly <caleb.connolly@linaro.org>
>  S:	Maintained
> -T:	git git://anongit.freedesktop.org/drm/drm-misc
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
>  F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
>  
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry
