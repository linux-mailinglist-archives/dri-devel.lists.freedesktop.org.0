Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B1BC5A773
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 00:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0114110E140;
	Thu, 13 Nov 2025 23:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="SBxGfgBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0288510E140
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:07:18 +0000 (UTC)
Message-ID: <b97065ce-2dc0-453b-ab8e-b2d134fc3467@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763075236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNlP3ns8VDppIWf6JUhMHR8RskYRryaARqBgPGOIgB4=;
 b=SBxGfgBc8I66z9OwND+wQTpzsICUh8sCuHclbXpRYW/l6+BFt0ca+M5i9JTso3vrBRiZ4+
 nJmSkYk63SftM6KGE2HTJg9emx330lYXxOcYJOOMjnDZB9Kh5zujiN0qq7riQGteHc7RfL
 uitjVW2UXVUOxDMITwgVFw4FgmqxCkU=
Date: Thu, 13 Nov 2025 18:07:07 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics plane
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
 <20251113203715.2768107-4-sean.anderson@linux.dev>
 <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MW4PR12MB716514EB76EE4585605D0E5AE6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
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

On 11/13/25 18:03, Klymenko, Anatoliy wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Sean,
> 
> Thank you for the patch.
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@linux.dev>
>> Sent: Thursday, November 13, 2025 12:37 PM
>> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
>> <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>; linux-
>> arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> Michal <michal.simek@amd.com>; Sean Anderson
>> <sean.anderson@linux.dev>
>> Subject: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics plane
>>
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>>
>>
>> When global alpha is enabled, per-pixel alpha is ignored. Allow
>> userspace to explicitly specify whether to use per-pixel alpha by
>> exposing it through the blend mode property. I'm not sure whether the
>> per-pixel alpha is pre-multiplied or not [1], but apparently it *must* be
>> pre-multiplied so I guess we have to advertise it.
>>
>> [1] All we get is "The alpha value available with the graphics stream
>>     will define the transparency of the graphics."
>>
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>>
>>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 24 ++++++++++++++++++++++--
>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> index 456ada9ac003..fa1cfc16db36 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> @@ -61,6 +61,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct
>> drm_plane *plane,
>>         if (!new_plane_state->crtc)
>>                 return 0;
>>
>> +       if (new_plane_state->pixel_blend_mode !=
>> DRM_MODE_BLEND_PIXEL_NONE &&
>> +           new_plane_state->alpha >> 8 != 0xff) {
>> +               drm_dbg_kms(plane->dev,
>> +                           "Plane alpha must be 1.0 when using pixel alpha\n");
>> +               return -EINVAL;
>> +       }
>> +
>>         crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
>>         if (IS_ERR(crtc_state))
>>                 return PTR_ERR(crtc_state);
>> @@ -117,9 +124,13 @@ static void
>> zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
>>
>>         zynqmp_disp_layer_update(layer, new_state);
>>
>> -       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
>> -               zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
>> +       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX) {
>> +               bool blend = plane->state->pixel_blend_mode ==
>> +                            DRM_MODE_BLEND_PIXEL_NONE;
>> +
>> +               zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
>>                                                    plane->state->alpha >> 8);
>> +       }
>>
>>         /*
>>          * Unconditionally enable the layer, as it may have been disabled
>> @@ -179,9 +190,18 @@ static int zynqmp_dpsub_create_planes(struct
>> zynqmp_dpsub *dpsub)
>>                         return ret;
>>
>>                 if (i == ZYNQMP_DPSUB_LAYER_GFX) {
>> +                       unsigned int blend_modes =
>> +                               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> +                               BIT(DRM_MODE_BLEND_PREMULTI);
> 
> | BIT(DRM_MODE_BLEND_COVERAGE) - this is what implemented in the hardware.

Do you have a datasheet (or other) reference?

But in any case, DRM_MODE_BLEND_PREMULTI is mandatory even if we don't support
it. See drm_plane_create_blend_mode_property for details.

--Sean

