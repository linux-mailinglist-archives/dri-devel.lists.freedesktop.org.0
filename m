Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F954B30FB1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 08:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D29510E070;
	Fri, 22 Aug 2025 06:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1e+kh1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B4910E06D;
 Fri, 22 Aug 2025 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755845992; x=1787381992;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=Kx7iXLw1E6P+5gYeIoPaKWc0B9IRL+fLV/WtVPDfx0o=;
 b=W1e+kh1TV0JfKzQqLQ1ab1ZTmtta9LWcvuiapmkfcLBApSwS4MivkYsj
 ddnM7emyV6+XM5g1PWWf9/VRJ2nxWwUnke7rEPCFCRHtO0JTk3Gs4za7g
 y20+vJPrJ5hBuDgcJxJwj1Zm6Ge9l8IZnXswsb1IUeLlM+GOezD23Q20p
 xV74ntJrcEt0hml4NOmBrvzKLwv+WH4m+c2fWoth4zNcKB7cZehUgNbCS
 M+brLUiSu4i6nExexLrD1Kf/okgkski5VKW/LZvLE/hxj6iE12YZRz0WM
 d0y1eQqyMQ9KS1VHjBoGbbIbNm4o9+vOWrAM7C70q8y7ExUBhX05jhVRG Q==;
X-CSE-ConnectionGUID: pu+CwP6mSoSctQGC2n29uw==
X-CSE-MsgGUID: chmbVCp1QhiyDOKOAYp3NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68751471"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68751471"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 23:59:52 -0700
X-CSE-ConnectionGUID: THeEOonaS5aMp91WULZ9bQ==
X-CSE-MsgGUID: pSguEmHeTG6gE0Cy+yye9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192300996"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 23:59:48 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v3 0/4] User readable error codes on atomic_ioctl failure
Date: Fri, 22 Aug 2025 12:30:00 +0530
Message-Id: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHAVqGgC/0XMQQrDIBCF4auEWXdK1BibrnqP0oXo2AzUGFRCI
 eTulULp8oP3vx0KZaYC126HTBsXTkuDOnXgZrs8Cdk3g+yl7o28oK0pskM3GaGCV9rQAG28Zgr
 8/h7dH80hp4h1zmT/+SjNL98EChzt5KwQXnk93Hip9Dq7FOE4PmoRnaWWAAAA
X-Change-ID: 20250728-atomic-c9713fd357e4
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, naveen1.kumar@intel.com, 
 xaver.hugl@kde.org, uma.shankar@intel.com, harry.wentland@amd.com, 
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
Arun R Murthy (4):
      drm: Define user readable error codes for atomic ioctl
      drm/atomic: Add error_code element in atomic_state
      drm/atomic: Return user readable error in atomic_ioctl
      drm/i915/display: Error codes for async flip failures

 drivers/gpu/drm/drm_atomic.c                 |  6 +++
 drivers/gpu/drm/drm_atomic_uapi.c            | 60 +++++++++++++++++++++++-----
 drivers/gpu/drm/i915/display/intel_display.c |  4 ++
 include/drm/drm_atomic.h                     |  7 ++++
 include/uapi/drm/drm_mode.h                  | 42 +++++++++++++++++++
 5 files changed, 109 insertions(+), 10 deletions(-)
---
base-commit: cca87ca63e2f5b8a785dc59c23e526987530b27f
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

