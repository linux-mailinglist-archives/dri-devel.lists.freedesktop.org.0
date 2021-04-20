Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448FF36624A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 00:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE926E8F9;
	Tue, 20 Apr 2021 22:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CBD6E8F9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 22:49:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5293345E;
 Wed, 21 Apr 2021 00:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1618958980;
 bh=tnPqQylg0M/heoMDy9x5XiXEnGZ70xHfOc6q1pK7LwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZeMKknPmyhvE4Lv+KgrktMqxfIhcblSiEh0KPDRygcger3YAT3GSLEBBVqXh7qDG3
 LUCWeoNI6c8vlxZEBDR5b4U2e8itmNqfq+KD8TT6Vjcyoxfawp1ukhGUyh4Uuk+uES
 vWsUrRluJfe99MxGLvGZHiOc3SPvj76DvRnhj3UA=
Date: Wed, 21 Apr 2021 01:49:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
Message-ID: <YH9agHwLhEL27TA1@pendragon.ideasonboard.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
 <YHlfqJIlUh7eytty@pendragon.ideasonboard.com>
 <96b9e144-0791-4c19-3e3c-b0e9efb86138@baylibre.com>
 <cbea511c-5d5c-8c59-f91f-fedc8eec1e39@xs4all.nl>
 <0821533b-9e6a-237e-3845-741e82de4ed9@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0821533b-9e6a-237e-3845-741e82de4ed9@baylibre.com>
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, Hans Verkuil <hverkuil@xs4all.nl>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 05:19:52PM +0200, Neil Armstrong wrote:
> On 20/04/2021 17:13, Hans Verkuil wrote:
> > On 16/04/2021 13:38, Neil Armstrong wrote:
> >> On 16/04/2021 11:58, Laurent Pinchart wrote:
> >>> Hi Neil,
> >>>
> >>> On Fri, Apr 16, 2021 at 11:27:35AM +0200, Neil Armstrong wrote:
> >>>> This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.
> >>>>
> >>>> On some SoCs, the CEC functionality is enabled in the IP config bits, but the
> >>>> CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
> >>>> but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
> >>>> confusion when the DW-HDMI CEC controller can't communicate on the bus.
> >>>
> >>> If we can't trust the CEC config bit, would it be better to not use it
> >>> at all, and instead let each platform glue logic tell whether to enable
> >>> CEC or not ?
> >>
> >> Actually, the CEC config bit is right, the HW exists and should be functional, but
> >> this bit doesn't tell if the CEC signal is connected to something.
> >>
> >> This lies in the IP integration, like other bits under the "amlogic,meson-*-dw-hdmi"
> >> umbrella.
> >>
> >> The first attempt was by Hans using DT, but adding a property in DT for a vendor
> >> specific compatible doesn't make sense. Another idea would be to describe the
> >> CEC signal endpoint like we do for video signal, but I think this is out of scope and
> >> this solution is much simpler and straightforward, and it's more an exception than
> >> a general use case to solve.
> > 
> > While a DT property might not make sense in this particular case, I still
> > believe that it is a perfectly valid approach in general: whether or not
> > the CEC pin is connected is at the hardware level decision, it is not
> > something that software can detect. If the designer of the board didn't
> > connect it, then the only place you can define that is in the device tree.
> 
> Agreed, we need to define a smart way to declare CEC bus relationship in DT, the side
> effect would be to handle this particular case.

I wonder if it would make sense to use the OF graph bindings to describe
the connection between the CEC controller and the CEC "device" (which I
assume in most cases will be a DT node for a physical connector). Or is
this overkill ?

> > Anyway, for meson I am fine with this solution. At least it prevents creating
> > a non-functioning cec device. So for this series:
> > 
> > Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> Thanks,
> 
> Applying this serie to drm-misc-next
> 
> >>>> Jernej Skrabec (1):
> >>>>   drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
> >>>>     driver
> >>>>
> >>>> Neil Armstrong (1):
> >>>>   drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
> >>>>
> >>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
> >>>>  drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
> >>>>  include/drm/bridge/dw_hdmi.h              | 2 ++
> >>>>  3 files changed, 4 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
