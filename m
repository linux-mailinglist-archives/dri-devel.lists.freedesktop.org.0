Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B1BEAB0C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 18:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C5E10EC76;
	Fri, 17 Oct 2025 16:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="Gfk5dmlR";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="5M09VXGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399D210EC79;
 Fri, 17 Oct 2025 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718477; bh=TISoBNwEXTy+2dwSC0N2Ya5
 Q1DPGHIdmijcD806QkPc=; b=Gfk5dmlR2UvzChTy9lgkesT5yQfzvJf/nYFNUMdE3M5DVMr1cT
 0y0JAdLq4H46eQN0UfO8SYBsrY3XvUDef+hAHWpoAv13jPMQmkdgxrn/nzUYH870+GRNMzcnmXD
 H42s2SfexpchXRA8Fpnx7OpLJWrwFd84GHDxx8RxWAOi6qOuqo1XZoJe6fqgU+pefkFwOM/T6oT
 6oFWFzN+GrOJXEyQRcEAmeswDqMjpHIjyAb4wkKpDCTgkBHLpjuXO1sg6ukJ87hoy2wnIfwdqhM
 Ucd4kBq+jsZtwmu0kX7cwaKHF6iliPX06hPP2qyF4asPaOhEQza+H9L1h8v/IOX14PQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1760718477; bh=TISoBNwEXTy+2dwSC0N2Ya5
 Q1DPGHIdmijcD806QkPc=; b=5M09VXGp4u3s0GzWxgdA1v4amtDjSXrUBgBNoieyfkVTD6WP4U
 8XYLPECocfu/xHk9NuauGXloB6iOiGCMZRDw==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lach <iam@lach.pw>
Subject: [PATCH v5 0/7] DisplayID DSC passthrough timing support
Date: Fri, 17 Oct 2025 18:27:29 +0200
Message-ID: <20251017162736.45368-1-iam@lach.pw>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Lach <iam@lach.pw>

VESA DisplayID spec allows the device to force its DSC bits per pixel
value.

For example, the HTC Vive Pro 2 VR headset uses this value in
high-resolution modes (3680x1836@90-120, 4896x2448@90-120), and when the
kernel doesn't respect this parameter, garbage is displayed on the HMD
instead.

Me and other users have successfully tested the old (v3) version of this
patch (which was applying DSC BPP value unconditionally, thus incorrect:
https://lkml.org/lkml/2023/2/26/116) on Vive Pro 2 and
Bigscreen Beyond VR headsets, and have been using it daily, it is known
to work and doesn't seem to break anything else since 2022.

Previously, I didn't have enough dedication to get it merged, I hope
this time I will manage to get it to v6.19 :D

Regarding driver support - I have looked at amdgpu and Nvidia's
open-gpu-kernel-modules, and both seem to have some indication for this
value; however, in Linux, it is unused in both.

First patch implements parsing of DSC BPP values and display mode VII
timings flag which mandates that the DSC BPP value should actually be
used for this display mode.

The second patch implements handling of this value for AMDGPU driver.

The only thing that I don't like in the current implementation, is how
the value of `dsc_passthrough_timings_support` flag is propagated from
the connector display modes to the mode created in `DRM_IOCTL_MODE_SETCRTC`
handler (which is used for VR display initialization in Monado and
StreamVR), it feels like this flag should be initialized by the kernel
itself, but as far as I can see there is no correct way to do this, as
the timing constraints calculation belongs to the individual drivers.

Another problem with how this flag is set, is that there is no hard
connection between modes creaded in `SETCRTC` and the modes actually
defined by connector, so I implement an assumption that this flag should
be the same between choosen mode and the preferred display mode. Given
that previously due to the missing support for this flag displays
were only showing garbage, I believe this assumption won't break
anything.

Both of those downsides are due to the fact my understanding of DRM
subsystem is not that high. If another implementation would be proposed
by AMDGPU maintainers - I will gladly implement it here.

v4->v5:
 * The patch was split into multiple
 * Disabled MSO parsing for eDP displays
 * Disabled MSO logs if not used
 * Passing of type VII timings block data
 * Minor codestyle changes: lines moved around, naming
v3->v4:
 * This patch now parses timings support flag on type VII block, instead
   of applying it unconditionally. Previously I didn't understand the
   spec properly.
 * Now it also is not being applied for non-supported and/or non-VII
   blocks in amdgpu driver.

Regards,

Lach

Yaroslav Bolyukin (7):
  drm/edid: rename VESA block parsing functions to more generic name
  drm/edid: prepare for VESA vendor-specific data block extension
  drm/edid: MSO should only be used for non-eDP displays
  drm/edid: parse DSC DPP passthru support flag for mode VII timings
  drm/edid: for consistency, use mask everywhere for block rev parsing
  drm/edid: parse DRM VESA dsc bpp target
  drm/amd: use fixed dsc bits-per-pixel from edid

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +++
 drivers/gpu/drm/drm_displayid_internal.h      |  11 ++
 drivers/gpu/drm/drm_edid.c                    | 101 +++++++++++-------
 include/drm/drm_connector.h                   |   6 ++
 include/drm/drm_modes.h                       |  10 ++
 5 files changed, 103 insertions(+), 37 deletions(-)

-- 
2.51.0
