Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A16456EC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 10:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39C610E18E;
	Wed,  7 Dec 2022 09:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82C610E18E;
 Wed,  7 Dec 2022 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670406975; x=1701942975;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=z5SGokubgwB2mdYrqeTzZ3szWxPB6JgiSkXPMOelJd0=;
 b=JULKsB7p1fQdOxtvI6hIaaDkNlaQ8VWDYEUWuQ4agdbvOlBA5dJXEmfN
 W9ssf5GkCAnVhF/6uTRYJBjW9qVqeJg2ZfQ0u1qHF631+I/RolVDdH21m
 Z4/pFiX/THV/MhTAH8NcsgAIFhWV6juoYnDcuzlf9mQnO6RCA4AIEh3gr
 CjQd0Uq7luENbtG+qveB96d4LtqKPeXtVFQt+W0/MOIfHJAoFB1OWpIfv
 G6Q0Saw4U5/gP0WRHqFYDo2MeFFh61ANr0dObI2q24ZOEOt0BttxKrA1K
 vEchCSICQCDX3fx2QhATK4EwxrgC8znaIGP3OXfNaGejOQuUciuds44xh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="314499090"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="314499090"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 01:55:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="624242836"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="624242836"
Received: from fbackhou-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.36.192])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 01:55:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC 0/2] drm/connector: connector iterator with filtering
In-Reply-To: <Y4Xd85DUzrijeyXW@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1664966047.git.jani.nikula@intel.com>
 <7af346ec-8473-2a37-0fb4-220a42529a1e@amd.com> <87iliy3y7q.fsf@intel.com>
 <Y4Xd85DUzrijeyXW@pendragon.ideasonboard.com>
Date: Wed, 07 Dec 2022 11:55:42 +0200
Message-ID: <87o7sf1qsh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 29 Nov 2022, Laurent Pinchart <laurent.pinchart@ideasonboard.com> w=
rote:
> Hi Jani,
>
> On Tue, Nov 29, 2022 at 11:29:45AM +0200, Jani Nikula wrote:
>> On Fri, 25 Nov 2022, Harry Wentland <harry.wentland@amd.com> wrote:
>> > On 10/5/22 06:51, Jani Nikula wrote:
>> >> Currently i915 assumes all drm_connectors it encounters are embedded =
in
>> >> intel_connectors that i915 allocated. The drm_writeback_connector for=
ces
>> >> a design where this is not the case; we can't provide our own connect=
or,
>> >> and writeback embeds the drm_connector it initializes itself.
>> >>=20
>> >> To use drm writeback, none of the i915 connector iteration could assu=
me
>> >> the drm connector is embedded in intel_connector. Checking this is
>> >> tedious, and would require an intermediate step with
>> >> drm_connector. Here's an idea I came up with; filtering at the drm
>> >> connector iterator level with a caller supplied function. Not too much
>> >> code, and could be used for other things as well.
>> >>=20
>> >
>> > We've been trying to hook up drm_writeback_connector in amdgpu and
>> > this would be really helpful. I've had to do liberal sprinkling
>> > of "!=3D DRM_MODE_CONNECTOR_WRITEBACK" all over the place.
>> >
>> >> Mind you, we'd still much rather modify drm writeback to allow passing
>> >> the connector i915 allocated, instead of the current midlayer design
>> >> that forces drivers to a certain model. Working around this is a bunch
>> >> of error prone and tedious code that we really could do without.
>> >
>> > I think this would be even better but also be much more work and impact
>> > every driver that implements writeback. FWIW, there was no way for me
>> > to add writeback connector handling without KASAN. Interpreting the
>> > connector wrong in one place leads to memory corruption and
>> > undefined behavior and is almost impossible to spot without KASAN.
>>=20
>> Laurent, I once again plead - could we please reconsider this and give
>> drivers the option to allocate and provide the drm_connector to
>> writeback themselves?
>>=20
>> All things considered I think that would be the safer option.
>
> I do think all this stems from the decision of using connectors for
> writeback, and we're paying the price for it now. It's painful in
> drivers, and that's why I would prefer hiding it from drivers and
> handling it completely in the DRM core.

Unfortunately, the current abstraction leaks to drivers in a way that's
worse than just openly embracing the connector usage. :(

And we still have to provide the struct drm_connector_funcs pointer to
writeback just as well.

> Ideally the connector enumeration API exposed to drivers should not
> even enumerate the writeback connectors by default.
>
> I'm just a contributor to the subsystem, so I don't make the call. If
> there's a general consensus it's better to require all drivers to handle
> writeback connectors explicitly everywhere (Daniel and Dave may want to
> chime in here), I can be overruled, like anybody else.

Well, outside of i915 I'm just a contributor too, and I prefer trying to
find consensus between us rather than seeking maintainers to overrule
other contributors!

Frankly, we pretty much already agreed to do what you originally
suggested, even if we thought it was going to be a bunch of work, but
we, and seems like AMD too, are finding it to also be quite error
prone. It's just inherently clumsy to check the "sub class" type in C in
runtime, or to even be sure when such checks aren't required.


BR,
Jani.







>
>> > This series is
>> > Acked-by: Harry Wentland <harry.wentland@amd.com>
>> >
>> >> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> >> Cc: Dave Airlie <airlied@gmail.com>
>> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> >> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
>> >> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >>=20
>> >> Jani Nikula (2):
>> >>   drm/connector: add connector list iteration with filtering
>> >>   drm/i915: iterate intel_connectors only
>> >>=20
>> >>  drivers/gpu/drm/drm_connector.c               | 57 +++++++++++++++--=
--
>> >>  drivers/gpu/drm/i915/display/intel_display.c  |  3 +-
>> >>  .../drm/i915/display/intel_display_types.h    |  7 +++
>> >>  drivers/gpu/drm/i915/display/intel_dp.c       |  6 +-
>> >>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
>> >>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  3 +-
>> >>  drivers/gpu/drm/i915/display/intel_hotplug.c  | 12 ++--
>> >>  .../drm/i915/display/intel_modeset_setup.c    |  6 +-
>> >>  drivers/gpu/drm/i915/display/intel_opregion.c |  9 ++-
>> >>  include/drm/drm_connector.h                   |  9 +++
>> >>  10 files changed, 89 insertions(+), 26 deletions(-)

--=20
Jani Nikula, Intel Open Source Graphics Center
