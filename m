Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE1BC851F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 11:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352F10E99D;
	Thu,  9 Oct 2025 09:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjJvVj69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0238E10E99B;
 Thu,  9 Oct 2025 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760002350; x=1791538350;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=EYfwn1pUYxghZzghPOJFciEij0VOCsYVD2XFAjkvycg=;
 b=mjJvVj69wz3pND8DCXHGkSKnncZ5NCJIS8halRVrX2p3NK4aIZFpbHEZ
 b8DRwF7Upyt5PMFZCOLcQgGud6xFWEgtKY16swU0qeCDUy/JGBX+sIVZ5
 X4baDPVq62uK5+i2ORnCdCeMeA95a2xzWK3i5DuKVWcoa9rF0zQ9Ubu5j
 sjqOCU/gShIJHJTsKja/gmZfqGwMpWG7kEI/Wc/GWO2a3cQ3vpx1e8pPX
 oAItIiKm3jFBoBHK6UHq6/OgmuZTLwnNoPz8umX2O4mZ7QssSgIx8BA6o
 CxyePThnaF5X3l9vJlPIgi74FYaySOq+bxg+52u1+UaJke3X9iJdFkOcO g==;
X-CSE-ConnectionGUID: P0uaFRrRTh670G804StDbw==
X-CSE-MsgGUID: x4Fox85lTfy2mcZZeMpgzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="66060800"
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="66060800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 02:32:29 -0700
X-CSE-ConnectionGUID: 0yG+u7quTDeOcunO8TcQgQ==
X-CSE-MsgGUID: CeocDiQSRn+jP0GVlNltYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; d="scan'208";a="185789524"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 02:32:24 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v6 0/5] User readable error codes on atomic_ioctl failure
Date: Thu, 09 Oct 2025 15:02:48 +0530
Message-Id: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAECB52gC/0XMQQrDIBCF4auEWdcSNWrTVe9RuhAdm4GqQSUUQ
 u5eKZQuP3j/26FiIaxwHXYouFGlnDr0aQC32PRERr4bxCjUaMSF2ZYjOeZmw2XwUhmcoI/XgoH
 e36P7ozuUHFlbCtp/roX55RtnnGk7O8u5l15NN0oNX2eXIxzHBxxDymqWAAAA
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (5):
      drm: Define user readable error codes for atomic ioctl
      drm/atomic: Add error_code element in atomic_state
      drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
      drm/atomic: Return user readable error in atomic_ioctl
      drm/i915/display: Error codes for async flip failures

 drivers/gpu/drm/drm_atomic.c                 | 31 ++++++++++
 drivers/gpu/drm/drm_atomic_uapi.c            | 92 +++++++++++++++++++---------
 drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
 include/drm/drm_atomic.h                     | 10 +++
 include/uapi/drm/drm_mode.h                  | 41 +++++++++++++
 5 files changed, 159 insertions(+), 40 deletions(-)
---
base-commit: a7101e35f29e03562f24ce1220f08350260fc0fc
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

