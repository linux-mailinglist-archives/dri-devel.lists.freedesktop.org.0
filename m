Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ED78D7CE4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0113610E2F5;
	Mon,  3 Jun 2024 07:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F0210E2F5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 07:57:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9210560C05;
 Mon,  3 Jun 2024 07:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469DBC2BD10;
 Mon,  3 Jun 2024 07:57:31 +0000 (UTC)
Message-ID: <c5f40d46-9e8d-40f9-82ee-83013dbc134e@xs4all.nl>
Date: Mon, 3 Jun 2024 09:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] media: Add Chameleon v3 video interface driver
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, airlied@gmail.com,
 akpm@linux-foundation.org, conor+dt@kernel.org, daniel@ffwll.ch,
 dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 chromeos-krk-upstreaming@google.com
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-2-panikiel@google.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240507155413.266057-2-panikiel@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 07/05/2024 17:54, Paweł Anikiel wrote:
> Add v4l2 driver for the video interface present on the Google
> Chameleon v3. The Chameleon v3 uses the video interface to capture
> a single video source from a given HDMI or DP connector and write
> the resulting frames to memory.
> 
> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> ---
>  drivers/media/platform/Kconfig             |   1 +
>  drivers/media/platform/Makefile            |   1 +
>  drivers/media/platform/google/Kconfig      |  13 +
>  drivers/media/platform/google/Makefile     |   3 +
>  drivers/media/platform/google/chv3-video.c | 891 +++++++++++++++++++++
>  5 files changed, 909 insertions(+)
>  create mode 100644 drivers/media/platform/google/Kconfig
>  create mode 100644 drivers/media/platform/google/Makefile
>  create mode 100644 drivers/media/platform/google/chv3-video.c
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 91e54215de3a..b82f7b142b85 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -69,6 +69,7 @@ source "drivers/media/platform/aspeed/Kconfig"
>  source "drivers/media/platform/atmel/Kconfig"
>  source "drivers/media/platform/cadence/Kconfig"
>  source "drivers/media/platform/chips-media/Kconfig"
> +source "drivers/media/platform/google/Kconfig"
>  source "drivers/media/platform/intel/Kconfig"
>  source "drivers/media/platform/marvell/Kconfig"
>  source "drivers/media/platform/mediatek/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 3296ec1ebe16..f7067eb05f76 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -12,6 +12,7 @@ obj-y += aspeed/
>  obj-y += atmel/
>  obj-y += cadence/
>  obj-y += chips-media/
> +obj-y += google/
>  obj-y += intel/
>  obj-y += marvell/
>  obj-y += mediatek/
> diff --git a/drivers/media/platform/google/Kconfig b/drivers/media/platform/google/Kconfig
> new file mode 100644
> index 000000000000..9674a4c12e2d
> --- /dev/null
> +++ b/drivers/media/platform/google/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_CHAMELEONV3
> +	tristate "Google Chameleon v3 video driver"
> +	depends on V4L_PLATFORM_DRIVERS
> +	depends on VIDEO_DEV
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_FWNODE
> +	help
> +	  v4l2 driver for the video interface present on the Google
> +	  Chameleon v3. The Chameleon v3 uses the video interface to
> +	  capture a single video source from a given HDMI or DP connector
> +	  and write the resulting frames to memory.
> diff --git a/drivers/media/platform/google/Makefile b/drivers/media/platform/google/Makefile
> new file mode 100644
> index 000000000000..cff06486244c
> --- /dev/null
> +++ b/drivers/media/platform/google/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_VIDEO_CHAMELEONV3) += chv3-video.o
> diff --git a/drivers/media/platform/google/chv3-video.c b/drivers/media/platform/google/chv3-video.c
> new file mode 100644
> index 000000000000..6e782484abaf
> --- /dev/null
> +++ b/drivers/media/platform/google/chv3-video.c
> @@ -0,0 +1,891 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2023-2024 Google LLC.
> + * Author: Paweł Anikiel <panikiel@google.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/v4l2-dv-timings.h>
> +#include <linux/videodev2.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-dv-timings.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#define DEVICE_NAME	"chv3-video"
> +
> +#define VIDEO_EN			0x00
> +#define VIDEO_EN_BIT			BIT(0)
> +#define VIDEO_HEIGHT			0x04
> +#define VIDEO_WIDTH			0x08
> +#define VIDEO_BUFFERA			0x0c
> +#define VIDEO_BUFFERB			0x10
> +#define VIDEO_BUFFERSIZE		0x14
> +#define VIDEO_RESET			0x18
> +#define VIDEO_RESET_BIT			BIT(0)
> +#define VIDEO_ERRORSTATUS		0x1c
> +#define VIDEO_IOCOLOR			0x20
> +#define VIDEO_DATARATE			0x24
> +#define VIDEO_DATARATE_SINGLE		0x0
> +#define VIDEO_DATARATE_DOUBLE		0x1
> +#define VIDEO_PIXELMODE			0x28
> +#define VIDEO_PIXELMODE_SINGLE		0x0
> +#define VIDEO_PIXELMODE_DOUBLE		0x1
> +#define VIDEO_SYNCPOLARITY		0x2c
> +#define VIDEO_DMAFORMAT			0x30
> +#define VIDEO_DMAFORMAT_8BPC		0x0
> +#define VIDEO_DMAFORMAT_10BPC_UPPER	0x1
> +#define VIDEO_DMAFORMAT_10BPC_LOWER	0x2
> +#define VIDEO_DMAFORMAT_12BPC_UPPER	0x3
> +#define VIDEO_DMAFORMAT_12BPC_LOWER	0x4
> +#define VIDEO_DMAFORMAT_16BPC		0x5
> +#define VIDEO_DMAFORMAT_RAW		0x6
> +#define VIDEO_DMAFORMAT_8BPC_PAD	0x7
> +#define VIDEO_VERSION			0x34
> +#define VIDEO_VERSION_CURRENT		0xc0fb0001
> +
> +#define VIDEO_IRQ_MASK		0x8
> +#define VIDEO_IRQ_CLR		0xc
> +#define VIDEO_IRQ_ALL		0xf
> +#define VIDEO_IRQ_BUFF0		BIT(0)
> +#define VIDEO_IRQ_BUFF1		BIT(1)
> +#define VIDEO_IRQ_RESOLUTION	BIT(2)
> +#define VIDEO_IRQ_ERROR		BIT(3)
> +
> +struct chv3_video {
> +	struct device *dev;
> +	void __iomem *iobase;
> +	void __iomem *iobase_irq;
> +
> +	struct v4l2_device v4l2_dev;
> +	struct vb2_queue queue;
> +	struct video_device vdev;
> +	struct v4l2_pix_format pix_fmt;
> +	struct v4l2_dv_timings timings;
> +	u32 bytes_per_pixel;
> +
> +	struct v4l2_ctrl_handler ctrl_handler;
> +	struct v4l2_async_notifier notifier;
> +	struct v4l2_subdev *subdev;
> +	int subdev_source_pad;
> +
> +	u32 sequence;
> +	bool writing_to_a;
> +
> +	struct list_head bufs;
> +	spinlock_t bufs_lock;
> +
> +	struct mutex video_lock;
> +};
> +
> +struct chv3_video_buffer {
> +	struct vb2_v4l2_buffer vb;
> +	struct list_head link;
> +};
> +
> +struct chv3_video_config {
> +	u32 pixelformat;
> +	u32 bytes_per_pixel;
> +	u32 dmaformat;
> +};
> +
> +static void chv3_video_set_format_resolution(struct chv3_video *video, u32 width, u32 height)
> +{
> +	video->pix_fmt.width = width;
> +	video->pix_fmt.height = height;
> +	video->pix_fmt.bytesperline = width * video->bytes_per_pixel;
> +	video->pix_fmt.sizeimage = video->pix_fmt.bytesperline * height;
> +}
> +
> +/*
> + * The video interface has hardware counters which expose the width and
> + * height of the current video stream. It can't reliably detect if the stream
> + * is present or not, so this is only used as a fallback in the case where
> + * we don't have access to the receiver hardware.
> + */
> +static int chv3_video_query_dv_timings_fallback(struct chv3_video *video,
> +						struct v4l2_dv_timings *timings)
> +{
> +	u32 width, height;
> +
> +	width  = readl(video->iobase + VIDEO_WIDTH);
> +	height = readl(video->iobase + VIDEO_HEIGHT);
> +	if (width == 0 || height == 0)
> +		return -ENOLINK;
> +
> +	memset(timings, 0, sizeof(*timings));
> +	timings->type = V4L2_DV_BT_656_1120;
> +	timings->bt.width  = width;
> +	timings->bt.height = height;
> +	timings->bt.pixelclock = width * height * 24;
> +
> +	return 0;
> +}
> +
> +static int chv3_video_query_dv_timings(struct chv3_video *video, struct v4l2_dv_timings *timings)
> +{
> +	if (video->subdev) {
> +		return v4l2_subdev_call(video->subdev, pad, query_dv_timings,
> +					video->subdev_source_pad, timings);
> +	} else {
> +		return chv3_video_query_dv_timings_fallback(video, timings);
> +	}

I would move the contents of chv3_video_query_dv_timings_fallback() to this
function and drop the old fallback function. It makes more sense if it is all
in the same function.

> +}
> +
> +static const struct v4l2_dv_timings_cap chv3_video_fallback_dv_timings_cap = {
> +	.type = V4L2_DV_BT_656_1120,
> +	.bt = {
> +		.min_width = 640,
> +		.max_width = 7680,
> +		.min_height = 480,
> +		.max_height = 4320,
> +		.min_pixelclock = 25000000,
> +		.max_pixelclock = 1080000000,
> +		.standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
> +			V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
> +		.capabilities = V4L2_DV_BT_CAP_PROGRESSIVE |
> +			V4L2_DV_BT_CAP_REDUCED_BLANKING |
> +			V4L2_DV_BT_CAP_CUSTOM,
> +	},
> +};
> +
> +static int chv3_video_enum_dv_timings_fallback(struct chv3_video *video,
> +					       struct v4l2_enum_dv_timings *timings)
> +{
> +	return v4l2_enum_dv_timings_cap(timings, &chv3_video_fallback_dv_timings_cap,
> +					NULL, NULL);
> +}
> +
> +static int chv3_video_dv_timings_cap_fallback(struct chv3_video *video,
> +					      struct v4l2_dv_timings_cap *cap)
> +{
> +	*cap = chv3_video_fallback_dv_timings_cap;
> +
> +	return 0;
> +}

