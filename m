Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41D86B2E2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495510E1A6;
	Wed, 28 Feb 2024 15:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB06810E191
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 15:14:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B61A60EA8;
 Wed, 28 Feb 2024 15:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FABC43390;
 Wed, 28 Feb 2024 15:14:42 +0000 (UTC)
Message-ID: <24db41e2-1b83-4056-9baa-f6b4eed8d23d@xs4all.nl>
Date: Wed, 28 Feb 2024 16:14:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] media: Add Chameleon v3 framebuffer driver
Content-Language: en-US, nl
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com,
 ribalda@chromium.org
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-3-panikiel@google.com>
 <c51fcd39-b17a-48c3-9043-2e877ed29171@xs4all.nl>
 <CAM5zL5oAUKBf5aOJk=Ekko12pwhshv4of1=LsdsZN7G4VhY2+Q@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAM5zL5oAUKBf5aOJk=Ekko12pwhshv4of1=LsdsZN7G4VhY2+Q@mail.gmail.com>
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

On 28/02/2024 16:08, Paweł Anikiel wrote:
> Hi Hans, thanks for the review!
> 
> On Wed, Feb 28, 2024 at 12:24 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Paweł,
>>
>> On 21/02/2024 17:02, Paweł Anikiel wrote:
>>> Add v4l2 driver for the Google Chameleon v3 framebuffer device.
>>
>> This is just a video capture device, right? A framebuffer device is something
>> that lives in drivers/video/fbdev.
> 
> Yes, it is just a capture device.
> 
>>
>> It is *very* confusing to see the term 'framebuffer' used in a video
>> capture context.
> 
> I agree the name is confusing. I think it started out as something
> else and unfortunately stuck around. I think it's possible to change
> it, though.

That would be very helpful.

> 
>>
>> This commit log should also give a better description of the hardware.
>> Just a single one-liner is a bit on the short side :-)
> 
> Would it be fine to just put the Kconfig help text there?

Yes.

> 
>>
>>>
>>> Signed-off-by: Paweł Anikiel <panikiel@google.com>
>>> ---
>>>  drivers/media/platform/Kconfig                |   1 +
>>>  drivers/media/platform/Makefile               |   1 +
>>>  drivers/media/platform/google/Kconfig         |   3 +
>>>  drivers/media/platform/google/Makefile        |   2 +
>>>  .../media/platform/google/chameleonv3/Kconfig |  13 +
>>>  .../platform/google/chameleonv3/Makefile      |   3 +
>>>  .../platform/google/chameleonv3/chv3-fb.c     | 895 ++++++++++++++++++
>>
>> chv3-video.c would be a much better name for chv3-fb.c.
>>
>> That's a commonly used filename for video capture drivers.
> 
> I'm guessing all the instances of fb or framebuffer in the driver
> itself should be changed as well in that case?

Yes, please. I wouldn't normally ask for such major renaming, but
in this case that name is really confusing.

