Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430B6D01E58
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1C10E6CF;
	Thu,  8 Jan 2026 09:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fLWtefTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02E910E6CC;
 Thu,  8 Jan 2026 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767865498; x=1799401498;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=My9ve60U7r5pxDU002QmNDBMr9ZqZr5q2SgiIYPyB84=;
 b=fLWtefTO8p859+1DBXr4ShAIWhvxLmqxyu3Aa4T6IKCUaXT7jUkK3Ztj
 DECzAZ+UtxoK7IUpnOVbGYQa8v7dC0U79BG7K5alnlh0R24v6pjYrcGli
 NkVfcuOkrZRJyAhqWBE/TczzRNaCpv2x9YZmi57GsHr94v6308qfug5vD
 snDXOe0Vv0Syf8yLxK61gcSXan5IxVCBgfynRLCro7WVe3Ww5dA614zWu
 VDOwHcrfAGFVnTj5upfrTTqDrXVN3y5pmgTuj0JqeHwzk4dWm1VyE+ktR
 jpp1zMMOtWkdQGwjyBjWHhLMLUWRfYEZGcgrdof+2hCaTgBL2hxFAN60r w==;
X-CSE-ConnectionGUID: m3kfqCuuQ9OIlF0odl6wqQ==
X-CSE-MsgGUID: 081w9xQbRL6wPt7GAf4Xnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72876481"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="72876481"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:44:58 -0800
X-CSE-ConnectionGUID: eYcbpmrKTtqNr4xWgzpfQQ==
X-CSE-MsgGUID: FJ9aEXqjQiuKiwWHO+UZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208231933"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 01:44:52 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
Date: Thu, 08 Jan 2026 15:13:21 +0530
Message-Id: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADp8X2kC/x2MQQrCMBAAv1L27EqSbqzxJAg+wGvpIU03NmBTS
 YoopX839DjDMCtkToEzXKoVEn9CDnMsUB8qcKONT8YwFAYllJZCCrT5Fx167oUxUhGJHkr7Tuz
 Dd/+00D7utw66on2aJ1zGxHafNFaTIqvRnmtCcs6hEcTIThtupNcDn64hLvw6unmCbfsDRkOw6
 58AAAA=
X-Change-ID: 20251010-async-feb09912440b
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

struct drm_crtc_state {
         /**
          * @async_flip:
          *
          * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
          * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
itself yet.
          */
         bool async_flip;

In the existing code the flag async_flip was intended for the legacy
PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
As per the hardware feature is concerned, async flip is a plane feature
and is to be treated per plane basis and not per pipe basis.
For a given hardware pipe, among the multiple hardware planes, one can
go with sync flip and other 2/3 can go with async flip.
Tearing affect will be noticed with this and if any policy should be
taken care by the user space. KMD not to include any policy
as to allow async on only one plane for a given pipe as all policy done
in user and KMD exposes what is supported by the hardware.

There would be a bunch of changes to correct this in the atomic path.
Add a new async_flip plane property to allow user enable async flip on
the required plane.
Any restriction checks for async_flip will be taken in atomic_check()
and not in the atomic_ioctl().
Let the preset code reside as is even in the atomic patch until all the
existing drivers and user space implementations move to plane property
for async flips.
Changes include removal of the checks we have in atomic path so as to
reject any changes(different plane, pipe, connector) along with async
flip. This would be replaced with checks so as to reject any change in
that particular plane where async is enabled(reject any change in
pipe/connector as that would have impact on this plane)

With the above changes, the challenge that we have presently so as to
enable async flip on overlays which is handled seperately with if
condition in drm_atomic_uapi.c can be moved to driver specific
atomic_check code.

This series depicts the changes in the drm core and upon getting
feedback on this, driver specific changes for theis will be done in the
next revision on the same series.

Please let us know your opinion on this.

Note: The series is partially tested with the IGT so as to ensure the
existing implementation is not broken. Full feature testing is pending,
just opening the series as RFC so as to get comments so that I can
incorporate them.

Thanks and Regards,
Arun R Murthy
-------------

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (7):
      drm/atomic/plane: Add plane property for async flip
      drm/atomic/plane: create async flip property for plane
      drm/atomic: Re-route the async flip based on the flag
      drm/atomic: Move the plane property check for async flip to atomic_check
      drm/atomic: Allow planes with NULL fb along with async flip
      drm/atomic: flip_done signal for planes
      drm/i915/irq: Enable flip_done for each plane on async flip

 drivers/gpu/drm/drm_atomic.c                       | 122 ++++++++++++++++++++-
 drivers/gpu/drm/drm_atomic_helper.c                |   2 +
 drivers/gpu/drm/drm_atomic_uapi.c                  |  74 +++----------
 drivers/gpu/drm/drm_plane.c                        |  33 ++++++
 drivers/gpu/drm/i915/display/intel_display_irq.c   |  98 ++++++++++++++---
 drivers/gpu/drm/i915/display/skl_universal_plane.c |   2 +-
 include/drm/drm_plane.h                            |  19 ++++
 7 files changed, 277 insertions(+), 73 deletions(-)
---
base-commit: b3845fe8af5ec5c1d4b26e40ac6b4c7370e5fa35
change-id: 20251010-async-feb09912440b

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

