Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41AAC05086
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 10:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAC210E096;
	Fri, 24 Oct 2025 08:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OapFwaJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D02310E096
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761294316; x=1792830316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Su77VAXqOYKI/uPo+vnRq2iX0IBZ8Qp0155copD2Rp0=;
 b=OapFwaJCyjD6VzCzcEtb+DOMGZC8CfgeKmqm/r/Opw3ob5y7dQuMhI8Q
 u6QmKYql8O57MOXjL+ejS6FrOPqTNYou3dzxyrA61YHXmJ3tiNJuxUaIu
 ynanICU+4apVqx9s6FN2AeESsERlr1eNc3XKCbbEg+S/9ABK+O+JViBDn
 +a6zAP0Nwh/CFlN5VCPxxNNiaRqEgxwnM8ImoOR8Q6edfQHNkR5icngB1
 2P7Ev3L76yiCXD6z+ewFAa0t5H52Fw+1UhKnwaXI39XrajmP19IJRizwg
 bV31UKxSMfvHREZk4DbCkO5VZyHvBdp4rMK6v1nB/5NBsXerDo6Mb+kDk Q==;
X-CSE-ConnectionGUID: ibGdwircQBunwUawqfTD5g==
X-CSE-MsgGUID: ttAHdDswSuylggsmRBygYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63177825"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="63177825"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:25:16 -0700
X-CSE-ConnectionGUID: zSEWs0AsRK2pZW8DgxM5Gg==
X-CSE-MsgGUID: 7AQ1HnpnQ3CYhcbzXYq0kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="188669001"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.221.255])
 by orviesa004.jf.intel.com with SMTP; 24 Oct 2025 01:25:05 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 24 Oct 2025 11:25:04 +0300
Date: Fri, 24 Oct 2025 11:25:04 +0300
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
Subject: Re: [PATCH v7 2/9] drm/bridge: Implement generic USB Type-C DP HPD
 bridge
Message-ID: <aPs34Co-8UoQWuim@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-3-kernel@airkyi.com>
 <aPnrKFWTvpuRTyhI@kuha.fi.intel.com>
 <14b8ac71-489b-4192-92d6-5f228ff3881d@rock-chips.com>
 <aPoZhBdc1M6Qgfae@kuha.fi.intel.com>
 <6f769567-b383-4c79-b441-3dd84f21cdae@rock-chips.com>
 <aPsse5qVL84XOj8w@kuha.fi.intel.com>
 <9ec2189e-ec36-4cd8-9713-beb490b8297c@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ec2189e-ec36-4cd8-9713-beb490b8297c@rock-chips.com>
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

On Fri, Oct 24, 2025 at 04:12:47PM +0800, Chaoyi Chen wrote:
> On 10/24/2025 3:36 PM, Heikki Krogerus wrote:
> 
> > > Another thing is that CONFIG_DRM_AUX_HPD_BRIDGE originally needed to be
> > > selected by other modules. With this change, we also need to expose it in
> > > Kconfig.
> > Sorry, I don't understand the problem here? What do you need to expose
> > in Kconfig?
> 
> config DRM_AUX_HPD_BRIDGE
>     tristate
>     depends on DRM_BRIDGE && OF
>     select AUXILIARY_BUS
>     help
>       Simple bridge that terminates the bridge chain and provides HPD
>       support.
> 
> The tristate here is empty, so now it can only be selected by some TypeC
> controller drivers. I think it's not a big deal, just expose this item.

Ah, got it.

thanks,

-- 
heikki
