Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7F55990F3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2627C10E746;
	Thu, 18 Aug 2022 23:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A2910E7FB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 23:08:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FED08B;
 Fri, 19 Aug 2022 01:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660864119;
 bh=4PW0JoB03TlII/YoouL7jQizC1IyM+yy8mabacxO+gQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UdH6mVd6rDYDxPUVxru3l0Xei79gzGoJTMrC3IqfTFzlgYczifoyZ+XZI6wN7opwA
 r3rvhu0vH4/QbL6DbYoJIz0EYFn58xavLauFrbdVivwbKWp45Km1qvzifRgxAYK68B
 jU/Gix7Cw+IRHCUy6NrvEM4+iFchBirF0GTZMMwU=
Date: Fri, 19 Aug 2022 02:08:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hsia-Jun Li <randy.li@synaptics.com>
Subject: Re: [PATCH 0/2] Add pixel formats used in Synatpics SoC
Message-ID: <Yv7Gc+mSEXBnV0Oc@pendragon.ideasonboard.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220808162750.828001-1-randy.li@synaptics.com>
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
Cc: linux-arm-kernel@lists.infradead.org, tfiga@chromium.org,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, ezequiel@vanguardiasur.com.ar
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsia-Jun,

On Tue, Aug 09, 2022 at 12:27:48AM +0800, Hsia-Jun Li wrote:
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> 
> Those pixel formats are used in Synaptics's VideoSmart series SoCs,
> likes VS640, VS680.  I just disclose the pixel formats used in the video
> codecs and display pipeline this time. Actually any device with a MTR
> module could support those tiled and compressed pixel formats. The more
> detail about MTR module could be found in the first patch of this serial
> of mail.
> 
> We may not be able to post any drivers here in a short time, the most of
> work in this platform is done in the Trusted Execution Environment and
> we didn't use the optee framework.

Is that so for the display side too, or only for the video decoder ?

> Please notice that, the memory planes used for video codecs would be 5
> when the compression is invoked while it would be 4 for display, the
> extra planes in the video codecs is for the decoding internally usage,
> it can't append the luma or chroma buffer as many other drivers do,
> because this buffer could be only accessed by the video codecs itself,
> it requests a different memory security attributes. Any other reason is
> described in the v4l pixel formats's patch. I don't know whether a
> different numbers of memory planes between drm and v4l2 is acceptable.

I don't think that's a problem as such, as long as both the V4L2 and DRM
formats make sense on their own.

> I only posted the compression fourcc for the v4l2, because it is really
> hard to put the uncompression version of pixel formats under the fourcc.
> I would be better that we could have something likes format modifers in
> drm here.

Agreed, we need modifiers support in V4L2. This has been discussed
previously ([1]), and a proposal ([2]) has been submitted two years ago,
it needs to be revived.

[1] https://lore.kernel.org/linux-media/20170821155203.GB38943@e107564-lin.cambridge.arm.com/
[2] https://lore.kernel.org/linux-media/20200804192939.2251988-1-helen.koike@collabora.com/

> https://synaptics.com/products/multimedia-solutions
> 
> Hsia-Jun(Randy) Li (2):
>   drm/fourcc: Add Synaptics VideoSmart tiled modifiers
>   [WIP]: media: Add Synaptics compressed tiled format
> 
>  drivers/media/v4l2-core/v4l2-common.c |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c  |  2 ++
>  include/uapi/drm/drm_fourcc.h         | 49 +++++++++++++++++++++++++++
>  include/uapi/linux/videodev2.h        |  2 ++
>  4 files changed, 54 insertions(+)

-- 
Regards,

Laurent Pinchart
