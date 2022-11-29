Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF1B63BDEE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 11:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59BE10E3A2;
	Tue, 29 Nov 2022 10:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1710E07B;
 Tue, 29 Nov 2022 10:25:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9503C4DA;
 Tue, 29 Nov 2022 11:25:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669717507;
 bh=om7r0sduDJqSW0WtlP69E0nQOrIR73cGRiFJsSrIhRc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ik5F7vRSd2MPAeA6CjMVV7FCaI6zgCIzg7fMty1DCCF2KxCbNJoWtOwqhZUxmZVSA
 BvV7wT0+1dJ0SNoC7vEPgPl9Swm/seOPaHDr/R1cgkR1J9I77y4yACzRPK1rJJqixg
 gzMvVBQAsDj1w1ldDkaDBNKiC0FOpo/3F8eXZPuM=
Date: Tue, 29 Nov 2022 12:24:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC 0/2] drm/connector: connector iterator with filtering
Message-ID: <Y4Xd85DUzrijeyXW@pendragon.ideasonboard.com>
References: <cover.1664966047.git.jani.nikula@intel.com>
 <7af346ec-8473-2a37-0fb4-220a42529a1e@amd.com>
 <87iliy3y7q.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87iliy3y7q.fsf@intel.com>
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
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

On Tue, Nov 29, 2022 at 11:29:45AM +0200, Jani Nikula wrote:
> On Fri, 25 Nov 2022, Harry Wentland <harry.wentland@amd.com> wrote:
> > On 10/5/22 06:51, Jani Nikula wrote:
> >> Currently i915 assumes all drm_connectors it encounters are embedded in
> >> intel_connectors that i915 allocated. The drm_writeback_connector forces
> >> a design where this is not the case; we can't provide our own connector,
> >> and writeback embeds the drm_connector it initializes itself.
> >> 
> >> To use drm writeback, none of the i915 connector iteration could assume
> >> the drm connector is embedded in intel_connector. Checking this is
> >> tedious, and would require an intermediate step with
> >> drm_connector. Here's an idea I came up with; filtering at the drm
> >> connector iterator level with a caller supplied function. Not too much
> >> code, and could be used for other things as well.
> >> 
> >
> > We've been trying to hook up drm_writeback_connector in amdgpu and
> > this would be really helpful. I've had to do liberal sprinkling
> > of "!= DRM_MODE_CONNECTOR_WRITEBACK" all over the place.
> >
> >> Mind you, we'd still much rather modify drm writeback to allow passing
> >> the connector i915 allocated, instead of the current midlayer design
> >> that forces drivers to a certain model. Working around this is a bunch
> >> of error prone and tedious code that we really could do without.
> >
> > I think this would be even better but also be much more work and impact
> > every driver that implements writeback. FWIW, there was no way for me
> > to add writeback connector handling without KASAN. Interpreting the
> > connector wrong in one place leads to memory corruption and
> > undefined behavior and is almost impossible to spot without KASAN.
> 
> Laurent, I once again plead - could we please reconsider this and give
> drivers the option to allocate and provide the drm_connector to
> writeback themselves?
> 
> All things considered I think that would be the safer option.

I do think all this stems from the decision of using connectors for
writeback, and we're paying the price for it now. It's painful in
drivers, and that's why I would prefer hiding it from drivers and
handling it completely in the DRM core. Ideally the connector
enumeration API exposed to drivers should not even enumerate the
writeback connectors by default.

I'm just a contributor to the subsystem, so I don't make the call. If
there's a general consensus it's better to require all drivers to handle
writeback connectors explicitly everywhere (Daniel and Dave may want to
chime in here), I can be overruled, like anybody else.

> > This series is
> > Acked-by: Harry Wentland <harry.wentland@amd.com>
> >
> >> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> >> Cc: Dave Airlie <airlied@gmail.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> >> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> 
> >> Jani Nikula (2):
> >>   drm/connector: add connector list iteration with filtering
> >>   drm/i915: iterate intel_connectors only
> >> 
> >>  drivers/gpu/drm/drm_connector.c               | 57 +++++++++++++++----
> >>  drivers/gpu/drm/i915/display/intel_display.c  |  3 +-
> >>  .../drm/i915/display/intel_display_types.h    |  7 +++
> >>  drivers/gpu/drm/i915/display/intel_dp.c       |  6 +-
> >>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
> >>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  3 +-
> >>  drivers/gpu/drm/i915/display/intel_hotplug.c  | 12 ++--
> >>  .../drm/i915/display/intel_modeset_setup.c    |  6 +-
> >>  drivers/gpu/drm/i915/display/intel_opregion.c |  9 ++-
> >>  include/drm/drm_connector.h                   |  9 +++
> >>  10 files changed, 89 insertions(+), 26 deletions(-)

-- 
Regards,

Laurent Pinchart
