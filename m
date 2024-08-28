Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC339628AF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4760C10E51D;
	Wed, 28 Aug 2024 13:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N9MRGRdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8555810E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 13:32:53 +0000 (UTC)
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi
 [91.156.87.48])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F4F22C5;
 Wed, 28 Aug 2024 15:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724851904;
 bh=x8UW8G7yRo1TaVJlKhWZNboAwC3S4JXibdcuvIJsCMo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N9MRGRdcXRunpbK+/aqTZ94Wgc7HibVMqLrEcTuhmnr6wR+5zEQ96lGiaHG2Z9rU1
 t2NvbfbCPtd2HUnm0WPgJPfKblFwVuWON1i7tSwUfRk8a/oDJ2ux+J9WtLSnfoFIks
 dHOyMT3cqa12VQc9FdzIaXWNVawBAJpiSLeG4kAQ=
Message-ID: <5bb0459a-ec3a-487f-a9b5-28ee643a1215@ideasonboard.com>
Date: Wed, 28 Aug 2024 16:32:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
To: Jan Kiszka <jan.kiszka@siemens.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, dri-devel@lists.freedesktop.org,
 Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
References: <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <b221c978-2ce0-4d31-8146-ab43a9f86a1f@ti.com>
 <st6vgd2k6dxo4vd3pmqmqlc5haofhbym2jeb2eeh2pa2n6zcca@tradpzxrzexl>
 <2469374.jE0xQCEvom@steina-w>
 <CAA8EJpraKjBZRLL5U+BVQRf98_EBa5b=nSPxZATU+yvvq9Kfmw@mail.gmail.com>
 <4133a684-61a1-4d18-bb25-212d5fdc5620@siemens.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <4133a684-61a1-4d18-bb25-212d5fdc5620@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2024 22:35, Jan Kiszka wrote:
> On 24.06.24 12:17, Dmitry Baryshkov wrote:
>> On Mon, 24 Jun 2024 at 13:07, Alexander Stein
>> <alexander.stein@ew.tq-group.com> wrote:
>>>
>>> Hi,
>>>
>>> Am Montag, 24. Juni 2024, 11:49:04 CEST schrieb Dmitry Baryshkov:
>>>> On Mon, Jun 24, 2024 at 03:07:10PM GMT, Aradhya Bhatia wrote:
>>>>>
>>>>>
>>>>> On 22/06/24 17:49, Dmitry Baryshkov wrote:
>>>>>> On Sat, Jun 22, 2024 at 05:16:58PM GMT, Aradhya Bhatia wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 17-Jun-24 13:41, Dmitry Baryshkov wrote:
>>>>>>>> On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
>>>>>>>>> On 16.02.24 15:57, Marek Vasut wrote:
>>>>>>>>>> On 2/16/24 10:10, Tomi Valkeinen wrote:
>>>>>>>>>>> Ok. Does anyone have a worry that these patches make the situation
>>>>>>>>>>> worse for the DSI case than it was before? Afaics, if the DSI lanes
>>>>>>>>>>> are not set up early enough by the DSI host, the driver would break
>>>>>>>>>>> with and without these patches.
>>>>>>>>>>>
>>>>>>>>>>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR and DPI, so
>>>>>>>>>>> I'd like to merge these unless these cause a regression with the DSI
>>>>>>>>>>> case.
>>>>>>>>>>
>>>>>>>>>> 1/2 looks good to me, go ahead and apply .
>>>>>>>
>>>>>>> Isn't there any way for the second patch to move forward as well though?
>>>>>>> The bridge device (under DPI to (e)DP mode) cannot really work without
>>>>>>> it, and the patches have been pending idle for a long time. =)
>>>>>>>
>>>>>>>>>
>>>>>>>>> My local patches still apply on top of 6.10-rc4, so I don't think this
>>>>>>>>> ever happened. What's still holding up this long-pending fix (at least
>>>>>>>>> for our devices)?
>>>>>>>>
>>>>>>>> Neither of the patches contains Fixes tags. If the first patch fixes an
>>>>>>>> issue in previous kernels, please consider following the stable process.
>>>>>>>>
>>>>>>>> If we are unsure about the second patch, please send the first patch
>>>>>>>> separately, adding proper tags.
>>>>>>>>
>>>>>>>
>>>>>>> Thanks Dmitry! I can send the patches again with the required fixes
>>>>>>> tags (or just patch-1 if we cannot do anything about patch-2).
>>>>>>
>>>>>> The problem with the second patch is that it get mixed reviews. I can
>>>>>> ack the first patch, but for the second one I'd need a confirmation from
>>>>>> somebody else. I'll go on and apply the first patch later today.
>>>>>>
>>>>>
>>>>> Thanks Dmitry!
>>>>>
>>>>> However, would it be okay if I instead add another patch that makes 2
>>>>> versions of the "tc_edp_bridge_funcs", say "tc_dpi_edp_bridge_funcs" and
>>>>> "tc_dsi_edp_bridge_funcs", that have all the same function hooks except
>>>>> for the .edid_read()?
>>>>>
>>>>> The dsi edid_read() will remain the same, and Tomi's patch - patch 2/2 -
>>>>> will only fix the dpi version of the edid_read()?
>>>>>
>>>>> The bridge already has the capability to distinguish a DSI input from a
>>>>> DPI input. This can be leveraged to decide which set of functions need
>>>>> to be used without any major changes.
>>>>
>>>> I'd prefer if somebody with the DSI setup can ack / test the second
>>>> patch.
>>>>
>>>>
>>>
>>> Now that my DSI-DP setup works apparently without issue I could test patch 2.
>>> Since my setup does not use DRM_BRIDGE_ATTACH_NO_CONNECTOR (running on
>>> drivers/gpu/drm/mxsfb/lcdif_drv.c), I can only say
>>> there is no regression.
>>
>> Let me send a (non-tested) patch, switching to drm_bridge_connector,
>> then you can probably test both of them
>>
> 
> I suppose [1] was that follow-up, just not leading to success, right?
> 
> Now, what's next? I'd love to see the regression we have for the IOT2050
> devices finally fixed, even if it now only requires a short downstream
> patch.
> 
> Jan
> 
> [1] https://lore.kernel.org/dri-devel/20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org/

I have to say I don't remember the details for this anymore, but half a 
year ago I said:

> Afaics, if the DSI lanes are not set up early enough by the DSI host, the driver would break with and without these patches.

I'm not sure if that is correct or not. But if it is, then, afaiu, this 
(the second patch):

- Fixes the issue for the DPI-DP use case

- Doesn't cause issues for the DSI-DP use case without 
DRM_BRIDGE_ATTACH_NO_CONNECTOR (as per Alexander's test)

- Shouldn't cause (new) issues for the DSI-DP use case with 
DRM_BRIDGE_ATTACH_NO_CONNECTOR (as per my code review and guessing...)

The third point is somewhat concerning, of course, but do we have any 
setup with DSI-DP and DRM_BRIDGE_ATTACH_NO_CONNECTOR that works now? If 
not, maybe we can just ignore the possible issues, as this fixes 
problems on a setup we do have.

  Tomi

