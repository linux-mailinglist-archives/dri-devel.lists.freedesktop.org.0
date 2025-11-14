Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8B4C5DE74
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 16:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFA710EAB5;
	Fri, 14 Nov 2025 15:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Q1unag8/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F70410EAB4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 15:35:47 +0000 (UTC)
Message-ID: <759a8a24-2ed2-4628-b64c-b02428ee07cb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1763134545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xt5aILFSt7PSgQoMowi/IMdwH4D1+v22HJrwz8wAtmo=;
 b=Q1unag8/XOadACYHzamxxfIbf0YSgEXiyDvzZPMuD88j0cK1oVK1JpWo/0EuPSl2ycmXl9
 C39QRf8IT6j/xGcU3fSPQjJMRjFTWIzvwc/OXAbIxmMhucEbNtKwVYQGzOLsTMgvdlw1XQ
 Jn+DZKcAi5SyK3hnVyPnrkYG33/Zob4=
Date: Fri, 14 Nov 2025 10:35:32 -0500
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
 <MW4PR12MB71653FD94A2109A45BF4EDA1E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <MW4PR12MB71653FD94A2109A45BF4EDA1E6CDA@MW4PR12MB7165.namprd12.prod.outlook.com>
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

On 11/13/25 18:59, Klymenko, Anatoliy wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> -----Original Message-----
>> From: Klymenko, Anatoliy
>> Sent: Thursday, November 13, 2025 3:04 PM
>> To: 'Sean Anderson' <sean.anderson@linux.dev>; Laurent Pinchart
>> <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> <tzimmermann@suse.de>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> Michal <michal.simek@amd.com>
>> Subject: RE: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
>> plane
>>
>> Hi Sean,
>>
>> Thank you for the patch.
>>
>> > -----Original Message-----
>> > From: Sean Anderson <sean.anderson@linux.dev>
>> > Sent: Thursday, November 13, 2025 12:37 PM
>> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Tomi Valkeinen
>> > <tomi.valkeinen@ideasonboard.com>; dri-devel@lists.freedesktop.org
>> > Cc: linux-kernel@vger.kernel.org; Mike Looijmans <mike.looijmans@topic.nl>;
>> > David Airlie <airlied@gmail.com>; Thomas Zimmermann
>> > <tzimmermann@suse.de>; Maarten Lankhorst
>> > <maarten.lankhorst@linux.intel.com>; Klymenko, Anatoliy
>> > <Anatoliy.Klymenko@amd.com>; Maxime Ripard <mripard@kernel.org>;
>> linux-
>> > arm-kernel@lists.infradead.org; Simona Vetter <simona@ffwll.ch>; Simek,
>> > Michal <michal.simek@amd.com>; Sean Anderson
>> > <sean.anderson@linux.dev>
>> > Subject: [PATCH 3/3] drm: zynqmp: Add blend mode property to graphics
>> plane
>> >
>> > Caution: This message originated from an External Source. Use proper
>> caution
>> > when opening attachments, clicking links, or responding.
>> >
>> >
>> > When global alpha is enabled, per-pixel alpha is ignored. Allow
>> > userspace to explicitly specify whether to use per-pixel alpha by
>> > exposing it through the blend mode property. I'm not sure whether the
>> > per-pixel alpha is pre-multiplied or not [1], but apparently it *must* be
>> > pre-multiplied so I guess we have to advertise it.
>> >
>> > [1] All we get is "The alpha value available with the graphics stream
>> >     will define the transparency of the graphics."
>> >
>> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> > ---
>> >
>> >  drivers/gpu/drm/xlnx/zynqmp_kms.c | 24 ++++++++++++++++++++++--
>> >  1 file changed, 22 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> > b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> > index 456ada9ac003..fa1cfc16db36 100644
>> > --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> > +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>> > @@ -61,6 +61,13 @@ static int zynqmp_dpsub_plane_atomic_check(struct
>> > drm_plane *plane,
>> >         if (!new_plane_state->crtc)
>> >                 return 0;
>> >
>> > +       if (new_plane_state->pixel_blend_mode !=
>> > DRM_MODE_BLEND_PIXEL_NONE &&
>> > +           new_plane_state->alpha >> 8 != 0xff) {
>> > +               drm_dbg_kms(plane->dev,
>> > +                           "Plane alpha must be 1.0 when using pixel alpha\n");
>> > +               return -EINVAL;
>> > +       }
>> > +
>> >         crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
>> >         if (IS_ERR(crtc_state))
>> >                 return PTR_ERR(crtc_state);
>> > @@ -117,9 +124,13 @@ static void
>> > zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
>> >
>> >         zynqmp_disp_layer_update(layer, new_state);
>> >
>> > -       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
>> > -               zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
>> > +       if (plane->index == ZYNQMP_DPSUB_LAYER_GFX) {
>> > +               bool blend = plane->state->pixel_blend_mode ==
>> > +                            DRM_MODE_BLEND_PIXEL_NONE;
> 
> I would suggest adding
> || !plane->state->fb->format->has_alpha;
> pixel_blend_mode doesn't make a lot of sense for non-alpha formats but may
> have a negative effect on Mike's fix
> https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topic.nl/
> if user isn't careful enough around this property.

I don't believe that patch should be applied.

--Sean

>> > +
>> > +               zynqmp_disp_blend_set_global_alpha(dpsub->disp, blend,
>> >                                                    plane->state->alpha >> 8);
>> > +       }
>> >
>> >         /*
>> >          * Unconditionally enable the layer, as it may have been disabled
>> > @@ -179,9 +190,18 @@ static int zynqmp_dpsub_create_planes(struct
>> > zynqmp_dpsub *dpsub)
>> >                         return ret;
>> >
>> >                 if (i == ZYNQMP_DPSUB_LAYER_GFX) {
>> > +                       unsigned int blend_modes =
>> > +                               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>> > +                               BIT(DRM_MODE_BLEND_PREMULTI);
>>
>> | BIT(DRM_MODE_BLEND_COVERAGE) - this is what implemented in the
>> hardware.
>>
>> > +
>> >                         ret = drm_plane_create_alpha_property(plane);
>> >                         if (ret)
>> >                                 return ret;
>> > +
>> > +                       ret = drm_plane_create_blend_mode_property(plane,
>> > +                                                                  blend_modes);
>> > +                       if (ret)
>> > +                               return ret;
>> >                 }
>> >         }
>> >
>> > --
>> > 2.35.1.1320.gc452695387.dirty
>>
>> Thank you,
>> Anatoliy
> 
> Thank you,
> Anatoliy
> 

