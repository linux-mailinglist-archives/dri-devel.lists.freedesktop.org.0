Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190940FE56
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 19:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF536E030;
	Fri, 17 Sep 2021 17:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931086E02E;
 Fri, 17 Sep 2021 17:04:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="219649201"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="219649201"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 10:04:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="517194610"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 17 Sep 2021 10:04:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 20:04:26 +0300
Date: Fri, 17 Sep 2021 20:04:26 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude <lyude@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Mario Limonciello <mario.limonciello@outlook.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 Marco Trevisan <marco.trevisan@canonical.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
Message-ID: <YUTKmkCZ4RE095Ys@intel.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com>
 <YUNKh9xcIGoi1eol@intel.com>
 <1239f5f3-fd02-4eed-f464-e92c0afbb620@redhat.com>
 <YUTBb05YNayO3yOg@intel.com>
 <686d5177-3bf9-ddb0-5e55-a2e9969f36f7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <686d5177-3bf9-ddb0-5e55-a2e9969f36f7@redhat.com>
X-Patchwork-Hint: comment
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

On Fri, Sep 17, 2021 at 06:42:04PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/17/21 6:25 PM, Ville Syrjälä wrote:
> > On Fri, Sep 17, 2021 at 04:37:14PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 9/16/21 3:45 PM, Ville Syrjälä wrote:
> >>> On Mon, Sep 06, 2021 at 09:35:19AM +0200, Hans de Goede wrote:
> >>>> Add support for eDP panels with a built-in privacy screen using the
> >>>> new drm_privacy_screen class.
> >>>>
> >>>> One thing which stands out here is the addition of these 2 lines to
> >>>> intel_atomic_commit_tail:
> >>>>
> >>>> 	for_each_new_connector_in_state(&state->base, connector, ...
> >>>> 		drm_connector_update_privacy_screen(connector, state);
> >>>>
> >>>> It may seem more logical to instead take care of updating the
> >>>> privacy-screen state by marking the crtc as needing a modeset and then
> >>>> do this in both the encoder update_pipe (for fast-sets) and enable
> >>>> (for full modesets) callbacks. But ATM these callbacks only get passed
> >>>> the new connector_state and these callbacks are all called after
> >>>> drm_atomic_helper_swap_state() at which point there is no way to get
> >>>> the old state from the new state.
> >>>
> >>> Pretty sure the full atomic state is plumbed all the way
> >>> down these days.
> >>
> >> Including the old state? AFAICT the old-state is being thrown away
> >> from drm_atomic_helper_swap_state(),
> > 
> > No. That's just when those annoying foo_state->state pointers get
> > clobbered. We've been moving away from using those and just
> > plumbing the entire atomic state everywhere.
> > 
> > Nothing actually gets freed until the whole drm_atomic_state gets
> > nuked after the commit is done.
> > 
> >> so if we do this in a different
> >> place then we don't have access to the old-state.
> >>
> >>
> >>>
> >>>>
> >>>> Without access to the old state, we do not know if the sw_state of
> >>>> the privacy-screen has changes so we would need to call
> >>>> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
> >>>> since all current known privacy-screen providers use ACPI calls which
> >>>> are somewhat expensive to make.
> >>>
> >>> I doubt anyone is going to care about a bit of overhead for a modeset.
> >>
> >> But this is not a modeset, this is more like changing the backlight brightness,
> >> atm the code does not set the needs_modeset when only the privacy-screen
> >> sw-state has changed.
> >>
> >> Also in my experience the firmware (AML) code which we end up calling
> >> for this is not the highest quality code, often it has interesting
> >> issues / unhandled corner cases. So in my experience with ACPI we
> >> really should try to avoid these calls unless we absolutely must make them,
> >> but I guess not making unnecessary calls is something which could be handled
> >> inside the actual privacy-screen driver instead.
> >>
> >>> The usual rule is that a modeset doesn't skip anything. That way we
> >>> can be 100% sure we remeber to update everythinbg. For fastsets I guess
> >>> one could argue skipping it if not needed, but not sure even that is
> >>> warranted.
> >>
> >> Right, but again this is not a full modeset.
> > 
> > In general fastset is is just an optimized modeset. Userspace asked
> > for a modeset, but we noticed it doesn't need it. I don't think
> > there is a particular expectation that it's super fast.
> > 
> > But if this is really annoyingly slow in some actual usecase
> 
> Yeah these acpi-calls might take like a 100 ms easily, so
> we really want to avoid it if it is not necessary.
> 
> > then
> > one way to avoid that need to compare against the old state is just
> > introduce another foo_changed flag.
> 
> Ok, so I have the feeling that you have an idea of how you think this
> should be done / how this code should look instead of what I have
> currently.
> 
> Can you perhaps provide a rough sketch / description of how you
> think this should be done (instead of the current implementation) ?
> 
> Should I do the update from the the encoder update_pipe (for fast-sets)
> and enable (for full modesets) callbacks instead as I mention in
> the commit message ?
> 
> And since I still only want to do the call if there is an actual
> change, where could I best do the old / new sw_state change cmp to
> set the new foo_changed flag?
>

I guess it could be just something like this:

intel_digital_connector_duplicate_state()
{
	foo_changed = false;
}

intel_digital_connector_atomic_check()
{
	if (old_foo != new_foo) {
		mode_changed = true;
		foo_changed = true;
	}
}

update_pipe()
{
	if (foo_changed)
		update_foo();
}

-- 
Ville Syrjälä
Intel
