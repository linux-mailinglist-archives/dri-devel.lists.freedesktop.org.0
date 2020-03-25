Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1C191EEA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 03:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788D06E0E2;
	Wed, 25 Mar 2020 02:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4DE6E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 02:20:34 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 040492072E;
 Wed, 25 Mar 2020 02:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585102834;
 bh=+57wLOzdrvfVY9oRgwlinhOdDYxWS98Ii68KfvWZAeE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=HRLni0JDRk8bdJjwHaSbs4cTHqNClt8LAi7FFXx302v+o3W/j6lDNZbtadQwzVKhe
 +1Nx7xlZ5T6dMRFDuTY5OXv5qoC3XAIvnKBrV61LtGEX4YrRuFvAnwnO4VPjSK9cAw
 6p4BBy3OkERRlTAanuh1/I0EtpqXul9kXHfexaNg=
MIME-Version: 1.0
In-Reply-To: <20200323105616.kiwcyxxcb7eqqfsc@gilmour.lan>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <6dd6bd48e894c1e8ee85c29a30ba1b18041d83c4.1582533919.git-series.maxime@cerno.tech>
 <158406125965.149997.13919203635322854760@swboyd.mtv.corp.google.com>
 <20200323105616.kiwcyxxcb7eqqfsc@gilmour.lan>
Subject: Re: [PATCH 27/89] clk: bcm: Add BCM2711 DVP driver
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 24 Mar 2020 19:20:33 -0700
Message-ID: <158510283320.125146.11874786046657431725@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2020-03-23 03:56:16)
> Hi Stephen,
> 
> On Thu, Mar 12, 2020 at 06:00:59PM -0700, Stephen Boyd wrote:
> > > +       dvp->clks[1] = clk_register_gate(&pdev->dev, "hdmi1-108MHz",
> > > +                                        parent, CLK_IS_CRITICAL,
> > > +                                        base + DVP_HT_RPI_MISC_CONFIG, 4,
> > > +                                        CLK_GATE_SET_TO_DISABLE, &dvp->reset.lock);
> >
> > Can we use clk_hw APIs, document why CLK_IS_CRITICAL, and use something
> > like clk_hw_register_gate_parent_data() so that we don't have to use
> > of_clk_get_parent_name() above?
> 
> That function is new to me, and I'm not sure how I'm supposed to use it?
> 
> It looks like clk_hw_register_gate, clk_hw_register_gate_parent_hw and
> clk_hw_register_gate_parent_data all call __clk_hw_register_gate with
> the same arguments, each expecting the parent_name, so they look
> equivalent?
> 
> It looks like the original intent was to have the parent name, clk_hw
> or clk_parent_data as argument, but the macro itself was copy pasted
> without changing the arguments it's calling __clk_hw_register_gate
> with?
> 

Yeah! It looks like nobody has tried to use it yet so you've come across
that problem where nobody reviews things and I just merge it anyway.
I'll send a fix shortly.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
