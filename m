Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2950362E0E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 08:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A876E03B;
	Sat, 17 Apr 2021 06:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs19.siol.net [185.57.226.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49EB46E03B
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 06:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id BF64B523653;
 Sat, 17 Apr 2021 08:31:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id n-saAgAigrm7; Sat, 17 Apr 2021 08:31:40 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 749A95238C1;
 Sat, 17 Apr 2021 08:31:40 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id E0502523653;
 Sat, 17 Apr 2021 08:31:39 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
Date: Sat, 17 Apr 2021 08:31:39 +0200
Message-ID: <9525152.Q8VVBrNj5Z@jernej-laptop>
In-Reply-To: <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
 <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
 <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
MIME-Version: 1.0
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
Cc: jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 hverkuil-cisco@xs4all.nl, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC Hans Verkuil

Dne petek, 16. april 2021 ob 13:38:59 CEST je Neil Armstrong napisal(a):
> On 16/04/2021 11:58, Laurent Pinchart wrote:
> > Hi Neil,
> > 
> > On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
> >> This adds DW-HDMI driver a glue option to disable loading of the CEC
> >> sub-driver.
> >> 
> >> On some SoCs, the CEC functionality is enabled in the IP config bits, but
> >> the CEC bus is non-functional like on Amlogic SoCs, where the CEC config
> >> bit is set but the DW-HDMI CEC signal is not connected to a physical
> >> pin, leading to some confusion when the DW-HDMI CEC controller can't
> >> communicate on the bus.> 
> > If we can't trust the CEC config bit, would it be better to not use it
> > at all, and instead let each platform glue logic tell whether to enable
> > CEC or not ?
> 
> Actually, the CEC config bit is right, the HW exists and should be
> functional, but this bit doesn't tell if the CEC signal is connected to
> something.

I'm in favour of Neil's solution. Currently we have only one exception.

> 
> This lies in the IP integration, like other bits under the
> "amlogic,meson-*-dw-hdmi" umbrella.
> 
> The first attempt was by Hans using DT, but adding a property in DT for a
> vendor specific compatible doesn't make sense. Another idea would be to
> describe the CEC signal endpoint like we do for video signal, but I think
> this is out of scope and this solution is much simpler and straightforward,
> and it's more an exception than a general use case to solve.

Note that we still need DT property for disabling CEC. I have one Allwinner H3 
board where board designer decided to use GPIO CEC implementation instead of 
DW HDMI one (vendor Linux doesn't implement DW HDMI CEC driver). Other H3 
boards happily use DW HDMI CEC.

Best regards,
Jernej

> 
> Neil
> 
> >> Jernej Skrabec (1):
> >>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
> >>   
> >>     driver
> >> 
> >> Neil Armstrong (1):
> >>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
> >>  
> >>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
> >>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
> >>  include/drm/bridge/dw_hdmi.h              | 2 ++
> >>  3 files changed, 4 insertions(+), 1 deletion(-)




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
