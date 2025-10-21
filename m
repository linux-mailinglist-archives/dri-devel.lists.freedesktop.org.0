Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50074BF55AA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 10:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CCA10E196;
	Tue, 21 Oct 2025 08:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeGO1Ufi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188BB10E196
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761036537; x=1792572537;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ixN0SnuQ8N2jtGJB1Dvgz9zJy2AHG8oUKIXx/yt/S8w=;
 b=aeGO1UfizO148v/f+76FotvAGhQrrCYY/x9BmoQxP+A2pkxG7iUmtZkz
 Iyna+f4PRrKpSWdiOsCCw3DQikrZhazqHP06b7HwH4FPdp5Gc9GIEwW81
 rhay9GR8u85mzEdVMOZGfyp7oOSIp5Lxq2h1EhC7Z+Qio6ROUcrRTz1bT
 qrTSDT64RGzM4u3T3tTx10SYX4wytVdiPDP0V7zCXctc1H4YqXzLrViiL
 MEK7fV8TZ1N8h5w8Bc5Nf1lGkEeA33SLG17mv9hlDOgnLHYrnTPn+QpOB
 Fi8OSNgkNYpy4XqELmlq3UG9n3LM6kNCrEL8FzkFpK+pMn0Lqx3tpLvuT Q==;
X-CSE-ConnectionGUID: bBZ8bTbORfOC5zIt/VG7OA==
X-CSE-MsgGUID: KaduynKRTumhvK+lmBPj+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63055507"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="63055507"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 01:48:56 -0700
X-CSE-ConnectionGUID: eCD/H1/RSIKfOQZXnX6Vww==
X-CSE-MsgGUID: 5oEWrWiFR5aYJfjpPgNG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="183099996"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.220.224])
 by orviesa009.jf.intel.com with SMTP; 21 Oct 2025 01:48:47 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 21 Oct 2025 11:48:45 +0300
Date: Tue, 21 Oct 2025 11:48:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 1/8] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <aPdI7Vb_djrfCfbT@kuha.fi.intel.com>
References: <20251016022741.91-1-kernel@airkyi.com>
 <20251016022741.91-2-kernel@airkyi.com>
 <aPYImGmesrZWwyqh@kuha.fi.intel.com>
 <954a67d1-1759-4e18-8eef-3fa14fb3cef5@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <954a67d1-1759-4e18-8eef-3fa14fb3cef5@rock-chips.com>
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

On Mon, Oct 20, 2025 at 07:07:46PM +0800, Chaoyi Chen wrote:
> Hi Heikki,
> 
> On 10/20/2025 6:02 PM, Heikki Krogerus wrote:
> > On Thu, Oct 16, 2025 at 10:27:34AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Add default DRM AUX HPD bridge device when register DisplayPort
> > > altmode. That makes it redundant for each Type-C driver to implement
> > > a similar registration process in embedded scenarios.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > > 
> > > Changes in v6:
> > > - Fix depend in Kconfig.
> > > 
> > > Changes in v5:
> > > - Remove the calls related to `drm_aux_hpd_bridge_notify()`.
> > > - Place the helper functions in the same compilation unit.
> > > - Add more comments about parent device.
> > > 
> > >   drivers/usb/typec/Kconfig         |  2 ++
> > >   drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
> > >   include/linux/usb/typec_altmode.h |  2 ++
> > >   3 files changed, 30 insertions(+)
> > > 
> > > diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> > > index 2f80c2792dbd..a6730fbb576b 100644
> > > --- a/drivers/usb/typec/Kconfig
> > > +++ b/drivers/usb/typec/Kconfig
> > > @@ -2,6 +2,8 @@
> > >   menuconfig TYPEC
> > >   	tristate "USB Type-C Support"
> > > +	depends on DRM || DRM=n
> > > +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> > This is wrong. DRM should not dictate how this entire subsystem core
> > is configured. The dependency needs to be on the DRM bridge side.
> > 
> > You can for example use the bus notification there to see when a new
> > alternate mode is being registered, or use some other notification
> > mechanism.
> 
> Is it a good idea to implement notification functions like
> drivers/usb/core/notify.c in TCPM, and then let other subsystems (such as DRM)
> listen to these notifications?

Don't limit this to tcpm only. I would suggest something similar what
we have for usb bus: drivers/usb/core/notify.c

So that, but for the typec bus. Then in DRM bridge code you just use
typec_register/unregister_notify().

thanks,

-- 
heikki