Same for these two fallback functions: move them to the functions that calls them.

> +
> +static void chv3_video_apply_dv_timings(struct chv3_video *video)
> +{
> +	struct v4l2_dv_timings timings;
> +	int res;
> +
> +	res = chv3_video_query_dv_timings(video, &timings);
> +	if (res)
> +		return;
> +
> +	video->timings = timings;
> +	chv3_video_set_format_resolution(video, timings.bt.width, timings.bt.height);
> +}
> +
> +static int chv3_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, DEVICE_NAME, sizeof(cap->driver));
> +	strscpy(cap->card, "Chameleon v3 video", sizeof(cap->card));
> +
> +	return 0;
> +}
> +
> +static int chv3_video_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +
> +	fmt->fmt.pix = video->pix_fmt;
> +
> +	return 0;
> +}
> +
> +static int chv3_video_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *fmt)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +
> +	if (fmt->index != 0)
> +		return -EINVAL;
> +
> +	fmt->flags = 0;
> +	fmt->pixelformat = video->pix_fmt.pixelformat;
> +
> +	return 0;
> +}
> +
> +static int chv3_video_g_input(struct file *file, void *fh, unsigned int *index)
> +{
> +	*index = 0;
> +
> +	return 0;
> +}
> +
> +static int chv3_video_s_input(struct file *file, void *fh, unsigned int index)
> +{
> +	if (index != 0)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int chv3_video_enum_input(struct file *file, void *fh, struct v4l2_input *input)
> +{
> +	if (input->index != 0)
> +		return -EINVAL;
> +
> +	strscpy(input->name, "input0", sizeof(input->name));

This name is not terribly user friendly. Is it possible to determine a more human
readable name? E.g. "DP1", "DP2", etc. Something that matches labeling on the Chameleon
board.

> +	input->type = V4L2_INPUT_TYPE_CAMERA;
> +	input->capabilities = V4L2_IN_CAP_DV_TIMINGS;
> +
> +	return 0;
> +}
> +
> +static int chv3_video_g_edid(struct file *file, void *fh, struct v4l2_edid *edid)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +	int res;
> +
> +	if (!video->subdev)
> +		return -ENOTTY;
> +
> +	if (edid->pad != 0)
> +		return -EINVAL;
> +
> +	edid->pad = video->subdev_source_pad;
> +	res = v4l2_subdev_call(video->subdev, pad, get_edid, edid);
> +	edid->pad = 0;
> +
> +	return res;
> +}
> +
> +static int chv3_video_s_edid(struct file *file, void *fh, struct v4l2_edid *edid)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +	int res;
> +
> +	if (!video->subdev)
> +		return -ENOTTY;
> +
> +	if (edid->pad != 0)
> +		return -EINVAL;
> +
> +	edid->pad = video->subdev_source_pad;
> +	res = v4l2_subdev_call(video->subdev, pad, set_edid, edid);
> +	edid->pad = 0;
> +
> +	return res;
> +}
> +
> +static int chv3_video_s_dv_timings(struct file *file, void *fh, struct v4l2_dv_timings *timings)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +
> +	if (v4l2_match_dv_timings(&video->timings, timings, 0, false))
> +		return 0;
> +
> +	if (vb2_is_busy(&video->queue))
> +		return -EBUSY;

