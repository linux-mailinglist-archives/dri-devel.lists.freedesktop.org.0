Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EEEA2B967
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FDE10EA0B;
	Fri,  7 Feb 2025 03:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G6rHRTTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FFC10EA0B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 03:03:18 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1626388e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 19:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738897397; x=1739502197; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ScckE3sdkg/vVUj7WnXQkdjlruhwNWA4ty0J/lG2SIg=;
 b=G6rHRTTtttcHx5ypOrGD2hG7Qt29JkXah1G8/53XgMQtBdRfmW/MqeYU+pKXsFfWuy
 UG8VEu+wd58yQByORW8xPL01wSjBCtqplBKyaPGjZ9AT00EENwKmIzbZtXUvDOzMbGKe
 XHn5XZ1lMAz8PDwYAx4H8jKqX26DtCHLcQj3fEwa+6yRBDNTcQ4GfL6EyXvQidYqq5/1
 MNdK3E9dTmcrk4z1SBYEZORZNNLRn15fF3cDHu/oBGvr4tNQTVTgfqPHFTIdZ+SlO5KT
 jvW/egtUOzhz4jmTuPk/DQcqSvQSlLcq/ptDlsCRBUtfZFf8fXYWEldoPx1OuPJF+J1A
 ntWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738897397; x=1739502197;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ScckE3sdkg/vVUj7WnXQkdjlruhwNWA4ty0J/lG2SIg=;
 b=ozeKvKiS0VciYK0Wqa1S/iwM/cavfjANZH/dazOhd8lGWy+9Stp7d+sZkJYOebl7Rg
 YKj4fdTdNsl1LmL05C0EQuzK82tMYwKmvmDLoAK7GnCBnyDOnaiiHvX6ge11PDLJTOXP
 fR4PDyo3RqcbgO/mNHE66yfmPflwL6EosrL4ML57baGwvdvvPY6q3XXS/rrwQl8UaNFJ
 tl0+P1eOfL6OZvjUUbvy9Os8lC5bh55LLZmEP5f4ED/SW8JWRB9v6OXQ5diK9QUssyMg
 PT4gjXVxlVQ6vYb4zXttrGzm9CQgqACYsvsae/3yZzyuzii9Cs0voxrbeG5lCqCgfl9G
 9IsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXXmgnXy4jAQwx2g1poOxPvt91THczpXpicrtE2AiFRw0sbKtPcHq7SzJCpA/8kKG2VVIXZTRTMo4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTPGLlq55++8WXw6sqvtGMhjmUH8U+4280rZxfjreZqtlxzi1F
 dYCd/ZiBDJDQsEUY6ZEHy2Z+kS7l8KlocECvMkS9baNZ0IVJZN/q59zYrE9909w=
X-Gm-Gg: ASbGnctz+7MUT0+KzLSkOB0limzm0ZiiwQYuVvHyc651EfR+hTNoBvTucU1JaQ93KG2
 Qm1Fy49DYmf2Q5F9eFA++HFdonP9ZBlZNPvnNmzacr9y7U3raeWtk4ewHjcpkPBsXt7aK30JmMp
 71BqGawyb0tkgI2fs7nfiq9UK8AlR8qHkyHQ5+1QWuAnFGQ+WwMouJsZFMkJ/lIr8hkP0hBw27S
 9lcVAPjpv2YKmLkVu07wiNvXLkAAyNZnI8gD6iLWtKD+Pmis1UNUww+cHHcFv3qUo9CRCr8RFwZ
 bb2YRZj4CIhqxexJUCNXRZLanIGyQ1HV8AZO0dgTRH6hGuniyvWcDsD7DuXhUojpsAosoWM=
X-Google-Smtp-Source: AGHT+IF1zkGPC274Byqhl5z75QjvE44TjiZdR7ZFTdBZSZkQteq90ey7AMuc2ci0aBKLn5vOWSqUSA==
X-Received: by 2002:a05:6512:2316:b0:540:1a40:ab0d with SMTP id
 2adb3069b0e04-54414aa87e7mr369435e87.28.1738897396852; 
 Thu, 06 Feb 2025 19:03:16 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54411cc9fa4sm261365e87.149.2025.02.06.19.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 19:03:15 -0800 (PST)
Date: Fri, 7 Feb 2025 05:03:13 +0200
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
Subject: Re: [PATCH v6 13/26] drm/encoder: add drm_encoder_cleanup_from()
Message-ID: <spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
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

On Thu, Feb 06, 2025 at 07:14:28PM +0100, Luca Ceresoli wrote:
> Supporting hardware whose final part of the DRM pipeline can be physically
> removed requires the ability to detach all bridges from a given point to
> the end of the pipeline.
> 
> Introduce a variant of drm_encoder_cleanup() for this.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v6: none
> Changes in v5: none
> Changes in v4: none
> Changes in v3: none
> 
> Changed in v2:
>  - fix a typo in a comment
> ---
>  drivers/gpu/drm/drm_encoder.c | 21 +++++++++++++++++++++
>  include/drm/drm_encoder.h     |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> index 8f2bc6a28482229fd0b030a1958f87753ad7885f..472dfbefe2960924a4e83bec425af8c7ef5f5265 100644
> --- a/drivers/gpu/drm/drm_encoder.c
> +++ b/drivers/gpu/drm/drm_encoder.c
> @@ -207,6 +207,27 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
>  }
>  EXPORT_SYMBOL(drm_encoder_cleanup);
>  
> +/**
> + * drm_encoder_cleanup_from - remove a given bridge and all the following
> + * @encoder: encoder whole list of bridges shall be pruned
> + * @bridge: first bridge to remove
> + *
> + * Removes from an encoder all the bridges starting with a given bridge
> + * and until the end of the chain.
> + *
> + * This should not be used in "normal" DRM pipelines. It is only useful for
> + * devices whose final part of the DRM chain can be physically removed and
> + * later reconnected (possibly with different hardware).
> + */
> +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
> +{
> +	struct drm_bridge *next;
> +
> +	list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
> +		drm_bridge_detach(bridge);
> +}
> +EXPORT_SYMBOL(drm_encoder_cleanup_from);

Shouldn't drm_encoder_cleanup() also use this function?

> +
>  static void drmm_encoder_alloc_release(struct drm_device *dev, void *ptr)
>  {
>  	struct drm_encoder *encoder = ptr;
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index 977a9381c8ba943b4d3e021635ea14856df8a17d..bafcabb242674880a97dfb62a50d93cc4d80c1d4 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -320,6 +320,7 @@ static inline struct drm_encoder *drm_encoder_find(struct drm_device *dev,
>  }
>  
>  void drm_encoder_cleanup(struct drm_encoder *encoder);
> +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge);
>  
>  /**
>   * drm_for_each_encoder_mask - iterate over encoders specified by bitmask
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
