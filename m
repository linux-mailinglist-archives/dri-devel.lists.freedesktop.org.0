Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93602CA3DC8
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 14:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB20C10E982;
	Thu,  4 Dec 2025 13:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxLF/LHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B9A10E982
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 13:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764855738; x=1796391738;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=30wP0TX1VK3UbNCz19GHE9bCOLKLD8pr5Gzk2VuxvGw=;
 b=HxLF/LHYASkGmnZQZDyc5uH8qN+Ofewxv1XfIr54KDd/jMd1MsM3LyQL
 qcAQrs21KG0VdJyJRtO7zd2/r/qG7Nx3k4kdCQZzUwO5ZCsfB472ropFZ
 wJXTETcxt35p9uIk9cHVto79QUZsg0zT5/Af2NfY6rB6n2HriVHaHgd9Y
 LR+Gs4oo2fq3vhdtR29SmUoTMHCcaLKwuXIrgmbD5KhFHcLS3XDTNLFIY
 B15pUYD8gBxERkc5OAyd18jcQid4xBaFu8eFqhQs2ospe7+YWfDpGng9r
 RGJzGoZU4xdgOnoMNWB2y+ufEdCbK+kx4v5yMBrJI8DKf1UlCsBj4N5dU A==;
X-CSE-ConnectionGUID: OSCd75gYTSKlVf4OC+5FaA==
X-CSE-MsgGUID: 3FbeRjgCT2G2FEru0rqjAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66911020"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66911020"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:42:18 -0800
X-CSE-ConnectionGUID: DxyftxzaSmuGPOccXE4iKQ==
X-CSE-MsgGUID: kBWCfuAfTk6HBNfipdewYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199164378"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.220.149])
 by orviesa003.jf.intel.com with SMTP; 04 Dec 2025 05:42:05 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 04 Dec 2025 15:41:56 +0200
Date: Thu, 4 Dec 2025 15:41:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [RESEND PATCH v11 02/11] usb: typec: Export typec bus and typec
 altmode device type
Message-ID: <aTGPpInIEzFhftf4@kuha>
References: <20251204063109.104-1-kernel@airkyi.com>
 <20251204063109.104-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204063109.104-3-kernel@airkyi.com>
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

Thu, Dec 04, 2025 at 02:31:00PM +0800, Chaoyi Chen kirjoitti:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The DRM may want to register a notifier on the typec bus to know when
> a typec altmode device is added, and distinguish between different
> types of typec altmode device.
> 
> Export these things.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v11:
> - Also export typec bus.
> - Add more detailed comments.
> 
> (no changes since v9)
> 
>  drivers/usb/typec/bus.c           |  1 +
>  drivers/usb/typec/bus.h           | 10 ----------
>  drivers/usb/typec/class.c         |  3 +++
>  include/linux/usb/typec.h         |  3 +++
>  include/linux/usb/typec_altmode.h |  8 ++++++++
>  5 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index a33da7f458a5..e84b134a3381 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -569,3 +569,4 @@ const struct bus_type typec_bus = {
>  	.probe = typec_probe,
>  	.remove = typec_remove,
>  };
> +EXPORT_SYMBOL_GPL(typec_bus);
> diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
> index b58e131450d1..7df5deb1dd3a 100644
> --- a/drivers/usb/typec/bus.h
> +++ b/drivers/usb/typec/bus.h
> @@ -5,7 +5,6 @@
>  
>  #include <linux/usb/typec_altmode.h>
>  
> -struct bus_type;
>  struct typec_mux;
>  struct typec_retimer;
>  
> @@ -28,13 +27,4 @@ struct altmode {
>  
>  #define to_altmode(d) container_of(d, struct altmode, adev)
>  
> -extern const struct bus_type typec_bus;
> -extern const struct device_type typec_port_altmode_dev_type;
> -extern const struct device_type typec_plug_altmode_dev_type;
> -extern const struct device_type typec_partner_altmode_dev_type;
> -
> -#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
> -#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
> -#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
> -
>  #endif /* __USB_TYPEC_ALTMODE_H__ */
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index d6b88317f8a4..c4ff4310ff58 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -537,18 +537,21 @@ const struct device_type typec_port_altmode_dev_type = {
>  	.groups = typec_altmode_groups,
>  	.release = typec_altmode_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_port_altmode_dev_type);
>  
>  const struct device_type typec_plug_altmode_dev_type = {
>  	.name = "typec_plug_alternate_mode",
>  	.groups = typec_altmode_groups,
>  	.release = typec_altmode_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_plug_altmode_dev_type);
>  
>  const struct device_type typec_partner_altmode_dev_type = {
>  	.name = "typec_partner_alternate_mode",
>  	.groups = typec_altmode_groups,
>  	.release = typec_altmode_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_partner_altmode_dev_type);
>  
>  static struct typec_altmode *
>  typec_register_altmode(struct device *parent,
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 309251572e2e..c6fd46902fce 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -20,12 +20,15 @@ struct typec_port;
>  struct typec_altmode_ops;
>  struct typec_cable_ops;
>  
> +struct bus_type;
>  struct fwnode_handle;
>  struct device;
>  
>  struct usb_power_delivery;
>  struct usb_power_delivery_desc;
>  
> +extern const struct bus_type typec_bus;
> +
>  enum typec_port_type {
>  	TYPEC_PORT_SRC,
>  	TYPEC_PORT_SNK,
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index f7db3bd4c90e..9197a4637a93 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -9,6 +9,14 @@
>  
>  #define MODE_DISCOVERY_MAX	6
>  
> +extern const struct device_type typec_port_altmode_dev_type;
> +extern const struct device_type typec_plug_altmode_dev_type;
> +extern const struct device_type typec_partner_altmode_dev_type;
> +
> +#define is_typec_port_altmode(dev) ((dev)->type == &typec_port_altmode_dev_type)
> +#define is_typec_plug_altmode(dev) ((dev)->type == &typec_plug_altmode_dev_type)
> +#define is_typec_partner_altmode(dev) ((dev)->type == &typec_partner_altmode_dev_type)
> +
>  struct typec_altmode_ops;
>  
>  /**
> -- 
> 2.51.1

-- 
heikki
