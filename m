Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D1B98F604
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 20:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5412D10E8E0;
	Thu,  3 Oct 2024 18:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="ioVYB19M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39B610E8DD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 18:28:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4F54688E65;
 Thu,  3 Oct 2024 20:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727980087;
 bh=afyXWxj3lWWLB446UwVB7q7EVGBBZgtq+4WnIjUxE9s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ioVYB19M3ux3BUexbm9xZ6oIpnLfgHad/2M5t8r/ItjfaQOABimZxNXQM7W89Exn8
 weu0LigmMSFgnCG5X0aGb4WJF5p5cAIRIrxgvVvWgaSXzHdYcXOysWz6oPtJ6bu58J
 njvTjP4/76Bk4CRIWgJOOMkTQS4DxPrj4W0+2dnY9Apf3hFreDb7triwdjhaqq/zC1
 xunP94CvcbSbKOZd9k/cOG83uFys3X9QW5kHxy0ZRIfxGHDFLOsRPzAxMRY1xGy1QV
 5Xn0brSxLbQqAUuICfcTvAoSK1Pcm0RZrLZ4qzI3j7pUXhjUdltHM2Nz1HCZCruryL
 WZJ89YcEpHxoA==
Message-ID: <9b7f8d96-e86b-4eb0-855a-8c74fc96d3c8@denx.de>
Date: Thu, 3 Oct 2024 17:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <a66a2eaf30e21ff7c87f140e97ed4639640121ba.camel@pengutronix.de>
 <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
 <f894eb3fd132a214ddbf2fa3ed405d065e629398.camel@pengutronix.de>
 <a7b7acff-e710-4c50-97b8-1bce557eadde@denx.de>
 <c09a325a5166cf31b9a7fd09ed8266a2b19afcd2.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c09a325a5166cf31b9a7fd09ed8266a2b19afcd2.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

On 9/26/24 1:14 PM, Philipp Zabel wrote:
> Hi,

Hi,

> On Mi, 2024-09-25 at 22:14 +0200, Marek Vasut wrote:
>> The userspace could distribute the frames between the two devices in an
>> alternating manner, can it not ?
> 
> This doesn't help with latency, or when converting a single large
> frame.
> 
> For the deinterlacer, this can't be done with the motion-aware
> temporally filtering modes. Those need a field from the previous frame.

It is up to the userspace to pass the correct frames to the deinterlacer.

>> Would the 1280x360 field be split into two tiles vertically and each
>> tile (newly 1280/2 x 360) be enqueued on each VDIC ? I don't think that
>> works, because you wouldn't be able to stitch those tiles back together
>> nicely after the deinterlacing, would you? I would expect to see some
>> sort of an artifact exactly where the two tiles got stitched back
>> together, because the VDICs are unaware of each other and how each
>> deinterlaced the tile.
> 
> I was thinking horizontally, two 640x720 tiles side by side. 1280 is
> larger than the 968 pixel maximum horizontal resolution of the VDIC.
> 
> As you say, splitting vertically (which would be required for 1080i)
> should cause artifacts at the seam due to the 4-tap vertical filter.

Can the userspace set some sort of offset/stride in each buffer and 
distribute the task between the two VDIs then ?

> [...]
>>>
>>> With the rigid V4L2 model though, where memory handling, parameter
>>> calculation, and job scheduling of tiles in a single frame all have to
>>> be hidden behind the V4L2 API, I don't think requiring userspace to
>>> combine multiple mem2mem video devices to work together on a single
>>> frame is feasible.
>>
>> If your concern is throughput (from what I gathered from the text
>> above), userspace could schedule frames on either VDIC in alternating
>> manner.
> 
> Both throughput and latency.
> 
> Yes, alternating to different devices would help with throughput where
> possible, but it's worse for frame pacing, a hassle to implement
> generically in userspace, and it's straight up impossible with temporal
> filtering.

See above, userspace should be able to pass the correct frames to m2m 
device.

