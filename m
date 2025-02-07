Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB1A2B8A5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:07:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EC410E9F0;
	Fri,  7 Feb 2025 02:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ig7eqA/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C6310E9F0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:07:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54298ec925bso1896672e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738894023; x=1739498823; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=;
 b=Ig7eqA/RY49dqCieOQ/lSG0nShgsVv/ChiBIKV82qF0HocwkoIlVX5JW3A/t3jMmkr
 3ylR4QdSUvlhKENyz613dz7KUhl5TFS9dHKH0LYPtsE/7AxnWWqlaf4tfdngygaEJXFx
 tpztifKt0Rc2z0w4mo3stkwyZNosMJYJ71hemdAGYyykXakkYm2kmCbZVSuUViMAYY/0
 DBzft3oOIvYq9KuVqLOw0gWv/vAMIogQ7QZbQtPTUSSOD2eDD16c/7XOAVz5UWhDNuLi
 uAyM4zT2Vq5GGN4eSyeokv/19kifqL+hzrxDBIK+2wmIC3mnJq/a1iQKDeFsuaA4INUI
 3qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738894023; x=1739498823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=;
 b=KJbxlsVxDJxAn4rSTAYSHWxvVUutoFLPzLHDQA6smf0hNEROaqNHRlLpn45tUcI3lk
 rzB5ODIzGAOagnXCKm4+zRAJxBOLhXxZo7y7F9njOzbkBSQ1H1l//VS2BY4rPSTw7GIR
 byWtJtYc0+cKvJSVyznz7sMCOPWeBi5hh640UN5HjzFB5nOXO5W0/e4aBXjDLdZwF/A2
 gsWoQXTchW7x0VJ/rjSfqD4cWY5FSWXERHwLLT221A6JNQ1q8li6gTJpnuimNUdd2Qdr
 H5Q3/T2qUNkZc525MvzZqKnjsCzuT1d4kzb7V5bdJUloWr0oEX+S8zPahATV7CkYPWFu
 4+yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKkprsXxyR4buy13Z6JLGY/0m1BpXn6HxIEhLxwGyF7HoCXvKqwzZHcHnKujay8UnHD6Sp4NBGyxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0YBVw2Fmwg6TO469VoGLf4gXqy9101TzfEC8tEqkQE+SYoSUq
 PFiCSRELedIEAl44+ITMridnXZzRA5LtXAehp0GSqzjx0mreLdXi5yELOSi528Y=
X-Gm-Gg: ASbGncu3tcCKH8cRvO5TygNoPE3m3WASE4Z/v637wvSdvKO1QYVPuP7LAw8qPPJc8lx
 jAVSIk+JisblnkrJ7kEq66rZWcEzkOz6bY0VvafDurQNRvGN0ZVVegnoQrhQZ0qaKBFFN68uCbT
 9l4b2mi3zMaX4YeZDqj4BaboCcnnWZe19a+BF1weS0fwl6Vr4Pc+vvB4KKjtsoTgj5wD8OFLlfS
 w4yU2zDUR13DEOZNw6gV0C6/SNCfY35CoysLWvNLjdyPtevEcoRbrtwkEPvL5CbUVXnEh8G7kLc
 QH54IOUO3oqnA5dfNcvyDXyCjvIvLhZZSPZaKHIi29977+QR48VHFAyQGWy9IUVhGbQBcPQ=
X-Google-Smtp-Source: AGHT+IFwAZ+OzzbukVZoC+RyK7oCA6hsn6G2MyRAFDLm/u//Zdyj+Li+eJOThMosTwozpZa/I5Wr7g==
X-Received: by 2002:a05:6512:2348:b0:542:28a9:dcb7 with SMTP id
 2adb3069b0e04-54414ab6999mr282681e87.21.1738894022599; 
 Thu, 06 Feb 2025 18:07:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ec09sm291476e87.5.2025.02.06.18.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:07:01 -0800 (PST)
Date: Fri, 7 Feb 2025 04:06:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 01/26] drm/debugfs: fix printk format for bridge index
Message-ID: <mubhj23fer6btbssvo7yqrst5c45kgqetsnh3kcsrrgqnqkg2j@dx5plvv75e5e>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-1-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-1-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:16PM +0100, Luca Ceresoli wrote:
> idx is an unsigned int, use %u for printk-style strings.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
