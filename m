Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD5FB30FB7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8F310EA74;
	Fri, 22 Aug 2025 07:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+V+2Rut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AC310EA76;
 Fri, 22 Aug 2025 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755846005; x=1787382005;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=a2XsBFZzATOVU1iT6/c3e8oxNqM8Vq5p/eStxOWwjGs=;
 b=g+V+2RutQd07RNGz1oqpS1r9IWg9aGPYNkBzy9WFyUuCRlCRX3K6B1cR
 gXturSyk2Ocn07deKT7lAyveSvwNHlQQDKTCpzs6KweaZhScg+vYVqz0g
 dIL9QeyxqQ8A4JScF4GYGNXRk4qRlhsFvOfKepw7/iHTCQuxFbQ8x3dTA
 75DAa2+KjLcl3j7E7j4UsSH2B6bUHEptO1sauzghXRYPaMfWWl3bO9fuM
 rVUL/LJaZifdPaxP/WJRjBkoeh2OsS95zhInA3XocOCyVIFUQ/70ZIURI
 qt29Dx2Xuu7BzW1ckZnM68D4vL7KXxv7XrjHo0e0ztdtXQBQhRrr/e0+F Q==;
X-CSE-ConnectionGUID: oHvyh4iPRBq6ToVqvTzGKw==
X-CSE-MsgGUID: VxDBadgtS56miQKbLdKbuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68751556"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68751556"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:00:04 -0700
X-CSE-ConnectionGUID: Gg3b1bBYTb61O+5whVNLnQ==
X-CSE-MsgGUID: W13KCpqLTAOA1S7Av8nJ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="192301084"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2025 23:59:55 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 22 Aug 2025 12:30:02 +0530
Subject: [PATCH v3 2/4] drm/atomic: Add error_code element in atomic_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-atomic-v3-2-13a0e8f2c581@intel.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
In-Reply-To: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
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
index 38636a593c9d98cadda85ccd67326cb152f0dd27..d380001b24b4223baa54dae6c3c43e19dfb1958d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -524,6 +524,13 @@ struct drm_atomic_state {
 	 * commit without blocking.
 	 */
 	struct work_struct commit_work;
+
+	/* @error_code
+	 *
+	 * struct to convey user readable error to the user.
+	 * Error codes defined in enum drm_mode_atomic_failure_flags
+	 */
+	struct drm_mode_atomic_err_code *error_code;
 };
 
 void __drm_crtc_commit_free(struct kref *kref);

-- 
2.25.1

