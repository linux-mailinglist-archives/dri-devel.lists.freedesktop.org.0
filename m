Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41749A2B938
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E8F892C8;
	Fri,  7 Feb 2025 02:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mZEXNX3i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51B2892C8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:44:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5440d5b30a8so1878087e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738896286; x=1739501086; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MQReq9xQ99y9zIKRJOryjTQFC2bFCDp3B7MQU03SZE4=;
 b=mZEXNX3i8FB8giRU1awIXB11bTJwaErDC+Z75+gaj3Mvqo2z6hjyv1Ld0eiCz5u48j
 3v4+3CYocRXPA9fUvR20hlIGjX8LeHhE5CTtVI1+xmvb0iWxDmZ2LsW4f3gAN3o73W2b
 z0/Ml93lPH4YejQiyVFsMgnTTWkmToSLja2T1wlXOnv0xQBmZ7i7Zf5kaf3f5H3ou2kX
 yqHdKxXO4DJQaz3adOzuZlVAx+HpnzCHtYLIIYG6Qn5ml4unusJXLt+xnVyCyUtnmyqn
 vc64hE/dEG+5P6zrJPNp3XyicPPsM+Y+7oiHKCsOdos1oicU6K9GbSdR8e2t95nYeyTu
 +azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738896286; x=1739501086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQReq9xQ99y9zIKRJOryjTQFC2bFCDp3B7MQU03SZE4=;
 b=MBgQkKLwHqt0ozXvng9Gigcsf3atSlz8ssA9XJ0Q0m0xViEP8+wEnKczcZHVueTIUl
 Mh3VL0Sqh8Fb2jfmyAx3tY2xnoyjpsYGQDRSFlxt0IbLnAp6lk53bTq2Trru13VFGU/n
 a4AZZSDuOWkXcSrNy7zh6HKf0uWJEZgoSeV/sOXLbpc02Tg2F25vgicVlqhqNgf0HZsU
 99qwGRbW4ud+29bF6EHOu7QPB9J5mnXClcm299O5NpAUukDmRqGxWRDWThTuBP3ojewh
 qATB/i//p8NLQi1SFUbdXwurAw3nIg2w7H1RDhF8x1gc8iex5lMQkSATTszamR4MPja7
 S0cQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeTTCwp55aaTNcYhMc8vSyGUMtcQMQEUoLWLG0ko7lzrPE/qyt30p3sjkRhZZE/A+Eg5xcukkFCuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg6mLCsUk4OhIzvcdxbYG8HCZ5EVLH02dhSlDZtbePs7JWOX6o
 98/dcbNrLAyluNiWUtMHOjkgYR2pRT+De0gv2yedcFlnAQjOHHvDA5zx0ZnmQXg=
X-Gm-Gg: ASbGnctorS8DadIgiUtaBOukHt2/eWK4qZ/bmT3JY+d8b1/t6K54peoqfzev+s8w7nw
 HRxen0UQ4C6ZEG8CNI7uQW+GZ+29ztYnL7vTtLG5afpkKkUUwjuCp8CN3VVWZeHbknMR3FGWZuQ
 yX9sHCQx4sinSAGtFZqU/9yJ8z3mVtA7jvnhVsAg2Xc8+wf9B0G1KWfktvvGVlUCmCbxysWIBrg
 ldF/YBcPPU+ZjrZGYYQ+gxVx23r7WIj58rw4UhKyM2gZoc4x48fJdNzfCFKlp7LVGyYXZeC/6I5
 HnkXigHsENPRp7SsveOOnvxtPrS/M7mSaJ0VFRvc9nENxDOcTMcfKn/D8HmSc530n5hGyK0=
X-Google-Smtp-Source: AGHT+IEMdrg6IaKfrHTFSkbGGZM6z3+o/AOEBo27rSaLzMBVYmx9IKsUOm6sC7QIz9laKpK7sx9QjQ==
X-Received: by 2002:a05:6512:5d3:b0:540:fb1a:af1f with SMTP id
 2adb3069b0e04-54414af5721mr284630e87.39.1738896286187; 
 Thu, 06 Feb 2025 18:44:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105bf58esm296912e87.107.2025.02.06.18.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:44:45 -0800 (PST)
Date: Fri, 7 Feb 2025 04:44:43 +0200
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
Subject: Re: [PATCH v6 07/26] drm/bridge: panel: forbid initializing a panel
 with unknown connector type
Message-ID: <cii3ko3pejzmvz3cft2saw3biyx6yipcsemd3mzihzy7tyhsdg@zpmqujujwcie>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-7-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-7-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:22PM +0100, Luca Ceresoli wrote:
> Having an DRM_MODE_CONNECTOR_Unknown connector type is consuidered bad, and

considered

> drm_panel_bridge_add_typed() and derivatives are deprecated for this.
> 
> drm_panel_init() won't prevent initializing a panel with a
> DRM_MODE_CONNECTOR_Unknown connector type. Luckily there are no in-tree
> users doing it, so take this as an opportinuty to document a valid
> connector type must be passed.
> 
> Returning an error if this rule is violated is not possible because
> drm_panel_init() is a void function. Add at least a warning to make any
> violations noticeable, especially to non-upstream drivers.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
