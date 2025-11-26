Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75746C8994D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C72110E545;
	Wed, 26 Nov 2025 11:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EX6HFDp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D3010E545
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:44:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EFBA8601D7;
 Wed, 26 Nov 2025 11:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C877C113D0;
 Wed, 26 Nov 2025 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1764157473;
 bh=dQ3LNp2DPvCHpByC5YJ/LPjNqcR3n3ZIP831X7vWn8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EX6HFDp6M+6sFCHy11l719FEszcZCnX/arPyanWY59AmUz7HdftavnC1U4UCkzvV0
 uMiLKf9hkOEIYyVgWL4ByFWeBVROb9xMXOMOAFmxeygWsa7rhDrNnpXdbZ/kbBuZPA
 mFQJCkSC9jrSiqVsHgOTzV+V4tdIrre3rw2MorAU=
Date: Wed, 26 Nov 2025 12:44:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, Chaoyi Chen <kernel@airkyi.com>,
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
Message-ID: <2025112656-dreamland-retreat-2a65@gregkh>
References: <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com>
 <aSV_lQYJPxN7oBM-@kuha> <2025112554-uncaring-curator-642a@gregkh>
 <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com>
 <aSbLkwPG0dUzZvql@kuha>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSbLkwPG0dUzZvql@kuha>
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

On Wed, Nov 26, 2025 at 11:42:43AM +0200, Heikki Krogerus wrote:
> Wed, Nov 26, 2025 at 09:46:19AM +0800, Chaoyi Chen kirjoitti:
> > On 11/25/2025 7:49 PM, Greg Kroah-Hartman wrote:
> > >> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
> > >> +{
> > >> +	if (is_typec_port(kobj_to_dev(kobj)->parent))
> > > 
> > > Why look at the parent?  Doesn't the device have a type that should show
> > > this?
> > > 
> > > Otherwise, looks good to me.
> > 
> > They have same deivce type "typec_altmode_dev_type".
> > The parent device has a different device type to distinguish between
> > port device and partner device.
> 
> I was already wondering would it make sense to provide separate device
> types for the port, and also plug, alternate modes, but I'm not sure
> if that's the right thing to do.
> 
> There is a plan to register an "altmode" also for the USB4 mode,
> which of course is not an alternate mode. So USB4 will definitely need a
> separate device type.
> 
> So if we supply separate device types for the port, plug and partner
> alternate modes, we need to supply separate device types for port, plug
> and partner USB4 mode as well.
> 
> We certainly can still do that, but I'm just not sure if it makes
> sense?
> 
> I'll prepare a new version for this and include a separate patch where
> instead of defining separate device types for the port and plug
> alternate modes I'll just supply helpers is_port_alternate_mode() and
> is_plug_alternate_mode().

That feels like it would be better in the long run as it would be
easier to "match" on the device type.

thanks,

greg k-h
