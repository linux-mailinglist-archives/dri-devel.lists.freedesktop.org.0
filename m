Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A168AD570
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 22:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B470112D30;
	Mon, 22 Apr 2024 20:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vzy/xvia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFDE112D30
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 20:01:04 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2dcbcfe117dso42089781fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713816062; x=1714420862; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l/KzyeGjVvjPl3mw44prJgmddutMprerCYD3mvCURuo=;
 b=Vzy/xviaYQz8ChgEJt71iFLdmO5ahp+Kx356O87J5NKCsPHhIgRrKb6Q8WV/p2RtlM
 ipRn4f9mevMuaXGlHJVVbjK9ydvkiCtIFxuF50BURdDFG2N9OxLuswl2wEHTQ+kSJmWw
 5WxL7yk0aWNrvZzYmzYolfI6Y9L2oWxV/WDXaD3lu89oNJwmzZKGrWYDF7GVYygqSgvS
 XUvYb8tNTbCKn67SwUKXbQrcVKWpbW4WPXAPFUOCZjryLC+RaDBwT44sdNfrBtTipZ8K
 hS7PCqJlWCTLSjEpeITEZ0GtwSZjOYB5/ycu8pGhIx71bcO8mOu+jg96m0YFS+l133xy
 meNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713816062; x=1714420862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l/KzyeGjVvjPl3mw44prJgmddutMprerCYD3mvCURuo=;
 b=HTrvIREQUjANhTv4yA1CF+aV/XtTTnb7lcu35Tc0x0ulJPheZseDkfLhui7gkavwbe
 VfNufmxXZIEFr6IsTtJ9+7nsDLeYFTY9xiInLJkzg4sNLyhmj1veb7R3WgNnS9IrFKUg
 fspe+CocZj6i9UCihHOnoa+00zVIusbLjQ7W0IQx7TM1xKO7Gb9cgEozKFVk1N0/ubaP
 7+7NW5d5+7iwEpyMiSPu3ROpzWI/LEV0/RIc8VSv3DbT+AX1ymokCdqcfU35hnxyEafC
 7DnCAgkOUborll2ob01nt/MD8FT3TUpvCO98uhc10KcZwAE4Pswmw90ZKPn6ew3KsMHm
 Qf7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIghI/j9EB/Fb3m+3qmReJlFmMqTBvqXV/NpLJG8DRntXP70iM1BYCUOIv8eQtL10YshOK4J26qw0YfogM+wh321CSdLymnS5a8kFKgUIS
X-Gm-Message-State: AOJu0YzsrRMrTD5F5pdo2pOo7J6d92S22Daifv9k/ezhP1qS1RFkYmY8
 wcADupxMl2MMD8WbQ9dhOgVchcGfp1b0yrMARyXmVBwqsDFZHHkAWDu+6SlUsV0=
X-Google-Smtp-Source: AGHT+IEabZul5dxrpvaBVDKaplbJ0k/VcioOxOo78Zun52uaBZKpKHIJ3dRySN39XbdI9/aYEoQmOg==
X-Received: by 2002:a05:651c:2010:b0:2d8:3eaf:86d2 with SMTP id
 s16-20020a05651c201000b002d83eaf86d2mr7011409ljo.47.1713816062402; 
 Mon, 22 Apr 2024 13:01:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r28-20020a2e8e3c000000b002d28db9ce7bsm1556971ljk.20.2024.04.22.13.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:01:01 -0700 (PDT)
Date: Mon, 22 Apr 2024 23:01:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Phong LE <ple@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] drm/bridge: display-connector: Add platform
 module alias
Message-ID: <d7rnvde4hlp2umn6usgfvbuwcz4x4ahoxp2lq7lcmdbv35k7ee@5lxfk5aw6slo>
References: <20240422191903.255642-1-sui.jingfeng@linux.dev>
 <20240422191903.255642-6-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422191903.255642-6-sui.jingfeng@linux.dev>
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

On Tue, Apr 23, 2024 at 03:18:59AM +0800, Sui Jingfeng wrote:
> Otherwise when compiled as module, this driver will not be probed on
> non-DT environment. This is a fundamential step to make this driver
> truely OF-independent.
> 
> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index d80cb7bc59e6..7d9b4edf4025 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -434,3 +434,4 @@ module_platform_driver(display_connector_driver);
>  MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
>  MODULE_DESCRIPTION("Display connector driver");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:display-connector");

Same comment as for one of the previous patches. Please add
platform_device_id table and corresponding MODULE_DEVICE_TABLE instead.

-- 
With best wishes
Dmitry
