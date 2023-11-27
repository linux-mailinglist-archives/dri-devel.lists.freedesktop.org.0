Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3377FA0C6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC82B10E276;
	Mon, 27 Nov 2023 13:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C2010E276
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:20:38 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id D788F604AC;
 Mon, 27 Nov 2023 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701091238;
 bh=wBCDD36mme1w3tN587tWMeU+pD4sq1JyqxekiQlv7fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sPx/Io50tixr9EAAOq4e8/zmkZRl5GF5VrJbC9U4WlosICdyWPvXoDRjScdGXzOai
 Z80hySfQlRh9NPpHa3kjVaaPo3RqJcbq5yJi3cJmU2kCRP9nYdgszuN5CBviioYZeJ
 D2b1zR6Tq9hakmFM4FE9RFsTlI7ErqJYTZ7w3fPFDnJLszGHe0JzkvyQ5QzUqgu8vM
 0b+uP1nkjikW+6knVovEfMbZO0ilckYuzuu+jom5dQPWOlMsjIhlsXMXrhGLifppCJ
 9zkaJuMsu5hDnOUo0dheKz7SoQwIuuXqSIIuW8r3G0NLfeRMnmRfvQ6L4cL2nVVp8u
 A4R+G0lR8ceyA==
Date: Mon, 27 Nov 2023 15:19:47 +0200
From: Tony Lindgren <tony@atomide.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 2/6] drm/bridge: tc358775: Fix getting dsi host data lanes
Message-ID: <20231127131947.GE5166@atomide.com>
References: <20231126163247.10131-2-tony@atomide.com>
 <20231127130941.2154871-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127130941.2154871-1-mwalle@kernel.org>
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
Cc: mripard@kernel.org, devicetree@vger.kernel.org, ivo.g.dimitrov.75@gmail.com,
 rfoss@kernel.org, andrzej.hajda@intel.com, tzimmermann@suse.de,
 jonas@kwiboo.se, pavel@ucw.cz, sam@ravnborg.org, merlijn@wizzup.org,
 neil.armstrong@linaro.org, sre@kernel.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 simhavcs@gmail.com, philipp@uvos.xyz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Michael Walle <mwalle@kernel.org> [231127 13:10]:
> I actually have the same fix, but with one additional detail, which I'm
> unsure about though: This looks at the data-lanes property of the *remote*
> endpoint whereas other bridge drivers (see tc358767, ti-sn65dsi83, lt8912b,
> anx7625) look at the local endpoint and I'm not sure what is correct.

Yes I've been wondering about that too. Let's just move it over to the
bridge node? We could produce a warning if the dsi host node has the
data-lanes property.. No current in kernel users AFAIK.

FYI, for omapdrm, we already have a legacy dt property "lanes" for the
wiring that tells number of lanes used and the order of the lanes.

Regards,

Tony
