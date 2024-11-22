Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12319D5DFD
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 12:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D57810E04E;
	Fri, 22 Nov 2024 11:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqMiHbYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54AD10E04E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732274593; x=1763810593;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GJHZMDI2iJk8tkr/3YVQpA8tfSP7IWp9w/OqAk1Hxik=;
 b=JqMiHbYv+OhdKmtoElOtvYiJ8wLweL/GzQ2Lq7jf+IUqRUOYOwvusek6
 UPz1AVSnygZa4gTIKsRwCOazVwskuVWhiOFKCW+7ytUrAprxPkfJKTExw
 FweRmZoL5tKnP9toxq/jr9xBlqDDox/h8dN0vSHv3QUfrnsBzv9gKXLxg
 RAYwzLf7N759TAJh+/CBcQHNiWcG3DzPUY8EngvJWezonE+A8JdsD3gVe
 aQHkvj41we4Y2UcVRCa0C+wYeYXu3L74mXSlBmBrDpnuex8egMj+z4ZRz
 U7CS44mwho6WTapzFcav96nZ42mKqZQFlOaNCuG2y6QfK01EV317v9R9b A==;
X-CSE-ConnectionGUID: 8svXrC0tRHqnATsJeQfU7A==
X-CSE-MsgGUID: IdYHOhCXR6+BZDQKttAzLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43074380"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="43074380"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 03:23:12 -0800
X-CSE-ConnectionGUID: 6Krw7KkLR6GVn5UaKuPNZg==
X-CSE-MsgGUID: jti2QNpMQ/SNkFZUHXuDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90532328"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.157])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 03:23:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 3/7] drm/connector: implement generic HDMI codec helpers
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
 <20241122-drm-bridge-hdmi-connector-v4-3-b4d69d6e3bd9@linaro.org>
Date: Fri, 22 Nov 2024 13:22:53 +0200
Message-ID: <87ed33zf5e.fsf@intel.com>
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

On Fri, 22 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
>  				const struct drm_framebuffer *fb);
>  void drm_framebuffer_debugfs_init(struct drm_device *dev);
>  
> +/* drm_connector_hdmi_codec.c */
> +
> +int drm_connector_hdmi_codec_init(struct drm_connector *connector);
> +void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
> +
>  #endif /* __DRM_INTERNAL_H__ */

Better fit in drm_crtc_internal.h or drm_crtc_helper_internal.h?

Maybe we could use an internal header inside display/. Or just 1:1
drm_foo_internal.h for every drm_foo.c to keep things simple and have
fewer interdependencies.

BR,
Jani.

-- 
Jani Nikula, Intel
