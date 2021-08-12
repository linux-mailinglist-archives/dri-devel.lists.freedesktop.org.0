Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D672D3EA22C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 11:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FAF6E3B7;
	Thu, 12 Aug 2021 09:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0CC6E3B7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 09:38:34 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 1947edd5-fb51-11eb-8d1a-0050568cd888;
 Thu, 12 Aug 2021 09:38:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 4E384194B69;
 Thu, 12 Aug 2021 11:38:36 +0200 (CEST)
Date: Thu, 12 Aug 2021 11:38:28 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Linus W <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] eDP: Support probing eDP panels dynamically
 instead of hardcoding
Message-ID: <YRTsFNTn/T8fLxyB@ravnborg.org>
References: <20210730212625.3071831-1-dianders@chromium.org>
 <YQmp3mGpLW+ELxAC@ravnborg.org>
 <CAD=FV=XxOXJEgq7SiOVwSo2eWEbekQqutucFP=MmrrtmStXxog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XxOXJEgq7SiOVwSo2eWEbekQqutucFP=MmrrtmStXxog@mail.gmail.com>
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

Hi Doug,
On Mon, Aug 09, 2021 at 03:18:03PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Aug 3, 2021 at 1:41 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Douglas,
> >
> > On Fri, Jul 30, 2021 at 02:26:19PM -0700, Douglas Anderson wrote:
> > > The goal of this patch series is to move away from hardcoding exact
> > > eDP panels in device tree files. As discussed in the various patches
> > > in this series (I'm not repeating everything here), most eDP panels
> > > are 99% probable and we can get that last 1% by allowing two "power
> > > up" delays to be specified in the device tree file and then using the
> > > panel ID (found in the EDID) to look up additional power sequencing
> > > delays for the panel.
> >
> > Have you considered a new driver for edp panels?
> > panel-edp.c?
> >
> > There will be some duplicate code from pnale-simple - but the same can
> > be said by the other panel drivers too.
> > In the end I think it is better to separate them so we end up with two
> > less complex panel drivers rather than one do-it-all panel driver.
> >
> > I have not looked in detail how this would look like, but my first
> > impression is that we should split it out.
> 
> I certainly could, but my argument against it is that really it's the
> exact same set of eDP panels that would be supported by both drivers.

The idea was to move all eDP panels to the new driver.

My hope it that we can make panel-simple handle a more more narrow set
of panels. eDP capable displays are IMO not simple panels.

Likewise DSI capable panels could also be pulled out of panel-simple.

This would continue to duplicate some code - but we have a lot of
duplicated code across the various panels and the best way forward
would be to implement more helpers that can be used by the drivers.

	Sam - who is trying to recover form the deadly man flu...
