Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3CB937FB8
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 09:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794D010E284;
	Sat, 20 Jul 2024 07:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="kJg5MZ5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A9810E284;
 Sat, 20 Jul 2024 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1721460720;
 bh=j8D9LxxW3RGeXN7riz6rioj2P80dApSUEADShyRgKK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJg5MZ5gt5ltmVfI8Zil/vtkJCLvM3fWhPPL6l+eZSxbV277gYD/MqdFVE6oxEO9f
 z1yn7Dvbu7ieqWBIFzQfwerOWx6vM24AIgnFV7obdu5g7j4I05m7QpDxRfxxiY8O1u
 8PW18BotTzpwjM40g+FJwjNRFmGl/Fg8yXDvP4po=
Date: Sat, 20 Jul 2024 09:31:37 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>
Subject: Re: [PATCH v2 0/3] drm: backlight quirk infrastructure and lower
 minimum for Framework AMD 13
Message-ID: <a050aad4-d195-42e6-8a84-02170a4f9835@t-8ch.de>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
 <e61010e4-cb49-44d6-8f0d-044a193d29b2@redhat.com>
 <51f68b3b-dd21-44ef-8ec8-05bea5db6e55@t-8ch.de>
 <6db5abf9-cbdd-4ec0-b669-5df23de6c2ad@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6db5abf9-cbdd-4ec0-b669-5df23de6c2ad@redhat.com>
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

Hi Hans,

On 2024-07-18 10:25:18+0000, Hans de Goede wrote:
> On 6/24/24 6:15 PM, Thomas Weißschuh wrote:
> > On 2024-06-24 11:11:40+0000, Hans de Goede wrote:
> >> On 6/23/24 10:51 AM, Thomas Weißschuh wrote:
> >>> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> >>> is "12". This leads to a fairly bright minimum display backlight.
> >>>
> >>> Add a generic quirk infrastructure for backlight configuration to
> >>> override the settings provided by the firmware.
> >>> Also add amdgpu as a user of that infrastructure and a quirk for the
> >>> Framework 13 matte panel.
> >>> Most likely this will also work for the glossy panel, but I can't test
> >>> that.
> >>>
> >>> One solution would be a fixed firmware version, but given that the
> >>> problem exists since the release of the hardware, it has been known for
> >>> a month that the hardware can go lower and there was no acknowledgment
> >>> from Framework in any way, I'd like to explore this alternative
> >>> way forward.
> >>
> >> There are many panels where the brightness can go lower then the advertised
> >> minimum brightness by the firmware (e.g. VBT for i915). For most users
> >> the minimum brightness is fine, especially since going lower often may lead
> >> to an unreadable screen when indoors (not in the full sun) during daylight
> >> hours. And some users get confused by the unreadable screen and find it
> >> hard to recover things from this state.
> > 
> > There are a fair amount of complaints on the Framework forums about this.
> > And that specific panel is actually readable even at 0% PWM.
> 
> If a lot of Framework users are complaining about this, then maybe Framework
> should fix their VBT in a BIOS update ?  That seems like a better solution
> then quirking this in the kernel.

Framework has now stated that they will update the VBT for their 13' device. [0]
It won't happen for the 16' one as its out of spec there, although it
has been reported to work.

<snip>

> > From my experience with ThinkPads, the default brightness range there
> > was fine for me. But on the Framework 13 AMD it is not.
> > 
> >> So rather then quirking this, with the above mentioned disadvantages I believe
> >> that it would be better to extend the existing video=eDP-1:.... kernel
> >> commandline parsing to allow overriding the minimum brightness in a driver
> >> agnostic way.
> > 
> > I'm not a fan. It seems much too complicated for most users.
> 
> Wanting lower minimum brightness really is mostly a power-user thing
> and what is the right value is somewhat subjective and this is an often
> heard complained. I really believe that the kernel should NOT get in
> the business of adding quirks for this. OTOH given that this is an often
> heard complaint having some generic mechanism to override the VBT value
> would be good to have.
> 
> As for this being too complicated, I fully agree that ideally things
> should just work 100% OOTB, which is why I believe that a firmware fix
> from Framework would be good. But when things do not work 100% adding
> a kernel cmdline option is something which is regularly asked from users /
> found in support questions on fora so I don't think this is overly
> complicated. I agree it is not ideal but IMHO it is workable.
> 
> E.g. on Fedora it would simply be a question of users having to run:
> 
> sudo grubby --update-kernel=ALL --args="video=eDP-1:min-brightness=1"
> 
> will add the passed in argument to all currently installed (and
> future) kernels.

Thanks for taking the time for your explanations.
I came around to agree with your proposal for a cmdline override.

What to you think about:

void drm_connector_get_cmdline_backlight_overrides(struct drm_connector *connector,
						   struct drm_backlight_override *overrides);

struct drm_backlight_override would look like
struct drm_panel_backlight_quirk from this patch.

> > Some more background to the Framework 13 AMD case:
> > The same panel on the Intel variant already goes darker.
> > The last responses we got from Framework didn't indicate that the high
> > minimum brightness was intentional [0], [1].
> > Coincidentally the "12" returned from ATIF matches
> > AMDGPU_DM_DEFAULT_MIN_BACKLIGHT, so maybe the firmware is just not set
> > up completely.
> 
> Right, so I think this should be investigated closer and then get
> framework to issue a BIOS fix, not add a quirk mechanism to the kernel.
> 
> IIRC the amdgpu driver will use AMDGPU_DM_DEFAULT_MIN_BACKLIGHT when
> that setting is 0 in the VBT.

This is not my reading of the code.
To me it seems "0" will be accepted, which is also why the second "fix"
from [1] works.

> >> The minimum brightness override set this way will still need hooking up
> >> in each driver separately but by using the video=eDP-1:... mechanism
> >> we can document how to do this in driver independent manner. since
> >> I know there have been multiple requests for something like this in
> >> the past I believe that having a single uniform way for users to do this
> >> will be good.
> >>
> >> Alternatively we could have each driver have a driver specific module-
> >> parameter for this. Either way I think we need some way for users to
> >> override this as a config/setting tweak rather then use quirks for this.
> > 
> > This also seems much too complicated for normal users.
> 
> I agree that having a uniform way is better then having per driver
> module options.

Ack.

[0] https://community.frame.work/t/responded-amd-framework-minimum-brightness-too-high-now-with-measurements/47036/12
[1] https://community.frame.work/t/resolved-even-lower-screen-brightness/25711/42
