Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E09740DB9D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B856EDCF;
	Thu, 16 Sep 2021 13:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C106EDCE;
 Thu, 16 Sep 2021 13:45:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="220680151"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="220680151"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="509310365"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 16 Sep 2021 06:45:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Sep 2021 16:45:43 +0300
Date: Thu, 16 Sep 2021 16:45:43 +0300
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
Message-ID: <YUNKh9xcIGoi1eol@intel.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210906073519.4615-10-hdegoede@redhat.com>
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

On Mon, Sep 06, 2021 at 09:35:19AM +0200, Hans de Goede wrote:
> Add support for eDP panels with a built-in privacy screen using the
> new drm_privacy_screen class.
> 
> One thing which stands out here is the addition of these 2 lines to
> intel_atomic_commit_tail:
> 
> 	for_each_new_connector_in_state(&state->base, connector, ...
> 		drm_connector_update_privacy_screen(connector, state);
> 
> It may seem more logical to instead take care of updating the
> privacy-screen state by marking the crtc as needing a modeset and then
> do this in both the encoder update_pipe (for fast-sets) and enable
> (for full modesets) callbacks. But ATM these callbacks only get passed
> the new connector_state and these callbacks are all called after
> drm_atomic_helper_swap_state() at which point there is no way to get
> the old state from the new state.

Pretty sure the full atomic state is plumbed all the way
down these days.

> 
> Without access to the old state, we do not know if the sw_state of
> the privacy-screen has changes so we would need to call
> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
> since all current known privacy-screen providers use ACPI calls which
> are somewhat expensive to make.

I doubt anyone is going to care about a bit of overhead for a modeset.
The usual rule is that a modeset doesn't skip anything. That way we
can be 100% sure we remeber to update everythinbg. For fastsets I guess
one could argue skipping it if not needed, but not sure even that is
warranted.

The current code you have in there is cettainly 110% dodgy. Since the
sw_state is stored in the connector state I presume it's at least
trying to be an atomic property, which means you shouldn't go poking
at it after the swap_state ever. swap_state just swaps the pointers
which is all that you need. So at least that part should get nuked.
The immutable hw_state I guess should get updated when we program the
actual hw.

-- 
Ville Syrjälä
Intel
