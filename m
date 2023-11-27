Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4753C7FA40E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 16:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B1E10E2DF;
	Mon, 27 Nov 2023 15:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C11410E2CC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:07:05 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 9C0E860465;
 Mon, 27 Nov 2023 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701097625;
 bh=lC+3ZMbrmK+ltml+tURt+b+Q8sc1HX1E264KqcTY3bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PFk8u7wCpiU1UX80rKe5MU5GUOG+CXIATm5Z2vNFmhuFg5y8aKP7s3nvvFu1Xylk8
 02GfW1D1xuJEl2q0yZJJ3gmSQvtUmvN/DoQJ/B8xfawMH94X1IOuxAQPiAGgZ1KkRF
 w22ixEM9HRxHR/yZhzFm+t23zNdlrhaImxh5YNcBCRLvg/xmXK10ylWQA7JBZe70hK
 bmmvO+x/K3GzUpZ8flQRhdy7mZ7bpZcI1qSsxLSG2MWUI11P8aZFmvgCSPQWbGHgjx
 0JcxzNA3MgYmSWOBEST9R9hCS0lPbGRwRpgT0nBGJKAggLpOT03CFHe+/QMocAf+d4
 /Nd3oVv4BvuhQ==
Date: Mon, 27 Nov 2023 17:06:13 +0200
From: Tony Lindgren <tony@atomide.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 2/6] drm/bridge: tc358775: Fix getting dsi host data lanes
Message-ID: <20231127150613.GH5166@atomide.com>
References: <20231126163247.10131-2-tony@atomide.com>
 <20231127130941.2154871-1-mwalle@kernel.org>
 <20231127131947.GE5166@atomide.com>
 <48e9584ca904397ac0b0771d7e8b81ba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48e9584ca904397ac0b0771d7e8b81ba@kernel.org>
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
Cc: pavel@ucw.cz, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 ivo.g.dimitrov.75@gmail.com, rfoss@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 jernej.skrabec@gmail.com, simhavcs@gmail.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, jonas@kwiboo.se, merlijn@wizzup.org,
 mripard@kernel.org, Rob Herring <robh+dt@kernel.org>, philipp@uvos.xyz,
 neil.armstrong@linaro.org, sre@kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Michael Walle <mwalle@kernel.org> [231127 14:31]:
> + dt maintainers
> 
> > > I actually have the same fix, but with one additional detail, which
> > > I'm
> > > unsure about though: This looks at the data-lanes property of the
> > > *remote*
> > > endpoint whereas other bridge drivers (see tc358767, ti-sn65dsi83,
> > > lt8912b,
> > > anx7625) look at the local endpoint and I'm not sure what is correct.
> > 
> > Yes I've been wondering about that too. Let's just move it over to the
> > bridge node? We could produce a warning if the dsi host node has the
> > data-lanes property.. No current in kernel users AFAIK.
> 
> I haven't found any in-tree users either. In my patch, I first try the
> remote
> end and then the local end. But thinking more about it I don't think
> this is correct. Maybe we can do it the other way around, first try
> data-lanes of the local endpoint and if not found, then try the remote
> one. That way, we would at least be backwards compatible in the driver.
> And for the dt-bindings, make it mandatory to have a local data-lanes.

OK sounds good to me.

Tony
