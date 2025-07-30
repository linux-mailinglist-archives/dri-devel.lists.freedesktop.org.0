Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F094B15E48
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 12:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D403D10E1B4;
	Wed, 30 Jul 2025 10:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUQppzRM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F48010E1B4;
 Wed, 30 Jul 2025 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753871764; x=1785407764;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=TirsyHsn1M4DwL1ppWirMXT2wpwsxb283vMwhZ1ptVo=;
 b=YUQppzRMKwho9w8p3mDI7n+kKRS0RW2jzcxMBcXO35iHV32lnC5bh3xq
 dGZAavPSUICLhCmdqhNctLUN0AR26SCVShL45vsycpuCS/ou1KSoniFlH
 9AqFjIwm6zCuLB0/0QvPbz7MVA3x0oosde8fQOCY8eP32PZyot2OHaQDP
 fN0DFU7vpLuvKU0Wzy0kQBMEj0r901w85MdYg/dd+nyW2Qt4sKqqdkch8
 fHCHLKkOTcwlykqxfgLt8Ue09ZPXup7mCbnG60qiGJpMytsE7Hyn0TloP
 7cjGdTe2g6zazk0Dz4OrpD+M0mKeJSC8r6staXIyUoIP+xoINaTk1kWDY Q==;
X-CSE-ConnectionGUID: dqggZ/dDTmOn8jAuVGaBFw==
X-CSE-MsgGUID: 5dhFSek5QBiSnyCH61DPnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81617759"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="81617759"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:36:03 -0700
X-CSE-ConnectionGUID: AMwcDsJfSZWeWG+jVHOMlA==
X-CSE-MsgGUID: c62A1z4qQVeNjCXRx3pBTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162222495"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 30 Jul 2025 03:36:00 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v2 0/4] User readable error codes on atomic_ioctl failure
Date: Wed, 30 Jul 2025 15:46:35 +0530
Message-Id: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPxiWgC/0XMQQrDIBCF4auEWXdK1BibrnqP0oXo2AzUGFRCI
 eTulULp8oP3vx0KZaYC126HTBsXTkuDPHXgZrs8Cdk3g+yl7o28oK0pskM3GaGCV9rQAG28Zgr
 8/h7dH80hp4h1zmT/+SjNL98EChzt5KwQXnk93Hip9Dq7FOE4PjEAw/SWAAAA
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (4):
      drm: Define user readable error codes for atomic ioctl
      drm/atomic: Add error_code element in atomic_state
      drm/atomic: Return user readable error in atomic_ioctl
      drm/i915/display: Error codes for async flip failures

 drivers/gpu/drm/drm_atomic.c                 |  5 ++++
 drivers/gpu/drm/drm_atomic_uapi.c            | 20 ++++++++++----
 drivers/gpu/drm/i915/display/intel_display.c |  4 +++
 include/drm/drm_atomic.h                     |  7 +++++
 include/uapi/drm/drm_mode.h                  | 40 ++++++++++++++++++++++++++++
 5 files changed, 71 insertions(+), 5 deletions(-)
---
base-commit: 52ac98096df0784abd379f822ad14d6998b09154
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

