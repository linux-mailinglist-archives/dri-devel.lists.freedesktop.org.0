Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B439F6E276D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6299D10E1BF;
	Fri, 14 Apr 2023 15:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312A310E1BF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 15:51:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64B4E60EDE;
 Fri, 14 Apr 2023 15:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371F6C433D2;
 Fri, 14 Apr 2023 15:51:36 +0000 (UTC)
Message-ID: <04e89fcc-87db-8677-daf9-48aa3cb61b8c@xs4all.nl>
Date: Fri, 14 Apr 2023 17:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 14/20] staging: media: tegra-video: move MIPI
 calibration calls from VI to CSI
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-tegra@vger.kernel.org
References: <20230407133852.2850145-1-luca.ceresoli@bootlin.com>
 <20230407133852.2850145-15-luca.ceresoli@bootlin.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230407133852.2850145-15-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Richard Leitner <richard.leitner@skidata.com>,
 Dmitry Osipenko <digetx@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Luca,

I just encountered an error in this patch, so I have rejected the PR I made.

See below for the details:

On 07/04/2023 15:38, Luca Ceresoli wrote:
> The CSI module does not handle all the MIPI lane calibration procedure,
> leaving a small part of it to the VI module. In doing this,
> tegra_channel_enable_stream() (vi.c) manipulates the private data of the
> upstream subdev casting it to struct 'tegra_csi_channel', which will be
> wrong after introducing a VIP (parallel video input) channel.
> 
> This prevents adding support for the VIP module.  It also breaks the
> logical isolation between modules.
> 
> Since the lane calibration requirement does not exist in the parallel input
> module, moving the calibration function to a per-module op is not
> optimal. Instead move the calibration procedure in the CSI module, together
> with the rest of the calibration procedures. After this change,
> tegra_channel_enable_stream() just calls v4l2_subdev_call() to ask for a
> stream start/stop to the CSI module, which in turn knows all the
> CSI-specific details to implement it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 
> ---
> 
> No changes in v5
> 
> Changed in v4:
>  - Added review tags
> 
> No changes in v3
> No changes in v2
> ---
>  drivers/staging/media/tegra-video/csi.c | 44 ++++++++++++++++++++
>  drivers/staging/media/tegra-video/vi.c  | 54 ++-----------------------
>  2 files changed, 48 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
> index 9a03d5ccdf3c..b93fc879ef3a 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -328,12 +328,42 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
>  	}
>  
>  	csi_chan->pg_mode = chan->pg_mode;
> +
> +	/*
> +	 * Tegra CSI receiver can detect the first LP to HS transition.
> +	 * So, start the CSI stream-on prior to sensor stream-on and
> +	 * vice-versa for stream-off.
> +	 */
>  	ret = csi->ops->csi_start_streaming(csi_chan);
>  	if (ret < 0)
>  		goto finish_calibration;
>  
> +	if (csi_chan->mipi) {
> +		struct v4l2_subdev *src_subdev;
> +		/*
> +		 * TRM has incorrectly documented to wait for done status from
> +		 * calibration logic after CSI interface power on.
> +		 * As per the design, calibration results are latched and applied
> +		 * to the pads only when the link is in LP11 state which will happen
> +		 * during the sensor stream-on.
> +		 * CSI subdev stream-on triggers start of MIPI pads calibration.
> +		 * Wait for calibration to finish here after sensor subdev stream-on.
> +		 */
> +		src_subdev = tegra_channel_get_remote_source_subdev(chan);
> +		ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
> +		err = tegra_mipi_finish_calibration(csi_chan->mipi);
> +
> +		if (ret < 0 && ret != -ENOIOCTLCMD)
> +			goto disable_csi_stream;

If there was an error from s_stream, then tegra_mipi_finish_calibration is called
and it goes to disable_csi_stream...

> +
> +		if (err < 0)
> +			dev_warn(csi->dev, "MIPI calibration failed: %d\n", err);
> +	}
> +
>  	return 0;
>  
> +disable_csi_stream:
> +	csi->ops->csi_stop_streaming(csi_chan);
>  finish_calibration:
>  	if (csi_chan->mipi)
>  		tegra_mipi_finish_calibration(csi_chan->mipi);

...but here tegra_mipi_finish_calibration() is called again, leading to an unlock
imbalance.

This is the callstack:

[  109.894502] IMX274 5-001a: s_stream failed

[  109.900203] =====================================
[  109.904898] WARNING: bad unlock balance detected!
[  109.909594] 6.3.0-rc2-tegra #16 Not tainted
[  109.913774] -------------------------------------
[  109.918470] v4l2-ctl/2000 is trying to release lock (&mipi->lock) at:
[  109.924911] [<ffff80000866b828>] tegra_mipi_finish_calibration+0x84/0xb0
[  109.931621] but there are no more locks to release!
[  109.936489]
               other info that might help us debug this:
[  109.943004] 1 lock held by v4l2-ctl/2000:
[  109.947009]  #0: ffff000083bcf6a8 (&chan->video_lock){....}-{3:3}, at: __video_do_ioctl+0xdc/0x3c8
[  109.955987]
               stack backtrace:
