Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9E1FC741
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD716EA9C;
	Wed, 17 Jun 2020 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DF56E9A5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 20:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1592340891; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yTEVn47FV1pTUXXcNnNJvcMpdYxuMhNLf7abVp9yt8=;
 b=l80b8rZghQE8dZoEusRhsx5T+eEweJNCA93MZT1b3AoJ93O1MDf4MrTyDU/tgKl4adDKTv
 H9guMGWzRnGQWCrZmOpfGemYXfOuMIH7dsQ8RnSh14vn/xfsVBrqx5jTso1jfmoRWiQD9Q
 4ww1xMlwOJ6MEc1LKoqR+SOZtOSV4uw=
Date: Tue, 16 Jun 2020 22:54:41 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
To: Emil Velikov <emil.l.velikov@gmail.com>
Message-Id: <53E1CQ.M7VSRST74EFV1@crapouillou.net>
In-Reply-To: <CACvgo50abpfh6Q+zPZCCG7RnAzX=CZJmtv2SyTyBfLC7qWtU1w@mail.gmail.com>
References: <20200607133832.1730288-1-paul@crapouillou.net>
 <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
 <1RIXBQ.4P44ILM1QELP2@crapouillou.net>
 <CACvgo50abpfh6Q+zPZCCG7RnAzX=CZJmtv2SyTyBfLC7qWtU1w@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, od@zcrc.me
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

Le mar. 16 juin 2020 =E0 18:47, Emil Velikov <emil.l.velikov@gmail.com> =

a =E9crit :
> Hi all,
> =

> Allow me to compare this approach with some work Linus W [1] did a
> while back, which I've just noticed.
> =

> Pauls' approach:
> =

>  - Perhaps the shortest one possible
> Porting an existing DSI panel to DBI is 3 lines of code - compat line
> in the SPI/DSI bridge, a bus_type and
> mipi_dsi_maybe_register_tiny_driver() call
> The clever use of the DSI type (equal to zero) means that things will
> work w/o updating existing dsi hosts and devices in panel/. Yet in the
> very unlikely case that the panel does not support DSI, we will still
> allow it.

Is there such a case? I assumed that all current DSI device and host =

drivers are for DSI panels.

> Although thinking about the type I wonder if it can accommodate all =

> use-cases:
> Since we can have a device (panel) capable of DSI+SPI it makes sense
> for it to expose the type bitmask, not the host. Although, what if the
> host itself supports DSI+SPI.?

Yes, hosts can support more than one type (mine does), so it should =

expose a bitmask. As for the panel, even though some can do DSI, SPI =

and I8080 DBI, as far as I know the bus used is always set in hardware =

(with specific pins set to VCC/GND to select the mode), so this is not =

something the host can select. Therefore, the panel driver should =

register the mipi_dsi_device with one particular bus type. Note that =

the panel driver could very well infer the bus type from the compatible =

string.

If the bus type can be changed at runtime (and there's a need for =

that), then we would need a bitmask on the panel driver side too, along =

with a 'set bus' callback, but I'm not sure it will be required.

> Now we can extrapolate that with a host (say fimd/exynos I think)
> which supports a SPI panel (s6e63m0) while having
> of_graph_get_port_by_id(0)?

I'm not sure I understand, if there is a port #0 in the panel node, =

then the tinyDRM driver is not created, and the SPI panel will be =

registered with the fimd/exynos host driver. So that should already =

work fine.

> - Strange (ab)use of the DSI bus for DBI (SPI, 6800, 8080 etc)
> We care about existing users (DT) and it sounds unlikely (based on
> previous discussion) that DBI + SPI/6800... will make it into DT. So
> the current approach seems quite reasonable IMHO.
> =

> =

> Linus' approach:
> - Clear separation of DSI/SPI
> Compat strings are still duplicated, although in separate files
> =

> - Minor code motion and slightly more invasive porting overall
> Much of the boilerplate can be reduced via helper lib and macros. Even
> then it's unlikely we'll reach the 3 line delta as with Paul's
> approach.
> =

> - Does not handle tiny-dsi (dummy) drm driver
> It seems doable, with minor changes
> =

> =

> Personally I'm on the fence and a deciding factor for me is if Paul's
> approach can handle all the combinations of host/device type support.
> That said, the input from people likely to do the work would be highly
> appreciated.
> =

> Once a decision is made, an illustrative series + todo entry would be
> great to have.

Sure. Thanks for the feedback!

Cheers,
-Paul

> -Emil
> =

> [1] =

> https://lists.freedesktop.org/archives/dri-devel/2020-May/266079.html


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
