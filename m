Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 403699867CB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 22:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B5E10E879;
	Wed, 25 Sep 2024 20:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="Mob5/Ijo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8639010E879
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 20:49:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3F5CA87179;
 Wed, 25 Sep 2024 22:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727297393;
 bh=00qhpUSbPwX7l/uw3vpiF1kyNQLTvs1CqaV2gPPJTQM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mob5/IjohpnRjUMrReUNnbsdSPwU92aY7GdjtJLxkMWJRlWGJJYV6UAGQRRlNpcZa
 bvTwxP1sXipZPza/BIqwHVn3ssHLkpWDv1yNYgVfOoRLWvzP2WFSwQKODRiQLuUPwe
 LtJHWlRP7nMW2+sutH+CtKMvjWxoItJH7TwL59xGnc9TtgYL0o8OcXFvrjBsxtGyNC
 huGurmrDFM77jHYuYRN8xLMnPetqhz3QCi5klSkmzs1eSvVPvgi3jeB+XnNMFR5f3r
 NuhMADkwgsOti+00+vg/3IwJRRpLGAfAS7t+RakdJPjbsi2hdqZbhP65/uN7UVFZ6U
 V2pTdrQuC8rAQ==
Message-ID: <a7b7acff-e710-4c50-97b8-1bce557eadde@denx.de>
Date: Wed, 25 Sep 2024 22:14:39 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f894eb3fd132a214ddbf2fa3ed405d065e629398.camel@pengutronix.de>
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

On 9/25/24 5:07 PM, Philipp Zabel wrote:

Hi,

> On Di, 2024-09-24 at 17:28 +0200, Marek Vasut wrote:
>> On 9/6/24 11:01 AM, Philipp Zabel wrote:
> [...]
>>> Instead of presenting two devices to userspace, it would be better to
>>> have a single video device that can distribute work to both IPUs.
>>
>> Why do you think so ?
> 
> The scaler/colorspace converter supports frames larger than the
> 1024x1024 hardware by splitting each frame into multiple tiles. It
> currently does so sequentially on a single IC. Speed could be improved
> by distributing the tiles to both ICs. This is not an option anymore if
> there are two video devices that are fixed to one IC each.

The userspace could distribute the frames between the two devices in an 
alternating manner, can it not ?

> The same would be possible for the deinterlacer, e.g. to support 720i
> frames split into two tiles each sent to one of the two VDICs.

Would the 1280x360 field be split into two tiles vertically and each 
tile (newly 1280/2 x 360) be enqueued on each VDIC ? I don't think that 
works, because you wouldn't be able to stitch those tiles back together 
nicely after the deinterlacing, would you? I would expect to see some 
sort of an artifact exactly where the two tiles got stitched back 
together, because the VDICs are unaware of each other and how each 
deinterlaced the tile.

>> I think it is better to keep the kernel code as simple as possible, i.e.
>> provide the device node for each m2m device to userspace and handle the
>> m2m device hardware interaction in the kernel driver, but let userspace
>> take care of policy like job scheduling, access permissions assignment
>> to each device (e.g. if different user accounts should have access to
>> different VDICs), or other such topics.
> 
> I both agree and disagree with you at the same time.
> 
> If the programming model were more similar to DRM, I'd agree in a
> heartbeat. If the kernel driver just had to do memory/fence handling
> and command submission (and parameter sanitization, because there is no
> MMU), and there was some userspace API on top, it would make sense to
> me to handle parameter calculation and job scheduling in a hardware
> specific userspace driver that can just open one device for each IPU.
> 
> With the rigid V4L2 model though, where memory handling, parameter
> calculation, and job scheduling of tiles in a single frame all have to
> be hidden behind the V4L2 API, I don't think requiring userspace to
> combine multiple mem2mem video devices to work together on a single
> frame is feasible.

If your concern is throughput (from what I gathered from the text 
above), userspace could schedule frames on either VDIC in alternating 
manner.

I think this is much better and actually generic approach than trying to 
combine two independent devices on kernel level and introduce some sort 
of scheduler into kernel driver to distribute jobs between the two 
devices. Generic, because this approach works even if either of the two 
devices is not VDIC. Independent devices, because yes, the MX6Q IPUs are 
two independent blocks, it is only the current design of the IPUv3 
driver that makes them look kind-of like they are one single big device, 
I am not happy about that design, but rewriting the IPUv3 driver is way 
out of scope here. (*)

> Is limiting different users to the different deinterlacer hardware
> units a real usecase? I saw the two ICs, when used as mem2mem devices,
> as interchangeable resources.

I do not have that use case, but I can imagine it could come up.
In my case, I schedule different cameras to different VDICs from 
userspace as needed.

>>> To be fair, we never implemented that for the CSC/scaler mem2mem device
>>> either.
>>
>> I don't think that is actually a good idea. Instead, it would be better
>> to have two scaler nodes in userspace.
> 
> See above, that would make it impossible (or rather unreasonably
> complicated) to distribute work on a single frame to both IPUs.

Is your concern latency instead of throughput ? See my comment in 
paragraph (*) .

