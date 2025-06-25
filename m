Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1D2AE8CC8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 20:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5AF10E0E6;
	Wed, 25 Jun 2025 18:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcCOo5gA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9949110E0E6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750876988; x=1782412988;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ciB7/R85e1TQ8jkGKcUD1PsVenjfp39+N7RW9Y6A5tU=;
 b=YcCOo5gAU0DlnRRQI7JmF/kLnRsxXWOkwCGlJ9l/jbGODa63j4to6yn6
 LaaEiBiMmASH5M+UjXggbiwRw7nDa1XfHMTA7nNL0l6kKJbam3ODKV5p2
 ArdNPtyG1wJ+idfflsXsP27zLPa6lFViv0px7CQ7ut6xrdX6EO+/19IUB
 er1WBcPfYOHlhrctMQcTRB3JcFm/kkYUYIf9mJ/eEjdxQjWbTU+8sI7Gm
 O5sfzm+HLPLgd7dTC6ckDeAaE2Jrw/IcVPHy4fOtppAF716h8N315KM1M
 obRJtVcaFkwvaJ4K+z8ndN1IKvyvb3KEK+5/4iS0FFwXgzUkwPTnW62+t w==;
X-CSE-ConnectionGUID: wc3NmoXYRsic/5Bl1urAug==
X-CSE-MsgGUID: iNmF2zrCTYqT8z1vpweCow==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="70731213"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="70731213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:43:07 -0700
X-CSE-ConnectionGUID: weLn+vGWTOC9tknuCQnPkg==
X-CSE-MsgGUID: dasfE1ldTY+KCjYtdTgYRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="189484709"
Received: from monicael-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 11:42:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 17/32] drm/i915/dsi: convert to the .attach_new op
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-17-e36bc258a7c5@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250625-drm-dsi-host-no-device-ptr-v1-0-e36bc258a7c5@bootlin.com>
 <20250625-drm-dsi-host-no-device-ptr-v1-17-e36bc258a7c5@bootlin.com>
Date: Wed, 25 Jun 2025 21:42:56 +0300
Message-ID: <30d63fee31a9fdb668da2377767e68315d6f9995@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 25 Jun 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> This op does not pass any pointer to the DSI device, so the DSI host driver
> cannot store it.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging via whichever tree you find suitable.

> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c | 4 ++--
>  drivers/gpu/drm/i915/display/vlv_dsi.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index aa566ad3f5cd72fb8f9440e2645da0047da222b1..ce5d7b77444d2ac7bc71aecc150d42e2dbb59e0f 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -1780,7 +1780,7 @@ static const struct drm_connector_helper_funcs gen11_dsi_connector_helper_funcs
>  };
>  
>  static int gen11_dsi_host_attach(struct mipi_dsi_host *host,
> -				 struct mipi_dsi_device *dsi)
> +				 const struct mipi_dsi_bus_fmt *bus_fmt)
>  {
>  	return 0;
>  }
> @@ -1826,7 +1826,7 @@ static ssize_t gen11_dsi_host_transfer(struct mipi_dsi_host *host,
>  }
>  
>  static const struct mipi_dsi_host_ops gen11_dsi_host_ops = {
> -	.attach = gen11_dsi_host_attach,
> +	.attach_new = gen11_dsi_host_attach,
>  	.detach = gen11_dsi_host_detach,
>  	.transfer = gen11_dsi_host_transfer,
>  };
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 346737f15fa93264ab8791912cc4cc128f2f3324..5f73919c4bb626f8c293e383479ce393869e47d4 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -199,7 +199,7 @@ static ssize_t intel_dsi_host_transfer(struct mipi_dsi_host *host,
>  }
>  
>  static int intel_dsi_host_attach(struct mipi_dsi_host *host,
> -				 struct mipi_dsi_device *dsi)
> +				 const struct mipi_dsi_bus_fmt *bus_fmt)
>  {
>  	return 0;
>  }
> @@ -211,7 +211,7 @@ static int intel_dsi_host_detach(struct mipi_dsi_host *host,
>  }
>  
>  static const struct mipi_dsi_host_ops intel_dsi_host_ops = {
> -	.attach = intel_dsi_host_attach,
> +	.attach_new = intel_dsi_host_attach,
>  	.detach = intel_dsi_host_detach,
>  	.transfer = intel_dsi_host_transfer,
>  };

-- 
Jani Nikula, Intel
