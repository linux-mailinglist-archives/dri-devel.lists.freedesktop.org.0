Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C97CA7405
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF6A10EAB5;
	Fri,  5 Dec 2025 10:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GprVSnRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D8E10EAB5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 10:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764931825; x=1796467825;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MQ7Fqj4UUvktQ5BTeTaY30CoU5H4xWYgdxzNUoMv4yI=;
 b=GprVSnRzlRWNpQkJQiY6sO3Gechf0aulerrPEvoQj38hT3uOYt8wjuVV
 SO/6CvXPko/CHK8pRu0sBdPeminZysJ3tvnnJnA1osMDlOC614ojsJiQI
 IgfLt89WPBt6juuuPiQP7acbsogapx3Xe1LBUw825JyrEBgBOZVrMdBNT
 j8MVFLPrUgAVn1p0IfGnf2SdgbQlEP0CWEoOsW5gaWuMofg//hcIkQQm5
 TwtTrDBXFWMld7rZ9nbWg4Wp7xF9X52h24KMcEL7NyBbxwB9xiWL5P2yJ
 QOK+4XzUEaTk4fCK9PRN9PrYY8b68NDiAyX2DAfsE9Oom7/qyqCcQNLnv w==;
X-CSE-ConnectionGUID: DzGP1GyIRdiduo0I95XI2w==
X-CSE-MsgGUID: Io3itW1QSemBobr3BgJ+Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66155523"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66155523"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 02:50:24 -0800
X-CSE-ConnectionGUID: BZQBeMhuT9mzC1dYoeMo6g==
X-CSE-MsgGUID: HOtjpdEDROWYFpjmc15VMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="218626523"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.220.222])
 by fmviesa002.fm.intel.com with SMTP; 05 Dec 2025 02:50:13 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 05 Dec 2025 12:50:04 +0200
Date: Fri, 5 Dec 2025 12:50:04 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [RESEND PATCH v11 03/11] drm/bridge: Implement generic USB
 Type-C DP HPD bridge
Message-ID: <aTK4n8WnQm_FvpW3@kuha>
References: <20251204063109.104-1-kernel@airkyi.com>
 <20251204063109.104-4-kernel@airkyi.com> <aTGPaJmwd7uHfrnV@kuha>
 <84f06c0f-3ec7-4a43-bba2-1979c3a07127@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84f06c0f-3ec7-4a43-bba2-1979c3a07127@rock-chips.com>
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

Fri, Dec 05, 2025 at 10:26:20AM +0800, Chaoyi Chen kirjoitti:
> Hi Heikki,
> 
> On 12/4/2025 9:40 PM, Heikki Krogerus wrote:
> > Hi,
> > 
> > I don't know what's going on here - this series is the 12th?
> > In any case, you need to fix this..
> > 
> 
> It is 11th. Patch 1 was missing the Signed-off-by line, so I've resent
> it. Sorry for the confusion.

That's a change too, i.e. this is v12.

> >> diff --git a/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> >> new file mode 100644
> >> index 000000000000..94be3d5f69e9
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/bridge/aux-hpd-typec-dp-bridge.c
> >> @@ -0,0 +1,51 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +#include <linux/of.h>
> >> +#include <linux/usb/typec_altmode.h>
> >> +#include <linux/usb/typec_dp.h>
> >> +
> >> +#include <drm/bridge/aux-bridge.h>
> >> +
> >> +static int drm_typec_bus_event(struct notifier_block *nb,
> >> +			       unsigned long action, void *data)
> >> +{
> >> +	struct device *dev = (struct device *)data;
> >> +	struct typec_altmode *alt = to_typec_altmode(dev);
> >> +
> >> +	if (action != BUS_NOTIFY_ADD_DEVICE)
> >> +		goto done;
> >> +
> >> +	if (is_typec_partner_altmode(&alt->dev) || alt->svid != USB_TYPEC_DP_SID)
> >> +		goto done;
> > 
> > That's still not enough because of the plug altmodes. You need to
> > check that it's a port altmode:
> > 
> >         if (is_typec_port_altmode(&alt->dev) && alt->svid == USB_TYPEC_DP_SID)
> >         	drm_dp_hpd_bridge_register(alt->dev.parent->parent,
> >         				   to_of_node(alt->dev.parent->fwnode));
> >
> 
> Oh, it is. Will fix in v12. Thank you.

v13. Don't forget to update changelog.

thanks,

-- 
heikki
