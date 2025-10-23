Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A6BFFCE5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E12910E8CB;
	Thu, 23 Oct 2025 08:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwW66cdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E6910E8CB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761207038; x=1792743038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X9A+e5HX8/DxioXkaxwvZdY29MB1MDYbmVYOX4ols5k=;
 b=hwW66cdGpGEEWRB/6wXpmlqGdjXAu9AYrnjpAXEGxrp6tqp+tq/zNbmx
 pMKpINnyDN0DLGbrtD8I3AopR+rPLXqpcRn9LZSj7TPFBGg0NBs2hGRCQ
 n8LPKc5Zu+KqXQvTYCmnukb7pTFHtyyErEDKTx/4AG14D61DTWXjXrWEV
 YdcrCAmoCO1fRt7LTapITXjHtaVG6YRt6KaGkj0vJTUm74mCQxdM5UJ5+
 3pMr89+2/IlCfmMw6R1r0IzwLvq8TuBPv8DTo9TkYPh0wMG34xvb4V7HI
 VfWrjEDtiLoKlEZpB/DqgF2WxvuH02UhEQz762/VlJHERDNOpEhaedrBp g==;
X-CSE-ConnectionGUID: OUElJhiQQ5CucfjBFXSvyg==
X-CSE-MsgGUID: Nn7zFXPMSU2ZO8TcVHMrqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63273570"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63273570"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:10:20 -0700
X-CSE-ConnectionGUID: U/yJ+8RYQ+2huY61DLG6tw==
X-CSE-MsgGUID: qjW+PJi/SHi+vFM/FDi4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183988336"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.221.165])
 by orviesa007.jf.intel.com with SMTP; 23 Oct 2025 01:10:09 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 23 Oct 2025 11:10:08 +0300
Date: Thu, 23 Oct 2025 11:10:08 +0300
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
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
Message-ID: <aPni4AeDaem_rfZH@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023033009.90-2-kernel@airkyi.com>
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

Hi,

> diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
> new file mode 100644
> index 000000000000..a3f1f3b3ae47
> --- /dev/null
> +++ b/include/linux/usb/typec_notify.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __USB_TYPEC_NOTIFY
> +#define __USB_TYPEC_NOTIFY
> +
> +#include <linux/notifier.h>
> +
> +enum usb_typec_event {
> +	TYPEC_ALTMODE_REGISTERED
> +};

Don't you need to know when the altmode is removed?

> +
> +int typec_register_notify(struct notifier_block *nb);
> +int typec_unregister_notify(struct notifier_block *nb);
> +
> +void typec_notify_event(unsigned long event, void *data);

Declare typec_notify_event() in drivers/usb/typec/bus.h

thanks,

-- 
heikki
