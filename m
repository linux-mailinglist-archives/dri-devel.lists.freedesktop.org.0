Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409B16D727C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 04:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C604610E013;
	Wed,  5 Apr 2023 02:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C251F10E077
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 02:30:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (fp76f193f3.tkyc206.ap.nuro.jp
 [118.241.147.243])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 622C2905;
 Wed,  5 Apr 2023 04:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680661841;
 bh=92JxqutkaA7MOBZzEsI8JVLAVvvA2FVlO8U5Q3EjmSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mWO+SH7/XV27sw9R9Rw+KgqItm8rURI5GQYFV1sl6pR8XqDB6GW41gIU2YwetbYJf
 AtRC/91JVGQs52YzgrvoES/zkyNKZ3kM/rEVQD8Wdrh/kfYVzeVJvyDFcz5Eo0QXhG
 Cc25z/I3g+l6D2expqUK61OIFTqhI2ZjYHVrjfc4=
Date: Wed, 5 Apr 2023 05:30:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [RESEND PATCH v4 03/21] staging: media: tegra-video: fix
 .vidioc_enum_fmt_vid_cap to return all formats
Message-ID: <20230405023048.GD9915@pendragon.ideasonboard.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
 <20230309144320.2937553-4-luca.ceresoli@bootlin.com>
 <85268d69-3d3b-2c0f-ba26-073f09052362@xs4all.nl>
 <20230404161251.272cc78b@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230404161251.272cc78b@booty>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luca,

On Tue, Apr 04, 2023 at 04:12:51PM +0200, Luca Ceresoli wrote:
> On Wed, 29 Mar 2023 13:16:22 +0200 Hans Verkuil wrote:
> 
> > Hi Luca,
> > 
> > I finally found the time to test this series. It looks OK, except for this patch.
> 
> Thank you very much for taking the time!
> 
> > The list of supported formats really has to be the intersection of what the tegra
> > supports and what the sensor supports.
> > 
> > Otherwise you would advertise pixelformats that cannot be used, and the application
> > would have no way of knowing that.
> 
> As far as I understand, I think we should rather make this driver fully
> behave as an MC-centric device. It is already using MC quite
> successfully after all.
> 
> Do you think this is correct?

Given the use cases for this driver, I agree.

> If you do, then I think the plan would be:
> 
>  - Add the V4L2_CAP_IO_MC flag
>  - As the mbus_code in get_format appropriately
>  - Leave the changes in this patch unmodified otherwise

-- 
Regards,

Laurent Pinchart
