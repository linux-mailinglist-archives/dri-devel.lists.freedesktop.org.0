Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5E95AD32
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE4710E1C2;
	Thu, 22 Aug 2024 06:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="T2gSVl0q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788DB10E1C2;
 Thu, 22 Aug 2024 06:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1724306995;
 bh=uueUoVe+leUByWNnKYxZraleqvuy4Xky+3tp+1IxLl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T2gSVl0qlJxWw6C6bKWcqgEBB2KZwVABZqLQiQCchvXTDd8670W8ZZuED8XY1Wbm0
 JQfqjQ1Xu0L0k7JJZl4Ic2nXwb/RIXZm7FHvAPi4SFf0FJb+H33nUhehk9kWw8dgFb
 yF8n7NBcTfbeKPHTe8W3Hz0ldt+paXTvqBZdFajA=
Date: Thu, 22 Aug 2024 08:09:55 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, 
 Kieran Levin <ktl@framework.net>, Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/4] drm: Minimum backlight overrides and
 implementation for amdgpu
Message-ID: <1dc9ac27-1447-435d-99d8-9c4cf5a42090@t-8ch.de>
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
 <4079b41e-9a5c-43be-9614-250b21d6e92d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4079b41e-9a5c-43be-9614-250b21d6e92d@amd.com>
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

Hi Mario,

(+ a question for Dustin inside)

On 2024-08-21 15:45:46+0000, Mario Limonciello wrote:
> On 8/18/2024 01:56, Thomas Weißschuh wrote:
> > The value of "min_input_signal" returned from ATIF on a Framework AMD 13
> > is "12". This leads to a fairly bright minimum display backlight.
> > 
> > Introduce a quirk to override "min_input_signal" to "0" which leads to a
> > much lower minimum brightness, which is still readable even in daylight.
> > 
> 
> Apologies for my delayed response, I've been OOO a while.

Welcome back!

> An earlier version of this series I had asked if this could be tested
> specifically with panel_power_savings enabled to ensure we're not causing a
> regression with such a low minimum and panel power savings turned up to the
> maximum.  If such a dependency does exist, I believe panel power savings
> will need to get an extra check introduced to disable it when the brightness
> falls below the previous threshold that was programmed by the firmware.
> 
> Did that ever get checked?

No, I forgot to check that. Sorry about that.
I'll check it for v6.
Dustin, maybe you could also test this on the other panels?

> > Tested on a Framework AMD 13 BIOS 3.05 and Framework AMD 16.
> > 
> 
> As far as I can tell this series doesn't apply any quirks to Framework 16.
> So by testing, do you mean that you tested that it didn't cause regressions
> (which it shouldn't; the panels don't match!).

This is a leftover from an earlier revision, which applied to all
Framework devices. I'll drop it.

> 
> > One solution would be a fixed firmware version, which was announced but
> > has no timeline. >
> > ---
> > Changes in v5:
> > - Forward-declare struct drm_edid
> > - Reorder patches, quirk entries are last
> > - Add patch from Dustin for additional quirk entries
> > - Link to v4: https://lore.kernel.org/r/20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net
> > 
> > Changes in v4:
> > - Switch back to v2 implementation
> > - Add MODULE_DESCRIPTION()
> > - Simplify quirk infrastructure to only handle min backlight quirks.
> >    It can be extended if necessary.
> > - Expand documentation.
> > - Link to v3: https://lore.kernel.org/r/20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net
> > 
> > Changes in v3:
> > - Switch to cmdline override parameter
> > - Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net
> > 
> > Changes in v2:
> > - Introduce proper drm backlight quirk infrastructure
> > - Quirk by EDID and DMI instead of only DMI
> > - Limit quirk to only single Framework 13 matte panel
> > - Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net
> > 
> > ---
> > Dustin L. Howett (1):
> >        drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels
> > 
> > Thomas Weißschuh (3):
> >        drm: Add panel backlight quirks
> >        drm/amd/display: Add support for minimum backlight quirk
> >        drm: panel-backlight-quirks: Add Framework 13 matte panel
> > 
> >   Documentation/gpu/drm-kms-helpers.rst             |  3 +
> >   drivers/gpu/drm/Kconfig                           |  4 +
> >   drivers/gpu/drm/Makefile                          |  1 +
> >   drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++
> >   drivers/gpu/drm/drm_panel_backlight_quirks.c      | 94 +++++++++++++++++++++++
> >   include/drm/drm_utils.h                           |  4 +
> >   7 files changed, 117 insertions(+)
> > ---
> > base-commit: c3f2d783a459980eafd24c5af94ccd56a615961f
> > change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
> > 
> > Best regards,
> 
