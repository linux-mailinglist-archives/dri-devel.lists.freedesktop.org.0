Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08340FDD7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 18:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76FAB6EE57;
	Fri, 17 Sep 2021 16:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242F66EE52;
 Fri, 17 Sep 2021 16:25:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="202326849"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="202326849"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="434161293"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 17 Sep 2021 09:25:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 Sep 2021 19:25:19 +0300
Date: Fri, 17 Sep 2021 19:25:19 +0300
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
Message-ID: <YUTBb05YNayO3yOg@intel.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com>
 <YUNKh9xcIGoi1eol@intel.com>
 <1239f5f3-fd02-4eed-f464-e92c0afbb620@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1239f5f3-fd02-4eed-f464-e92c0afbb620@redhat.com>
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

On Fri, Sep 17, 2021 at 04:37:14PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/16/21 3:45 PM, Ville Syrjälä wrote:
> > On Mon, Sep 06, 2021 at 09:35:19AM +0200, Hans de Goede wrote:
> >> Add support for eDP panels with a built-in privacy screen using the
> >> new drm_privacy_screen class.
> >>
> >> One thing which stands out here is the addition of these 2 lines to
> >> intel_atomic_commit_tail:
> >>
> >> 	for_each_new_connector_in_state(&state->base, connector, ...
> >> 		drm_connector_update_privacy_screen(connector, state);
> >>
> >> It may seem more logical to instead take care of updating the
> >> privacy-screen state by marking the crtc as needing a modeset and then
> >> do this in both the encoder update_pipe (for fast-sets) and enable
> >> (for full modesets) callbacks. But ATM these callbacks only get passed
> >> the new connector_state and these callbacks are all called after
> >> drm_atomic_helper_swap_state() at which point there is no way to get
> >> the old state from the new state.
> > 
> > Pretty sure the full atomic state is plumbed all the way
> > down these days.
> 
> Including the old state? AFAICT the old-state is being thrown away
> from drm_atomic_helper_swap_state(),

No. That's just when those annoying foo_state->state pointers get
clobbered. We've been moving away from using those and just
plumbing the entire atomic state everywhere.

Nothing actually gets freed until the whole drm_atomic_state gets
nuked after the commit is done.

> so if we do this in a different
> place then we don't have access to the old-state.
> 
> 
> > 
> >>
> >> Without access to the old state, we do not know if the sw_state of
> >> the privacy-screen has changes so we would need to call
> >> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
> >> since all current known privacy-screen providers use ACPI calls which
> >> are somewhat expensive to make.
> > 
> > I doubt anyone is going to care about a bit of overhead for a modeset.
> 
> But this is not a modeset, this is more like changing the backlight brightness,
> atm the code does not set the needs_modeset when only the privacy-screen
> sw-state has changed.
> 
> Also in my experience the firmware (AML) code which we end up calling
> for this is not the highest quality code, often it has interesting
> issues / unhandled corner cases. So in my experience with ACPI we
> really should try to avoid these calls unless we absolutely must make them,
> but I guess not making unnecessary calls is something which could be handled
> inside the actual privacy-screen driver instead.
> 
> > The usual rule is that a modeset doesn't skip anything. That way we
> > can be 100% sure we remeber to update everythinbg. For fastsets I guess
> > one could argue skipping it if not needed, but not sure even that is
> > warranted.
> 
> Right, but again this is not a full modeset.

In general fastset is is just an optimized modeset. Userspace asked
for a modeset, but we noticed it doesn't need it. I don't think
there is a particular expectation that it's super fast.

But if this is really annoyingly slow in some actual usecase then
one way to avoid that need to compare against the old state is just
introduce another foo_changed flag.

> 
> > 
> > The current code you have in there is cettainly 110% dodgy. Since the
> > sw_state is stored in the connector state I presume it's at least
> > trying to be an atomic property, which means you shouldn't go poking
> > at it after the swap_state ever.
> 
> It is not being poked, it is only being read, also this is happening
> before swap_state.
> 
> Note I'm open for suggestions to handle this differently,
> including changing the drm_connector_update_privacy_screen()
> helper which currently relies on being passed the state before swap_state
> is called:
> 
> void drm_connector_update_privacy_screen(struct drm_connector *connector,
> 					 struct drm_atomic_state *state)
> {
> 	struct drm_connector_state *new_connector_state, *old_connector_state;
> 	int ret;
> 
> 	if (!connector->privacy_screen)
> 		return;
> 
> 	new_connector_state = drm_atomic_get_new_connector_state(state, connector);
> 	old_connector_state = drm_atomic_get_old_connector_state(state, connector);
> 
> 	if (new_connector_state->privacy_screen_sw_state ==
> 	    old_connector_state->privacy_screen_sw_state)
> 		return;
> 
> 	ret = drm_privacy_screen_set_sw_state(connector->privacy_screen,
> 				new_connector_state->privacy_screen_sw_state);
> 	if (ret) {
> 		drm_err(connector->dev, "Error updating privacy-screen sw_state\n");
> 		return;
> 	}
> 
> So if you have any suggestions how to do this differently, please let me know
> and I will take a shot at implementing those suggestions.

You cut the code too soon. Just after this you call the other
update_privacy_screen() thing which does poke at
connector->state->stuff AFAICS.

> 
> Please keep in mind that the drm_privacy_screen_set_sw_state() call also
> needs to happens when just the connector_state->privacy_screen_sw_state changes,
> which is not a reason to do a full modeset (iow needs_modeset maybe 0 during
> the commit)
> 
> Regards,
> 
> Hans
> 
> 

-- 
Ville Syrjälä
Intel
