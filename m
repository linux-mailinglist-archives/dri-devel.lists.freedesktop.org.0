Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150ACF6AD3
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 05:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148F210E464;
	Tue,  6 Jan 2026 04:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4OLwGi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394AC10E22D;
 Tue,  6 Jan 2026 04:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767674394; x=1799210394;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=e+fbBZmtaFHtPO/gU+BQsr4nGkQDmueFe/U3NUq2b6o=;
 b=i4OLwGi1LEhP0qcEXl7MrrjEQFdMFtSwleKFT/EeQo2TFgdXTd8bPHVD
 TQasf7XEbQ+Llmbaaeh94O/g8NDGr4VwhqKBDSUUXuYBGcISoLQMvIksJ
 pMTEI/F8m0s1z1zSfD3AY52PnswMtPofcfE/wOvrP67uTe1BiZFYe9uKL
 GuKeTI/54kUUF+15chebF+5J7+g0DoH86bDaKHeIoX4YsC/jhk/dw6ZHb
 NF5F7dfq32YqlddT9fwe2FY/QAW7aN2HN7aFnM128mERiCSO7vh5tbtLS
 yoB45WMTnNTdMXrwxqkxp8XXgxaVYJ2tLv73tlrkKqS/3osV3SCuRrQ5W Q==;
X-CSE-ConnectionGUID: pd9/nxsnTm+8s1Vl+oJltA==
X-CSE-MsgGUID: ahT8++qrT+ORxCxllN/z+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86459275"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="86459275"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:39:53 -0800
X-CSE-ConnectionGUID: iqiSgNsaSk23vIlhSGnG5w==
X-CSE-MsgGUID: s9QPBRlKQQmu90p/iZaR9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207034301"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 05 Jan 2026 20:39:48 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v7 0/5] User readable error codes on atomic_ioctl failure
Date: Tue, 06 Jan 2026 10:07:55 +0530
Message-Id: <20260106-atomic-v7-0-d51d9a351684@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKSRXGkC/0XMQQrDIBCF4auEWXdK1BibrnqP0oXo2AzUGFRCI
 eTulULp8oP3vx0KZaYC126HTBsXTkuDOXXgZrs8Cdk3g+yl7o28oK0pskM3GaGCV9rQAG28Zgr
 8/h7dH80hp4h1zmT/+SjNL98EChzt5KwQXnk93Hip9Dq7FOE4PkdSlDuWAAAA
X-Change-ID: 20250728-atomic-c9713fd357e4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com
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

    To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    To: suraj.kandpal@intel.com>
    To: Maxime Ripard <mripard@kernel.org>
    To: Thomas Zimmermann <tzimmermann@suse.de>
    To: David Airlie <airlied@gmail.com>
    To: Simona Vetter <simona@ffwll.ch>
    To: Jani Nikula <jani.nikula@linux.intel.com>
    To: Rodrigo Vivi <rodrigo.vivi@intel.com>
    To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    To: Tvrtko Ursulin <tursulin@ursulin.net>
    To: xaver.hugl@kde.org
    To: harry.wentland@amd.com
    To: uma.shankar@intel.com
    To: louis.chauvet@bootlin.com
    Cc: dri-devel@lists.freedesktop.org
    Cc: intel-gfx@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (5):
      drm: Define user readable error codes for atomic ioctl
      drm/atomic: Add error_code element in atomic_state
      drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
      drm/atomic: Return user readable error in atomic_ioctl
      drm/i915/display: Error codes for async flip failures

 drivers/gpu/drm/drm_atomic.c                 | 31 ++++++++++
 drivers/gpu/drm/drm_atomic_uapi.c            | 91 +++++++++++++++++++---------
 drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
 include/drm/drm_atomic.h                     | 10 +++
 include/uapi/drm/drm_mode.h                  | 41 +++++++++++++
 5 files changed, 159 insertions(+), 39 deletions(-)
---
base-commit: 5fc5192372599f11da8dee072fd8beb4414f8eca
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

