Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F78C22AD
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 13:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188AF10E8A1;
	Fri, 10 May 2024 11:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NPVTcQZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A550710E8A1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 11:04:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A394561EA2;
 Fri, 10 May 2024 11:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55F9C2BD11;
 Fri, 10 May 2024 11:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1715339040;
 bh=h/y/M0WVBu20pfhZoBP9hM8Pp5zsvEnQwe4lkBmsmzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NPVTcQZlQch0YbyPlfN4o1ztVi6Gd8zgxljoG8d74kRXBMgAVIINhuas5DUHLZPr1
 Du0yrJRfY581ViE5ABjXktGPOcf+otCU5gaLHU2C8FAj88kqzM1xdKNnK/8MvvE+Lb
 pmNKG3TdTIG3LMN9eD/AH6oZu1ixXuChO8wYTsKw=
Date: Fri, 10 May 2024 12:03:57 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@google.com>,
 Paul Kocialkowski <contact@paulk.fr>,
 =?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 5/5] misc: add ge-addon-connector driver
Message-ID: <2024051010-scribble-barbell-d57e@gregkh>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-5-ec32f2c66d56@bootlin.com>
 <2024051039-decree-shrimp-45c6@gregkh>
 <20240510125417.1dddfd5c@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510125417.1dddfd5c@booty>
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

On Fri, May 10, 2024 at 12:54:17PM +0200, Luca Ceresoli wrote:
> > > +static int sunh_conn_handle_event(struct sunh_conn *conn, bool plugged)
> > > +{
> > > +	int err;
> > > +
> > > +	if (plugged == conn->plugged)
> > > +		return 0;
> > > +
> > > +	dev_info(conn->dev, "%s\n", plugged ? "connected" : "disconnected");  
> > 
> > Please remove debugging code from stuff you want to see merged.
> > 
> > Same for all dev_info() calls here, when drivers work properly, they are
> > quiet.
> 
> While agree for other dev_info() calls, this one seems quite similar in
> principle to the link up/down messages that get logged by the MII code
> at [0]:
> 
>   [347229.872315] asix 1-1.3.2:1.0 enx000cf616fecb: link up, 100Mbps,
>   full-duplex, lpa 0xC5E1 [347229.920449] asix 1-1.3.2:1.0 enx000cf616fecb: link down
> 
> In my case it is logging that a removable part of the hardware has been
> added or removed, which appears useful. Do you think it make sense in
> this scenario?

Nope, sorry, again, when drivers are working properly, they should be
quiet otherwise they just fill up the log with unneeded messages.

thanks,

greg k-h
