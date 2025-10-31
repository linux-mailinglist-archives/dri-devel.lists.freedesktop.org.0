Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F4BC2557D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365A710E22E;
	Fri, 31 Oct 2025 13:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4EWlK+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A449110EBBC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761918559; x=1793454559;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HYOEnKzDkgpEufqlLglR4PKxYUcxwU5/7H2j5fZg/Vg=;
 b=R4EWlK+z4e6am9QTFBTHWmljvZRNduqev2hYPHtKPVLf9PQ6REo76Um3
 wp7DB74GXzVEwBU4zTQ7QcBxlyKObf9xy3I5KilbID5JX4rVQIZzsu9HH
 E31vP6VPKqonZ3Taai+t7MSo67aO/KasomoXdOM8YnNTqjYIIKcyhBO4l
 398aOaAMEf2noBvfNAhqwNQp4FJuCll79HliXusMnusxS8xQxflggsn5b
 XkyPBr50QHfFSe4B0ey4DEy7LbZ+WGdDpX75aTkKp5ZDEkbVugCzvvQxM
 LvkkuseyyKTrSP2Z/Z3kwoFo8YLCj23z3Kcr+1Lf8RxwUKp4nN531XQnY Q==;
X-CSE-ConnectionGUID: YEa0GLg9REapRmzX8JSSxQ==
X-CSE-MsgGUID: NZzHV/FATairCQV+2l/UNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67917082"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67917082"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:49:19 -0700
X-CSE-ConnectionGUID: 7+2Rt3wtTpGrCunfhDOadg==
X-CSE-MsgGUID: THGSvAIfTTaI5GaWq7/fJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185512675"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.81])
 by orviesa010.jf.intel.com with SMTP; 31 Oct 2025 06:49:08 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 31 Oct 2025 15:49:06 +0200
Date: Fri, 31 Oct 2025 15:49:06 +0200
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
Subject: Re: [PATCH v8 02/10] usb: typec: Export all typec device types
Message-ID: <aQS-UtR7JGyXKmTB@kuha.fi.intel.com>
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029071435.88-3-kernel@airkyi.com>
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

Wed, Oct 29, 2025 at 03:14:27PM +0800, Chaoyi Chen kirjoitti:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Export all typec device types for identification.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/class.c |  4 ++++
>  drivers/usb/typec/class.h | 10 ----------
>  include/linux/usb/typec.h | 10 ++++++++++
>  3 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 51e971bc68d1..04b55f066b06 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -793,6 +793,7 @@ const struct device_type typec_partner_dev_type = {
>  	.groups = typec_partner_groups,
>  	.release = typec_partner_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_partner_dev_type);
>  
>  static void typec_partner_link_device(struct typec_partner *partner, struct device *dev)
>  {
> @@ -1147,6 +1148,7 @@ const struct device_type typec_plug_dev_type = {
>  	.groups = typec_plug_groups,
>  	.release = typec_plug_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_plug_dev_type);
>  
>  /**
>   * typec_plug_set_num_altmodes - Set the number of available plug altmodes
> @@ -1295,6 +1297,7 @@ const struct device_type typec_cable_dev_type = {
>  	.groups = typec_cable_groups,
>  	.release = typec_cable_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_cable_dev_type);
>  
>  /**
>   * typec_cable_get - Get a reference to the USB Type-C cable
> @@ -2034,6 +2037,7 @@ const struct device_type typec_port_dev_type = {
>  	.uevent = typec_uevent,
>  	.release = typec_release,
>  };
> +EXPORT_SYMBOL_GPL(typec_port_dev_type);
>  
>  /* --------------------------------------- */
>  /* Driver callbacks to report role updates */
> diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
> index db2fe96c48ff..f04f6987bed8 100644
> --- a/drivers/usb/typec/class.h
> +++ b/drivers/usb/typec/class.h
> @@ -87,16 +87,6 @@ struct typec_port {
>  #define to_typec_cable(_dev_) container_of(_dev_, struct typec_cable, dev)
>  #define to_typec_partner(_dev_) container_of(_dev_, struct typec_partner, dev)
>  
> -extern const struct device_type typec_partner_dev_type;
> -extern const struct device_type typec_cable_dev_type;
> -extern const struct device_type typec_plug_dev_type;
> -extern const struct device_type typec_port_dev_type;
> -
> -#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
> -#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
> -#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
> -#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
> -
>  extern const struct class typec_mux_class;
>  extern const struct class retimer_class;
>  extern const struct class typec_class;
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 309251572e2e..02fed8293415 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -56,6 +56,16 @@ enum typec_role {
>  	TYPEC_SOURCE,
>  };
>  
> +extern const struct device_type typec_partner_dev_type;
> +extern const struct device_type typec_cable_dev_type;
> +extern const struct device_type typec_plug_dev_type;
> +extern const struct device_type typec_port_dev_type;
> +
> +#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
> +#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
> +#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
> +#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
> +
>  static inline int is_sink(enum typec_role role)
>  {
>  	return role == TYPEC_SINK;
> -- 
> 2.49.0

-- 
heikki
