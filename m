Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9262C00C7E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 13:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E9910E3D6;
	Thu, 23 Oct 2025 11:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOtyPfxp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC0210E3D6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761219402; x=1792755402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f2YqjnkzS7XblEQQzbQJuEEnfM++QTqRRHZndsLcws0=;
 b=EOtyPfxpBfg6Pohg/Oojgqne1KRQmVhUfYF6itMUF4GQzxrriGJCUQ7E
 pRxOKGYF1OcsgxShPVJ9nzrNGWvQ9GU733iLnxjpAUpBML7vttko5fEIY
 m5vUIHijA+3kVU6iocMmncjz8zfg4e6rmB5VFgiZimUSr6mGMyx2tibCt
 wgZEZBsK53jAFv7f9AXAlSZYjdB0s9MhKT9QWZEfZRyIE9ccNSpq69wmp
 8ftMe9Xvwrjv9fQmqviAUKR7pM2abT9IUprg3PgqJ35SW6Lmx9B2LZfGR
 yoMNqY2vbqMlCOiMShIh+GhReaF36fLIRIxOCJMM8nV+ciM7FhyEQ7i3q A==;
X-CSE-ConnectionGUID: FqN6Jo3uSCyg6kb/zvR7ow==
X-CSE-MsgGUID: 2qnVGcCLRgOR7/mFzWc0DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63089379"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63089379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:36:42 -0700
X-CSE-ConnectionGUID: 1TqIq3snTL+ZCxmH6TFP0g==
X-CSE-MsgGUID: z60IloovRZGSCzaw8UIrVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="189267971"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.221.165])
 by orviesa005.jf.intel.com with SMTP; 23 Oct 2025 04:36:31 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Thu, 23 Oct 2025 14:36:30 +0300
Date: Thu, 23 Oct 2025 14:36:30 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
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
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/9] usb: typec: Add notifier functions
Message-ID: <aPoTPr28cBzwbH0T@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
 <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com>
 <aPn4-S7upPOOtenr@kuha.fi.intel.com>
 <9c52db41-14f3-41a8-9423-3efe604361aa@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c52db41-14f3-41a8-9423-3efe604361aa@rock-chips.com>
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


> Thank you for your detailed explanation. I noticed that there is a
> device_register() action in typec_register_altmode(), so we can just take
> advantage of this.
> 
> Another thing is that we need to distinguish between different devices in the
> notifier callback, as
> typec_register_altmode()/typec_register_partner()/typec_register_plug()/typec_register_cable()
> may all register devices. Since the data passed in bus_notify() is struct
> device *dev, I think we can distinguish them through `dev->type.name`? We may
> already have such names, "typec_alternate_mode", "typec_partner", "typec_plug"
> in class.c . And then extract these names as macros and put them in the typec
> header file.

You don't need to worry about that. Only partner altmodes are bind to
the bus. The device you see in the notifier will always be an altmode.

But in general, if you need to identify the device type, then
you use the device type itself, not the name of the type. It would
require that the device types are exported, but as said, you don't
need to worry about that in this case.

thanks,

-- 
heikki