> 
> [...]
>>>> +	ipu_cpmem_set_buffer(priv->vdi_out_ch,  0, out_phys);
>>>> +	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys + phys_offset);
>>>> +	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, curr_phys);
>>>> +	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys + phys_offset);
>>>
>>> This always outputs at a frame rate of half the field rate, and only
>>> top fields are ever used as current field, and bottom fields as
>>> previous/next fields, right?
>>
>> Yes, currently the driver extracts 1 frame from two consecutive incoming
>> fields (previous Bottom, and current Top and Bottom):
>>
>> (frame 1 and 3 below is omitted)
>>
>>       1  2  3  4
>> ...|T |T |T |T |...
>> ...| B| B| B| B|...
>>        | ||  | ||
>>        '-''  '-''
>>         ||    ||
>>         ||    \/
>>         \/  Frame#4
>>       Frame#2
>>
>> As far as I understand it, this is how the current VDI implementation
>> behaves too, right ?
> 
> Yes, that is a hardware limitation when using the direct CSI->VDIC
> direct path. As far as I understand, for each frame (two fields) the
> CSI only sends the first ("PREV") field directly to the VDIC, which
> therefor can only be run in full motion mode (use the filter to add in
> the missing lines).
> The second ("CUR") field is just ignored. It could be written to RAM
> via IDMAC output channel 13 (IPUV3_CHANNEL_VDI_MEM_RECENT), which can
> not be used by the VDIC in direct mode. So this is not implemented.
> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/media/imx/imx-media-vdic.c#n207
> 
> That code is unused. The direct hardware path doesn't use
> IPUV3_CHANNEL_MEM_VDI_PREV/CUR/NEXT, but is has a similar effect, half
> of the incoming fields are dropped. The setup is vdic_setup_direct().

All right, let's drop that unused code then, I'll prepare a patch.

But it seems the bottom line is, the VDI direct mode does not act as a 
frame-rate doubler ?

>>> I think it would be good to add a mode that doesn't drop the
>>>
>>> 	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys);
>>> 	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, prev_phys + phys_offset);
>>> 	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys);
>>>
>>> output frames, right from the start.
>>
>> This would make the VDI act as a frame-rate doubler, which would spend a
>> lot more memory bandwidth, which is limited on MX6, so I would also like
>> to have a frame-drop mode (i.e. current behavior).
>>
>> Can we make that behavior configurable ? Since this is a mem2mem device,
>> we do not really have any notion of input and output frame-rate, so I
>> suspect this would need some VIDIOC_* ioctl ?
> 
> That would be good. The situation I'd like to avoid is that this device
> becomes available without the full frame-rate mode, userspace then
> assumes this is a 1:1 frame converter device, and then we can't add the
> full frame-rate later without breaking userspace.

Why would adding the (configurable) frame-rate doubling mode break 
userspace if this is not the default ?

>>> If we don't start with that supported, I fear userspace will make
>>> assumptions and be surprised when a full rate mode is added later.
>>
>> I'm afraid that since the current VDI already does retain input frame
>> rate instead of doubling it, the userspace already makes an assumption,
>> so that ship has sailed.
> 
> No, this is about the deinterlacer mem2mem device, which doesn't exist
> before this series.

I am not convinced it is OK if the direct VDI path and mem2mem VDI 
behave differently, that would be surprising to me as a user ?

> The CSI capture path already has configurable framedrops (in the CSI).

What am I looking for ? git grep doesn't give me any hits ? (**)

>> But I think we can make the frame doubling configurable ?
> 
> That would be good. Specifically, there must be no guarantee that one
> input frame with two fields only produces one deinterlaced output
> frame, and userspace should somehow be able to understand this.

See my question (**) , where is this configurable framedrops thing ?

> This would be an argument against Nicolas' suggestion of including this
> in the csc/scaler device, which always must produce one output frame
> per input frame.
> 
> [...]
>>> This maps to VDI_C_MOT_SEL_FULL aka VDI_MOT_SEL=2, which is documented
>>> as "full motion, only vertical filter is used". Doesn't this completely
>>> ignore the previous/next fields and only use the output of the di_vfilt
>>> four tap vertical filter block to fill in missing lines from the
>>> surrounding pixels (above and below) of the current field?
>>
>> Is there a suitable knob for this or shall I introduce a device specific
>> one, like the vdic_ctrl_motion_menu for the current VDIC direct driver ?
>>
>> If we introduce such a knob, then it is all the more reason to provide
>> one device node per one VDIC hardware instance, since each can be
>> configured for different motion settings.
> 
> As far as I know, there is no such control yet. I don't think this
> should be per-device, but per-stream (or even per-frame).
> 
>>> I think this should at least be configurable, and probably default to
>>> MED_MOTION.
>>
>> I think to be compatible with the current VDI behavior and to reduce
>> memory bandwidth usage, let's default to the HIGH/full mode. That one
>> produces reasonably good results without spending too much memory
>> bandwidth which is constrained already on the MX6, and if the user needs
>> better image quality, they can configure another mode using the V4L2
>> control.
> 
> I'd rather not default to the setting that throws away half of the
> input data. Not using frame doubling by default is sensible, but now
> that using all three input fields to calculate the output frame is
> possible, why not make that the default.
To save memory bandwidth on the MX6, that's my main concern.
