Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C349460D6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AB010E18F;
	Fri,  2 Aug 2024 15:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="KTdpPPYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5340510E18F;
 Fri,  2 Aug 2024 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1722614018;
 bh=PBrL109z5VdLAGUbDeO0hq+c0EP3kHJOHBxinu53q3U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KTdpPPYxap8ckNqzIq08ty6wG5jdnERqXiCW5zQnZ8qDbOnAcl4I13efXh0x0RtTK
 Ktdi9/75HEWzpg/FiILRjbaKMYGrGPik4h0+MgFf62KKFEyBOdZNx0e2mv3Pf+L216
 r46CSyngPmHQOx3xgR97WpUJT64fvnpRuCHfbask=
Date: Fri, 2 Aug 2024 17:53:38 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>
Subject: Re: [PATCH v3 0/2] drm: minimum backlight overrides and
 implementation for amdgpu
Message-ID: <f1712049-fc88-46f6-83e2-31f9f50c7869@t-8ch.de>
References: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
 <87v80lwjcz.fsf@intel.com> <Zqqku_zS7CpPGbzW@phenom.ffwll.local>
 <1b4bfb81-339d-4582-873c-c720c82c8ba7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b4bfb81-339d-4582-873c-c720c82c8ba7@redhat.com>
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

Hi,

On 2024-08-01 10:52:55+0000, Hans de Goede wrote:
> On 7/31/24 10:55 PM, Daniel Vetter wrote:
> > On Wed, Jul 31, 2024 at 08:40:12PM +0300, Jani Nikula wrote:
> >> On Wed, 31 Jul 2024, Thomas Weißschuh <linux@weissschuh.net> wrote:
> >>> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> >>> is "12". This leads to a fairly bright minimum display backlight.
> >>>
> >>> Add a generic override helper for the user to override the settings
> >>> provided by the firmware through the kernel cmdline.
> >>> Also add amdgpu as a user of that helper.
> >>>
> >>> One solution would be a fixed firmware version, which was announced but
> >>> has no timeline.
> >>
> >> The flip side is that if we add this now, it pretty much has a timeline:
> >> We'll have to carry and support it forever.
> >>
> >> It's not a great prospect for something so specific. Not to mention that
> >> the limits are generally there for electrical minimums that should not
> >> be overridden. And before you know it, we'll have bug reports about
> >> flickering screens...
> > 
> > Yeah I think for this specific case where a fixed firmware is already
> > kinda promised, a quirk is the right fix. Otherwise we open up a can of
> > worms here ... so personally I like v2 a lot more.
> > -Sima
> 
> Ok, with both Jani and Sima preferring the quirk approach from v2,
> I withdraw my objection against v2. So lets go with that version.

Ack.

I want to note though, that there are enough other commandline
options that can mess things up.
An invalid video=MODELINE, custom ACPI tables, etc, so the fallout from the
new commandline variable doesn't seem too bad to me.

> Thomas, sorry about this.

No worries!

> I see that other then a remark from Jeff Johnson about a missing
> MODULE_DESCRIPTION() v2 does not have any reviews yet though.
> 
> So we will need to review that version now. Might be best for
> visibility of the patches in people's review queue to repost
> v2 as v4 with the MODULE_DESCRIPTION() fixed ?

I can do that.

> 
> >>> This helper does conflict with the mode override via the cmdline.
> >>> Only one can be specified.
> >>> IMO the mode override can be extended to also handle "min-brightness"
> >>> when that becomes necessary.
> >>>
> >>> ---
> >>> Changes in v3:
> >>> - Switch to cmdline override parameter
> >>> - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net
> >>>
> >>> Changes in v2:
> >>> - Introduce proper drm backlight quirk infrastructure
> >>> - Quirk by EDID and DMI instead of only DMI
> >>> - Limit quirk to only single Framework 13 matte panel
> >>> - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
> >>>
> >>> ---
> >>> Thomas Weißschuh (2):
> >>>       drm/connector: add drm_connector_get_cmdline_min_brightness_override()
> >>>       drm/amd/display: implement minimum brightness override
> >>>
> >>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++++
> >>>  drivers/gpu/drm/drm_connector.c                   | 34 +++++++++++++++++++++++
> >>>  include/drm/drm_connector.h                       |  2 ++
> >>>  3 files changed, 42 insertions(+)
> >>> ---
> >>> base-commit: 36821612eb3091a21f7f4a907b497064725080c3
> >>> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> >>>
> >>> Best regards,
> >>
> >> -- 
> >> Jani Nikula, Intel
> > 
> 
