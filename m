Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DAD6D7F7E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20E7810E9A4;
	Wed,  5 Apr 2023 14:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5AB10E9A4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 14:30:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank219059148246.bbtec.net
 [219.59.148.246])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80F391718;
 Wed,  5 Apr 2023 16:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680705010;
 bh=Qs3POKuzAMl2FAwrRUyvpLBK6qJSzNKEzukle8jld14=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MURgjpwOIUrJIP2D7Rtkc9A8Kxbv1mzNmPQvR40pLpJ2dTdxJTFhUDRn1ILC3QF/X
 DTL/lO/prlXUnU/52QubBohKPtzvTssDjp0yYnhPQHFsnYpBlxGwPzSsynDUY/aaiM
 RtPdJEXy7tJq0vMbsOjDR/FYTYpotdw9i5EwU06c=
Date: Wed, 5 Apr 2023 17:30:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [RESEND PATCH v4 03/21] staging: media: tegra-video: fix
 .vidioc_enum_fmt_vid_cap to return all formats
Message-ID: <20230405143018.GC9915@pendragon.ideasonboard.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
 <20230309144320.2937553-4-luca.ceresoli@bootlin.com>
 <85268d69-3d3b-2c0f-ba26-073f09052362@xs4all.nl>
 <20230404161251.272cc78b@booty>
 <20230405023048.GD9915@pendragon.ideasonboard.com>
 <20230405103134.2ae10766@booty>
 <dddd76a7-f882-f1dd-0781-fcc1f9b4e060@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dddd76a7-f882-f1dd-0781-fcc1f9b4e060@xs4all.nl>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Wed, Apr 05, 2023 at 10:50:37AM +0200, Hans Verkuil wrote:
> On 05/04/2023 10:31, Luca Ceresoli wrote:
> > On Wed, 5 Apr 2023 05:30:48 +0300 Laurent Pinchart wrote:
> >> On Tue, Apr 04, 2023 at 04:12:51PM +0200, Luca Ceresoli wrote:
> >>> On Wed, 29 Mar 2023 13:16:22 +0200 Hans Verkuil wrote:
> >>>   
> >>>> Hi Luca,
> >>>>
> >>>> I finally found the time to test this series. It looks OK, except for this patch.  
> >>>
> >>> Thank you very much for taking the time!
> >>>   
> >>>> The list of supported formats really has to be the intersection of what the tegra
> >>>> supports and what the sensor supports.
> >>>>
> >>>> Otherwise you would advertise pixelformats that cannot be used, and the application
> >>>> would have no way of knowing that.  
> >>>
> >>> As far as I understand, I think we should rather make this driver fully
> >>> behave as an MC-centric device. It is already using MC quite
> >>> successfully after all.
> >>>
> >>> Do you think this is correct?  
> >>
> >> Given the use cases for this driver, I agree.
> 
> I disagree.
> 
> This driver doesn't use the media controller for anything at the moment. The
> /dev/mediaX device just shows the internal topology (i.e. connected sensors),
> but otherwise it does nothing.
> 
> While it would be great if we could unlock the ISP on the Tegra, the reality
> is that it is entirely closed source and can't be used in a linux driver, and
> that's not going to change, sadly.

Never say never :-)

> That leaves us with just a basic CSI capture driver. Rather than trying to
> change this driver to a full MC device with no benefits, just drop this change
> and get your code in.

Can't the hardware support capturing different virtual channels or data
types from the same CSI-2 source ? That would require MC support, the
stream API requires subdev device nodes.

> Note that this driver will stay in staging since it still fails when I try to
> capture from two sensors at the same time: syncpoint errors start appearing
> in that case. I think there are locking issues. I think I have someone to take
> a look at that, but first I want your series to get merged.
> 
> In the very unlikely event that the ISP can be implemented in a linux driver,
> it will probably become a new driver.
> 
> Regards,
> 
> > Ok, thanks for the feedback. I will send a v5 with this change.

-- 
Regards,

Laurent Pinchart
