Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B782C9B41D
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 12:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F52510E619;
	Tue,  2 Dec 2025 11:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=lach.pw header.i=@lach.pw header.b="oAXDX4df";
	dkim=permerror (0-bit key) header.d=lach.pw header.i=@lach.pw header.b="X+Vb5Fvs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260F410E619;
 Tue,  2 Dec 2025 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673362; bh=c9P0I4SdhdLrq8DRLE4q09F
 cD52IEtL4SOm8pEvJYYE=; b=oAXDX4dfG/jNfIqtryn/g7n3LNd+K8UCLOBze0xNpeDH0eEhmq
 9nw31c5hTH7AdDK3Y3qWBtnmBoxYiCojsynV4JBK7hLGfoJ+d5Uh4Z58DOX/1cfGMB5ukhk4IHj
 HwRnCnc3Y7PgaFATG+razsPWESg0qKjiosbf1a0tutUZy9zpMwv7DK3OSNFPqJ7ojWiaeWzRGe6
 3//AZG0Uxwh4dlErvtQuIyZNYGN49zpdDT+ETow/thoVC5BII/3SHyH8ZOo0rr70VuucK3+6nYt
 hy+nqIs02yHaSagR3jFUFKqTRtlZNEMVZoZFwMH5SkI5fn/Gue3RZFOn+prfA1pLEqw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=lach.pw; c=relaxed/relaxed;
 h=Message-ID:Date:Subject:To:From; t=1764673362; bh=c9P0I4SdhdLrq8DRLE4q09F
 cD52IEtL4SOm8pEvJYYE=; b=X+Vb5FvsqX+LZHZhPt1mUogBZQM014fFsPnBxnWW6xIn1upgXH
 jATrfGTDaoLD2kAIzM3kE3B6bmuVQp4dcSDA==;
From: Yaroslav Bolyukin <iam@lach.pw>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yaroslav Bolyukin <iam@lach.pw>
Subject: [PATCH v7 0/7] VESA DisplayID fixed DSC BPP value support
Date: Tue,  2 Dec 2025 12:02:11 +0100
Message-ID: <20251202110218.9212-1-iam@lach.pw>
X-Mailer: git-send-email 2.51.2
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
defined by connector, so the current implementation searches for the
resolution and refresh rate that match exactly declared to obtain
this flag value. This might not be correct, as device might not support
the other mode at all, but the situation won't be any worse for the
existing devices, as the currently they don't work at all, and there
is no other known devices on the market to check their assumption in
regard to this part of specs, and the spec does not describe how that
should work.

Both of those downsides are due to the fact my understanding of DRM
subsystem is not that high. If another implementation would be proposed
by AMDGPU maintainers - I will gladly implement it here.

v6->v7:
 * Print DSC bpp value in fixed point format instead of x16
 * MSO should only be enabled for eDP, not the other way round.
v5->v6:
 * amdgpu: only apply dsc bpp to modes that match exactly the declared
   modes with this flag set.
v4->v5:
 * The patch was split into multiple
 * Disabled MSO parsing for eDP displays
 * Disabled MSO logs if not used
 * Minor codestyle changes: lines moved around, naming, passing of
   function arguments
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

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  16 +++
 drivers/gpu/drm/drm_displayid_internal.h      |  11 ++
 drivers/gpu/drm/drm_edid.c                    | 102 +++++++++++-------
 include/drm/drm_connector.h                   |   6 ++
 include/drm/drm_modes.h                       |  10 ++
 5 files changed, 109 insertions(+), 36 deletions(-)

-- 
2.51.2