[  109.960336] CPU: 2 PID: 2000 Comm: v4l2-ctl Not tainted 6.3.0-rc2-tegra #16
[  109.967290] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[  109.973200] Call trace:
[  109.975642]  dump_backtrace+0xa0/0xfc
[  109.979308]  show_stack+0x18/0x24
[  109.982622]  dump_stack_lvl+0x48/0x60
[  109.986285]  dump_stack+0x18/0x24
[  109.989598]  print_unlock_imbalance_bug+0x130/0x148
[  109.994472]  lock_release+0x1bc/0x248
[  109.998131]  __mutex_unlock_slowpath+0x48/0x2cc
[  110.002657]  mutex_unlock+0x20/0x2c
[  110.006141]  tegra_mipi_finish_calibration+0x84/0xb0
[  110.011102]  tegra_csi_s_stream+0x260/0x318
[  110.015286]  call_s_stream+0x80/0xcc
[  110.018857]  tegra_channel_set_stream+0x58/0xe4
[  110.023386]  tegra210_vi_start_streaming+0xb0/0x1c8
[  110.028262]  tegra_channel_start_streaming+0x54/0x134
[  110.033311]  vb2_start_streaming+0xbc/0x1b8
[  110.037491]  vb2_core_streamon+0x158/0x260
[  110.041582]  vb2_ioctl_streamon+0x4c/0x90
[  110.045589]  v4l_streamon+0x24/0x30
[  110.049076]  __video_do_ioctl+0x160/0x3c8
[  110.053082]  video_usercopy+0x1f0/0x658
[  110.056916]  video_ioctl2+0x18/0x28
[  110.060404]  v4l2_ioctl+0x40/0x60
[  110.063715]  __arm64_sys_ioctl+0xac/0xf0
[  110.067638]  invoke_syscall+0x48/0x114
[  110.071385]  el0_svc_common.constprop.0+0x44/0xec
[  110.076086]  do_el0_svc+0x38/0x98
[  110.079398]  el0_svc+0x2c/0x84
[  110.082454]  el0t_64_sync_handler+0xf4/0x120
[  110.086722]  el0t_64_sync+0x190/0x194

Regards,

	Hans

> @@ -352,10 +382,24 @@ static int tegra_csi_enable_stream(struct v4l2_subdev *subdev)
>  
>  static int tegra_csi_disable_stream(struct v4l2_subdev *subdev)
>  {
> +	struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
>  	struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>  	struct tegra_csi *csi = csi_chan->csi;
>  	int err;
>  
> +	/*
> +	 * Stream-off subdevices in reverse order to stream-on.
> +	 * Remote source subdev in TPG mode is same as CSI subdev.
> +	 */
> +	if (csi_chan->mipi) {
> +		struct v4l2_subdev *src_subdev;
> +
> +		src_subdev = tegra_channel_get_remote_source_subdev(chan);
> +		err = v4l2_subdev_call(src_subdev, video, s_stream, false);
> +		if (err < 0 && err != -ENOIOCTLCMD)
> +			dev_err_probe(csi->dev, err, "source subdev stream off failed\n");
> +	}
> +
>  	csi->ops->csi_stop_streaming(csi_chan);
>  
>  	if (csi_chan->mipi) {
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index b88532d8d2c9..c76c2a404889 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -197,49 +197,15 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
>  
>  static int tegra_channel_enable_stream(struct tegra_vi_channel *chan)
>  {
> -	struct v4l2_subdev *csi_subdev, *src_subdev;
> -	struct tegra_csi_channel *csi_chan;
> -	int ret, err;
> +	struct v4l2_subdev *subdev;
> +	int ret;
>  
> -	/*
> -	 * Tegra CSI receiver can detect the first LP to HS transition.
> -	 * So, start the CSI stream-on prior to sensor stream-on and
> -	 * vice-versa for stream-off.
> -	 */
> -	csi_subdev = tegra_channel_get_remote_csi_subdev(chan);
> -	ret = v4l2_subdev_call(csi_subdev, video, s_stream, true);
> +	subdev = tegra_channel_get_remote_csi_subdev(chan);
> +	ret = v4l2_subdev_call(subdev, video, s_stream, true);
>  	if (ret < 0 && ret != -ENOIOCTLCMD)
>  		return ret;
>  
> -	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> -		return 0;
> -
> -	csi_chan = v4l2_get_subdevdata(csi_subdev);
> -	/*
> -	 * TRM has incorrectly documented to wait for done status from
> -	 * calibration logic after CSI interface power on.
> -	 * As per the design, calibration results are latched and applied
> -	 * to the pads only when the link is in LP11 state which will happen
> -	 * during the sensor stream-on.
> -	 * CSI subdev stream-on triggers start of MIPI pads calibration.
> -	 * Wait for calibration to finish here after sensor subdev stream-on.
> -	 */
> -	src_subdev = tegra_channel_get_remote_source_subdev(chan);
> -	ret = v4l2_subdev_call(src_subdev, video, s_stream, true);
> -	err = tegra_mipi_finish_calibration(csi_chan->mipi);
> -
> -	if (ret < 0 && ret != -ENOIOCTLCMD)
> -		goto err_disable_csi_stream;
> -
> -	if (err < 0)
> -		dev_warn(csi_chan->csi->dev,
> -			 "MIPI calibration failed: %d\n", err);
> -
>  	return 0;
> -
> -err_disable_csi_stream:
> -	v4l2_subdev_call(csi_subdev, video, s_stream, false);
> -	return ret;
>  }
>  
>  static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
> @@ -247,18 +213,6 @@ static int tegra_channel_disable_stream(struct tegra_vi_channel *chan)
>  	struct v4l2_subdev *subdev;
>  	int ret;
>  
> -	/*
> -	 * Stream-off subdevices in reverse order to stream-on.
> -	 * Remote source subdev in TPG mode is same as CSI subdev.
> -	 */
> -	subdev = tegra_channel_get_remote_source_subdev(chan);
> -	ret = v4l2_subdev_call(subdev, video, s_stream, false);
> -	if (ret < 0 && ret != -ENOIOCTLCMD)
> -		return ret;
> -
> -	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
> -		return 0;
> -
>  	subdev = tegra_channel_get_remote_csi_subdev(chan);
>  	ret = v4l2_subdev_call(subdev, video, s_stream, false);
>  	if (ret < 0 && ret != -ENOIOCTLCMD)

