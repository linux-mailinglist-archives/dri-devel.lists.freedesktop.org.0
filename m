Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2D4200248
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915956EC18;
	Fri, 19 Jun 2020 06:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9526E484
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 22:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1592520159; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrPzlzX0pa0moqET9F3nmU/NKU/GsJeh0l2Tt4+cmhw=;
 b=GKYaLXTU1Zu7mHuL+attKot2F22ZEzU1+1MREaHYJCnWGPRIIO8qk1bAaitF7nXC3uUpPN
 gu3fZUbuUq4FJ59feYZceqSCOaumw6yu4Nd5pv6Td6wS7jGxq3XSrKCj94PF0gNxTfYyU+
 yMOuZ8+URECEGvVNTQUpU79hZGNMiQ0=
Date: Fri, 19 Jun 2020 00:42:27 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
To: Emil Velikov <emil.l.velikov@gmail.com>
Message-Id: <RE85CQ.6MX9UTW5DHZ22@crapouillou.net>
In-Reply-To: <CACvgo50abpfh6Q+zPZCCG7RnAzX=CZJmtv2SyTyBfLC7qWtU1w@mail.gmail.com>
References: <20200607133832.1730288-1-paul@crapouillou.net>
 <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
 <1RIXBQ.4P44ILM1QELP2@crapouillou.net>
 <CACvgo50abpfh6Q+zPZCCG7RnAzX=CZJmtv2SyTyBfLC7qWtU1w@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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

Actually the DSI type is not equal to zero, it's BIT(0) so 1. Right now =

in the patch, I added a WARN in mipi_dsi_attach() that checks that =

bus_type is non-zero.

-Paul

> Although thinking about the type I wonder if it can accommodate all =

> use-cases:
> Since we can have a device (panel) capable of DSI+SPI it makes sense
> for it to expose the type bitmask, not the host. Although, what if the
> host itself supports DSI+SPI.?
> Now we can extrapolate that with a host (say fimd/exynos I think)
> which supports a SPI panel (s6e63m0) while having
> of_graph_get_port_by_id(0)?
> =

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
> -Emil
> =

> [1] =

> https://lists.freedesktop.org/archives/dri-devel/2020-May/266079.html


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
