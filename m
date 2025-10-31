Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92DAC25499
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:39:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C58910E074;
	Fri, 31 Oct 2025 13:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6Ob6ym9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B2610E074
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761917997; x=1793453997;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2cVyjKey4dFxUiUnROSgPcOL0J7KqoBoYiJcjCFDf/g=;
 b=c6Ob6ym9n9gA/m1b3ZXr0SXhcqvC7gnyPvmfAGVzWXQfwsn6V1LB2/4H
 IL4i1rz7p6w+gDykz9d+RMbTv1g6l23IjyskjzM+oIugPZ1Xt8x3ENaZ5
 weAxNJwr5wS/4Lse/CA4dylqWAM84RgjLtRrFcqBCoN8VxsnLPfHgReja
 lDOu8tO5a4hG9UHzXW9Srzo9Wyx1/l2ijjZfgxUKThNQgW5jRWfXIIR3b
 IONUOolxBHZ6sD6k62Wl9lB1Xu0by/lQbx6IadSoh1ynGNuReivwgbMLK
 XlKjmD9S4OV+lx5bsGYWrJ0FQEmxsb6XvMZjNbGbptD5btUPueup/Cqsg Q==;
X-CSE-ConnectionGUID: DY0HUzatR8+ZyvR4d5U7vw==
X-CSE-MsgGUID: OMShukgETZyoKPI2W57lvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64229164"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64229164"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:39:56 -0700
X-CSE-ConnectionGUID: a3xtnYTPQP+uCyKoQ92d0Q==
X-CSE-MsgGUID: C/6GFGJvSTi0FjPfK6/uAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186115249"
Received: from jjgreens-desk20.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.81])
 by fmviesa006.fm.intel.com with SMTP; 31 Oct 2025 06:39:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 31 Oct 2025 15:39:45 +0200
Date: Fri, 31 Oct 2025 15:39:45 +0200
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
Subject: Re: [PATCH v8 01/10] usb: typec: Add notifier functions
Message-ID: <aQS8IatWiAUzBUxd@kuha.fi.intel.com>
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029071435.88-2-kernel@airkyi.com>
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
> index 000000000000..f3a7b5f5b05b
> --- /dev/null
> +++ b/include/linux/usb/typec_notify.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __USB_TYPEC_NOTIFY
> +#define __USB_TYPEC_NOTIFY
> +
> +#include <linux/notifier.h>

Replace that include with a forward declaration:

struct notifier_block;

> +enum usb_typec_event {
> +	TYPEC_ALTMODE_REGISTERED,
> +	TYPEC_ALTMODE_UNREGISTERED,
> +};
> +
> +int typec_altmode_register_notify(struct notifier_block *nb);
> +int typec_altmode_unregister_notify(struct notifier_block *nb);
> +
> +#endif /* __USB_TYPEC_NOTIFY */

I don't see any need for a separate header file for this. Intoduce
those in typec_altmode.h.

thanks,

-- 
heikki