This should be moved to after the next 'if'.

> +
> +	if (!v4l2_valid_dv_timings(timings, &chv3_video_fallback_dv_timings_cap, NULL, NULL))
> +		return -ERANGE;
> +
> +	video->timings = *timings;
> +	chv3_video_set_format_resolution(video, timings->bt.width, timings->bt.height);
> +
> +	return 0;
> +}
> +
> +static int chv3_video_g_dv_timings(struct file *file, void *fh, struct v4l2_dv_timings *timings)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +
> +	*timings = video->timings;
> +	return 0;
> +}
> +
> +static int chv3_video_vidioc_query_dv_timings(struct file *file, void *fh,
> +					      struct v4l2_dv_timings *timings)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +
> +	return chv3_video_query_dv_timings(video, timings);
> +}
> +
> +static int chv3_video_enum_dv_timings(struct file *file, void *fh,
> +				      struct v4l2_enum_dv_timings *timings)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +	int res;
> +
> +	if (timings->pad != 0)
> +		return -EINVAL;
> +
> +	if (video->subdev) {
> +		timings->pad = video->subdev_source_pad;
> +		res = v4l2_subdev_call(video->subdev, pad, enum_dv_timings, timings);
> +		timings->pad = 0;
> +		return res;
> +	} else {
> +		return chv3_video_enum_dv_timings_fallback(video, timings);

It is much easier to read if the contents of chv3_video_enum_dv_timings_fallback
is moved here.

> +	}
> +}
> +
> +static int chv3_video_dv_timings_cap(struct file *file, void *fh, struct v4l2_dv_timings_cap *cap)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +	int res;
> +
> +	if (cap->pad != 0)
> +		return -EINVAL;
> +
> +	if (video->subdev) {
> +		cap->pad = video->subdev_source_pad;
> +		res = v4l2_subdev_call(video->subdev, pad, dv_timings_cap, cap);
> +		cap->pad = 0;
> +		return res;
> +	} else {
> +		return chv3_video_dv_timings_cap_fallback(video, cap);

Ditto.

> +	}
> +}
> +
> +static int chv3_video_subscribe_event(struct v4l2_fh *fh,
> +				      const struct v4l2_event_subscription *sub)
> +{
> +	switch (sub->type) {
> +	case V4L2_EVENT_SOURCE_CHANGE:
> +		return v4l2_src_change_event_subscribe(fh, sub);
> +	}
> +
> +	return v4l2_ctrl_subscribe_event(fh, sub);
> +}
> +
> +static const struct v4l2_ioctl_ops chv3_video_v4l2_ioctl_ops = {
> +	.vidioc_querycap = chv3_video_querycap,
> +
> +	.vidioc_enum_fmt_vid_cap = chv3_video_enum_fmt_vid_cap,
> +	.vidioc_g_fmt_vid_cap = chv3_video_g_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap = chv3_video_g_fmt_vid_cap,
> +	.vidioc_try_fmt_vid_cap = chv3_video_g_fmt_vid_cap,
> +
> +	.vidioc_enum_input = chv3_video_enum_input,
> +	.vidioc_g_input = chv3_video_g_input,
> +	.vidioc_s_input = chv3_video_s_input,
> +	.vidioc_g_edid = chv3_video_g_edid,
> +	.vidioc_s_edid = chv3_video_s_edid,
> +
> +	.vidioc_reqbufs = vb2_ioctl_reqbufs,
> +	.vidioc_create_bufs = vb2_ioctl_create_bufs,
> +	.vidioc_querybuf = vb2_ioctl_querybuf,
> +	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
> +	.vidioc_expbuf = vb2_ioctl_expbuf,
> +	.vidioc_qbuf = vb2_ioctl_qbuf,
> +	.vidioc_dqbuf = vb2_ioctl_dqbuf,
> +	.vidioc_streamon = vb2_ioctl_streamon,
> +	.vidioc_streamoff = vb2_ioctl_streamoff,
> +
> +	.vidioc_s_dv_timings = chv3_video_s_dv_timings,
> +	.vidioc_g_dv_timings = chv3_video_g_dv_timings,
> +	.vidioc_query_dv_timings = chv3_video_vidioc_query_dv_timings,
> +	.vidioc_enum_dv_timings = chv3_video_enum_dv_timings,
> +	.vidioc_dv_timings_cap = chv3_video_dv_timings_cap,
> +
> +	.vidioc_subscribe_event = chv3_video_subscribe_event,
> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> +};
> +
> +static int chv3_video_queue_setup(struct vb2_queue *q,
> +				  unsigned int *nbuffers, unsigned int *nplanes,
> +				  unsigned int sizes[], struct device *alloc_devs[])
> +{
> +	struct chv3_video *video = vb2_get_drv_priv(q);
> +
> +	if (*nplanes) {
> +		if (sizes[0] < video->pix_fmt.sizeimage)
> +			return -EINVAL;
> +		return 0;
> +	}
> +	*nplanes = 1;
> +	sizes[0] = video->pix_fmt.sizeimage;
> +
> +	return 0;
> +}
> +
> +/*
> + * There are two address registers: BUFFERA and BUFFERB. The device
> + * alternates writing between them (i.e. even frames go to BUFFERA, odd
> + * ones to BUFFERB).
> + *
> + *  (buffer queue) >     QUEUED ---> QUEUED ---> QUEUED ---> ...
> + *                       BUFFERA     BUFFERB
> + *  (hw writing to this) ^
> + *                (and then to this) ^
> + *
> + * The buffer swapping happens at irq time. When an irq comes, the next
> + * frame is already assigned an address in the buffer queue. This gives
> + * the irq handler a whole frame's worth of time to update the buffer
> + * address register.
> + */
> +
> +static dma_addr_t chv3_video_buffer_dma_addr(struct chv3_video_buffer *buf)
> +{
> +	return vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
> +}
> +
> +static void chv3_video_start_frame(struct chv3_video *video, struct chv3_video_buffer *buf)
> +{
> +	video->writing_to_a = 1;
> +	writel(chv3_video_buffer_dma_addr(buf), video->iobase + VIDEO_BUFFERA);
> +	writel(VIDEO_EN_BIT, video->iobase + VIDEO_EN);
> +}
> +
> +static void chv3_video_next_frame(struct chv3_video *video, struct chv3_video_buffer *buf)
> +{
> +	u32 reg = video->writing_to_a ? VIDEO_BUFFERB : VIDEO_BUFFERA;
> +
> +	writel(chv3_video_buffer_dma_addr(buf), video->iobase + reg);
> +}
> +
> +static int chv3_video_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +	struct chv3_video *video = vb2_get_drv_priv(q);
> +	struct chv3_video_buffer *buf;
> +	unsigned long flags;
> +
> +	video->sequence = 0;
> +	writel(video->pix_fmt.sizeimage, video->iobase + VIDEO_BUFFERSIZE);
> +
> +	spin_lock_irqsave(&video->bufs_lock, flags);
> +	buf = list_first_entry_or_null(&video->bufs, struct chv3_video_buffer, link);
> +	if (buf) {
> +		chv3_video_start_frame(video, buf);
> +		if (!list_is_last(&buf->link, &video->bufs))
> +			chv3_video_next_frame(video, list_next_entry(buf, link));
> +	}
> +	spin_unlock_irqrestore(&video->bufs_lock, flags);
> +
> +	return 0;
> +}
> +
> +static void chv3_video_stop_streaming(struct vb2_queue *q)
> +{
> +	struct chv3_video *video = vb2_get_drv_priv(q);
> +	struct chv3_video_buffer *buf;
> +	unsigned long flags;
> +
> +	writel(0, video->iobase + VIDEO_EN);
> +
> +	spin_lock_irqsave(&video->bufs_lock, flags);
> +	list_for_each_entry(buf, &video->bufs, link)
> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +	INIT_LIST_HEAD(&video->bufs);
> +	spin_unlock_irqrestore(&video->bufs_lock, flags);
> +}
> +
> +static void chv3_video_buf_queue(struct vb2_buffer *vb)
> +{
> +	struct chv3_video *video = vb2_get_drv_priv(vb->vb2_queue);
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
> +	struct chv3_video_buffer *buf = container_of(v4l2_buf, struct chv3_video_buffer, vb);
> +	bool first, second;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&video->bufs_lock, flags);
> +	first = list_empty(&video->bufs);
> +	second = list_is_singular(&video->bufs);
> +	list_add_tail(&buf->link, &video->bufs);
> +	if (vb2_is_streaming(vb->vb2_queue)) {

This should be vb2_start_streaming_called().

It does not matter all that much in this driver, since VIDIOC_STREAMON will
also call start_streaming, even if there are no buffers queued since the
vb2_queue min_queued_buffers field is 0. But if that ever changes, then
vb2_start_streaming_called() is the right call here.

> +		if (first)
> +			chv3_video_start_frame(video, buf);
> +		else if (second)
> +			chv3_video_next_frame(video, buf);
> +	}
> +	spin_unlock_irqrestore(&video->bufs_lock, flags);
> +}
> +
> +static const struct vb2_ops chv3_video_vb2_ops = {
> +	.queue_setup = chv3_video_queue_setup,
> +	.wait_prepare = vb2_ops_wait_prepare,
> +	.wait_finish = vb2_ops_wait_finish,
> +	.start_streaming = chv3_video_start_streaming,
> +	.stop_streaming = chv3_video_stop_streaming,
> +	.buf_queue = chv3_video_buf_queue,
> +};
> +
> +static int chv3_video_open(struct file *file)
> +{
> +	struct chv3_video *video = video_drvdata(file);
> +	int res;
> +
> +	mutex_lock(&video->video_lock);
> +	res = v4l2_fh_open(file);
> +	if (!res) {
> +		if (v4l2_fh_is_singular_file(file))
> +			chv3_video_apply_dv_timings(video);
> +	}
> +	mutex_unlock(&video->video_lock);
> +
> +	return res;
> +}
> +
> +static const struct v4l2_file_operations chv3_video_v4l2_fops = {
> +	.owner = THIS_MODULE,
> +	.open = chv3_video_open,
> +	.release = vb2_fop_release,
> +	.unlocked_ioctl = video_ioctl2,
> +	.mmap = vb2_fop_mmap,
> +	.poll = vb2_fop_poll,
> +};
> +
> +static void chv3_video_frame_irq(struct chv3_video *video)
> +{
> +	struct chv3_video_buffer *buf;
> +
> +	spin_lock(&video->bufs_lock);
> +
> +	buf = list_first_entry_or_null(&video->bufs, struct chv3_video_buffer, link);
> +	if (!buf)
> +		goto empty;
> +	list_del(&buf->link);
> +
> +	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, video->pix_fmt.sizeimage);
> +	buf->vb.vb2_buf.timestamp = ktime_get_ns();
> +	buf->vb.sequence = video->sequence++;
> +	buf->vb.field = V4L2_FIELD_NONE;
> +	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +
> +	buf = list_first_entry_or_null(&video->bufs, struct chv3_video_buffer, link);
> +	if (buf) {
> +		video->writing_to_a = !video->writing_to_a;
> +		if (!list_is_last(&buf->link, &video->bufs))
> +			chv3_video_next_frame(video, list_next_entry(buf, link));
> +	} else {
> +		writel(0, video->iobase + VIDEO_EN);
> +	}
> +empty:
> +	spin_unlock(&video->bufs_lock);
> +}
> +
> +static void chv3_video_error_irq(struct chv3_video *video)
> +{
> +	if (vb2_is_streaming(&video->queue))
> +		vb2_queue_error(&video->queue);
> +}
> +
> +static void chv3_video_resolution_irq(struct chv3_video *video)
> +{
> +	static const struct v4l2_event event = {
> +		.type = V4L2_EVENT_SOURCE_CHANGE,
> +		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
> +	};
> +
> +	v4l2_event_queue(&video->vdev, &event);
> +	chv3_video_error_irq(video);
> +}
> +
> +static irqreturn_t chv3_video_isr(int irq, void *data)
> +{
> +	struct chv3_video *video = data;
> +	unsigned int reg;
> +
> +	reg = readl(video->iobase_irq + VIDEO_IRQ_CLR);
> +	if (!reg)
> +		return IRQ_NONE;
> +
> +	if (reg & VIDEO_IRQ_BUFF0)
> +		chv3_video_frame_irq(video);
> +	if (reg & VIDEO_IRQ_BUFF1)
> +		chv3_video_frame_irq(video);
> +	if (reg & VIDEO_IRQ_RESOLUTION)
> +		chv3_video_resolution_irq(video);
> +	if (reg & VIDEO_IRQ_ERROR) {
> +		dev_warn(video->dev, "error: 0x%x\n",
> +			 readl(video->iobase + VIDEO_ERRORSTATUS));
> +		chv3_video_error_irq(video);
> +	}
> +
> +	writel(reg, video->iobase_irq + VIDEO_IRQ_CLR);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int chv3_video_check_version(struct chv3_video *video)
> +{
> +	u32 version;
> +
> +	version = readl(video->iobase + VIDEO_VERSION);
> +	if (version != VIDEO_VERSION_CURRENT) {
> +		dev_err(video->dev,
> +			"wrong hw version: expected %x, got %x\n",
> +			VIDEO_VERSION_CURRENT, version);
> +		return -ENODEV;
> +	}
> +	return 0;
> +}
> +
> +static void chv3_video_init_timings_and_format(struct chv3_video *video,
> +					       const struct chv3_video_config *config)
> +{
> +	struct v4l2_pix_format *pix = &video->pix_fmt;
> +	struct v4l2_dv_timings timings = V4L2_DV_BT_CEA_1920X1080P60;
> +
> +	video->timings = timings;
> +	video->bytes_per_pixel = config->bytes_per_pixel;
> +
> +	pix->pixelformat = config->pixelformat;
> +	pix->field = V4L2_FIELD_NONE;
> +	pix->colorspace = V4L2_COLORSPACE_SRGB;
> +	chv3_video_set_format_resolution(video, timings.bt.width, timings.bt.height);
> +}
> +
> +#define notifier_to_video(nf) container_of(nf, struct chv3_video, notifier)
> +
> +static int chv3_video_async_notify_bound(struct v4l2_async_notifier *notifier,
> +					 struct v4l2_subdev *subdev,
> +					 struct v4l2_async_connection *asc)
> +{
> +	struct chv3_video *video = notifier_to_video(notifier);
> +	int pad;
> +
> +	pad = media_entity_get_fwnode_pad(&subdev->entity, asc->match.fwnode,
> +					  MEDIA_PAD_FL_SOURCE);
> +	if (pad < 0)
> +		return pad;
> +
> +	video->subdev = subdev;
> +	video->subdev_source_pad = pad;
> +
> +	video->v4l2_dev.ctrl_handler = subdev->ctrl_handler;
> +
> +	return 0;
> +}
> +
> +static void chv3_video_async_notify_unbind(struct v4l2_async_notifier *notifier,
> +					   struct v4l2_subdev *subdev,
> +					   struct v4l2_async_connection *asc)
> +{
> +	struct chv3_video *video = notifier_to_video(notifier);
> +
> +	vb2_video_unregister_device(&video->vdev);
> +}
> +
> +static int chv3_video_async_notify_complete(struct v4l2_async_notifier *notifier)
> +{
> +	struct chv3_video *video = notifier_to_video(notifier);
> +
> +	return video_register_device(&video->vdev, VFL_TYPE_VIDEO, -1);
> +}
> +
> +static const struct v4l2_async_notifier_operations chv3_video_async_notify_ops = {
> +	.bound = chv3_video_async_notify_bound,
> +	.unbind = chv3_video_async_notify_unbind,
> +	.complete = chv3_video_async_notify_complete,
> +};
> +
> +static int chv3_video_fallback_init(struct chv3_video *video)
> +{
> +	int res;
> +
> +	video->subdev = NULL;
> +	video->subdev_source_pad = 0;
> +
> +	v4l2_ctrl_handler_init(&video->ctrl_handler, 1);
> +	v4l2_ctrl_new_std(&video->ctrl_handler, NULL,
> +			  V4L2_CID_DV_RX_POWER_PRESENT, 0, 1, 0, 0);
> +	res = video->ctrl_handler.error;
> +	if (res)
> +		goto handler_free;
> +
> +	video->v4l2_dev.ctrl_handler = &video->ctrl_handler;
> +
> +	res = video_register_device(&video->vdev, VFL_TYPE_VIDEO, -1);
> +	if (res)
> +		goto handler_free;
> +
> +	return 0;
> +
> +handler_free:
> +	v4l2_ctrl_handler_free(&video->ctrl_handler);
> +
> +	return res;
> +}
> +
> +static int chv3_video_fwnode_init(struct chv3_video *video)
> +{
> +	struct v4l2_async_connection *asc;
> +	struct fwnode_handle *endpoint;
> +	int res;
> +
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(video->dev), NULL);
> +	if (!endpoint)
> +		return -EINVAL;
> +
> +	v4l2_async_nf_init(&video->notifier, &video->v4l2_dev);
> +
> +	asc = v4l2_async_nf_add_fwnode_remote(&video->notifier, endpoint,
> +					      struct v4l2_async_connection);
> +	fwnode_handle_put(endpoint);
> +
> +	if (IS_ERR(asc))
> +		return PTR_ERR(asc);
> +
> +	video->notifier.ops = &chv3_video_async_notify_ops;
> +	res = v4l2_async_nf_register(&video->notifier);
> +	if (res) {
> +		v4l2_async_nf_cleanup(&video->notifier);
> +		return res;
> +	}
> +
> +	return 0;
> +}
> +
> +static int chv3_video_probe(struct platform_device *pdev)
> +{
> +	struct chv3_video *video;
> +	const struct chv3_video_config *config;
> +	int res;
> +	int irq;
> +
> +	video = devm_kzalloc(&pdev->dev, sizeof(*video), GFP_KERNEL);
> +	if (!video)
> +		return -ENOMEM;
> +	video->dev = &pdev->dev;
> +	platform_set_drvdata(pdev, video);
> +
> +	config = device_get_match_data(video->dev);
> +
> +	/* map register space */
> +	video->iobase = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(video->iobase))
> +		return PTR_ERR(video->iobase);
> +
> +	video->iobase_irq = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(video->iobase_irq))
> +		return PTR_ERR(video->iobase_irq);
> +
> +	/* check hw version */
> +	res = chv3_video_check_version(video);
> +	if (res)
> +		return res;
> +
> +	/* setup interrupts */
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return -ENXIO;
> +	res = devm_request_irq(&pdev->dev, irq, chv3_video_isr, 0, DEVICE_NAME, video);
> +	if (res)
> +		return res;
> +
> +	/* initialize v4l2_device */
> +	res = v4l2_device_register(&pdev->dev, &video->v4l2_dev);
> +	if (res)
> +		return res;
> +
> +	/* initialize vb2 queue */
> +	video->queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +	video->queue.io_modes = VB2_MMAP | VB2_DMABUF;
> +	video->queue.dev = &pdev->dev;
> +	video->queue.lock = &video->video_lock;
> +	video->queue.ops = &chv3_video_vb2_ops;
> +	video->queue.mem_ops = &vb2_dma_contig_memops;
> +	video->queue.drv_priv = video;
> +	video->queue.buf_struct_size = sizeof(struct chv3_video_buffer);
> +	video->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> +	res = vb2_queue_init(&video->queue);
> +	if (res)
> +		goto error;
> +
> +	/* initialize video_device */
> +	strscpy(video->vdev.name, DEVICE_NAME, sizeof(video->vdev.name));
> +	video->vdev.fops = &chv3_video_v4l2_fops;
> +	video->vdev.ioctl_ops = &chv3_video_v4l2_ioctl_ops;
> +	video->vdev.lock = &video->video_lock;
> +	video->vdev.release = video_device_release_empty;
> +	video->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +	video->vdev.v4l2_dev = &video->v4l2_dev;
> +	video->vdev.queue = &video->queue;
> +	video_set_drvdata(&video->vdev, video);
> +
> +	if (device_get_named_child_node(&pdev->dev, "port"))
> +		res = chv3_video_fwnode_init(video);
> +	else
> +		res = chv3_video_fallback_init(video);
> +	if (res)
> +		goto error;
> +
> +	/* initialize rest of driver struct */
> +	INIT_LIST_HEAD(&video->bufs);
> +	spin_lock_init(&video->bufs_lock);
> +	mutex_init(&video->video_lock);
> +
> +	chv3_video_init_timings_and_format(video, config);
> +
> +	/* initialize hw */
> +	writel(VIDEO_RESET_BIT, video->iobase + VIDEO_RESET);
> +	writel(VIDEO_DATARATE_DOUBLE, video->iobase + VIDEO_DATARATE);
> +	writel(VIDEO_PIXELMODE_DOUBLE, video->iobase + VIDEO_PIXELMODE);
> +	writel(config->dmaformat, video->iobase + VIDEO_DMAFORMAT);
> +
> +	writel(VIDEO_IRQ_ALL, video->iobase_irq + VIDEO_IRQ_MASK);
> +
> +	return 0;
> +
> +error:
> +	v4l2_device_unregister(&video->v4l2_dev);
> +
> +	return res;
> +}
> +
> +static void chv3_video_remove(struct platform_device *pdev)
> +{
> +	struct chv3_video *video = platform_get_drvdata(pdev);
> +
> +	/* disable interrupts */
> +	writel(0, video->iobase_irq + VIDEO_IRQ_MASK);
> +
> +	if (video->subdev) {
> +		/* notifier is initialized only in non-fallback mode */
> +		v4l2_async_nf_unregister(&video->notifier);
> +		v4l2_async_nf_cleanup(&video->notifier);
> +	} else {
> +		/* ctrl handler is initialized only in fallback mode */
> +		v4l2_ctrl_handler_free(&video->ctrl_handler);
> +	}
> +
> +	v4l2_device_unregister(&video->v4l2_dev);
> +}
> +
> +static const struct chv3_video_config chv3_video_it = {
> +	.pixelformat = V4L2_PIX_FMT_BGRX32,
> +	.bytes_per_pixel = 4,
> +	.dmaformat = VIDEO_DMAFORMAT_8BPC_PAD,
> +};
> +
> +static const struct chv3_video_config chv3_video_dp = {
> +	.pixelformat = V4L2_PIX_FMT_RGB24,
> +	.bytes_per_pixel = 3,
> +	.dmaformat = VIDEO_DMAFORMAT_8BPC,
> +};
> +
> +static const struct of_device_id chv3_video_match_table[] = {
> +	{ .compatible = "google,chv3-video-it-1.0", .data = &chv3_video_it },
> +	{ .compatible = "google,chv3-video-dp-1.0", .data = &chv3_video_dp },
> +	{ },
> +};
> +
> +static struct platform_driver chv3_video_platform_driver = {
> +	.probe = chv3_video_probe,
> +	.remove_new = chv3_video_remove,
> +	.driver = {
> +		.name = DEVICE_NAME,
> +		.of_match_table = chv3_video_match_table,
> +	},
> +};
> +
> +module_platform_driver(chv3_video_platform_driver);
> +
> +MODULE_AUTHOR("Paweł Anikiel <panikiel@google.com>");
> +MODULE_DESCRIPTION("Google Chameleon v3 video interface driver");
> +MODULE_LICENSE("GPL");

Regards,

	Hans
