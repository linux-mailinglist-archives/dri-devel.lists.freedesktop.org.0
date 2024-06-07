Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C0A9002F8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 14:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E329F10EC12;
	Fri,  7 Jun 2024 12:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5AC10EC12
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 12:04:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 211ABCE1D3F;
 Fri,  7 Jun 2024 12:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633F8C2BBFC;
 Fri,  7 Jun 2024 12:04:25 +0000 (UTC)
Message-ID: <d76a40de-7e42-4870-86c7-f168666b3e59@xs4all.nl>
Date: Fri, 7 Jun 2024 14:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] media: intel: Add Displayport RX IP driver
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mripard@kernel.org,
 robh+dt@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com
References: <20240507155413.266057-1-panikiel@google.com>
 <20240507155413.266057-8-panikiel@google.com>
 <6c9ffe4d-d00f-488f-87be-0370ce23eed2@xs4all.nl>
 <CAM5zL5qNJfQCYAm9iUh5UgKouO_R9NxJpV-04EJz9wsV0n9deQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAM5zL5qNJfQCYAm9iUh5UgKouO_R9NxJpV-04EJz9wsV0n9deQ@mail.gmail.com>
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

On 04/06/2024 14:32, Paweł Anikiel wrote:
> On Mon, Jun 3, 2024 at 10:37 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 07/05/2024 17:54, Paweł Anikiel wrote:
>>> Add v4l2 subdev driver for the Intel Displayport receiver FPGA IP.
>>> It is a part of the DisplayPort Intel FPGA IP Core, and supports
>>> DisplayPort 1.4, HBR3 video capture and Multi-Stream Transport.
>>>
>>> Signed-off-by: Paweł Anikiel <panikiel@google.com>
>>> ---
>>>  drivers/media/platform/intel/Kconfig      |   12 +
>>>  drivers/media/platform/intel/Makefile     |    1 +
>>>  drivers/media/platform/intel/intel-dprx.c | 2283 +++++++++++++++++++++
>>>  3 files changed, 2296 insertions(+)
>>>  create mode 100644 drivers/media/platform/intel/intel-dprx.c
>>>

<snip>

>>> +static int dprx_probe(struct platform_device *pdev)
>>> +{
>>> +     struct dprx *dprx;
>>> +     int irq;
>>> +     int res;
>>> +     int i;
>>> +
>>> +     dprx = devm_kzalloc(&pdev->dev, sizeof(*dprx), GFP_KERNEL);
>>> +     if (!dprx)
>>> +             return -ENOMEM;
>>> +     dprx->dev = &pdev->dev;
>>> +     platform_set_drvdata(pdev, dprx);
>>> +
>>> +     dprx->iobase = devm_platform_ioremap_resource(pdev, 0);
>>> +     if (IS_ERR(dprx->iobase))
>>> +             return PTR_ERR(dprx->iobase);
>>> +
>>> +     irq = platform_get_irq(pdev, 0);
>>> +     if (irq < 0)
>>> +             return irq;
>>> +
>>> +     res = devm_request_irq(dprx->dev, irq, dprx_isr, 0, "intel-dprx", dprx);
>>> +     if (res)
>>> +             return res;
>>> +
>>> +     res = dprx_parse_fwnode(dprx);
>>> +     if (res)
>>> +             return res;
>>> +
>>> +     dprx_init_caps(dprx);
>>> +
>>> +     dprx->subdev.owner = THIS_MODULE;
>>> +     dprx->subdev.dev = &pdev->dev;
>>> +     v4l2_subdev_init(&dprx->subdev, &dprx_subdev_ops);
>>> +     v4l2_set_subdevdata(&dprx->subdev, &pdev->dev);
>>> +     snprintf(dprx->subdev.name, sizeof(dprx->subdev.name), "%s %s",
>>> +              KBUILD_MODNAME, dev_name(&pdev->dev));
>>> +     dprx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>>> +
>>> +     dprx->subdev.entity.function = MEDIA_ENT_F_DV_DECODER;
>>> +     dprx->subdev.entity.ops = &dprx_entity_ops;
>>> +
>>> +     v4l2_ctrl_handler_init(&dprx->ctrl_handler, 1);
>>> +     v4l2_ctrl_new_std(&dprx->ctrl_handler, NULL,
>>> +                       V4L2_CID_DV_RX_POWER_PRESENT, 0, 1, 0, 0);
>>
>> You are creating this control, but it is never set to 1 when the driver detects
>> that a source is connected. I am wondering if POWER_PRESENT makes sense for a
>> DisplayPort connector. Is there a clean way for a sink driver to detect if a
>> source is connected? For HDMI it detects the 5V pin, but it is not clear if
>> there is an equivalent to that in the DP spec.
> 
> The DP spec says the source can be detected using the AUX lines:
> 
> "The Downstream devices must very weakly pull up AUX+ line and very
> weakly pull down AUX- line with 1MΩ (+/-5%) resistors between the
> Downstream device Connector and the AC-coupling capacitors. When AUX+
> line DC voltage is L level, it means a DisplayPort Upstream device is
> connected. When AUX- line DC voltage is H level, it means that a
> powered DisplayPort Upstream device is connected."
> 
> This exact IP has two input signals: rx_cable_detect, and
> rx_pwr_detect, which are meant to be connected to the AUX+/AUX- lines
> via 10k resistors (or rather that's what the reference design does).
> They're exposed to software via status registers, but there's no way
> to get interrupts from them, so it wouldn't be possible to set the
> control exactly when a source gets plugged in.
> 
>>
>> If there is no good way to detect if a source is connected, then it might be
>> better to drop POWER_PRESENT support.
>>
>> This control is supposed to signal that a source is connected as early as possible,
>> ideally before link training etc. starts.
>>
>> It helps the software detect that there is a source, and report an error if a source
>> is detected, but you never get a stable signal (e.g. link training fails).
> 
> This poses another problem, because the chameleon board doesn't have
> this detection circuitry, and instead sets the rx_cable_detect and
> rx_pwr_detect signals to always logical high. That would make the
> control read "always plugged in", which IIUC is not desired.

OK, so it is best to drop support for this control.

I recommend adding a comment in the source code explaining why it is not supported.
And in the cover letter you can mention this as well as an explanation of why
there is a v4l2-compliance warning.

Regards,

	Hans
