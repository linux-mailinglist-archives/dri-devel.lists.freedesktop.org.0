Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10514BF2A7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 08:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3A710E373;
	Tue, 22 Feb 2022 07:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33C110E499;
 Tue, 22 Feb 2022 07:34:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B4DB47F;
 Tue, 22 Feb 2022 08:34:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645515254;
 bh=y/9aPrKIRFwlsd6CuOj5N3H71w0Amt9wHmUp2r0x3fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sYQoHC20xhfKiT7aeDIF9wJY1yBBJD6ls7op04Fnrwk/tHxsiH8N1utGOXkk+TGmu
 kINbs6KY9VrxAqJJr+LxxS3CAEsEcUOFOOwnJEnk68RtSlDjDSoFnGf0LKPh21Glvd
 F7GFHzg4dQYQD7qFtroYyN0pjCESbhorcJBl6oBk=
Date: Tue, 22 Feb 2022 09:34:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Message-ID: <YhSR7CuSCJnHn0iD@pendragon.ideasonboard.com>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com>
 <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
 <CAA8EJpqr6MB64EAtLU3nBjgjx1COwn4auenCCw4kHB489VG0CA@mail.gmail.com>
 <d69038d6-a853-d2d9-81de-0ad10c4d6a3a@quicinc.com>
 <54fc4268-6418-817b-7cec-28a9dc9ba7b5@quicinc.com>
 <YgSbk11nQ6bd4SWK@pendragon.ideasonboard.com>
 <CAA8EJpqCgnLiQ7G+xY0E1j4PPbvPo+d-4vN+8-Nw84TWMSDmYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpqCgnLiQ7G+xY0E1j4PPbvPo+d-4vN+8-Nw84TWMSDmYA@mail.gmail.com>
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
Cc: Kandpal Suraj <suraj.kandpal@intel.com>, carsten.haitzler@arm.com,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Tue, Feb 22, 2022 at 06:32:50AM +0300, Dmitry Baryshkov wrote:
> On Thu, 10 Feb 2022 at 07:59, Laurent Pinchart wrote:
> > On Wed, Feb 09, 2022 at 05:40:29PM -0800, Abhinav Kumar wrote:
> > > Hi Laurent
> > >
> > > Gentle reminder on this.
> >
> > I won't have time before next week I'm afraid.
> 
> Laurent, another gentle ping.

I'm really late on this so I probably deserve a bit of a rougher ping,
but thanks for being gentle :-)

