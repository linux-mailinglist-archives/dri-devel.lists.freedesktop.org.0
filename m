Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7776AC81969
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 17:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA52410E2FF;
	Mon, 24 Nov 2025 16:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g+47ol/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D1510E2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 16:33:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E38D60173;
 Mon, 24 Nov 2025 16:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D80C116C6;
 Mon, 24 Nov 2025 16:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1764002010;
 bh=b0HsFdIr9UYeg1Jbb+ezqHtOK4AZhADd9B70yMMGZFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g+47ol/xVPKvHq8mO+c2fpgR8DW18YAaKTmijBBG2VtkLGfdTcX8n57jEGZgYFtXt
 DF01gZjsrt73ZFaL90qrJ9go9zBaa62onSiMzWQEv3i/waUjE3nOD4/TVDH9cmjl4K
 53oeGgUWsOdxH3qnIhbrSMDif3kOexD/8BLXzSs0=
Date: Mon, 24 Nov 2025 17:33:27 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
Message-ID: <2025112448-brush-porcupine-c851@gregkh>
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
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

On Mon, Nov 24, 2025 at 04:05:53PM +0800, Chaoyi Chen wrote:
> Hi Greg,
> 
> On 11/24/2025 3:10 PM, Greg Kroah-Hartman wrote:
> 
> > On Mon, Nov 24, 2025 at 09:40:03AM +0800, Chaoyi Chen wrote:
> > > Hi Greg,
> > > 
> > > On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
> > > > On Thu, Nov 20, 2025 at 10:23:33AM +0800, Chaoyi Chen wrote:
> > > > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > > > 
> > > > > Some other part of kernel may want to know the event of typec bus.
> > > > Be specific, WHAT part of the kernel will need to know this?
> > > For now, it is DRM.
> > Then say this.
> 
> Okay, please refer to the discussion below.
> 
> > 
> > > > And why a new notifier, why not just use the existing notifiers that you
> > > > already have?  And what is this going to be used for?
> > > We have discussed this before, but the current bus notifier cannot achieve the expected notification [0].
> > > 
> > > [0] https://lore.kernel.org/all/aPsuLREPS_FEV3DS@kuha.fi.intel.com/
> > Then you need to document the heck out of this in the changelog text.
> > But I'm still not quite understanding why the bus notifier does not work
> > here, as you only want this information if the usb device is bound to
> > the bus there, you do not want to know this if it did not complete.
> > 
> > That thread says you want this not "too late", but why?  What is the
> > problem there, and how will you handle your code getting loaded after
> > the typec code is loaded?  Notifier callbacks don't work for that
> > situation, right?
> 
> In fact, the typec_register_altmode() function generates two
> registered events. The first one is the registered event of the port
> device, and the second one is the registered event of the partner
> device. The second one event only occurs after a Type-C device is
> inserted.
> The bus notifier event does not actually take effect for the port
> device, because it only sets the bus for the partner device:
> 
>     /* The partners are bind to drivers */
>     if (is_typec_partner(parent))
>         alt->adev.dev.bus = &typec_bus;

Setting the bus is correct, then it needs to be registered with the
driver core so the bus link shows up (and a driver is bound to it.)
That is when the bus notifier can happen, right?

> I hope it's not too late. In fact, the notifier here will notify DRM to establish a bridge chain.

What is a "bridge chain"?

> The downstream DP controller driver hopes to obtain the fwnode of the last-level Type-C device
> through this bridge chain to create a DRM connector. And when a device is inserted,
> drivers/usb/typec/altmodes/displayport.c can notify the HPD (Hot Plug Detect) event.

But aren't you just the driver for the "partner device"?

If not, why isn't a real device being created that you then bind to,
what "fake" type of thing are you attempting to do here that would
require you to do this out-of-band?

> If relying on the second event, the bridge chain may never be established, and the operations of the DP driver will be
> always deferred. Furthermore, other parts of the display controller driver will also be deferred accordingly.

What operations?  What exactly is delayed?  You should not be touching a
device before you have it on your bus, right?

> > > > Notifiers are a pain, and should almost never be added.  Use real
> > > > function calls instead.
> > > In v6, I used direct function calls, but had to switch to notifiers because couldn't resolve the dependencies between DRM and Type-C [1]. Do you have any good ideas? Thank you.
> > Only allow this DRM code to be built if typec code is enabled, do NOT
> > use a select, use a depends in the drm code.
> 
> Sorry, I didn't get your point. Does this mean that the current notifiers approach still needs to be changed to direct function calls?

If you somehow convince me that the existing bus notifiers will not
work, yes :)

> If so, then based on the previous discussion, typec should not depend
> on any DRM components. Does this mean that we should add the if
> (IS_REACHABLE(CONFIG_DRM_AUX_BRIDGE)) before the direct function call?

No, do it properly like any other function call to another subsystem.

> Additionally, the current version of CONFIG_DRM_AUX_BRIDGE is selected
> by the DP driver in patch9.

Don't do "select" if at all possible, always try to do "depends on".

thanks,

greg k-h
