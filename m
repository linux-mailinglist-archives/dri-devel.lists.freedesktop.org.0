Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28711B58EEB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A9F10E6A4;
	Tue, 16 Sep 2025 07:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oG7zBHlH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C69E10E0B1;
 Tue, 16 Sep 2025 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758007084; x=1789543084;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=kYp+urjgpg/HbHC1IGcVCnwd37YvCI7aiYExxikb6zY=;
 b=oG7zBHlHT6hRnUF/XQzL0lP8T3TqJIxbz2FU1x3Y4k63EMDypKAZAsCg
 8ekc/N0bhJhePFtXk3HiTmBPCDYmRnPgzjM5q4k8n4VsEjLKLtMVjERYv
 yBnWC4NeDzvd4myvGLRPZb1aPFWpIICmb/WJrOaAgQ4IaQLmnqjtzaqEJ
 HQckIR2nMbQy8A61WdOeS39XK9zLKJc4n1gireKH5AoRKEh+5vBiox39d
 2CvNqzUOmT5v8j0KS4nNbSJHiIUPG/BjgzqBn4+aNiRT8WKfHavEdm5Uw
 HXy6e+NdJ+6fAmSycn7dbhX++DpNFwIWer0d2ogg/S0t0pvUJCZXbgJAi A==;
X-CSE-ConnectionGUID: rZPZskIHRamFy/jRHkuJVQ==
X-CSE-MsgGUID: gFaGHP3hQmuIZ4wY2ru9VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70526934"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="70526934"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 00:18:01 -0700
X-CSE-ConnectionGUID: xb8A69ynTcix9/J2s+36/w==
X-CSE-MsgGUID: Aa11EgtSRcy9AYPT0B4P4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="175650738"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 00:17:56 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v5 0/5] User readable error codes on atomic_ioctl failure
Date: Tue, 16 Sep 2025 12:48:10 +0530
Message-Id: <20250916-atomic-v5-0-821525cfbf25@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADMPyWgC/0XMQQrDIBCF4auEWXdK1BibrnqP0oXo2AzUGFRCI
 eTulULp8oP3vx0KZaYC126HTBsXTkuDPnXgZrs8Cdk3g+yl7o28oK0pskM3GaGCV9rQAG28Zgr
 8/h7dH80hp4h1zmT/+SjNL98EChzt5KwQXnk93Hip9Dq7FOE4PvFwKJmWAAAA
X-Change-ID: 20250728-atomic-c9713fd357e4
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (5):
      drm: Define user readable error codes for atomic ioctl
      drm/atomic: Add error_code element in atomic_state
      drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
      drm/atomic: Return user readable error in atomic_ioctl
      drm/i915/display: Error codes for async flip failures

 drivers/gpu/drm/drm_atomic.c                 | 34 +++++++++-
 drivers/gpu/drm/drm_atomic_uapi.c            | 92 +++++++++++++++++++---------
 drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
 include/drm/drm_atomic.h                     | 10 +++
 include/uapi/drm/drm_mode.h                  | 41 +++++++++++++
 5 files changed, 160 insertions(+), 42 deletions(-)
---
base-commit: 21147fac313e561dcce8e18363c8de995f3ad4cd
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

