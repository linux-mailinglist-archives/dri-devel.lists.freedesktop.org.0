Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB346BFFFE8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0452010E8EF;
	Thu, 23 Oct 2025 08:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oq/SlVyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED0110E8EF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761209140; x=1792745140;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mska27xKT3EyztX10JDYKLSZS1LLb/NIROqYMNvXfP4=;
 b=Oq/SlVypXYrTUOOf07L0Ztw+1fVdpeduXbhUeP/7pd485N8MjrarIU4n
 dqSKLi4LJ1zDgARu1IAuAXUP32RaRxbVSDSvWGlW/NTvhzToN98A5wlxC
 iBtUK6ToZBFkpvby14rjNDQG/+JXiQ7UpuP/Mlj0CPZkW5mF5lW3vmJRp
 VaotNG4cJ/UjtcscpjEHKRrDCdDHIeAdgKQDA0z+iweCWqCrBNejQcA6C
 fV6PtyDdvShQX+j+XPHzo8RTMC6LdOIbIXgNwvDplA9aaY/SvV4F3YWKe
 vgPo00b+njhYtVwWGw1GQRoRZkdb6W5LcA0BDSFFm1/OmDpXg9N+frBR0 A==;
X-CSE-ConnectionGUID: f2vKHkRdRd+ryjVHO25BXA==
X-CSE-MsgGUID: CxKT4OxYTmy0uGmzezKyfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63280770"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63280770"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:45:40 -0700
X-CSE-ConnectionGUID: Ucc0EPCqSiCBkTSZJ6NNCw==
X-CSE-MsgGUID: M6DulzDDRF26JDQ0xCqgcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183995303"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.221.165])
 by orviesa007.jf.intel.com with SMTP; 23 Oct 2025 01:45:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 23 Oct 2025 11:45:29 +0300
Date: Thu, 23 Oct 2025 11:45:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023033009.90-3-kernel@airkyi.com>
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

On Thu, Oct 23, 2025 at 11:30:02AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Several USB-C controller drivers have already implemented the DP HPD
> bridge function provided by aux-hpd-bridge.c, but there are still
> some USB-C controller driver that have not yet implemented it.
> 
> This patch implements a generic DP HPD bridge based on aux-hpd-bridge.c,
> so that other USB-C controller drivers don't need to implement it again.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig                | 11 ++++
>  drivers/gpu/drm/bridge/Makefile               |  1 +
>  .../gpu/drm/bridge/aux-hpd-typec-dp-bridge.c  | 51 +++++++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a..9f31540d3ad8 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -33,6 +33,17 @@ config DRM_AUX_HPD_BRIDGE
>  menu "Display Interface Bridges"
>  	depends on DRM && DRM_BRIDGE
>  
> +config DRM_AUX_TYPEC_DP_HPD_BRIDGE
> +	tristate "TypeC DP HPD bridge"
> +	depends on DRM_BRIDGE && OF && TYPEC
> +	select DRM_AUX_HPD_BRIDGE
> +	help
> +	  Simple USB Type-C DP bridge that terminates the bridge chain and
> +	  provides HPD support.
> +
> +	  If the USB-C controller driver has not implemented this and you need
> +	  the DP HPD support, say "Y" or "m" here.

You don't need to depend on DRM_BRIDGE separately, but do you really
need a separate module for this in the first place?

>  config DRM_CHIPONE_ICN6211
>  	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 245e8a27e3fc..e91736829167 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>  obj-$(CONFIG_DRM_AUX_HPD_BRIDGE) += aux-hpd-bridge.o
> +obj-$(CONFIG_DRM_AUX_TYPEC_DP_HPD_BRIDGE) += aux-hpd-typec-dp-bridge.o

Instead, why not just make that a part of aux-hpd-bridge
conditionally:

ifneq ($(CONFIG_TYPEC),)
        aux-hpd-bridge-y        += aux-hpd-typec-dp-bridge.o
endif


thanks,

-- 
heikki
