Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978CA969C2A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E6710E4E8;
	Tue,  3 Sep 2024 11:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AjcZcwAY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA28810E4E8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725363643; x=1756899643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TiMloUZtEOzhiMiKfurPxe7QoHWBPp0gKnxyea5FPRA=;
 b=AjcZcwAYeG7Kx27VpkPX9wgB1U6P7Jsv+J+0lFe+h2qMr9MdS+46PaqK
 2Hb9BwOlIi923rvLCyUCZtkFoEZYNbvOUK2GGm1P8/xof6uQc41jutj0S
 PbHbZa/LrN+TABhiHwn5ZAYvt4XNMZw9HgNsodLBWm24tAq/jrM0H4pAZ
 EMa+0VeCVWqEJbc1s1h9BhCtZvrcM2VU15aMu0dif/K6NK3aFPbPYffF3
 4o+kLvu9JaU12vkwanD47Lp1gcMXNORFbrQ5UttmgyqAfF5xTtT/9A/Kd
 xkPg4+U4VK+pcUpDHofwCY3QlLPrDaw95IV2r1Ty6DQ6TFvY7PcqLmDpd g==;
X-CSE-ConnectionGUID: Q6HpNWI5R9SytsZT7x8LeQ==
X-CSE-MsgGUID: UHmqQKnWSumIpCT7eO+Sdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27711952"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="27711952"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 04:40:43 -0700
X-CSE-ConnectionGUID: HQD9FPlFRrCFVhb6qQT2Lg==
X-CSE-MsgGUID: 02SRmlM4S3SyHIy3i8zzKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; d="scan'208";a="65389034"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by orviesa007.jf.intel.com with SMTP; 03 Sep 2024 04:40:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 14:40:32 +0300
Date: Tue, 3 Sep 2024 14:40:32 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 03/18] usb: typec: Stub out typec_switch APIs when
 CONFIG_TYPEC=n
Message-ID: <Ztb1sI2W7t5k2yT7@kuha.fi.intel.com>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-4-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901040658.157425-4-swboyd@chromium.org>
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

On Sat, Aug 31, 2024 at 09:06:41PM -0700, Stephen Boyd wrote:
> Ease driver development by adding stubs for the typec_switch APIs when
> CONFIG_TYPEC=n. Copy the same method used for the typec_mux APIs to be
> consistent.
> 
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <linux-usb@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  include/linux/usb/typec_mux.h | 43 +++++++++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
> index 2489a7857d8e..efb5ed32b813 100644
> --- a/include/linux/usb/typec_mux.h
> +++ b/include/linux/usb/typec_mux.h
> @@ -3,6 +3,7 @@
>  #ifndef __USB_TYPEC_MUX
>  #define __USB_TYPEC_MUX
>  
> +#include <linux/err.h>
>  #include <linux/property.h>
>  #include <linux/usb/typec.h>
>  
> @@ -24,16 +25,13 @@ struct typec_switch_desc {
>  	void *drvdata;
>  };
>  
> +#if IS_ENABLED(CONFIG_TYPEC)
> +
>  struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode);
>  void typec_switch_put(struct typec_switch *sw);
>  int typec_switch_set(struct typec_switch *sw,
>  		     enum typec_orientation orientation);
>  
> -static inline struct typec_switch *typec_switch_get(struct device *dev)
> -{
> -	return fwnode_typec_switch_get(dev_fwnode(dev));
> -}
> -
>  struct typec_switch_dev *
>  typec_switch_register(struct device *parent,
>  		      const struct typec_switch_desc *desc);
> @@ -42,6 +40,41 @@ void typec_switch_unregister(struct typec_switch_dev *sw);
>  void typec_switch_set_drvdata(struct typec_switch_dev *sw, void *data);
>  void *typec_switch_get_drvdata(struct typec_switch_dev *sw);
>  
> +#else
> +
> +static inline struct typec_switch *
> +fwnode_typec_switch_get(struct fwnode_handle *fwnode)
> +{
> +	return NULL;
> +}
> +static inline void typec_switch_put(struct typec_switch *sw) {}
> +static inline int typec_switch_set(struct typec_switch *sw,
> +		     enum typec_orientation orientation)
> +{
> +	return 0;
> +}
> +
> +static inline struct typec_switch_dev *
> +typec_switch_register(struct device *parent,
> +		      const struct typec_switch_desc *desc)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +static inline void typec_switch_unregister(struct typec_switch_dev *sw) {}
> +
> +static inline void typec_switch_set_drvdata(struct typec_switch_dev *sw, void *data) {}
> +static inline void *typec_switch_get_drvdata(struct typec_switch_dev *sw)
> +{
> +	return ERR_PTR(-EOPNOTSUPP);
> +}
> +
> +#endif /* CONFIG_TYPEC */
> +
> +static inline struct typec_switch *typec_switch_get(struct device *dev)
> +{
> +	return fwnode_typec_switch_get(dev_fwnode(dev));
> +}
> +
>  struct typec_mux_state {
>  	struct typec_altmode *alt;
>  	unsigned long mode;

-- 
heikki
