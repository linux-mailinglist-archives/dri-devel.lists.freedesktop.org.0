Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C74C6449
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D4D10E232;
	Mon, 28 Feb 2022 08:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567B710E215;
 Mon, 28 Feb 2022 08:03:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7030478;
 Mon, 28 Feb 2022 09:03:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646035420;
 bh=5iPsVVkV+UW1rtaXLUQ9WJIZjzFugp1+ZIHB3gAZH/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HvbFI+ywFr3p+aX7+bhCGkcaC4q+7rWP3Ry22x1zrX2RIxdur28jLXGwpwZWzaQXN
 q8DXqhdni/2XLowhQH2Fb2t3sSEQxziLlJAnv0IT638bFhMmj2xBxzlWFiBHcoZV+H
 A7DGfY9Vu0C2MlmVTW+KdgJuNla6MBD65IVeO0dM=
Date: Mon, 28 Feb 2022 10:03:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Message-ID: <YhyB0WmJDWVFO1se@pendragon.ideasonboard.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com>
 <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
 <87v8xxs2hz.fsf@intel.com>
 <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>,
 Carsten Haitzler <carsten.haitzler@arm.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Sat, Feb 26, 2022 at 10:27:59AM -0800, Rob Clark wrote:
> On Wed, Feb 2, 2022 at 7:41 AM Jani Nikula wrote:
> > On Wed, 02 Feb 2022, Laurent Pinchart wrote:
> > > On Wed, Feb 02, 2022 at 03:15:03PM +0200, Jani Nikula wrote:
> > >> On Wed, 02 Feb 2022, Laurent Pinchart wrote:
> > >> > On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
> > >> >> Changing rcar_du driver to accomadate the change of
> > >> >> drm_writeback_connector.base and drm_writeback_connector.encoder
> > >> >> to a pointer the reason for which is explained in the
> > >> >> Patch(drm: add writeback pointers to drm_connector).
> > >> >>
> > >> >> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> > >> >> ---
> > >> >>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
> > >> >>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
> > >> >>  2 files changed, 7 insertions(+), 3 deletions(-)
> > >> >>
> > >> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >> >> index 66e8839db708..68f387a04502 100644
> > >> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > >> >> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
> > >> >>   const char *const *sources;
> > >> >>   unsigned int sources_count;
> > >> >>
> > >> >> + struct drm_connector connector;
> > >> >> + struct drm_encoder encoder;
> > >> >
> > >> > Those fields are, at best, poorly named. Furthermore, there's no need in
> > >> > this driver or in other drivers using drm_writeback_connector to create
> > >> > an encoder or connector manually. Let's not polute all drivers because
> > >> > i915 doesn't have its abstractions right.
> > >>
> > >> i915 uses the quite common model for struct inheritance:
> > >>
> > >>      struct intel_connector {
> > >>              struct drm_connector base;
> > >>              /* ... */
> > >>      }
> > >>
> > >> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
> > >> radeon, tilcdc, and vboxvideo.
> > >>
> > >> We could argue about the relative merits of that abstraction, but I
> > >> think the bottom line is that it's popular and the drivers using it are
> > >> not going to be persuaded to move away from it.
> > >
> > > Nobody said inheritance is bad.
> > >
> > >> It's no coincidence that the drivers who've implemented writeback so far
> > >> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
> > >> because the drm_writeback_connector midlayer does, forcing the issue.
> > >
> > > Are you sure it's not a coincidence ? :-)
> > >
> > > The encoder and especially connector created by drm_writeback_connector
> > > are there only because KMS requires a drm_encoder and a drm_connector to
> > > be exposed to userspace (and I could argue that using a connector for
> > > writeback is a hack, but that won't change). The connector is "virtual",
> > > I still fail to see why i915 or any other driver would need to wrap it
> > > into something else. The whole point of the drm_writeback_connector
> > > abstraction is that drivers do not have to manage the writeback
> > > drm_connector manually, they shouldn't touch it at all.
> >
> > The thing is, drm_writeback_connector_init() calling
> > drm_connector_init() on the drm_connector embedded in
> > drm_writeback_connector leads to that connector being added to the
> > drm_device's list of connectors. Ditto for the encoder.
> >
> > All the driver code that handles drm_connectors would need to take into
> > account they might not be embedded in intel_connector. Throughout the
> > driver. Ditto for the encoders.
> 
> The assumption that a connector is embedded in intel_connector doesn't
> really play that well with how bridge and panel connectors work.. so
> in general this seems like a good thing to unwind.
> 
> But as a point of practicality, i915 is a large driver covering a lot
> of generations of hw with a lot of users.  So I can understand
> changing this design isn't something that can happen quickly or
> easily.  IMO we should allow i915 to create it's own connector for
> writeback, and just document clearly that this isn't the approach new
> drivers should take.  I mean, I understand idealism, but sometimes a
> dose of pragmatism is needed. :-)

i915 is big, but so is Intel. It's not fair to treat everybody else as a
second class citizen and let Intel get away without doing its homework.
I want to see this refactoring effort moving forward in i915 (and moving
to drm_bridge would then be a good idea too). If writeback support in
i915 urgent, then we can discuss *temporary* pragmatic stopgap measures,
but not without a real effort to fix the core issue.

> > The point is, you can't initialize a connector or an encoder for a
> > drm_device in isolation of the rest of the driver, even if it were
> > supposed to be hidden away.

-- 
Regards,

Laurent Pinchart
