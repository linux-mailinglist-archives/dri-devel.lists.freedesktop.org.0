Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD9BA2CE5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92FA10E9DB;
	Fri, 26 Sep 2025 07:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PpeSZF2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3352210E9DB
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 07:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758872050; x=1790408050;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=z7of19JO9sgpeNzTCGu8gSVFI4wYGiyFaeZdl5QWmGQ=;
 b=PpeSZF2Padi/L1WOhePJ8l6UHHuU4fbC852QqUSw08CAp69rCnBxSRM5
 0xgqig0/DkyEsGGyg6RuPrfcKABW9fw+enJeyk1WhfseoM9svQTlajPMo
 jessJDKlFzwi5xhgUJql8WQlfD4RfHTodt+F0spdKzE+viD4amsXtj2PC
 NPFH2DXH7s32AYQAsqfgp1nytChWzqkG5q2Gj1syK3BSqWbQtPdvH7Uuq
 2ged0WhAYqs0cQL41v+5BdcapfvGmO9D2PGWhvSZ/52b/WOjuNqP0nsHW
 4ORQ5IrKcZybPlhnn98YA1DnzS9TxSFZavDNwgymH94mWio8PxSvatwD+ Q==;
X-CSE-ConnectionGUID: hlNlPZtaSAivlz2xSALxIQ==
X-CSE-MsgGUID: /7NP/a6RQhCh2zQSV1j0sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="60900209"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="60900209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:34:08 -0700
X-CSE-ConnectionGUID: m2s2tBZMRvWZu8pNCDo0wQ==
X-CSE-MsgGUID: ulhKYCILRoWdhMk5A19tcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="177934224"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.10])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 00:34:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/2] drm/connector: allow a .destroy callback for
 drmm-allocated connectors
In-Reply-To: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-1-f0736e1c73ee@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250925-drm-bridge-alloc-getput-bridge-connector-v1-0-f0736e1c73ee@bootlin.com>
 <20250925-drm-bridge-alloc-getput-bridge-connector-v1-1-f0736e1c73ee@bootlin.com>
Date: Fri, 26 Sep 2025 10:33:59 +0300
Message-ID: <46ef67d65591bf18d9d9dc4f8b26ca93ed93304f@intel.com>
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

On Thu, 25 Sep 2025, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Some code is going to need connector-specific cleanup actions (namely
> drm_bridge_connector will need to put refcounted bridges).
>
> The .destroy callback is appropriate for this task but it is currently
> forbidden by drmm_connector_init(). Relax this limitation and document it.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> The other obvious approach would be adding a separate .cleanup callback for
> the cleanup-only actions. I tried both, they both apparently work, so any
> arguments and opinions on which approach is best within the overall DRM
> design would be very useful here.
> ---
>  drivers/gpu/drm/drm_connector.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea4784e97ca894ec4d463beebf9fdbf0..bd0220513a23afcb096b0c4c4d2b957b81f21ee1 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -513,7 +513,8 @@ static void drm_connector_cleanup_action(struct drm_device *dev,
>   *
>   * The connector structure should be allocated with drmm_kzalloc().
>   *
> - * The @drm_connector_funcs.destroy hook must be NULL.
> + * The @drm_connector_funcs.destroy hook must only do connector-specific
> + * cleanups if any is needed, not dealloacte the connector.

It slightly feels like a trap to have different semantics for ->destroy
depending on how the connector was allocated.

BR,
Jani.


>   *
>   * Returns:
>   * Zero on success, error code on failure.
> @@ -526,9 +527,6 @@ int drmm_connector_init(struct drm_device *dev,
>  {
>  	int ret;
>  
> -	if (drm_WARN_ON(dev, funcs && funcs->destroy))
> -		return -EINVAL;
> -
>  	ret = drm_connector_init_and_add(dev, connector, funcs, connector_type, ddc);
>  	if (ret)
>  		return ret;

-- 
Jani Nikula, Intel
