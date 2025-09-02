Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DA8B3F6E7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958B310E1A9;
	Tue,  2 Sep 2025 07:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3cPWlWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9176F10E1A9;
 Tue,  2 Sep 2025 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756799258; x=1788335258;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=gSKsosUrW02BH8xY23LN73OUcxnplqHaVzeY3wfMYTA=;
 b=H3cPWlWHEMmjTzEigCzC+2p2TzsS/gwcDKoKoAQx5CBv6k4iuN487aOC
 qGCAjBq+m0XzgH+RPABKGC+AQfNxST3frEdzymOXPcz1fU+fIMbWgvMKC
 NhFGPzuZk4AoZNEa36XVwZzYYe+26ZZYJHart4FR93P1MltZgSZ0Ri5oi
 M9QMX0y1uGH7FS1vKDWemUGTJWZcOQY9Q8i6HqaVFqnjTAAVcSQ2UVUNM
 BWmsW1G9/EPsP1L2zj7w/YF1gPOhRiBMDcPhc1FsLxUPuiWi9PnW3o9g7
 oenU3TT4r2NLD7OCrg6uvphMGsYv/iNGynKTRIDJ3vbJDIM4VEYdS51WB g==;
X-CSE-ConnectionGUID: npyrAKduQme0Qcx4BM+tSg==
X-CSE-MsgGUID: I4ryqO6GSUut2XmQAPnrzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81641690"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81641690"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 00:47:38 -0700
X-CSE-ConnectionGUID: QkXMNouWRhinS/jxFV9FVA==
X-CSE-MsgGUID: Ifqly+Z9TEGNjZ65z8eCqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="194850741"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2025 00:47:33 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v4 0/4] User readable error codes on atomic_ioctl failure
Date: Tue, 02 Sep 2025 13:17:51 +0530
Message-Id: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACehtmgC/0XMSwrCMBSF4a2UOzbSvBrryH2Ig5Dc2AsmKUkoQ
 uneDYI4/OD8Z4eKhbDCddih4EaVcupQpwHcYtMTGfluEKPQoxEXZluO5JibDZfBS21QQR+vBQO
 9v0f3R3coObK2FLT/fBLml2+ccTbZ2VnOvfRa3Sg1fJ1djnAcH6phdsiWAAAA
X-Change-ID: 20250728-atomic-c9713fd357e4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com
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

The series focuses on providing a user readable error value on a failure
in drm_atomic_ioctl(). Usually -EINVAL is returned in most of the error
cases and it is difficult for the user to decode the error and get to
know the real cause for the error. If user gets to know the reason for
the error then corrective measurements can be taken up.

TODO: driver specific error codes are to be added and will be done in
the follow-up patches.

The IGT related changes are pushed for review @
https://patchwork.freedesktop.org/series/153330/

v4: Removed XMacros and added enum for failure codes
    Failure strings added in respective failure place

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (4):
      drm: Define user readable error codes for atomic ioctl
      drm/atomic: Add error_code element in atomic_state
      drm/atomic: Return user readable error in atomic_ioctl
      drm/i915/display: Error codes for async flip failures

 drivers/gpu/drm/drm_atomic.c                 | 23 +++++---
 drivers/gpu/drm/drm_atomic_uapi.c            | 83 ++++++++++++++++++++++------
 drivers/gpu/drm/i915/display/intel_display.c | 31 ++++++++---
 include/drm/drm_atomic.h                     | 26 +++++++++
 include/uapi/drm/drm_mode.h                  | 41 ++++++++++++++
 5 files changed, 171 insertions(+), 33 deletions(-)
---
base-commit: 21147fac313e561dcce8e18363c8de995f3ad4cd
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

