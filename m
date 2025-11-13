Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFFC586A7
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 16:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191C210E860;
	Thu, 13 Nov 2025 15:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="oIhh1LHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D148F10E860
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 15:36:35 +0000 (UTC)
Message-ID: <d16af3e8-3ca1-4676-9112-32f7e33bd6df@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763048193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eO08yAJL2+iPpYzeNmwM0YR9k1khw+2M2/QRkBIoq5I=;
 b=oIhh1LHFeqonkNSOYHAXCoLgDnrY1+uIzi2hOrkYeLDlncR4E6OEb+aqzoqlYsTf/wtn26
 imrnsA93QYD/88N2T5n+nQylXmnmwy6WLpgfDx8wyz37Q8ZrP4HvCBC9AHtPfa2H66hSLQ
 /YLAW8o4aSam0hefdlgrRsivjV6w+i4=
Date: Thu, 13 Nov 2025 10:36:12 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <a8f0de1d-07e8-4e48-8495-9cafa0febcf5@linux.dev>
 <d2759f7e-23a5-4d68-b50f-4c510540bcdd@linux.dev>
 <6d17761f-c2c5-422c-a14f-0e560676c21f@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <6d17761f-c2c5-422c-a14f-0e560676c21f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 11/12/25 04:31, Tomi Valkeinen wrote:
> Hi,
> 
> On 11/11/2025 23:09, Sean Anderson wrote:
>> On 11/4/25 16:53, Sean Anderson wrote:
>>> On 6/27/25 10:50, Mike Looijmans wrote:
>>>> XRGB8888 is the default mode that Xorg will want to use. Add support
>>>> for this to the Zynqmp DisplayPort driver, so that applications can use
>>>> 32-bit framebuffers. This solves that the X server would fail to start
>>>> unless one provided an xorg.conf that sets DefaultDepth to 16.
>>>>
>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>> ---
>>>>
>>>>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>> index 80d1e499a18d..501428437000 100644
>>>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>>>>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>>>  		.swap		= true,
>>>>  		.sf		= scaling_factors_888,
>>>> +	}, {
>>>> +		.drm_fmt	= DRM_FORMAT_XRGB8888,
>>>> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>>> +		.swap		= true,
>>>> +		.sf		= scaling_factors_888,
>>>>  	}, {
>>>>  		.drm_fmt	= DRM_FORMAT_RGBA8888,
>>>>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,
>>>
>>> Tested-by: Sean Anderson <sean.anderson@linux.dev>
>>>
>>> I can confirm that this provides a nice performance boost :)
>> 
>> Actually, I think a better fix would be to make the "video" plane the
>> primary one. That plane supports XRGB8888 natively, and then the
>> graphics plane can be used as an overlay for e.g. windows or cursors.
> True, but I think usually the overlay plane is the video plane, which
> supports YUV formats. If we use the video plane as the root plane, then
> that one is reserved and there's no "real" video overlay plane.

But you can't use it as an overlay anyway unless you enable colorkey.
Otherwise it's always an "underlay". So you can't actually have e.g. the
video layer display a decoded video in a window because that would
require userspace to "carve out" the window in the graphics alpha layer.
But as discussed earlier in this thread, the alpha channel is always
disabled by this driver! So the video layer is completely unusable in
the current driver anyway.

> Did you check my recent reply to the thread? I didn't have too much time
> to debug all the combinations and what exactly the userspace does. I'm
> inclined to just merge this one which should improve the user experience
> quite a bit, even if there are still unclear parts to this. The related
> code can be improved later if we figure out the details.
> 
> Any objections?

I object to this because it solidifies the current state of affairs
where the alpha channel of the graphics layer can't be used. I will
submit a series later today to change the primary plane and enable the
alpha channel.

--Sean
