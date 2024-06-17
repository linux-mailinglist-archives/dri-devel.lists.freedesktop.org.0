Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7EC90AA67
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1C910E1EE;
	Mon, 17 Jun 2024 09:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vadz9CT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6125610E32B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:57:53 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so46042041fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718618271; x=1719223071; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gpoL09JxB35FJ5ImuHuqaZBN/f8BI3/8KeXWtW7kk7I=;
 b=Vadz9CT17+ponqhP3wCy9caYQrlqikValYR4hYxTk8F+X8IdGtkW5+Qezen1GYztnu
 sa3L7qNJF2uo/8fibVegusxpRyR9PloZYKs43hVREtVGzPewcNRLGOTK5OJpvpdIiVLg
 XPPMZiXAT3TA42UTIyRh5VmNWRtpiqpPnAp3qcbMJlj9O03pJvsU7G5v3uSr9qLUjENU
 ESRaCx4SC/4Sg27Vx5/W4fSE9oI8LmUANOsuaSIqjo+nN4IpWP8AXnk+nmWfkKSeJYbf
 9tog6qE7FicxGj95EEX87jwiDS+gfW4jML6epq4o7VuTQYTZG0GvQOrvQgJC5eXXE4lf
 g68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718618271; x=1719223071;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gpoL09JxB35FJ5ImuHuqaZBN/f8BI3/8KeXWtW7kk7I=;
 b=HO+ALH6fue+aF41zoc1rfM6ccPwdpw7AQtbW3Q/rZ2i2Vp8RvOfg1W7uG2DuM9/eyl
 4zThoMFVeytGvGL5fu+mXXCDO1MtRTGyVyiNu/bP1x9foQOfa6IoS65iJdpGizqe5iBD
 9eWdvdNKRKfybj2kh7cpFLHyFZ24AwJveCkYRuJOkkafIDGR7h6dt8tMBWSTaROf+qJo
 oDT+ZCD6ai3r51Ci204f2Fs44hZa+aDiLUsYXm9Y/h8oq+jvf12PREejsAmm4UXkBs10
 Xj5s5dVreOzGsfMfnM5UD2cfIs8XSJ78goU3pHobKzZMfq2+guaHq07++oEuc/31NJZD
 Belw==
X-Gm-Message-State: AOJu0Yx+Z3eum9+J6TA+oHVGmftKHUf/o4+F1ry1yTs7wBHTPaGu6aYO
 /tOuJGxwrlKSJB8xkMSEvaW5+TGGEfMB3wFgqXGPx5FacUGaaVmcWy5tcwSXbgc=
X-Google-Smtp-Source: AGHT+IHzleOF863+St6gLFWi26LpebCOh4j1P2exxdVoLWaAvyxh87B5slPANvXBUl2QDK0yoYiihw==
X-Received: by 2002:a2e:7a0d:0:b0:2ec:2c65:2dfa with SMTP id
 38308e7fff4ca-2ec2c652f76mr22644241fa.6.1718618271445; 
 Mon, 17 Jun 2024 02:57:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c78400sm13171961fa.84.2024.06.17.02.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 02:57:51 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:57:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RESEND] drm/logicvc: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <uegtnit6luloxwqbfbwirnt4wytgwfjg5nn52uen6fkhemqukk@4b26w7agpbqu>
References: <20240617103336.7fddb08d@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617103336.7fddb08d@endymion.delvare>
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

On Mon, Jun 17, 2024 at 10:33:36AM GMT, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
> Already sent on: 2022-11-21, 2023-01-27, 2023-12-02
> 
> This is one of the only 3 remaining occurrences of this deprecated
> construct.

The same comment as the one for your drm/display patch.

> 
> Who can pick this patch and get it upstream?
> 
>  drivers/gpu/drm/logicvc/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-6.6.orig/drivers/gpu/drm/logicvc/Kconfig
> +++ linux-6.6/drivers/gpu/drm/logicvc/Kconfig
> @@ -1,7 +1,7 @@
>  config DRM_LOGICVC
>  	tristate "LogiCVC DRM"
>  	depends on DRM
> -	depends on OF || COMPILE_TEST
> +	depends on OF
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_DMA_HELPER
>  	select DRM_GEM_DMA_HELPER
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support

-- 
With best wishes
Dmitry
