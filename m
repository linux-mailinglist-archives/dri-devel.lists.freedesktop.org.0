Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7468FB28C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 14:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6641010E472;
	Tue,  4 Jun 2024 12:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C810E472
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 12:46:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A7449CE1153;
 Tue,  4 Jun 2024 12:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79439C4AF07;
 Tue,  4 Jun 2024 12:46:23 +0000 (UTC)
Message-ID: <b1effb32-5b9e-4a48-9cd7-63f20d8334b1@xs4all.nl>
Date: Tue, 4 Jun 2024 14:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] media: Add Chameleon v3 video interface driver
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-2-panikiel@google.com>
 <c5f40d46-9e8d-40f9-82ee-83013dbc134e@xs4all.nl>
 <CAM5zL5reA_nyt0FfmE2+eFESq6JdHJ8Z1wCp1zEsvLECeOx3mA@mail.gmail.com>
 <fee56d57-ae17-4001-8f22-bd32ce74c8af@xs4all.nl>
 <CAM5zL5qbfMnjrBqaF7gw1XfiiFpCF4QTVTvO9ZMPmNFiHJDvDg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAM5zL5qbfMnjrBqaF7gw1XfiiFpCF4QTVTvO9ZMPmNFiHJDvDg@mail.gmail.com>
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

On 04/06/2024 14:03, Paweł Anikiel wrote:
> On Mon, Jun 3, 2024 at 4:56 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 03/06/2024 16:32, Paweł Anikiel wrote:
>>> On Mon, Jun 3, 2024 at 9:57 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>>
>>>> On 07/05/2024 17:54, Paweł Anikiel wrote:
>>>>> Add v4l2 driver for the video interface present on the Google
>>>>> Chameleon v3. The Chameleon v3 uses the video interface to capture
>>>>> a single video source from a given HDMI or DP connector and write
>>>>> the resulting frames to memory.
>>>>>
>>>>> Signed-off-by: Paweł Anikiel <panikiel@google.com>
>>>>> ---
>>>>>  drivers/media/platform/Kconfig             |   1 +
>>>>>  drivers/media/platform/Makefile            |   1 +
>>>>>  drivers/media/platform/google/Kconfig      |  13 +
>>>>>  drivers/media/platform/google/Makefile     |   3 +
>>>>>  drivers/media/platform/google/chv3-video.c | 891 +++++++++++++++++++++
>>>>>  5 files changed, 909 insertions(+)
>>>>>  create mode 100644 drivers/media/platform/google/Kconfig
>>>>>  create mode 100644 drivers/media/platform/google/Makefile
>>>>>  create mode 100644 drivers/media/platform/google/chv3-video.c
>>>>>
>>>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>>>> index 91e54215de3a..b82f7b142b85 100644
>>>>> --- a/drivers/media/platform/Kconfig
>>>>> +++ b/drivers/media/platform/Kconfig
>>>>> @@ -69,6 +69,7 @@ source "drivers/media/platform/aspeed/Kconfig"
>>>>>  source "drivers/media/platform/atmel/Kconfig"
>>>>>  source "drivers/media/platform/cadence/Kconfig"
>>>>>  source "drivers/media/platform/chips-media/Kconfig"
>>>>> +source "drivers/media/platform/google/Kconfig"
>>>>>  source "drivers/media/platform/intel/Kconfig"
>>>>>  source "drivers/media/platform/marvell/Kconfig"
>>>>>  source "drivers/media/platform/mediatek/Kconfig"
>>>>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>>>>> index 3296ec1ebe16..f7067eb05f76 100644
>>>>> --- a/drivers/media/platform/Makefile
>>>>> +++ b/drivers/media/platform/Makefile
>>>>> @@ -12,6 +12,7 @@ obj-y += aspeed/
>>>>>  obj-y += atmel/
>>>>>  obj-y += cadence/
>>>>>  obj-y += chips-media/
>>>>> +obj-y += google/
>>>>>  obj-y += intel/
>>>>>  obj-y += marvell/
>>>>>  obj-y += mediatek/
>>>>> diff --git a/drivers/media/platform/google/Kconfig b/drivers/media/platform/google/Kconfig
>>>>> new file mode 100644
>>>>> index 000000000000..9674a4c12e2d
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/google/Kconfig
>>>>> @@ -0,0 +1,13 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>> +
>>>>> +config VIDEO_CHAMELEONV3
>>>>> +     tristate "Google Chameleon v3 video driver"
>>>>> +     depends on V4L_PLATFORM_DRIVERS
>>>>> +     depends on VIDEO_DEV
>>>>> +     select VIDEOBUF2_DMA_CONTIG
>>>>> +     select V4L2_FWNODE
>>>>> +     help
>>>>> +       v4l2 driver for the video interface present on the Google
>>>>> +       Chameleon v3. The Chameleon v3 uses the video interface to
>>>>> +       capture a single video source from a given HDMI or DP connector
>>>>> +       and write the resulting frames to memory.
>>>>> diff --git a/drivers/media/platform/google/Makefile b/drivers/media/platform/google/Makefile
>>>>> new file mode 100644
>>>>> index 000000000000..cff06486244c
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/google/Makefile
>>>>> @@ -0,0 +1,3 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>> +
>>>>> +obj-$(CONFIG_VIDEO_CHAMELEONV3) += chv3-video.o
>>>>> diff --git a/drivers/media/platform/google/chv3-video.c b/drivers/media/platform/google/chv3-video.c
>>>>> new file mode 100644
>>>>> index 000000000000..6e782484abaf
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/platform/google/chv3-video.c
>>>>> @@ -0,0 +1,891 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * Copyright 2023-2024 Google LLC.
>>>>> + * Author: Paweł Anikiel <panikiel@google.com>
>>>>> + */
>>>>> +
>>>>> +#include <linux/delay.h>
>>>>> +#include <linux/dma-mapping.h>
>>>>> +#include <linux/interrupt.h>
>>>>> +#include <linux/kernel.h>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/of.h>
>>>>> +#include <linux/platform_device.h>
>>>>> +#include <linux/v4l2-dv-timings.h>
>>>>> +#include <linux/videodev2.h>
>>>>> +#include <media/v4l2-ctrls.h>
>>>>> +#include <media/v4l2-device.h>
>>>>> +#include <media/v4l2-dv-timings.h>
>>>>> +#include <media/v4l2-event.h>
>>>>> +#include <media/v4l2-fwnode.h>
>>>>> +#include <media/v4l2-ioctl.h>
>>>>> +#include <media/videobuf2-dma-contig.h>
>>>>> +
>>>>> +#define DEVICE_NAME  "chv3-video"
>>>>> +
>>>>> +#define VIDEO_EN                     0x00
>>>>> +#define VIDEO_EN_BIT                 BIT(0)
>>>>> +#define VIDEO_HEIGHT                 0x04
>>>>> +#define VIDEO_WIDTH                  0x08
>>>>> +#define VIDEO_BUFFERA                        0x0c
>>>>> +#define VIDEO_BUFFERB                        0x10
>>>>> +#define VIDEO_BUFFERSIZE             0x14
>>>>> +#define VIDEO_RESET                  0x18
>>>>> +#define VIDEO_RESET_BIT                      BIT(0)
>>>>> +#define VIDEO_ERRORSTATUS            0x1c
>>>>> +#define VIDEO_IOCOLOR                        0x20
>>>>> +#define VIDEO_DATARATE                       0x24
>>>>> +#define VIDEO_DATARATE_SINGLE                0x0
>>>>> +#define VIDEO_DATARATE_DOUBLE                0x1
>>>>> +#define VIDEO_PIXELMODE                      0x28
>>>>> +#define VIDEO_PIXELMODE_SINGLE               0x0
>>>>> +#define VIDEO_PIXELMODE_DOUBLE               0x1
>>>>> +#define VIDEO_SYNCPOLARITY           0x2c
>>>>> +#define VIDEO_DMAFORMAT                      0x30
>>>>> +#define VIDEO_DMAFORMAT_8BPC         0x0
>>>>> +#define VIDEO_DMAFORMAT_10BPC_UPPER  0x1
>>>>> +#define VIDEO_DMAFORMAT_10BPC_LOWER  0x2
>>>>> +#define VIDEO_DMAFORMAT_12BPC_UPPER  0x3
>>>>> +#define VIDEO_DMAFORMAT_12BPC_LOWER  0x4
>>>>> +#define VIDEO_DMAFORMAT_16BPC                0x5
>>>>> +#define VIDEO_DMAFORMAT_RAW          0x6
>>>>> +#define VIDEO_DMAFORMAT_8BPC_PAD     0x7
>>>>> +#define VIDEO_VERSION                        0x34
>>>>> +#define VIDEO_VERSION_CURRENT                0xc0fb0001
>>>>> +
>>>>> +#define VIDEO_IRQ_MASK               0x8
>>>>> +#define VIDEO_IRQ_CLR                0xc
>>>>> +#define VIDEO_IRQ_ALL                0xf
>>>>> +#define VIDEO_IRQ_BUFF0              BIT(0)
>>>>> +#define VIDEO_IRQ_BUFF1              BIT(1)
>>>>> +#define VIDEO_IRQ_RESOLUTION BIT(2)
>>>>> +#define VIDEO_IRQ_ERROR              BIT(3)
>>>>> +
>>>>> +struct chv3_video {
>>>>> +     struct device *dev;
>>>>> +     void __iomem *iobase;
>>>>> +     void __iomem *iobase_irq;
>>>>> +
>>>>> +     struct v4l2_device v4l2_dev;
>>>>> +     struct vb2_queue queue;
>>>>> +     struct video_device vdev;
>>>>> +     struct v4l2_pix_format pix_fmt;
>>>>> +     struct v4l2_dv_timings timings;
>>>>> +     u32 bytes_per_pixel;
>>>>> +
>>>>> +     struct v4l2_ctrl_handler ctrl_handler;
>>>>> +     struct v4l2_async_notifier notifier;
>>>>> +     struct v4l2_subdev *subdev;
>>>>> +     int subdev_source_pad;
>>>>> +
>>>>> +     u32 sequence;
>>>>> +     bool writing_to_a;
>>>>> +
>>>>> +     struct list_head bufs;
>>>>> +     spinlock_t bufs_lock;
>>>>> +
>>>>> +     struct mutex video_lock;
>>>>> +};
>>>>> +
>>>>> +struct chv3_video_buffer {
>>>>> +     struct vb2_v4l2_buffer vb;
>>>>> +     struct list_head link;
>>>>> +};
>>>>> +
>>>>> +struct chv3_video_config {
>>>>> +     u32 pixelformat;
>>>>> +     u32 bytes_per_pixel;
>>>>> +     u32 dmaformat;
>>>>> +};
>>>>> +
>>>>> +static void chv3_video_set_format_resolution(struct chv3_video *video, u32 width, u32 height)
>>>>> +{
>>>>> +     video->pix_fmt.width = width;
>>>>> +     video->pix_fmt.height = height;
>>>>> +     video->pix_fmt.bytesperline = width * video->bytes_per_pixel;
>>>>> +     video->pix_fmt.sizeimage = video->pix_fmt.bytesperline * height;
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * The video interface has hardware counters which expose the width and
>>>>> + * height of the current video stream. It can't reliably detect if the stream
>>>>> + * is present or not, so this is only used as a fallback in the case where
>>>>> + * we don't have access to the receiver hardware.
>>>>> + */
>>>>> +static int chv3_video_query_dv_timings_fallback(struct chv3_video *video,
>>>>> +                                             struct v4l2_dv_timings *timings)
>>>>> +{
>>>>> +     u32 width, height;
>>>>> +
>>>>> +     width  = readl(video->iobase + VIDEO_WIDTH);
>>>>> +     height = readl(video->iobase + VIDEO_HEIGHT);
>>>>> +     if (width == 0 || height == 0)
>>>>> +             return -ENOLINK;
>>>>> +
>>>>> +     memset(timings, 0, sizeof(*timings));
>>>>> +     timings->type = V4L2_DV_BT_656_1120;
>>>>> +     timings->bt.width  = width;
>>>>> +     timings->bt.height = height;
>>>>> +     timings->bt.pixelclock = width * height * 24;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int chv3_video_query_dv_timings(struct chv3_video *video, struct v4l2_dv_timings *timings)
>>>>> +{
>>>>> +     if (video->subdev) {
>>>>> +             return v4l2_subdev_call(video->subdev, pad, query_dv_timings,
>>>>> +                                     video->subdev_source_pad, timings);
>>>>> +     } else {
>>>>> +             return chv3_video_query_dv_timings_fallback(video, timings);
>>>>> +     }
>>>>
>>>> I would move the contents of chv3_video_query_dv_timings_fallback() to this
>>>> function and drop the old fallback function. It makes more sense if it is all
>>>> in the same function.
>>>>
>>>>> +}
>>>>> +
>>>>> +static const struct v4l2_dv_timings_cap chv3_video_fallback_dv_timings_cap = {
>>>>> +     .type = V4L2_DV_BT_656_1120,
>>>>> +     .bt = {
>>>>> +             .min_width = 640,
>>>>> +             .max_width = 7680,
>>>>> +             .min_height = 480,
>>>>> +             .max_height = 4320,
>>>>> +             .min_pixelclock = 25000000,
>>>>> +             .max_pixelclock = 1080000000,
>>>>> +             .standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
>>>>> +                     V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
>>>>> +             .capabilities = V4L2_DV_BT_CAP_PROGRESSIVE |
>>>>> +                     V4L2_DV_BT_CAP_REDUCED_BLANKING |
>>>>> +                     V4L2_DV_BT_CAP_CUSTOM,
>>>>> +     },
>>>>> +};
>>>>> +
>>>>> +static int chv3_video_enum_dv_timings_fallback(struct chv3_video *video,
>>>>> +                                            struct v4l2_enum_dv_timings *timings)
>>>>> +{
>>>>> +     return v4l2_enum_dv_timings_cap(timings, &chv3_video_fallback_dv_timings_cap,
>>>>> +                                     NULL, NULL);
>>>>> +}
>>>>> +
>>>>> +static int chv3_video_dv_timings_cap_fallback(struct chv3_video *video,
>>>>> +                                           struct v4l2_dv_timings_cap *cap)
>>>>> +{
>>>>> +     *cap = chv3_video_fallback_dv_timings_cap;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>
>>>> Same for these two fallback functions: move them to the functions that calls them.
>>>>
>>>>> +
>>>>> +static void chv3_video_apply_dv_timings(struct chv3_video *video)
>>>>> +{
>>>>> +     struct v4l2_dv_timings timings;
>>>>> +     int res;
>>>>> +
>>>>> +     res = chv3_video_query_dv_timings(video, &timings);
>>>>> +     if (res)
>>>>> +             return;
>>>>> +
>>>>> +     video->timings = timings;
>>>>> +     chv3_video_set_format_resolution(video, timings.bt.width, timings.bt.height);
>>>>> +}
>>>>> +
>>>>> +static int chv3_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>>>>> +{
>>>>> +     strscpy(cap->driver, DEVICE_NAME, sizeof(cap->driver));
>>>>> +     strscpy(cap->card, "Chameleon v3 video", sizeof(cap->card));
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int chv3_video_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *fmt)
>>>>> +{
>>>>> +     struct chv3_video *video = video_drvdata(file);
>>>>> +
>>>>> +     fmt->fmt.pix = video->pix_fmt;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int chv3_video_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdesc *fmt)
>>>>> +{
>>>>> +     struct chv3_video *video = video_drvdata(file);
>>>>> +
>>>>> +     if (fmt->index != 0)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     fmt->flags = 0;
>>>>> +     fmt->pixelformat = video->pix_fmt.pixelformat;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int chv3_video_g_input(struct file *file, void *fh, unsigned int *index)
>>>>> +{
>>>>> +     *index = 0;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int chv3_video_s_input(struct file *file, void *fh, unsigned int index)
>>>>> +{
>>>>> +     if (index != 0)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int chv3_video_enum_input(struct file *file, void *fh, struct v4l2_input *input)
>>>>> +{
>>>>> +     if (input->index != 0)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     strscpy(input->name, "input0", sizeof(input->name));
>>>>
>>>> This name is not terribly user friendly. Is it possible to determine a more human
>>>> readable name? E.g. "DP1", "DP2", etc. Something that matches labeling on the Chameleon
>>>> board.
>>>
>>> The driver would require some board-specific instance info to
>>> determine if the video interface is connected to DP1, DP2, or the
>>> auxiliary decoder (or something entirely different if this IP was used
>>> on a different board). I don't see an easy way to determine such a
>>> human readable name, unfortunately.
>>
>> It is possible, but it requires adding a connector to video pipeline in the device tree.
>> See e.g. Documentation/devicetree/bindings/display/connector/dp-connector.yaml and
>> Documentation/devicetree/bindings/media/i2c/tvp5150.txt.
> 
> I am using connectors in the device tree, actually. See the last
> commit of this patchset. However, it's not connected directly - the
> video interface is connected to the DP receiver which is then
> connected to the connector.
> 
>>
>> While connectors are used in drm, in the media subsytem only the tvp5150 driver ever
>> used it for analog video inputs.
>>
>> The connectors have a label, and that can be used to fill in the input name.
>>
>> It is worth checking if this would work without too much effort, but if not, then
>> at least change the "input0" string to something like "Video Input".
> 
> In order to read the connector label, the video interface driver would
> have to make some assumptions about the incoming pipeline, e.g. figure
> out which port of the decoder dt node is the input (how? just assume
> it's port 0?). Do you see a good way to deal with that?

It is the Displayport RX IP driver that has to parse the connector data
and create connector entities in the media topology. The video interface
driver would have to walk the graph to find those connector entities and
the entity name would contains the input name.

'git grep MEDIA_ENT_FL_CONNECTOR' gives a good idea where this is used.

Note: connectors are currently only used for S-Video and Composite inputs,
so some infrastructure would need to be added for HDMI/DP inputs.

I have never done this, so you may well encounter unexpected issues.

That said, having support for this would be really nice.

Regards,

	Hans
