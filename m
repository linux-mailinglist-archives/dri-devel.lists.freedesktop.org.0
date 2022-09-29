Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980305EFEAD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E73110ECA7;
	Thu, 29 Sep 2022 20:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1541310EBD1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 20:33:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E29D247C;
 Thu, 29 Sep 2022 22:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664483636;
 bh=uv8awXPacLHhOS3HajjryADSopwjfB9Eq+dmGGVAFrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=thnLVZr3b4DVuFXzBMmJhHTUq2raD1HEE9kwxQpXrZW88pw833ytVx7ASsXPcafZo
 NK+OYO3hpdgpJYzA0yhxBB+GOLYBuIKHS65qQFfK5gjWIMOU9IFBGpg7VJqTQ8f+WH
 Vtmz0+tPeCYvGs5ga6yO0A1EEH4c4bQsf5mk4df8=
Date: Thu, 29 Sep 2022 23:33:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@oss.nxp.com>
Subject: Re: [PATCH v2 4/4] drm: lcdif: Add support for YUV planes
Message-ID: <YzYBMq4TlRZFrARG@pendragon.ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
 <91e95c22f0683203de8ca6b4233d77a0b133c4d9.camel@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91e95c22f0683203de8ca6b4233d77a0b133c4d9.camel@oss.nxp.com>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Daniel Scally <dan.scally@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

On Thu, Sep 29, 2022 at 05:53:37PM +0800, Liu Ying wrote:
> On Wed, 2022-09-28 at 03:58 +0300, Laurent Pinchart wrote:
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > 
> > The LCDIF includes a color space converter that supports YUV input. Use
> > it to support YUV planes, either through the converter if the output
> > format is RGB, or in conversion bypass mode otherwise.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Support all YCbCr encodings and quantization ranges
> > - Drop incorrect comment
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 183 +++++++++++++++++++++++++----
> >  drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
> >  2 files changed, 164 insertions(+), 24 deletions(-)
> 
> I have a chance to test this series and find that my
> 'koe,tx26d202vm0bwa' 1920x1200 LVDS panel connected with i.MX8mp EVK
> can only show the test pattern at the top half of the display with YUV
> fb. Looks like something with wrong stride. XR24 fb is ok, but RG16 fb
> has similar issue. Anything I missed?
> 
> The command I'm using to test YUV fb:
> modetest -M imx-lcdif -P 31@35:1920x1200@YUYV 

Thanks for the bug report. The problem didn't occur with kmstest nor the
libcamera 'cam' test application, but I have been able to reproduce it
with modetest. The modetest application uses the legacy mode setting API
by default, so it exercises code paths in the driver in different ways,
uncovering a few preexisting issues.

The problem is caused by the fact that the functions called from the
.atomic_enable() handler access the frame buffer from the plane state
and configure the hardware using that information. Depending on how the
device is configured, the display can be enabled with one frame buffer,
and then immediately switch to a different frame buffer that has a
different format and/or pitch.

Properties of the frame buffer should only be accessed from the plane
.atomic_update() operation. Fixing this requires quite a bit of
refactoring of the driver, which I won't have time to work on at the
moment. Marek, would you have some time to look at this ? As the issue
isn't introduced by this series but preexists (you should be able to
reproduce it by selecting the XR15 format instead of XR24 for instance),
can YUV support be merged already (after I send v3) ?

-- 
Regards,

Laurent Pinchart
