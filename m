Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409529F0AF5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 12:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98FD10EFDF;
	Fri, 13 Dec 2024 11:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RDUSqa2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F21210EFDB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 11:28:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10CE5C0006;
 Fri, 13 Dec 2024 11:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734089311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5fFG4vE+vkwACpIop1Zpb8KlDP1HSG6Jo6PWR1GFGM=;
 b=RDUSqa2ff8PZtcbs78wVV5g6G6GweSxEeW37gg/ZzBhEtIEAH1xQAiQbBrxVCFDHQ3SS3t
 auF2eEcz/EtZGAMdYeeSYNEgDrXJAQroWXbFHOPnY1VrSCiyXbUhcIWiIFGlRKTs0qPGeY
 9W9MUdHzEFiXwMRf+MBSogMMDPrSbpXw3VsrHIqd3HCNFcd5JJLrfzL90ImhuSCQbBP90S
 R+pNLq58KKjFQUOm16EjlrsQu32tVuMoJZvqb6qeDCkVecBiFhWmr+NERpKXwOTquXho9l
 BbFcTYVSYse9QBTygwZHtipwZ2348CwcqvfyGJZhhEII6culDLHEPFBqW1/Ckw==
Date: Fri, 13 Dec 2024 12:28:26 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "rafael@kernel.org" <rafael@kernel.org>, "jingoohan1@gmail.com"
 <jingoohan1@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "daniel.thompson@linaro.org"
 <daniel.thompson@linaro.org>, "wsa+renesas@sang-engineering.com"
 <wsa+renesas@sang-engineering.com>, "lee@kernel.org" <lee@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "saravanak@google.com"
 <saravanak@google.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "derek.kiernan@amd.com" <derek.kiernan@amd.com>, "deller@gmx.de"
 <deller@gmx.de>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "contact@paulk.fr" <contact@paulk.fr>, "herve.codina@bootlin.com"
 <herve.codina@bootlin.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "paul.kocialkowski@bootlin.com"
 <paul.kocialkowski@bootlin.com>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v4 5/8] i2c: i2c-core-of: follow i2c-parent phandle to
 probe devices from added nodes
Message-ID: <20241213122826.1c01a284@booty>
In-Reply-To: <ad1b0f8a662d748580bef83b6f7d8d24d80bd46c.camel@siemens.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
 <20240917-hotplug-drm-bridge-v4-5-bc4dfee61be6@bootlin.com>
 <ad1b0f8a662d748580bef83b6f7d8d24d80bd46c.camel@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Alexander,

On Thu, 12 Dec 2024 19:12:02 +0000
"Sverdlin, Alexander" <alexander.sverdlin@siemens.com> wrote:

> Hi Luca!
> 
> On Tue, 2024-09-17 at 10:53 +0200, Luca Ceresoli wrote:
> > When device tree nodes are added, the I2C core tries to probe client
> > devices based on the classic DT structure:
> > 
> >   i2c@abcd0000 {
> >       some-client@42 { compatible = "xyz,blah"; ... };
> >   };
> > 
> > However for hotplug connectors described via device tree overlays there is
> > additional level of indirection, which is needed to decouple the overlay
> > and the base tree:
> > 
> >   --- base device tree ---
> > 
> >   i2c1: i2c@abcd0000 { compatible = "xyz,i2c-ctrl"; ... };
> >   i2c5: i2c@cafe0000 { compatible = "xyz,i2c-ctrl"; ... };
> > 
> >   connector {
> >       i2c-ctrl {
> >           i2c-parent = <&i2c1>;
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> >       };
> > 
> >       i2c-sensors {
> >           i2c-parent = <&i2c5>;
> >           #address-cells = <1>;
> >           #size-cells = <0>;
> >       };
> >   };
> > 
> >   --- device tree overlay ---
> > 
> >   ...
> >   // This node will overlay on the i2c-ctrl node of the base tree  
> 
> Why don't you overlay it right over &i2c1?
> It should have worked since commit ea7513bbc041
> ("i2c/of: Add OF_RECONFIG notifier handler").
> Doesn't it work for your use-case?

One reason is decoupling the base board and addon. A different base
board may wire the same connector pins to 'i2c4' instead of 'i2c1'. We
want a single overlay to describe the addon, independently of the base
board, so it has to mention only connector pins, not base board
hardware.

Another reason is that using phandles to labels in the base tree in the
overlay (such as &i2c1) would need properties added by the __symbols__
node, and overlays adding properties to nodes in the live tree are not
welcome. This is both for a conceptual reason (adding an overlay ==
adding hardware and not _changing_ hardware, so adding nodes should be
enough) and an implementation one (properties added to nodes in the
live tree become deadprops and thus leak memory.

This topic was discussed at the latest Linux Plumbers Conference last
September. Slides and video of the discussion are available here:
https://lpc.events/event/18/contributions/1696/

More info are in the cover letter. Discussion leading to this
implementation started after v2:
https://lore.kernel.org/all/20240510163625.GA336987-robh@kernel.org/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
