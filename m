Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19D8CC61E
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 20:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D6310E0D8;
	Wed, 22 May 2024 18:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fdimPzqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6446610E0D8
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 18:11:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 736DDA38;
 Wed, 22 May 2024 20:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716401470;
 bh=oZSIUryH8Cqq8Qql2NnER5eoLAH632P7s2G857Vxqik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fdimPzqPz/6X19BTIpFZEN6pDNiF5wTMpcx3RYuex3opCMeDL27XYwoVWkkpVGhxz
 pJJHx3WhQCUiEywBbftWXpzRQH6Dl9PvZWBu+60CN4CFsbeCBbSGbdq1D0lW3UWYpP
 h5l3B6ewhoMMWvhU9w5l0vu9Ea1j2qZaEnUdLuMQ=
Date: Wed, 22 May 2024 21:11:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Enable plane in atomic update
Message-ID: <20240522181113.GD5164@pendragon.ideasonboard.com>
References: <20240520-dp-layer-enable-v1-1-c9b481209115@amd.com>
 <20240522153151.GB9789@pendragon.ideasonboard.com>
 <MW4PR12MB71654EE394DFEBE7325E6DC1E6EB2@MW4PR12MB7165.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MW4PR12MB71654EE394DFEBE7325E6DC1E6EB2@MW4PR12MB7165.namprd12.prod.outlook.com>
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

On Wed, May 22, 2024 at 05:52:56PM +0000, Klymenko, Anatoliy wrote:
> On Wednesday, May 22, 2024 8:32 AM, Laurent Pinchart wrote:
> > On Mon, May 20, 2024 at 08:22:31PM -0700, Anatoliy Klymenko wrote:
> > > Unconditionally enable the DPSUB layer in the corresponding atomic plane
> > > update callback. Setting the new display mode may require disabling and
> > > re-enabling the CRTC. This effectively resets DPSUB to the default state
> > > with all layers disabled.
> > 
> > Ah, I went through the code and I see that. Oops.
> > 
> > > The original implementation of the plane atomic
> > > update enables the corresponding DPSUB layer only if the framebuffer
> > > format has changed. This would leave the layer disabled after switching to
> > > a different display mode with the same framebuffer format.
> > 
> > Do we need a Fixes: tag or has this issue been there since the beginning
> > ?
> 
> Yes, this was introduced in the initial driver commit.
> 
> > > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > > ---
> > >  drivers/gpu/drm/xlnx/zynqmp_kms.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > > index 43bf416b33d5..c4f038e34814 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> > > @@ -120,9 +120,8 @@ static void
> > zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
> > >               zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
> > >                                                  plane->state->alpha >> 8);
> > >
> > > -     /* Enable or re-enable the plane if the format has changed. */
> > > -     if (format_changed)
> > > -             zynqmp_disp_layer_enable(layer);
> > > +     /* Enable or re-enable the plane. */
> > > +     zynqmp_disp_layer_enable(layer);
> > 
> > This should be safe for now, as the function will just write the plane
> > registers with identical values. The waste of CPU cycles may not be a
> > big issue, even if it would be best to avoid it.
> 
> The CPU time wasted on doubling down layer enablement is neglectable
> compared to DP link training time.

Good point.

> > What bothers me more is that we may be working around a larger
> > problem.
> > Resetting the CRTC when disabling it affects the hardware state of the
> > whole device, and thus the state of all software DRM objects. The
> > hardware and software states lose sync. Maybe this patch is all that is
> > needed for now, but other similar issues could pop up in the future.
> 
> I had similar thoughts about proper HW state tracking, but that would be
> rather large rework.
> 
> > Would it be possible, at atomic check time, to detect the objects whose
> > hardware state will need to be synced, and marked that in their state ?
> > Then in zynqmp_dpsub_plane_atomic_update() you could re-enable the
> > layer
> > based on that. You may need to subclass the drm_plane_state if there's
> > no field in that structure that is suitable to store the information.
> > The format_changed local variable would move there.
> 
> Thank you for the idea! I'll check it out.

If it ends up being overkill I think this patch is probably OK. A
comment to explain the reasoning in the code would be nice though.

> > >  }
> > >
> > >  static const struct drm_plane_helper_funcs
> > zynqmp_dpsub_plane_helper_funcs = {
> > >
> > > ---
> > > base-commit: 673087d8b023faf34b84e8faf63bbeea3da87bab
> > > change-id: 20240520-dp-layer-enable-7b561af29ca8

-- 
Regards,

Laurent Pinchart
