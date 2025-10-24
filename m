Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CEDC04F89
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 10:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1205C10E9F3;
	Fri, 24 Oct 2025 08:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGOe4dR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDB710E9F3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761293295; x=1792829295;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iVIHEI/6GYiyKQtjDs+G9MH3NzfvOwU3yM+TuMzlGF8=;
 b=hGOe4dR/6u7K6DA+1Aj7AS1Ubv13iH5Mw7b8Su8pWbDJfCW0IMKrvIWJ
 qkJpyniQe354a9pM5VTYzoRs5/0L++cKYekiDm1UjKP7qdqEflCbAW7MZ
 SlSjZ8dpLEXqoDhxy6X4XmZtmU7k//ihIvsngvfbLgsYcrtvNxpHhi5f1
 XOnyee8MpPhfpphRYGWz8Jx2x+ls6UPmaYAfI0b12sI4T6CcVM4sYrcJG
 woLo2Ebc3moptDcNYyOuVrAhnAnf2j2VzSVSyQyvJeBmqP2p4wr4Rkj7V
 RZiGEMUeqkdM/kcED9EboAB/+9ijAIgkTdbEjnHWGNvPpwxxcfhAG5jf4 w==;
X-CSE-ConnectionGUID: pjYQiKPnST63ePDHJQeVdQ==
X-CSE-MsgGUID: TkNPIGZdSRqECy0dpayWmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63566556"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="63566556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:08:15 -0700
X-CSE-ConnectionGUID: ShAhcC5rRm+Zk2meUFiqQQ==
X-CSE-MsgGUID: Y+ylwr1ITe6V3fw6sAb20w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="221572594"
Received: from mjruhl-desk.amr.corp.intel.com (HELO kuha.fi.intel.com)
 ([10.124.221.255])
 by orviesa001.jf.intel.com with SMTP; 24 Oct 2025 01:07:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 24 Oct 2025 11:07:56 +0300
Date: Fri, 24 Oct 2025 11:07:56 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <aPsz3PvZPgXdvM4E@kuha.fi.intel.com>
References: <20251023033009.90-1-kernel@airkyi.com>
 <20251023033009.90-2-kernel@airkyi.com>
 <aPni4AeDaem_rfZH@kuha.fi.intel.com>
 <aPnvoSRJefwDlpNO@kuha.fi.intel.com>
 <aPn4-S7upPOOtenr@kuha.fi.intel.com>
 <3a24bd7f-c247-4541-8cf5-c1e66e2af5a0@rock-chips.com>
 <aPsuLREPS_FEV3DS@kuha.fi.intel.com>
 <4fddba9a-b073-4bca-bd13-64a415f4bc47@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4fddba9a-b073-4bca-bd13-64a415f4bc47@rock-chips.com>
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

On Fri, Oct 24, 2025 at 03:59:50PM +0800, Chaoyi Chen wrote:
> Hi Heikki,
> 
> On 10/24/2025 3:43 PM, Heikki Krogerus wrote:
> > > I noticed the following statement in typec_register_altmode():
> > > 
> > > ```
> > > 
> > >      /* The partners are bind to drivers */
> > >      if (is_typec_partner(parent))
> > >          alt->adev.dev.bus = &typec_bus;
> > > 
> > > ```
> > > 
> > > If the condition is not met, the bus will not be set, which means bus_notify()
> > > won't be able to take effect. Did I miss something?
> > Right, that would be the condition that I was talking about. Only
> > partner altmodes are used in the bus.
> > 
> > Hold on! Do you need the port altmode instead of the partner altmode?
> > If that's the case, then we can't use the bus notifier. So we'll need
> > the separate notifier chain after all.
> 
> Yes, we need port altmode.  The partner altmode device appears too late for
> DRM device, as it only shows up after the corresponding DP device is inserted.

Got it. So just move the declaration of the typec_notify_event() to
drivers/usb/typec/bus.h and this patch is OK by me.

Sorry again about the misunderstanding.

thanks,

-- 
heikki
