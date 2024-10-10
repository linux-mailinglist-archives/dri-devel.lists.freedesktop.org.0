Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0B8997C94
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 07:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D570810E869;
	Thu, 10 Oct 2024 05:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="PniWuR6S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B419F10E869;
 Thu, 10 Oct 2024 05:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1728538989;
 bh=4cmlHmL1RfckZ1r9HT1RJDkP96vjRSxI23jRpNUZygA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PniWuR6SdZRQHy1ZUOfYp0Wm3YQXEpZTLwuQPFjUPCXWyEXVASoyZ9m+rvChIN/Ve
 bjqIS3xYlJabnMmNwdpZWR91C6JG9P5dkpjzL+cKnpeS+SDTeAzec/tVF2wiMrPUTJ
 7wfyBiOMoUXTmBM5+z5Zm5+6XsFtz02UJjwF/518=
Date: Thu, 10 Oct 2024 07:43:08 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Dustin Howett <dustin@howett.net>, linux-doc@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v6 2/4] drm/amd/display: Add support for minimum
 backlight quirk
Message-ID: <bf61e7f2-9324-495d-af68-4b38ec211eee@t-8ch.de>
References: <20240824-amdgpu-min-backlight-quirk-v6-0-1ed776a17fb3@weissschuh.net>
 <20240824-amdgpu-min-backlight-quirk-v6-2-1ed776a17fb3@weissschuh.net>
 <1396eead-b584-4b36-b9b2-18ef783cfdbf@amd.com>
 <9dfc1548-7e11-44c3-ba7d-4e5ff7965a66@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dfc1548-7e11-44c3-ba7d-4e5ff7965a66@amd.com>
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

On 2024-09-16 15:43:35-0400, Harry Wentland wrote:
> On 2024-08-26 12:57, Mario Limonciello wrote:
> > On 8/24/2024 13:33, Thomas Weißschuh wrote:
> >> Not all platforms provide the full range of PWM backlight capabilities
> >> supported by the hardware through ATIF.
> >> Use the generic drm panel minimum backlight quirk infrastructure to
> >> override the capabilities where necessary.
> >>
> >> Testing the backlight quirk together with the "panel_power_savings"
> >> sysfs file has not shown any negative impact.
> >> One quirk seems to be that 0% at panel_power_savings=0 seems to be
> >> slightly darker than at panel_power_savings=4.
> > 
> > Thanks; This is the kind of thing I was worried about.
> > 
> > Harry, Leo,
> > 
> > Is that expected?  I wonder if we need to internally turn off panel
> > power savings in display code when brightness falls a threshold (12
> > IIRC was the real "minimum" advertised in the table?).
> 
> How much darker? Is it bothersome?

Was this questions for meant for me?
To me personally it's absolutely not bothersome.
I probably wouldn't have noticed it if not explicitly looking for it.

> I wonder the FW and driver have different min backlight values now.
> 
> Leo, any thoughts?

Friendly ping.
