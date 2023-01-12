Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6766732F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 14:31:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B630710E8E2;
	Thu, 12 Jan 2023 13:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F80410E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673530288; x=1705066288;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uYSnfwlZL92wWAodi10EOhlyNvvhBq3li5KZMp9+M7s=;
 b=bRbL+JlW0TC9SPAakqvGfuVJvL1bLHQjBuAVrM/l2qmniTJOzAM4skPR
 JWYvleEZYwvmWYfdWWoDf4MXisdNQ5u1uK6X84cc2IjIQ7sufm1AJIeXv
 YViL3BGQqxQnmAMqQqZkw6JYgL7FsuOcUCRcT385UD57Gez3kuf+yk2Gj
 VfhLWS0ZpnjAJX2fM7P3Zc+0Hz9pfVDeqVk7p3ioORyKkORoE3QhkjMgn
 9mCdh1FXWWrHapGgCrcR79rTdr0M3wlKZK1vHqKlTSZTVUCzI1N8NrfQX
 VBxhrNBZhnthhX2pouxvY47Y4EViGOJjvIoKN/5rDV1Zl9Ovmh+Um9pEg Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="311527062"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="311527062"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 05:31:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10587"; a="800210271"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; d="scan'208";a="800210271"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 12 Jan 2023 05:31:17 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 12 Jan 2023 15:31:16 +0200
Date: Thu, 12 Jan 2023 15:31:16 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v10 2/9] platform/chrome: cros_ec_typec: Purge blocking
 switch devlinks
Message-ID: <Y8ALpFR2LDLWNAjj@kuha.fi.intel.com>
References: <20230112042104.4107253-1-treapking@chromium.org>
 <20230112042104.4107253-3-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112042104.4107253-3-treapking@chromium.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 12:20:57PM +0800, Pin-yen Lin wrote:
> From: Prashant Malani <pmalani@chromium.org>
> 
> When using OF graph, the fw_devlink code will create links between the
> individual port driver (cros-ec-typec here) and the parent device for
> a Type-C switch (like mode-switch). Since the mode-switch will in turn
> have the usb-c-connector (i.e the child of the port driver) as a
> supplier, fw_devlink will not be able to resolve the cyclic dependency
> correctly.
> 
> As a result, the mode-switch driver probe() never runs, so mode-switches
> are never registered. Because of that, the port driver probe constantly
> fails with -EPROBE_DEFER, because the Type-C connector class requires all
> switch devices to be registered prior to port registration.
> 
> To break this deadlock and allow the mode-switch registration to occur,
> purge all the usb-c-connector nodes' absent suppliers. This eliminates
> the connector as a supplier for a switch and allows it to be probed.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

FWIW:

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v10:
> - Collected Reviewed-by and Tested-by tags
> 
> Changes in v7:
> - Fix the long comment lines
> 
> Changes in v6:
> - New in v6
> 
>  drivers/platform/chrome/cros_ec_typec.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 2a7ff14dc37e..302474a647cc 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -382,6 +382,16 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * OF graph may have set up some device links with switches,
> +	 * since connectors have their own compatible. Purge these
> +	 * to avoid a deadlock in switch probe (the switch mistakenly
> +	 * assumes the connector is a supplier).
> +	 */
> +	if (dev_of_node(dev))
> +		device_for_each_child_node(dev, fwnode)
> +			fw_devlink_purge_absent_suppliers(fwnode);
> +
>  	/* DT uses "reg" to specify port number. */
>  	port_prop = dev->of_node ? "reg" : "port-number";
>  	device_for_each_child_node(dev, fwnode) {
> -- 
> 2.39.0.314.g84b9a713c41-goog

-- 
heikki
