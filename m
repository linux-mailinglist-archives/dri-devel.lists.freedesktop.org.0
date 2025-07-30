Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101C6B15E4C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 12:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0DE10E445;
	Wed, 30 Jul 2025 10:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSoBpX3g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B5510E445;
 Wed, 30 Jul 2025 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753871771; x=1785407771;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=gp7XNjM6BuNE5lIPgAozHLwfu3aSScuF9K2IJ0aVP3w=;
 b=TSoBpX3guZPjFoQB51MuWqJ8oTGG33JFkZO/6dI4hGzCp17hgCTP6MvH
 pc/mF+AUfMLHRAED1xSmIrFWNeKbfB9NTTTRLsSDV86yyWkVLKWCDOdrF
 tA/2Xmi0Qy3zrfKhcwEkGjLlX5WWWUHEFq450Qwcr06VQcAhOvR7ggo3l
 07R7g77UX87RX1oe9B7dOFEoyk2sWJ7oJdyhfbh8tJ2D/5Gu7qeWLhQR6
 OCptw6bQ6FmHu3gCBVG8dpQIha2/5ZzqWxS4+LG3wMKyKjukOtQnPt9BR
 nKyb0PDGlsppEUyvVnz8LWlw+fK9kvifwK+aFCEy3iZ3OuRMLOTEs55Qv w==;
X-CSE-ConnectionGUID: hMh2PkJvRc2I/j7BZ7jX4g==
X-CSE-MsgGUID: QxLl3hWoSsmkVXylS0BY2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="81617773"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="81617773"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 03:36:11 -0700
X-CSE-ConnectionGUID: 0K/jKWqQQzmWd20hHXWX0g==
X-CSE-MsgGUID: en6aFKyzQC20A/1qJQUnmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162222510"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa006.jf.intel.com with ESMTP; 30 Jul 2025 03:36:08 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 30 Jul 2025 15:46:37 +0530
Subject: [PATCH v2 2/4] drm/atomic: Add error_code element in atomic_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-atomic-v2-2-cc02ce0263dd@intel.com>
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
In-Reply-To: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
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

Now that a proper error code will be returned to the user on any failure
in atomic_ioctl() via struct drm_mode_atomic, add a new element
error_code in the struct drm_atomic_state so as to hold the error code
during the atomic_check() and atomic_commit() phases.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm/drm_atomic.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d98cadda85ccd67326cb152f0dd27..55799d848408e23ae5ece2dd694d119489a87ede 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -524,6 +524,13 @@ struct drm_atomic_state {
 	 * commit without blocking.
 	 */
 	struct work_struct commit_work;
+
+	/* @error_code
+	 *
+	 * flag to convey user readable error to the user.
+	 * Error codes defined in DRM_MODE_ATOMIC_ERR_FLAGS
+	 */
+	u64 error_code;
 };
 
 void __drm_crtc_commit_free(struct kref *kref);

-- 
2.25.1