> 
>>
>>>  7 files changed, 918 insertions(+)
>>>  create mode 100644 drivers/media/platform/google/Kconfig
>>>  create mode 100644 drivers/media/platform/google/Makefile
>>>  create mode 100644 drivers/media/platform/google/chameleonv3/Kconfig
>>>  create mode 100644 drivers/media/platform/google/chameleonv3/Makefile
>>>  create mode 100644 drivers/media/platform/google/chameleonv3/chv3-fb.c
>>>
>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>> index 91e54215de3a..b82f7b142b85 100644
>>> --- a/drivers/media/platform/Kconfig
>>> +++ b/drivers/media/platform/Kconfig
>>> @@ -69,6 +69,7 @@ source "drivers/media/platform/aspeed/Kconfig"
>>>  source "drivers/media/platform/atmel/Kconfig"
>>>  source "drivers/media/platform/cadence/Kconfig"
>>>  source "drivers/media/platform/chips-media/Kconfig"
>>> +source "drivers/media/platform/google/Kconfig"
>>>  source "drivers/media/platform/intel/Kconfig"
>>>  source "drivers/media/platform/marvell/Kconfig"
>>>  source "drivers/media/platform/mediatek/Kconfig"
>>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>>> index 3296ec1ebe16..f7067eb05f76 100644
>>> --- a/drivers/media/platform/Makefile
>>> +++ b/drivers/media/platform/Makefile
>>> @@ -12,6 +12,7 @@ obj-y += aspeed/
>>>  obj-y += atmel/
>>>  obj-y += cadence/
>>>  obj-y += chips-media/
>>> +obj-y += google/
>>>  obj-y += intel/
>>>  obj-y += marvell/
>>>  obj-y += mediatek/
>>> diff --git a/drivers/media/platform/google/Kconfig b/drivers/media/platform/google/Kconfig
>>> new file mode 100644
>>> index 000000000000..2a5f01034c11
>>> --- /dev/null
>>> +++ b/drivers/media/platform/google/Kconfig
>>> @@ -0,0 +1,3 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +source "drivers/media/platform/google/chameleonv3/Kconfig"
>>> diff --git a/drivers/media/platform/google/Makefile b/drivers/media/platform/google/Makefile
>>> new file mode 100644
>>> index 000000000000..c971a09faeb4
>>> --- /dev/null
>>> +++ b/drivers/media/platform/google/Makefile
>>> @@ -0,0 +1,2 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +obj-y += chameleonv3/
>>> diff --git a/drivers/media/platform/google/chameleonv3/Kconfig b/drivers/media/platform/google/chameleonv3/Kconfig
>>> new file mode 100644
>>> index 000000000000..76d0383a8589
>>> --- /dev/null
>>> +++ b/drivers/media/platform/google/chameleonv3/Kconfig
>>> @@ -0,0 +1,13 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +config VIDEO_CHV3_FB
>>> +     tristate "Google Chameleon v3 framebuffer video driver"
>>> +     depends on V4L_PLATFORM_DRIVERS
>>> +     depends on VIDEO_DEV
>>> +     select VIDEOBUF2_DMA_CONTIG
>>> +     select V4L2_FWNODE
>>> +     help
>>> +       v4l2 driver for the video interface present on the Google
>>> +       Chameleon v3. The Chameleon v3 uses the framebuffer IP core
>>> +       to take the video signal from different sources and directly
>>> +       write frames into memory.
>>
>> So it is composing different video streams into buffers? Or does it
>> capture from a single source at a time? The text is rather ambiguous.
> 
> You're right, I'll write a more precise description.
> 
>>
>>> diff --git a/drivers/media/platform/google/chameleonv3/Makefile b/drivers/media/platform/google/chameleonv3/Makefile
>>> new file mode 100644
>>> index 000000000000..d63727148688
>>> --- /dev/null
>>> +++ b/drivers/media/platform/google/chameleonv3/Makefile
>>> @@ -0,0 +1,3 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +obj-$(CONFIG_VIDEO_CHV3_FB) += chv3-fb.o
>>> diff --git a/drivers/media/platform/google/chameleonv3/chv3-fb.c b/drivers/media/platform/google/chameleonv3/chv3-fb.c
>>> new file mode 100644
>>> index 000000000000..35a44365eba0
>>> --- /dev/null
>>> +++ b/drivers/media/platform/google/chameleonv3/chv3-fb.c
>>> @@ -0,0 +1,895 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright 2023-2024 Google LLC.
>>> + * Author: Paweł Anikiel <panikiel@google.com>
>>> + */
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/dma-mapping.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/videodev2.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-dv-timings.h>
>>> +#include <media/v4l2-event.h>
>>> +#include <media/v4l2-fwnode.h>
>>> +#include <media/v4l2-ioctl.h>
>>> +#include <media/videobuf2-dma-contig.h>
>>> +
>>> +#define DEVICE_NAME  "chv3-fb"
>>> +
>>> +/*
>>> + * The device is expected to report some format even if there's currently no
>>> + * active video stream. In such case we default to 1080p.
>>> + */
>>> +#define DEFAULT_WIDTH        1920
>>> +#define DEFAULT_HEIGHT       1080
>>> +
>>> +#define FB_EN                                0x00
>>> +#define FB_EN_BIT                    BIT(0)
>>> +#define FB_HEIGHT                    0x04
>>> +#define FB_WIDTH                     0x08
>>> +#define FB_BUFFERA                   0x0c
>>> +#define FB_BUFFERB                   0x10
>>> +#define FB_BUFFERSIZE                        0x14
>>> +#define FB_RESET                     0x18
>>> +#define FB_RESET_BIT                 BIT(0)
>>> +#define FB_ERRORSTATUS                       0x1c
>>> +#define FB_IOCOLOR                   0x20
>>> +#define FB_DATARATE                  0x24
>>> +#define FB_DATARATE_SINGLE           0x0
>>> +#define FB_DATARATE_DOUBLE           0x1
>>> +#define FB_PIXELMODE                 0x28
>>> +#define FB_PIXELMODE_SINGLE          0x0
>>> +#define FB_PIXELMODE_DOUBLE          0x1
>>> +#define FB_SYNCPOLARITY                      0x2c
>>> +#define FB_DMAFORMAT                 0x30
>>> +#define FB_DMAFORMAT_8BPC            0x0
>>> +#define FB_DMAFORMAT_10BPC_UPPER     0x1
>>> +#define FB_DMAFORMAT_10BPC_LOWER     0x2
>>> +#define FB_DMAFORMAT_12BPC_UPPER     0x3
>>> +#define FB_DMAFORMAT_12BPC_LOWER     0x4
>>> +#define FB_DMAFORMAT_16BPC           0x5
>>> +#define FB_DMAFORMAT_RAW             0x6
>>> +#define FB_DMAFORMAT_8BPC_LEGACY     0x7
>>> +#define FB_VERSION                   0x34
>>> +#define FB_VERSION_CURRENT           0xc0fb0001
>>> +
>>> +#define FB_IRQ_MASK          0x8
>>> +#define FB_IRQ_CLR           0xc
>>> +#define FB_IRQ_ALL           0xf
>>> +#define FB_IRQ_BUFF0         BIT(0)
>>> +#define FB_IRQ_BUFF1         BIT(1)
>>> +#define FB_IRQ_RESOLUTION    BIT(2)
>>> +#define FB_IRQ_ERROR         BIT(3)
>>> +
>>> +struct chv3_fb {
>>> +     struct device *dev;
>>> +     void __iomem *iobase;
>>> +     void __iomem *iobase_irq;
>>> +
>>> +     struct v4l2_device v4l2_dev;
>>> +     struct vb2_queue queue;
>>> +     struct video_device vdev;
>>> +     struct v4l2_pix_format pix_fmt;
>>> +     struct v4l2_dv_timings timings;
>>> +
>>> +     struct v4l2_async_notifier notifier;
>>> +     struct v4l2_subdev *subdev;
>>> +     int subdev_source_pad;
>>> +
>>> +     u32 sequence;
>>> +     bool writing_to_a;
>>> +
>>> +     struct list_head bufs;
>>> +     spinlock_t bufs_lock;
>>> +
>>> +     struct mutex fb_lock;
>>> +};
>>> +
>>> +struct chv3_fb_buffer {
>>> +     struct vb2_v4l2_buffer vb;
>>> +     struct list_head link;
>>> +};
>>> +
>>> +static void chv3_fb_set_format_resolution(struct chv3_fb *fb, u32 width, u32 height)
>>> +{
>>> +     u32 bytes_per_pixel;
>>> +
>>> +     if (fb->pix_fmt.pixelformat == V4L2_PIX_FMT_RGB24)
>>> +             bytes_per_pixel = 3;
>>> +     else
>>> +             bytes_per_pixel = 4;
>>> +
>>> +     fb->pix_fmt.width = width;
>>> +     fb->pix_fmt.height = height;
>>> +     fb->pix_fmt.bytesperline = width * bytes_per_pixel;
>>> +     fb->pix_fmt.sizeimage = fb->pix_fmt.bytesperline * height;
>>> +}
>>> +
>>> +/*
>>> + * The video interface has hardware counters which expose the width and
>>> + * height of the current video stream. It can't reliably detect if the stream
>>> + * is present or not, so this is only used as a fallback in the case where
>>> + * we don't have access to the receiver hardware.
>>> + */
>>> +static int chv3_fb_query_dv_timings_fallback(struct chv3_fb *fb,
>>> +                                          struct v4l2_dv_timings *timings)
>>> +{
>>> +     u32 width, height;
>>> +
>>> +     width  = readl(fb->iobase + FB_WIDTH);
>>> +     height = readl(fb->iobase + FB_HEIGHT);
>>> +     if (width == 0 || height == 0)
>>> +             return -ENOLINK;
>>> +
>>> +     memset(timings, 0, sizeof(*timings));
>>> +     timings->type = V4L2_DV_BT_656_1120;
>>> +     timings->bt.width  = width;
>>> +     timings->bt.height = height;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_query_dv_timings(struct chv3_fb *fb, struct v4l2_dv_timings *timings)
>>> +{
>>> +     if (fb->subdev) {
>>> +             return v4l2_subdev_call(fb->subdev, pad, query_dv_timings,
>>> +                                     fb->subdev_source_pad, timings);
>>> +     } else {
>>> +             return chv3_fb_query_dv_timings_fallback(fb, timings);
>>> +     }
>>> +}
>>> +
>>> +static const struct v4l2_dv_timings_cap chv3_fb_fallback_dv_timings_cap = {
>>> +     .type = V4L2_DV_BT_656_1120,
>>> +     .bt = {
>>> +             .min_width = 0,
>>
>> This is an unlikely minimum width (ditto for height below).
>>
>>> +             .max_width = 65535,
>>
>> The max is suspect as well: I would expect it to be a multiple of 2/4/8/16.
>>
>>> +             .min_height = 0,
>>> +             .max_height = 65535,
>>> +             .min_pixelclock = 0,
>>> +             .max_pixelclock = 2147483647,
>>
>> Ditto for these.
> 
> Note: these are used only when there is no controllable endpoint
> attached to the video interface, and we don't know what the timing
> caps are.
> 
> Should I then just pick something like 640x480p24 as min and 8Kp120 as max?

Yes, that would be a better.

> 
>>
>>> +             .standards = V4L2_DV_BT_STD_CEA861 | V4L2_DV_BT_STD_DMT |
>>> +                     V4L2_DV_BT_STD_CVT | V4L2_DV_BT_STD_GTF,
>>> +             .capabilities = V4L2_DV_BT_CAP_PROGRESSIVE |
>>> +                     V4L2_DV_BT_CAP_REDUCED_BLANKING |
>>> +                     V4L2_DV_BT_CAP_CUSTOM,
>>> +     },
>>> +};
>>> +
>>> +static int chv3_fb_enum_dv_timings_fallback(struct chv3_fb *fb,
>>> +                                         struct v4l2_enum_dv_timings *timings)
>>> +{
>>> +     return v4l2_enum_dv_timings_cap(timings, &chv3_fb_fallback_dv_timings_cap,
>>> +                                     NULL, NULL);
>>> +}
>>> +
>>> +static int chv3_fb_dv_timings_cap_fallback(struct chv3_fb *fb,
>>> +                                        struct v4l2_dv_timings_cap *cap)
>>> +{
>>> +     *cap = chv3_fb_fallback_dv_timings_cap;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void chv3_fb_apply_dv_timings(struct chv3_fb *fb)
>>> +{
>>> +     struct v4l2_dv_timings timings;
>>> +     int res;
>>> +
>>> +     res = chv3_fb_query_dv_timings(fb, &timings);
>>> +     if (res)
>>> +             return;
>>> +
>>> +     fb->timings = timings;
>>> +     chv3_fb_set_format_resolution(fb, timings.bt.width, timings.bt.height);
>>> +}
>>> +
>>> +static int chv3_fb_querycap(struct file *file, void *fh,
>>> +                         struct v4l2_capability *cap)
>>> +{
>>> +     strscpy(cap->driver, DEVICE_NAME, sizeof(cap->driver));
>>> +     strscpy(cap->card, "Chameleon v3 video", sizeof(cap->card));
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_g_fmt_vid_cap(struct file *file, void *fh,
>>> +                              struct v4l2_format *fmt)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +
>>> +     fmt->fmt.pix = fb->pix_fmt;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_enum_fmt_vid_cap(struct file *file, void *fh,
>>> +                                 struct v4l2_fmtdesc *fmt)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +
>>> +     if (fmt->index != 0)
>>> +             return -EINVAL;
>>> +
>>> +     fmt->flags = 0;
>>> +     fmt->pixelformat = fb->pix_fmt.pixelformat;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_enum_framesizes(struct file *file, void *fh,
>>> +                                struct v4l2_frmsizeenum *frm)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +
>>> +     if (frm->index != 0)
>>> +             return -EINVAL;
>>> +
>>> +     if (frm->pixel_format != fb->pix_fmt.pixelformat)
>>> +             return -EINVAL;
>>> +
>>> +     frm->type = V4L2_FRMSIZE_TYPE_DISCRETE;
>>> +     frm->discrete.width  = fb->pix_fmt.width;
>>> +     frm->discrete.height = fb->pix_fmt.height;
>>
>> This is not something you would expect to see supported for a
>> video receiver input. This is something you use for camera sensors.
>>
>> This should almost certainly be dropped.
> 
> Thanks for explaining, I'll remove it in v3.
> 
>>
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_g_input(struct file *file, void *fh, unsigned int *index)
>>> +{
>>> +     *index = 0;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_s_input(struct file *file, void *fh, unsigned int index)
>>> +{
>>> +     if (index != 0)
>>> +             return -EINVAL;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_enum_input(struct file *file, void *fh,
>>> +                           struct v4l2_input *input)
>>> +{
>>> +     if (input->index != 0)
>>> +             return -EINVAL;
>>> +
>>> +     strscpy(input->name, "input0", sizeof(input->name));
>>> +     input->type = V4L2_INPUT_TYPE_CAMERA;
>>> +     input->capabilities = V4L2_IN_CAP_DV_TIMINGS;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_g_edid(struct file *file, void *fh,
>>> +                       struct v4l2_edid *edid)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +     int res;
>>> +
>>> +     if (!fb->subdev)
>>> +             return -ENOTTY;
>>> +
>>> +     if (edid->pad != 0)
>>> +             return -EINVAL;
>>> +
>>> +     edid->pad = fb->subdev_source_pad;
>>> +     res = v4l2_subdev_call(fb->subdev, pad, get_edid, edid);
>>> +     edid->pad = 0;
>>> +
>>> +     return res;
>>> +}
>>> +
>>> +static int chv3_fb_s_edid(struct file *file, void *fh,
>>> +                       struct v4l2_edid *edid)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +     int res;
>>> +
>>> +     if (!fb->subdev)
>>> +             return -ENOTTY;
>>> +
>>> +     if (edid->pad != 0)
>>> +             return -EINVAL;
>>> +
>>> +     edid->pad = fb->subdev_source_pad;
>>> +     res = v4l2_subdev_call(fb->subdev, pad, set_edid, edid);
>>> +     edid->pad = 0;
>>> +
>>> +     return res;
>>> +}
>>> +
>>> +static int chv3_fb_s_dv_timings(struct file *file, void *fh,
>>> +                             struct v4l2_dv_timings *timings)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +
>>> +     if (timings->bt.width == fb->timings.bt.width &&
>>> +         timings->bt.height == fb->timings.bt.height)
>>
>> You would typically use v4l2_match_dv_timings() for this. The check above
>> is insufficient since it does not even check for different framerates or
>> interlaced vs progressive.
> 
> Okay, I changed it to use v4l2_match_dv_timings().
> 
>>
>>> +             return 0;
>>> +
>>> +     if (vb2_is_busy(&fb->queue))
>>> +             return -EBUSY;
>>> +
>>> +     if (!v4l2_valid_dv_timings(timings, &chv3_fb_fallback_dv_timings_cap, NULL, NULL))
>>> +             return -ERANGE;
>>> +
>>> +     fb->timings = *timings;
>>> +     chv3_fb_set_format_resolution(fb, timings->bt.width, timings->bt.height);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_g_dv_timings(struct file *file, void *fh,
>>> +                             struct v4l2_dv_timings *timings)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +
>>> +     *timings = fb->timings;
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_vidioc_query_dv_timings(struct file *file, void *fh,
>>> +                                        struct v4l2_dv_timings *timings)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +
>>> +     return chv3_fb_query_dv_timings(fb, timings);
>>> +}
>>> +
>>> +static int chv3_fb_enum_dv_timings(struct file *file, void *fh,
>>> +                                struct v4l2_enum_dv_timings *timings)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +     int res;
>>> +
>>> +     if (timings->pad != 0)
>>> +             return -EINVAL;
>>> +
>>> +     if (fb->subdev) {
>>> +             timings->pad = fb->subdev_source_pad;
>>> +             res = v4l2_subdev_call(fb->subdev, pad, enum_dv_timings, timings);
>>> +             timings->pad = 0;
>>> +             return res;
>>> +     } else {
>>> +             return chv3_fb_enum_dv_timings_fallback(fb, timings);
>>> +     }
>>> +}
>>> +
>>> +static int chv3_fb_dv_timings_cap(struct file *file, void *fh,
>>> +                               struct v4l2_dv_timings_cap *cap)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +     int res;
>>> +
>>> +     if (cap->pad != 0)
>>> +             return -EINVAL;
>>> +
>>> +     if (fb->subdev) {
>>> +             cap->pad = fb->subdev_source_pad;
>>> +             res = v4l2_subdev_call(fb->subdev, pad, dv_timings_cap, cap);
>>> +             cap->pad = 0;
>>> +             return res;
>>> +     } else {
>>> +             return chv3_fb_dv_timings_cap_fallback(fb, cap);
>>> +     }
>>> +}
>>> +
>>> +static int chv3_fb_subscribe_event(struct v4l2_fh *fh,
>>> +                                const struct v4l2_event_subscription *sub)
>>> +{
>>> +     switch (sub->type) {
>>> +     case V4L2_EVENT_SOURCE_CHANGE:
>>> +             return v4l2_src_change_event_subscribe(fh, sub);
>>> +     }
>>> +
>>> +     return v4l2_ctrl_subscribe_event(fh, sub);
>>> +}
>>
>> I am missing support for the V4L2_CID_DV_RX_POWER_PRESENT control:
>>
>> https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/ext-ctrls-dv.html
> 
> I'll try to implement it.
> 
>>
>>> +
>>> +static const struct v4l2_ioctl_ops chv3_fb_v4l2_ioctl_ops = {
>>> +     .vidioc_querycap = chv3_fb_querycap,
>>> +
>>> +     .vidioc_enum_fmt_vid_cap = chv3_fb_enum_fmt_vid_cap,
>>> +     .vidioc_g_fmt_vid_cap = chv3_fb_g_fmt_vid_cap,
>>> +     .vidioc_s_fmt_vid_cap = chv3_fb_g_fmt_vid_cap,
>>> +     .vidioc_try_fmt_vid_cap = chv3_fb_g_fmt_vid_cap,
>>> +
>>> +     .vidioc_enum_framesizes = chv3_fb_enum_framesizes,
>>> +
>>> +     .vidioc_enum_input = chv3_fb_enum_input,
>>> +     .vidioc_g_input = chv3_fb_g_input,
>>> +     .vidioc_s_input = chv3_fb_s_input,
>>> +     .vidioc_g_edid = chv3_fb_g_edid,
>>> +     .vidioc_s_edid = chv3_fb_s_edid,
>>> +
>>> +     .vidioc_reqbufs = vb2_ioctl_reqbufs,
>>> +     .vidioc_create_bufs = vb2_ioctl_create_bufs,
>>> +     .vidioc_querybuf = vb2_ioctl_querybuf,
>>> +     .vidioc_prepare_buf = vb2_ioctl_prepare_buf,
>>> +     .vidioc_expbuf = vb2_ioctl_expbuf,
>>> +     .vidioc_qbuf = vb2_ioctl_qbuf,
>>> +     .vidioc_dqbuf = vb2_ioctl_dqbuf,
>>> +     .vidioc_streamon = vb2_ioctl_streamon,
>>> +     .vidioc_streamoff = vb2_ioctl_streamoff,
>>> +
>>> +     .vidioc_s_dv_timings = chv3_fb_s_dv_timings,
>>> +     .vidioc_g_dv_timings = chv3_fb_g_dv_timings,
>>> +     .vidioc_query_dv_timings = chv3_fb_vidioc_query_dv_timings,
>>> +     .vidioc_enum_dv_timings = chv3_fb_enum_dv_timings,
>>> +     .vidioc_dv_timings_cap = chv3_fb_dv_timings_cap,
>>> +
>>> +     .vidioc_subscribe_event = chv3_fb_subscribe_event,
>>> +     .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>> +};
>>> +
>>> +static int chv3_fb_queue_setup(struct vb2_queue *q,
>>> +                            unsigned int *nbuffers, unsigned int *nplanes,
>>> +                            unsigned int sizes[], struct device *alloc_devs[])
>>> +{
>>> +     struct chv3_fb *fb = vb2_get_drv_priv(q);
>>> +
>>> +     if (*nplanes) {
>>> +             if (sizes[0] < fb->pix_fmt.sizeimage)
>>> +                     return -EINVAL;
>>> +             return 0;
>>> +     }
>>> +     *nplanes = 1;
>>> +     sizes[0] = fb->pix_fmt.sizeimage;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/*
>>> + * There are two address registers: BUFFERA and BUFFERB. The framebuffer
>>> + * alternates writing between them (i.e. even frames go to BUFFERA, odd
>>> + * ones to BUFFERB).
>>> + *
>>> + *  (buffer queue) >     QUEUED ---> QUEUED ---> QUEUED ---> ...
>>> + *                       BUFFERA     BUFFERB
>>> + *  (hw writing to this) ^
>>> + *                (and then to this) ^
>>> + *
>>> + * The buffer swapping happens at irq time. When an irq comes, the next
>>> + * frame is already assigned an address in the buffer queue. This gives
>>> + * the irq handler a whole frame's worth of time to update the buffer
>>> + * address register.
>>> + */
>>> +
>>> +static dma_addr_t chv3_fb_buffer_dma_addr(struct chv3_fb_buffer *buf)
>>> +{
>>> +     return vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
>>> +}
>>> +
>>> +static void chv3_fb_start_frame(struct chv3_fb *fb, struct chv3_fb_buffer *buf)
>>> +{
>>> +     fb->writing_to_a = 1;
>>> +     writel(chv3_fb_buffer_dma_addr(buf), fb->iobase + FB_BUFFERA);
>>> +     writel(FB_EN_BIT, fb->iobase + FB_EN);
>>> +}
>>> +
>>> +static void chv3_fb_next_frame(struct chv3_fb *fb, struct chv3_fb_buffer *buf)
>>> +{
>>> +     u32 reg = fb->writing_to_a ? FB_BUFFERB : FB_BUFFERA;
>>> +
>>> +     writel(chv3_fb_buffer_dma_addr(buf), fb->iobase + reg);
>>> +}
>>> +
>>> +static int chv3_fb_start_streaming(struct vb2_queue *q, unsigned int count)
>>> +{
>>> +     struct chv3_fb *fb = vb2_get_drv_priv(q);
>>> +     struct chv3_fb_buffer *buf;
>>> +     unsigned long flags;
>>> +
>>> +     fb->sequence = 0;
>>> +     writel(fb->pix_fmt.sizeimage, fb->iobase + FB_BUFFERSIZE);
>>> +
>>> +     spin_lock_irqsave(&fb->bufs_lock, flags);
>>> +     buf = list_first_entry_or_null(&fb->bufs, struct chv3_fb_buffer, link);
>>> +     if (buf) {
>>> +             chv3_fb_start_frame(fb, buf);
>>> +             if (!list_is_last(&buf->link, &fb->bufs))
>>> +                     chv3_fb_next_frame(fb, list_next_entry(buf, link));
>>> +     }
>>> +     spin_unlock_irqrestore(&fb->bufs_lock, flags);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void chv3_fb_stop_streaming(struct vb2_queue *q)
>>> +{
>>> +     struct chv3_fb *fb = vb2_get_drv_priv(q);
>>> +     struct chv3_fb_buffer *buf;
>>> +     unsigned long flags;
>>> +
>>> +     writel(0, fb->iobase + FB_EN);
>>> +
>>> +     spin_lock_irqsave(&fb->bufs_lock, flags);
>>> +     list_for_each_entry(buf, &fb->bufs, link)
>>> +             vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> +     INIT_LIST_HEAD(&fb->bufs);
>>> +     spin_unlock_irqrestore(&fb->bufs_lock, flags);
>>> +}
>>> +
>>> +static void chv3_fb_buf_queue(struct vb2_buffer *vb)
>>> +{
>>> +     struct chv3_fb *fb = vb2_get_drv_priv(vb->vb2_queue);
>>> +     struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb);
>>> +     struct chv3_fb_buffer *buf = container_of(v4l2_buf, struct chv3_fb_buffer, vb);
>>> +     bool first, second;
>>> +     unsigned long flags;
>>> +
>>> +     spin_lock_irqsave(&fb->bufs_lock, flags);
>>> +     first = list_empty(&fb->bufs);
>>> +     second = list_is_singular(&fb->bufs);
>>> +     list_add_tail(&buf->link, &fb->bufs);
>>> +     if (vb2_is_streaming(vb->vb2_queue)) {
>>> +             if (first)
>>> +                     chv3_fb_start_frame(fb, buf);
>>> +             else if (second)
>>> +                     chv3_fb_next_frame(fb, buf);
>>> +     }
>>> +     spin_unlock_irqrestore(&fb->bufs_lock, flags);
>>> +}
>>> +
>>> +static const struct vb2_ops chv3_fb_vb2_ops = {
>>> +     .queue_setup = chv3_fb_queue_setup,
>>> +     .wait_prepare = vb2_ops_wait_prepare,
>>> +     .wait_finish = vb2_ops_wait_finish,
>>> +     .start_streaming = chv3_fb_start_streaming,
>>> +     .stop_streaming = chv3_fb_stop_streaming,
>>> +     .buf_queue = chv3_fb_buf_queue,
>>> +};
>>> +
>>> +static int chv3_fb_open(struct file *file)
>>> +{
>>> +     struct chv3_fb *fb = video_drvdata(file);
>>> +     int res;
>>> +
>>> +     mutex_lock(&fb->fb_lock);
>>> +     res = v4l2_fh_open(file);
>>> +     if (!res) {
>>> +             if (v4l2_fh_is_singular_file(file))
>>> +                     chv3_fb_apply_dv_timings(fb);
>>> +     }
>>> +     mutex_unlock(&fb->fb_lock);
>>> +
>>> +     return res;
>>> +}
>>> +
>>> +static const struct v4l2_file_operations chv3_fb_v4l2_fops = {
>>> +     .owner = THIS_MODULE,
>>> +     .open = chv3_fb_open,
>>> +     .release = vb2_fop_release,
>>> +     .unlocked_ioctl = video_ioctl2,
>>> +     .mmap = vb2_fop_mmap,
>>> +     .poll = vb2_fop_poll,
>>> +};
>>> +
>>> +static void chv3_fb_frame_irq(struct chv3_fb *fb)
>>> +{
>>> +     struct chv3_fb_buffer *buf;
>>> +
>>> +     spin_lock(&fb->bufs_lock);
>>> +
>>> +     buf = list_first_entry_or_null(&fb->bufs, struct chv3_fb_buffer, link);
>>> +     if (!buf)
>>> +             goto empty;
>>> +     list_del(&buf->link);
>>> +
>>> +     vb2_set_plane_payload(&buf->vb.vb2_buf, 0, fb->pix_fmt.sizeimage);
>>> +     buf->vb.vb2_buf.timestamp = ktime_get_ns();
>>> +     buf->vb.sequence = fb->sequence++;
>>> +     buf->vb.field = V4L2_FIELD_NONE;
>>> +     vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>>> +
>>> +     buf = list_first_entry_or_null(&fb->bufs, struct chv3_fb_buffer, link);
>>> +     if (buf) {
>>> +             fb->writing_to_a = !fb->writing_to_a;
>>> +             if (!list_is_last(&buf->link, &fb->bufs))
>>> +                     chv3_fb_next_frame(fb, list_next_entry(buf, link));
>>> +     } else {
>>> +             writel(0, fb->iobase + FB_EN);
>>> +     }
>>> +empty:
>>> +     spin_unlock(&fb->bufs_lock);
>>> +}
>>> +
>>> +static void chv3_fb_error_irq(struct chv3_fb *fb)
>>> +{
>>> +     if (vb2_is_streaming(&fb->queue))
>>> +             vb2_queue_error(&fb->queue);
>>> +}
>>> +
>>> +static void chv3_fb_resolution_irq(struct chv3_fb *fb)
>>> +{
>>> +     static const struct v4l2_event event = {
>>> +             .type = V4L2_EVENT_SOURCE_CHANGE,
>>> +             .u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
>>> +     };
>>> +
>>> +     v4l2_event_queue(&fb->vdev, &event);
>>> +     chv3_fb_error_irq(fb);
>>> +}
>>> +
>>> +static irqreturn_t chv3_fb_isr(int irq, void *data)
>>> +{
>>> +     struct chv3_fb *fb = data;
>>> +     unsigned int reg;
>>> +
>>> +     reg = readl(fb->iobase_irq + FB_IRQ_CLR);
>>> +     if (!reg)
>>> +             return IRQ_NONE;
>>> +
>>> +     if (reg & FB_IRQ_BUFF0)
>>> +             chv3_fb_frame_irq(fb);
>>> +     if (reg & FB_IRQ_BUFF1)
>>> +             chv3_fb_frame_irq(fb);
>>> +     if (reg & FB_IRQ_RESOLUTION)
>>> +             chv3_fb_resolution_irq(fb);
>>> +     if (reg & FB_IRQ_ERROR) {
>>> +             dev_warn(fb->dev, "framebuffer error: 0x%x\n",
>>> +                      readl(fb->iobase + FB_ERRORSTATUS));
>>> +             chv3_fb_error_irq(fb);
>>> +     }
>>> +
>>> +     writel(reg, fb->iobase_irq + FB_IRQ_CLR);
>>> +
>>> +     return IRQ_HANDLED;
>>> +}
>>> +
>>> +static int chv3_fb_check_version(struct chv3_fb *fb)
>>> +{
>>> +     u32 version;
>>> +
>>> +     version = readl(fb->iobase + FB_VERSION);
>>> +     if (version != FB_VERSION_CURRENT) {
>>> +             dev_err(fb->dev,
>>> +                     "wrong framebuffer version: expected %x, got %x\n",
>>> +                     FB_VERSION_CURRENT, version);
>>> +             return -ENODEV;
>>> +     }
>>> +     return 0;
>>> +}
>>> +
>>> +static void chv3_fb_set_default_format(struct chv3_fb *fb, bool legacy_format)
>>> +{
>>> +     struct v4l2_pix_format *pix = &fb->pix_fmt;
>>> +
>>> +     if (legacy_format)
>>> +             pix->pixelformat = V4L2_PIX_FMT_BGRX32;
>>> +     else
>>> +             pix->pixelformat = V4L2_PIX_FMT_RGB24;
>>> +     pix->field = V4L2_FIELD_NONE;
>>> +     pix->colorspace = V4L2_COLORSPACE_SRGB;
>>> +
>>> +     chv3_fb_set_format_resolution(fb, DEFAULT_WIDTH, DEFAULT_HEIGHT);
>>> +}
>>> +
>>> +static void chv3_fb_set_default_timings(struct chv3_fb *fb)
>>> +{
>>> +     memset(&fb->timings, 0, sizeof(fb->timings));
>>> +     fb->timings.type = V4L2_DV_BT_656_1120;
>>> +     fb->timings.bt.width  = DEFAULT_WIDTH;
>>> +     fb->timings.bt.height = DEFAULT_HEIGHT;
>>
>> Wouldn't it be better to say: fb->timings = V4L2_DV_BT_CEA_1920X1080P60;
> 
> Yes, that would work.
> 
>>
>>> +}
>>> +
>>> +#define notifier_to_fb(nf) container_of(nf, struct chv3_fb, notifier)
>>> +
>>> +static int chv3_fb_async_notify_bound(struct v4l2_async_notifier *notifier,
>>> +                                   struct v4l2_subdev *subdev,
>>> +                                   struct v4l2_async_connection *asc)
>>> +{
>>> +     struct chv3_fb *fb = notifier_to_fb(notifier);
>>> +     int pad;
>>> +
>>> +     pad = media_entity_get_fwnode_pad(&subdev->entity, asc->match.fwnode,
>>> +                                       MEDIA_PAD_FL_SOURCE);
>>> +     if (pad < 0)
>>> +             return pad;
>>> +
>>> +     fb->subdev = subdev;
>>> +     fb->subdev_source_pad = pad;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void chv3_fb_async_notify_unbind(struct v4l2_async_notifier *notifier,
>>> +                                     struct v4l2_subdev *subdev,
>>> +                                     struct v4l2_async_connection *asc)
>>> +{
>>> +     struct chv3_fb *fb = notifier_to_fb(notifier);
>>> +
>>> +     video_unregister_device(&fb->vdev);
>>
>> Use vb2_video_unregister_device. See documentation in include/media/videobuf2-v4l2.h.
> 
> So if I understand the docs correctly, I should just change this line to
> 'vb2_video_unregister_device(&fb->vdev);'?

Yes.

> 
>>
>>> +}
>>> +
>>> +static int chv3_fb_async_notify_complete(struct v4l2_async_notifier *notifier)
>>> +{
>>> +     struct chv3_fb *fb = notifier_to_fb(notifier);
>>> +
>>> +     return video_register_device(&fb->vdev, VFL_TYPE_VIDEO, -1);
>>> +}
>>> +
>>> +static const struct v4l2_async_notifier_operations chv3_fb_async_notify_ops = {
>>> +     .bound = chv3_fb_async_notify_bound,
>>> +     .unbind = chv3_fb_async_notify_unbind,
>>> +     .complete = chv3_fb_async_notify_complete,
>>> +};
>>> +
>>> +static int chv3_fb_fallback_init(struct chv3_fb *fb)
>>> +{
>>> +     fb->subdev = NULL;
>>> +     fb->subdev_source_pad = 0;
>>> +
>>> +     return video_register_device(&fb->vdev, VFL_TYPE_VIDEO, -1);
>>> +}
>>> +
>>> +static int chv3_fb_fwnode_init(struct chv3_fb *fb)
>>> +{
>>> +     struct v4l2_async_connection *asc;
>>> +     struct fwnode_handle *endpoint;
>>> +     int res;
>>> +
>>> +     endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(fb->dev), NULL);
>>> +     if (!endpoint)
>>> +             return -EINVAL;
>>> +
>>> +     v4l2_async_nf_init(&fb->notifier, &fb->v4l2_dev);
>>> +
>>> +     asc = v4l2_async_nf_add_fwnode_remote(&fb->notifier, endpoint,
>>> +                                           struct v4l2_async_connection);
>>> +     fwnode_handle_put(endpoint);
>>> +
>>> +     if (IS_ERR(asc))
>>> +             return PTR_ERR(asc);
>>> +
>>> +     fb->notifier.ops = &chv3_fb_async_notify_ops;
>>> +     res = v4l2_async_nf_register(&fb->notifier);
>>> +     if (res) {
>>> +             v4l2_async_nf_cleanup(&fb->notifier);
>>> +             return res;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int chv3_fb_probe(struct platform_device *pdev)
>>> +{
>>> +     struct chv3_fb *fb;
>>> +     bool legacy_format;
>>> +     int res;
>>> +     int irq;
>>> +
>>> +     fb = devm_kzalloc(&pdev->dev, sizeof(*fb), GFP_KERNEL);
>>> +     if (!fb)
>>> +             return -ENOMEM;
>>> +     fb->dev = &pdev->dev;
>>> +     platform_set_drvdata(pdev, fb);
>>> +
>>> +     /* map register space */
>>> +     fb->iobase = devm_platform_ioremap_resource(pdev, 0);
>>> +     if (IS_ERR(fb->iobase))
>>> +             return PTR_ERR(fb->iobase);
>>> +
>>> +     fb->iobase_irq = devm_platform_ioremap_resource(pdev, 1);
>>> +     if (IS_ERR(fb->iobase_irq))
>>> +             return PTR_ERR(fb->iobase_irq);
>>> +
>>> +     /* check hw version */
>>> +     res = chv3_fb_check_version(fb);
>>> +     if (res)
>>> +             return res;
>>> +
>>> +     /* setup interrupts */
>>> +     irq = platform_get_irq(pdev, 0);
>>> +     if (irq < 0)
>>> +             return -ENXIO;
>>> +     res = devm_request_irq(&pdev->dev, irq, chv3_fb_isr, 0, DEVICE_NAME, fb);
>>> +     if (res)
>>> +             return res;
>>> +
>>> +     /* initialize v4l2_device */
>>> +     res = v4l2_device_register(&pdev->dev, &fb->v4l2_dev);
>>> +     if (res)
>>> +             return res;
>>> +
>>> +     /* initialize vb2 queue */
>>> +     fb->queue.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>> +     fb->queue.io_modes = VB2_MMAP | VB2_DMABUF;
>>> +     fb->queue.dev = &pdev->dev;
>>> +     fb->queue.lock = &fb->fb_lock;
>>> +     fb->queue.ops = &chv3_fb_vb2_ops;
>>> +     fb->queue.mem_ops = &vb2_dma_contig_memops;
>>> +     fb->queue.drv_priv = fb;
>>> +     fb->queue.buf_struct_size = sizeof(struct chv3_fb_buffer);
>>> +     fb->queue.timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>>> +     res = vb2_queue_init(&fb->queue);
>>> +     if (res)
>>> +             goto error;
>>> +
>>> +     /* initialize video_device */
>>> +     strscpy(fb->vdev.name, DEVICE_NAME, sizeof(fb->vdev.name));
>>> +     fb->vdev.fops = &chv3_fb_v4l2_fops;
>>> +     fb->vdev.ioctl_ops = &chv3_fb_v4l2_ioctl_ops;
>>> +     fb->vdev.lock = &fb->fb_lock;
>>> +     fb->vdev.release = video_device_release_empty;
>>> +     fb->vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
>>> +     fb->vdev.v4l2_dev = &fb->v4l2_dev;
>>> +     fb->vdev.queue = &fb->queue;
>>> +     video_set_drvdata(&fb->vdev, fb);
>>> +
>>> +     /* read other DT properties */
>>> +     legacy_format = device_property_read_bool(&pdev->dev, "google,legacy-format");
>>> +
>>> +     if (device_get_named_child_node(&pdev->dev, "port"))
>>> +             res = chv3_fb_fwnode_init(fb);
>>> +     else
>>> +             res = chv3_fb_fallback_init(fb);
>>> +     if (res)
>>> +             goto error;
>>> +
>>> +     /* initialize rest of driver struct */
>>> +     INIT_LIST_HEAD(&fb->bufs);
>>> +     spin_lock_init(&fb->bufs_lock);
>>> +     mutex_init(&fb->fb_lock);
>>> +
>>> +     chv3_fb_set_default_format(fb, legacy_format);
>>> +     chv3_fb_set_default_timings(fb);
>>> +
>>> +     /* initialize hw */
>>> +     writel(FB_RESET_BIT, fb->iobase + FB_RESET);
>>> +     writel(FB_DATARATE_DOUBLE, fb->iobase + FB_DATARATE);
>>> +     writel(FB_PIXELMODE_DOUBLE, fb->iobase + FB_PIXELMODE);
>>> +     if (legacy_format)
>>> +             writel(FB_DMAFORMAT_8BPC_LEGACY, fb->iobase + FB_DMAFORMAT);
>>> +     else
>>> +             writel(FB_DMAFORMAT_8BPC, fb->iobase + FB_DMAFORMAT);
>>> +
>>> +     writel(FB_IRQ_ALL, fb->iobase_irq + FB_IRQ_MASK);
>>> +
>>> +     return 0;
>>> +
>>> +error:
>>> +     v4l2_device_unregister(&fb->v4l2_dev);
>>> +
>>> +     return res;
>>> +}
>>> +
>>> +static void chv3_fb_remove(struct platform_device *pdev)
>>> +{
>>> +     struct chv3_fb *fb = platform_get_drvdata(pdev);
>>> +
>>> +     /* disable interrupts */
>>> +     writel(0, fb->iobase_irq + FB_IRQ_MASK);
>>> +
>>> +     v4l2_async_nf_unregister(&fb->notifier);
>>> +     v4l2_async_nf_cleanup(&fb->notifier);
>>> +     v4l2_device_unregister(&fb->v4l2_dev);
>>> +}
>>> +
>>> +static const struct of_device_id chv3_fb_match_table[] = {
>>> +     { .compatible = "google,chv3-fb" },
>>> +     { },
>>> +};
>>> +
>>> +static struct platform_driver chv3_fb_platform_driver = {
>>> +     .probe = chv3_fb_probe,
>>> +     .remove_new = chv3_fb_remove,
>>> +     .driver = {
>>> +             .name = DEVICE_NAME,
>>> +             .of_match_table = chv3_fb_match_table,
>>> +     },
>>> +};
>>> +
>>> +module_platform_driver(chv3_fb_platform_driver);
>>> +
>>> +MODULE_AUTHOR("Paweł Anikiel <panikiel@google.com>");
>>> +MODULE_DESCRIPTION("Google Chameleon v3 video framebuffer driver");
>>> +MODULE_LICENSE("GPL");
>>
>> For the v3, can you also provide the output of 'v4l2-compliance -s'
>> in the cover letter? Make sure you compile v4l2-compliance directly
>> from the git repo https://git.linuxtv.org/v4l-utils.git/ since the version
>> from distros is usually too old.
> 
> Okay, I'll do that.

Regards,

	Hans
