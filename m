Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA686C2FE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB92810E0EC;
	Thu, 29 Feb 2024 08:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9EC10E0AE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:02:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E750CE23F5;
 Thu, 29 Feb 2024 08:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57A78C433C7;
 Thu, 29 Feb 2024 08:02:51 +0000 (UTC)
Message-ID: <03f65fbc-9cf8-4347-8277-e53cb01b00a5@xs4all.nl>
Date: Thu, 29 Feb 2024 09:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] media: v4l2-subdev: Add a pad variant of
 .query_dv_timings()
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
 <20240221160215.484151-2-panikiel@google.com>
 <ce262cda-84ba-4d8f-a916-76488c94066d@xs4all.nl>
 <CAM5zL5qrMNfyiXMOJHUzLySm_U2U8kbD=D_Cyn0WjkvpikiYpQ@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAM5zL5qrMNfyiXMOJHUzLySm_U2U8kbD=D_Cyn0WjkvpikiYpQ@mail.gmail.com>
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

On 28/02/2024 16:34, Paweł Anikiel wrote:
> On Wed, Feb 28, 2024 at 12:25 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Hi Paweł,
>>
>> On 21/02/2024 17:02, Paweł Anikiel wrote:
>>> Currently, .query_dv_timings() is defined as a video callback without
>>> a pad argument. This is a problem if the subdevice can have different
>>> dv timings for each pad (e.g. a DisplayPort receiver with multiple
>>> virtual channels).
>>>
>>> To solve this, add a pad variant of this callback which includes
>>> the pad number as an argument.
>>
>> So now we have two query_dv_timings ops: one for video ops, and one
>> for pad ops. That's not very maintainable. I would suggest switching
>> all current users of the video op over to the pad op.
> 
> I agree it would be better if there was only one. However, I have some concerns:
> 1. Isn't there a problem with backwards compatibility? For example, an
> out-of-tree driver is likely to use this callback, which would break.
> I'm asking because I'm not familiar with how such API changes are
> handled.

It's out of tree, so they will just have to adapt. That's how life is if
you are not part of the mainline kernel.

> 2. If I do switch all current users to the pad op, I can't test those
> changes. Isn't that a problem?

I can test one or two drivers, but in general I don't expect this to be
a problem.

> 3. Would I need to get ACK from all the driver maintainers?

CC the patches to the maintainers. Generally you will get back Acks from
some but not all maintainers, but that's OK. For changes affecting multiple
drivers you never reach 100% on that. I can review the remainder. The DV
Timings API is my expert area, so that shouldn't be a problem.

A quick grep gives me these subdev drivers that implement it:

adv748x, adv7604, adv7842, tc358743, tda1997x, tvp7002, gs1662.

And these bridge drivers that call the subdevs:

cobalt, rcar-vin, vpif_capture.

The bridge drivers can use the following pad when calling query_dv_timings:

cobalt: ADV76XX_PAD_HDMI_PORT_A
rcar_vin: vin->parallel.sink_pad
vpif_capture: 0

The converted subdev drivers should check if the pad is an input pad.
Ideally it should check if the pad is equal to the current input pad
since most devices can only query the timings for the currently selected
input pad. But some older drivers predate the pad concept and they
ignore the pad value.

Regards,

	Hans
