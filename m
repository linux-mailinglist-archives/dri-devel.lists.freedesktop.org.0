Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3636E5B9F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A040810E6E1;
	Tue, 18 Apr 2023 08:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A72A10E6E1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:08:05 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0CB0E2000B;
 Tue, 18 Apr 2023 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681805281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bm09MHgn/IxsM1ZnaY7gJo6btX/EtZZ52SA10jifV50=;
 b=aeHukUFK1mbmIu8HJstpvbPJH42/rYK7qlVl00oLwE/aqhSFCAZPEXWAj02Aa69T7eKNaH
 29cj2lBjAo/VdAo5MH982EpCOiISWInWNn8l+XeA2pe8zJzd2dyKpOjc2WSk3QE56ONe3x
 olZwOB9+1DKqfpJlWiF52qUBC5JdE64pcpBHw+xSFNWDjEVj1sCuJRSkEwu18cG95iYhfa
 1qDq2pOwBOEQdUly/SBpuHR3aDfpjkKSAaoRYkY/p8KQv1OGiQXdaVhzl4Fs/VDJy6r8Km
 zCt9tLHBf76uC5yZ+v8W7qi6WE6TWKSRUXg9jr0I6sIBlF5/hVJ3F/nwn+OVeQ==
Date: Tue, 18 Apr 2023 10:07:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v5 14/20] staging: media: tegra-video: move MIPI
 calibration calls from VI to CSI
Message-ID: <20230418100756.329305ca@booty>
In-Reply-To: <04e89fcc-87db-8677-daf9-48aa3cb61b8c@xs4all.nl>
References: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
 <20230407133852.2850145-15-luca.ceresoli@bootlin.com>
 <04e89fcc-87db-8677-daf9-48aa3cb61b8c@xs4all.nl>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Fri, 14 Apr 2023 17:51:34 +0200
Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Hi Luca,
> 
> I just encountered an error in this patch, so I have rejected the PR I made.
> 
> See below for the details:
> 
> On 07/04/2023 15:38, Luca Ceresoli wrote:
> > The CSI module does not handle all the MIPI lane calibration procedure,
> > leaving a small part of it to the VI module. In doing this,
> > tegra_channel_enable_stream() (vi.c) manipulates the private data of the
> > upstream subdev casting it to struct 'tegra_csi_channel', which will be
> > wrong after introducing a VIP (parallel video input) channel.
> > 
> > This prevents adding support for the VIP module.  It also breaks the
> > logical isolation between modules.
> > 
> > Since the lane calibration requirement does not exist in the parallel input
> > module, moving the calibration function to a per-module op is not
> > optimal. Instead move the calibration procedure in the CSI module, together
> > with the rest of the calibration procedures. After this change,
> > tegra_channel_enable_stream() just calls v4l2_subdev_call() to ask for a
> > stream start/stop to the CSI module, which in turn knows all the
> > CSI-specific details to implement it.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > 
> > ---
> > 
> > No changes in v5
> > 
> > Changed in v4:
> >  - Added review tags
> > 
> > No changes in v3
> > No changes in v2
> > ---
> >  drivers/staging/media/tegra-video/csi.c | 44 ++++++++++++++++++++
> >  drivers/staging/media/tegra-video/vi.c  | 54 ++-----------------------
> >  2 files changed, 48 insertions(+), 50 deletions(-)
> > 
> > diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> > index 9a03d5ccdf3c..b93fc879ef3a 100644
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -328,12 +328,42 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
> >  	}
> >  
> >  	csi_chan->pg_mode = chan->pg_mode;
> > +
> > +	/*
> > +	 * Tegra CSI receiver can detect the first LP to HS transition.
> > +	 * So, start the CSI stream-on prior to sensor stream-on and
> > +	 * vice-versa for stream-off.
> > +	 */
> >  	ret = csi->ops->csi_start_streaming(csi_chan);
> >  	if (ret < 0)
> >  		goto finish_calibration;
> >  
> > +	if (csi_chan->mipi) {
> > +		struct v4l2_subdev *src_subdev;
> > +		/*
> > +		 * TRM has incorrectly documented to wait for done status from
> > +		 * calibration logic after CSI interface power on.
> > +		 * As per the design, calibration results are latched and applied
> > +		 * to the pads only when the link is in LP11 state which will happen
> > +		 * during the sensor stream-on.
> > +		 * CSI subdev stream-on triggers start of MIPI pads calibration.
> > +		 * Wait for calibration to finish here after sensor subdev stream-on.
> > +		 */
> > +		src_subdev = tegra_channel_get_remote_source_subdev(chan);
> > +		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
> > +		err = tegra_mipi_finish_calibration(csi_chan->mipi);
> > +
> > +		if (ret < 0 && ret != -ENOIOCTLCMD)
> > +			goto disable_csi_stream;  
> 
> If there was an error from s_stream, then tegra_mipi_finish_calibration is called
> and it goes to disable_csi_stream...
> 
> > +
> > +		if (err < 0)
> > +			dev_warn(csi->dev, "MIPI calibration failed: %d\n", err);
> > +	}
> > +
> >  	return 0;
> >  
> > +disable_csi_stream:
> > +	csi->ops->csi_stop_streaming(csi_chan);
> >  finish_calibration:
> >  	if (csi_chan->mipi)
> >  		tegra_mipi_finish_calibration(csi_chan->mipi);  
> 
> ...but here tegra_mipi_finish_calibration() is called again, leading to an unlock
> imbalance.

Many thanks for your testing! Unfortunately I have no Tegra210 hardware
so this never happened here, but with your report the problem got
obvious and, luckily, the fix appeared to be just a oneliner.

v6 just sent! I'm wondering whether there is still hope to get this
6.4...

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
