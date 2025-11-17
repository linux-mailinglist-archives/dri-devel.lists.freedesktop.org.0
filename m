Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A9EC650B5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 17:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677F010E3F1;
	Mon, 17 Nov 2025 16:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="lBS4GNQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com
 [91.218.175.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB6410E052
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 16:10:04 +0000 (UTC)
Message-ID: <7248b96f-be82-4b89-87e4-f86b3898bc55@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763395802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwAPPDquHtcNm47PaRnhELwXgDi0cjA+vnOu+Fa7qBE=;
 b=lBS4GNQ/vb9F6Vn/H9S43xfWCRoEeB5UrFnWt3WBDy+U0RbpDu5SAii+DYIYorWbkpkzWV
 K/TDPrFQV4wt4IYlP33rqlxWYcWmvwZpNedARWTDnTXWvpK87WtJpg8DYGE9+ksAUpMOU2
 ROGZ/mbtzBV9DQc6Lib9c62Ai2zK4iE=
Date: Mon, 17 Nov 2025 11:09:57 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm: zynqmp: Make the video plane primary
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Looijmans <mike.looijmans@topic.nl>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Simona Vetter <simona@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>
References: <20251113203715.2768107-1-sean.anderson@linux.dev>
 <20251113203715.2768107-3-sean.anderson@linux.dev>
 <MW4PR12MB71651E0E82AD8E4898DBD017E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
 <680bee12-6bac-4634-8a02-4b1717a90aa2@linux.dev>
 <MW4PR12MB7165F8413848B53CB8C7C031E6CBA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MW4PR12MB7165F8413848B53CB8C7C031E6CBA@MW4PR12MB7165.namprd12.prod.outlook.com>
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

On 11/14/25 19:57, Klymenko, Anatoliy wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Sean
>> Anderson
>> Sent: Thursday, November 13, 2025 2:52 PM
>> To: Klymenko, Anatoliy <Anatoliy.Klymenko@amd.com>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> Michal <michal.simek@amd.com>
>> Subject: Re: [PATCH 2/3] drm: zynqmp: Make the video plane primary
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> On 11/13/25 17:45, Klymenko, Anatoliy wrote:
>> > [AMD Official Use Only - AMD Internal Distribution Only]
>> >
>> > Hi Sean,
>> >
>> > Thanks a lot for the patch (and tackling the alpha issue in general)
>> >
>> >> -----Original Message-----
>> >> From: Sean Anderson <sean.anderson@linux.dev>
>> >> Sent: Thursday, November 13, 2025 12:37 PM
>> >> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> >> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> >> Cc: linux-kernel@vger.kernel.org; Mike Looijmans
>> <mike.looijmans@topic.nl>;
>> >> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> >> <tzimmermann@suse.de>; Maarten Lankhorst
>> >> <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
>> >> <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-
>> >> arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> >> Michal <michal.simek@amd.com>; Sean Anderson
>> >> <sean.anderson@linux.dev>
>> >> Subject: [PATCH 2/3] drm: zynqmp: Make the video plane primary
>> >>
>> >> Caution: This message originated from an External Source. Use proper
>> caution
>> >> when opening attachments, clicking links, or responding.
>> >>
>> >>
>> >> The zynqmp has two planes: "video" and "graphics". The video plane
>> >>
>> >> - Is on the bottom (zpos=0) (except when chroma keying as the master
>> plane)
>> >> - Supports "live" input (e.g. from an external source)
>> >> - Supports RGB, YUV, and YCbCr formats, including XRGB8888
>> >> - Does not support transparency, except via chroma keying (colorkey)
>> >> - Must cover the entire screen (translation/resizing not supported)
>> >>
>> >> The graphics plane
>> >>
>> >> - Is on the top (zpos=1)
>> >> - Supports "live" input (e.g. from an external source)
>> >> - Supports RGB and YUV444 formats, but not XRGB8888
>> >> - Supports transparency either via
>> >>   - Global alpha channel, which disables per-pixel alpha when enabled
>> >>   - Per-pixel alpha, which cannot be used with global alpha
>> >>   - Chroma keying (colorkey)
>> >> - Must cover the entire screen (translation/resizing not supported)
>> >>
>> >> Currently the graphics plane is the primary plane. Make the video plane
>> >> the primary plane:
>> >>
>> >> - The video plane supports XRGB8888, which is the default 24-bit
>> >>   colorspace for X. This results in improved performance when compared
>> >>   to RGB565.
>> >> - The graphics plane can be used as an overlay because it has a higher
>> >>   z-pos and supports a per-pixel alpha channel. Unfortunately, clients
>> >>   like weston cannot currently take advantage of this because they
>> >>   expect overlay planes to support translation/resizing.
>> >>
>> >> One downside to this approach could be that the graphics plane has worse
>> >> support for YUV and YCBCr, so it may be more difficult to compose video
>> >
>> > Not just more difficult but practically impossible:
>> > 1. GFX (in Xilinx terminology) plane doesn't support pixel upscaling, so
>> > no support for NV12, YUY2 and other common video pixel formats.
>> > 2. Both planes are unscalable, this means we can only output native
>> > display resolution video on the top plane, or display thick black frame
>> > around the picture. We are losing GFX masking capabilities.
>>
>> The graphics masking capabilities are the same as they always were.
>>
>> > 3. We won't be able to render subtitles on top of the video.
>> > Probably the only practical video player option remains here is to render
>> > video to a texture and embed it into graphics composition.
>>
>> OK, but none of this is currently possible either because of the global
>> alpha setting. So do you have a specific program in mind that plays
>> video and will do it with an "underlay" plane?
>>
> 
> webOS, Roku OS, just to name a few. But most importantly, AMD has quite
> a few customers using "underlay" plane because of its YUV 420 capability.

Can you link to a specific example where the plane is selected based on
its primary/overlay status and not based on its format support?  I'm not
too familiar with these distros, but e.g. [1] selects the plane based on
the format, and doesn't care which one is primary.

--Sean

[1] https://github.com/webosose/omx-components/blob/27b33e17c25023f2c7ffbbfda10169fb500dacdc/src/omxdrm/videorenderer.cpp#L469

>> >> streams into the window of a media player. However, no existing software
>> >> could rely on this because there is no way to enable the per-pixel alpha
>> >> channel when the graphics plane is enabled. This makes it impossible to
>> >
>> > This situation is a driver bug not a fatum.
>>
>> And yet the driver bug provides ample evidence that no one is doing this,
>> so we don't need to worry about it.
>>
>> --Sean
>>
>> > Per pixel alpha blending works
>> > just fine if we disable global alpha. We just need to avoid enabling it when
>> > we have alpha capable GFX plane format.
>> >
>> >> "carve out" an area in the graphics plane where the video plane shows
>> >> through. This limitation is addressed in the next patch, but it means we
>> >> do not need to worry about compatibility in this area.
>> >>
>> >> An alternate approach could be to pretend that the graphics plane
>> >> supports XRGB8888 by using the supported ARGB8888 mode instead and
>> >> enabling the global alpha channel. However, this would rule out ever
>> >> using the per-pixel alpha channel.
>> >>
>> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> >> ---
>> >>
>> >>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 6 +++---
>> >>  1 file changed, 3 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> index c80a2d4034f3..456ada9ac003 100644
>> >> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> >> @@ -161,8 +161,8 @@ static int zynqmp_dpsub_create_planes(struct
>> >> zynqmp_dpsub *dpsub)
>> >>                 if (!formats)
>> >>                         return -ENOMEM;
>> >>
>> >> -               /* Graphics layer is primary, and video layer is overlay. */
>> >> -               type = i == ZYNQMP_DPSUB_LAYER_VID
>> >> +               /* Graphics layer is overlay, and video layer is primary. */
>> >> +               type = i == ZYNQMP_DPSUB_LAYER_GFX
>> >>                      ? DRM_PLANE_TYPE_OVERLAY :
>> >> DRM_PLANE_TYPE_PRIMARY;
>> >>                 ret = drm_universal_plane_init(&dpsub->drm->dev, plane, 0,
>> >>                                                &zynqmp_dpsub_plane_funcs,
>> >> @@ -322,7 +322,7 @@ static const struct drm_crtc_funcs
>> >> zynqmp_dpsub_crtc_funcs = {
>> >>
>> >>  static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
>> >>  {
>> >> -       struct drm_plane *plane = &dpsub->drm-
>> >> >planes[ZYNQMP_DPSUB_LAYER_GFX];
>> >> +       struct drm_plane *plane = &dpsub->drm-
>> >> >planes[ZYNQMP_DPSUB_LAYER_VID];
>> >>         struct drm_crtc *crtc = &dpsub->drm->crtc;
>> >>         int ret;
>> >>
>> >> --
>> >> 2.35.1.1320.gc452695387.dirty
>> >
>> > Thank you,
>> > Anatoliy
> 
> Thank you,
> Anatoliy
