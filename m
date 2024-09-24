Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8559842B1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E84110E69D;
	Tue, 24 Sep 2024 09:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fMhruZFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2311910E69D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:53:20 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53654dbde59so5833636e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727171598; x=1727776398; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1B1OazfrIYcqDgljo11L7/3HINNwsrbuT9cs/Fij7g4=;
 b=fMhruZFKlq6vJqjzKQdDzia1n2/p/U9hsFU+fyR4TVOv/g6Mhyt/3hByv2yYMzRoTU
 p3/7FgdeINz/GEuWKSDLzp1WKOeBFsUnxDokjUEvjEVH2L6N4wZ+B5iv21cpjA2MxuV3
 XyNvxkXOd8bw573Z3/ZkJHDeY7bUefqUDn1Y1O+vky4gZeLmZHz+CSrTjIR9B1vDhG2x
 /7SKD4veXsHAhAd8TIVoNay/lOXaUGaHKB7AVSkvZx7qsrWoabXGkjexUEBIOFELBjF+
 I/BTeqLGXxT55H3Ijw5bzcnF5TgwRh9uCPb6wdI1949krhqRbV26LJHbGB1SbfUY3QkM
 J3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727171598; x=1727776398;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1B1OazfrIYcqDgljo11L7/3HINNwsrbuT9cs/Fij7g4=;
 b=vCfzHgc+SVFM1q69Jd7mmJpuRviFb5wAtLFGoW6PrBPJWMMmASUQJy1fbcyj3iSYmg
 3pk4VAn0YLU7Z0L4/8wiMT79LXP/FhnE+SxOaW/8ErSqYV1hQ+exHKWoDJ5Fb6M5Xj2V
 eveEOqMknYLbIwD78dU161ldxImVbBpfudlJke71/QKQ7jyWgpEvhYXqOdCP1S+ZRZI9
 vCDjNy2gGoLOkse8ot/HO21DRdWiLhqTHQtALwT8gXXlaMdUNQnIOeAmXkLWZsK6u1zS
 5UJz+1PDs+jWaDMEk0kxhbNvyxZH1KeNFg9xDgLomPqNTy0JS8itqjd0ziXGrDlA+bFp
 WM5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNCOp9+kNGWgaov+BMaCCO7L1ISEeR7V4KbRbFKoOOkQavhA3bNTgPiChGatS4fJlZcV7zgVIdlnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaueW9UomSVmYTrI/vrel97ze3g2oAEwkUkwHJSgZbqvvzXYs+
 Nw935zbRlFmv7pf/5OhU6V89H80zG3dT0RmbeX/lTQI8kMyeJefdcAPCYM82Vn4=
X-Google-Smtp-Source: AGHT+IHNdJNovm4z94ZHcR5kxQYpSRslhVpX6h8NUrYQWYFmX6wptEro/DaYvlFqeizDV/AiP8vjQw==
X-Received: by 2002:a05:6512:696:b0:52e:fef4:2cab with SMTP id
 2adb3069b0e04-537a6512cd0mr866098e87.2.1727171598188; 
 Tue, 24 Sep 2024 02:53:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-537a86490dcsm155318e87.239.2024.09.24.02.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:53:16 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:53:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Esben Haabendal <esben@geanix.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panel: ili9881c: Add JMO LCM-JM800WX support
Message-ID: <bplvcvwvtwzxa4drmohvb7qac7j5cyucpww5paru4e4drlexoe@hzvabm5tgxcd>
References: <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-0-22a5e58599be@geanix.com>
 <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-3-22a5e58599be@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-3-22a5e58599be@geanix.com>
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

On Wed, Aug 14, 2024 at 03:10:37PM GMT, Esben Haabendal wrote:
> Add support for the LCM-JM800WX panel from JMO Tech.
> 
> The init commands are based on information from vendor.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 228 ++++++++++++++++++++++++++
>  1 file changed, 228 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
