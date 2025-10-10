Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6007BCC33C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 10:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07D710EB7A;
	Fri, 10 Oct 2025 08:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQ5kVZSd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5177410EB6E;
 Fri, 10 Oct 2025 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760085938; x=1791621938;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=SohDY5cwc10T63dC8Q72z4DHUGTlKWa/PMKYzT70vgQ=;
 b=NQ5kVZSdAVbZoZ5fVOGUkuVmyJhM/PNtX7mV3xKCZsuPtnLdFgCurd1P
 vTgzOYhkYjCFYbgEl+yZV2XY2DQTtFtGvIinTW/PYFQvnzQ0IHvsHod8V
 +s24bDDGFXwz4+gjuMzUeSFa/mkW/49kmQ7r/c+KpnJfJq6Lg/RvmGomT
 uoFLMxzgOY50x54PM1YStFV2dDv5Ap+KdMjvtc13zOn+hzFIRpbQWZPjg
 0Hb6HZO/2mBPiJEsYhv09XlGWtlSIw0XpeW8imYXB+py/6GgbJrdiABXp
 LUOwrbD4yk9ebNDR0NtMfcsTj1vlMKDSAIaTNAhPCKLdrQ0VLDPpyzESc Q==;
X-CSE-ConnectionGUID: w71kwfxdThS/qv1pOE1QFA==
X-CSE-MsgGUID: Bvn1phonSaClXrCYLdhJKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62460655"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62460655"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:45:37 -0700
X-CSE-ConnectionGUID: v29AEJMNQg+/uQ15dEs7cg==
X-CSE-MsgGUID: 5jYqv8KbScmsHWb2A15KHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="185181439"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa004.jf.intel.com with ESMTP; 10 Oct 2025 01:45:32 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH RFC v2 0/2] Async Flip in Atomic ioctl corrections
Date: Fri, 10 Oct 2025 14:15:57 +0530
Message-Id: <20251010-async-v2-0-50c6b7a9b654@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXH6GgC/x2MQQrCMBAAv1L27EoSN9Z4EgQf4FU8pNuNBmwqS
 RGl9O+GHmcYZoYiOUqBYzNDlk8scUwVzKYBfvr0EIx9ZTDKWK20Ql9+iTFIp5zThkh1UNt3lhC
 /6+cG18sZ7lWGPA44PbP4ddF6S4a8RX/YERIzo1MkKGydtDrYXvanmCZ5bXkcYFn+Gmig5p0AA
 AA=
X-Change-ID: 20251010-async-feb09912440b
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 jani.nikula@intel.com, ville.syrjala@intel.com, uma.shankar@intel.com, 
 xaver.hugl@kde.org, andrealmeid@igalia.com, naveen1.kumar@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
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

Thanks and Regards,
Arun R Murthy
-------------

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (2):
      drm/atomic/plane: Add plane property for async flip
      drm/atomic: Use async_flip plane property for asynchronous flips

 drivers/gpu/drm/drm_atomic_uapi.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/drm_plane.c       | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_plane.h           | 12 ++++++++++++
 3 files changed, 65 insertions(+)
---
base-commit: ac65b2261663d50cc761c94a40b6093ee714e62f
change-id: 20251010-async-feb09912440b

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

