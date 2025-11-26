Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A18C89073
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A3D10E584;
	Wed, 26 Nov 2025 09:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSys7Fau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AFD10E587
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764150194; x=1795686194;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CCg+lZSEq+WcXEQmJQne7xQ4oE1yxypysTDuDghy64Q=;
 b=gSys7Fauj7ok4vYIN6dzvRbxvg/YFpi+zM8Z7GzZbI2rLLajnuIjHCc/
 CuKYkfdK/t8BKo72dTs53HHeaRydsrH1qhhy3BAforCWRM3IW+7/eCkLH
 8F0n/MY5l1Fh/9/FSF9NajteszX9i7J/hDkB1IHaP96Zzt9U1sbC6Ham8
 dNnetUvCQgOZoeuwHBm2eiJN8VGCOZNWQt3Q/zlQE4UosDly1JZU+/F3H
 sGCuAiMXJcK2UvadISKGSbblCwoyIXIspLFPRg6QD/zdAJ8UTmlv1w1KG
 cTExckpHSbnHPoF6v0Ari5Xk1sDr3G1C5BRkKZg93TX+PtpZ6Emcp0rhu A==;
X-CSE-ConnectionGUID: NyyRLON+RgKVMGA1fQNK7g==
X-CSE-MsgGUID: h8KNte2KSJ2rbQ8Q69NQbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65371591"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="65371591"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:43:14 -0800
X-CSE-ConnectionGUID: B+T8YiSeRD+/P6Odm3S47w==
X-CSE-MsgGUID: B/YD/UVbQWaORjBCGIUAVA==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO kuha) ([10.124.223.25])
 by fmviesa003.fm.intel.com with SMTP; 26 Nov 2025 01:42:55 -0800
Received: by kuha (sSMTP sendmail emulation); Wed, 26 Nov 2025 11:42:43 +0200
Date: Wed, 26 Nov 2025 11:42:43 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <kernel@airkyi.com>,
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
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
Message-ID: <aSbLkwPG0dUzZvql@kuha>
References: <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com>
 <aSV_lQYJPxN7oBM-@kuha> <2025112554-uncaring-curator-642a@gregkh>
 <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com>
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

Wed, Nov 26, 2025 at 09:46:19AM +0800, Chaoyi Chen kirjoitti:
> On 11/25/2025 7:49 PM, Greg Kroah-Hartman wrote:
> >> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> >> +{
> >> +	if (is_typec_port(kobj_to_dev(kobj)->parent))
> > 
> > Why look at the parent?  Doesn't the device have a type that should show
> > this?
> > 
> > Otherwise, looks good to me.
> 
> They have same deivce type "typec_altmode_dev_type".
> The parent device has a different device type to distinguish between
> port device and partner device.

I was already wondering would it make sense to provide separate device
types for the port, and also plug, alternate modes, but I'm not sure
if that's the right thing to do.

There is a plan to register an "altmode" also for the USB4 mode,
which of course is not an alternate mode. So USB4 will definitely need a
separate device type.

So if we supply separate device types for the port, plug and partner
alternate modes, we need to supply separate device types for port, plug
and partner USB4 mode as well.

We certainly can still do that, but I'm just not sure if it makes
sense?

I'll prepare a new version for this and include a separate patch where
instead of defining separate device types for the port and plug
alternate modes I'll just supply helpers is_port_alternate_mode() and
is_plug_alternate_mode().

thanks,

-- 
heikki
