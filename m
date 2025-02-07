Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE100A2B943
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 03:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4184510E9FF;
	Fri,  7 Feb 2025 02:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wyLcwjpB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99FE10EA00
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 02:49:26 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54025432becso1621931e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 18:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738896565; x=1739501365; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=;
 b=wyLcwjpBRx3lDxtq4PHwfyj0DYaxlguO/LXxuCiSU3M/6ABhDWNx0ngqvSrZpG2prj
 LW/WwskcL5eyAMMj1MOyaY5HnSwCNVSfhU8RRVIwMl1obBNl2uFMOJmzEWlMXXQxFJA5
 pbcWxQemDfpTcspnwY3gQNJ6E+jR/nBNJvouQnPJqh02Z0vyy1U42pYihMUOX78rZSax
 ylmyDWlRnK5IaHt84qMLKu6ww95uXkTdI0aM5res1d4wDNaXt26qam8DmwaYC2ef5eyu
 VtWw7hkh5A15mGAFieXQx7sZyktQd10/Xu9yzLVWaS+Qh4Wa5eATeL0pD2wT5dfFmSrV
 qvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738896565; x=1739501365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=;
 b=BFpHB5vBDrWsFT2O9/gYgX4+Halm3b2cvN4ssc5lrzer7Dpaiq+3vZYBLYTCBHXnZV
 6KUDheECtySfCr7n8aNeK/axHjs6+Rlpi7hhUvmA8nIdPptfLIFdouX2VQM6ttGku+/E
 CvJ/rRBF1NoTclWvNsCDWBdwvBc89inA7pOjkz5Td92lh0jwyre9tq/GQeyGx21+mJrJ
 VJ5O0SSVrdoX3OcKzvD1Y8uwXdSzDHh16+36L7szsSCp8DfSPw8xcfL/VA0V5WqRhzFR
 SfdINHd3etbLPykOuHY5d2GTdPK2MFjc/f8YDdgdXqNNVpF92/XAomOQ7+qehuJwGtSy
 UYbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs2slqxnJo6ARbZN2x5p5KUW5apqaS074bDNa6YKEQ1sjp+3dD0eKPwZ+KfvHUy+Oh6Rsc7SWxhWc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8w8tD5N02P3sPymhXnW5tIUz8ShnieivQZpNtmyAdIql+mAbi
 yj6Pt9JvvZ8eSSwCvsNPOCGaObZEOkoOSNrDUVMBawCKljH6R1AUxbHFfS0fHBc=
X-Gm-Gg: ASbGncuhfWV8YgMUgOL3hU7kFHcwiF3KOdS8fVEUqr6Tp9R3Kt3fp0enXjRABnZNjxH
 dbBsdQRI+2LrIuh1YMXjBNMGUILvYSuKzb1wBZjG91pQaZDqLhMTYfzUtICQsumDW5zXu/Bksxq
 cwQ2eGjfm7Cr9SgxNvZk8Q1oYdbhzBGD/b5NZEt77vEqQqzmjA1w+eFubtZmztxQ102vjBexR8t
 kvDUI/aZWBFdTCArvo14RrBdzG4zut19cGQzi9VhFWmOEPqAwNAj1/iLXCDt6BORAIJN3ynkbQb
 8lbAF7KV0oCCIWAt/4JQp8ygUUCJ6z0gwD+PLzpG6klc7FBj+LePT268tBZSLYQ0ywKD7R0=
X-Google-Smtp-Source: AGHT+IFTPGY2nzRLHllSo8hDFl+TxXnd4EtAypxnHw3YEBN2TqXVdM1x8iFz55a0HF67J/9VnE7uOQ==
X-Received: by 2002:a05:6512:70e:b0:540:1e17:10d2 with SMTP id
 2adb3069b0e04-54414ae5f0amr254436e87.49.1738896565019; 
 Thu, 06 Feb 2025 18:49:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ed63sm300364e87.41.2025.02.06.18.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 18:49:23 -0800 (PST)
Date: Fri, 7 Feb 2025 04:49:21 +0200
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
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> Adding a panel does currently not add a panel_bridge wrapping it. Usually
> the panel_bridge creation happens when some other driver (e.g. the previous
> bridge or the encoder) calls *_of_get_bridge() and the following element in
> the pipeline is a panel.
> 
> This has some drawbacks:
> 
>  * the panel_bridge is not created in the context of the driver of the
>    underlying physical device (the panel driver), but of some other driver
>  * that "other driver" is not aware of whether the returned drm_bridge
>    pointer is a panel_bridge created on the fly, a pre-existing
>    panel_bridge or a non-panel bridge
>  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
>    but the "other driver" doesn't know whether this is needed because it
>    doesn't know whether it has created a panel_bridge or not
> 
> So far this approach has been working because devm and drmm ensure the
> panel bridge would be dealloacted at some later point. However with the
> upcoming implementation of dynamic bridge lifetime this will get more
> complicated.
> 
> Correct removal of a panel_bridge might possibly be obtained by adding more
> devm/drmm technology to have it freed correctly at all times. However this
> would add more complexity and not help making lifetime more understandable.
> 
> Use a different approach instead: always create a panel_bridge with a
> drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> wrapping it. This makes lifetime much more straightforward to understand
> and to further develop on.
> 
> With the panel_bridge always created, the functions to get a bridge
> [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> the bridge they are looking for exists already (if it can exist at all). In
> turn, this is implemented based on a variant of
> drm_of_find_panel_or_bridge() that only looks for panels:
> of_drm_find_bridge_by_endpoint(). In the future
> drm_of_find_panel_or_bridge() can be progressively removed because there
> will never be a panel not exposing a bridge.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
>  include/drm/drm_panel.h        |  8 +++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
> 

LGTM, minor issue below.

> @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  {
>  	struct drm_bridge **ptr, *bridge;
>  
> +	if (panel->bridge) {
> +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> +		return panel->bridge;
> +	}

Shouldn't the rest of the function also be removed as you do in other
cases?

> +
>  	ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
>  			   GFP_KERNEL);
>  	if (!ptr)

-- 
With best wishes
Dmitry