>> I think this is much better and actually generic approach than trying to
>> combine two independent devices on kernel level and introduce some sort
>> of scheduler into kernel driver to distribute jobs between the two
>> devices. Generic, because this approach works even if either of the two
>> devices is not VDIC. Independent devices, because yes, the MX6Q IPUs are
>> two independent blocks, it is only the current design of the IPUv3
>> driver that makes them look kind-of like they are one single big device,
>> I am not happy about that design, but rewriting the IPUv3 driver is way
>> out of scope here. (*)
> 
> The IPUs are glued together at the capture and output paths, so yes,
> they are independent blocks, but also work together as a big device.
> 
>>> Is limiting different users to the different deinterlacer hardware
>>> units a real usecase? I saw the two ICs, when used as mem2mem devices,
>>> as interchangeable resources.
>>
>> I do not have that use case, but I can imagine it could come up.
>> In my case, I schedule different cameras to different VDICs from
>> userspace as needed.
> 
> Is this just because a single VDIC does not have enough throughput to
> serve all cameras, or is there some reason for a fixed assignment
> between cameras and VDICs?

I want to be able to distribute the bandwidth utilization between the 
two IPUs .

>>>>> To be fair, we never implemented that for the CSC/scaler mem2mem device
>>>>> either.
>>>>
>>>> I don't think that is actually a good idea. Instead, it would be better
>>>> to have two scaler nodes in userspace.
>>>
>>> See above, that would make it impossible (or rather unreasonably
>>> complicated) to distribute work on a single frame to both IPUs.
>>
>> Is your concern latency instead of throughput ? See my comment in
>> paragraph (*) .
> 
> Either, depending on the use case.
> 
> [...]
>>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/media/imx/imx-media-vdic.c#n207
>>>
>>> That code is unused. The direct hardware path doesn't use
>>> IPUV3_CHANNEL_MEM_VDI_PREV/CUR/NEXT, but is has a similar effect, half
>>> of the incoming fields are dropped. The setup is vdic_setup_direct().
>>
>> All right, let's drop that unused code then, I'll prepare a patch.
> 
> Thanks!
> 
>> But it seems the bottom line is, the VDI direct mode does not act as a
>> frame-rate doubler ?
> 
> Yes, it can't. In direct mode, VDIC only receives half of the fields.
> 
> [...]
>>>>
>> Why would adding the (configurable) frame-rate doubling mode break
>> userspace if this is not the default ?
> 
> I'm not sure it would. Maybe there should be a deinterlacer control to
> choose between full and half field rate output (aka frame doubling and
> 1:1 input to output frame rate).
> 
> Also, my initial assumption was that currently there is 1:1 input
> frames to output frames. But with temporal filtering enabled there's
> already one input frame (the first one) that doesn't produce any
> output.

Hum, ok.

>>>>> If we don't start with that supported, I fear userspace will make
>>>>> assumptions and be surprised when a full rate mode is added later.
>>>>
>>>> I'm afraid that since the current VDI already does retain input frame
>>>> rate instead of doubling it, the userspace already makes an assumption,
>>>> so that ship has sailed.
>>>
>>> No, this is about the deinterlacer mem2mem device, which doesn't exist
>>> before this series.
>>
>> I am not convinced it is OK if the direct VDI path and mem2mem VDI
>> behave differently, that would be surprising to me as a user ?
> 
> Is this still about the frame rate doubling? Surely supporting it in
> the mem2mem device and not in the capture path is ok. I'm not arguing
> that frame doubling should be enabled by default.

My understanding was that your concern was -- frame doubling should be 
the default because it not being the default would break userspace . 
Maybe that's not the case ?

>>> The CSI capture path already has configurable framedrops (in the CSI).
>>
>> What am I looking for ? git grep doesn't give me any hits ? (**)
> 
> That's configured by the set_frame_interval pad op of the CSI subdevice
> - on the IDMAC output pad. See csi_find_best_skip().
> 
>>>> But I think we can make the frame doubling configurable ?
>>>
>>> That would be good. Specifically, there must be no guarantee that one
>>> input frame with two fields only produces one deinterlaced output
>>> frame, and userspace should somehow be able to understand this.
>>
>> See my question (**) , where is this configurable framedrops thing ?
> 
> This would have to be done differently, though. Here we don't have
> subdev set_frame_interval configuration, and while VIDIOC_S_PARM /
> v4l2_captureparm were used to configure frame dropping on capture
> devices, that's not really applicable to mem2mem deinterlacers.

V4L2_CID_DEINTERLACING_MODE should probably work.

>>> I'd rather not default to the setting that throws away half of the
>>> input data. Not using frame doubling by default is sensible, but now
>>> that using all three input fields to calculate the output frame is
>>> possible, why not make that the default.
>>
>> To save memory bandwidth on the MX6, that's my main concern.
> 
> What userspace are you using to exercise this driver? Maybe we can back
> this concern with a few numbers (or mine with pictures).
Custom one, but with gstreamer 1.22 and 1.24 driving the media pipeline.