> > > On 2/6/2022 11:20 PM, Abhinav Kumar wrote:
> > > > On 2/6/2022 3:32 PM, Dmitry Baryshkov wrote:
> > > >> On Wed, 2 Feb 2022 at 16:26, Laurent Pinchart wrote:
> > > >>> On Wed, Feb 02, 2022 at 03:15:03PM +0200, Jani Nikula wrote:
> > > >>>> On Wed, 02 Feb 2022, Laurent Pinchart wrote:
> > > >>>>> On Wed, Feb 02, 2022 at 02:24:28PM +0530, Kandpal Suraj wrote:
> > > >>>>>> Changing rcar_du driver to accomadate the change of
> > > >>>>>> drm_writeback_connector.base and drm_writeback_connector.encoder
> > > >>>>>> to a pointer the reason for which is explained in the
> > > >>>>>> Patch(drm: add writeback pointers to drm_connector).
> > > >>>>>>
> > > >>>>>> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> > > >>>>>> ---
> > > >>>>>>   drivers/gpu/drm/rcar-du/rcar_du_crtc.h      | 2 ++
> > > >>>>>>   drivers/gpu/drm/rcar-du/rcar_du_writeback.c | 8 +++++---
> > > >>>>>>   2 files changed, 7 insertions(+), 3 deletions(-)
> > > >>>>>>
> > > >>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > > >>>>>> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > > >>>>>> index 66e8839db708..68f387a04502 100644
> > > >>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > > >>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> > > >>>>>> @@ -72,6 +72,8 @@ struct rcar_du_crtc {
> > > >>>>>>     const char *const *sources;
> > > >>>>>>     unsigned int sources_count;
> > > >>>>>>
> > > >>>>>> +  struct drm_connector connector;
> > > >>>>>> +  struct drm_encoder encoder;
> > > >>>>>
> > > >>>>> Those fields are, at best, poorly named. Furthermore, there's no need in
> > > >>>>> this driver or in other drivers using drm_writeback_connector to create
> > > >>>>> an encoder or connector manually. Let's not polute all drivers because
> > > >>>>> i915 doesn't have its abstractions right.
> > > >>>>
> > > >>>> i915 uses the quite common model for struct inheritance:
> > > >>>>
> > > >>>>        struct intel_connector {
> > > >>>>                struct drm_connector base;
> > > >>>>                /* ... */
> > > >>>>        }
> > > >>>>
> > > >>>> Same with at least amd, ast, fsl-dcu, hisilicon, mga200, msm, nouveau,
> > > >>>> radeon, tilcdc, and vboxvideo.
> > > >>>>
> > > >>>> We could argue about the relative merits of that abstraction, but I
> > > >>>> think the bottom line is that it's popular and the drivers using it are
> > > >>>> not going to be persuaded to move away from it.
> > > >>>
> > > >>> Nobody said inheritance is bad.
> > > >>>
> > > >>>> It's no coincidence that the drivers who've implemented writeback so far
> > > >>>> (komeda, mali, rcar-du, vc4, and vkms) do not use the abstraction,
> > > >>>> because the drm_writeback_connector midlayer does, forcing the issue.
> > > >>>
> > > >>> Are you sure it's not a coincidence ? :-)
> > > >>>
> > > >>> The encoder and especially connector created by drm_writeback_connector
> > > >>> are there only because KMS requires a drm_encoder and a drm_connector to
> > > >>> be exposed to userspace (and I could argue that using a connector for
> > > >>> writeback is a hack, but that won't change). The connector is "virtual",
> > > >>> I still fail to see why i915 or any other driver would need to wrap it
> > > >>> into something else. The whole point of the drm_writeback_connector
> > > >>> abstraction is that drivers do not have to manage the writeback
> > > >>> drm_connector manually, they shouldn't touch it at all.
> > > >>
> > > >> Laurent, I wanted to shift a bit from the question of drm_connector to
> > > >> the question of drm_encoder being embedded in the drm_writeback_connector.
> > > >> In case of the msm driver the drm_encoder is not a lightweight entity,
> > > >> but a full-featured driver part. Significant part of it can be shared
> > > >> with the writeback implementation, if we allow using a pointer to the
> > > >> external drm_encoder with the drm_writeback_connector.
> > > >> Does the following patch set stand a chance to receive your ack?
> > > >>   - Switch drm_writeback_connector to point to drm_encoder rather than
> > > >> embedding it?
> > > >>   - Create drm_encoder for the drm_writeback_connector when one is not
> > > >> specified, so the current drivers can be left unchanged.

The situation is a bit different for the encoder indeed.

The encoder concept is loosely defined nowadays, with more and more of
the "real" encoders being implemented as a drm_bridge. That's what I
usually recommend when reviewing new drivers. drm_encoder is slowly
becoming an empty shell (see for instance [1]), although that transition
is not enforced globally and will thus take a long time to complete (if
ever).

This being said, lots of drivers have "featureful" encoder
implementations, and that won't go away any time soon. In those cases, I
could be OK with drivers optionally passing an encoder fo the writeback
helper if the hardware really shares resources between writeback and a
real encoder. I would however be careful there, as in many cases I would
expect the need to pass a custom encoder to originate from an old
software design decision rather than from the hardware architecture. In
those cases it would be best, I think, to move towards cleaning up the
software architecture, but that can be done step by step and I won't
consider that a requirement to implement writeback support.

In the MSM case in particular, can you explain what resources are shared
between writeback and hardware encoder(s) ?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/rcar-du/rcar_du_encoder.c

> > > > I second Dmitry's request here. For the reasons he has mentioned along
> > > > with the possibility of the writeback encoder being shared across
> > > > display pipelines, strengthens our request of the drm encoder being a
> > > > pointer inside the drm_writeback_connector instead of embedding it.
> > > >
> > > > Like I had shown in my RFC, in case the other drivers dont specify one,
> > > > we can allocate one:
> > > >
> > > > https://patchwork.kernel.org/project/dri-devel/patch/1642732195-25349-1-git-send-email-quic_abhinavk@quicinc.com/
> > > >
> > > > We think this should be a reasonable accomodation to the existing
> > > > drm_writeback driver.
> > > >
> > > >>>> So I think drm_writeback_connector should *not* use the inheritance
> > > >>>> abstraction because it's a midlayer that should leave that option tothe
> > > >>>> drivers. I think drm_writeback_connector needs to be changed to
> > > >>>> accommodate that, and, unfortunately, it means current writeback users
> > > >>>> need to be changed as well.
> > > >>>>
> > > >>>> I am not sure, however, if the series at hand is the right
> > > >>>> approach. Perhaps writeback can be modified to allocate the stuff for
> > > >>>> you if you prefer it that way, as long as the drm_connector is not
> > > >>>> embedded in struct drm_writeback_connector.
> > > >>>>
> > > >>>>> Nack.
> > > >>>>>
> > > >>>>>>     struct drm_writeback_connector writeback;
> > > >>>>>>   };
> > > >>>>>>
> > > >>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > > >>>>>> index c79d1259e49b..5b1e83380c47 100644
> > > >>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > > >>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> > > >>>>>> @@ -200,8 +200,10 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
> > > >>>>>>   {
> > > >>>>>>     struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
> > > >>>>>>
> > > >>>>>> -  wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> > > >>>>>> -  drm_connector_helper_add(&wb_conn->base,
> > > >>>>>> +  wb_conn->base = &rcrtc->connector;
> > > >>>>>> +  wb_conn->encoder = &rcrtc->encoder;
> > > >>>>>> +  wb_conn->encoder->possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
> > > >>>>>> +  drm_connector_helper_add(wb_conn->base,
> > > >>>>>>                              &rcar_du_wb_conn_helper_funcs);
> > > >>>>>>
> > > >>>>>>     return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
> > > >>>>>> @@ -220,7 +222,7 @@ void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
> > > >>>>>>     struct drm_framebuffer *fb;
> > > >>>>>>     unsigned int i;
> > > >>>>>>
> > > >>>>>> -  state = rcrtc->writeback.base.state;
> > > >>>>>> +  state = rcrtc->writeback.base->state;
> > > >>>>>>     if (!state || !state->writeback_job)
> > > >>>>>>             return;
> > > >>>>>>

-- 
Regards,

Laurent Pinchart
